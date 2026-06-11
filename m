Return-Path: <linux-media+bounces-64623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ExTiOOEdK2qo2wMAu9opvQ
	(envelope-from <linux-media+bounces-64623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:43:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D96753FE
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:43:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=uim8dtm1;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="b CnEpuG";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64623-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64623-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43016302028C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9824C955A;
	Thu, 11 Jun 2026 20:42:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815FF4D90B5;
	Thu, 11 Jun 2026 20:42:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210541; cv=none; b=h+VKbBpklwqwNHS0ced48yOy6SoBdPEU4VXRpUGaknDVnEGslMn4vNysdcYRBI2LpqbAlPUMuGhPI4mPG3JblvFwh6EpxcpScDdQrbFIfDfHOaxz4ORI355GuQm9t1GelD1FeXhyvjtrAbL95cZHBMtfB5kN6s0ePvrgCxU5/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210541; c=relaxed/simple;
	bh=jbCdQO4UBpU/vofqww9PP5W8D9gkV8Bwy7c65oN1P2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKBQmifSZMOdMOIkQ71tlSJ9UaxO8LKwwERT2T9DU/vK3GCBWJCLZZ8BG1wjucx1emP/2FRCk4WCABDPrA6PM5M2w/SsHOwNOjEqFlZwqDio3hfGivDqqmbR/s/LNRyozPl+y5WPZ8EzsCmB4ALfz5PjrAy/l9PzX8ihXm/zK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uim8dtm1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bCnEpuGP; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C965D140002A;
	Thu, 11 Jun 2026 16:42:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 11 Jun 2026 16:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210538;
	 x=1781296938; bh=7WLspPrG6nz62VEmL/49fGzi64FFo41B4Yan0H9Jbco=; b=
	uim8dtm1HLP3j33L/eUeA1MVC3cE/RLuctZ0aW/mcwkW1zvSHj+kDD7Q9FvACH3K
	RA6NQGTJuXx5LHrn/2v9QnXNsnc2nQOYRR2epRiH+o68C03qm0mzOZ3P5JavLp9i
	WNLQAVWZX7xBkfJXT74D89D0F2FDGkvrb28SqqeNWGcfxzGFAg7fjK+g3yx3BQat
	9GtKQL+JqwZhW6SomHGL+QTbTmKVCQ+sMxhGyout5aBPjLz5mIW593KMBhwd9KlU
	3rYv2K17DnIXyjDwvqhZg99/hIn5sXysqzm7FBZj+gN+IPrdYV7kwt9Z+8N5i3Co
	1AfjUY+wCnUzCV6YlU90Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210538; x=
	1781296938; bh=7WLspPrG6nz62VEmL/49fGzi64FFo41B4Yan0H9Jbco=; b=b
	CnEpuGPCSDSzCk4zaVn9OawseuFaKfwekzTOfrobRo/1cT1tuk6XUCRbmFWVlB29
	DWj4LUFzp49jJ/1IQYwrECiqD28h/aC97SmPV6MyA7O/GSvmvlZSMoWsjlEUXjjN
	0wIyoxgyANPQwGy1WQpJlAdvzJb4KYaY4NcaNn8IQGWi0ug5IVj3HF7OaxntJjvA
	ZIwqsehbgcjL1S3tRhhAbv5376bYH+94nfPqNI3ie22iYOfrpNPgw2kNfQltAv05
	1A9XxdhBgBVeVx2/LxOB/B20B/M74m9jBeIzm2uTuF8chzd5+fV8ANEJJaVP0SFa
	P2SbMQzzg95Ei+ubj12Eg==
X-ME-Sender: <xms:qh0ragQfGKB_PhUWcE4FQfEUyD1992j-tyBQttRhbqnJ42iFaP8fbw>
    <xme:qh0rajxE1b6o8JGnW5YougjxJoIP_NufkLQyO13wz95IkizY10oaugsZS2bGFKWxW
    Vnu5qKST28CtPJdvfR_WP93AEjK73bB2K8fMBT8_zdTV-HvwptbUyBW>
X-ME-Received: <xmr:qh0raopeLF88hsvYNHB12vMnrt9U6JTSWBZ_KECneu2d_c_bDaaNhE5S-fOUKlLLh_sKoAOzVTV7NI5WPWbb0izYHGUC>
X-ME-Proxy-Cause: dmFkZTGaouJIR5kC2J81I5sfEwZBn3ZT9RrdlVZBH2NdTyvnCs8J5l1+cS0iIw5iwCKzXs
    ifNT3VxPLcgDaNVSHOGFqwSN8mYhMHzCKHXMtRXmLS3K2fAWtCymAkJp/Wkyu1ibcEKcnm
    gcklheITNT/Pc6vQQRUWa0XBXpNjxU5nM+VLaLsK2AkB+R+spLShYqaQJ9w9JrDLh44uWA
    MgmQuSWr4OqltuDKF0LMp4YaUkQMB6oqXjZppdCtJ6HpkVjUk+zli1MFwg9Ak+kRuhNJ/e
    n2I1wmUz4K4UMMJ4VC9bDXSlbtRV+OfaQBqnQ2+JtMmX7LNrF1kZWZDhIPHG888cdmG4Ud
    xnslSY09Zg0Du0FXm6kyUU+kz0Jx2C46zBlRFwc33BN7dK6+Keg4jG9Tc6yi6XF2F5RSoN
    3vzCQjXzRa5DQOQTQSgz3d+idlCraIDmU8+hVeY94XLWTR1XFFWheSY4wTjwoLPqzQadbM
    wbwIi/mAbdEzHn62GbZoIYcz0T1gxMPVWbDY3M9Sen/qrGehWwwF4nMA0zn1iQwMc+I9ue
    AWPoZAK9PUjgGE2YRDBrfkqqyg/H69woRRoew5JBP0iTmY5IPSYWEQrDxKzZagvVphJTcp
    28QI5WEh+EI4gW+da1dIw1JUs95WhhrdZpw0lRsXJJtLTuWClJ0drqaphh5g
X-ME-Proxy: <xmx:qh0ram1NfvhA5JAOdpwfKhxYOJyPLDTy_3Vk352uEiz0-u0Yqzq_dQ>
    <xmx:qh0raoynTbfybGfUA9X_8HzaH2yvCYigtJ34_H7KHhrwlG1x2XQ1yg>
    <xmx:qh0raqikIBCjdNZbDKo4TxWEIqqxVh49Y2ypAFGGIc60VAFoRlLlsg>
    <xmx:qh0rajpPA6SiEKoJuXb943AU0Ud6SA4m0Ylxdq9AWluRJxr_MVYP9g>
    <xmx:qh0rau1tmaSfEXR6N6Lt10kuiFHy2OA73VjTTgG21Th-zrON3H28P7_v>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:18 -0400 (EDT)
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
Subject: [PATCH v10 06/13] media: rppx1: awbg: Add support for white balance gain settings
Date: Thu, 11 Jun 2026 22:41:41 +0200
Message-ID: <20260611204148.1423192-7-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64623-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,messagingengine.com:dkim,ideasonboard.com:email,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA6D96753FE

Extend the RPPX1 driver to allow setting the white balance gain
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     | 32 +++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 40 ++++++++++++++++++-
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 64a1b848f1ea..0e36b717b4ef 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -47,6 +47,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_awbg_params awbg;
 	struct rppx1_wbmeas_params wbmeas;
 };
 
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 7325abeba92a..17bbcf366970 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -17,6 +17,8 @@
 
 static const struct v4l2_isp_params_block_type_info
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
index 4a242b41142b..f30e12d6f880 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -26,6 +26,38 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
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
index d33abab05a0f..47a86aeaccf2 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -47,9 +47,15 @@ struct rppx1_window {
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
@@ -108,6 +114,35 @@ struct rppx1_wbmeas_params {
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
@@ -115,7 +150,10 @@ struct rppx1_wbmeas_params {
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


