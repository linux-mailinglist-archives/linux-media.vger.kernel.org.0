Return-Path: <linux-media+bounces-58521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCLXBO3B2Gk4hwgAu9opvQ
	(envelope-from <linux-media+bounces-58521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:25:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEAC3D4B14
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCDE430EE4CA
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE143C3443;
	Fri, 10 Apr 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P4mMYps5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09D3B9D8F;
	Fri, 10 Apr 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812089; cv=none; b=o+ufIeB9Zlfr9GXrG2Lzm44r5rxMOOnyKge9lK/hlC8ebzSOw7Fv6ji/SELHM5TyzoyYYHQ6F7CKhLOB0PHHWNgMabsnixNgv+AFMROUCFEdzk08ot2vcoXndRZaULaI+bpCOvHQ5FbfCSDiJ7fx1olrPQoTVS3kdF6Fb8eH1xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812089; c=relaxed/simple;
	bh=6zSVpa7osPyTdj61wivs88urSsIsI3kprRtwV3SpmNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ue2wIKT1r7Gwxa6gkhkz2i75Tf1odHfsF2cEvvJhnT0LTfN+qgv8Ey29m9CoHkpQaK7mmRSEQSVepmlcI3eLrKWw9trnOjWLlLiu42Z7NqP1VOi7WbNxuJRp4xyyxkpP6l7zd58F055rifP+GepmOrKBHhzVxAnZrkJ27gCuBxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P4mMYps5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28604D9B;
	Fri, 10 Apr 2026 11:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811997;
	bh=6zSVpa7osPyTdj61wivs88urSsIsI3kprRtwV3SpmNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P4mMYps5tdycE2wsNhXrQEuBxA8ZMrD+u2oLWOsaeLXsYzXZqQ2Kby3B2xe0ItBdb
	 V9QfgUaR1DpavMlrL38QIAnb+0R419h3eJgU24QWBfu1Jbl363/sea1bGAV/7FGfOu
	 pmwSr85E7Dq43ELR9qIkDZbXWXxT/PerlNZvKfeY=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:51 +0530
Subject: [PATCH v7 16/18] media: rppx1: Add support for Bayer Demosaicing
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-16-43cfc6b44f1f@ideasonboard.com>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
In-Reply-To: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4856;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=IvYwnk8sNHdfj8JFx5Stfr9IgbV4a4DOmcLG3epnnJg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2GUqmQU0jy1TgDuvGlKGxmJem1ZzWmkcFQi
 GGstZAvooyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9hgAKCRBD3pH5JJpx
 RVxSEADC99usFm4U+pjrI0YCoqwvUQ7sHkjFI01NztX2DXeZpPOvsJZZ1BlMk+lXx7MM6Fb4isI
 DxuIJMioqBD676uFFLxU64/AJGIIEwWepZ/djncThnAT2LAmz6aHj1s+k+Ndysdba5X8GPKXi64
 0ikgTVHJOKdsCjnmap8ofA1agqmY5RozB8xshBOW6obpG6ARYfPZpd9Jyny82g9NyghTpPrLTEd
 r0vLi+ehJTjtfAp8Ezr5LFBvJjVt7jK9Z2mMGSjBXNb8mm9Ol0nWuaRQ5GC3J4VkThTC3NhdRGU
 xQUdF07qMFV49oDJ0oTsOcONduqZRkRbKjHaDCYzctswVDvwl7Hw46RBJSfJJYYxJxfmau/7EOe
 Hsp2gqKPPOm3eu2OAh29Jn44GQHjQQgDCT9WqSupz4SCEIcN4y46J1vYB6Ptu0poXnU7cgMrigp
 qTU1ulL70N+8A59alXvYto31L9YGQ4eCTOm6NBJg3bQsaqjzfVfsE7BlPpV0QfUTcUFznNnzWJc
 lQOYosCV+mZR7MPkw7RPdGlfDJ+2TP5RNbzj00LOK0GEN41FtxNwU5nI3hDJfOtO//fBwrkeoUd
 lD2a2QkkVpipyQze9kXsGhcqixRjA8V76nWlZsTghEk86kGEBEx0kdBZaNFeacNUmcdXIiLR/oQ
 OAbrZbv9/IzRxeg==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58521-lists,linux-media=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DEAC3D4B14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the Bayer Demosaicing
configuration using the parameter buffer format. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how (and when) configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  7 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_db.c  | 82 ++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 9969517eb1902d1002ea3c7b26a6ca15fa974fa6..07ce9d22265a444038bb8bdc91c129a47cb94e0d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,8 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
+	RPPX1_PARAMS_BLOCK_INFO(FLT, flt),
+	RPPX1_PARAMS_BLOCK_INFO(BDM, bdm),
 	RPPX1_PARAMS_BLOCK_INFO(CTK, ctk),
 	RPPX1_PARAMS_BLOCK_INFO(GOC, goc),
 	RPPX1_PARAMS_BLOCK_INFO(LSC, lsc),
@@ -64,6 +66,11 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_FLT:
+		case RPPX1_PARAMS_BLOCK_TYPE_BDM:
+			/* Both types handled by the same block. */
+			module = &rpp->post.db;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
index 5e233896cfc8b66e7d90770171b77a2fabc3cd9b..c9f6d2d0dc57eec1adc11bef4fca4e1a52afb0e6 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
@@ -39,6 +39,88 @@ static int rppx1_db_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_db_fill_params_flt(struct rpp_module *mod,
+			 const union rppx1_params_block *block,
+			 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_flt_config *cfg = &block->flt;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + FILT_MODE_REG, 0);
+		return 0;
+	}
+
+	/* Native values are at RPP 18-bit precision. */
+	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->thresh_bl0);
+	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->thresh_bl1);
+	write(priv, mod->base + FILT_THRESH_SH0_REG, cfg->thresh_sh0);
+	write(priv, mod->base + FILT_THRESH_SH1_REG, cfg->thresh_sh1);
+
+	/* Native values are at RPP 8-bit precision. */
+	write(priv, mod->base + FILT_FAC_BL0_REG, cfg->fac_bl0);
+	write(priv, mod->base + FILT_FAC_BL1_REG, cfg->fac_bl1);
+	write(priv, mod->base + FILT_FAC_MID_REG, cfg->fac_mid);
+	write(priv, mod->base + FILT_FAC_SH0_REG, cfg->fac_sh0);
+	write(priv, mod->base + FILT_FAC_SH1_REG, cfg->fac_sh1);
+
+	/*
+	 * The lum_weight field is provided in RPP register format:
+	 *
+	 * 31		unused
+	 * 30:28	lum_weight_gain
+	 * 27:24	unused
+	 * 23:12	lum_weight_kink
+	 * 11:0		lum_weight_min
+	 */
+	write(priv, mod->base + FILT_LUM_WEIGHT_REG, cfg->lum_weight);
+
+	write(priv, mod->base + FILT_MODE_REG,
+	      (cfg->chr_v_mode << 4) |
+	      (cfg->chr_h_mode << 6) |
+	      (cfg->grn_stage1 << 8) |
+	      (cfg->mode ? FILT_MODE_FILT_MODE : 0) |
+	      FILT_MODE_FILT_ENABLE);
+
+	return 0;
+}
+
+static int
+rppx1_db_fill_params_bdm(struct rpp_module *mod,
+			 const union rppx1_params_block *block,
+			 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_bdm_config *cfg = &block->bdm;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DEMOSAIC_REG, 0x400);
+		return 0;
+	}
+
+	/* Native threshold is at RPP 16-bit precision. */
+	write(priv, mod->base + DEMOSAIC_REG, cfg->demosaic_th);
+
+	return 0;
+}
+
+static int
+rppx1_db_fill_params(struct rpp_module *mod,
+		     const union rppx1_params_block *block,
+		     rppx1_reg_write write, void *priv)
+{
+	switch (block->header.type) {
+	case RPPX1_PARAMS_BLOCK_TYPE_FLT:
+		return rppx1_db_fill_params_flt(mod, block, write, priv);
+	case RPPX1_PARAMS_BLOCK_TYPE_BDM:
+		return rppx1_db_fill_params_bdm(mod, block, write, priv);
+	}
+
+	return -EINVAL;
+}
+
 const struct rpp_module_ops rppx1_db_ops = {
 	.probe = rppx1_db_probe,
+	.fill_params = rppx1_db_fill_params,
 };

-- 
2.53.0


