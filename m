Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3737D54D316
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346733AbiFOUu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346713AbiFOUu4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4294C55224
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7p/P2bQQfH1zgoyYXQSlPh0wVlGRhMeYBRnxk52h43g=;
        b=i+t6HR4+5LfUSpennfGdyxstlMXREHps2lzcBOuGWnjedu7uB7qJlKLxA6UTzlBO66y0Ur
        UWQ6KBhLbvySqAIFKKu5L6IwDAfh/XYzfYC5aV+IzVxoxJjcTaKA91iLCwkJ1iMGN8aGjm
        /pYpSJnQfhl9YqynG1jtFHkzE+g6GCU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-ObhwjchFNHysrz5yt6kmOA-1; Wed, 15 Jun 2022 16:50:51 -0400
X-MC-Unique: ObhwjchFNHysrz5yt6kmOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17E32382ECC7;
        Wed, 15 Jun 2022 20:50:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7B9BD18EA9;
        Wed, 15 Jun 2022 20:50:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 06/40] media: atomisp: drop IA_CSS_FRAME_FORMAT_MIPI support from ia_css_frame_init_planes()
Date:   Wed, 15 Jun 2022 22:50:03 +0200
Message-Id: <20220615205037.16549-7-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

