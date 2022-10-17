Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B22C600932
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbiJQIw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiJQIwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B5A51432
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iLJf9Fo/Th09gV+jIQ1frO0MZE87kA1JQlCPiFw7Kt0=;
        b=JKdfvDQ+hUFesNE9ihzllwfUTAO6G1leyLe/ELpqR6X7zczbI3XvrfmfDunBo10VxHTiT9
        nKN3f8aEAmk+g8F6UVqWBwfqsf0xeJh7PDUWwGV/e4wB/5wj+ajbKaffpVhyMeJBhrXkCN
        ALH29gOiTlbL9n2JoL7TYGZErltHtgk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-jXKwoSS7MHqvblat0iylfg-1; Mon, 17 Oct 2022 04:51:07 -0400
X-MC-Unique: jXKwoSS7MHqvblat0iylfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1420D101E14D;
        Mon, 17 Oct 2022 08:51:07 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AECBE10A58CE;
        Mon, 17 Oct 2022 08:51:04 +0000 (UTC)
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
Subject: [PATCH 02/17] media: atomisp: Add ia_css_frame_init_from_info() function
Date:   Mon, 17 Oct 2022 10:50:42 +0200
Message-Id: <20221017085057.7483-3-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a function to initialize (rather then alloc/create) a
ia_css_frame struct based on an ia_css_frame_info struct.

This is a preparation patch for adding videobuf2 support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/ia_css_frame_public.h      | 11 +++++++++++
 .../media/atomisp/pci/runtime/frame/src/frame.c  | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 514d933f934d..5727bd175330 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -220,6 +220,17 @@ ia_css_frame_allocate(struct ia_css_frame **frame,
 		      unsigned int stride,
 		      unsigned int raw_bit_depth);
 
+/* @brief Initialize a CSS frame structure using a frame info structure.
+ *
+ * @param	frame	The allocated frame.
+ * @param[in]	info	The frame info structure.
+ * @return		The error code.
+ *
+ * Initialize a frame using the resolution and format from a frame info struct.
+ */
+int ia_css_frame_init_from_info(struct ia_css_frame *frame,
+				const struct ia_css_frame_info *info);
+
 /* @brief Allocate a CSS frame structure using a frame info structure.
  *
  * @param	frame	The allocated frame.
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 5a7058320ee6..c20a4527c842 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -847,3 +847,19 @@ void ia_css_resolution_to_sp_resolution(
 	to->width  = (uint16_t)from->width;
 	to->height = (uint16_t)from->height;
 }
+
+int ia_css_frame_init_from_info(struct ia_css_frame *frame,
+				const struct ia_css_frame_info *frame_info)
+{
+	frame->info.res.width = frame_info->res.width;
+	frame->info.res.height = frame_info->res.height;
+	frame->info.format = frame_info->format;
+	frame->info.padded_width = frame_info->padded_width;
+	frame->info.raw_bit_depth = frame_info->raw_bit_depth;
+	frame->valid = true;
+	/* To indicate it is not valid frame. */
+	frame->dynamic_queue_id = SH_CSS_INVALID_QUEUE_ID;
+	frame->buf_type = IA_CSS_BUFFER_TYPE_INVALID;
+
+	return ia_css_frame_init_planes(frame);
+}
-- 
2.37.3

