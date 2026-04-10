Return-Path: <linux-media+bounces-58520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD8RI26+2GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:10:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 273ED3D48A5
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BD4B30068E6
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328DD3C3428;
	Fri, 10 Apr 2026 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WmtCsu/g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F853B7B98;
	Fri, 10 Apr 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812083; cv=none; b=XUe+OqLxvzm2x28z6vObDfb+BPtuIJ5N2z4QqN68VGew06E/4JnDEpilnJZCOvpcH/pXj9APKUHO6SCie3fChnobSNrUZSrLNJp86NVgO1qSbAB+T+j8I4wE1AceAsP0j4JbQBP6HVAyWn2nRNJ8YnHu2Y2WvL0iXA/BhEyAyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812083; c=relaxed/simple;
	bh=Rd16+HCfStxszF7sC5M99mJ4ALPMQwMOetuMOO6grlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXV9LB73fQ4H3WXm5iZlS8Wx4JSk0hBB1E2mPdPz5OtkMEkywHHUOe00xedGkXiL3UJLPV/1CnUD6BMWclP2wdFEyRQsqLdfvTDqxmy6xMy3i+wk+dx8pDrTre/G6xu7+yC+TaOd0vb+xCtA84RdNrWUuAxR+bMtFSkAP9D7/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WmtCsu/g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62C68236;
	Fri, 10 Apr 2026 11:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811991;
	bh=Rd16+HCfStxszF7sC5M99mJ4ALPMQwMOetuMOO6grlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WmtCsu/ggTTkQDS6VnsKDNM/fbmtyx+Uu3++HbvFoLVTTHk8QjfbYf3ir4ABrE9OF
	 WtkoO1xyn5LhfmE99zYzD5djZ1l9wzh8gwqXcQw9UA/XK37unuUDNZA/hPK/xQuf2Q
	 d1vJjDXc8AOk6AzQ6MlrVpwAbj6XUcdqoxNjP1IE=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:50 +0530
Subject: [PATCH v7 15/18] media: rppx1: Add support for Gamma Correction
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-15-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3206;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=p51HVdqcN3zgjHa48OEmozMfQSEJokGXGxYp0lRcW58=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2FX6xXiRrjR0PxrUd2VuR7fTklCnB//gMsq
 /lMfg+5PGaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9hQAKCRBD3pH5JJpx
 RTNCD/sHcJHSTE4MqMpsjJUkOikEkTm23CDGuqfBlyU4AIXBSjZONQhGKAfQ4xF7qC+pgzeRq+7
 gzegmP0m5Lhs7v7tmY2ozGK2D6k0HjGR/v4Uv2TdKtMRQQ0OhdpNEjmDSWOYazIOBbPocUG7Dkb
 lyHVg19zKrE+6lKDimW5EaG6fjocehwraw59km+jEeKDVVfbUKX4iDxTBfDTtmHFWdEOo40ftQ1
 fjPApxSm7nhzj99x5Yqd5gmaCvpmlFs7geWr/S5OoCNUMSdqn5su0Oj/+9Qd3aSU8Hk/kjCcg85
 WbHHbZnpSNqgp4EjJs0CXThazmOvmjg5ClaiYBBAu0CLcNeeT+IHXYSqTz2H6GxXMCwrzBbsJmV
 gwdSXEhZkINUJKNM0RyJRzHM8HOWrxxZ8ryllV/uSa78O1JRdyhlzHKgHXzfYToRovewbWg6WEL
 zsFAEyVaNJApsrBw05uT6nqFJmA+cJZOsnKLcM+/1X3azd6/ZD2PVJmcBt3o4I0e75UrdB/kSCO
 LDUUg2PwMYkazmMS7oHjjsAaTR2QV2EjRns8J/8/n7e7x8w7ZmRGl8pjIX+oSUdt1k2eP5+O45B
 VllVApAYob9kK4CiiAgKvysI1wBt6Sutb6zhszKAvFtBEMlxcCsNX11WeEH3q2YUPaq6Eypvvhi
 xVW26IVphpkwNJQ==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58520-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ragnatech.se:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 273ED3D48A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the Gamma Correction
configuration using the parameter buffer format. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how (and when) configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  4 +++
 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c  | 34 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 386c36fe0e19fa52d53691d77405d31d844c5445..9969517eb1902d1002ea3c7b26a6ca15fa974fa6 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,7 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RPPX1_PARAMS_BLOCK_INFO(CTK, ctk),
+	RPPX1_PARAMS_BLOCK_INFO(GOC, goc),
 	RPPX1_PARAMS_BLOCK_INFO(LSC, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RPPX1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
@@ -66,6 +67,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_GOC:
+			module = &rpp->hv.ga;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_LSC:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
index d6c7f951cf2972a8d633b7915818e26f8d0a1cf5..18b527569c8ecf9ccfd5f92f67e51371a068af8e 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
@@ -43,7 +43,41 @@ static int rppx1_ga_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ga_fill_params(struct rpp_module *mod,
+		     const union rppx1_params_block *block,
+		     rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_goc_config *cfg = &block->goc;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + GAMMA_OUT_ENABLE_REG, 0);
+		return 0;
+	}
+
+	write(priv, mod->base + GAMMA_OUT_MODE_REG,
+	      cfg->mode ? GAMMA_OUT_ENABLE_GAMMA_OUT_EN : 0);
+
+	/*
+	 * The native params are 24-bit while the RPP can be 12 or 24 bit.
+	 * Figure out how much we need to adjust the input values.
+	 */
+	const unsigned int shift = 24 - mod->info.ga.colorbits;
+
+	for (unsigned int i = 0; i < RPPX1_GAMMA_OUT_MAX_SAMPLES; i++)
+		write(priv, mod->base + GAMMA_OUT_Y_REG(i),
+		      cfg->gamma_y[i] >> shift);
+
+	/* Enable module. */
+	write(priv, mod->base + GAMMA_OUT_ENABLE_REG,
+	      GAMMA_OUT_ENABLE_GAMMA_OUT_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ga_ops = {
 	.probe = rppx1_ga_probe,
 	.start = rppx1_ga_start,
+	.fill_params = rppx1_ga_fill_params,
 };

-- 
2.53.0


