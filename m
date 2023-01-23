Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA75C677BD4
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjAWMyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjAWMyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925D49038
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478410;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B5xNNYjq5uO0XisuMXFOqJmYh3T1K5Y7s3LAaXJMBtI=;
        b=dYqBAw6jSCdzPZnO5tsrCyd3aFAzD3nDInyEyE8jctq7qF3wexQCC5BxN8NgIClV1UWqe3
        POyPTvgWQN/yhTCJYH6frK8b2GYOIY4LnQL9o40dCS4an6QsCedC/v2xUbgcoDymFC7mTI
        z9tEMr/kCCs+Xy0ANNTF5NT8YlqMRqE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-aUfFA0gaNOePMDWBIJJBrQ-1; Mon, 23 Jan 2023 07:53:27 -0500
X-MC-Unique: aUfFA0gaNOePMDWBIJJBrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21EC63814944;
        Mon, 23 Jan 2023 12:53:27 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 89CDAC15BA0;
        Mon, 23 Jan 2023 12:53:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 27/57] media: atomisp: Remove isp_subdev_link_setup()
Date:   Mon, 23 Jan 2023 13:51:35 +0100
Message-Id: <20230123125205.622152-28-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Looking at isp_subdev_link_setup(), this function can never work,
it does a switch-case like this:

 switch (local->index | is_media_entity_v4l2_subdev(remote->entity))

with cases like this:

 case ATOMISP_SUBDEV_PAD_SINK | MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN

where ATOMISP_SUBDEV_PAD_SINK matches an index (0-4) and
MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN is 0x00020000, but
is_media_entity_v4l2_subdev(remote->entity) does not return
MEDIA_ENT_F_* values, it return a bool, so 0 or 1 which means
that non of the cases can ever match the input value.

Looking at the rest of the function all it ever does (if it
would actually hit one of the cases) is set the atomisp_sub_device
struct's input member.

And checking the rest of the atomisp code that member is never
read. Also userspace does not actually setup media-controller
links when using the atomisp /dev/video$ nodes since all the links
are fixed. So isp_subdev_link_setup() never runs.

Remove the unnecessary and broken isp_subdev_link_setup() function
and also remove the unused atomisp_sub_device struct's input member.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_subdev.c        | 79 -------------------
 .../media/atomisp/pci/atomisp_subdev.h        | 13 ---
 2 files changed, 92 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index eb8f319fca5c..52d1936b8c87 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -714,85 +714,8 @@ static void isp_subdev_init_params(struct atomisp_sub_device *asd)
 	}
 }
 
-/*
-* isp_subdev_link_setup - Setup isp subdev connections
-* @entity: ispsubdev media entity
-* @local: Pad at the local end of the link
-* @remote: Pad at the remote end of the link
-* @flags: Link flags
-*
-* return -EINVAL or zero on success
-*/
-static int isp_subdev_link_setup(struct media_entity *entity,
-				 const struct media_pad *local,
-				 const struct media_pad *remote, u32 flags)
-{
-	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
-	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
-	struct atomisp_device *isp = isp_sd->isp;
-	unsigned int i;
-
-	switch (local->index | is_media_entity_v4l2_subdev(remote->entity)) {
-	case ATOMISP_SUBDEV_PAD_SINK | MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN:
-		/* Read from the sensor CSI2-ports. */
-		if (!(flags & MEDIA_LNK_FL_ENABLED)) {
-			isp_sd->input = ATOMISP_SUBDEV_INPUT_NONE;
-			break;
-		}
-
-		if (isp_sd->input != ATOMISP_SUBDEV_INPUT_NONE)
-			return -EBUSY;
-
-		for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
-			if (remote->entity != &isp->csi2_port[i].subdev.entity)
-				continue;
-
-			isp_sd->input = ATOMISP_SUBDEV_INPUT_CSI2_PORT1 + i;
-			return 0;
-		}
-
-		return -EINVAL;
-
-	case ATOMISP_SUBDEV_PAD_SINK | MEDIA_ENT_F_OLD_BASE:
-		/* read from memory */
-		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (isp_sd->input >= ATOMISP_SUBDEV_INPUT_CSI2_PORT1 &&
-			    isp_sd->input < (ATOMISP_SUBDEV_INPUT_CSI2_PORT1
-					     + ATOMISP_CAMERA_NR_PORTS))
-				return -EBUSY;
-			isp_sd->input = ATOMISP_SUBDEV_INPUT_MEMORY;
-		} else {
-			if (isp_sd->input == ATOMISP_SUBDEV_INPUT_MEMORY)
-				isp_sd->input = ATOMISP_SUBDEV_INPUT_NONE;
-		}
-		break;
-
-	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW | MEDIA_ENT_F_OLD_BASE:
-		/* always write to memory */
-		break;
-
-	case ATOMISP_SUBDEV_PAD_SOURCE_VF | MEDIA_ENT_F_OLD_BASE:
-		/* always write to memory */
-		break;
-
-	case ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE | MEDIA_ENT_F_OLD_BASE:
-		/* always write to memory */
-		break;
-
-	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO | MEDIA_ENT_F_OLD_BASE:
-		/* always write to memory */
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 /* media operations */
 static const struct media_entity_operations isp_subdev_media_ops = {
-	.link_setup = isp_subdev_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
 	/*	 .set_power = v4l2_subdev_set_power,	*/
 };
@@ -1071,8 +994,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	struct media_entity *me = &sd->entity;
 	int ret;
 
-	asd->input = ATOMISP_SUBDEV_INPUT_NONE;
-
 	v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
 	sprintf(sd->name, "ATOMISP_SUBDEV_%d", asd->index);
 	v4l2_set_subdevdata(sd, asd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index bd2872cbb50c..daa6077a83bd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -30,18 +30,6 @@
 
 /* EXP_ID's ranger is 1 ~ 250 */
 #define ATOMISP_MAX_EXP_ID     (250)
-enum atomisp_subdev_input_entity {
-	ATOMISP_SUBDEV_INPUT_NONE,
-	ATOMISP_SUBDEV_INPUT_MEMORY,
-	ATOMISP_SUBDEV_INPUT_CSI2,
-	/*
-	 * The following enum for CSI2 port must go together in one row.
-	 * Otherwise it breaks the code logic.
-	 */
-	ATOMISP_SUBDEV_INPUT_CSI2_PORT1,
-	ATOMISP_SUBDEV_INPUT_CSI2_PORT2,
-	ATOMISP_SUBDEV_INPUT_CSI2_PORT3,
-};
 
 #define ATOMISP_SUBDEV_PAD_SINK			0
 /* capture output for still frames */
@@ -267,7 +255,6 @@ struct atomisp_sub_device {
 	struct atomisp_pad_format fmt[ATOMISP_SUBDEV_PADS_NUM];
 	u16 capture_pad; /* main capture pad; defines much of isp config */
 
-	enum atomisp_subdev_input_entity input;
 	unsigned int output;
 	struct atomisp_video_pipe video_out_capture; /* capture output */
 	struct atomisp_video_pipe video_out_vf;      /* viewfinder output */
-- 
2.39.0

