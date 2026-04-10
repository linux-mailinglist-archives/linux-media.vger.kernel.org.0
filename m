Return-Path: <linux-media+bounces-58518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFO1CMbB2Gk4hwgAu9opvQ
	(envelope-from <linux-media+bounces-58518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:24:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222B3D4AF4
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C13530DD023
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B29E3B47FD;
	Fri, 10 Apr 2026 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rOJ99KxN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677963B47DC;
	Fri, 10 Apr 2026 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812071; cv=none; b=rJybrJSKiO798ktBKha3+HAlDnQeYe6LpPOu6fAYC7T/ofocRrtpMmsASESeV4il8Ycol/L2V7ETqKJuYqXrD3UwAm+MiFFmYdJ9r0EB5qZGquxUdH8+/NxpitQIpiFv1wRLSjFXnMkbj9MDe1xmEnAr6TZLQdKNITzrlORtWrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812071; c=relaxed/simple;
	bh=oJJ91FTqDfqYqli6MRmKHQp90tZP1JdL2+fTjum3Te0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHqKydBm+ccDS5uZnFEPNPqBKbYThsnvcs9jmBKy48i6KrmSXgeSAAJ6i3VaIUsHee82kqHdQzlR7wyENDPHKxWDK7DGM2/3AgcokDZBupw24hNf3QfgL3yfYy4ve+WyOtPW2SYuYPZrejAry9evBU+i4pT8y47AiqxUFR2Lryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rOJ99KxN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EF5F838;
	Fri, 10 Apr 2026 11:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811979;
	bh=oJJ91FTqDfqYqli6MRmKHQp90tZP1JdL2+fTjum3Te0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rOJ99KxNHshvoFJwfvRTDC/5Ik9GclWugP7m51FB5y/qKeyWMTgyNLrIWKk+ocIr9
	 rAoz4g4oETY/XXQyzGVlQlqWjOdKW9YbHBOUuWDXdpGkRWTrXfLR7cwfoAsOabI0pL
	 LZnNMYbFvFJKaEMBVuO3c/AIQexdqtMWwFsPxGL4=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:48 +0530
Subject: [PATCH v7 13/18] media: rppx1: Add support for Lens Shade
 Correction
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-13-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8460;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=GoUVnAJWiFTdWCoYs5Jf/jfNxpnPylDxq/Y/BqWlZYU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2Dvxol0UDzDedAtTQ+dS9ul8ICdCVSJBQLo
 QaLbOJzgMaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9gwAKCRBD3pH5JJpx
 RYV0D/kBxO5D2XPTRVGDjO2Y+36YH7mTXZb3rtaDM634Rg1DSbyoZauc4U0G97C47Bz6eu/yzo/
 +9DjKb51XsE6ucYgrLoVOjnoGH8uH350ZDzi/qyV8UY8pE6C5tXjLrmNV8xPdk1rPtcWQA+8DUw
 FbrmJNjG5z5q7OhLbTtB+kLTcr+PSjSJ7xyxApRAV/g+RCL/6ofW0JePF9yT7IDng8LZqve4kwF
 cY0UsqkQy2dEUXvX79UznSLF3rmnpnh+mp+O8vDlpsz+eu0/PX4/QqraCm5B5i++F3YSMcWhq/8
 ZdMRnTTWrEQYIQGhm+vetf4iMbb/shr/pjDY/zbR6JobUDYijuDEjJ2hRutCrnfOWnXJZm0uRKn
 GlBG77zln8CuiVKkRmVXNKjc8Q5gl+2HsMFWC6gwuRfdbH068av1nDNSwcvXjVlVggJUbaIasco
 65yklbDa/vKy72XHCYXi1lp0L0AQtXnHOVzIa9ZiCPXiVpmLeoxzOA01OAK3bJBiayuSBMUAdqk
 Z8zA4jfo7oBLWNB0l+PwAqIfK1URp4qpJmUcjw2EShbcsxxt72FQZi6CwYZOlkyIMYy1v19+ji/
 H0/xUW3+q302OtzCNLH+Dd1afrKhYlOvnEW2YngEy00f+cze/fou6thoVqNFgQsd+WaEL4edcFw
 WC74Cl6BuxYR8tA==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58518-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9222B3D4AF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the Lens Shade Correction (LSC)
configuration using the parameter buffer format. It uses the RPPX1
framework for parameters and  its writer abstraction to allow the user
to control how (and when) configuration is applied to the RPPX1.

The parameters buffer only describes one quadrant of the lens, this is
due to the RkISP1 hardware only allowing one quadrant to be programmed
to hardware, which was copied for RPPX1. The hardware then extrapolates
this to the other three quadrants of the lens. For RPP all four
quadrants are individually programmable.

To compensate for the driver need to extrapolate all four quadrants from
the parameters buffer information.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |   4 +
 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c | 126 +++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 3a8848114bbba670071a7b0871955d82eec76b3f..386c36fe0e19fa52d53691d77405d31d844c5445 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,7 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RPPX1_PARAMS_BLOCK_INFO(CTK, ctk),
+	RPPX1_PARAMS_BLOCK_INFO(LSC, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RPPX1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
 	RPPX1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
@@ -65,6 +66,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_LSC:
+			module = &rpp->pre1.lsc;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
index e8acdf74495633790e2614a9985a47fa92df4eeb..4cba2d075bec6390ecc5bffb25eeba443213f52e 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -54,6 +54,10 @@
 #define LSC_TABLE_SEL_REG	0x00a8
 #define LSC_STATUS_REG		0x00ac
 
+#define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
+#define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
+#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
+
 static int rppx1_lsc_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -63,6 +67,128 @@ static int rppx1_lsc_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_lsc_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_lsc_config *cfg = &block->lsc;
+	const __u16 *v;
+
+	/* Always disable module as it needs be disabled before configuring. */
+	write(priv, mod->base + LSC_CTRL_REG, 0);
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		return 0;
+
+	/*
+	 * Program the color correction sectors.
+	 *
+	 * There are two tables to one can program and switch between. As the
+	 * RPPX1 supports preparing a buffer of commands to be applied later
+	 * only use table 0. This works as long as the ISP is not used in
+	 * inline-mode.
+	 *
+	 * For inline-mode support using DMA for configuration is not possible
+	 * so this is not an issue, but needs to be address if inline-mode
+	 * support is added to the driver.
+	 */
+
+	/* Start writing at beginning of table 0. */
+	write(priv, mod->base + LSC_R_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_GR_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_B_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_GB_TABLE_ADDR_REG, 0);
+
+	/* Program data tables. */
+	for (unsigned int i = 0; i < RPPX1_LSC_SAMPLES_MAX; i++) {
+		const __u16 *r = cfg->r_data_tbl[i];
+		const __u16 *gr = cfg->gr_data_tbl[i];
+		const __u16 *b = cfg->b_data_tbl[i];
+		const __u16 *gb = cfg->gb_data_tbl[i];
+		unsigned int j;
+
+		for (j = 0; j < RPPX1_LSC_SAMPLES_MAX - 1; j += 2) {
+			write(priv, mod->base + LSC_R_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(r[j], r[j + 1]));
+			write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(gr[j], gr[j + 1]));
+			write(priv, mod->base + LSC_B_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(b[j], b[j + 1]));
+			write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(gb[j], gb[j + 1]));
+		}
+
+		write(priv, mod->base + LSC_R_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(r[j], 0));
+		write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(gr[j], 0));
+		write(priv, mod->base + LSC_B_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(b[j], 0));
+		write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(gb[j], 0));
+	}
+
+	/* Activate table 0. */
+	write(priv, mod->base + LSC_TABLE_SEL_REG, 0);
+
+	/*
+	 * Program X- and Y- sizes, and gradients.
+	 *
+	 * The RPP ISP can describe each quarter of the lens individually, this
+	 * differs from the Rk1ISP which can only describe one quarter of lens
+	 * with software and then extrapolates the other three.
+	 *
+	 * To adjust for this extrapolate the three missing quadrants using
+	 * software for the RPP ISP.
+	 */
+
+	v = cfg->x_grad_tbl;
+	write(priv, mod->base + LSC_XGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->y_grad_tbl;
+	write(priv, mod->base + LSC_YGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->x_size_tbl;
+	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->y_size_tbl;
+	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	/* Enable module. */
+	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_lsc_ops = {
 	.probe = rppx1_lsc_probe,
+	.fill_params = rppx1_lsc_fill_params,
 };

-- 
2.53.0


