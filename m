Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B653F7147FB
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbjE2Kjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbjE2Kjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549D7F1
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8rWVp1feHxInwuJol7c/DWDsmXkxOv8e+PiaF/E9cnc=;
        b=TcnM9tAN/sAIvju3jwU+gwfIxh0LWHzmfiOyqcc/jHGBLvL0zdghpNhvWNIYmsTk5KEpMH
        GR0WRTlmqqu+xPk1VEbwwI8yTTe6xuNspatXhdRMPLDQ+Fm02fgoOwYcdALzFruOE6zKTR
        TrBQXDWQgCvbCae55MSCPlaqyEKz7s0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-EGQ_syP3OiGzrCM1texVBQ-1; Mon, 29 May 2023 06:38:35 -0400
X-MC-Unique: EGQ_syP3OiGzrCM1texVBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB32B2A59569;
        Mon, 29 May 2023 10:38:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4EE122166B2B;
        Mon, 29 May 2023 10:38:16 +0000 (UTC)
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
Subject: [PATCH 08/21] media: atomisp: Remove redundant atomisp_subdev_set_selection() calls from atomisp_set_fmt()
Date:   Mon, 29 May 2023 12:37:28 +0200
Message-Id: <20230529103741.11904-9-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_subdev_set_selection(sink-pad, V4L2_SEL_TGT_CROP, rect)
ignores the passed in rect, using the width and height from the last
atomisp_subdev_set_ffmt(ATOMISP_SUBDEV_PAD_SINK, ffmt) call instead.

The atomisp_subdev_set_ffmt() call done by atomisp_set_fmt_to_snr()
already propagates the sink ffmt changes to V4L2_SEL_TGT_CROP
(this is what allows atomisp_set_fmt() to get the isp_sink_crop in
the first place).

Remove the redundant atomisp_subdev_set_selection(sink-pad, ...)
calls.

Note the removed aspect ratio correction in the last else block is
is already done by atomisp_subdev_set_selection() itself when
setting V4L2_SEL_TGT_COMPOSE on the source-pad.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 33 -------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 748cb78d1ee8..36618d2eba72 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4327,12 +4327,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		isp_sink_crop.width = f->fmt.pix.width;
 		isp_sink_crop.height = f->fmt.pix.height;
 
-		atomisp_subdev_set_selection(&asd->subdev, fh.state,
-					     V4L2_SUBDEV_FORMAT_ACTIVE,
-					     ATOMISP_SUBDEV_PAD_SINK,
-					     V4L2_SEL_TGT_CROP,
-					     V4L2_SEL_FLAG_KEEP_CONFIG,
-					     &isp_sink_crop);
 		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     ATOMISP_SUBDEV_PAD_SOURCE, V4L2_SEL_TGT_COMPOSE,
@@ -4358,38 +4352,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 					     V4L2_SEL_TGT_COMPOSE, 0,
 					     &main_compose);
 	} else {
-		struct v4l2_rect sink_crop = {0};
 		struct v4l2_rect main_compose = {0};
 
 		main_compose.width = f->fmt.pix.width;
 		main_compose.height = f->fmt.pix.height;
 
-		/* WORKAROUND: this override is universally enabled in
-		 * GMIN to work around a CTS failures (GMINL-539)
-		 * which appears to be related by a hardware
-		 * performance limitation.  It's unclear why this
-		 * particular code triggers the issue. */
-		if (isp_sink_crop.width * main_compose.height >
-		    isp_sink_crop.height * main_compose.width) {
-			sink_crop.height = isp_sink_crop.height;
-			sink_crop.width =
-				DIV_NEAREST_STEP(sink_crop.height * f->fmt.pix.width,
-						 f->fmt.pix.height,
-						 ATOM_ISP_STEP_WIDTH);
-		} else {
-			sink_crop.width = isp_sink_crop.width;
-			sink_crop.height =
-				DIV_NEAREST_STEP(sink_crop.width * f->fmt.pix.height,
-						 f->fmt.pix.width,
-						 ATOM_ISP_STEP_HEIGHT);
-		}
-		atomisp_subdev_set_selection(&asd->subdev, fh.state,
-					     V4L2_SUBDEV_FORMAT_ACTIVE,
-					     ATOMISP_SUBDEV_PAD_SINK,
-					     V4L2_SEL_TGT_CROP,
-					     V4L2_SEL_FLAG_KEEP_CONFIG,
-					     &sink_crop);
-
 		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     ATOMISP_SUBDEV_PAD_SOURCE,
-- 
2.40.1

