Return-Path: <linux-media+bounces-52351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BmREdx/iGmKqAQAu9opvQ
	(envelope-from <linux-media+bounces-52351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 13:21:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A82091089A5
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 13:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 085D3300D907
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 12:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD183570A0;
	Sun,  8 Feb 2026 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kbRwQIxh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vG8S5pNS"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B8350A2C
	for <linux-media@vger.kernel.org>; Sun,  8 Feb 2026 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770553293; cv=none; b=uQSWel/MTeV8ALa3E/siah/gRvFqWLzFGUDbI7PhNqNo/Cn8+relfjH1aAkYbXBMTq+AAOTUR6wTKBNn7nKHYQmdYWKRrBpQ8GvDWzetK6VEofkQzI5sE25QPXCVjZ9g8H1qnd+PPyMykfojI+XMGFJuEsYkHFYTun8afal6ymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770553293; c=relaxed/simple;
	bh=36+gHvjSka+cJYRAjmD2RxE804Oin3GdPEIsuWalDCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f1D7VrJ0zA0qxjrxCZ8bWHn35mbhBrq8NGluuYgXaYspvqfyUpr6bzYuRzi89Z2TaPNw6vzqVB3DQCwaHrF9UhrP/gtEvrdfj9//29zJZuU7qDlN0U2yBQaToqTbEaJ3Klg0qxmxaMt58Y3vxv/Ufi1R7wFNWjRZBIUCbHojXv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kbRwQIxh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vG8S5pNS; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id EF6C71D000B2;
	Sun,  8 Feb 2026 07:21:31 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 08 Feb 2026 07:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1770553291; x=1770639691; bh=/J
	Yz/mbu/n1/5mCkKBC9NERe0cBwHnaXXuiMd5iWUy8=; b=kbRwQIxhD4Xo3lsYdZ
	Gw63Z440wqpD0uYMit81IxFGqwAJJoOT0/pZjeqbsgkGEyAoQ3FkyVV/4hFSqIyC
	771pHoWHST9HRCnofoTTREqmaJo7B8Mpy4aO/PFt92NLGsutze8EJqLb++WnlP1T
	HQqfgOLiPj6d6y01rAuzkTN7hV4q9kDb/umBBd+uI758DxsfhAjtdHpg4ub3/mYG
	LFEALBoeuza2gom9/UyL+m5zquIWdug2G/PzceL7BP0iSwG1zS7WvUX3K0f+knuP
	XlDsFYUmmY0FJ4e/o7mZLguIVJeEAyk/1uVLbCdf/mKldwOlzw0yLWuiIvQpbibe
	PWmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770553291; x=1770639691; bh=/JYz/mbu/n1/5mCkKBC9NERe0cBw
	HnaXXuiMd5iWUy8=; b=vG8S5pNSvgAp2/xKmbGCVh8miFw1n0ss33pv13lb20Nr
	ZbSPI5AWaom0pq/3cQdN3rKjS7UtMY0yzpZROFoo9BJxUKjbsTRFF0/0VsXjLriT
	z/Fp5Tivh0ofFMki+DbiU8wQTdueMF5+fdblRR4FbjnTRCZ/rRESDvLBfqu2n+vk
	tIPDsOa8W5KUhf+ldnds0ZNnNGCTQoykfyMMB8tjbORP6qL5Yg30vqLVC8Clt9SG
	tGGpysvusaqvBMLozR7+E4x7hvlDPeLuxWJFF2vByhsPYf6G6TZzdzYXQlmmLqU+
	cTH2O7+NBvrkHaM05mCoF/Okrc4GR7suHkGkVqe0hg==
X-ME-Sender: <xms:yn-IaW4s6UKk2Y6WKAASEOiIa-MU6zr1Rk2FfyuM4e-6UBPzj_LxEw>
    <xme:yn-IadvMui1Ivyy25WB1oQas6WxgZUMcPtVaaAd0nbblmqg7OHJdirabKkt5sOpFC
    qe2ObLjMWYyhiIcMSv9WqENoEfqdvAruS4ghvkkArSkdpSqRmIf6io>
X-ME-Received: <xmr:yn-Iaf4wu71F0eU_je4rNc_rxvPk09sD1q-rvSV0_9_Tak8l_mRCrgrH1xv1IhlAeL-9OkiZjOnmCUcuc7XIzELm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleefleduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:yn-IaQVedrP0UIBw9FKGNaiG2YQ374_sRIrU8sqPCNQlONORp8Ky8Q>
    <xmx:yn-IaZ-ZZUxURNslmOe7GZmyCm1DMJISYdHMgNIqnaCVsYxCPDrdXg>
    <xmx:yn-IaUkpCGsRWNDywD-ZZBzWMtIuHjGM9vOKF93phAGKQgd4eMqxZQ>
    <xmx:yn-IafW87-eOQFMXVJJcjF9DcSAhjhXsJct-H-OGRLMawGL1Bbeq7A>
    <xmx:y3-IaS4Ne7Cd-j_30tfmYvW-Ca-CW10Blg6R_YfK4i2rBEOJCyVasTSF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Feb 2026 07:21:30 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm,PATCH] Add warning for non-pixel perfect bayer layout conversions
Date: Sun,  8 Feb 2026 13:20:45 +0100
Message-ID: <20260208122045.3175375-1-niklas.soderlund+renesas@ragnatech.se>
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
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-52351-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: A82091089A5
X-Rspamd-Action: no action

While adding support to convert all bayer layout conversion to GRBG
before passing the raw data along to the rgb converter, which only
supports GRBG raw data, corrects the output image colors. The conversion
is not a pixel-perfect conversion of the input image as the input pixels
are swapped in groups of two bore being converted.

Add a warning to highlight this to users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index b834add4ea6c..59fc4123ebbf 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -201,6 +201,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 	case V4L2_PIX_FMT_SBGGR8:
 		swap_line = 1; /* BGGR -> GBRG */
 		swap_gbrg = 1; /* GBRG -> GRBG */
+		printf("WARNING: bayer layout conversion from BGGR to GRBG is not pixel perfect\n");
 		break;
 	case V4L2_PIX_FMT_SGBRG16:
 	case V4L2_PIX_FMT_SGBRG14:
@@ -208,6 +209,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SGBRG8:
 		swap_gbrg = 1; /* GBRG -> GRBG */
+		printf("WARNING: bayer layout conversion from GBRG to GRBG is not pixel perfect\n");
 		break;
 	case V4L2_PIX_FMT_SRGGB16:
 	case V4L2_PIX_FMT_SRGGB14:
@@ -215,6 +217,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 	case V4L2_PIX_FMT_SRGGB10:
 	case V4L2_PIX_FMT_SRGGB8:
 		swap_line = 1; /* RGGB -> GRBG */
+		printf("WARNING: bayer layout conversion from RGGB to GRBG is not pixel perfect\n");
 		break;
 	case V4L2_PIX_FMT_SGRBG16:
 	case V4L2_PIX_FMT_SGRBG14:
-- 
2.52.0


