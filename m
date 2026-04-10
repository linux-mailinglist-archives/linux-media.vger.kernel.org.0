Return-Path: <linux-media+bounces-58512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOv0Jd692GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:07:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A23D4808
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 204A7300729E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F54C3B6377;
	Fri, 10 Apr 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eoulJb58"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5103B52FD;
	Fri, 10 Apr 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812033; cv=none; b=Fc/L3Kaa7TVF2JEe2Z32SRavldbvq6CA0MlCzGgyZauLW848pC+CWGjttJWnrzmCV5US18qgSqdj7daY7jaz7LELr8GdgFcD566JwN3mXgTUecoVdbaEO54tm11iQn21qWQJKOKv/NR1ueu0QXPcwS9Zxhd0sAdkRxYW9By7kpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812033; c=relaxed/simple;
	bh=KWpp30BIkU2Caw+MwEOSC1rmBBbcqWX3JuRZtgq9zOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lT4X1ut9aCHMnL8q9utBBdNl0dnxAfLx2912M0pQVB5Web68HA7AUEsGMRjNvNLFZ/oeZz2lN2qGUH4oWS9f24zqn2yvhqjO2wSRSzpaPa5tekzBG8eR9Xk4SPKcp5WH7q1MYeoxIgcF9t4rfCKeFjrs6OT7aNMsLLNFHAEApq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eoulJb58; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B7601C6;
	Fri, 10 Apr 2026 11:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811941;
	bh=KWpp30BIkU2Caw+MwEOSC1rmBBbcqWX3JuRZtgq9zOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eoulJb58oOkuoyuBa7mimUJOgUi04/Ex+IiVSQUV3OKe71ZxQTUi5HJFGzYXb6GJj
	 EyUP8ut3YkdTi75seLJiqsbhn2knIScT3wAMZH8+k1MS6LsOmK4Sc+e3gu+wmhHYCh
	 v6Jpk4Kfo2i4eGmU7Mazx34r4lwLTQMHDAB73L/Y=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:42 +0530
Subject: [PATCH v7 07/18] media: rppx1: Add support for Auto Exposure
 Measurement
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-7-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5958;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=8jmpPdc2e7wTBSIJIQWlIoPOxRX6JctazpX4vNVkn2U=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L1979OVCJPhTr3EXfPypL5LMuUvOPAbJ0PiC
 hC1l7yKjzGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9fQAKCRBD3pH5JJpx
 RVZOD/wLhlnhsg6/Ex0PZ6la32dkixDl9bbnYXRNB2p/fVmPoPBInsoCJQMEXJxwvEp53lb3LDM
 L0WLJ19OIONYnd33Osew3bYnknkse0Qf+C2V/ghraNfhEo1/ABqhwuXjs6zgNZdrFQBimlsPfd+
 ThyhBrWgtiH/q8bWVO4BOM07pDk7NXTxKQCMsHGUMeeXJfqs20HXYPJ4WS9I4r5Mfwf+IQms8WY
 CpCJS9xdek+St/9m++rOjZH27ULjw5BvgxJAoVn2546fhOQ6PygJUZKCdkOM6qkIzuDIpepC9Xw
 48mkcuOdygGdZwdi07q3CpPFI3lVJPUNFSNI/bMPkEUGXoXYQIVRumj7Q4YxF5o1/VW3GP8LjXm
 +11npJzWqBge82quG7P6WBNJ81d06KT/jeFl2zDxRguoXlCbXHcPcbauRy/cKkNJnyYIaL1DMX0
 vPGAfQ+96O+2yO1hKLcUx/sAKd9mvBmvlxmPdMAx5v/cNoyr+OVbsVC3h6MXkmfBpr7Zk+ysgc6
 tM78WA5xgsnREtJyWVdUR+nGYrxhdRTctTHgjhB1PIdfjmYNe9M7jigr9X7sikXSPjuZy6Sel6H
 7PMe0OeIM7rAZvjcrK6RlGNhYtlReEBrY6eN9z9fgz73BuJi/t5zY88xadWHD6ylTBOgC+5CpTO
 XWd58tbdK2ZmJEA==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58512-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 910A23D4808
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the EXM configuration using the
parameter buffer format. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how (and when)
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  4 ++
 drivers/media/platform/dreamchip/rppx1/rpp_stats.c |  4 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c | 82 ++++++++++++++++++++++
 3 files changed, 90 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index de47be81133d067a85f63ba0eb3f8f5e1f0ba2d3..928e4fa196c0e4c0db6a23a89833359645a0941e 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,7 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
