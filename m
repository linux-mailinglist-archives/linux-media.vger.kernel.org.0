Return-Path: <linux-media+bounces-61832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GsdGyLfCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:18:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91055DDE9
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74F5F3045A9E
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094AA37D12F;
	Sat, 16 May 2026 21:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jfy7kJn8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V6sG7L8j"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F337F8B8;
	Sat, 16 May 2026 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966068; cv=none; b=asiWpfhWx2RzO9N49lZXptzdMkh5cUT1+/xye4GAHElrBVC+HXWLc3N2kHy+BOdpvuFYEZieDocn9In1LRRmVC/KX28VjrWnFuShTsqONLsDKeLVrHhLs0zCphkSQ2pMDyfryB38T63e58UrE3wz1WGemzev/2en3BumEF7UhwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966068; c=relaxed/simple;
	bh=ym6NJYQbBS81KDFJVCKMQcq5y8i5lbG9a0QDt/Ry+Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vFZfoDLQzpfr3ncB47ffzsd57UwERPLQaq0Pra1v7u4MsyS++cAbpMnVXY3DdQAdOHLS/ROurNIl5a6uZvJrxUtB9K/DnGVqoloNQdwunds6qqVM1UTKRX25sfG5rkhVt3l9D4D4oHbDFhxZEuN8sFQsOlnKLG7CJ1LWrCqwL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jfy7kJn8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V6sG7L8j; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6AE0714000AD;
	Sat, 16 May 2026 17:14:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 16 May 2026 17:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966060;
	 x=1779052460; bh=f0atvrXr05ppqiBlVLf2BoXgxPCuoPvPF17ohak7GIk=; b=
	jfy7kJn8e8yjw0z4mqu1vGoFLLLFLTxtGmfG98lresYuQDEjjOGwIA2ctzKc+9rX
	q1HaY7MXaqzXxwgbkgYs8b2SMWjZF3PUuhZ5otEJA4rdR9j+1Yj5UTpwJUnK/J6d
	C7qUZ3M3D1/HdoL7CLOyqcBdnAZPV1J498N5adg+0QDPydgInG2Dt4D/ZfeeC7xY
	MlDEMkvGC3XRfsPOzA1iE1v/qr5nb6ADBT/UuUBxp+ICazEaCoJaiSVkpl5vHXdD
	n8S0ffSwgWmJ1/7KZOMaJeRw35choGE1HFNUeXInjodbflJyW5wa0nUZDHoR73Wc
	YtdFedpXjqAkIePrE2vypQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966060; x=
	1779052460; bh=f0atvrXr05ppqiBlVLf2BoXgxPCuoPvPF17ohak7GIk=; b=V
	6sG7L8jJH/qGwElREqd6vZZK+oXih82l10vt6aw3FTbxR7CZvo9qDRxrOqwBH9LM
	qKSqsTDNr0Y4byjPyNkCxGw9pAY4aGPf4YiBgRpTq/kewIewy+Gfd+S2X2SDSYyN
	dn4Zctu08IRz+47YduVUUwokbwIqFFQrYuTo/V4P6L3ubFIDn784ItJKifR3//yM
	G+IlsA0f/XfQC+z4HfFkSmOjicAr5d87H56OaMoNrKtKVrTfJ786+L+rkEQ/dHg2
	R1KDXnpDgiwMtuyktIkwKGrJlxDaX4EBTyh+gf6FBTubbHlKvlafVgF0VKZuJ6Hm
	nU2FOB4kYgKdmRDb1JD+w==
X-ME-Sender: <xms:LN4IagIAQ6nbSr9l4yYFwqaCDRK9VLKPXJ1EleE3B-Ip0SLBtIWSfQ>
    <xme:LN4IamJEY9oC8XYafFrPMEfXC19hThpzB0Zo5-2nA03fGzMDqd_I4kSV8MxB-_Xmh
    egGGm5KkDZJzJqj4G7ckFd9aO86WNQLb49aKOhIC4gxjXfBOcC9IxUA>
