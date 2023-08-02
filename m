Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB48976C9F6
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbjHBJ5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjHBJ52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3F8213F
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+1aYWKcfrdle99XSOumU0rh1QiMX5RoG78PL7LShRLE=;
        b=RdEuRo/xrYnxfikvzrU2B+RpXdCKH2VDCU3UdfBmJWRNTt+cNQ8HfV9gO8x4uEkxiP1a73
        3yy8yMTVtYaz2zYsQ+JXPP5W/P56NPDtUvediUq5W60anhE6R5hBDHNC3PsnC6SlEQfAy3
        MILHVAVoJRkljGQMb0VezDfWmuld3xA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-pSLgf_ZzPDuLjF3M_C8z-w-1; Wed, 02 Aug 2023 05:56:32 -0400
X-MC-Unique: pSLgf_ZzPDuLjF3M_C8z-w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C050D381AE43;
        Wed,  2 Aug 2023 09:56:31 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E8780401061;
        Wed,  2 Aug 2023 09:56:28 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 01/12] media: atomisp: ia_css_raw.host: Remove #ifdef ISP2401 to make the driver generic
Date:   Wed,  2 Aug 2023 17:55:55 +0800
Message-ID: <20230802095606.1298152-2-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove #ifdef from the code and made the code generic. The raw image
configuration was determined during runtime.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index 646d6e39c1e5..40d4a0521562 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -73,17 +73,9 @@ int ia_css_raw_config(struct sh_css_isp_raw_isp_config *to,
 	const struct ia_css_frame_info *internal_info = from->internal_info;
 	int ret;
 
-#if !defined(ISP2401)
-	/* 2401 input system uses input width width */
-	in_info = internal_info;
-#else
-	/*in some cases, in_info is NULL*/
-	if (in_info)
-		(void)internal_info;
-	else
+	if (!IS_ISP2401 || !in_info)
 		in_info = internal_info;
 
-#endif
 	ret = ia_css_dma_configure_from_info(&to->port_b, in_info);
 	if (ret)
 		return ret;
@@ -99,11 +91,12 @@ int ia_css_raw_config(struct sh_css_isp_raw_isp_config *to,
 	to->two_ppc             = from->two_ppc;
 	to->stream_format       = css2isp_stream_format(from->stream_format);
 	to->deinterleaved       = from->deinterleaved;
-#if defined(ISP2401)
-	to->start_column        = in_info->crop_info.start_column;
-	to->start_line          = in_info->crop_info.start_line;
-	to->enable_left_padding = from->enable_left_padding;
-#endif
+
+	if (IS_ISP2401) {
+		to->start_column        = in_info->crop_info.start_column;
+		to->start_line          = in_info->crop_info.start_line;
+		to->enable_left_padding = from->enable_left_padding;
+	}
 
 	return 0;
 }
-- 
2.41.0

