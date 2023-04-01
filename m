Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C596D31C8
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjDAPB3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjDAPB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F861E700
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361219;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mXSlI2J0Wu8gEb1g90iCOsfdjTIyDYzLT+DsHVPH8aE=;
        b=GwD5p6rbnU5OapZzwv6jYnt/+wI3DT9wsF8OJtTtmZbG4OR9Af5O8NlgTM1pjUp/d3rLW4
        BJfxxUS7Y8xkY/sAmllnp8nFW6Tre3vHjttjMtkE/02G5NhNglPs1SZlIpsaSQ1LsL/mgC
        dSE826ekWctwXQh7iwuUKFGmaQEvQgc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-_-l13NJvPgKgkN3EQLdb-Q-1; Sat, 01 Apr 2023 11:00:14 -0400
X-MC-Unique: _-l13NJvPgKgkN3EQLdb-Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7B72801779;
        Sat,  1 Apr 2023 15:00:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D672400F59;
        Sat,  1 Apr 2023 15:00:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 20/28] media: atomisp: Remove continuous mode related code from atomisp_set_fmt()
Date:   Sat,  1 Apr 2023 16:59:18 +0200
Message-Id: <20230401145926.596216-21-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove code to check / adjust code between video and preview /
capture and view-finder nodes now that we no longer support
continuous mode and this no longer support streaming from 2
/dev/video# nodes at the same time.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 84 +------------------
 1 file changed, 1 insertion(+), 83 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 65d46bae8ee8..9cf5ac55b867 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4633,88 +4633,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	snr_fmt = f->fmt.pix;
 	backup_fmt = snr_fmt;
 
-	/**********************************************************************/
-
-	if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VF ||
-	    (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW
-	     && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)) {
-		if (asd->fmt_auto->val) {
-			struct v4l2_rect *capture_comp;
-			struct v4l2_rect r = {0};
-
-			r.width = f->fmt.pix.width;
-			r.height = f->fmt.pix.height;
-
-			if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW)
-				capture_comp = atomisp_subdev_get_rect(
-						   &asd->subdev, NULL,
-						   V4L2_SUBDEV_FORMAT_ACTIVE,
-						   ATOMISP_SUBDEV_PAD_SOURCE_VIDEO,
-						   V4L2_SEL_TGT_COMPOSE);
-			else
-				capture_comp = atomisp_subdev_get_rect(
-						   &asd->subdev, NULL,
-						   V4L2_SUBDEV_FORMAT_ACTIVE,
-						   ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE,
-						   V4L2_SEL_TGT_COMPOSE);
-
-			if (capture_comp->width < r.width
-			    || capture_comp->height < r.height) {
-				r.width = capture_comp->width;
-				r.height = capture_comp->height;
-			}
-
-			atomisp_subdev_set_selection(
-			    &asd->subdev, fh.state,
-			    V4L2_SUBDEV_FORMAT_ACTIVE, source_pad,
-			    V4L2_SEL_TGT_COMPOSE, 0, &r);
-
-			f->fmt.pix.width = r.width;
-			f->fmt.pix.height = r.height;
-		}
-
-		if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW) {
-			atomisp_css_video_configure_viewfinder(asd,
-							       f->fmt.pix.width, f->fmt.pix.height,
-							       format_bridge->planar ? f->fmt.pix.bytesperline
-							       : f->fmt.pix.bytesperline * 8
-							       / format_bridge->depth,	format_bridge->sh_fmt);
-			atomisp_css_video_get_viewfinder_frame_info(asd,
-				&output_info);
-			asd->copy_mode = false;
-		} else {
-			atomisp_css_capture_configure_viewfinder(asd,
-				f->fmt.pix.width, f->fmt.pix.height,
-				format_bridge->planar ? f->fmt.pix.bytesperline
-				: f->fmt.pix.bytesperline * 8
-				/ format_bridge->depth,	format_bridge->sh_fmt);
-			atomisp_css_capture_get_viewfinder_frame_info(asd,
-				&output_info);
-			asd->copy_mode = false;
-		}
-
-		goto done;
-	}
-	/*
-	 * Check whether main resolution configured smaller
-	 * than snapshot resolution. If so, force main resolution
-	 * to be the same as snapshot resolution
-	 */
-	if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE) {
-		struct v4l2_rect *r;
-
-		r = atomisp_subdev_get_rect(
-			&asd->subdev, NULL,
-			V4L2_SUBDEV_FORMAT_ACTIVE,
-			ATOMISP_SUBDEV_PAD_SOURCE_VF, V4L2_SEL_TGT_COMPOSE);
-
-		if (r->width && r->height
-		    && (r->width > f->fmt.pix.width
-			|| r->height > f->fmt.pix.height))
-			dev_warn(isp->dev,
-				 "Main Resolution config smaller then Vf Resolution. Force to be equal with Vf Resolution.");
-	}
-
 	/* Pipeline configuration done through subdevs. Bail out now. */
 	if (!asd->fmt_auto->val)
 		goto set_fmt_to_isp;
@@ -4885,7 +4803,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		dev_warn(isp->dev, "Can't set format on ISP. Error %d\n", ret);
 		return -EINVAL;
 	}
-done:
+
 	pipe->pix.width = f->fmt.pix.width;
 	pipe->pix.height = f->fmt.pix.height;
 	pipe->pix.pixelformat = f->fmt.pix.pixelformat;
-- 
2.39.1

