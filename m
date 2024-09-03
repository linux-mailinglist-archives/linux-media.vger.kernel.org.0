Return-Path: <linux-media+bounces-17442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDEF96956C
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 09:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6061F21CD5
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 07:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5311D6C7B;
	Tue,  3 Sep 2024 07:29:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227FF1D6DBE;
	Tue,  3 Sep 2024 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348564; cv=none; b=D+IVgv009xppNvlEzE17phmnteF2CPnWuQOzbdEBI8Y6SsE2FZmRLJQhD38B7TD752PSeW3GlX9jzsxyeSirj+64I7gKkV/ymF8dM8OC83+1HDnQuzm8SMDETfXZ98Spglb1bo92GeGPJ3P/hvf2I2ts6a0uFB2t2bOKDO9a0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348564; c=relaxed/simple;
	bh=sLOwZ0rmXNyBnArPzhvE4WatBHnPTzuTfnrhHIxJuOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WpBZyS4AJ8oozhINKzwp3vMexhLADLWa8iYC2+1I/lTL1EqPKlRwLR8XHt4Wj6yrDAd1RXygQ/lNqa/+xOggZamx8e1tz60gHl4/1IhbijCoqN8u0ghF00R6CHxqvHI19Pd+LXRTRmn4RSyMQqn1iXVqKrLIntU+ZNBuRQbcpAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACHto7IutZm086_AA--.45237S2;
	Tue, 03 Sep 2024 15:29:12 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: j-luthra@ti.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: ti: j721e-csi2rx: Convert comma to semicolon
Date: Tue,  3 Sep 2024 15:29:04 +0800
Message-Id: <20240903072904.780819-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHto7IutZm086_AA--.45237S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF15Zr47Gryktr15XFb_yoWkWFX_Gr
	y5uayfGFyUAryYgF4jgFnF9FyjvrW5ZrWfWaySvrWrC34kArWUAryjvFy5ZryUA3W8ZF1U
	Xr1DXF93uw13KjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JU7DGOUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 22442fce7607..d124c1256562 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1014,9 +1014,9 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	pix_fmt->height = 480;
 	pix_fmt->field = V4L2_FIELD_NONE;
 	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601,
-	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE,
-	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB,
+	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
 
 	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
 
-- 
2.25.1