X-ME-Received: <xmr:LN4IariSzMX9aJGlIO3OtCR0XYawNCwCVFp_ifIjRYcNoEldC8_gvoRgJoYeiVToV0pYVZHw0sbPgTFJTlKQfFC2IFIeHfymzpSu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehjrghirdhluhhthhhrrgdorhgvnhgvshgrsh
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrgh
    igsehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgr
    rhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvg
    guihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgv
    nhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gv
X-ME-Proxy: <xmx:LN4IagPZ_ZfDaLs8X82siyyLfqwGbGxDg6Rfunkk_DVf6kV5XXnWEg>
    <xmx:LN4IamraTPoPrClN_WjPpbmG4lqg6y8L_ghRMSiUTRMhPt3e9vOBsg>
    <xmx:LN4Iai7BJEdxavrjCjQuAHJXlrgzY-DkdHHQq6iqeH37CZRKOJ7Kgw>
    <xmx:LN4IakjY60FEhE7oT9Q_KvrI_g3n0NkZ5azJcGCmdpHFoF6bpYL56A>
    <xmx:LN4IattXl1-sH0PLBuBNa27NjiGvbLiOduRlnWA40ItaAfJYMnVpEVO3>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:19 -0400 (EDT)
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
Subject: [PATCH v9 08/13] media: rppx1: hist: Add support histogram measurement
Date: Sat, 16 May 2026 23:13:15 +0200
Message-ID: <20260516211320.3041412-9-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DF91055DDE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61832-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ideasonboard.com:email,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Action: no action

Extend the RPPX1 driver to allow setting the histogram measurement
configuration and consuming the resulting statistics. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how, and when, configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
* Changes since v8
- Use IS_ERR to check rppx1_init_stats_block() return code.
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   6 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  10 ++
 .../platform/dreamchip/rppx1/rppx1_hist.c     | 115 +++++++++++++++++-
 .../uapi/linux/media/dreamchip/rppx1-config.h | 115 +++++++++++++++++-
 5 files changed, 245 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index e968ec67b9f5..b134d140fe22 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -48,12 +48,14 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
 };
 
 union rppx1_stats_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_hist_stats hist;
 	struct rppx1_exm_stats exm;
 	struct rppx1_wbmeas_stats wbmeas;
 };
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 8c0f45e8066a..975ce3a42fb5 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,9 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
+	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
+	RPPX1_PARAMS_BLOCK_INFO(HIST_POST, hist),
 	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE1, exm),
 	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE2, exm),
 	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
@@ -58,6 +61,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_HIST_POST:
+			module = &rpp->post.hist;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1:
 			module = &rpp->pre1.exm;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index 388c758d805d..4c7fe611d004 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -17,6 +17,7 @@
 
 static const struct v4l2_isp_stats_block_type_info
 rppx1_stats_blocks_info[] = {
+	RPPX1_STATS_BLOCK_INFO(HIST_POST, hist),
 	RPPX1_STATS_BLOCK_INFO(EXM_PRE1, exm),
 	RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
@@ -35,6 +36,15 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 
 	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
 
+	if (isc & RPPX1_IRQ_ID_POST_HIST_MEAS) {
+		block = rppx1_init_stats_block(rpp, stats,
+					       RPPX1_STATS_BLOCK_TYPE_HIST_POST);
+		if (IS_ERR(block))
+			return;
+
+		rpp_module_call(&rpp->post.hist, fill_stats, block);
+	}
+
 	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
 		block = rppx1_init_stats_block(rpp, stats,
 					       RPPX1_STATS_BLOCK_TYPE_EXM_PRE1);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
index 7c1b42e96b96..475e78b0d06a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
@@ -26,6 +26,9 @@
 
 #define HIST_LAST_MEAS_LINE_REG			0x0010
 #define HIST_SUBSAMPLING_REG			0x0014
+#define HIST_SUBSAMPLING_V_STEPSIZE(x)		(((x) & 0x7f) << 24)
+#define HIST_SUBSAMPLING_H_STEP_INC(x)		(((x) & 0x1ffff))
+
 #define HIST_COEFF_R_REG			0x0018
 #define HIST_COEFF_G_REG			0x001c
 #define HIST_COEFF_B_REG			0x0020
@@ -49,7 +52,6 @@
 #define HIST_FORCED_UPDATE_REG			0x0058
 #define HIST_VSTART_STATUS_REG			0x005c
 
-#define HIST_BIN_REG_NUM			32
 #define HIST_BIN_REG(n)				(0x0060 + (4 * (n)))
 
 static int rppx1_hist_probe(struct rpp_module *mod)
@@ -72,6 +74,117 @@ static int rppx1_hist_probe(struct rpp_module *mod)
 	return 0;
 }
 
