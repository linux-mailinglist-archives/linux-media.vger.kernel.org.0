Return-Path: <linux-media+bounces-58510-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOc2N7i92GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58510-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:07:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD73D47D6
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16D3E300900D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA57F3B19DB;
	Fri, 10 Apr 2026 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="seEjca9o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788073B47EB;
	Fri, 10 Apr 2026 09:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812021; cv=none; b=bEphfIScc5Vyf1ZeFWxl7Wcr/Ufh0cVE4Fu6LLZa/2LVuLM+SCZZxdh2Gg10lDoUJxiiT+GqXz5JElRabmLe9n+a3EwBe5Q06B6+xPW1VelfwkA0Ef6tpOnarnNICTE9QM0jZzvO9sdjIYPCTqYki9VfYIlv845RkAyOdiHaT14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812021; c=relaxed/simple;
	bh=vn9UY9GvLGurJ8a/fCktKxn1reG9veD+j0O7xQaoV+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bo34rzwFXt15w9iUxIVarVVl2ITsx5fRszU1gOYy0HHuIlmJ87q2+06tFq4e0U8T2VlOQXVJq6VIoeI4txVaS96YjvOqyKjTBFaE5FWeciPQd9qBWKsbimYHeqVUd4WS6o0XwSmrtqnMkZfpPTI1963c8tZbw3OJOME7z/ztcVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=seEjca9o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AFDD225;
	Fri, 10 Apr 2026 11:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811928;
	bh=vn9UY9GvLGurJ8a/fCktKxn1reG9veD+j0O7xQaoV+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=seEjca9o+GGBJgC7P40ubbrK+K3TTCjNuZmWiDzxQPOhAV4ljuwqu/q6pHdd00LV2
	 YbwFb+ifDpo2C2dnbWrIyfHL2ZvnE7dzkTT1M/STamK+gk3RAJuu7CQdf1MUzM9V0r
	 ejSpaUBRRxotTzfQ4/cUEWdsG8OP04a2/iTy9pJQ=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:40 +0530
Subject: [PATCH v7 05/18] media: rppx1: Add support for AWB measurement
 parameters and statistics
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-5-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7810;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=vWwkPMX3/gwoLfYKDTeNBQJF5bPI7db/b7A9HXtB82I=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L18quEWVO+g2P4G4wwj9eDXJ8Eywyhxhc2Sy
 1R0dRlejMyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9fAAKCRBD3pH5JJpx
 RWknD/0f6oKeI5YCsfQAyeDoLXmeGlDvp1CKTf27bQFrrwp3cZ/32unoxQOGyL4FkU8qvsixbcU
 Q4YZ9VyBU2k+2ByaQFD+aNXVdK5U+hvLrx4UXWAx8mc+HQX2B2w2sKfqxTNVqAH5d+s3KAqw+ae
 5aCpqy44re+kkmpreymckYX+kSeXAh+cs9RKWqNK25Jbnhoo9zPynvcejUCGeM7B1HY0Cz0eWCz
 sLHo5vxIwbJnkZ4H4OJTvVJRx4sMI5saJ/OmMU21Stp16RbfwXw8hjgTGOvl/Xc10VtLqE8oTqy
 rzPPhTzTxOnBhru8PCNXwiiPGGrk87roT52YqwwKHwyfbe51c3T3tLO3xiVZhKsdLL2u4+qPlph
 F/8R8tmIr+M9jTvKm31RjEqYh/sAIE4/WmuKorRF1spkVq945jzRQbI2TFYF0P+BoWpiOSbiVLC
 2Qi/38Xgxk/blARnme2gHc+UrXZKYQbg7GAW48jiVDiBgqwZjlLOd1Vzgq6Ss8AeIdXObkgOnXr
 dSZtXaUt+gazn5HwyLRo6Iuo40wd5/V7WnrDoAyooliXgxavmhT+Gj4193MKtM9Hxi+c6u/4iOp
 fU81C8VnfoSbLdoqOK2T1X8XITx7XxKS+HiVGbfN8H1B9nyiW99Gr1YydHV+3Br/XH51arRxSwx
 y+JwUcLDw283L8A==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58510-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ragnatech.se:email]
X-Rspamd-Queue-Id: 57BD73D47D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to parse parameter blocks configuring for the
auto white balance measurement window and parameters. As well as
producing the measurements as part of a statistics buffer.

This is the first ISP algorithm added to the RPPX1 driver and exercises
both the parameter and statistics API provided by the base driver.

It uses the parameter writing interface which allows the framework user
to specify how (and when) the configuration are applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |   4 +
 drivers/media/platform/dreamchip/rppx1/rpp_stats.c |   4 +
 .../media/platform/dreamchip/rppx1/rppx1_wbmeas.c  | 118 +++++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 6d2a8d45056ae19c9c05b7e38c1aa013cbe2706b..868a5ce1620e185174b8fade8a9a697826b3fed5 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -16,6 +16,7 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 };
 
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
@@ -50,6 +51,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS:
+			module = &rpp->post.wbmeas;
+			break;
 		default:
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index b62e792b84a105baec904640ec606670b9bbbadd..aac7692d2a61e919e32d7684af86f856ab5a22bb 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -11,5 +11,9 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 	struct rppx1_stat_buffer *stats = buf;
 
 	stats->meas_type = 0;
