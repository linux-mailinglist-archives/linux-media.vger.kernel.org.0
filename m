Return-Path: <linux-media+bounces-64628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C4lDIJgeK2rR2wMAu9opvQ
	(envelope-from <linux-media+bounces-64628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:46:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842F67547C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:46:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=KFq8d68u;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="b gCQ/EY";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64628-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64628-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1716303B310
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF25F368941;
	Thu, 11 Jun 2026 20:42:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAF646AF36;
	Thu, 11 Jun 2026 20:42:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210552; cv=none; b=Zp62e7p6nE9lg3DGj1xCQ/l/3pRrWibK3YxylAvFPPHHu/pcSurmc5h2KFta2BBG34I57FHL3NVKSgAWqQNCUBCp9Vmh1I8d/3/u2SOtYoc15zOF11Jpp1gv0uUCoKWUIayxL3qhu1fm9elaXjlnUPDgPb04q44OhUoylFgLQeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210552; c=relaxed/simple;
	bh=EXYwI3Omb32dHnQhErtLh+s9L8VDs8d/vtMQh/xcQhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfmNKpQqnKR6yD1VCATa8pzcHxXycTuaEdYnWL76TpOooH0+gtKqYTirCIqcG/rDaCza0PtbBD8awxfZ0JGpT9IEZAXzAiuBcH+17BOJ/Pak5PaIkQLkItx5OY11757MnXbnfb3/iO9R43tWCHf1qqg0/YVu/ADusKnT9ljqCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=KFq8d68u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bgCQ/EYj; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 988E61400083;
	Thu, 11 Jun 2026 16:42:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 11 Jun 2026 16:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210548;
	 x=1781296948; bh=yK9SPidy8xwCtScTIPdViYSuP7W319yH4QKco7vllu4=; b=
	KFq8d68ukZPEGV+4/4M3I5Rk8c3uw3KBAftCj7V0bowXwMFwBGutQkm6CfSbDfM4
	0cA3zTY7g3u8rmo0mMhk8B3j7d6A3Qrl33/z+ND6m68qL3JqqNOA/c04HKIWcRTJ
	knAtHb/1X4a6P4xrnzz4yzU6JjayH7p02PlD6IPRGRcCma6eUnv7ZxriJ0HcOtgV
	0VFeIDoqNRhY49N7Y5Ht6qnST5j2huFTR7qYlHDp8FRhmSk6u29XSXlwHldtzXWj
	BwE3PLLkxkdMYf6nWS8aWJQz7d6+hankns3uGrERQesNxUzBwfiOWyl0fpazrh/A
	BOjlIRVAkbFs96kLLlb3Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210548; x=
	1781296948; bh=yK9SPidy8xwCtScTIPdViYSuP7W319yH4QKco7vllu4=; b=b
	gCQ/EYjMbfeDG5GmN/neoonj+XcM87v9zBlpxQGgklK5H8+60ux5MgVjRz5h2uLX
	X/oBuizxG0bJqKgO27JutL/tx3CaMlLfFBCu2NDaLXyfyXryqTBxzoREx2psbFPT
	eZZl+/sSBX956+wjyWdluwceYdNXOMdVHNr8aGxeEz2XTeTS33ibH8k8vj1OO5Mr
	Ue9RZ3594upEubsFKoB9pLqSQt6xmEsJ8TwgmjgVrvwIJQGsjrMUnnIRU7OOf9dW
	E8ZQTTgX6S7fActEEHSR81IQI7LWIkPLOPyn3Hpy4v7Gt4b821VPYFDdQTHaTqqM
	EJW+FP5Izc65B4u7aMXKQ==
X-ME-Sender: <xms:tB0ramvuztOWAuCCW2duR0OcKNzSWoK7pBZOFbDrO7wwgBClMeE_VQ>
    <xme:tB0rahcd9oYeLFaTcYHm6U3WLOGs4Kor9UYwN5749ac087DQWqpmIje8bbdCuorom
    LT-IkWPuRGLtxSpJjIRj7M1CnEw4P8MzWujei6-PwDoNjErfkDRzgMj>
X-ME-Received: <xmr:tB0rasl14etOkESVpV1ctM2inBgtgv1yCf_ztsjkTMUGPcsTrKvuVCdiS573wfflg3VdmGJwK5gOZ6JHDw3EwrpC5URR>
X-ME-Proxy-Cause: dmFkZTGxElkQpZKuuZIqkKBJAFdRhkHm/9iYIJMf9OZbtUFKoFmvg3oWFyWDIgyTOM0Jba
    2Q6bwItLaOYA3kzoPcZe/N+kpo9DXAwczNA0VXwrjxbGx0lD2XXXlr3nsZMZb0xS4b6XXe
    I6iW3031atpYYSTEncWcwXnzdf5jCUyIHlKnUqoQN2MsRbIrSh4OQDyLy/jJRFPtBa7IF5
    rIOcFVsNMhucIeQfJcSDZj21MW0HM2+2r1mEWmR9Me0JkGW3nVOb6+uq0O8fbWZgX4+nsR
    HEtMRdZF7zaasRzz6Vm4jiAnpbSpUdOkuebJWUCyBz9msAxYj7jERII9BhifZnQbpsjJWk
    +XBH7n7rWFk1xzSLU3BDogOEvm4POV2cctVMuD9hT/DDo7R/t2c8JbNkt9TSDIx22HmpTo
    iBdjXsuAyBSsnPEflW4S5zxFcblahDzdoazzSab0wY1Mv/t8mkiIuE9U5hfSU03XWescID
    avxXebG28+hNsgJYdprv34IP/wkOOGMGyIAYeUAXZBpfMZJErb3JUB+OjwbKki1vkYoLOz
    VOFTjxq6VoCdOOEeisxlJ6Umo4ZtRxtEky6hZddQvBlcYLS3b+39XhlkXoS2Yp+Ewz5cKf
    RxVKq3EG6PluC963wewCD/KFIglZXl8crFjFn7Kjk2qIfT/ZVr0RJzrcttjQ
X-ME-Proxy: <xmx:tB0rakDNj6RvWtWJlVPgYfSPtpr_ivVeAeyWVWZynqqr4TTnZ7PoCQ>
    <xmx:tB0ramOmHIRz5kVRctHBofL0mNzkMEd4l6PvOxDaimkSlx8v_Ty_AA>
    <xmx:tB0rajNQbJ2nN8JHP4P8IZuEO1uBOqpws5ARc6AEC8Tv7HRYNj2AuQ>
    <xmx:tB0ramk7fnfE8YXRTEwXDyQvqPsjBh_cPftXYZi-VUQXY7OuGnrRHA>
    <xmx:tB0ragxF66k4L6EmYE80r1KGw_MhJ8-ue0UI3h-CEqPSeViDXDYaKxLs>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:28 -0400 (EDT)
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
Subject: [PATCH v10 11/13] media: rppx1: lsc: Add support for lens shade correction
Date: Thu, 11 Jun 2026 22:41:46 +0200
Message-ID: <20260611204148.1423192-12-niklas.soderlund+renesas@ragnatech.se>
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
	TAGGED_FROM(0.00)[bounces-64628-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 7842F67547C

Extend the RPPX1 driver to allow setting the lens shade correction
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
* Changes since v9
- Add missing 'pipe' in comment in rppx1-config.h
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../platform/dreamchip/rppx1/rppx1_lsc.c      | 119 ++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h |  54 +++++++-
 4 files changed, 178 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index e039746ac542..48b61b5c35b4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -48,6 +48,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_bls_params bls;
+	struct rppx1_lsc_params lsc;
 	struct rppx1_awbg_params awbg;
 	struct rppx1_ccor_params ccor;
 	struct rppx1_hist_params hist;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a83d393d0504..8d85d0c7bff1 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
+	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
+	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
@@ -64,6 +66,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
 			module = &rpp->pre1.bls;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1:
+			module = &rpp->pre1.lsc;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
index be49fc17ea26..8badeca23e24 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -55,6 +55,10 @@
 #define LSC_TABLE_SEL_REG	0x00a8
 #define LSC_STATUS_REG		0x00ac
 
+#define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
+#define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
+#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
+
 static int rppx1_lsc_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -64,6 +68,121 @@ static int rppx1_lsc_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_lsc_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_lsc_params *cfg = &block->lsc;
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
+		const __u16 *r = cfg->r_data[i];
+		const __u16 *gr = cfg->gr_data[i];
+		const __u16 *b = cfg->b_data[i];
+		const __u16 *gb = cfg->gb_data[i];
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
+	 */
+
+	v = cfg->x_grad;
+	write(priv, mod->base + LSC_XGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+
+	v = cfg->y_grad;
+	write(priv, mod->base + LSC_YGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+
+	v = cfg->x_sect_size;
+	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+
+	v = cfg->y_sect_size;
+	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
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
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index c13c7c99c078..c8378910bee5 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -88,6 +88,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
  * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1: PRE1 pipe Lens Shading Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 pipe Lens Shading Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -102,6 +104,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
 };
 
 /**
@@ -446,6 +450,52 @@ struct rppx1_ccor_params {
 	__u32 offset[3];
 };
 
+/* Lens Shade Correction */
+#define RPPX1_LSC_SAMPLES_MAX 17
+#define RPPX1_LSC_NUM_SECTORS 16
+
+/**
+ * struct rppx1_lsc_params - Lens Shading Correction configuration
+ *
+ * The RPP-X1 Lens shading correction module is available on the PRE1 and PRE2
+ * pre-fusion pipes. Userspace selects which pipe to operate by setting the
+ * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1 or
+ * RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2.
+ *
+ * The module applies per-color channel correction factors @r_data, @gr_data,
+ * @gb_data and @b_data as a 16x16 grid mapped on the image. The size of each
+ * grid segment is expressed by the @x_sect_size and @y_sect_size arrays.  Each
+ * segment shall be at least 8 pixels in size and the sum of all horizontal
+ * segments @x_sect_size shall match the input frame size width.
+ *
+ * The correction factors values are expressed as unsigned Q2.10 integers
+ * ranging from 1 to 3.999.
+ *
+ * Pre-calculated interpolation factors shall be provided in the @x_grad
+ * and @y_grad fields, expressed as 12 bits integer values.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LSC)
+ * @r_data: correction factors for the red channel in Q2.10 format
+ * @gr_data: correction factors for the green (red) channel in Q2.10 format
+ * @gb_data: correction factors for the green (blue) channel in Q2.10 format
+ * @b_data: correction factors for the blue channel in Q2.10 format
+ * @x_grad: Interpolation gradients for each horizontal sector (12 bits)
+ * @y_grad: Interpolation gradients for each vertical sector (12 bits)
+ * @x_sect_size: Horizontal sectors sizes
+ * @y_sect_size: Vertical sectors sizes
+ */
+struct rppx1_lsc_params {
+	struct v4l2_isp_params_block_header header;
+	__u16 r_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
+	__u16 gr_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
+	__u16 gb_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
+	__u16 b_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
+	__u16 x_grad[RPPX1_LSC_NUM_SECTORS];
+	__u16 y_grad[RPPX1_LSC_NUM_SECTORS];
+	__u16 x_sect_size[RPPX1_LSC_NUM_SECTORS];
+	__u16 y_sect_size[RPPX1_LSC_NUM_SECTORS];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -464,7 +514,9 @@ struct rppx1_ccor_params {
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_bls_params)				+	\
 	sizeof(struct rppx1_bls_params)				+	\
-	sizeof(struct rppx1_ccor_params))
+	sizeof(struct rppx1_ccor_params)			+	\
+	sizeof(struct rppx1_lsc_params)				+	\
+	sizeof(struct rppx1_lsc_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


