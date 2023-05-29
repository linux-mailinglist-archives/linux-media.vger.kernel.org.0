Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71C37147FF
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbjE2Kjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbjE2Kjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48261ED
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oqMtIkcv1YbaQBhikHpR/UGz7Bv7YnGBOzhOOYiIU7Q=;
        b=fa9cmWKTcQo/I6y7DT681ISSK45FEoRWtB13SBdYl56akT+IOSwLghBJnMr7cKsu2cx6+Y
        vowLBNRsiUidpXTwV0SR4bUQGyIbUr+lUyYehAOlRMzmrMabrMlVnkUkA5v2NzQ5GV70TX
        d2T/sNy5CFp/IUKpwG0epo6YGUinXqM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-rWff-uqAMDODFpeWkQx5aw-1; Mon, 29 May 2023 06:38:37 -0400
X-MC-Unique: rWff-uqAMDODFpeWkQx5aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90F081C06904;
        Mon, 29 May 2023 10:38:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F325F2166B2B;
        Mon, 29 May 2023 10:38:34 +0000 (UTC)
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
Subject: [PATCH 09/21] media: atomisp: Simplify atomisp_subdev_set_selection() calls in atomisp_set_fmt()
Date:   Mon, 29 May 2023 12:37:29 +0200
Message-Id: <20230529103741.11904-10-hdegoede@redhat.com>
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

With the atomisp_subdev_set_selection(sink-pad, V4L2_SEL_TGT_CROP, rect)
calls dropped. The first and last compount code blocks of the 3 code blocks
in the if (...) {} else if (...) {} else {} code setting the source-pad
V4L2_SEL_TGT_COMPOSE selection are the same.

The both set V4L2_SEL_TGT_COMPOSE to a rectangle with the same dimensions
as f->fmt.pix.height.

Remove the else {} block at the end, drop the second if and prepend
the first if condition with "!second-if-condition ||" to remove
the code duplication.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 36618d2eba72..2a1cb3049019 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4319,7 +4319,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 
 	/* Try to enable YUV downscaling if ISP input is 10 % (either
 	 * width or height) bigger than the desired result. */
-	if (isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
+	if (!IS_MOFD ||
+	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
 	    (atomisp_subdev_format_conversion(asd) &&
 	     (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
@@ -4331,7 +4332,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     ATOMISP_SUBDEV_PAD_SOURCE, V4L2_SEL_TGT_COMPOSE,
 					     0, &isp_sink_crop);
-	} else if (IS_MOFD) {
+	} else {
 		struct v4l2_rect main_compose = {0};
 
 		main_compose.width = isp_sink_crop.width;
@@ -4346,17 +4347,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 					 f->fmt.pix.height);
 		}
 
-		atomisp_subdev_set_selection(&asd->subdev, fh.state,
-					     V4L2_SUBDEV_FORMAT_ACTIVE,
-					     ATOMISP_SUBDEV_PAD_SOURCE,
-					     V4L2_SEL_TGT_COMPOSE, 0,
-					     &main_compose);
-	} else {
-		struct v4l2_rect main_compose = {0};
-
-		main_compose.width = f->fmt.pix.width;
-		main_compose.height = f->fmt.pix.height;
-
 		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     ATOMISP_SUBDEV_PAD_SOURCE,
-- 
2.40.1

