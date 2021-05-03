Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC76F371313
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 11:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhECJiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 05:38:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:54916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230358AbhECJiE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 05:38:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52B0B611CD;
        Mon,  3 May 2021 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620034631;
        bh=M987MvGM1WxXqWZEfX5EOoKkXuQSVSi+BFpcAGqzjdE=;
        h=From:To:Cc:Subject:Date:From;
        b=oZxvE1H64mH2mK95gnGcBCoOTtuNbB98PM74L49AcjsxiytRfPdDJ9ZG+tOOJgweg
         iDPm/5fXr8yUf/ty5P/XPmGABlqWIcdGmUObktAR0bUCKwdM5ORTnvaLnObMsvOB2A
         y+oAEzL83PcKB5nagxFBQa738OVpZp27X/HI16tHJbzAPxdcaoilk3zvtpfUapyrWn
         xCzAADT4WWjbNAAeb102skAB3OCFtk0S8UeNm4WJ42xSmkBbrr+vN3+lBz03wjBVGa
         6pUybv7oyabnLf5MktSFhmODOwUJu3k9u3o2oIkGm03eYzEjy1nPc6jZc2FEvq6Onc
         K7UffcPEvoYEA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1ldV0m-0093Lg-NW; Mon, 03 May 2021 11:37:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH] media: venus: Rework error fail recover logic
Date:   Mon,  3 May 2021 11:37:05 +0200
Message-Id: <a18137ad51435ff828748e30dcd139e6cacdc120.1620034356.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Venus code has a sort of watchdog that attempts to recover
from IP errors, implemented as a delayed work job, which
calls venus_sys_error_handler().

Right now, it has several issues:

1. It assumes that pm_runtime never fails to resume PM;

2. It internally run two while() loops that also assumes that
   PM runtime will never fail to go idle:

	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
		msleep(10);

...

	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
		usleep_range(1000, 1500);

3. It uses an OR to merge all return codes and then report to the user.

4. If the hardware never recovers, it keeps running on every 10ms,
   flooding the syslog.

Rework the code, in order to prevent that, by:

1. check the return code from PM runtime resume;
2. don't let the while() loops run forever;
3. store the failed event;
4. use warn ratelimited when it fails to recover.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

Hi Stanimir,

While reviewing the occurrences of pm_runtime_get_sync(), I noticed that
the logic under  pm_runtime_get_sync() could fail very badly, keep
running endless loops with the dev->core locked and core->irq disabled
or flooding the syslog with up to 100 messages per second.

This patch should make the code more reliable.


 drivers/media/platform/qcom/venus/core.c | 59 +++++++++++++++++++-----
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 54bac7ec14c5..4d0482743c0a 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -78,22 +78,32 @@ static const struct hfi_core_ops venus_core_ops = {
 	.event_notify = venus_event_notify,
 };
 
+#define RPM_WAIT_FOR_IDLE_MAX_ATTEMPTS 10
+
 static void venus_sys_error_handler(struct work_struct *work)
 {
 	struct venus_core *core =
 			container_of(work, struct venus_core, work.work);
-	int ret = 0;
+	int ret, i, max_attempts = RPM_WAIT_FOR_IDLE_MAX_ATTEMPTS;
+	bool failed = false;
+	const char *err_msg = "";
 
-	pm_runtime_get_sync(core->dev);
+	ret = pm_runtime_get_sync(core->dev);
+	if (ret < 0) {
+		err_msg = "resume runtime PM\n";
+		max_attempts = 0;
+		failed = true;
+	}
 
 	hfi_core_deinit(core, true);
 
-	dev_warn(core->dev, "system error has occurred, starting recovery!\n");
-
 	mutex_lock(&core->lock);
 
-	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
+	for (i = 0; i < max_attempts; i++) {
+		if (!pm_runtime_active(core->dev_dec) && !pm_runtime_active(core->dev_enc))
+			break;
 		msleep(10);
+	}
 
 	venus_shutdown(core);
 
@@ -101,31 +111,56 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	pm_runtime_put_sync(core->dev);
 
-	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
+	for (i = 0; i < max_attempts; i++) {
+		if (!core->pmdomains[0] || !pm_runtime_active(core->pmdomains[0]))
+			break;
 		usleep_range(1000, 1500);
+	}
 
 	hfi_reinit(core);
 
-	pm_runtime_get_sync(core->dev);
+	ret = pm_runtime_get_sync(core->dev);
+	if (ret < 0) {
+		err_msg = "resume runtime PM\n";
+		max_attempts = 0;
+		failed = true;
+	}
 
-	ret |= venus_boot(core);
-	ret |= hfi_core_resume(core, true);
+	ret = venus_boot(core);
+	if (ret && !failed) {
+		err_msg = "boot Venus\n";
+		failed = true;
+	}
+
+	ret = hfi_core_resume(core, true);
+	if (ret && !failed) {
+		err_msg = "resume HFI\n";
+		failed = true;
+	}
 
 	enable_irq(core->irq);
 
 	mutex_unlock(&core->lock);
 
-	ret |= hfi_core_init(core);
+	ret = hfi_core_init(core);
+	if (ret && !failed) {
+		err_msg = "init HFI\n";
+		failed = true;
+	}
 
 	pm_runtime_put_sync(core->dev);
 
-	if (ret) {
+	if (failed) {
 		disable_irq_nosync(core->irq);
-		dev_warn(core->dev, "recovery failed (%d)\n", ret);
+		dev_warn_ratelimited(core->dev,
+				     "System error has occurred, recovery failed to %s\n",
+				     err_msg);
 		schedule_delayed_work(&core->work, msecs_to_jiffies(10));
 		return;
 	}
 
+	dev_warn(core->dev, "system error has occurred (recovered)\n");
+
 	mutex_lock(&core->lock);
 	core->sys_error = false;
 	mutex_unlock(&core->lock);
-- 
2.30.2


