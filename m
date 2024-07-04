Return-Path: <linux-media+bounces-14657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F27D927AFF
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 18:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7095F1C222D6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818261B29D9;
	Thu,  4 Jul 2024 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JtwdvLR8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iX1e+gto"
X-Original-To: linux-media@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431C01B3F04;
	Thu,  4 Jul 2024 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109805; cv=none; b=mOQAWAk7palRUsf2/ZkHjIYsbDUrNPV8eU0aTeltJcYkFjNZ3uLqCSK6bFEYbhNszRJIhBsQks66xZGeRuSdIYf8vZfALK7r2zYwnYxEwH3+dh7nVYhKW7EP9cD50JL5uPhFuawwTAh3rvqAzUKNmiNb6GSpnNyu9NHcgHYx0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109805; c=relaxed/simple;
	bh=kWo1jRjPiC0mUdlHnAlE8L8/74EMsJZXyj5GEnyLxi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fB8mlHn0Xa1bgllcdgKJYi3SMZvPMOTSAfWKPQL3cnWIg/8Y/pi21Fn/oUeiCGB6BLDf5WXc+pyXdVdmH+Ix9eiGZvjEkx7mKZiLXR27GIdHNB9LaeiZaSxg8L0iONScLuHDIG2wdqcXp2HGfioqPCicpDUgfjpI3feMhOxWelE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JtwdvLR8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iX1e+gto; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 656831380292;
	Thu,  4 Jul 2024 12:16:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 04 Jul 2024 12:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720109803;
	 x=1720196203; bh=m6IOAfjzm94rlTQz2x18itLJBm6Rpvf2gXJpRiTrB/8=; b=
	JtwdvLR8DI05TeIENX+KttXvJc2XMcq1jvry8irmIizY3jy4N2roCAkhCV7hkYk8
	ZYRpsErlIEkz6LL8c6ZcfqpDKuArh6+18ZyxE6Y3jc+bPOiJcfsPTwzDpw+V73J/
	lEJfdmEapagBySHKoKsKhgAwPwzWrSVf87yYQ5V0jLci3DkNFhZf9X9+SIjATZY1
	ShOmqUGBJrQtCxQAOJeSIs+/Zg7jDQy2B3wC+tyzJQcWvi1Gpj6xzI4nt9LihcOX
	qbsq5zgM6NF6uZrPxmcFa4pYfiShgjJwK4eUweLdWxI9sZsTpwcLSr7uJ4SAkbMg
	/rmadtGWYiG9RUgPN7nm8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720109803; x=
	1720196203; bh=m6IOAfjzm94rlTQz2x18itLJBm6Rpvf2gXJpRiTrB/8=; b=i
	X1e+gtoHdxxqj+i42h0tSmJUd6btkOA/kojKOOVwi4MfqoKsJc7cpb+UTFUzMZ2g
	mjRERCIlJqsiIyubZKgK/uqLCezc5kR2nn1WbO68JEjO/ulfcR8B3MNScrraPZIa
	1uhN8aMrv1C7QWfqgmAoukw45QZWuO7yJwPRt5CR+GhfGf8VPL6eHGtJDCUqtYY0
	bfRzQh6jnJs5p46vJsWNzM6lmy+gj+vkObWgRsiyBxN/UWiS8Si5TME0BPig6E0a
	/v64jnhkTe8duwagKtNG0kZa5Ervpw+fpzEQ3LqSgYCb1gNqz7zSwLVPTTl3U1CB
	fn/puZSMrylV3kSKVs9ag==
X-ME-Sender: <xms:68qGZqj3KSq5xG1AU-ecBhkdvwnRs7cYhds2ItywTjnv8xnmarz-Vw>
    <xme:68qGZrB-Ne8QRvFfNKOm_cp2GA4_mtrMfYWbxD1D0c099Y2dBPJKWeF6O6u_GsKQS
    I5gJbZQhBhHvME-QGo>
X-ME-Received: <xmr:68qGZiFpOUstTuHfACynhBIP1AiM1NaTkNmb2md7ot4Nd1ssGp-95yFmPZ6eg94EI8rTjVdY4MmlrmR3GMSTnQjAwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeu
    tdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrh
    fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:68qGZjTVNGkRciJfGZfNjGdnS9mWaztTX8wEPoV4_cGtLGzMEpq0NA>
    <xmx:68qGZnxDPyPObQGAQPLM2-jHaTb2ze2JTkU_B4708w6E99regmc1kg>
    <xmx:68qGZh7Axxdh-ZZoTplDLkYXJHFqLE9YrnCmfs_fl0fjX13IEdJqQg>
    <xmx:68qGZkxS7Sj_kb8UgzFiK4P14GmnRUisIorCnSRJ48VAwLHP4RmQLg>
    <xmx:68qGZl4WZiWR-Tlb2t79_jMee6ZNlitElMW9E64PziaDFuC_dp3DI5oR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jul 2024 12:16:42 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 5/6] dt-bindings: media: renesas,vin: Add binding for V4M
Date: Thu,  4 Jul 2024 18:16:19 +0200
Message-ID: <20240704161620.1425409-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
This device is compatible with the VIN module on the other Gen4 SoCs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v3
- State in commit message that device is compatible with the other Gen4
  device.
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index aa16f1528f2d..cf54176f4fbd 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -56,6 +56,7 @@ properties:
           - enum:
               - renesas,vin-r8a779a0 # R-Car V3U
               - renesas,vin-r8a779g0 # R-Car V4H
+              - renesas,vin-r8a779h0 # R-Car V4M
           - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
 
   reg:
-- 
2.45.2


