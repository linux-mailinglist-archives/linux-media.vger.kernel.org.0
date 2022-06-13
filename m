Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E5B549FBC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347936AbiFMUpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351484AbiFMUoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9163CDECB
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149915;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7HvMLRoTK6rxSlVUrDF+p0yNYtkvPQrEiYM+HRir/9c=;
        b=fQ/hUMgw0AothUrEVTtroiiHhZTfjzRwDg8obhOPI4+w38eYH0Z1ZEAG/dlKkWCBc7RX2y
        RJDwgbQRRSpjyN41m2UonmFkplFlSjz6iwMNlt2i1EB79a092J6WKn/O4eFAJ9r1X2ClK4
        yz5xCVHtbM4MRyatOGonvS8R4AcUy8Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-NbigGoTfNNW_FJsHhVoLfQ-1; Mon, 13 Jun 2022 15:51:50 -0400
X-MC-Unique: NbigGoTfNNW_FJsHhVoLfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A61E801755;
        Mon, 13 Jun 2022 19:51:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 753F42166B26;
        Mon, 13 Jun 2022 19:51:48 +0000 (UTC)
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
Subject: [PATCH 06/40] media: atomisp: drop IA_CSS_FRAME_FORMAT_MIPI support from ia_css_frame_init_planes()
Date:   Mon, 13 Jun 2022 21:51:03 +0200
Message-Id: <20220613195137.8117-7-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Nothing ever sets the format to IA_CSS_FRAME_FORMAT_MIPI and
frame_init_mipi_plane() is the only code-path which ever sets
frame->contiguous to true.

Drop A_CSS_FRAME_FORMAT_MIPI support from ia_css_frame_init_planes()
as part of the removal of contiguous alloc support from the frame code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/pci/runtime/frame/src/frame.c     | 30 ++-----------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index af23fbb831d6..cb0b579fbadf 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -48,12 +48,6 @@ static void frame_init_raw_single_plane(
     unsigned int subpixels_per_line,
     unsigned int bits_per_pixel);
 
-static void frame_init_mipi_plane(struct ia_css_frame *frame,
-				  struct ia_css_frame_plane *plane,
-				  unsigned int height,
-				  unsigned int subpixels_per_line,
-				  unsigned int bytes_per_pixel);
-
 static void frame_init_nv_planes(struct ia_css_frame *frame,
 				 unsigned int horizontal_decimation,
 				 unsigned int vertical_decimation,
@@ -297,11 +291,9 @@ int ia_css_frame_init_planes(struct ia_css_frame *frame)
 
 	switch (frame->info.format) {
 	case IA_CSS_FRAME_FORMAT_MIPI:
-		frame_init_mipi_plane(frame, &frame->planes.raw,
-				      frame->info.res.height,
-				      frame->info.padded_width,
-				      frame->info.raw_bit_depth <= 8 ? 1 : 2);
-		break;
+		dev_err(atomisp_dev,
+			"%s: unexpected use of IA_CSS_FRAME_FORMAT_MIPI\n", __func__);
+		return -EINVAL;
 	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
 		frame_init_raw_single_plane(frame, &frame->planes.raw,
 					    frame->info.res.height,
@@ -622,22 +614,6 @@ static void frame_init_raw_single_plane(
 	return;
 }
 
-static void frame_init_mipi_plane(struct ia_css_frame *frame,
-				  struct ia_css_frame_plane *plane,
-				  unsigned int height,
-				  unsigned int subpixels_per_line,
-				  unsigned int bytes_per_pixel)
-{
-	unsigned int stride;
-
-	stride = subpixels_per_line * bytes_per_pixel;
-	frame->data_bytes = 8388608; /* 8*1024*1024 */
-	frame->valid = false;
-	frame->contiguous = true;
-	frame_init_plane(plane, subpixels_per_line, stride, height, 0);
-	return;
-}
-
 static void frame_init_nv_planes(struct ia_css_frame *frame,
 				 unsigned int horizontal_decimation,
 				 unsigned int vertical_decimation,
-- 
2.36.0

