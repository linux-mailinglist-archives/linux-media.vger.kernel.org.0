Return-Path: <linux-media+bounces-64630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DWXUNc8eK2re2wMAu9opvQ
	(envelope-from <linux-media+bounces-64630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:47:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD286754A1
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:47:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=rJ2tHYbE;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="T 3/pUMm";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64630-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64630-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78A86303FFDC
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474004DD6FF;
	Thu, 11 Jun 2026 20:42:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B624E3773;
	Thu, 11 Jun 2026 20:42:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210559; cv=none; b=R1gf5+8tLww/lvDpQuWTdQ7FlDhxAHmRLgs0s3B+qS1u6ZYUDzmckBp4EaA2bgeSTXUpZcXQo0cESN46suYSBUC61tGYzfNoa47AxKLNa8imzVhd8X0zSsaYo2HfYu0yXGvOzWp0QhNgzvFYWsISadl4vJGiqBiYa68E4M+vtzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210559; c=relaxed/simple;
	bh=nOnvi0q43F2Mi+uNVOHaEonfzCrDJVp8XjHFXyMlzlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X4FKX2udw21NQvKGoEy/3sLU+KIy1pkTc2vK0LP7PzY+A2O/QkfBicwmsf9sIhK04nebH2Q57aD1kCx3M6MKKteoadBNBvvMQ2urRgryEHdurBAX1RSMJalEaHsZfL4myJLRQLry2h2Cg6OHfAj1pyy9O7aMzvnUjOSEzArpjeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=rJ2tHYbE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T3/pUMmo; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 697AC140007F;
	Thu, 11 Jun 2026 16:42:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 11 Jun 2026 16:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210552;
	 x=1781296952; bh=iW1uz+bF3XDeasRJPWT2F9NxGIgfRiF2grsQURBnoC0=; b=
	rJ2tHYbEh0Jy8crIw22r1BCxoCRXUsnaN5dC09b/tXEmpMpn0UqBZUuxDs//eJ2c
	CXtF2ErQoYzMz+tFiuEJEmP5sXWMHXaODVJcf1OBce6elKgDxK2n+ZhDcdZGc4ff
	0K49C3czg+ReRr8F2vp6pp7GYszGX/t5zIvMKRZ3TtT8L5zvWlW1TjuJgBYkXehF
	Y5UP+qRWOqFvSgFyxwTv5nyvd6o9HxCnpDwXlOfa/22YgbOcMQj0CWSVKvMtq/SI
	iUp7BQHZtjI2eqcEnaM5kxoOhB/r7F62FKTUNI0uYcc8cx02JHu6dfedzU/dwymM
	6E76nsXmMct+rqN7UKT9sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210552; x=
	1781296952; bh=iW1uz+bF3XDeasRJPWT2F9NxGIgfRiF2grsQURBnoC0=; b=T
	3/pUMmoVrcLudlo1QafE0SzmyXsIDVu9N7aAtflNHUt+UtS8Ar4FThNliG/5dJt8
	cY0I1ntF4zTRXj+aY122lzOn+c+3pgVceM3ONB/hLo9rGsqdrLcZewhZe+22A9sH
	n61FuJoZmDq9D5iOqF+/pYiJe1d6N7rdEB2rUNPDk424PvO64EI6r3UQR0KgjxXC
	z8iUZMtFCIm5C/+1oEL/YsQpA5aoqwNx0+sl6nelp9LDgSqCH7S2KPbDUIn7HQqv
	qqYfB1EitQa3A/sKBaGIDqRXVlLuRKmhu9/e1JowU0PUXY6Wdj4a+zk2bU21ksWz
	chFPMAXLadr15f6eQYwnA==
X-ME-Sender: <xms:uB0rakpJH3Nr2HHwtEXCqZ43DwPwtKMiVVAn_hd-pT03Cz0fezi20g>
    <xme:uB0ragooZbXFPiP_bkcils1QsDXMXHJNi7qEDlXgLCSX0szj7Fi5TmOm0yp4hu1KJ
    cmmj2K6RusLoMmzsmDgJppRZb57__lwa__fbsygo5zxF0P9Yyf_wA>
X-ME-Received: <xmr:uB0rakBxA0faGTrN3l-qZPxTcoyns2x5-EjmtIP0oH7Kz3tMZpWKkBtSNf3j6zi7SfCij62tQlI9ssq5cK4GLtKAos6P>
X-ME-Proxy-Cause: dmFkZTGdwflrsKGNP8uGzlBIfvpE7yQaQDL/6Wa/OjZWZR9/bQ7uckxHLtwJBR8mPHBLck
    OYhL/+UPWO8GM29WZ20ShKvqjkVCRmUp6hBfgLoRmb8LI+v3t7nD1jAfZPPAp1zAuinmUE
    1J1BzI1UHOUSq1OoWczjGAnAmblpBLe9T9syQkb1BMiwzXQRppiQROAkpyqKBxqt8k01uV
    Z/RCEgZQAxFnHBVJ+HzWDU3nxrH7dSKiBpVhju1Gl4vecGbbaNDPE0j+BUnMmRUctz6nbp
    CUaHJyJ2RL4ffg18eIUWVIq9TTGcC+M8a937xja31qPtPi8W6TqTIWNCqzp0yApq08n3Pb
    HqnCv/CA7BSUHzWHBjNRmQbfr5JpAyToAw5Q8AyO4uw2JEwLU5fE5lkOG2wsTr8IF36CW7
    lOK4cxkBUVEKT+IxpGzagqL3WlXK7IoTwKMo7gaJdOOYSOckEkH42hOA5j/M0zEIofrV76
    k9k4kRKadDCTRvizG3nU4cg+NI84se3Tg6dAff45AxMgKdRm/CDdGgSyiaJvuGWfYseB5c
    /11fd3rZEjGYXUDneCQcfLEgiTWjE2uqzcT1AU1TwB3FcEwGnMsTqdCCSF3izU+BHmbPAR
    XSDVYh1LY731jdB27UZrcbMoCqx6iHQukZVcnO8njv9xjvn80AUvcO3K8AnA
X-ME-Proxy: <xmx:uB0rauvIqP0qHG8Aukv3-5W5pYSslIYmRz_JVkJInJVeYUkZQ7psAg>
    <xmx:uB0rajJwfzFm-kv0vgD-u0i9uDhT2mb43hqLbZPQs8jXSM8o_7lgPA>
    <xmx:uB0ralY3oL4qxQJXMIFIke5_boeTPkKegpW_D7qyPJMMhC7ICjtiyA>
    <xmx:uB0ralAXhaqI0OqypUqGiuzZjniIsGhw2RibSW-5Pg7RMplAeoSmYw>
    <xmx:uB0ralYedeiMyyLJHS0xkTFA3fWxeU5QvSknJ2mPKuSNJP8wu04OEziN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:31 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v10 13/13] media: rppx1: lin: Add support for gamma sensor linearization