+#define RPPX1_HIST_WEIGHT(v0, v1, v2, v3) \
+	(((v0) & 0x1f) | (((v1) & 0x1f) << 8)  | \
+	(((v2) & 0x1f) << 16) | \
+	(((v3) & 0x1f) << 24))
+
+static int rppx1_hist_fill_params(struct rpp_module *mod,
+				  const union rppx1_params_block *block,
+				  rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_hist_params *cfg = &block->hist;
+	u32 h_offs, v_offs, h_size, v_size;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + HIST_MODE_REG,
+		      HIST_MODE_HIST_MODE_DISABLE);
+		return 0;
+	}
+
+	/* Select sample point */
+	write(priv, mod->base + HIST_CHANNEL_SEL_REG,
+	      cfg->channel_sel & HIST_CHANNEL_SEL_CHANNEL_SELECT_MASK);
+
+	/*
+	 * Configure the input subsampling.
+	 *
+	 * v_stepsize controls which lines are processed. In Bayer mode the
+	 * effective value is double to account for the 2x2 macro-pixel size.
+	 *
+	 * h_step_inc is the horizontal pixel increment counter. The subsampling
+	 * counter is incremented by h_step_inc. When the result of the
+	 * increment overflows 2^16 a sampling is performed. In Bayer mode the
+	 * subsampling counter is only incremented for color channels selected
+	 * by hist_mode.
+	 */
+	write(priv, mod->base + HIST_SUBSAMPLING_REG,
+	      HIST_SUBSAMPLING_V_STEPSIZE(cfg->v_stepsize) |
+	      HIST_SUBSAMPLING_H_STEP_INC(cfg->h_step_inc));
+
+	/*
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be divisible by 10.
+	 */
+	h_offs = cfg->wnd.h_offs & 0x1ffe;
+	v_offs = cfg->wnd.v_offs & 0x1ffe;
+	h_size = cfg->wnd.h_size - cfg->wnd.h_size % 10;
+	v_size = cfg->wnd.v_size - cfg->wnd.v_size % 10;
+
+	write(priv, mod->base + HIST_H_OFFS_REG, h_offs);
+	write(priv, mod->base + HIST_V_OFFS_REG, v_offs);
+	write(priv, mod->base + HIST_H_SIZE_REG, h_size / 5);
+	write(priv, mod->base + HIST_V_SIZE_REG, v_size / 5);
+
+	/*
+	 * Set last measurement line for ready interrupt. Ignore the value
+	 * from the parameters as it is only useful for fast-channel switching.
+	 */
+	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
+
+	/* Set measurement window weights. */
+	write(priv, mod->base + HIST_WEIGHT_00TO30_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[0], cfg->weights[1],
+				cfg->weights[2], cfg->weights[3]));
+	write(priv, mod->base + HIST_WEIGHT_40TO21_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[4], cfg->weights[5],
+				cfg->weights[6], cfg->weights[7]));
+	write(priv, mod->base + HIST_WEIGHT_31TO12_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[8], cfg->weights[9],
+				cfg->weights[10], cfg->weights[11]));
+	write(priv, mod->base + HIST_WEIGHT_22TO03_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[12], cfg->weights[13],
+				cfg->weights[14], cfg->weights[15]));
+	write(priv, mod->base + HIST_WEIGHT_13TO43_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[16], cfg->weights[17],
+				cfg->weights[18], cfg->weights[19]));
+	write(priv, mod->base + HIST_WEIGHT_04TO34_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[20], cfg->weights[21],
+				cfg->weights[22], cfg->weights[23]));
+	write(priv, mod->base + HIST_WEIGHT_44_REG,
+	      RPPX1_HIST_WEIGHT(cfg->weights[24], 0, 0, 0));
+
+	write(priv, mod->base + HIST_MODE_REG, cfg->mode);
+	write(priv, mod->base + HIST_COEFF_R_REG, cfg->coeff[0]);
+	write(priv, mod->base + HIST_COEFF_G_REG, cfg->coeff[1]);
+	write(priv, mod->base + HIST_COEFF_B_REG, cfg->coeff[2]);
+
+	u32 sample_reg = FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_SHIFT_MASK,
+				    cfg->sample_shift) |
+			 FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_OFFSET_MASK,
+				    cfg->sample_offs);
+	write(priv, mod->base + HIST_SAMPLE_RANGE_REG, sample_reg);
+
+	write(priv, mod->base + HIST_FORCED_UPDATE_REG, 1);
+
+	return 0;
+}
+
+static int rppx1_hist_fill_stats(struct rpp_module *mod,
+				 union rppx1_stats_block *block)
+{
+	struct rppx1_hist_stats *stats = &block->hist;
+
+	for (unsigned int i = 0; i < RPPX1_HIST_NUM_BINS; i++)
+		stats->hist_bins[i] = rpp_module_read(mod, HIST_BIN_REG(i)) & 0xfffff;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_hist_ops = {
 	.probe = rppx1_hist_probe,
+	.fill_params = rppx1_hist_fill_params,
+	.fill_stats = rppx1_hist_fill_stats,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index dbc1e116fdf5..50aba160c6cd 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -83,6 +83,9 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
  * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1: PRE1 pipe Exposure Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2: PRE2 pipe Exposure Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1: PRE1 pipe Histogram Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2: PRE2 pipe Histogram Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -91,6 +94,9 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
 };
 
 /**
@@ -236,6 +242,85 @@ struct rppx1_exm_params {
 	__u8 coeff_gb;
 };
 
+/* Histogram */
+#define RPPX1_HIST_WEIGHT_GRIDS_SIZE 25
+
+/**
+ * enum rppx1_hist_mode - Histogram measurement mode
+ *
+ * Histogram measurement mode. Select which channel or combination of channels
+ * the histogram measurement is performed on.
+ *
+ * @RPPX1_HIST_MODE_DISABLE: histogram disabled
+ * @RPPX1_HIST_MODE_RGB_COMBINED: combined RGB histogram
+ * @RPPX1_HIST_MODE_R_HISTOGRAM: red channel histogram
+ * @RPPX1_HIST_MODE_GR_HISTOGRAM: green/red channel histogram
+ * @RPPX1_HIST_MODE_B_HISTOGRAM: blue channel histogram
+ * @RPPX1_HIST_MODE_GB_HISTOGRAM: green/blue histogram
+ */
+enum rppx1_hist_mode {
+	RPPX1_HIST_MODE_DISABLE,
+	RPPX1_HIST_MODE_RGB_COMBINED,
+	RPPX1_HIST_MODE_R_HISTOGRAM,
+	RPPX1_HIST_MODE_GR_HISTOGRAM,
+	RPPX1_HIST_MODE_B_HISTOGRAM,
+	RPPX1_HIST_MODE_GB_HISTOGRAM,
+};
+
+/**
+ * struct rppx1_hist_params - Histogram measurement configuration
+ *
+ * The RPP-X1 Histogram measurement unit is available on the PRE1, PRE2 and
+ * MAIN_POST pipes. Userspace selects which pipe to operate by setting the
+ * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
+ * RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2 or
+ * RPPX1_PARAMS_BLOCK_TYPE_HIST_POST.
+ *
+ * The histogram measurement point is selected using the @channel field while
+ * histogram measurement mode is selected using the @mode field.
+ *
+ * Histogram measurement is performed by programming subsampling factors using
+ * the @v_stepsize and @h_step_inc fields and by weighted windowing, by
+ * programming the size of the measurement window @wnd with @weights associated
+ * to each cell of the 5x5 measurement grid. Weights are represented as 5 bits
+ * integer values ranging from 0 to 16.
+ *
+ * The @last_line fields controls when the histogram measurement completes. It
+ * is usually programmed to the value of (@wnd.v_offs + @wnd.v_size - 1).
+ *
+ * Histogram values are calculated by applying a per-color channel coefficient
+ * represented as an 8 bits unsigned Q1.7 integer value. The @sample_offs and
+ * @sample_shift fields allow to reduce the color dynamic range on which
+ * histogram data are produced.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_HIST_POST)
+ * @mode: histogram measurement mode (from enum rppx1_hist_mode)
+ * @channel_sel: histogram measurement point (see enum rppx1_meas_chan)
+ * @wnd: measurement window coordinates
+ * @weights: weighting factors for each sub-window (5x5 grid)
+ * @last_line: line number for which the histogram measurement completes
+ * @v_stepsize: vertical subsampling divider, 7 bits
+ * @h_step_inc: horizontal subsampling step counter, 17 bits
+ * @coeff: R-G-B coefficients, 8 bits unsigned Q1.7
+ * @sample_offs: sample offset, 24 bits
+ * @sample_shift: sample shift, 4 bits
+ */
+struct rppx1_hist_params {
+	struct v4l2_isp_params_block_header header;
+	__u8 mode;
+	__u8 channel_sel;
+	struct rppx1_window wnd;
+	__u8 weights[RPPX1_HIST_WEIGHT_GRIDS_SIZE];
+	__u32 last_line;
+	__u32 v_stepsize;
+	__u32 h_step_inc;
+	__u8 coeff[3];
+	__u32 sample_offs;
+	__u8 sample_shift;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -248,7 +333,10 @@ struct rppx1_exm_params {
 	sizeof(struct rppx1_awbg_params)			+	\
 	sizeof(struct rppx1_awbg_params)			+	\
 	sizeof(struct rppx1_exm_params)				+	\
-	sizeof(struct rppx1_exm_params))
+	sizeof(struct rppx1_exm_params)				+	\
+	sizeof(struct rppx1_hist_params)			+	\
+	sizeof(struct rppx1_hist_params)			+	\
+	sizeof(struct rppx1_hist_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
@@ -267,11 +355,17 @@ struct rppx1_exm_params {
  * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
  * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE1: pre-fusion pipe1 exposure measurement
  * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE2: pre-fusion pipe2 exposure measurement
+ * @RPPX1_STATS_BLOCK_TYPE_HIST_PRE1: pre-fusion pipe1 histogram
+ * @RPPX1_STATS_BLOCK_TYPE_HIST_PRE2: pre-fusion pipe2 histogram
+ * @RPPX1_STATS_BLOCK_TYPE_HIST_POST: post-fusion histogram
  */
 enum rppx1_stats_block_type {
 	RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
 	RPPX1_STATS_BLOCK_TYPE_EXM_PRE1,
 	RPPX1_STATS_BLOCK_TYPE_EXM_PRE2,
+	RPPX1_STATS_BLOCK_TYPE_HIST_PRE1,
+	RPPX1_STATS_BLOCK_TYPE_HIST_PRE2,
+	RPPX1_STATS_BLOCK_TYPE_HIST_POST,
 };
 
 /**
@@ -308,6 +402,20 @@ struct rppx1_exm_stats {
 	__u32 exp_mean[RPPX1_EXM_NUM_WIN];
 };
 
+/* Histogram */
+#define RPPX1_HIST_NUM_BINS 32
+
+/**
+ * struct rppx1_hist_stats - Histogram statistics
+ *
+ * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_HIST_POST)
+ * @hist_bins: accumulation histogram results in unsigned 20-bit Q16.4 format
+ */
+struct rppx1_hist_stats {
+	struct v4l2_isp_block_header header;
+	__u32 hist_bins[RPPX1_HIST_NUM_BINS];
+};
+
 /**
  * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
  *
@@ -317,6 +425,9 @@ struct rppx1_exm_stats {
 #define RPPX1_STATS_MAX_SIZE						\
 	(sizeof(struct rppx1_wbmeas_stats)			+	\
 	sizeof(struct rppx1_exm_stats)				+	\
-	sizeof(struct rppx1_exm_stats))
+	sizeof(struct rppx1_exm_stats)				+	\
+	sizeof(struct rppx1_hist_stats)				+	\
+	sizeof(struct rppx1_hist_stats)				+	\
+	sizeof(struct rppx1_hist_stats))
 
 #endif /* __UAPI_RPP_X1_CONFIG_H */
-- 
2.54.0


