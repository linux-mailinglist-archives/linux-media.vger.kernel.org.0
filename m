Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117EC549FB1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345810AbiFMUpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351455AbiFMUoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 257EB13F0F
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zNcXc/86eRpBvoH2A7xKuwURppWBQV35sZkH6E8HBsM=;
        b=i+j7ZH+dHowN3K4x5cIYingqgMRdEa2nU5WdO8q301YYsNCEgea9F7t+VdJu3s35EH9nwp
        72712XqakkKPF+gA1e0QRsLnqdn3iqsVvb/2Prj5oRXHbw1Z0nHwI6JPPwO/0IcRJ8fmzc
        LAu48fFna1MhA71l+qXXnKruIM2caeU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-NFEL7gwwMxmz0TuicVITRw-1; Mon, 13 Jun 2022 15:51:44 -0400
X-MC-Unique: NFEL7gwwMxmz0TuicVITRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C5543C1014C;
        Mon, 13 Jun 2022 19:51:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 821142166B26;
        Mon, 13 Jun 2022 19:51:41 +0000 (UTC)
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
Subject: [PATCH 02/40] media: atomisp: remove unused ia_css_frame_allocate_contiguous*() functions
Date:   Mon, 13 Jun 2022 21:50:59 +0200
Message-Id: <20220613195137.8117-3-hdegoede@redhat.com>
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

ia_css_frame_allocate_contiguous() and
ia_css_frame_allocate_contiguous_from_info() are not used anywhere,
remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/ia_css_frame_public.h   | 38 ----------------
 .../atomisp/pci/runtime/frame/src/frame.c     | 43 -------------------
 2 files changed, 81 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 96c86f0dc81c..9c4d466ebfb9 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -245,44 +245,6 @@ ia_css_frame_allocate_from_info(struct ia_css_frame **frame,
 void
 ia_css_frame_free(struct ia_css_frame *frame);
 
-/* @brief Allocate a contiguous CSS frame structure
- *
- * @param	frame		The allocated frame.
- * @param	width		The width (in pixels) of the frame.
- * @param	height		The height (in lines) of the frame.
- * @param	format		The frame format.
- * @param	stride		The padded stride, in pixels.
- * @param	raw_bit_depth	The raw bit depth, in bits.
- * @return			The error code.
- *
- * Contiguous frame allocation, only for FPGA display driver which needs
- * physically contiguous memory.
- * Deprecated.
- */
-int
-ia_css_frame_allocate_contiguous(struct ia_css_frame **frame,
-				 unsigned int width,
-				 unsigned int height,
-				 enum ia_css_frame_format format,
-				 unsigned int stride,
-				 unsigned int raw_bit_depth);
-
-/* @brief Allocate a contiguous CSS frame from a frame info structure.
- *
- * @param	frame	The allocated frame.
- * @param[in]	info	The frame info structure.
- * @return		The error code.
- *
- * Allocate a frame using the resolution and format from a frame info struct.
- * This is a convenience function, implemented on top of
- * ia_css_frame_allocate_contiguous().
- * Only for FPGA display driver which needs physically contiguous memory.
- * Deprecated.
- */
-int
-ia_css_frame_allocate_contiguous_from_info(struct ia_css_frame **frame,
-	const struct ia_css_frame_info *info);
-
 /* @brief Allocate a CSS frame structure using a frame info structure.
  *
  * @param	frame	The allocated frame.
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index a3aae638b0bf..1d8017fc3f70 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -270,49 +270,6 @@ int ia_css_frame_set_data(struct ia_css_frame *frame,
 	return err;
 }
 
-int ia_css_frame_allocate_contiguous(struct ia_css_frame **frame,
-	unsigned int width,
-	unsigned int height,
-	enum ia_css_frame_format format,
-	unsigned int padded_width,
-	unsigned int raw_bit_depth)
-{
-	int err = 0;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_frame_allocate_contiguous() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
-			    width, height, format, padded_width, raw_bit_depth);
-
-	err = frame_allocate_with_data(frame, width, height, format,
-				       padded_width, raw_bit_depth, true);
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_frame_allocate_contiguous() leave: frame=%p\n",
-			    frame ? *frame : (void *)-1);
-
-	return err;
-}
-
-int ia_css_frame_allocate_contiguous_from_info(
-    struct ia_css_frame **frame,
-    const struct ia_css_frame_info *info)
-{
-	int err = 0;
-
-	assert(frame);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_frame_allocate_contiguous_from_info() enter:\n");
-	err = ia_css_frame_allocate_contiguous(frame,
-					       info->res.width,
-					       info->res.height,
-					       info->format,
-					       info->padded_width,
-					       info->raw_bit_depth);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_frame_allocate_contiguous_from_info() leave:\n");
-	return err;
-}
-
 void ia_css_frame_free(struct ia_css_frame *frame)
 {
 	IA_CSS_ENTER_PRIVATE("frame = %p", frame);
-- 
2.36.0

