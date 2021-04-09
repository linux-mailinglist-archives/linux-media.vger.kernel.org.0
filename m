Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD6835A063
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 15:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbhDINyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 09:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhDINyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 09:54:22 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C461C061760;
        Fri,  9 Apr 2021 06:54:08 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id i9so5853081qka.2;
        Fri, 09 Apr 2021 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Jxu1wXLzUTMlyWpYlkp0R09G/BZWO4W1YMvr+kxglyE=;
        b=YoLostOrOk+/83vDEZ7NMYNOlGqThHG6PtvSR8NTDZ2V0Dz8mLGz/DgAkn3Y+tAqsp
         exksTB54RI4P7i2E6syq1CqxiyOTJo3txgJH6h84AvFsr2yWt6PxZFtqRVO7wJIxhFzh
         Ivqpjh6gIQZXZIHxMd8TOsEtOob64rWcT06arGCLlVnjNYbK1wzlaDE1IPYedXUIiBbp
         Ir0rYwO2Ly4b0y6ydVbM9SyWTJ5HflsuaiOIOMK4eKxZmeeZ8aDB1OZFneNAd+Qm1PIn
         FI3xAQnQVXRmT6FHrPMA+vkat2c0EPX+hc0s0XYvP+NZGOvFQaMpEEHBvCXqW3Io7+tS
         k0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Jxu1wXLzUTMlyWpYlkp0R09G/BZWO4W1YMvr+kxglyE=;
        b=A/uvq/jEiv4K7xSuk45xM2+FFT2X8nVa2ovgjpNQRUEpeIsbgMtvGU15VDpzu2ZpK6
         j/UlD5UCC7TPvqGkQuGYMuhokh6f2WCHaWPBfCpx4cNiKQs9i7TnJ9uNdziGMFlNE2eI
         hI0ZV1Lc+nI755BQGEoE8qO3aA2hHU14M/oVwV7Q5NKyCe9aSXdMColA1j8kOYaJ5f8Y
         zg8dr61Z1IOmcbepBwErbzwSesE5+NRwJBd9e4+hzA9E4E/6ECbaPh8PydhXE6VQlf+k
         w2glm/v47ZQ+AptQocR8n8FlV6cJrBgxOWQ96eOwZ3jSBZi8GpdtmjmUPMV302q/A7ou
         OCMQ==
X-Gm-Message-State: AOAM533ac+uVNRYoxCEuDiyqsYZqXRKcRNrj+Nc08qHm1sX8V/KvQA1R
        96R8ohx8DjxFDjylvsJVWG4=
X-Google-Smtp-Source: ABdhPJw+/W66tZ0i64ibmsNWJ3Q8XXSswjTboJO51iqQn7PqJYmV0Xr/Itd/PDCvwFIcfGnZLt7NCQ==
X-Received: by 2002:a37:7cd:: with SMTP id 196mr2553037qkh.33.1617976447481;
        Fri, 09 Apr 2021 06:54:07 -0700 (PDT)
Received: from focaruja ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id l9sm1868895qtv.65.2021.04.09.06.54.06
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 06:54:07 -0700 (PDT)
Date:   Fri, 9 Apr 2021 10:54:04 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
Message-ID: <20210409135404.GA26172@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
and #define HANTRO_PP_RED_WRITE_S in lower case, according with
code style.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/hantro/hantro_postproc.c | 34 +++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 6d2a8f2a..06279c0 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -12,14 +12,14 @@
 #include "hantro_hw.h"
 #include "hantro_g1_regs.h"
 
-#define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
+#define hantro_pp_reg_write(vpu, reg_name, val) \
 { \
 	hantro_reg_write(vpu, \
 			 &(vpu)->variant->postproc_regs->reg_name, \
 			 val); \
 }
 
-#define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
+#define hantro_pp_reg_write_s(vpu, reg_name, val) \
 { \
 	hantro_reg_write_s(vpu, \
 			   &(vpu)->variant->postproc_regs->reg_name, \
@@ -61,7 +61,7 @@ void hantro_postproc_enable(struct hantro_ctx *ctx)
 		return;
 
 	/* Turn on pipeline mode. Must be done first. */
-	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
+	hantro_pp_reg_write_s(vpu, pipeline_en, 0x1);
 
 	src_pp_fmt = VPU_PP_IN_NV12;
 
@@ -79,19 +79,19 @@ void hantro_postproc_enable(struct hantro_ctx *ctx)
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 
-	HANTRO_PP_REG_WRITE(vpu, clk_gate, 0x1);
-	HANTRO_PP_REG_WRITE(vpu, out_endian, 0x1);
-	HANTRO_PP_REG_WRITE(vpu, out_swap32, 0x1);
-	HANTRO_PP_REG_WRITE(vpu, max_burst, 16);
-	HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma);
-	HANTRO_PP_REG_WRITE(vpu, input_width, MB_WIDTH(ctx->dst_fmt.width));
-	HANTRO_PP_REG_WRITE(vpu, input_height, MB_HEIGHT(ctx->dst_fmt.height));
-	HANTRO_PP_REG_WRITE(vpu, input_fmt, src_pp_fmt);
-	HANTRO_PP_REG_WRITE(vpu, output_fmt, dst_pp_fmt);
-	HANTRO_PP_REG_WRITE(vpu, output_width, ctx->dst_fmt.width);
-	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.height);
-	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
-	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
+	hantro_pp_reg_write(vpu, clk_gate, 0x1);
+	hantro_pp_reg_write(vpu, out_endian, 0x1);
+	hantro_pp_reg_write(vpu, out_swap32, 0x1);
+	hantro_pp_reg_write(vpu, max_burst, 16);
+	hantro_pp_reg_write(vpu, out_luma_base, dst_dma);
+	hantro_pp_reg_write(vpu, input_width, MB_WIDTH(ctx->dst_fmt.width));
+	hantro_pp_reg_write(vpu, input_height, MB_HEIGHT(ctx->dst_fmt.height));
+	hantro_pp_reg_write(vpu, input_fmt, src_pp_fmt);
+	hantro_pp_reg_write(vpu, output_fmt, dst_pp_fmt);
+	hantro_pp_reg_write(vpu, output_width, ctx->dst_fmt.width);
+	hantro_pp_reg_write(vpu, output_height, ctx->dst_fmt.height);
+	hantro_pp_reg_write(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
+	hantro_pp_reg_write(vpu, display_width, ctx->dst_fmt.width);
 }
 
 void hantro_postproc_free(struct hantro_ctx *ctx)
@@ -146,5 +146,5 @@ void hantro_postproc_disable(struct hantro_ctx *ctx)
 	if (!vpu->variant->postproc_regs)
 		return;
 
-	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
+	hantro_pp_reg_write_s(vpu, pipeline_en, 0x0);
 }
-- 
2.7.4

