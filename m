Return-Path: <linux-media+bounces-19041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66A98EF3B
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B214E1C21E7D
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2959F183CA2;
	Thu,  3 Oct 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="FP3tqZ5K"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32E174EFC;
	Thu,  3 Oct 2024 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727958508; cv=none; b=fQh3wFZ9+CZHz75hg/uvoyfE7Hv1HvNyXUZV0p0gjcccwxm/U6RFyoqCqecK+c403YkhbeUZKFgRjdMPt3CWpK/TJDFpiZGukKjfUvMQLQ3SIVxHNBxAD7PIsFT79M/6aAxNc/YhWoHQbJYcD7rhyV8rK2TzJTMF0D/rBwQaZkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727958508; c=relaxed/simple;
	bh=RCuPHUTcu5fp2dUKq693o0lcKV73plIhbtpzkEnTVo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TdRCKxb/ya1RneA/u6R1LTJaM7yIVwMq+JWC3WyXTqk6B44owWMSRMzZp72bx6UXR9SDgFUJzF20l9Tgu9MhBidk9p3XulW/FF+vpCF3uuDAcUFyoqS/KjkoJwquGD4+KICI3nfs2gWWuP7J0EHVTXRpDSBFTYJuoCKMGYD/VAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=FP3tqZ5K; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6156E88B11;
	Thu,  3 Oct 2024 14:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727958504;
	bh=zoIAJLEiK4YmLoPXQRr6ovZoiJ26IaJ89TksduxipBE=;
	h=From:To:Cc:Subject:Date:From;
	b=FP3tqZ5KKqK3sTPPMjdxCUyZl85xnj9/m+h21CpJOnhIOAe+fnoixlPji958R3JUl
	 AGGnCgqTOKWrFEpJD5O0R/QNKnSJREMhv033IvijcGa/fYdoKj18ShcQpGiB5UhCUy
	 zRSz6fbkJpbPPalHm1h0mxv+wkdLFboj2/dH1+X5PIoPHYoXk9T6SVYOCR6dPjqj1w
	 yPWRjZJmbOIPTBGIKMNzHGmvwkQalPJNSC/QINJNaAKZ2n4xnA6nI2w964s+hGpYcx
	 CiXwd+RjYhx4sm7yywjmON5/P4xtXjSqeG0w3axQrzZtNTRllXxX0265/lPhbu5NmQ
	 9H//+hcDkGSkg==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] gpu: ipu-v3: vdic: Drop unused prepare_vdi_in_buffers()
Date: Thu,  3 Oct 2024 14:27:30 +0200
Message-ID: <20241003122813.44746-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

This function is unused and unlikely to be used in the near future.
Remove it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev
---
 drivers/staging/media/imx/imx-media-vdic.c | 54 ----------------------
 1 file changed, 54 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 09da4103a8dbe..86f2b30cb06cb 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -180,60 +180,6 @@ static int vdic_get_ipu_resources(struct vdic_priv *priv)
 	return ret;
 }
 
-/*
- * This function is currently unused, but will be called when the
- * output/mem2mem device at the IDMAC input pad sends us a new
- * buffer. It kicks off the IDMAC read channels to bring in the
- * buffer fields from memory and begin the conversions.
- */
-static void __maybe_unused prepare_vdi_in_buffers(struct vdic_priv *priv,
-						  struct imx_media_buffer *curr)
-{
-	dma_addr_t prev_phys, curr_phys, next_phys;
-	struct imx_media_buffer *prev;
-	struct vb2_buffer *curr_vb, *prev_vb;
-	u32 fs = priv->field_size;
-	u32 is = priv->in_stride;
-
-	/* current input buffer is now previous */
-	priv->prev_in_buf = priv->curr_in_buf;
-	priv->curr_in_buf = curr;
-	prev = priv->prev_in_buf ? priv->prev_in_buf : curr;
-
-	prev_vb = &prev->vbuf.vb2_buf;
-	curr_vb = &curr->vbuf.vb2_buf;
-
-	switch (priv->fieldtype) {
-	case V4L2_FIELD_SEQ_TB:
-	case V4L2_FIELD_SEQ_BT:
-		prev_phys = vb2_dma_contig_plane_dma_addr(prev_vb, 0) + fs;
-		curr_phys = vb2_dma_contig_plane_dma_addr(curr_vb, 0);
-		next_phys = vb2_dma_contig_plane_dma_addr(curr_vb, 0) + fs;
-		break;
-	case V4L2_FIELD_INTERLACED_TB:
-	case V4L2_FIELD_INTERLACED_BT:
-	case V4L2_FIELD_INTERLACED:
-		prev_phys = vb2_dma_contig_plane_dma_addr(prev_vb, 0) + is;
-		curr_phys = vb2_dma_contig_plane_dma_addr(curr_vb, 0);
-		next_phys = vb2_dma_contig_plane_dma_addr(curr_vb, 0) + is;
-		break;
-	default:
-		/*
-		 * can't get here, priv->fieldtype can only be one of
-		 * the above. This is to quiet smatch errors.
-		 */
-		return;
-	}
-
-	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys);
-	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, curr_phys);
-	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, next_phys);
-
-	ipu_idmac_select_buffer(priv->vdi_in_ch_p, 0);
-	ipu_idmac_select_buffer(priv->vdi_in_ch, 0);
-	ipu_idmac_select_buffer(priv->vdi_in_ch_n, 0);
-}
-
 static int setup_vdi_channel(struct vdic_priv *priv,
 			     struct ipuv3_channel *channel,
 			     dma_addr_t phys0, dma_addr_t phys1)
-- 
2.45.2