+
+	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS)
+		if (!rpp_module_call(&rpp->post.wbmeas, fill_stats, &stats->params))
+			stats->meas_type |= RPPX1_STAT_AWB;
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
index 3d197d914d0710128a61842ac3db54ddcce8c45e..e6a3b2eece1576a2daf0df4ca243d5a1e93ef662 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
@@ -56,6 +56,124 @@ static int rppx1_wbmeas_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_wbmeas_fill_params(struct rpp_module *mod,
+			 const union rppx1_params_block *block,
+			 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_awb_meas_config *cfg = &block->awbm;
+	/*
+	 * The native params are 24-bit while the RPP can be 8, 20 or 24 bit.
+	 * Figure out how much we need to adjust the input parameters.
+	 */
+	const unsigned int shift = 24 - mod->info.wbmeas.colorbits;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_MEAS_PROP_REG, 0);
+		return 0;
+	}
+
+	/* Program measurement window. */
+	write(priv, mod->base + AWB_MEAS_H_OFFS_REG,
+	      cfg->awb_wnd.h_offs);
+	write(priv, mod->base + AWB_MEAS_V_OFFS_REG,
+	      cfg->awb_wnd.v_offs);
+	write(priv, mod->base + AWB_MEAS_H_SIZE_REG,
+	      cfg->awb_wnd.h_size);
+	write(priv, mod->base + AWB_MEAS_V_SIZE_REG,
+	      cfg->awb_wnd.v_size);
+
+	/* Set number of frames to sample. */
+	write(priv, mod->base + AWB_MEAS_FRAMES_REG, cfg->frames);
+
+	if (cfg->awb_mode == RPPX1_AWB_MODE_YCBCR) {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->awb_ref_cb >> shift);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->awb_ref_cr >> shift);
+		write(priv, mod->base + AWB_MEAS_MAX_Y_REG,
+		      cfg->max_y >> shift);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->min_y >> shift);
+		write(priv, mod->base + AWB_MEAS_MAX_CSUM_REG,
+		      cfg->max_csum >> shift);
+		write(priv, mod->base + AWB_MEAS_MIN_C_REG,
+		      cfg->min_c >> shift);
+
+		/*
+		 * Match RkISP1 conversion, documented as
+		 *  Y = 16 + 0.2500 R + 0.5000 G + 0.1094 B
+		 *  Cb = 128 - 0.1406 R - 0.2969 G + 0.4375 B
+		 *  Cr = 128 + 0.4375 R - 0.3750 G - 0.0625 B
+		 *
+		 * Note map Y to G. Matrix is GBR, not RGB documented for RPPX1.
+		 */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x0800);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x01c0);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0400);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0xfb40);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x0700);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0xfdc0);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0xfa00);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0xff00);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x0700);
+
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00100000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00800000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00800000);
+
+		write(priv, mod->base + AWB_MEAS_PROP_REG,
+		      cfg->enable_ymax_cmp ? AWB_MEAS_PROP_YMAX : 0 |
+		      AWB_MEAS_PROP_AWB_MODE_ON);
+	} else {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->awb_ref_cb >> shift);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->awb_ref_cr >> shift);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->min_y >> shift);
+
+		/* Values from datasheet to map G to Y, B to Cb and R to Cr. */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x1000);
+
+		/* Values from datasheet. */
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00000000);
+
+		write(priv, mod->base + AWB_MEAS_PROP_REG,
+		      AWB_MEAS_PROP_MEAS_MODE_RGB |
+		      AWB_MEAS_PROP_AWB_MODE_ON);
+	}
+
+	return 0;
+}
+
+static int rppx1_wbmeas_fill_stats(struct rpp_module *mod,
+				   struct rppx1_stat *stats)
+{
+	struct rppx1_awb_meas *meas = &stats->awb.awb_mean[0];
+
+	/* Return measurements at native hardware precision. */
+	meas->cnt = rpp_module_read(mod, AWB_MEAS_WHITE_CNT_REG);
+	meas->mean_y_or_g = rpp_module_read(mod, AWB_MEAS_MEAN_Y_G_REG);
+	meas->mean_cb_or_b = rpp_module_read(mod, AWB_MEAS_MEAN_CB_B_REG);
+	meas->mean_cr_or_r = rpp_module_read(mod, AWB_MEAS_MEAN_CR_R_REG);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_wbmeas_ops = {
 	.probe = rppx1_wbmeas_probe,
+	.fill_params = rppx1_wbmeas_fill_params,
+	.fill_stats = rppx1_wbmeas_fill_stats
 };

-- 
2.53.0


