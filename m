Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 036756316F0
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiKTWnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiKTWnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4FF240B5
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M3U+wFH0/tAg82yKmstwF74PbEzVdI1wACOO/EkoVQU=;
        b=eKzHQBQCMA4tyDsqZNrVEdJlSwduUTOnRls6ebGZNmrYpuT6AjsZvJ73YwqCZW/T6amm2i
        Sut4Rt1fPwvQZ5bA+cizjeKzvmq7XtojcRAg+VEiv4c3ePh0D4ihzVlONM5E+kx7tVdafq
        /AnM5L3gTcFYhxZ+FNFZYjP4XRjRWhw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-ygewqicdNaWedT-yeyLSrA-1; Sun, 20 Nov 2022 17:41:27 -0500
X-MC-Unique: ygewqicdNaWedT-yeyLSrA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B857A185A79C;
        Sun, 20 Nov 2022 22:41:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4B1C647505E;
        Sun, 20 Nov 2022 22:41:25 +0000 (UTC)
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
Subject: [PATCH 09/20] media: atomisp: Remove unused ia_css_frame_*() functions
Date:   Sun, 20 Nov 2022 23:40:50 +0100
Message-Id: <20221120224101.746199-10-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the conversion to videobuf2 a bunch of ia_css_frame_*()
functions are unused, remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/ia_css_frame_public.h   |  74 -----------
 .../atomisp/pci/runtime/frame/src/frame.c     | 121 ------------------
 2 files changed, 195 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 32d6d9699c37..7ba464abf447 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -205,15 +205,6 @@ struct ia_css_frame {
 	.flash_state		= IA_CSS_FRAME_FLASH_STATE_NONE, \
 }
 
