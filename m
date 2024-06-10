Return-Path: <linux-media+bounces-12852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E56BB902068
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 13:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 709DC1F21113
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 11:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3516B7E0E8;
	Mon, 10 Jun 2024 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iz/mZh/Q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GBeCDZey"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09386FC7;
	Mon, 10 Jun 2024 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019154; cv=none; b=eDqYjkLMiLiuZRseXsz8z0nPCnz5McuFT7bJN6Vcg5fbW3lsbYpRekrWMvIa86ylpv7dgXW+bTTrsLVrvoxjZvPAXcRoWpSgfTxHAt+GUFJptvY6Cv8YhoCuK4ruiyGYCCkWRgbGHUehDwBPRpG6aM91nleCnykxNRFImEvFI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019154; c=relaxed/simple;
	bh=KJFj5e+o7VpD9NNr3CchM8mAH05uZxhtzX7TKcYvdnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGrGnxBKRQ2j81MDo1X/9qa//wXqtOai6QDqbO33zRZGFF2aRuoa6IJyH7+iOz4qMLpIgtokFPI7//6a6BnnEpKUWG5jH3QzQDz7OZxT3LHpYxTkiZLGFofcu67qU1aBPOpr7GDR+fVQvIEJObpHO2jODltOyfZ/Q23Wk2QunWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iz/mZh/Q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GBeCDZey; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 629ED1800076;
	Mon, 10 Jun 2024 07:32:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 10 Jun 2024 07:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718019150;
	 x=1718105550; bh=Nu/e/5QrvdFIKUx7T4lRBSEMjBYYsMhdUkhwPu9DOTg=; b=
	iz/mZh/QiSRbfFCE8qRXsz+b8Cl6hj5banB3GQ8hZ4khR5+o2k35n2dLSDQAb2rI
	LFy2ntfs+p0M1AkPJ700HxnNwINeRMnbG9TyWXunK3LqmJwMF4SSVwez8xmbLRHd
	XtPn702qYZT1/aTSM3BZRGyKlk19Y+zYhSpHR/XQI1Uk6SgwpCz12WHa4XcUEHYT
	MaD0rAYKbIsoktOmUxpuYKGjUX1vQW+plja+bkWxOARkT4pplqUBbnbpJM89IHxc
	fleubrqok5ylFp8MqMf5XUTgPF+CR35bZAOI/tNr8+JdSnEOhBMmDptsG6SarZsD
	zVYNGoWhsIxGwYvkrnx2zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718019150; x=
	1718105550; bh=Nu/e/5QrvdFIKUx7T4lRBSEMjBYYsMhdUkhwPu9DOTg=; b=G
	BeCDZeydt4LzfBnRtywRGZ7bJ2MdPO9NghqWEs7edurto1VukfBWlY6n3H8p5Nw4
	X/e4LkS9wx2d2umOncNaxlz8ohAqftI87zw1w7xPopLXmd0ZlkMyI6YsLb3QMKuB
	rP33ksAEjrAHaqSxvtlOYvuUTbzo4B8mZG2OkArvb/HX/sIItQvRPy4KhpI51aC7
	IfZI+ZeSbnHRmLP2aJdZcDOK3+KlLokgAO/tYjcVx6rgbUiJWzW4pTDrkDwVl9pW
	/ZpmqhbsSkFhUbRmqr4uVP4SLw3MtjxAGMW6T8V3MBzHDql7BkMpG08O0RZcpEu1
	7voBRIrRYcgmj5LRuHkrw==
X-ME-Sender: <xms:TeRmZglQ048f1MHQkuuy7OMxiolNrjKCe_RDeUzNbAmDqXquxTM2aw>
    <xme:TeRmZv1FI_VHFa0FeZcLnfWLvzPgQNBf_opfmDGrPXtxCrNkeGSZx19nEWxyWCkwk
    OuN_bLZepxmsSrYNec>
X-ME-Received: <xmr:TeRmZupygvMW6Qh3xx9AHILiX4a3sL2_HeyAoL8U6Dl8h4Gj-IkN8uEHQ2Xdv86MxhzCE6TNXVEK8GtLWzhDHZICK6ajlUOuPdZe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:TeRmZsmVZAIoABdRZE3aCaSMy3ZhJPj27NLrIKt-hzFGsv3mZJ37kw>
    <xmx:TeRmZu0g9gLulP92IOpgT3kJureHVj48jr9pIRZL-yKNq4vPRxSA1Q>
    <xmx:TeRmZjuPw8Wouu3k3LODPh1mHU948qoqgYREKGjBgNLjYm6-ny0ZfQ>
    <xmx:TeRmZqWP9I0URCNwzd2s43ForqiCF6SQg4Pbq0WLSVSj5u9BDuSusg>
    <xmx:TuRmZsy63sDpt1Fj9uby9N63bOXKoSB6aPHIU59PmiRHTm7jX4QHJ8Kf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 07:32:28 -0400 (EDT)
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
Subject: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for V4M
Date: Mon, 10 Jun 2024 13:31:23 +0200
Message-ID: <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 5539d0f8e74d..168cb02f8abe 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -54,6 +54,7 @@ properties:
               - renesas,vin-r8a77995 # R-Car D3
               - renesas,vin-r8a779a0 # R-Car V3U
               - renesas,vin-r8a779g0 # R-Car V4H
+              - renesas,vin-r8a779h0 # R-Car V4M
 
   reg:
     maxItems: 1
-- 
2.45.2


