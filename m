Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0813737C9
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhEEJnT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232229AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0525613F1;
        Wed,  5 May 2021 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207738;
        bh=k34dpqKksd63uP3WoiZAOKOaT0okl+LOGKtsaw4Wk3E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CSdcfnwMScG5s9vfbU3g9YmCUyWl/x61+5MGF4Mwd2YpY2lCOMAlN9BX8GphMMvbE
         kjkHkpNMUgrHzHUGt4nYBMXbBmvymIui4D6UjTMQ2ZuA2CEGxmrMR8IhXjRtD1cjGB
         wzXybke5PnXZQGfVZXjAYgAm/DIdytox4zwRRfsXgpIecapYIkLZVlDMPP733TDu5e
         Dyz9oHbvPPTgKDzybTYdpHsinm7TEVvRAPqeZO7oBCl/f/eDNDiW7chhaC3erDxKpP
         jzDcEpJU+ha1hjFYBy1nDCIigJsXTAgnm67AxGnM9dIS/j19CrPyMPN3u7N+7EQxtZ
         Up9PD0awFliwg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2q-00AHvx-NG; Wed, 05 May 2021 11:42:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 03/25] media: venus: Rework error fail recover logic
Date:   Wed,  5 May 2021 11:41:53 +0200
Message-Id: <419e346f01af5423485202d624fc144756bd2b11.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Venus code has a sort of watchdog that attempts to recover
from IP errors, implemented as a delayed work job, which
calls venus_sys_error_handler().

Right now, it has several issues:

1. It assumes that PM runtime resume never fails

2. It internally runs two while() loops that also assume that
   PM runtime will never fail to go idle:

	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
		msleep(10);

...

	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
		usleep_range(1000, 1500);

3. It uses an OR to merge all return codes and then report to the user

4. If the hardware never recovers, it keeps running on every 10ms,
   flooding the syslog with 2 messages (so, up to 200 messages
   per second).

Rework the code, in order to prevent that, by:

1. check the return code from PM runtime resume;
2. don't let the while() loops run forever;
3. store the failed event;
4. use warn ratelimited when it fails to recover.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
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