Date: Thu, 11 Jun 2026 22:41:48 +0200
Message-ID: <20260611204148.1423192-14-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64630-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ideasonboard.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDD286754A1

From: Jai Luthra <jai.luthra@ideasonboard.com>

Extend the RPPX1 driver to allow setting the gamma sensor linearization
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
* Changes since v8
- Drop unneeded check of V4L2_ISP_PARAMS_FL_BLOCK_ENABLE

* Changes since v8
- Move declaration of dx_lo and dx_hi to top of function.
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
 .../platform/dreamchip/rppx1/rppx1_lin.c      | 53 +++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 48 ++++++++++++++++-
 4 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 948e26d7361d..072309d8662d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -48,6 +48,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_bls_params bls;
+	struct rppx1_lin_params lin;
 	struct rppx1_lsc_params lsc;
 	struct rppx1_awbg_params awbg;
 	struct rppx1_ccor_params ccor;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 86d445b52504..a75a27a8afd0 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
+	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE1, lin),
+	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE2, lin),
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
@@ -68,6 +70,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
 			module = &rpp->pre1.bls;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1:
+			module = &rpp->pre1.lin;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
index 0a0e7ab2d1d6..b389778f9383 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
@@ -25,6 +25,11 @@
 #define LIN_B_Y_REG_NUM				17
 #define LIN_B_Y_REG(n)				(0x0098 + (4 * (n)))
 
