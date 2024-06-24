Return-Path: <linux-media+bounces-14067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A53915054
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 16:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1C971C222B4
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D638519AD81;
	Mon, 24 Jun 2024 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dr9H7iHC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bbje7PdG"
X-Original-To: linux-media@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404BE19AD6F;
	Mon, 24 Jun 2024 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240214; cv=none; b=bySsWtom3+I0bST+Bdb9e5ZT9IjJp1KI9hAvgEaLBaEMOLE4rbt5xeN6yrD3ziQNH6eRv1cyA8Fhz5hk1X4Ed+HuPYuNUB6lPT8qIWaJl6F0WVDJRe8PYvtCd4qKG+2oYmqKShwbKSyZUUv7qTFRC2mSsMCp+uG0kxxZ8xayCk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240214; c=relaxed/simple;
	bh=uJ8l939Yw1jnLmhBRcBWUiOPy0i8ob2Mwdam4+r4opU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VgHmvIyYQNziF+Dbe7WbLqkK/T92FL00SSVLXGIk8s9J00L2hHlnWErda0L+wo2WtlxtDTEkaBldkyUIqVevyINKqVUfWB/MQD9Fa7ub4W6SXRXnhvGHuH7twD8VOj1LlGvppbmi6di8/Jb+IExEAis4NtS5wWAvwmFP1iigdYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dr9H7iHC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bbje7PdG; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 44D061380202;
	Mon, 24 Jun 2024 10:43:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 24 Jun 2024 10:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719240210;
	 x=1719326610; bh=05XBBUCdgw/Zx/G6WzxgjGOMmf5B7cXn7+m56WSWzv0=; b=
	dr9H7iHCpyKw4cqtqtt/aQuLdmjrpSw4Y6DHa6FRK6frt1PCelrjtjnABOHWRjQF
	t7qRLdV52C9W3aaGPXxA68EV4UJoEBAHroi0wZHSXC3V/kzaXLZydletBr5NKr53
	bDQ1y3/0HUSbEQ4WlKAUZG/tlJPuT68zzTIQvzXdT9eCU2dnLt2LIEvAvfpZ+2YY
	4rv/xhcW6/klGiaaWinYi2HfwsTITMm8fX+LTdUvjEjAKfz00JpCHVuaCKRU74Q2
	yYjan1sINaaZrxwSg8x4qWY4rdcw0zTA0EjtivnJCDanApJ9esX3ei3CrYwb0d5n
	2VEc7uIAhWEmpCswUbxreA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719240210; x=
	1719326610; bh=05XBBUCdgw/Zx/G6WzxgjGOMmf5B7cXn7+m56WSWzv0=; b=B
	bje7PdGT8a+cLhPi2emsgq5gHks/th3g6RPzEkqn1TUg2HB7lXisa9NX/IJCGnKq
	24ugflVXM/3/7m6c5MbK0k/BcQAlwdd3P0AkEJbFZvOfBbVqNqvsvQUU1vxmJrFU
	ZhHr0NWFYJXN2Kt4IMla8K+oSnCPkbfb5ASIxtZ9Cwnu8HnlbF3VrJ1DXEAT/yzc
	tYTyRkXO40begsIk4cgbw5ElnNycFBS7K8v01QSxVdLCN7AE+lXWP85Cwkr+A+qK
	Dk13kHXaJeFl8zOgRJQjWw3CvYTI3w1Qje3OKBvQgWrqvHFnjFIR2IdcfIuyCWvj
	CkT+T76G+qRenZ2JwehcA==
X-ME-Sender: <xms:EoZ5ZgDdOArU7GgaSP598TUTwSjDCVjBruPYazVgpxL1YeV4KNa61A>
    <xme:EoZ5Zig1unRtlv8hgzMY9AB85Dt50uwrcdoyxi8KWXzjUvGpwbIGCW3gavMomDjoV
    0VLvpXSmJyk1oTl0OQ>
X-ME-Received: <xmr:EoZ5ZjnqSqdi-keUq6mrkWOABLGmzqJV0nrAcB4JNeeW1KsEhcEjo6tMy0BB1Jiq4Nt9GpLPd3VI6irFLwnlE7LfEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:EoZ5ZmxcxCi4u8rd4iDvw-5c1kaFb_qdATj9DYcHVDseNOEo4Sm0Ag>
    <xmx:EoZ5ZlQmeN7BYnPzHkaXES7j2jqnMiqdjNsB11RtIOTVhEHBhu5cfw>
    <xmx:EoZ5ZhZm7ll3Sp_ZXXq_hyLVd4xyCWF5CCO3PM5zWrJxGOioEGDx8Q>
    <xmx:EoZ5ZuTMHh25iqckS5jx0uhuelZoGcETd7vCE_oBfSGSKJ2nppcvmw>
    <xmx:EoZ5ZqL1RNsOYj9Gr63Q8uZhhd8sevnBOZuvSuGRujTdBzPg31B-j_tE>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 10:43:29 -0400 (EDT)
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 4/5] dt-bindings: media: renesas,vin: Add binding for V4M
Date: Mon, 24 Jun 2024 16:41:07 +0200
Message-ID: <20240624144108.1771189-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
This device is compatible with the VIN module on the other Gen4 SoC,
V4H.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- State in commit message that device is compatible with the other Gen4
  device.
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index c3ef4fde7baf..ec8a8d87dc24 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -56,6 +56,7 @@ properties:
       - items:
           - enum:
               - renesas,vin-r8a779g0 # R-Car V4H
+              - renesas,vin-r8a779h0 # R-Car V4M
           - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
 
   reg:
-- 
2.45.2


