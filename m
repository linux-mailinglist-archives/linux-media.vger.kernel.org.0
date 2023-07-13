Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF375751E3B
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234610AbjGMKFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234492AbjGMKFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:05:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B152D45
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pM3PGfhgQFpLp3ULFTBz/c5W/gDv9O++Gad3Ax1m+78=;
        b=Z/oCpyEwF+fym4YEu4LsrCvcRfxDgXdHhe9TyA7x8AHWBPwuyYLvIC2GrTRmC16RAk/P2J
        /M8l3eniwl4dDO1rc5LQKtpTum9m6jFVqpA6ZGWy0BDx27+T6rZl50ait5UIVb9pddd1aq
        maJ5HAl+6gV4rP4DzbW3Iz7JKeSqoGA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-d0hx51YnO4OhE77etXA7uw-1; Thu, 13 Jul 2023 06:04:24 -0400
X-MC-Unique: d0hx51YnO4OhE77etXA7uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3737101A54E;
        Thu, 13 Jul 2023 10:04:23 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F1460111E3EB;
        Thu, 13 Jul 2023 10:04:19 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 10/11] media: atomisp: rx: Removed #if defined(ISP2401) to make driver generic
Date:   Thu, 13 Jul 2023 18:02:30 +0800
Message-ID: <20230713100231.308923-11-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conflicts of variable declarations were resolved through previous
commits so the #if defined(ISP2401) can be removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/runtime/isys/src/rx.c   | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index b58f4fd4a35c..c8316e0965d0 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -20,7 +20,6 @@
 #include "ia_css_irq.h"
 #include "sh_css_internal.h"
 
-#if !defined(ISP2401)
 void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
 {
 	hrt_data bits = receiver_port_reg_load(RX0_ID,
@@ -209,9 +208,7 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 
 	return;
 }
-#endif /* #if !defined(ISP2401) */
 
-#if !defined(ISP2401)
 static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
 					 unsigned int *fmt_type)
 {
@@ -283,9 +280,7 @@ static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
 	}
 	return 0;
 }
-#endif /* #ifndef ISP2401 */
 
-#if defined(ISP2401)
 static int ia_css_isys_2401_set_fmt_type(enum atomisp_input_format input_format,
 					 unsigned int *fmt_type)
 {
@@ -373,7 +368,6 @@ static int ia_css_isys_2401_set_fmt_type(enum atomisp_input_format input_format,
 	}
 	return 0;
 }
-#endif /* #ifdef ISP2401 */
 
 int ia_css_isys_convert_stream_format_to_mipi_format(
     enum atomisp_input_format input_format,
@@ -423,14 +417,12 @@ int ia_css_isys_convert_stream_format_to_mipi_format(
 	 *
 	 * MW: For some reason the mapping is not 1-to-1
 	 */
-#if defined(ISP2401)
-	return ia_css_isys_2401_set_fmt_type(input_format, fmt_type);
-#else
-	return ia_css_isys_2400_set_fmt_type(input_format, fmt_type);
-#endif
+	if (IS_ISP2401)
+		return ia_css_isys_2401_set_fmt_type(input_format, fmt_type);
+	else
+		return ia_css_isys_2400_set_fmt_type(input_format, fmt_type);
 }
 
-#if defined(ISP2401)
 static mipi_predictor_t sh_css_csi2_compression_type_2_mipi_predictor(
     enum ia_css_csi2_compression_type type)
 {
@@ -547,9 +539,7 @@ unsigned int ia_css_csi2_calculate_input_system_alignment(
 	return memory_alignment_in_bytes;
 }
 
-#endif
 
-#if !defined(ISP2401)
 static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
 	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
 	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
@@ -671,4 +661,3 @@ void ia_css_isys_rx_disable(void)
 	}
 	return;
 }
-#endif /* if !defined(ISP2401) */
-- 
2.41.0

