Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1AFD5525A
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731214AbfFYOpW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:45:22 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44659 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731091AbfFYOpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:45:19 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmh4hQwJSSfvXfmhBhHp0S; Tue, 25 Jun 2019 16:45:17 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 10/13] meson/ao-cec: use cec_notifier_cec_adap_(un)register
Date:   Tue, 25 Jun 2019 16:45:07 +0200
Message-Id: <20190625144510.122214-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIo22fLBIrqLMrXisr54Oz7ccU5U7XrkX5DqS6e4gjZCJDJZRwR7HVkEE6n7qWgdpxc4gdVprEUsxmIO7u7A4kSJm1ZMYKCM9GPw4XNwYWyQ+Yy206sO
 8UOAgAhk2FID2WCfrssWt2OuksRbq/48El4w9eIkWbzZOD5di6vBRkkL0fJAaPA6KJGO0jDFY6McPqSDGQ1vgv3TBj1bvljUvLVCq3SBaXB4pIfT7mBmBEFn
 EJsZDAkB/wkU88ekHbdFfvLcrLiVt/xlTF/6Svej/c7UAtEOmfOW9g91mLRz6JgxP90TrHaHLf/mh3cXLf/04ILJvo/77mQOiwliRa/+EKmLkuo258l2WAuP
 cQRujG7QhQEvHiym9xGYBJXIZfyp27/4N/GZpDbUdehbVYPqSmOkJB8xCaw8oEBetoqYoi0p
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_cec_adap_(un)register() functions to
(un)register the notifier for the CEC adapter.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/meson/ao-cec.c | 37 +++++++++++++--------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform/meson/ao-cec.c
index facf9b029e79..b80eb8f9b422 100644
--- a/drivers/media/platform/meson/ao-cec.c
+++ b/drivers/media/platform/meson/ao-cec.c
@@ -616,20 +616,22 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 
 	spin_lock_init(&ao_cec->cec_reg_lock);
 
-	ao_cec->notify = cec_notifier_get(hdmi_dev);
-	if (!ao_cec->notify)
-		return -ENOMEM;
-
 	ao_cec->adap = cec_allocate_adapter(&meson_ao_cec_ops, ao_cec,
 					    "meson_ao_cec",
 					    CEC_CAP_LOG_ADDRS |
 					    CEC_CAP_TRANSMIT |
 					    CEC_CAP_RC |
-					    CEC_CAP_PASSTHROUGH,
+					    CEC_CAP_PASSTHROUGH |
+					    CEC_CAP_CONNECTOR_INFO,
 					    1); /* Use 1 for now */
-	if (IS_ERR(ao_cec->adap)) {
-		ret = PTR_ERR(ao_cec->adap);
-		goto out_probe_notify;
+	if (IS_ERR(ao_cec->adap))
+		return PTR_ERR(ao_cec->adap);
+
+	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+							ao_cec->adap);
+	if (!ao_cec->notify) {
+		ret = -ENOMEM;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->adap->owner = THIS_MODULE;
@@ -638,7 +640,7 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	ao_cec->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(ao_cec->base)) {
 		ret = PTR_ERR(ao_cec->base);
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -648,20 +650,20 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 					0, NULL, ao_cec);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ao_cec->core = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(ao_cec->core)) {
 		dev_err(&pdev->dev, "core clock request failed\n");
 		ret = PTR_ERR(ao_cec->core);
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ret = clk_prepare_enable(ao_cec->core);
 	if (ret) {
 		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_probe_adapter;
+		goto out_probe_notify;
 	}
 
 	ret = clk_set_rate(ao_cec->core, CEC_CLK_RATE);
@@ -685,19 +687,17 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	writel_relaxed(CEC_GEN_CNTL_RESET,
 		       ao_cec->base + CEC_GEN_CNTL_REG);
 
-	cec_register_cec_notifier(ao_cec->adap, ao_cec->notify);
-
 	return 0;
 
 out_probe_clk:
 	clk_disable_unprepare(ao_cec->core);
 
+out_probe_notify:
+	cec_notifier_cec_adap_unregister(ao_cec->notify);
+
 out_probe_adapter:
 	cec_delete_adapter(ao_cec->adap);
 
-out_probe_notify:
-	cec_notifier_put(ao_cec->notify);
-
 	dev_err(&pdev->dev, "CEC controller registration failed\n");
 
 	return ret;
@@ -709,10 +709,9 @@ static int meson_ao_cec_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ao_cec->core);
 
+	cec_notifier_cec_adap_unregister(ao_cec->notify);
 	cec_unregister_adapter(ao_cec->adap);
 
-	cec_notifier_put(ao_cec->notify);
-
 	return 0;
 }
 
-- 
2.20.1

