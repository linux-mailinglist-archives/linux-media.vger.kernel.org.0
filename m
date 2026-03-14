Return-Path: <linux-media+bounces-55814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HAHIlnetWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:16:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2659D28F462
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 467D530488EE
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51BF34EF11;
	Sat, 14 Mar 2026 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="zEc3f6Il";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qqXX4/U8"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85EC3375D5;
	Sat, 14 Mar 2026 22:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526276; cv=none; b=Cs8xgzPjURmJAXCensuswlxT3/BaVpMti2vIcTlD39PZ/ZbHKq9YJ1SwoJfcl+6rrVLZTOB0+8wholJsjvrZ1/PFiAnPWDsHLDz8gCnmwJKmeyQKTnvnFtRr/IZpDAXAviNinWwvOPoyvIQoLTasnw0DO0QbqDQaGv5IvSot9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526276; c=relaxed/simple;
	bh=XkJG7jWQ7DcJZYGY/0L9O5vzQNezsYVYjwE7o3MovaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h5/HtxMozow55zeoAvgJrlUafbGfnDO9rnFeanY1ImCECUy2Ff2apbg8mbX6zYvoHEpEMId+JAWdPQjNoVUFKHAwAcuLpWIB1/l/X+V2XZdDKnDZu2iBr22TCZqzUSxJV8DI6U0npDW/lBB9PVUX3d4I2vT7dBtLupXFyqQ79jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=zEc3f6Il; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qqXX4/U8; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1995014001B3;
	Sat, 14 Mar 2026 18:11:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 14 Mar 2026 18:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526266;
	 x=1773612666; bh=iwnc4Sa9AN5zgfnbopLMibZVmnZb3rbPAjuiWKstNto=; b=
	zEc3f6IlNMwcb6XfF36pjqs+ZTPBwEUjDkvpNKyV/JuXz6+bVrYWRmy4u47hxvG1
	KJgtzz6aXDTxrLxuQZaGK+2/1xMYYsmK3RkYMN8ZSi0yRdIsK+cyQUST7Yc9N2eo
	B2CpC/BdXZkxVgdIQRUtp1eQZSOE3lMxwkYXwjTsFxOTrVCnvX+x58wQP6vvy8ny
	EbFiOEPOa85rn51rwRAbxQ55GKw49StGCgBCcavZuesbh+eAtcdbIV5eyHp4qI6r
	Lcnp5uEIgalHwdEwSE8gYeSsxvicQP6kdnrl0ZgDI/tlCIFsyr/ZFVgrzr5aJT+z
	yAQJBeLDtl85eQALwGa/+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526266; x=
	1773612666; bh=iwnc4Sa9AN5zgfnbopLMibZVmnZb3rbPAjuiWKstNto=; b=q
	qXX4/U8cdo3IDUmMCr0f7CfWE3LjCjzeewo7c8q9UxJpkhdCGUiInwjCY6sDF+eA
	Eb0YIdVRIOMRKbgRZ/46tLfiJIznFojD4kScQMPpvo0s+3L1NtFleietTS2QaV+L
	6AifPHJ7prH8ltbmqDzzRbBT0bEPyoDRVAmZ76FGBT7NlGKJYr5YDIfpIAr3cQVE
	yQmREy9c7FiqY+bH4Pq9vMRGvGbQ5eu86wCCwXsLBxItfVFsue2oIMWrWXSno2FA
	RHekQUdLhdIuKRIBHvlI9CFYgA1RbXZ0Ou/ypQGktvGRCxguHhvkKcYrYo/kPAoF
	PZFgLcU5S/nuDnp7xhmyw==
X-ME-Sender: <xms:-ty1aVP27qr1qYpWbFPRlU2rFcEWKWGIYY14di-7WEVOfMuW0kPhGg>
    <xme:-ty1aYYpM5kiFK0uFmxhvpy9WPJqZv-P_gXvEMGgO_ugQcZXdAz4AD5hotBOTEuNc
    5dHG2tjTgFm8fh0ATI3nZsPlDOKExm26n9qBY-D2hYMATJfZxX8WxY>
X-ME-Received: <xmr:-ty1aU8OpnYtAP3C7dGT6Dvlj8NUrr7sz4upqbN2ITuDPBM_VtOgKwuEAZ9SNTxRq07-Pi69WkDN_jFIt1d50ANtvCGWzk4pYoDv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtg
    homhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhrtghpthhtohep
    mhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrgh
