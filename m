Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B729E606938
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiJTT4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiJTT4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B65127424
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/Yg08bPRMixKgOlTkJ8HdSgE9HweDZ3hr2DRZfWlrtc=;
        b=jN1dq7HlNINbf/AvLfpduwrvCVSolXCmF2RL78XsyU4XqewpbZzutXJYcxO8lc/d+/Rh7C
        YuR7aJjOwYFfAf8/y6F0Hmgsunn3GacsNsGzVsgE/xTSpGobAYSqKThN/2xXrx/T6du3Db
        RJbtgPSWutJih0s0A3gy3Kc68on22oA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-_4jUVq1OM7COaIlOlN1-wg-1; Thu, 20 Oct 2022 15:56:03 -0400
X-MC-Unique: _4jUVq1OM7COaIlOlN1-wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43CD229AB402;
        Thu, 20 Oct 2022 19:56:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BE5DD40C6EC2;
        Thu, 20 Oct 2022 19:56:01 +0000 (UTC)
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
Subject: [PATCH v2 13/17] media: atomisp: Refactor atomisp_adjust_fmt()
Date:   Thu, 20 Oct 2022 21:55:29 +0200
Message-Id: <20221020195533.114049-14-hdegoede@redhat.com>
In-Reply-To: <20221020195533.114049-1-hdegoede@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor atomisp_adjust_fmt():

1. The block starting at "format_bridge = atomisp_get_format_bridge(...)"
and ending with "if (field == V4L2_FIELD_ANY) field = V4L2_FIELD_NONE;"
is duplicated. With only the second block:
a) Properly checking that format_bridge is not NULL; amd
b) Having the special handling for IA_CSS_FRAME_FORMAT_RAW

Remove the first block.

2. On a NULL return from atomisp_get_format_bridge(f->fmt.pix.pixelformat)
fall back to V4L2_PIX_FMT_YUV420 just like in the IA_CSS_FRAME_FORMAT_RAW
case. atomisp_adjust_fmt() is used in VIDIOC_TRY_FMT handling and that
should jusy pick a fmt rather then returning -EINVAL.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 23 +------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index b5d42257a87d..5034a5509a3b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -878,29 +878,8 @@ static int atomisp_adjust_fmt(struct v4l2_format *f)
 	u32 padded_width;
 
 	format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
-
-	padded_width = f->fmt.pix.width + pad_w;
-
-	if (format_bridge->planar) {
-		f->fmt.pix.bytesperline = padded_width;
-		f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height *
-						  DIV_ROUND_UP(format_bridge->depth *
-						  padded_width, 8));
-	} else {
-		f->fmt.pix.bytesperline = DIV_ROUND_UP(format_bridge->depth *
-						      padded_width, 8);
-		f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height * f->fmt.pix.bytesperline);
-	}
-
-	if (f->fmt.pix.field == V4L2_FIELD_ANY)
-		f->fmt.pix.field = V4L2_FIELD_NONE;
-
-	format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
-	if (!format_bridge)
-		return -EINVAL;
-
 	/* Currently, raw formats are broken!!! */
-	if (format_bridge->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!format_bridge || format_bridge->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
 		f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420;
 
 		format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
-- 
2.37.3

