Return-Path: <linux-media+bounces-60223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN46M7Dy92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:13:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF04B7EBD
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 783A0303FFD6
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF171ACEDF;
	Mon,  4 May 2026 01:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IJDAWHNX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K+4pECXj"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444F1A9FAF;
	Mon,  4 May 2026 01:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856958; cv=none; b=N6gFZsFFJW0LbSmnavLrpPh59ihW2F0FuQBfE+MsXw9rf+IcOjFesAZYrwWXYRtFcsGEkWlqs5HkQPRk63lBUPvQxNgPCp+xCW8k6ICDUY0n0E0ZfJIAXAYN6J0Gb1XRwlN3epnKGdA1gdlLz0uEAdZQpawuIWZyK2tjeR0DX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856958; c=relaxed/simple;
	bh=DGWhEvm4EI4BYb/F0oJDEQE3tDBPahf7CCjKa3wbEl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjXjTkQudvsysdJmPoFBUbbc3Bi0bsoJrQ2cXpGqjNRFnesbbHgg0S0y78WAmLhg+/2f8yI3LfgkbmmngRDP0xY220Ul02If4kVHH1llcNnIdZB9D467au4PkK41lfoBTORmYSYuXGe7JwZQ3Qt78zRfP+pf0I7pRu2jSh+OWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IJDAWHNX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K+4pECXj; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6684A7A0073;
	Sun,  3 May 2026 21:09:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 03 May 2026 21:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777856954;
	 x=1777943354; bh=SNTnxgNC6olexiZc67ICrjDDFn/eU4PuCzwjq+nMYgk=; b=
	IJDAWHNXKWvzghdKER6Y16Ad+gZ0cOw4v58g8BUhp8cvTEjxXshCaQW2amicc2KM
	+CiUtDeJsSZ3tEv6JtP+iqO55q2GjBqFAVCKufVcIFKl9l+7IaV58JC0Huam5vSj
	qNkwC3YERpTSAZ92OOtX9zdNUJ2RIpD4iQTdmj+I/M/gH3ith2kwtT26mTBcPae7
	AtxzctCaDbCxKogpfra48xjfkYUh262SYwy0isXiR+SnRbdcWwk0qyJ6DsdS17rM
	8Tn0ZdsgXEzohJXHflfq3v3N8ejPFXAwNQxKvEkMwG9eT0kj3XtUBD1NCpksV1zp
	IPkgALlL5mwb+wZD/thDbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777856954; x=
	1777943354; bh=SNTnxgNC6olexiZc67ICrjDDFn/eU4PuCzwjq+nMYgk=; b=K
	+4pECXjg/kxDcOBXdUz0AvpXBJ+NinrR1IDMbLtEkJdZu5lUzhTg6c9y2/3nLTm2
	v0rZSyo4B5f7LEExROsZcS5nZMouGCGrCAxge+6E3TAOfzCbMjotjE9MdWgJOijM
	BgMmHFLS4kIXRirlDwtNLAqcdAzlgpIzowxk0uBlDc5SoE8qDIyZ8ckh+onErf1x
	q5Ci6z4eZNKILS3c7qHxc5Usgb9lttHIiMgWUwtbsv/8wkgpOs3vBeoXQ8lgbi/E
	Y9D4/k8LxyNQ05MWl8ASwFwfCKZBLz7Spz5VVXkEXGXBvD6FMDFVmvPF8gTWZHR7
	cthyELMt0Cfqsr6m0/ufg==
X-ME-Sender: <xms:uvH3abcJLcXYJTqYDyBcGyv_EGQvn4Kz7E-pg9Z-kL1ByNzcMaICRA>
    <xme:uvH3aRpDPSMOFFwLqQuBT8deyHW0xwZduGg1pao4kKddmpXEwoFWDJ66de_z8u9DY
    hIdkr_w2JVfGPjh1JXbhxy_H68iPXuMsrfiIQdNZUljfzmUHR7i2Q>
X-ME-Received: <xmr:uvH3aVPqXTzFRFPdGRjHndGQLzHEeG8FApROo6ZSMCl4TjIA11-UgkZd9bMFsp7gGJDAcIAtDCLNFbpOcOsVUaLw3k1qc6l7oFTN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrodhrvghnvghsrghssehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrsh
    honhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhk
    lhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:uvH3aUg-04q2gNq32nzwxkFzeTvBBU2B-0c-rmes-rQWMhlo_ystlQ>
    <xmx:uvH3aYtt7DN5PCnGQP3c-zmeB3WnL-qPQ6hNZdHEEUpmUFqbaERBOw>
    <xmx:uvH3aYiHrjyV02AXY06mrFAxIne8Z1CHCVTethdn51ECEHKu5o8GnQ>
    <xmx:uvH3aea8keECTskEOI1Ur71R7u1jOCes9JrgiFhBg97VN6CnsnmLcw>
    <xmx:uvH3aQIWB8xXqP5OCfyDfIe3Ack6dL0rD2Gw9ZKX8HILd8mp12O9cVlS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:09:13 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [v8 09/14] media: rppx1: ccor: Add support for color correction matrix
Date: Mon,  4 May 2026 03:05:51 +0200
Message-ID: <20260504010556.2796398-10-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 70BF04B7EBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60223-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim]

Extend the RPPX1 driver to allow setting the color correction matrix
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  4 ++
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 61 +++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 28 ++++++++-
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 9c761448717b..121fea99b237 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -87,6 +87,7 @@ union rppx1_params_block {
 	struct v4l2_isp_params_block_header header;
 	struct rppx1_bls_params bls;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_ccor_params ccor;
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 7b006c68381b..57829e3b533d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -20,6 +20,7 @@ rppx1_ext_params_blocks_info[] = {
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
index 4754b0bbce0a..1655c58c8d59 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -68,9 +68,70 @@ static int rppx1_ccor_start(struct rpp_module *mod,
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
index b181ef08d093..3030369a2fbc 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -86,6 +86,7 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
+ * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -99,6 +100,7 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
 };
 
 /**
@@ -420,6 +422,29 @@ struct rppx1_bls_params {
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
@@ -437,7 +462,8 @@ struct rppx1_bls_params {
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