X-ME-Proxy: <xmx:-ty1aZT4LuAzQFlXL2-WO42b5920f1otdtTlfsiRh1AsM8eqEP_Y-Q>
    <xmx:-ty1aecHa5v7e3qgqT5nHmSU6yZhZ33UBcXE_LVmCEzZwbspiSca6g>
    <xmx:-ty1abToFCGk7Kt3Odib35gEl8UhjD1MnRblVBDWeDiFnByQYYx2Yg>
    <xmx:-ty1aaKkBtmGm8MwoezIGflStTeovO9tf8rzKmIk1xQPN05Wpin1Zg>
    <xmx:-ty1aRxFW-fjPl8NNksia7DRiTgyB3tXWc5oj-Pi8ABwCKh2bpu09Ekd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:11:05 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v6 08/12] media: rppx1: Add support for Color Correction Matrix
Date: Sat, 14 Mar 2026 22:59:40 +0100
Message-ID: <20260314215944.3674865-9-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55814-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,mailbox.org:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 2659D28F462
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the Color Correction Matrix
(CTK) configuration using the RkISP1 parameter buffer format. It uses
the RPPX1 framework for parameters and  its writer abstraction to allow
the user to control how (and when) configuration is applied to the
RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
* Changes since v5
- Fix commit message.
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  4 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 74 +++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index c1917585e19b..c807ccfef628 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,7 @@ static const struct v4l2_isp_params_block_type_info
 rkisp1_ext_params_blocks_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(BLS, bls),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
+	RKISP1_PARAMS_BLOCK_INFO(CTK, ctk),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RKISP1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
 	RKISP1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
@@ -61,6 +62,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
+			module = &rpp->post.ccor;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
index 4754b0bbce0a..0ccaed8ce55d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -68,9 +68,83 @@ static int rppx1_ccor_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ccor_param_rkisp1(struct rpp_module *mod,
+			const union rppx1_params_rkisp1_config *block,
+			rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_ctk_config *cfg = &block->ctk;
+
+	/* If the modules is disabled, configure in bypass mode. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(2), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(5), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(8), 0x1000);
+
+		write(priv, mod->base + CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_B_REG, 0x00000000);
+
+		return 0;
+	}
+
+	/*
+	 * Coefficient n for color correction matrix.
+	 *
+	 * RkISP1 coefficients are 11-bit signed fixed-point numbers with 4 bit
+	 * integer and 7 bit fractional part, ranging from -8 (0x400) to +7.992
+	 * (0x3FF). 0 is represented by 0x000 and a coefficient value of 1 as
+	 * 0x080.
+	 *
+	 * RPP gains are 16-bit signed fixed-point numbers with 4 bit integer
+	 * and 12 bit fractional part ranging from -8 (0x8000) to +7.9996
+	 * (0x7FFF). 0 is represented by 0x0000 and a coefficient value of 1 as
+	 * 0x1000.
+	 *
+	 * Map the RkISP1 value range by left shifting by 5.
+	 */
+	write(priv, mod->base + CCOR_COEFF_REG(0), cfg->config.coeff[0][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(1), cfg->config.coeff[0][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(2), cfg->config.coeff[0][2] << 5);
+
+	write(priv, mod->base + CCOR_COEFF_REG(3), cfg->config.coeff[1][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(4), cfg->config.coeff[1][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(5), cfg->config.coeff[1][2] << 5);
+
+	write(priv, mod->base + CCOR_COEFF_REG(6), cfg->config.coeff[2][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(7), cfg->config.coeff[2][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(8), cfg->config.coeff[2][2] << 5);
+
+	/*
+	 * Offset for color components correction matrix.
+	 *
+	 * Values are a two's complement integer with one sign bit.
+	 *
+	 * The RkISP params are 11-bit while the RPP can be 12, 20 or 24 bit,
+	 * all values are excluding the sign bit. Figure out how much we need
+	 * to adjust the input parameters.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 12 + 1;
+
+	write(priv, mod->base + CCOR_OFFSET_R_REG, cfg->config.ct_offset[0] << shift);
+	write(priv, mod->base + CCOR_OFFSET_G_REG, cfg->config.ct_offset[1] << shift);
+	write(priv, mod->base + CCOR_OFFSET_B_REG, cfg->config.ct_offset[2] << shift);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ccor_ops = {
 	.probe = rppx1_ccor_probe,
 	.start = rppx1_ccor_start,
+	.param_rkisp1 = rppx1_ccor_param_rkisp1,
 };
 
 static int rppx1_ccor_csm_start(struct rpp_module *mod,
-- 
2.53.0


