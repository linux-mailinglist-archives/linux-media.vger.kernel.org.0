Return-Path: <linux-media+bounces-22475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031EC9E0B64
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 19:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B78A3B87694
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B144314A0B8;
	Mon,  2 Dec 2024 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L7Gmv2zv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6921770ED
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154449; cv=none; b=SrGla+XC44CRl2TEHT5n8SjUJqZLebyoUWz4HxUxNJdmzxkZYBZdecMJppabfsuBuOiRt8kBdXFoduOCuldzHPII0RuFSTVNLBZ4zgTP+A5Y1h+vY6VJygZn1aTxgOjquW6F5edMMKl/EUVZDa/2JQJBmHuNZY4H7SHa6im1MZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154449; c=relaxed/simple;
	bh=NQt98Z0M5QNA/TsO8gh1YDS9GMK76KynhZ9aabRaUlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9NJHh2KZIEPjMhvYz/nfRScaeWL1O2eNl+ulQcBtuUttNzWJD/zsbPdmpSVmmpjERQDUUB5tjZnYSunBWNgsBcRibT9gfj+iikx7Y1Fc8cwax4Q/449xqr9o2kGy/btLYFlCFhl+VLKu3dW9CyYDO69LbLDc//qCo5Rt+GEDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L7Gmv2zv; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d88cb85987so22641596d6.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 07:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154445; x=1733759245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=;
        b=L7Gmv2zvrBkVAJTmF5xBrM9r0j/frnToHTvotHEjxhCbFDhji/SvvD+8eNb2A5NCoN
         CgGDzV9PuCJ2uw0j+L3rT3rDawUrPBOJvUKbVNYwStlfEWluY7vYbtFBR+eVJ+5/0JeX
         JITPQD0mClFdKEgs2jmct8LMMnXjJ9WWBRWcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154445; x=1733759245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=;
        b=aVqNGp042KwbGeDE0H/EHGdXf18Y/4cLTFsa5LECuE5yChdGz3srPx8ggDT9g6br7v
         1kETa0rZ6RED+Wx2fKlZ8jT3dpFg9dpfPekcWSnlz2+1Eg4S+imwG+Y9Q0SE4iNfcSnV
         VvepyapJWuDifdM3IkjrHJWDDNe51TrzF5cAFmgvS9fNF8OhTfzdgSeGrxMtpUsV9DQo
         7mkMN5hNgDh5nscBW7YbeyhMIdc+hL33GzcGoBPzkjEjhCIYP3ONldDiuMQZaH5wb17T
         HGo9WOSkDgMcl9fu/zq5NY/RP0QK7Z7gMexhYCyV4wy9o71Hea3ZR9YYTv45HiGuz2nw
         SSLg==
X-Gm-Message-State: AOJu0Yxh1jZKtVeNg6MnU6lD/J6U3Cw1VtSLpF4l74ov7h1AwVePTsbR
	0vXHHCFPDeGLf9D+uNpnOedgI2G9TbACz5dRdhXo6EvVoPegvqXFNbIIXT+Pag==
X-Gm-Gg: ASbGnctCCobahSkv+t3uiNUGBsQe+ef1IpAgj1/hB1OyjAZGeKxAcy6KEYQzTGEZ6CO
	oDEhSfbNeM0iO44xw24BXtFGYHcrwvh1n5VbqbafZ8wYJPybqD72CsJk60VIFANjlplGQKuP2a5
	ExuGLniPRwSKqs2GTuiKGQiAx63pHeRATik3Ya6gB11BuBzq2DVJpm6DyEgooXy6i0qRucAQyVA
	thGnCvCYbatYIs6v29CETJdojSOzcdJzWuld3UGSxKKpDi0Fhz8ppkWXPDfpiQl+Xk/npYs5Bv7
	4knZX/Tvsn95TiHnm3zMX1dG
X-Google-Smtp-Source: AGHT+IGi/PMi7HKxN0drYRNoeMrQehkEDZgCgHDgtdOzyjj8HEWJDMxx4Dj3/iwSYHFuTdJy9nQktg==
X-Received: by 2002:a05:6214:626:b0:6d8:a1b4:b58f with SMTP id 6a1803df08f44-6d8a1b4bb2amr99633466d6.11.1733154445272;
        Mon, 02 Dec 2024 07:47:25 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:17 +0000
Subject: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
In-Reply-To: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
the same enum type, but their are part of the same ternary operator.

vpu_inst.id is of type int, so we can just rewrite a bit the code and
avoid the following llvm9 warning:
drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index f8145998fcaf..4786062e879a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
 
 static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 {
-	const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
 	int ret = 0;
 	struct venc_h264_inst *inst;
 
@@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
+	if (MTK_ENC_CTX_IS_EXT(ctx))
+		inst->vpu_inst.id = SCP_IPI_VENC_H264;
+	else
+		inst->vpu_inst.id = IPI_VENC_H264;
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
 
 	ret = vpu_enc_init(&inst->vpu_inst);

-- 
2.47.0.338.g60cca15819-goog


