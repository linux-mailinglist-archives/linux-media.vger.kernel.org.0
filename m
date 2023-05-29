Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4DB714802
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjE2Kji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbjE2Kjg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB070CD
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XllL+yI9z2laQ2pahy5+QtJQtfSyZTQ7z69XtQb2DW4=;
        b=MPJrQbrFsvs7y1+YW1X7myjLM04khTBYi5SqV4P6BEucvoNz1u1d6GSZKi5773iK7FYsQO
        f9PmwtRVd9z4s/MUx1/GQcmg1qyo1A6nqpDACNYcr6DuI6sv0l8XeFfoLOYBu5QF7a48if
        Ov2F7FlSHezHFm1Na8XvO6qHGs3RK14=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-g5PNv0opNj-bLlkLlSl2Gg-1; Mon, 29 May 2023 06:38:46 -0400
X-MC-Unique: g5PNv0opNj-bLlkLlSl2Gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDF873C1350A;
        Mon, 29 May 2023 10:38:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E90D2166B2B;
        Mon, 29 May 2023 10:38:44 +0000 (UTC)
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
Subject: [PATCH 13/21] media: atomisp: Add ia_css_frame_pad_width() helper function
Date:   Mon, 29 May 2023 12:37:33 +0200
Message-Id: <20230529103741.11904-14-hdegoede@redhat.com>
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

Factor the code to go from width to a properly aligned pitch out of
ia_css_frame_info_set_width().

This is a preparation patch to fix try_fmt() calls returning a bogus
bytesperline value.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../runtime/frame/interface/ia_css_frame.h    |  2 +
 .../atomisp/pci/runtime/frame/src/frame.c     | 44 +++++++++++--------
 2 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
index 700070c58eda..90c17884968b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
@@ -138,4 +138,6 @@ bool ia_css_frame_is_same_type(
 int ia_css_dma_configure_from_info(struct dma_port_config *config,
 				   const struct ia_css_frame_info *info);
 
+unsigned int ia_css_frame_pad_width(unsigned int width, enum ia_css_frame_format format);
+
 #endif /* __IA_CSS_FRAME_H__ */
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 1e374ae848e3..1ccf13c01476 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -269,6 +269,29 @@ int ia_css_frame_init_planes(struct ia_css_frame *frame)
 	return 0;
 }
 
+unsigned int ia_css_frame_pad_width(unsigned int width, enum ia_css_frame_format format)
+{
+	/*
+	 * frames with a U and V plane of 8 bits per pixel need to have
+	 * all planes aligned, this means double the alignment for the
+	 * Y plane if the horizontal decimation is 2.
+	 */
+	if (format == IA_CSS_FRAME_FORMAT_YUV420 ||
+	    format == IA_CSS_FRAME_FORMAT_YV12 ||
+	    format == IA_CSS_FRAME_FORMAT_NV12 ||
+	    format == IA_CSS_FRAME_FORMAT_NV21 ||
+	    format == IA_CSS_FRAME_FORMAT_BINARY_8 ||
+	    format == IA_CSS_FRAME_FORMAT_YUV_LINE)
+		return CEIL_MUL(width, 2 * HIVE_ISP_DDR_WORD_BYTES);
+	else if (format == IA_CSS_FRAME_FORMAT_NV12_TILEY)
+		return CEIL_MUL(width, NV12_TILEY_TILE_WIDTH);
+	else if (format == IA_CSS_FRAME_FORMAT_RAW ||
+		 format == IA_CSS_FRAME_FORMAT_RAW_PACKED)
+		return CEIL_MUL(width, 2 * ISP_VEC_NELEMS);
+	else
+		return CEIL_MUL(width, HIVE_ISP_DDR_WORD_BYTES);
+}
+
 void ia_css_frame_info_set_width(struct ia_css_frame_info *info,
 				 unsigned int width,
 				 unsigned int min_padded_width)
@@ -285,25 +308,8 @@ void ia_css_frame_info_set_width(struct ia_css_frame_info *info,
 	align = max(min_padded_width, width);
 
 	info->res.width = width;
-	/* frames with a U and V plane of 8 bits per pixel need to have
-	   all planes aligned, this means double the alignment for the
-	   Y plane if the horizontal decimation is 2. */
-	if (info->format == IA_CSS_FRAME_FORMAT_YUV420 ||
-	    info->format == IA_CSS_FRAME_FORMAT_YV12 ||
-	    info->format == IA_CSS_FRAME_FORMAT_NV12 ||
-	    info->format == IA_CSS_FRAME_FORMAT_NV21 ||
-	    info->format == IA_CSS_FRAME_FORMAT_BINARY_8 ||
-	    info->format == IA_CSS_FRAME_FORMAT_YUV_LINE)
-		info->padded_width =
-		    CEIL_MUL(align, 2 * HIVE_ISP_DDR_WORD_BYTES);
-	else if (info->format == IA_CSS_FRAME_FORMAT_NV12_TILEY)
-		info->padded_width = CEIL_MUL(align, NV12_TILEY_TILE_WIDTH);
-	else if (info->format == IA_CSS_FRAME_FORMAT_RAW ||
-		 info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED)
-		info->padded_width = CEIL_MUL(align, 2 * ISP_VEC_NELEMS);
-	else {
-		info->padded_width = CEIL_MUL(align, HIVE_ISP_DDR_WORD_BYTES);
-	}
+	info->padded_width = ia_css_frame_pad_width(align, info->format);
+
 	IA_CSS_LEAVE_PRIVATE("");
 }
 
-- 
2.40.1

