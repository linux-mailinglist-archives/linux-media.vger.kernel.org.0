Return-Path: <linux-media+bounces-11942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C248D01A1
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06F5F1F228B7
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE3015F417;
	Mon, 27 May 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uRZz+9Bu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l6cS8RhV"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5293D15ECFD;
	Mon, 27 May 2024 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816760; cv=none; b=nQ7Q0shOE8dJGsUZTnab1n5m5sW7n+twNR5ZZqj61f6ORTq+181dT7KyhWT0wJJh9OB99E4phJ4TxuH0BMBz7M69RSewgMofrO21sOGNfbNHWsV564pU5QG48uGinWi6s9GyX85b9ImA/XZYMyLYC+c6eY4FSZ7ipCbD3vQ4GCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816760; c=relaxed/simple;
	bh=AB0FsQLv4tk8yvlOr8TpLu5GJzxJBOa/+7eevSPD3Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CtYNiqHGCZ5y5uzhzek6yeNCRFB0h8vPG5EN3C/4XlK+8RPxKPjSU4R5ALHwlLg0QTEtmYm4aHQVJ+x1yavveFPG5i0j/XBjC8x2UTgdTZ3WzVzPdVi1ndWRleMlyOsfeqF8V/C7K0xNTh/VUwvBxo4UM5EoJSduuaKy3pJBjLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uRZz+9Bu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l6cS8RhV; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 62D6B1800093;
	Mon, 27 May 2024 09:32:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 27 May 2024 09:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716816758;
	 x=1716903158; bh=NZHaukzJunEg/R8iAVsFjesSAYmTSHfUE9hswrg+sSw=; b=
	uRZz+9BuKnVxsSYVB2PJAgYu+mRjxzpLYZLSKjncbrRWYbZvoWK78VUyGlKoaKFJ
	FQk3XVTt3YgjeEwfnNHqc8xCe0Pg4HAOkcM4Fo5O3+yyGP2XEHSDzxOIuSjAiUOb
	fpuvpr4x76aQD0yVKkRcRsU0c/htNMHdRPbkSu73CyUcOQgSYouibjqdRN0LZ6mP
	Q/TRcFWhx+653XEM9wnh2DCKymGO+BGscP+EmNhQ2Jk0UNijukXf59kVzoc3A/MB
	3fCUFf1M1/plkyr5x/HtKTG+xGfDWket28yN7m11oF1VQ62QqX3X+jRmen1KwqqI
	SpvcSbum4nTb12oDF6/qZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716816758; x=
	1716903158; bh=NZHaukzJunEg/R8iAVsFjesSAYmTSHfUE9hswrg+sSw=; b=l
	6cS8RhVJ8EqVO2cET49cU6kZPQSgrgCV1vE1nVCXnNXrL9c+UxKfIujw1BSr1FAm
	jjN5VvLWF2xfaN9ofLuHoMTaCu6FmFGOlgk8rIMjjDcYRgLdLAZ5BlEVikQ9xenu
	0AkeY+JEamaF5H7HoOWHp9ci1QUbatBSWIjzokr/MgwE8Y1KPa7iAwTrzHBxsyyS
	aIQAIPAoRqaJcWvcZ0LXqFn4VK7e+XKF6YLn1uSZrydZ3OYB3lQdxO0ZaQCJ1eDp
	r2G4VjfYmn9h2R2y2QqfBkhS16C62nwHDnvypbucH1/q/DmviBUAqQOHxm6xsxiH
	4irCk4E5cR9Ht9DTtrZNQ==
X-ME-Sender: <xms:dYtUZtgzGkBiRowJzMZMGNEF2_ke_grvdP01JuTgYOwxbHLPRjRDnQ>
    <xme:dYtUZiA_0jjLgxlckfis40xqlR7pKP1H-Dl5oUidsB5LkzeixnGFJbkd5YtvsQtv3
    0uSC9npUt89dDD7nB8>
X-ME-Received: <xmr:dYtUZtH4G_-Lgqidyvn1b2J-u_ayKQUg2-kxlYDKwZ85b4dEivNsZSrKktVEk5RCpcFaYWV-Xfn-xqb7tQa24YOrNrkeTZzJ9f-Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:dYtUZiQjBKTAgBiYnEQkcvr23ygjVtlDODwj3wSLnFJkSYtXlTeXmg>
    <xmx:dYtUZqwSyWZoT93BxgQngl3bDF-4PhOVQM8wzWDE2FYJDoTUTL8kGw>
    <xmx:dYtUZo4X2kndxjH26539r9uqqME-kAVCQKjMEvaUV9mD5LijRe_6Fw>
    <xmx:dYtUZvwsi7DP_bz8Dn8yA2x6yXC5iDVI325d-N0_t6mWgcuAcS6D4w>
    <xmx:dotUZhprz0osGKMil-0PeIxV7sIB_2L4XW1xUoCppEUsL9Qg_mVmClxD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:32:36 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/7] media: rcar-csi2: Correct field size for PHTW writes
Date: Mon, 27 May 2024 15:32:15 +0200
Message-ID: <20240527133221.1688830-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The data and code written thru the Test Interface Write Register (PHTW)
register are 8-bit wide, change the datatype used to reflect this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 582d5e35db0e..6cc128990140 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -238,13 +238,13 @@ static const struct rcsi2_cphy_setting cphy_setting_table_r8a779g0[] = {
 };
 
 struct phtw_value {
-	u16 data;
-	u16 code;
+	u8 data;
+	u8 code;
 };
 
 struct rcsi2_mbps_reg {
 	u16 mbps;
-	u16 reg;
+	u8 reg;
 };
 
 static const struct rcsi2_mbps_reg phtw_mbps_v3u[] = {
@@ -1425,7 +1425,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
  * NOTE: Magic values are from the datasheet and lack documentation.
  */
 
-static int rcsi2_phtw_write(struct rcar_csi2 *priv, u16 data, u16 code)
+static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
 {
 	unsigned int timeout;
 
@@ -1462,7 +1462,7 @@ static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
 }
 
 static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
-				 const struct rcsi2_mbps_reg *values, u16 code)
+				 const struct rcsi2_mbps_reg *values, u8 code)
 {
 	const struct rcsi2_mbps_reg *value;
 	const struct rcsi2_mbps_reg *prev_value = NULL;
-- 
2.45.1


