Return-Path: <linux-media+bounces-60219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFhLIcXx92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:09:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F034B7DCA
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2091300E3DE
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB1A1B4138;
	Mon,  4 May 2026 01:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ebQzxhAX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EipQBypJ"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0301C84CB;
	Mon,  4 May 2026 01:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856947; cv=none; b=hB+1igMIRHrSgSCph03KlHlaSZHOdZpEUQwLSnXpbrdwpSdYVtOr13wo5LrOsg9ZezspT07VNrQloKfCXssemQrbbQ1vCEExfwKytBR9zhCSzxzPAqiAUGzRIMejS33uozD+aUmYDUPBUAF1utew1jQW/A89u3cKm7T/+rRZIvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856947; c=relaxed/simple;
	bh=+mMPplI6fnYdXfiq1zC28zRkAZsLJusBVL3jHuxpjnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZHMD5Kq+8h46qBYY/xR7IT21MnDFPH41TYeKmGPAIZv2OoOELQ8uihkRxnJyZCpw7KmTFUCVc3982aGpA5kmQuMmdasBU0u5FDnbWdfiWnIvxDgPDYDUCPkU+X+JHbE3TkYU/PKditqRTSUJk/3uU+H0Hxy/enYadRXLvfXtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ebQzxhAX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EipQBypJ; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3F4847A0072;
	Sun,  3 May 2026 21:09:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 03 May 2026 21:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777856945;
	 x=1777943345; bh=ZtQt1R7lUIcEpUSovTa0eqbyaXSspE1z2+Y7qMRogRs=; b=
	ebQzxhAXC0z33wp7fzazVtYGuX3h/zqVoFdRKi07ZJJ7IcIZsFVyWia0yEepkMRN
	tFz12NStFbXIOmllIg9VhMBM4vrrzIdoSP4F0eVokwfUM7X2JT4NRH6Dk0e8RbIS
	s0qQLshohvCDssTN18XHR4CysUPflkRB17PkYzwYOOBGE8kA2OQ36DTH1C11BSKd
	QNqrItClEIHIXA/OZqBbyE/JoTfeLOnSHUwOZCmNuRE8YnIpL5woOvBvwb1lRyyP
	/jlWkcQdMz0oQ1sgGchM9bjvyedC5/gfbAkxc4NrGGTPf21JehaJv1aDuX4sNJsm
	iWMfXgd30AxWDPUl83ztfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777856945; x=
	1777943345; bh=ZtQt1R7lUIcEpUSovTa0eqbyaXSspE1z2+Y7qMRogRs=; b=E
	ipQBypJdZsFA8BqQnTithuzCqioAJ0IwTx1kOMukLx5PC9RQDBWUHmlt2DRWZ25Y
	T3B6PIHqkfnIj2oH7s5VP3ZvC3YUAdgfeZ8oUl6PhXH1mEUXXQ+/io5aqmTwFkL5
	5TT55YtJlX7fGrI7SbCgJwA6jQek2yQTA8nkw1NUSjgPXf7DwQ5bYaeEl+P1OcRX
	16y9B8pi3XwpB2Jwk5ttcTVMAUXYkxanguox5AHdJ1r5yzCMgqhaiCI1YfUtKtat
	Lrx1JRhdoTUZOiZOiDyGRSi9LxokgpWeXhFtOhA5jWaAtzVIwujHzmrpLQDE/LpL
	CN3AswrMMbsC5MhLeFnZw==
X-ME-Sender: <xms:sfH3afDC2EcicN9EHBZXHchMYxa0jwnc4A5aSoU4WgyEORP9H8glRg>
    <xme:sfH3aV9WUD0pUV-GRJiKHuP9-wjq_zqYctxdPXo5KvaGbF8XSDfgV-6XO86Z-I4iV
    UPU-k4y_aHDiJkZ-tbj_LfyV-U1Xm_4kqUUKdHZc25s3--pbS5BVg>
