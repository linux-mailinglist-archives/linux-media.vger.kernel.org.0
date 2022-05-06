Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251C251E0E2
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 23:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387998AbiEFVTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 May 2022 17:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348961AbiEFVTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 May 2022 17:19:54 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D601861285
        for <linux-media@vger.kernel.org>; Fri,  6 May 2022 14:16:09 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k2so11496659wrd.5
        for <linux-media@vger.kernel.org>; Fri, 06 May 2022 14:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoVKjGQdYcFoxNNeddcTNM2xyX0/4cv0yhjFR12afsg=;
        b=hNzlxZmWHH8EWZNclFfUQ36xZQUmLpy+xjVDPNPVcVR6bpPADQ4DsVuabSBh5bPzcf
         R/1uvQvIPeXdBeLdKgVXrnwbH2lrfqGdxGSmtkXtwYc+jonxasOlLF4w66HTDJjqGxzX
         wewT2kc5IxVJK+a0iP10FvFNDVdDRmEq19567SrwdyssNag1WgfCNOAIQ5j6mQq5RQto
         6Q/njDLWZlSLAuX1TvXj7mJZgmcRFUOd/jrYAGlnbDV9Z3cw6yhtUUYxZvLm8cYMQ0AT
         QQQvvDwC7cWZsIg96INE/kYWKmPKNgeGSV0pALbcSpchaVdVXe7kKlYSpqTa31i+D7S8
         oUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoVKjGQdYcFoxNNeddcTNM2xyX0/4cv0yhjFR12afsg=;
        b=Ru3BSd1pAHgvXbeAzIDG6kqKFZAS2N5tz+bdORisTnDnxp0xa7M0wzQVtfMU0Bii2e
         EUu5ClTfBBY/REweyU9j5JhgHjLbNYWR3TcifcrJ3yj6ubIU67G/BvuBIH9mXB/9Fklj
         ojFmovhdiybLtKTOxIfTwEHls/2jrAwsxXhZ0h4NGrbCyD48Zu2EqtELAAI1QTGypWnq
         xVpaHIJbna9Xfgpb3udISGuaHaoxSuy02c7aG9hAlXgIbDVoPV2dadT+g0cP0xW3neSy
         SdFAoyKMOluCj7WrNka2GoimI6Jt6vSAYZrD5ThpVmKsHv3bYXHOBdYbrESfTPjgvDf0
         4WcQ==
X-Gm-Message-State: AOAM5309WwlKMNeckAuJo4ZTadupXh4IpxQ04yQclfOyg5dWagdIS1d8
        IJhnaxyQ8m2LwtdZLgvabb3umu/f7Uc=
X-Google-Smtp-Source: ABdhPJzNTWr3qlMpbJbVXBPhlFOa2/wtR9MNoF8Qby/OCmkLz9yxUkacGuTv1RlFjtZnJmp/gx7v9g==
X-Received: by 2002:a5d:64ea:0:b0:20c:5ca3:a0de with SMTP id g10-20020a5d64ea000000b0020c5ca3a0demr4331442wri.308.1651871768374;
        Fri, 06 May 2022 14:16:08 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s11-20020adfdb0b000000b0020c5253d91dsm5397175wri.105.2022.05.06.14.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 14:16:07 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com
Subject: [PATCH] media: ipu3-cio2: Move functionality from .complete() to .bound()
Date:   Fri,  6 May 2022 22:15:55 +0100
Message-Id: <20220506211555.1364864-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Creating links and registering subdev nodes during the .complete()
callback has the unfortunate effect of preventing all cameras that
connect to a notifier from working if any one of their drivers fails
to probe. Moving the functionality from .complete() to .bound() allows
those camera sensor drivers that did probe correctly to work regardless.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

This results in v4l2_device_register_subdev_nodes() being called multiple times
but since it's a no-op where the devnode exists already, I think that it's ok.

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 65 +++++++------------
 1 file changed, 23 insertions(+), 42 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 93cc0577b6db..6a1bcb20725d 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1387,7 +1387,10 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
 {
 	struct cio2_device *cio2 = to_cio2_device(notifier);
 	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
+	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_queue *q;
+	unsigned int pad;
+	int ret;
 
 	if (cio2->queue[s_asd->csi2.port].sensor)
 		return -EBUSY;
@@ -1398,7 +1401,26 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
 	q->sensor = sd;
 	q->csi_rx_base = cio2->base + CIO2_REG_PIPE_BASE(q->csi2.port);
 
-	return 0;
+	for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
+		if (q->sensor->entity.pads[pad].flags &
+					MEDIA_PAD_FL_SOURCE)
+			break;
+
+	if (pad == q->sensor->entity.num_pads) {
+		dev_err(dev, "failed to find src pad for %s\n",
+			q->sensor->name);
+		return -ENXIO;
+	}
+
+	ret = media_create_pad_link(&q->sensor->entity, pad, &q->subdev.entity,
+				    CIO2_PAD_SINK, 0);
+	if (ret) {
+		dev_err(dev, "failed to create link for %s\n",
+			q->sensor->name);
+		return ret;
+	}
+
+	return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
 }
 
 /* The .unbind callback */
@@ -1412,50 +1434,9 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
 	cio2->queue[s_asd->csi2.port].sensor = NULL;
 }
 
-/* .complete() is called after all subdevices have been located */
-static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
-{
-	struct cio2_device *cio2 = to_cio2_device(notifier);
-	struct device *dev = &cio2->pci_dev->dev;
-	struct sensor_async_subdev *s_asd;
-	struct v4l2_async_subdev *asd;
-	struct cio2_queue *q;
-	unsigned int pad;
-	int ret;
-
-	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
-		s_asd = to_sensor_asd(asd);
-		q = &cio2->queue[s_asd->csi2.port];
-
-		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
-			if (q->sensor->entity.pads[pad].flags &
-						MEDIA_PAD_FL_SOURCE)
-				break;
-
-		if (pad == q->sensor->entity.num_pads) {
-			dev_err(dev, "failed to find src pad for %s\n",
-				q->sensor->name);
-			return -ENXIO;
-		}
-
-		ret = media_create_pad_link(
-				&q->sensor->entity, pad,
-				&q->subdev.entity, CIO2_PAD_SINK,
-				0);
-		if (ret) {
-			dev_err(dev, "failed to create link for %s\n",
-				q->sensor->name);
-			return ret;
-		}
-	}
-
-	return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
-}
-
 static const struct v4l2_async_notifier_operations cio2_async_ops = {
 	.bound = cio2_notifier_bound,
 	.unbind = cio2_notifier_unbind,
-	.complete = cio2_notifier_complete,
 };
 
 static int cio2_parse_firmware(struct cio2_device *cio2)
-- 
2.25.1

