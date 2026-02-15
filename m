Return-Path: <linux-media+bounces-52818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJybLcZ+kWlMjQEAu9opvQ
	(envelope-from <linux-media+bounces-52818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 09:07:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF413E45B
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 09:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F210D3014C29
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 08:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3492296BDC;
	Sun, 15 Feb 2026 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="G8eh51qc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RdkTCYnl"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D5D1EBA19
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771142847; cv=none; b=L3ncW/tqHTcmau7mgQfAe3xKszlNLCQLeB3kSGYtR3tl2jaUhAAWxcsc5b5m4Z1I2Je0Yzsj+G0Q2kxUdGBn4ZE8wc9mcPo781u+Ys0kubVrGnDx6YeNRdGrcCTkkSJ6FD9Qc+dvN3ew2Wp6VCAUtjzIYBJA6wYz3ahsXAZSlIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771142847; c=relaxed/simple;
	bh=tHXTqSmUPVnLyun1Y4Bl8vYVaw7J6M9S2/Ky7QYpcSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=exgJK5iHxXCJVceOLmNKrTFuwZseaW4JDEuursTD0kZrgx0fcKZbKO4EQ5M81wH//hOuylIzp3CMssIt8Y2jWjoc7/OLfzgz+qdpBOJb4ynbIC77kBuXTR3G/HlGJrlcNAOwqY/0BwkZA+yi5z4gIFrwQ/+VR3IL8rciCXc9/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=G8eh51qc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RdkTCYnl; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 82577140006E;
	Sun, 15 Feb 2026 03:07:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 15 Feb 2026 03:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1771142844; x=1771229244; bh=QZ
	fx+IA80mG3Aef6teB5HCBYTSasCPlN8afoyfys6b4=; b=G8eh51qccOymq6w9/9
	l0Rljr0S6dDwBK0U0Su8vzoNHg6lesGNSYESu0cbUK6eRIpDMt1DPSdhGRSy1cqm
	S1SiiDo64Snp2o2W82aClMVzE5cR4S6iycli7CaQnh3fg5HlkkEpD3E7zdGqx/2i
	syhIn1HBydmTypKSaF37u/XBI215lVDuzBzwe26DjJMrXQ/XrgymIFgpKtuYZgv4
	W3kwat2GYeVBshEPcRXe1Cxplx+v3rd2702fMjwR+Ge8hlxej/XcvAuIPrDv5VX8
	8zZ+ie17uhLuubWzxzX8yaL3kEIbccW7GPurbQrne9L5yJvvufjKmBvCv3JhgyMG
	QHlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1771142844; x=1771229244; bh=QZfx+IA80mG3Aef6teB5HCBYTSas
	CPlN8afoyfys6b4=; b=RdkTCYnlCIkn2wbkyCTUYnHGlJC+CRfoM+ILJaao8NXz
	TgqFcx7mRkCISI+ycU3moVNMAY0N96t8bYMzzXmconCs2+XxB2HC7dhIlgdA9BRM
	pA0e5dbMrN2KroI/gUr5trFa+fXDBU9k3ZtQRui+v6lRZPHD0KhSDssVkDjMgpLK
	2gxei2bliDa5FLxOz5kiR3fm+TnY7BFBPctbSMg5tK2YfYVkXZS/KeBbtXfIhBR6
	6a1SuQ17x92UiqH5pJGzPxe4Q6WI5Vc0zoX7Z5pFRnlyllj40uMywovpbbd4ba74
	KDSwyL9U7seaU5RPiRmqsZcPPp1fQyqqPH2MHbNEgQ==
X-ME-Sender: <xms:u36RaesGS0RuikjvtishWDyKuRNCD4oNFusWRK0Afe0fTLaq4hnu6A>
    <xme:u36RaRQi7X-b1HuNqQ2iojvppbH302_ka6VNqLSEqEcB1JCPoy89RV5lN5B2kWFGr
    j-TBSD-ZDEwja699sFqYIqTQ9YB6n6FQTJG9gUfFmlMJ6Tdd8Pbjmg>
X-ME-Received: <xmr:u36RaUOwRvRYe3SE_WauXdp95qz43HGq8s5ClHa35XzAiaV7UXrzx5hrx8d3hGqfbgN41_nYJmhoYZq89a_JGkFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudefgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrsh
    honhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnug
    dorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:u36RaWaMz2oswBCP4EMnNZhg9-ysYDoV9AIPcW39r2_ixJg_ctBXvA>
    <xmx:u36Raex-dVwhTxSEsb1wLQjWHXy-Cbh6G6nMQsD0Wxz2P91wzNOdEg>
    <xmx:u36RaRL5y7It8HPvHsTbYXJib0NEW_mnft8RVmuV29dMT2UVn4NcWw>
    <xmx:u36RaYrLST6KjLKsgRkEkeYOcrSMBsI2KfABWOCaziG1M4FeNvyDpA>
    <xmx:vH6RaeO36QQ0OSsXA7w3vRwvgjyw-SrUNNlvsjzUuSmoxGeDyYYOTlvL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Feb 2026 03:07:23 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm,PATCHv2] Add warning for incorrect bayer layout conversions
Date: Sun, 15 Feb 2026 09:06:51 +0100
Message-ID: <20260215080651.555939-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52818-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDDF413E45B
X-Rspamd-Action: no action

Not all bayer layouts are correctly converted, add a warning to
highlight this to users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Rewrite warning and commit message to be less benign.
---
 raw2rgbpnm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index b834add4ea6c..baeb8efc863a 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -201,6 +201,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 	case V4L2_PIX_FMT_SBGGR8:
 		swap_line = 1; /* BGGR -> GBRG */
 		swap_gbrg = 1; /* GBRG -> GRBG */
+		printf("WARNING: bayer layout BGGR not correctly supported, expect conversion artifacts\n");
 		break;
 	case V4L2_PIX_FMT_SGBRG16:
 	case V4L2_PIX_FMT_SGBRG14:
@@ -208,6 +209,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SGBRG8:
 		swap_gbrg = 1; /* GBRG -> GRBG */
+		printf("WARNING: bayer layout GBRG not correctly supported, expect conversion artifacts\n");
 		break;
 	case V4L2_PIX_FMT_SRGGB16:
 	case V4L2_PIX_FMT_SRGGB14:
@@ -215,6 +217,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 	case V4L2_PIX_FMT_SRGGB10:
 	case V4L2_PIX_FMT_SRGGB8:
 		swap_line = 1; /* RGGB -> GRBG */
+		printf("WARNING: bayer layout RGGB not correctly supported, expect conversion artifacts\n");
 		break;
 	case V4L2_PIX_FMT_SGRBG16:
 	case V4L2_PIX_FMT_SGRBG14:
-- 
2.52.0


