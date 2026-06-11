Return-Path: <linux-media+bounces-64627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x8oVEaYfK2oA3AMAu9opvQ
	(envelope-from <linux-media+bounces-64627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:50:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFD1675505
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:50:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=hbQgUIv7;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="j P4BaWa";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64627-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64627-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D34A34481A0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFBB4DD6E5;
	Thu, 11 Jun 2026 20:42:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDBA4DBD98;
	Thu, 11 Jun 2026 20:42:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210549; cv=none; b=cQWGxalTPkMWspWARmDZZkEF9IHCDiqrfuemxglKMtr6SnSi/xkrmMUpxUIeY9LNzHRt+duHnp91zoCylTDBPurDifffsgfpqZDWB/wr9zYf+q5TyAIh5W7X5Tq+f5vwMisVgaA5dbZGXces8Jm9ViDWUhE37qXv7XlrlpYo/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210549; c=relaxed/simple;
	bh=2umV+ZX6+mQfPAXVtPtkQwD32cC9iaq7FBLndlxTGF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpVH++oYgXf655cSI5CV54gdHzsXUrPv9w/2E8xz0LeGW8FmhUSrbbVQEbp9z2scMrJXEc0jMRI1fhp1Xce7OCcpNQkVnWZzpC8m0lqDmyDdA2oFeSpZlby/yuZiu209FPA8aDiB6/a24llXFx1w4cP/dPC1h6FDW54AFtnwtI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hbQgUIv7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jP4BaWa4; arc=none smtp.client-ip=103.168.172.144
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 9CA4EEC010D;
	Thu, 11 Jun 2026 16:42:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 11 Jun 2026 16:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210546;
	 x=1781296946; bh=xcLmjnP/fhSsNXcNI4wWc99kIuYgNunC6S8DyRNbXDc=; b=
	hbQgUIv7Hw1EdWv5a0D2tbPHcwrlVt2FmGI8k4lbVltMOnQORyxtiXGZC4HAW6hD
	OpkJCAk3eB54p5KMCqGq/JRs5QngwnpQldiD58PMj/9ZVqZ77uGznsifySKUFMCA
	u84dxgMrjlW8wZhKAKSRphwf1DD+lKB60/bfzZP50r0v/JWP5bLtO1o1ZBdq4f4J
	RFA2IR9VQEBwWwN7Psn1g0jWXxXBk/lvrgn77fVZKVkP20iwFdPoBHeIR+Gn4RbB
	BNIU6kPeZ4nzp6+tmPiIUziFD8oYPTS46qKYJ0uQloeulk8kq1ZdMOC0QzCnV+SI
	LRvgvAfboMJDqz9yideTHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210546; x=
	1781296946; bh=xcLmjnP/fhSsNXcNI4wWc99kIuYgNunC6S8DyRNbXDc=; b=j
	P4BaWa419np8zYcImUq8DKwYdy51ncEyZ2jdQkYcd5h0oOwoqevKAdbwshSKwODb
	PusxlR/u7jsd4RLTHB6DKiPc1jo0x2OOM5/kTdGMOAzLsP0PwEwVxXcTesv3Fr/Z
	FPsWCwMIIFGiXzjlhYjm6vHqWBejNOONGHdQCXu6S/ELPm2XcVyvUAx3WsCNKFYx
	D8K/Ltwy7kMrH2gl7myfUkolZ04C/L/xXpTC6qw/q1dLzbNmDsiOER2tsleoMzxD
	XDoGPxwamqqBY9cKRLzqXST89Fx9bw5BORiEVplG6Twkks1973dJd+N7nqYmQ34m
	y3gQ87PfoIzVd0Pk2WY5g==
X-ME-Sender: <xms:sh0raq9IZXd_wWNjbsVitB8qhHBzxDfTVxwQvJtNKMMGNHeuh0VoSA>
    <xme:sh0ragukw3FukOw4tUgSr6Y9erN5jGvMkvbbWoI59C50SKtCDpScbgPirsrKz_zs7
    X_zspTTgUS2Vqkgk7cnCArzi9O83m05_zPvz8wSZIjm2rorqH6jJQ>
X-ME-Received: <xmr:sh0raq0jk43wcP3vB6ISYOcqzYQjq3M5UR-RhJQbVqh9rgmavPx5os15VuSNC6AKlchzSUCV5TbnjkrOOPmJjWBjIVUF>
X-ME-Proxy-Cause: dmFkZTGaouJIR5kC2J81I5sfEwZBn3ZT9RrdlVZBH2NdTyvnCs8J5l1+cS0iIw5iwCKzXs
    ifNT3VxPLcgDaNVSHOGFqwSN8mYhMHzCKHXMtRXmLS3K2fAWtCymAkJp/Wkyu1ibcEKcnm
    gcklheITNT/Pc6vQQRUWa0XBXpNjxU5nM+VLaLsK2AkB+R+spLShYqaQJ9w9JrDLh44uWA
    MgmQuSWr4OqltuDKF0LMp4YaUkQMB6oqXjZppdCtJ6HpkVjUk+zli1MFwg9Ak+kRuhNJ/e
    n2I1wmUz4K4UMMJ4VC9bDXSlbtRV+OfaQBqnQ2+JtMmX7LNrF1kZWZDhIPHG888cdmG4h8
    HaP1LWs0cA2s1P0qDGtP0Z7fWGf98JyQT4BWqV0R1Ust9nEjguqwg4drikxvsX64C61iPL
    LKyyeyuH+60hc3SE0oADm8r3ELQDClJx1Nq5yOD8149Q6KVcvCsU8ClMhHtj3q5ni6YCkW
    z3RILyw0d0nSUT4/qk9coHk0PiZma3Dsz3ynl2O1iCOVm57oi+/PngkvM2MGJJe+mBV/I1
    bq0WbwctvGTVYJbq+j55D+igCByZg85IPjBcYzToIbR64o1mVEBZBSKkmykMqQ600pHazy
    VNqAHZ3UNib3kKu0Tv6p0L/uGf8KjJiWgF4KxuQrpsJkgUTmox4jctMvq1IA
X-ME-Proxy: <xmx:sh0ralSvoSWBFUz1fwlrxslLZeycac1jvl-dkC1CPIDxB2ScCXTBLA>
    <xmx:sh0raufgR0yjPRBOipLFBe6-6T7e-m3YK13QPZHCamZAuu7CD77oIw>
    <xmx:sh0ramfSFhi-WJKu17xrNTb7WzVkj2I5jU1u8E2mDmVQpTULi8xZLw>
    <xmx:sh0rao1jAgPiPNy2us0P4B1E8iiy0bvKPVy7_gldKS_nYyjguDg83Q>
    <xmx:sh0ranBPnq642UOBpFxgPTbayFgAmOqg66rl1TM3EhHz8L3m6rw_gany>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:26 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v10 10/13] media: rppx1: ccor: Add support for color correction matrix