-/* @brief Fill a frame with zeros
- *
- * @param	frame		The frame.
- * @return	None
- *
- * Fill a frame with pixel values of zero
- */
-void ia_css_frame_zero(struct ia_css_frame *frame);
-
 /* @brief Allocate a CSS frame structure
  *
  * @param	frame		The allocated frame.
@@ -270,71 +261,6 @@ ia_css_frame_allocate_from_info(struct ia_css_frame **frame,
 void
 ia_css_frame_free(struct ia_css_frame *frame);
 
-/* @brief Allocate a CSS frame structure using a frame info structure.
- *
- * @param	frame	The allocated frame.
- * @param[in]	info	The frame info structure.
- * @return		The error code.
- *
- * Allocate an empty CSS frame with no data buffer using the parameters
- * in the frame info.
- */
-int
-ia_css_frame_create_from_info(struct ia_css_frame **frame,
-			      const struct ia_css_frame_info *info);
-
-/* @brief Set a mapped data buffer to a CSS frame
- *
- * @param[in]	frame       Valid CSS frame pointer
- * @param[in]	mapped_data  Mapped data buffer to be assigned to the CSS frame
- * @param[in]	data_size_bytes  Size of the mapped_data in bytes
- * @return      The error code.
- *
- * Sets a mapped data buffer to this frame. This function can be called multiple
- * times with different buffers or NULL to reset the data pointer. This API
- * would not try free the mapped_data and its the callers responsiblity to
- * free the mapped_data buffer. However if ia_css_frame_free() is called and
- * the frame had a valid data buffer, it would be freed along with the frame.
- */
-int
-ia_css_frame_set_data(struct ia_css_frame *frame,
-		      const ia_css_ptr   mapped_data,
-		      size_t data_size_bytes);
-
-/* @brief Map an existing frame data pointer to a CSS frame.
- *
- * @param	frame		Pointer to the frame to be initialized
- * @param[in]	info		The frame info.
- * @param[in]	data		Pointer to the allocated frame data.
- * @param[in]	attribute	Attributes to be passed to mmgr_mmap.
- * @param[in]	context		Pointer to the a context to be passed to mmgr_mmap.
- * @return			The allocated frame structure.
- *
- * This function maps a pre-allocated pointer into a CSS frame. This can be
- * used when an upper software layer is responsible for allocating the frame
- * data and it wants to share that frame pointer with the CSS code.
- * This function will fill the CSS frame structure just like
- * ia_css_frame_allocate() does, but instead of allocating the memory, it will
- * map the pre-allocated memory into the CSS address space.
- */
-int
-ia_css_frame_map(struct ia_css_frame **frame,
-		 const struct ia_css_frame_info *info,
-		 const void __user *data,
-		 unsigned int pgnr);
-
-/* @brief Unmap a CSS frame structure.
- *
- * @param[in]	frame	Pointer to the CSS frame.
- * @return	None
- *
- * This function unmaps the frame data pointer within a CSS frame and
- * then frees the CSS frame structure. Use this for frame pointers created
- * using ia_css_frame_map().
- */
-void
-ia_css_frame_unmap(struct ia_css_frame *frame);
-
 static inline const struct ia_css_frame_info *
 ia_css_frame_get_info(const struct ia_css_frame *frame)
 {
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 332b4a39e74d..83bb42e05421 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -88,12 +88,6 @@ ia_css_elems_bytes_from_info(
 **	CSS API functions, exposed by ia_css.h
 **************************************************************************/
 
-void ia_css_frame_zero(struct ia_css_frame *frame)
-{
-	assert(frame);
-	hmm_set(frame->data, 0, frame->data_bytes);
-}
-
 int ia_css_frame_allocate_from_info(struct ia_css_frame **frame,
 	const struct ia_css_frame_info *info)
 {
@@ -143,121 +137,6 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
 	return err;
 }
 
-int ia_css_frame_map(struct ia_css_frame **frame,
-				 const struct ia_css_frame_info *info,
-				 const void __user *data,
-				 unsigned int pgnr)
-{
-	int err = 0;
-	struct ia_css_frame *me;
-
-	assert(frame);
-
-	/* Create the frame structure */
-	err = ia_css_frame_create_from_info(&me, info);
-
-	if (err)
-		return err;
-
-	if (pgnr < ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
-		dev_err(atomisp_dev,
-			"user space memory size is less than the expected size..\n");
-		err = -ENOMEM;
-		goto error;
-	} else if (pgnr > ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
-		dev_err(atomisp_dev,
-			"user space memory size is large than the expected size..\n");
-		err = -ENOMEM;
-		goto error;
-	}
-
-	me->data = hmm_create_from_userdata(me->data_bytes, data);
-	if (me->data == mmgr_NULL)
-		err = -EINVAL;
-
-error:
-	if (err) {
-		kvfree(me);
-		me = NULL;
-	}
-
-	*frame = me;
-
-	return err;
-}
-
-int ia_css_frame_create_from_info(struct ia_css_frame **frame,
-	const struct ia_css_frame_info *info)
-{
-	int err = 0;
-	struct ia_css_frame *me;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_frame_create_from_info() enter:\n");
-	if (!frame || !info) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "ia_css_frame_create_from_info() leave: invalid arguments\n");
-		return -EINVAL;
-	}
-
-	me = frame_create(info->res.width,
-			  info->res.height,
-			  info->format,
-			  info->padded_width,
-			  info->raw_bit_depth,
-			  false);
-	if (!me) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "ia_css_frame_create_from_info() leave: frame create failed\n");
-		return -ENOMEM;
-	}
-
-	err = ia_css_frame_init_planes(me);
-
-	if (err) {
-		kvfree(me);
-		me = NULL;
-	}
-
-	*frame = me;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_frame_create_from_info() leave:\n");
-
-	return err;
-}
-
-int ia_css_frame_set_data(struct ia_css_frame *frame,
-				      const ia_css_ptr mapped_data,
-				      size_t data_bytes)
-{
-	int err = 0;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_frame_set_data() enter:\n");
-	if (!frame) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "ia_css_frame_set_data() leave: NULL frame\n");
-		return -EINVAL;
-	}
-
-	/* If we are setting a valid data.
-	 * Make sure that there is enough
-	 * room for the expected frame format
-	 */
-	if ((mapped_data != mmgr_NULL) && (frame->data_bytes > data_bytes)) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "ia_css_frame_set_data() leave: invalid arguments\n");
-		return -EINVAL;
-	}
-
-	frame->data = mapped_data;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_frame_set_data() leave:\n");
-
-	return err;
-}
-
 void ia_css_frame_free(struct ia_css_frame *frame)
 {
 	IA_CSS_ENTER_PRIVATE("frame = %p", frame);
-- 
2.38.1

