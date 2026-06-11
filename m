Return-Path: <linux-media+bounces-64618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /zRFIq4dK2qf2wMAu9opvQ
	(envelope-from <linux-media+bounces-64618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:42:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAEC6753EC
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:42:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=t6ckXCAO;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="F jZjkv7";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64618-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64618-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9054C3037B62
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C164C901F;
	Thu, 11 Jun 2026 20:42:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E495236F8E4;
	Thu, 11 Jun 2026 20:42:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210530; cv=none; b=qmjmUf4KbNpFTowPAAzGQbQlWs/SxHHA+MvAQ1DUtXtcvunmKv8MCbf2aF9olDYoYaThgBfC3545SUiATQRPOJWF3crW8rWj8hKfYQ2keeOVxrggm9YQxt7plWN/59KAooMF78NjtH30O+utuYWmkcaVK+LF4BcUQKGrSNFV6yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210530; c=relaxed/simple;
	bh=cczfPQFCh9sr2exfMsGQyLvmyRD5uVtbTQsPqX/aFPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pvRLqYrFZ47I1ZUxboaoxaWafgslkXJFFHipNPkOCpGWksELFi+gvYi4wf+9NmnqDZ72CFbQfJeC4I8ZQnageYQLg0e5my7qLVG8QJ/mzeOY7Xyj1JoGBoPle2lFopu4T6TjhRiquuSjGMLEiX3Xa2RfeYOqLJJ4N6qbE+1HBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=t6ckXCAO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FjZjkv7B; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 45BB0140006C;
	Thu, 11 Jun 2026 16:42:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 11 Jun 2026 16:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210528;
	 x=1781296928; bh=8s9vjoYMYF2Sjsg3CHw2Yw/d8G/4iac/Y/c020DSPtY=; b=
	t6ckXCAOw2EfVew89/vI5R5QlI87u7aFD16b8jfg1JYjLfwFf0+7DP0DILkW709b
	7WL4lMox40aZqbXp00JN5qC/ac7Gfx9wrdn+NOUdrEBLvfii04QahO/jrRJ9g8Kw
	rTtLndhFrqzrOMX+upqE+rRFDgcpgZCgGYqAihqI7NpwRq4x1DlkZ3hp2v2VnFXQ
	MhZXyMvl8FxRbCZG1Hfk5DSgfwIJOkC90/jOm0C0XOsv1v72jKglBqLqoO2vXK63
	9ANwpZXTMpZt1w2R8CSOyRgnsM+RJMoCDZ00NaMw9yiTBNTlwUFuZluTOtYvYnsq
	nupYVHwx1e3wddl3j5WANg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210528; x=
	1781296928; bh=8s9vjoYMYF2Sjsg3CHw2Yw/d8G/4iac/Y/c020DSPtY=; b=F
	jZjkv7BbQa9wI8qwZBFVAIkbQ2pooFLMRcPe/fE4pCxX2CDQUJsao1RcG6gXtevJ
	0MlZZH2EOeiINYR6nSpV11ieDbEOfVrVAjgV0znJyIHl4+kL4MS3rK5maDMjC7gd
	Je4LeetTp0RXrgYZ3xGhHJi8cP+J1OsaU4jdbcKzrlaqJJ5/WBpTIt+X+ItimxgB
	hkWsuvCqn/a8LIMmfBEluyh8KKkOWoXT17VvBaD6p6lASyLojLSfbeRSVCEFjUVd
	oiXh2T3uf4h1p0pgAYOo3CMXt5cL4k3wgx47F4PhJi1vOYz5w+UOtAxMcIh83ICk
	kDj4XochEeWJhHRiz3KPw==
X-ME-Sender: <xms:oB0rargrbOFVUHkFpm8jwbQ5sVKC1FIx0DH5Vnnqxj6sfD4aifySCw>
    <xme:oB0raoejlxnCTvfvbh_7mrUQDzUOCXHYTqVDefYV_UGEC-Crn4FggMdBYGFwyPUEJ
    QBkkgMqk0rcHWH5IuwYOhu1kyh6mEsTas2tM7l46_DcywcuASolJQ>
X-ME-Received: <xmr:oB0rarzm9r3X8Mug9cBmQVLVjRJ_2YhwG_tRmV9nxDSUs3teB2icokqzKUUEGGqNGcAL16kUCFgu_ZObJ4XsQ55QAbIR>
X-ME-Proxy-Cause: dmFkZTGbQ1ons1uHxuCmIwA11+//6aykV8uG9Zn8UljCW4Da5X+Qh/cfuB6klBWqqDrv11
    iHyw8YrI9yrgxrrqjDw/ia3/oP1aMN6szYEL9ic/g60fGj/MwfTFbAuCxV0tZQBwXeDvw2
    FWwwcNWnN+OP+TBPg+XiIyq/Mm+98HUhj9gyP4IRx2u0+3FL01+QldACa1W9edDhNlzcOC
    R+r4kCIdpx9A9fowrX2o5rWamogwI4gvzIJNVZSzOIm0xtgP4kLJqsKuZ7DCq9OY0CJNc5
    qPUFgLXAqAGdPS4l/qBmRHtmiYB7vqM1NhWs/b0pQQffSa/IR6EahItOsFkBsEGl98vJFi
    R11c89ERUfo+3wxTbL5Yurk0wLGO7my1XVRIho4BFLeip/jmZpI2I+2FY6eQlv3ubRzOpM
    Xd0+7JtIcwsiZ/SCvT+RWjlEp6dYciQNz12dK/m13it4HLXqRRuGSq/FiuiLvviaLBvk6I
    ubwLKXD2ZEqU+/LzAQiOnLWyiI3z7uPwhyh/DgDe/QOp87OfmeaWLLnyCUjvC4Rz8sYMQw
    kMR/pTaNTY/8nETvXDPVqXAVoCx24+YUpfvS7E7y7QXZKOpoVJxhtYoCYitBUrtfYFhqWv
    QNmJeYz6eolK9gUoFXJ2oX3gAvFfwtbc1T+vWnJaoe9LsIsFwUguWu1fvVfA
X-ME-Proxy: <xmx:oB0rav0MierVw9l925qnK5N7blRphT7aone28nRGGbBI_H0oT-Nh1w>
    <xmx:oB0rapwO6NDBXoaCRPvLcfdPuWGLCPJ7NIIJcs7pKZPMcaP_orUwkQ>
    <xmx:oB0rasVhM2BJT_juS8KYVcY7If7RPamppH1dOOps97N2hUu3aupGmg>
    <xmx:oB0rat92cXOi3YqSBo_mU_fUlZTbXs6dyJs9ewXI9soiE6Zr1_rI_Q>
    <xmx:oB0rag-MRoOEhJCoigXHXwQH5GIKza4yoqeu9YCh_epV0-mZy_bzbSG1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:07 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v10 01/13] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta formats
Date: Thu, 11 Jun 2026 22:41:36 +0200
Message-ID: <20260611204148.1423192-2-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64618-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,messagingengine.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FAEC6753EC

From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>

Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
parameters and statistics buffers. These formats are used by the driver
to exchange ISP configuration and 3A statistics with userspace through
the extensible parameters framework.

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..cd3f4a86e27f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_RPP_X1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
+	case V4L2_META_FMT_RPP_X1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..1f78b5378b3b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Dreamchip RPP-X1 ISP */
+#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
+#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.54.0