Date: Thu, 11 Jun 2026 22:41:45 +0200
Message-ID: <20260611204148.1423192-11-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64627-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,vger.kernel.org:from_smtp,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EFD1675505

Extend the RPPX1 driver to allow setting the color correction matrix
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  4 ++
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 61 +++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 28 ++++++++-
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 5e20fcdcbcc4..e039746ac542 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -49,6 +49,7 @@ union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_bls_params bls;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_ccor_params ccor;
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 831cf7ca154c..a83d393d0504 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -21,6 +21,7 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_POST, hist),
@@ -66,6 +67,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
+			module = &rpp->post.ccor;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_HIST_POST:
 			module = &rpp->post.hist;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
index 3bfad3ba12e6..5ddc7edf6930 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -67,9 +67,70 @@ static int rppx1_ccor_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ccor_fill_params(struct rpp_module *mod,
+		       const union rppx1_params_block *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_ccor_params *cfg = &block->ccor;
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
+	 */
+	write(priv, mod->base + CCOR_OFFSET_R_REG, cfg->offset[0]);
+	write(priv, mod->base + CCOR_OFFSET_G_REG, cfg->offset[1]);
+	write(priv, mod->base + CCOR_OFFSET_B_REG, cfg->offset[2]);
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
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 7214a7b42c47..c13c7c99c078 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -87,6 +87,7 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
+ * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -100,6 +101,7 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
 };
 
 /**
@@ -421,6 +423,29 @@ struct rppx1_bls_params {
 	struct rppx1_bls_fixed fixed;
 };
 
+/**
+ * struct rppx1_ccor_params - Color CORrection configuration
+ *
+ * The CCOR (Color Correction) module is available on the MAIN_POST pipe. It
+ * performs color space correction on a pixel-per-pixel basis using a 3x3 matrix
+ * of coefficients and per-color channel offsets.
+ *
+ * The matrix coefficients are represented as 16 bits signed fixed point values
+ * in Q4.12 format ranging from -8 to +7.999.
+ *
+ * The per-channel color offsets are represented as 2's complement values
+ * stored in 25 bits ranging from -16777216 to 16777215.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST)
+ * @coeff: color correction matrix coefficients, 16 bits signed Q4.12
+ * @offset: R, G, B offsets, 2's complement 25 bits
+ */
+struct rppx1_ccor_params {
+	struct v4l2_isp_params_block_header header;
+	__u16 coeff[3][3];
+	__u32 offset[3];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -438,7 +463,8 @@ struct rppx1_bls_params {
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_bls_params)				+	\
-	sizeof(struct rppx1_bls_params))
+	sizeof(struct rppx1_bls_params)				+	\
+	sizeof(struct rppx1_ccor_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


