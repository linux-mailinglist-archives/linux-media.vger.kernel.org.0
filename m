Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DE630A36E
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 09:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhBAIic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 03:38:32 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50827 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232561AbhBAIiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 03:38:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6UiKluH0sefbk6UiNlfig3; Mon, 01 Feb 2021 09:37:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612168663; bh=HnrhM/M0q4KbbuwnRbIMHCdoV63/7oi06EDAbU0dl2c=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IxeswgkS6wfeck+C23uhmgaG4IsnVttNkvVZzPyxL/fxJGOQHkbs8AWAT6wPkyrUT
         HXi2vyZV3iv9hHM2HVqiUBz71D+VNEaL+QJBAPVmmuSRg6t06dIw9t5sRLRExBl8Js
         h3zOsKQdi6l2pKPW8SI5XOReupQ48jPggwtTMNmgmChkzHuiVaNxA2MhjRf28OQnWi
         /tUSZzDZ5O6lAKrbulWa+d82cPTg+gCSPS20Tv3HsjSVeg0c1VGlsBEDpHghv9nKRM
         BFYPU+7p8dWfOKpt1JUx8LEDjwAhnar15c894vyOjhs/32RzfFSTCSeOF3ynqyFbh+
         m6T2MnFIysuOg==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH resend] vidtv: adapter->mdev was set too late
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <4a1c4640-e566-026c-5920-e1da17e73bd8@xs4all.nl>
Date:   Mon, 1 Feb 2021 09:37:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN9ZfD3YP0Sde1Inr7N666XTqVBM7qpe2uY4VqR3fdU9BaB7m5i3+oKISoi77ykTzLiJz5kd7SUsRH2790DKDHjV0JihvPHzzzwBPpxogt6SNOWCl0Y7
 KqoySUvY07JjAm003zsyPi7tN6fyQX49S4QOHJ64XYtuzJkWMeClYIqELv+Gt35yaCEExCNCFfKiywuIMyH0e5V0W+fyGumgtuGaSspa7BhA5gNKOg3UoR5g
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media device has to be initialized and assigned to adapter->mdev
before the dvb devices are created, since that will trigger the
automatic creation of the topology.

Rework this code to achieve this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
(resend again, looks like the previous three attempts never reached the ML)
---
 .../media/test-drivers/vidtv/vidtv_bridge.c    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 6ab17a83bced..75617709c8ce 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -416,6 +416,7 @@ static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
 	ret = vidtv_bridge_register_adap(dvb);
 	if (ret < 0)
 		goto fail_adapter;
+	dvb_register_media_controller(&dvb->adapter, &dvb->mdev);

 	for (i = 0; i < NUM_FE; ++i) {
 		ret = vidtv_bridge_probe_demod(dvb, i);
@@ -495,6 +496,15 @@ static int vidtv_bridge_probe(struct platform_device *pdev)

 	dvb->pdev = pdev;

+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	dvb->mdev.dev = &pdev->dev;
+
+	strscpy(dvb->mdev.model, "vidtv", sizeof(dvb->mdev.model));
+	strscpy(dvb->mdev.bus_info, "platform:vidtv", sizeof(dvb->mdev.bus_info));
+
+	media_device_init(&dvb->mdev);
+#endif
+
 	ret = vidtv_bridge_dvb_init(dvb);
 	if (ret < 0)
 		goto err_dvb;
@@ -504,20 +514,12 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dvb);

 #ifdef CONFIG_MEDIA_CONTROLLER_DVB
-	dvb->mdev.dev = &pdev->dev;
-
-	strscpy(dvb->mdev.model, "vidtv", sizeof(dvb->mdev.model));
-	strscpy(dvb->mdev.bus_info, "platform:vidtv", sizeof(dvb->mdev.bus_info));
-
-	media_device_init(&dvb->mdev);
 	ret = media_device_register(&dvb->mdev);
 	if (ret) {
 		dev_err(dvb->mdev.dev,
 			"media device register failed (err=%d)\n", ret);
 		goto err_media_device_register;
 	}
-
-	dvb_register_media_controller(&dvb->adapter, &dvb->mdev);
 #endif /* CONFIG_MEDIA_CONTROLLER_DVB */

 	dev_info(&pdev->dev, "Successfully initialized vidtv!\n");
-- 
2.29.2

