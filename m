Return-Path: <linux-media+bounces-19890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 643939A4231
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D27A8282C4B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42401200CB8;
	Fri, 18 Oct 2024 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwlbPMPm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852CA23D2;
	Fri, 18 Oct 2024 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729264894; cv=none; b=CyRHX0xhoKwUAqHBWj2gUEdVSAi0kfBvsgoTnu7kdldtAxvTXySPZMgIhsnSApTOBU0ncKt9isuw051PgQMMDFM/x9QDD6+93eqdNeayF46vOOMLr/C8PipDj1rhE1ipKzJrpb6brMtfr4qH7hPICDysbem2jPIw7u8SSjUu74c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729264894; c=relaxed/simple;
	bh=mx87PZ0fJUAC0aOMm3blO7HIkucZJPoFvoNzVO2DGLE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LZ8gaZZxroIGyIeMEC873QcSgNFEZwr9sLz7bn4N9aBuYs2BeoEkrda9mGFdbCUwx1bDbOPG3+ypkTnvuG2V+7Zos/HrjamC6YjqS7vFiDoUG6UOZjk3jcAl5NZpC8W7tXMQGIwTI6eRc4J9cqHwFcuDBT2rzcghyW1AvN/B8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwlbPMPm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28513C4CEC3;
	Fri, 18 Oct 2024 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729264894;
	bh=mx87PZ0fJUAC0aOMm3blO7HIkucZJPoFvoNzVO2DGLE=;
	h=From:To:Cc:Subject:Date:From;
	b=bwlbPMPmuPOb+/LqJ4WWncgzj2FxM9cJbcXhcNpVUBcuxbuOLQmxcIwfK2EQiaAM2
	 wFW+zK6d9BgpayW1uV2DDKEJzHDzPGQdwW5P5SbcxxSi/WWWP8RC218y679NVZFbve
	 Gfdf8hG7p2CdRRC4m/fW9y2L+cLdWsySOdOtalASlfjX7eu6p5RH7PmppentunxdkY
	 nMcB7FI2w4FI/qiI18Rje10jYVIg1m/VFNst5Tj/Gyl4dagpE9Mq+pQD6ZVTlL6lUu
	 rgE355uhVy6JVgvJFz5jlu3ThFMqgqjMIpfNaXquZ1lE9W1IiuWby/GpZjexiBoSfJ
	 tJhIEAUL6c7Qg==
From: Arnd Bergmann <arnd@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Alexandre Courbot <acourbot@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Fei Shao <fshao@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
Date: Fri, 18 Oct 2024 15:21:10 +0000
Message-Id: <20241018152127.3958436-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This is one of three clang warnings about incompatible enum types
in a conditional expression:

drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: error: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Werror,-Wenum-compare-conditional]
  597 |         inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
      |                                    ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~

The code is correct, so just rework it to avoid the warning.

Fixes: 0dc4b3286125 ("media: mtk-vcodec: venc: support SCP firmware")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index f8145998fcaf..8522f71fc901 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -594,7 +594,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
+	if (is_ext)
+		inst->vpu_inst.id = SCP_IPI_VENC_H264;
+	else
+		inst->vpu_inst.id = IPI_VENC_H264;
+
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
 
 	ret = vpu_enc_init(&inst->vpu_inst);
-- 
2.39.5


