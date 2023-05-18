Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF00F70854D
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjERPtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjERPtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:49:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C413E51
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684424856;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X83KgGZcT792lART6KF/8JJuuBwRSZih54spn3pR8+o=;
        b=FZ3pDdob1ii5bPKIGJNe82qXJd/YqXNkN4InMiZahdx3m32cPG3LfXNnxG++1XzcRGU6Nz
        RpN7S/pkmMcHpZVbfF0Qs0QCC6ptctxLEC9wkZ+aXAQkVGwUuztmiOjlqymG35+sk7WkV/
        lIDqx3gd0FhnaLgu/GaOrvzgKqu5HBE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-VX0c6g4yNWm-hQcEF_-HnA-1; Thu, 18 May 2023 11:37:48 -0400
X-MC-Unique: VX0c6g4yNWm-hQcEF_-HnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EA28282CCB0;
        Thu, 18 May 2023 15:37:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B205563F8F;
        Thu, 18 May 2023 15:37:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 7/9] media: atomisp: Move pad linking to atomisp_register_device_nodes()
Date:   Thu, 18 May 2023 17:37:31 +0200
Message-Id: <20230518153733.195306-8-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-1-hdegoede@redhat.com>
References: <20230518153733.195306-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_register_device_nodes() already iterates over the ports/sensors
in a loop and that loop already does not include the TPG input.

So we can simply setup the CSI2-port <-> ISP and sensor <-> CSI2-port
mediactl-pad links there instead of repeating the loop in
atomisp_create_pads_links(), which atomisp_register_device_nodes()
used to call later on.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_subdev.c        | 35 -------------------
 .../media/atomisp/pci/atomisp_subdev.h        |  1 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 16 ++++++++-
 3 files changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index c2ae77cd77a7..7985a0319a39 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -933,41 +933,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	return asd->ctrl_handler.error;
 }
 
-int atomisp_create_pads_links(struct atomisp_device *isp)
-{
-	int i, ret;
-
-	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
-		ret = media_create_pad_link(&isp->csi2_port[i].subdev.entity,
-					    CSI2_PAD_SOURCE, &isp->asd.subdev.entity,
-					    ATOMISP_SUBDEV_PAD_SINK, 0);
-		if (ret < 0)
-			return ret;
-	}
-
-	for (i = 0; i < isp->input_cnt; i++) {
-		/* Don't create links for the test-pattern-generator */
-		if (isp->inputs[i].type == TEST_PATTERN)
-			continue;
-
-		ret = media_create_pad_link(&isp->inputs[i].camera->entity, 0,
-					    &isp->csi2_port[isp->inputs[i].
-						    port].subdev.entity,
-					    CSI2_PAD_SINK,
-					    MEDIA_LNK_FL_ENABLED |
-					    MEDIA_LNK_FL_IMMUTABLE);
-		if (ret < 0)
-			return ret;
-	}
-
-	ret = media_create_pad_link(&isp->asd.subdev.entity, ATOMISP_SUBDEV_PAD_SOURCE,
-				    &isp->asd.video_out.vdev.entity, 0, 0);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static void atomisp_subdev_cleanup_entities(struct atomisp_sub_device *asd)
 {
 	v4l2_ctrl_handler_free(&asd->ctrl_handler);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index cd82554d5f65..c9f6561dbcb6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -366,6 +366,5 @@ int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
 				   struct v4l2_device *vdev);
 int atomisp_subdev_init(struct atomisp_device *isp);
 void atomisp_subdev_cleanup(struct atomisp_device *isp);
-int atomisp_create_pads_links(struct atomisp_device *isp);
 
 #endif /* __ATOMISP_SUBDEV_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c668375e04ae..ef04effc66bf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -943,6 +943,12 @@ static int atomisp_register_device_nodes(struct atomisp_device *isp)
 	int i, err;
 
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
+		err = media_create_pad_link(&isp->csi2_port[i].subdev.entity,
+					    CSI2_PAD_SOURCE, &isp->asd.subdev.entity,
+					    ATOMISP_SUBDEV_PAD_SINK, 0);
+		if (err)
+			return err;
+
 		if (!isp->sensor_subdevs[i])
 			continue;
 
@@ -960,6 +966,13 @@ static int atomisp_register_device_nodes(struct atomisp_device *isp)
 		if (i == ATOMISP_CAMERA_PORT_PRIMARY)
 			input->motor = isp->motor;
 
+		err = media_create_pad_link(&input->camera->entity, 0,
+					    &isp->csi2_port[i].subdev.entity,
+					    CSI2_PAD_SINK,
+					    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+		if (err)
+			return err;
+
 		isp->input_cnt++;
 	}
 
@@ -983,7 +996,8 @@ static int atomisp_register_device_nodes(struct atomisp_device *isp)
 	if (err)
 		return err;
 
-	err = atomisp_create_pads_links(isp);
+	err = media_create_pad_link(&isp->asd.subdev.entity, ATOMISP_SUBDEV_PAD_SOURCE,
+				    &isp->asd.video_out.vdev.entity, 0, 0);
 	if (err)
 		return err;
 
-- 
2.40.1