X-ME-Received: <xmr:sfH3abQcaRPSLPqHzYPAq5TIbWcJop-t4GmFQfHUd4qintofxZNPlcQPhuDWLq6O_cPFE9Z945wwECs33VSTyzvuPvL0G8-0-9oP>
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
X-ME-Proxy: <xmx:sfH3aZXXRrnUbZWLP2QMWfHiX74i2ex-PYNoIdWZd-Ojw0DxVexAPA>
    <xmx:sfH3aVTh2-9J2JKPaIM_XETN5NOaOrYQ4txGs9-I34qcX3mvmLhQug>
    <xmx:sfH3aR1q9W639kj3FpryindnjETGbv64rwjRwW7x1odpovtZ7x9jmw>
    <xmx:sfH3aVcUrhBz6QD8bwKAEnnZwwq5yZmcjUjWehP0Ymk5gsVJ92RBNw>
    <xmx:sfH3aedZx59ARjiMFJ5SjaT75YjNLM8vy--0FJwS_6e3atBSXK8XU6M2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:09:04 -0400 (EDT)
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
Subject: [v8 05/14] media: rppx1: awbg: Add support for white balance gain settings
Date: Mon,  4 May 2026 03:05:47 +0200
Message-ID: <20260504010556.2796398-6-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: D7F034B7DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60219-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Extend the RPPX1 driver to allow setting the white balance gain
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     | 32 +++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 40 ++++++++++++++++++-
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 85fb23174e57..76adfe95777d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -85,6 +85,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_params_block_header header;
+	struct rppx1_awbg_params awbg;
 	struct rppx1_wbmeas_params wbmeas;
 };
 
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 1262350d2190..0ac9bf1f9a65 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -16,6 +16,8 @@
 
 static const struct v4l2_isp_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
 
@@ -51,6 +53,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
+			module = &rpp->pre1.awbg;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
index e20bc369ca8c..dcccb1a2e28f 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -25,6 +25,38 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_awbg_fill_params(struct rpp_module *mod,
+		       const union rppx1_params_block *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_awbg_params *cfg = &block->awbg;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_ENABLE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RPP gains are 18-bit with 12 bit fractional part and 0x1000 = 1.0,
+	 * giving a possible range of 0.0 to 64.0. NOTE: RPP documentation is
+	 * contradictory this is the register definition, the function
+	 * description states 0x400 = 1.0 AND 18-bit with 12 fractional bits,
+	 * which is not possible...
+	 */
+
+	write(priv, mod->base + AWB_GAIN_GR_REG, cfg->gain_green_r);
+	write(priv, mod->base + AWB_GAIN_GB_REG, cfg->gain_green_b);
+	write(priv, mod->base + AWB_GAIN_R_REG, cfg->gain_red);
+	write(priv, mod->base + AWB_GAIN_B_REG, cfg->gain_blue);
+
+	write(priv, mod->base + AWB_ENABLE_REG, AWB_ENABLE_AWB_GAIN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_awbg_ops = {
 	.probe = rppx1_awbg_probe,
+	.fill_params = rppx1_awbg_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 1d76a85164c8..e96308b4e308 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -46,9 +46,15 @@ struct rppx1_window {
  * NOTE: Only append to the enumeration as the numbers are uAPI.
  *
  * @RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST: AWB Measurement Configuration
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1: PRE1 pipe White Balance Gains
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2: PRE2 White Balance Gains
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
 };
 
 /**
@@ -107,6 +113,35 @@ struct rppx1_wbmeas_params {
 	__u32 ccor_offs[3];
 };
 
+/**
+ * struct rppx1_awbg_params  - WB gain configuration
+ *
+ * The RPP-X1 White Balance Gain module is available in the PRE1 and PRE2
+ * pre-fusion pipes and in the MAIN_POST post-fusion pipe. Userspace selects
+ * which pipe to operate by setting the @header.type field to
+ * RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1, RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2
+ * or RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST.
+ *
+ * The White Balance module allows to specify per-color channel gains, expressed
+ * as unsigned fixed-point values as 18 bits unsigned integers in Q6.12 format
+ * with a maximum of 63.999.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST)
+ * @gain_red: gain for red component, 18-bit (unsigned Q6.12)
+ * @gain_green_r: gain for green component in red lines, 18-bit (unsigned Q6.12)
+ * @gain_blue: gain for blue component, 18-bit (unsigned Q6.12)
+ * @gain_green_b: gain for green component in blue lines, 18-bit (unsigned Q6.12)
+ */
+struct rppx1_awbg_params {
+	struct v4l2_isp_params_block_header header;
+	__u32 gain_red;
+	__u32 gain_green_r;
+	__u32 gain_blue;
+	__u32 gain_green_b;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -114,7 +149,10 @@ struct rppx1_wbmeas_params {
  * multiple pipes.
  */
 #define RPPX1_PARAMS_MAX_SIZE						\
-	(sizeof(struct rppx1_wbmeas_params))
+	(sizeof(struct rppx1_wbmeas_params)			+	\
+	sizeof(struct rppx1_awbg_params)			+	\
+	sizeof(struct rppx1_awbg_params)			+	\
+	sizeof(struct rppx1_awbg_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