+#define LIN_PRE1_DEGAMMA_CURVE_MASK		GENMASK(23, 0)
+#define LIN_PRE1_SAMPLE_POINTS_MASK		GENMASK(3, 0)
+#define LIN_PRE2_DEGAMMA_CURVE_MASK		GENMASK(11, 0)
+#define LIN_PRE2_SAMPLE_POINTS_MASK		GENMASK(2, 0)
+
 static int rppx1_lin_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -53,7 +58,55 @@ static int rppx1_lin_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int rppx1_lin_fill_params(struct rpp_module *mod,
+				 const union rppx1_params_block *block,
+				 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_lin_params *cfg = &block->lin;
+	u8 sample_mask;
+	u32 dx_lo = 0;
+	u32 dx_hi = 0;
+	u32 mask;
+
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + LIN_ENABLE_REG, 0);
+		return 0;
+	}
+
+	switch (cfg->header.type) {
+	case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1:
+		mask = LIN_PRE1_DEGAMMA_CURVE_MASK;
+		sample_mask = LIN_PRE1_SAMPLE_POINTS_MASK;
+		break;
+	case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2:
+		mask = LIN_PRE2_DEGAMMA_CURVE_MASK;
+		sample_mask = LIN_PRE2_SAMPLE_POINTS_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (unsigned int i = 0; i < 8; ++i) {
+		dx_lo |= (cfg->dx[i] & sample_mask) << 4 * i;
+		dx_hi |= (cfg->dx[i + 8] & sample_mask) << 4 * i;
+	}
+
+	write(priv, mod->base + LIN_DX_LO_REG, dx_lo);
+	write(priv, mod->base + LIN_DX_HI_REG, dx_hi);
+
+	for (unsigned int i = 0; i < RPPX1_LIN_DEGAMMA_CURVE_NUM; i++) {
+		write(priv, mod->base + LIN_R_Y_REG(i), cfg->curve_r[i] & mask);
+		write(priv, mod->base + LIN_G_Y_REG(i), cfg->curve_g[i] & mask);
+		write(priv, mod->base + LIN_B_Y_REG(i), cfg->curve_b[i] & mask);
+	}
+
+	write(priv, mod->base + LIN_ENABLE_REG, LIN_ENABLE_GAMMA_IN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_lin_ops = {
 	.probe = rppx1_lin_probe,
 	.start = rppx1_lin_start,
+	.fill_params = rppx1_lin_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 62e26e9917f5..0042c86090f6 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -92,6 +92,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 pipe Lens Shading Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1: PRE1 pipe Linearization (Sensor De-gamma)
+ * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2: PRE2 pipe Linearization (Sensor De-gamma)
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -110,6 +112,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
 	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
+	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2,
 };
 
 /**
@@ -545,6 +549,46 @@ struct rppx1_ga_params {
 	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
 };
 
+/* Linearization (Sensor De-gamma) */
+#define RPPX1_LIN_SAMPLE_POINTS_NUM 16
+#define RPPX1_LIN_DEGAMMA_CURVE_NUM 17
+
+/**
+ * struct rppx1_lin_params - Linearization (Sensor De-gamma) configuration
+ *
+ * The RPP-X1 linearization module is available on the PRE1 and PRE2 pre-fusion
+ * pipes. Userspace selects which pipe to operate by setting the @header.type
+ * field to RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1 or
+ * RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2.
+ *
+ * The LIN module applies the per-color channel de-gamma linearization curves
+ * @curve_r, @curve_g and @curve_b defined on the input sampling points @dx.
+ *
+ * For the PRE1 pipe the de-gamma curves values are 24-bits, for the PRE2 pipe
+ * the de-gamma curve values are 12-bits.
+ *
+ * For the PRE1 pipe de-gamma module sampling points @dx values are in the range
+ * [0, 15] (4 bits). For the PRE2 pipe de-gamma module sampling points values
+ * are in the range [0, 7] (3 bits).
+ *
+ * Userspace is expected to provide the curve values and sampling points with a
+ * bit-depth matching the one of pipe in use.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1 or
+ *	    RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2)
+ * @curve_r: de-gamma linearization curve for red channel
+ * @curve_g: de-gamma linearization curve for green channel
+ * @curve_b: de-gamma linearization curve for blue channel
+ * @dx: input sampling points
+ */
+struct rppx1_lin_params {
+	struct v4l2_isp_params_block_header header;
+	__u32 curve_r[RPPX1_LIN_DEGAMMA_CURVE_NUM];
+	__u32 curve_g[RPPX1_LIN_DEGAMMA_CURVE_NUM];
+	__u32 curve_b[RPPX1_LIN_DEGAMMA_CURVE_NUM];
+	__u8 dx[RPPX1_LIN_SAMPLE_POINTS_NUM];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -567,7 +611,9 @@ struct rppx1_ga_params {
 	sizeof(struct rppx1_lsc_params)				+	\
 	sizeof(struct rppx1_lsc_params)				+	\
 	sizeof(struct rppx1_ga_params)				+	\
-	sizeof(struct rppx1_ga_params))
+	sizeof(struct rppx1_ga_params)				+	\
+	sizeof(struct rppx1_lin_params)				+	\
+	sizeof(struct rppx1_lin_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


