Return-Path: <linux-media+bounces-58523-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NkXIKC+2GnYhggAu9opvQ
	(envelope-from <linux-media+bounces-58523-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:10:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A303D48E7
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42C613023A5E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED1F3BB9E1;
	Fri, 10 Apr 2026 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yp2zjE5b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3FE3BA248;
	Fri, 10 Apr 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812102; cv=none; b=ZgygT8uSQDITYfpEokzP2d7eqGjYfBGgDEZv3ME3WYxVQveZzrQydNmNAuwAm6/Ca06+z27I+vuFRnVi6zfWOqzmHNiSxy4AgJVycVRammYPoeZ5M9kowES/y1/Pca4hlhVPKjYqRzIQcGQeHLjwjLB8VLnRMOKHGeO90hVEQgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812102; c=relaxed/simple;
	bh=S+1tavoKcb5pn8pKhwsZkbWALgXNQ8tk7//yEkIj+y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0d0klgDdFd8nDTBubprUJPh8LZ5DbX6eeVF6qNSWejNgw4Vsj0Equh3ROkFgNIptvn5asT9HCDjhmc5ag1RfxsD1yNhVyDHScqSww7mhims8MzoknKxNTVUQMtzWDgomvFvTOJYDGG+Ote+93ojcgyiaFZ5PcKwft4dijFNYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yp2zjE5b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7645D1C6;
	Fri, 10 Apr 2026 11:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775812010;
	bh=S+1tavoKcb5pn8pKhwsZkbWALgXNQ8tk7//yEkIj+y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yp2zjE5baAewLPhfJz5pIXs9YhVX2gySfyuijN/s+J+e6DPD54X5liKlMQTfFfO/Q
	 x+R4lsJmyMuSckdZOWWsyzBjkEfBkre45pwAvtLiTXnNZ8SdVHODXSNePQ9P2z9+SC
	 wZOE4Q4biwdSvLpFqX+y/cb4z3uFqJ0ok20349pk=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:53 +0530
Subject: [PATCH v7 18/18] media: rppx1: Add support for Sensor (Gamma)
 Linearization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rppx1-v7-18-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3142;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=S+1tavoKcb5pn8pKhwsZkbWALgXNQ8tk7//yEkIj+y4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2IHCQH5M+WIlZZ/k7xPPCmr3edwI717IDVs
 p0avAEnQ9OJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9iAAKCRBD3pH5JJpx
 RdDdEADSgipgBfhIwo6ga/9Or1O3ggUJYB+nEoKQc1uiusWiVq3/3EXO2XBsHkzaZIYSH0hEtAR
 jpbHW8bL3mYHInfIxXcmgQuy5It+jZFwVVJNt2tR/fNKcvxEePNltXmDxepzqdBlEBeeTdBVSnr
 dAT+CuKVr2y5McWxfNjR+qxNDB4hXmXU0GoIwzR2XE7p4b6I2RxuYA1mQEh6SdR6xO/VmYq4+Gm
 cyH//PiBcHNkEzd2TqSnkq2/fGQFv4OHwS6BE2dWsTE8nFbofvtkAncwaDfxgH0uwEWXo1qRlxr
 33wzjljz4PxlloqEPwEtTqW4X8BaYoVY9IUPtzMfYnr5CElbGBrozITNiWfUHIgCKSw7XQXZV6L
 OrLRC9hyPhRUsQC/Li8maqMWj4OGocTD3ADqimxtFG0D1Qpr6sJdbWrXsCRHhUOfDlFl6+SocgH
 3hEGZhlnyspCrs1ayZjX+EbWQhRsBMajWfMPHnzaqxBC4mYXrHNwj+kf3rSDHtYnBVieeNJ3TF3
 m5vrIqIQUu7dCA7M2eEK2cV8N08e0BvghZwmj6obkXp1v/yIYzhzI8AKX3qExrbuHQH3H8xRfXb
 yB/97G2SEw0QJWewGaU4ioVs/PBBMsTHKSnxelSV/iYcMPxcsfamekNNcP7LrNp0KaOonL0oK4O
 0IaU3ai9vE6NkNw==
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
	TAGGED_FROM(0.00)[bounces-58523-lists,linux-media=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02A303D48E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the Sensor (Gamma)
Linearization configuration using the parameter buffer format. It uses
the RPPX1 framework for parameters and its writer abstraction to allow
the user to control how (and when) configuration is applied to the
RPPX1.

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  4 +++
 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c | 31 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 2847647dcf42d7975dee446c8e29c87828db746c..696688856540a88e28ec6ccaa9cd436c64cc9edc 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -17,6 +17,7 @@
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS, bls),
+	RPPX1_PARAMS_BLOCK_INFO(LIN, lin),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RPPX1_PARAMS_BLOCK_INFO(FLT, flt),
 	RPPX1_PARAMS_BLOCK_INFO(BDM, bdm),
@@ -65,6 +66,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_BLS:
 			module = &rpp->pre1.bls;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_LIN:
+			module = &rpp->pre1.lin;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
index e4b0a7be76656c4bc04408500c7ca60709bebf79..24c005ba9b9287504113bbea83f8a076f88df423 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
@@ -54,7 +54,38 @@ static int rppx1_lin_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int rppx1_lin_fill_params(struct rpp_module *mod,
+				 const union rppx1_params_block *block,
+				 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_lin_config *cfg = &block->lin;
+	const unsigned int shift = 24 - mod->info.lin.colorbits;
+
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + LIN_ENABLE_REG, 0);
+		return 0;
+	}
+
+	write(priv, mod->base + LIN_DX_LO_REG, cfg->xa_pnts.gamma_dx[0]);
+	write(priv, mod->base + LIN_DX_HI_REG, cfg->xa_pnts.gamma_dx[1]);
+
+	for (unsigned int i = 0; i < LIN_SAMPLES_NUM; i++) {
+		write(priv, mod->base + LIN_R_Y_REG(i),
+		      cfg->curve_r.gamma_y[i] >> shift);
+		write(priv, mod->base + LIN_G_Y_REG(i),
+		      cfg->curve_g.gamma_y[i] >> shift);
+		write(priv, mod->base + LIN_B_Y_REG(i),
+		      cfg->curve_b.gamma_y[i] >> shift);
+	}
+
+	if ((cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
+		write(priv, mod->base + LIN_ENABLE_REG, LIN_ENABLE_GAMMA_IN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_lin_ops = {
 	.probe = rppx1_lin_probe,
 	.start = rppx1_lin_start,
+	.fill_params = rppx1_lin_fill_params,
 };

-- 
2.53.0


