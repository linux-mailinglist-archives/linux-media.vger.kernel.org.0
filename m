Return-Path: <linux-media+bounces-58517-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAN8GrrB2Gk4hwgAu9opvQ
	(envelope-from <linux-media+bounces-58517-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:24:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EEB3D4AEC
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A1DD30D868D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3531D3B774D;
	Fri, 10 Apr 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A4x4PO+3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E23BFE31;
	Fri, 10 Apr 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812065; cv=none; b=mbJEK8s8shJgKWdDjVseif1hyD6ZsxH/DYywQ3NnCzFwI2C3UVs0epGq/wJz8UkpEHdy/MfUiVFDd1BAouS1uqJQnZuYB7fmudiOoq+4Cts6iuO3WADJ5lrnunSxVx7q7DMq4W5oDxnZqEKTCD3cNP2CCVoziNi9M8XCa8Bv4xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812065; c=relaxed/simple;
	bh=6buoWP2aU+LW3NjiJqfKPOdRc306lR/GWi1hrki5uNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9sxaMnkrrTvuMU0dZ1Ocrr5YNci4U7s9L2iy2DBBZOuHPsPHZTjp6Z74bE6obI8AueahckZigFi+kEIugNAvmWVy7ZM4TqnsFF3pIK/VCeY/0Kzk8+gxRfPPqalKD6rcxAGxiyN0IgTegRhw/spX6KwSdOYYYdzb1YkEn0PMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A4x4PO+3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B51B1C6;
	Fri, 10 Apr 2026 11:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811973;
	bh=6buoWP2aU+LW3NjiJqfKPOdRc306lR/GWi1hrki5uNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A4x4PO+3BksI0Ggi1m6HP7VhmezL37e6AqlomQWAjYxC+C+sW7tE7BcR64aBd/2rT
	 T0Feuq/N8/Hjio5H8ixpWck+wPVVtfnyW696BZYALD9frniti1JGZwd6TOWerNG6fH
	 62z0fRkSCoHTGNWWqYrz7cw/D3Y42DrCMrasbS+k=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:47 +0530
Subject: [PATCH v7 12/18] media: rppx1: Add support for Color Correction
 Matrix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-12-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4901;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=LPPSWNXXjZ2Lqf4UUK7xtIfIjWSzrBLPqqZuZxAu9hw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2C8gg5Y87NTW7z7zCZUaVdJ6oS+ui1NF0xq
 Q7e8hyqusiJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9ggAKCRBD3pH5JJpx
 RU5ID/9Tifkw2t2LZniLjNiO96ut/dhD+38VN7/qNJhyBxCHeJdglc/r6V/xd+NuLnN7Cltg/u6
 MeBWDG4NqdMHnqJzWRRSgvRZ2urQYjBHjOn7GHw/8mV1gtgmsTHMzHB/wv+qd+5bS+qOpt0nrHe
 QnJT2zxN5xhE+/C4rrV2aW/NGyRltfBnaiEd8r3CB7jQ+FntrHorESVLxELp3RoBYAM79JKwKTD
 YyUUQzWO5X155qohyA3o1TQUfYq7bzN6pS/WX9tFu6/x9p75VTxzSROP9pAcj8cPOE3kq7MKObt
 792ka7CuQjz1Eg3zyq5vsetbi0OWXJxUtg9UqJAg5w9GgqlwEy6lIC4tQUbgCdJ1jEsrOIJ7hmq
 RKFNDjuSC7a0J6C+bbOQB+ifjobsGKgqaz0wlnJm5WDyKddXe7hFD/8F1Eb2QlLHw/2L/ZAuS4T
 orG6CfrgYRiaCy1HEGLoLU+N53YCmAYHJmnRUfvlBcxBsztPFbAWi96Zqqq3PjJi7wxakIbw7Ah
 JbNbUjxSHrzMKiYnIrXnHkfasUb9E3vzwKQNR7awApu9WmDpQ6Fq8yi9gGsr8w1Te0/dfniGs2v
 5Q7BQtVfO6l+/X28YoyQdzLHpIOqny/G6moT77R4JmgpwFjq8YVfyOpJhZsbkhxPLN8R5CnifMs
 J5x/67E8dm7vIoA==
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
	TAGGED_FROM(0.00)[bounces-58517-lists,linux-media=lfdr.de,renesas];
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
X-Rspamd-Queue-Id: C0EEB3D4AEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the Color Correction Matrix
(CTK) configuration using the parameter buffer format. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how (and when) configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  4 ++
 .../media/platform/dreamchip/rppx1/rppx1_ccor.c    | 67 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index c218a509098991943a5333f1df061d1aa5ec53d6..3a8848114bbba670071a7b0871955d82eec76b3f 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,7 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
+	RPPX1_PARAMS_BLOCK_INFO(CTK, ctk),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RPPX1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
 	RPPX1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
@@ -61,6 +62,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_CTK:
+			module = &rpp->post.ccor;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
index 4754b0bbce0a13678a91b2e40f001aed98ddabfc..f614f3fbf41608ab917fa32b23c3a8123fa7d442 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -68,9 +68,76 @@ static int rppx1_ccor_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ccor_fill_params(struct rpp_module *mod,
+		       const union rppx1_params_block *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_ctk_config *cfg = &block->ctk;
+
+	/* If the modules is disabled, configure in bypass mode. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
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
+	 * RPP coefficients are 16-bit signed fixed-point numbers with 4 bit
+	 * integer and 12 bit fractional part ranging from -8 (0x8000) to
+	 * +7.9996 (0x7FFF). 0 is represented by 0x0000 and a coefficient
+	 * value of 1 as 0x1000.
+	 */
+	write(priv, mod->base + CCOR_COEFF_REG(0), cfg->coeff[0][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(1), cfg->coeff[0][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(2), cfg->coeff[0][2]);
+
+	write(priv, mod->base + CCOR_COEFF_REG(3), cfg->coeff[1][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(4), cfg->coeff[1][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(5), cfg->coeff[1][2]);
+
+	write(priv, mod->base + CCOR_COEFF_REG(6), cfg->coeff[2][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(7), cfg->coeff[2][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(8), cfg->coeff[2][2]);
+
+	/*
+	 * Offset for color components correction matrix.
+	 *
+	 * Values are a two's complement integer with one sign bit.
+	 *
+	 * The native params are 24-bit + sign while the RPP can be 12, 20 or
+	 * 24 bit + sign. Figure out how much we need to adjust the input
+	 * parameters.
+	 */
+	const unsigned int shift = 24 - mod->info.wbmeas.colorbits;
+
+	write(priv, mod->base + CCOR_OFFSET_R_REG, cfg->ct_offset[0] >> shift);
+	write(priv, mod->base + CCOR_OFFSET_G_REG, cfg->ct_offset[1] >> shift);
+	write(priv, mod->base + CCOR_OFFSET_B_REG, cfg->ct_offset[2] >> shift);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ccor_ops = {
 	.probe = rppx1_ccor_probe,
 	.start = rppx1_ccor_start,
+	.fill_params = rppx1_ccor_fill_params,
 };
 
 static int rppx1_ccor_csm_start(struct rpp_module *mod,

-- 
2.53.0