+	RPPX1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
 };
 
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
@@ -58,6 +59,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_AEC_MEAS:
+			module = &rpp->pre1.exm;
+			break;
 		default:
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index aac7692d2a61e919e32d7684af86f856ab5a22bb..44edcbc7f2b644d7d569d46707b0b4b94ebe4144 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -15,5 +15,9 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS)
 		if (!rpp_module_call(&rpp->post.wbmeas, fill_stats, &stats->params))
 			stats->meas_type |= RPPX1_STAT_AWB;
+
+	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
+		if (!rpp_module_call(&rpp->pre1.exm, fill_stats, &stats->params))
+			stats->meas_type |= RPPX1_STAT_AUTOEXP;
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
index 0c40300e13ad934c02106d804dd776990983792f..f756f7f882a124850a0908d9efa564443de01b2a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
@@ -10,6 +10,7 @@
 #define EXM_START_REG			0x0004
 
 #define EXM_CTRL_REG			0x0008
+#define EXM_CTRL_EXM_AUTOSTOP		BIT(1) /* HW doc says not supported. */
 #define EXM_CTRL_EXM_UPDATE_ENABLE	BIT(0)
 
 #define EXM_MODE_REG			0x000c
@@ -46,6 +47,87 @@ static int rppx1_exm_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_exm_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_aec_config *cfg = &block->aec;
+	u32 h_offs, v_offs, h_size, v_size;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + EXM_MODE_REG, 0);
+		return 0;
+	}
+
+	/* RGB bayer exposure measurement */
+	write(priv, mod->base + EXM_MODE_REG, 2);
+
+	write(priv, mod->base + EXM_CTRL_REG, EXM_CTRL_EXM_UPDATE_ENABLE |
+	      cfg->autostop ? EXM_CTRL_EXM_AUTOSTOP : 0);
+
+	/*
+	 * Select where to sample.
+	 * 0 - after input acquisition
+	 * 1 - after black level subtraction
+	 * 2 - after input linearization
+	 * 3 - after lens shade correction
+	 * 4 - after white balance gain stage
+	 * 5 - after defect pixel correction
+	 * 6 - after denoising
+	 */
+	write(priv, mod->base + EXM_CHANNEL_SEL_REG, 6);
+
+	if (cfg->mode == RPPX1_EXP_MEASURING_MODE_0) {
+		/* Coefficients for a BT.601 BAYER (from datasheet). */
+		write(priv, mod->base + EXM_COEFF_R_REG, 38);
+		write(priv, mod->base + EXM_COEFF_G_GR_REG, 75);
+		write(priv, mod->base + EXM_COEFF_B_REG, 15);
+		write(priv, mod->base + EXM_COEFF_GB_REG, 75);
+	} else {
+		/* Y = (R + Gr + B + Gb) / 4*/
+		write(priv, mod->base + EXM_COEFF_R_REG, 128);
+		write(priv, mod->base + EXM_COEFF_G_GR_REG, 128);
+		write(priv, mod->base + EXM_COEFF_B_REG, 128);
+		write(priv, mod->base + EXM_COEFF_GB_REG, 128);
+	}
+
+	/*
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be divisible by 10.
+	 */
+	h_offs = cfg->meas_window.h_offs & 0x1ffe;
+	v_offs = cfg->meas_window.v_offs & 0x1ffe;
+	h_size = (cfg->meas_window.h_size - 1) - ((cfg->meas_window.h_size - 1) % 10);
+	v_size = (cfg->meas_window.v_size - 1) - ((cfg->meas_window.v_size - 1) % 10);
+
+	write(priv, mod->base + EXM_H_OFFS_REG, h_offs);
+	write(priv, mod->base + EXM_V_OFFS_REG, v_offs);
+	write(priv, mod->base + EXM_H_SIZE_REG, h_size / 5);
+	write(priv, mod->base + EXM_V_SIZE_REG, v_size / 5);
+
+	/* Set last measurement line for ready interrupt. */
+	write(priv, mod->base + EXM_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
+
+	write(priv, mod->base + EXM_START_REG, 1);
+
+	return 0;
+}
+
+static int rppx1_exm_fill_stats(struct rpp_module *mod,
+				struct rppx1_stat *stats)
+{
+	/* Return measurements at native hardware precision. */
+	for (unsigned int i = 0; i < EXM_MEAN_REG_NUM; i++)
+		stats->ae.exp_mean[i] = rpp_module_read(mod, EXM_MEAN_REG(i));
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_exm_ops = {
 	.probe = rppx1_exm_probe,
+	.fill_params = rppx1_exm_fill_params,
+	.fill_stats = rppx1_exm_fill_stats,
 };

-- 
2.53.0


