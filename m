Return-Path: <linux-media+bounces-11936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D947A8D0138
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79BF3B27605
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A14D15ECC0;
	Mon, 27 May 2024 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="vSaiTurl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gOWhtMbg"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486184EB55;
	Mon, 27 May 2024 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816069; cv=none; b=fkGDOj2Tsh1X6nznmZ+CijbbWnlSWfyP80TxqIpsV6DlMCHUSLzuHaAuCfCex7esuvQaHhYHg8qtGuFRdf6qKk2tW31sSgbQe/ZoiX6Jh1bp5OtrkGNVUSkvxZfGzX3vwoWR+XsJqSxe2G+Q66kr0/c5/CMByYrW/Pbu1YrRMc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816069; c=relaxed/simple;
	bh=pUxaPQGEHleCWQteuyI6YiWaRrgOgYkUCIM62M9iV5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G+A9XZlaGDVcyJXGDUquxkye+onh+/Ueby3UUw4lbE7IVmSKIgD+KGx5KFmvCn+AASzxPD644zgzG7x1kgNfpzBKxsERYjTLSPJn59mwX365/QtjMWB2nwYRGyVW9imKxoAOPkqJ1EbEExwX0cYK1YEGmJoS1YTUyhE1r9E1Iog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=vSaiTurl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gOWhtMbg; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id D676A1C0009A;
	Mon, 27 May 2024 09:21:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 27 May 2024 09:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716816066; x=1716902466; bh=lc
	CBvJhJF2Y/GHlMp9uqerpAJEJsAobCnAbC0eaTZ8I=; b=vSaiTurl19xf7IRltW
	ywhTqXv19dOB6DgIdHNCNqRLfd3aQprAI3shKFw+kKedvvr76N5GRhOZNaugKSAU
	I8Rddj4o/dDjbn+MU1xbtPUisBrsz9T71UtbFWtrNJRh4jSY9AeERsq+YcpYsURB
	QIyd7DvUb3DwAZ3ZI5kEISdR1tFIn0hdXjUO1vR6Z50fwhh+1WhAvNl3yepF/llV
	vGHg+RWZVL14o5SVIdoMUoAUcW1v1YyFrYPQILFt2429uWuFiWmkieix+9YbEaZw
	YUiiapwF76utbDujnIMK+BeHBMVJgJbK6xwwSRVbrjV5E8XXo5RXBN6V85NL3NCj
	d5+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716816066; x=1716902466; bh=lcCBvJhJF2Y/G
	HlMp9uqerpAJEJsAobCnAbC0eaTZ8I=; b=gOWhtMbgGK5QHIChz15Q9Om7Z3c7v
	t6938YMuZDuLp7TlMC3ZtIaW+Zl4Jks8EwbmUjkYB9G4Z21EYYZiBymgaLsTGkbM
	auJkwB/7cdykFtG9d36nwwc1ggrK88CmYClwL2hd5XVi4qnI1X0OcMLf6sXfS8od
	X0tasI2DMnzrIv6I0CB2P2B0vHMGyGBdDZIGRWsN2+EVjn/ZXbcVORvhk9mZuViV
	9Jgrw7x7j3L8MyrMOo1KJdrQEGqLon3VZJtwTtWqovowiI63xPyR20t0dLJgBaJy
	/mdhO6SL0gzMwMZbpJyM2Co2EZiRcXUECqpqFj9Rp0L9cp4gpAzSo3Htw==
X-ME-Sender: <xms:wohUZsnei1_H_2VaKH9aM-xA2C-ufPHx6nh1YXYQ7rYi7FuYpelWVg>
    <xme:wohUZr2N-E_fQ0JtLnMC21Ckj1qB5ae2-zKJbhZ6uZ294Ce1-gghFUK7ntH_T3VN4
    ig2K5voMgGCy4VLvEA>
X-ME-Received: <xmr:wohUZqp_yOPyJgLZWvKAThPcixtq5UPMpxuqitikqfKla2XN_phRvJI1D19-ysXzQQcDClhDXoEAgNMQxLRjSp5sQqLgbItTHXcU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:wohUZomDrIDuxX0yel6wIXAqg05uFSe7XeaypE4gCQ2qdMzSPHzX6A>
    <xmx:wohUZq3bMBR7thQzAcr6imhGrMwSE8hFUqSQfxha0ugz4r9QWdYVWQ>
    <xmx:wohUZvuSjYi5qG6M2AholYHDVlzvtf0-byn9t9todv2gwE6CbhYKPw>
    <xmx:wohUZmWoVvKNB8dRT1ZJ6YbgAL1s8yWBMgsviyyTEg6a8dy_j64r3Q>
    <xmx:wohUZoyY_Rt_0kGttdFSFdR2r8BxYXB9yS35tLfMnR0niOL5rrHnW-k7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:21:05 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dt-bindings: media: renesas,csi2: Add binding for V4M
Date: Mon, 27 May 2024 15:20:46 +0200
Message-ID: <20240527132046.1680595-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the CSI-2 module in the Renesas V4M (r8a779h0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index 977ab188d654..80b77875874d 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -32,6 +32,7 @@ properties:
           - renesas,r8a77990-csi2 # R-Car E3
           - renesas,r8a779a0-csi2 # R-Car V3U
           - renesas,r8a779g0-csi2 # R-Car V4H
+          - renesas,r8a779h0-csi2 # R-Car V4M
 
   reg:
     maxItems: 1
-- 
2.45.1


