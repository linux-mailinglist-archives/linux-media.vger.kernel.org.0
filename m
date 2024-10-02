Return-Path: <linux-media+bounces-18975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4898D001
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 954CD28C14F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1491993A3;
	Wed,  2 Oct 2024 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="B8JB2rrv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AB3o0z6k"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152CE1991CD;
	Wed,  2 Oct 2024 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861049; cv=none; b=c65INELurU55tvPhgukr81PKVQ/hxL00zhLO7bfcKpdcKjoVWEABn5jyFdyrY+r2ts6HyktNSV1hBAxnukKH3fUjfWQni6cJ1eNwBfzAsYWLNmqt4qYYmT6Ozx5G8OBX/TW82liaRnyRNgXr9GFA836ts2AjXxhal02qSGReJ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861049; c=relaxed/simple;
	bh=kMiQDBKueJ+EjXlJYy8rAw4cUggtbuSciza+fXvr+E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P4UQeVcVQAdFFijBYERTXVDRivIoICuKvDE/KgGS6f/jpUpFjsIc8JANKDfyr7ET3w/AKEQANgVdDnregRpf7pcB4YPss0gtS96D2u7pXt7gG6KnyOqv1ZmB0nHdsjxELROWvN/71XJ1NKTKl91IdRs2mrBLWT2qkdaWKXpNJYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=B8JB2rrv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AB3o0z6k; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3CD3211400BC;
	Wed,  2 Oct 2024 05:24:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 02 Oct 2024 05:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727861045;
	 x=1727947445; bh=/XZTNnbVuE2LDhmUvIV6yOBhzHzCLRfZxmhADoD83pA=; b=
	B8JB2rrvK6GmWDzhAHWwKTSA/teQskj3jM0jXT50UrHkQpI1TlX7dh81l5aDadf6
	djWcXHeIVF8WW2Dq48P4xK+hsmenVa3PyU8W7sv10zquKJaHFoIuNpyiAtPXArra
	LVkJETr4u81ZgFjn5F7EGisy73FypX27rrRREy8u0Ryqqis0Y98QL1VTpkx+ts9O
	QoIVLwRbJyTENvCy++XmFrf9r09Q0i/nA6S15PyKxT1z0QFWcKM3wff9K/i/+Url
	A4aer784QUhWt7SYDa3s+rV2LEcdrDdCFvGUcRNZhMdUkH8MsfLnxf1elpVtKRN8
	ZfPtNaERxHQhUsh1fR4ktw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727861045; x=
	1727947445; bh=/XZTNnbVuE2LDhmUvIV6yOBhzHzCLRfZxmhADoD83pA=; b=A
	B3o0z6kz/jounHxeUTya+iKxpGTWkS5tQWlpu0NB9t3XkgMQN309SWbgUqcB1AHu
	oo/0uYXShLUeRzp0jaa2qRXNZitwaDFg8lxRKmOrfZ4cMNM7HiOOshWZed6fIjYR
	Kffq7OE2rrSX6yYsBvaBKoiEr/pfUw+vMRnm4LBbn9VUeaq3dlfeUC2aKqaUYwxI
	PJvspPOrm3jELnwUsXjtHXnTWmnBDN4bQqU2OXl3g+HLX+QbyZkO5RTKX2OFKfb+
	wI1fTcEXdOaKWdpe7pAhEx6Pzbzbgr0HoLWdKGqORmPE57UqJ9ONbbw6fMS/tZqX
	YXfwje2vJ8/Tyv0+c7yrA==
X-ME-Sender: <xms:NBH9ZkVMKZgNVs-KL6WtP6ScHluG7wrpxMQwDrokbmLgI6_NN0HFKw>
    <xme:NBH9ZomTrVHF_CAq3DMBRmme-ySSGyewvgy33_KfVS1rPY7tQQy9L9qqZwRXPr0as
    psPER-AmGkP9IBAsTY>
X-ME-Received: <xmr:NBH9ZoY_IYFUCVLHM0OyHNDuMufkkSfun1lXEFjK3Ujiwt9IbF8rr5Gx2EL9rwUVJRpF9iP-jX6eD2ymdhEGiIu70A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluh
    hssehikhhirdhfihdprhgtphhtthhopehjuhhlihgvnhdrmhgrshhsohhtsegtohhllhgr
    sghorhgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:NBH9ZjXcpeIOUyYhQ6607AiWYOUOddnJhg_hJm8TnucluWmrX_d5VA>
    <xmx:NBH9ZukklredFm0q2OQzmqKOAhHShtnQpkGNwlE4_mmy4pYQ5u20IA>
    <xmx:NBH9ZoepyaW4AaP_OA7CGhW-iHRv6BHdSENCbHj4h1ROsLx-xPoM7w>
    <xmx:NBH9ZgEKPpJnITOH1UEzJh-HMIXQG3Xy8AZjZOh2hgGyiC-L5N7anA>
    <xmx:NRH9Zj_Hz3JuCyLWSZoPYMa7BEZemhfgemX4XuD3DOBM-oI_lNOWl_Xk>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 05:24:04 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/5] dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
Date: Wed,  2 Oct 2024 11:23:27 +0200
Message-ID: <20241002092331.4135906-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241002092331.4135906-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241002092331.4135906-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 are both quad GMSL2 to CSI-2 deserializers and
are in parts similar, but not identical. The most obvious difference is
on the CSI-2 side where the MAX96712 have 4 PHYs and support D-PHY with
1x4, 2x2 and 4x2 lanes where the MAX96724 only have 2 PHYs and supports
D-PHY with 2x4 or 4x2 lanes.

The register layout overlap in part but there are differences and holes.
Most of the differences are related to the different number of CSI-2
PHYs, but there are other capability differences between the two.

Add a specific compatible for MAX96724 to the max96712 bindings. The
bindings do not yet support validating all DT properties to limit it the
each devices capabilities. However to allow for this in future a
specific compatible for the two different devices are needed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
* Changes since v2
- Expand on the differences of the two devices and why a specific
  binding is needed for the new device.

* Changes since v1
- Group in series together with driver change.
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 6c72e77b927c..26f85151afbd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -25,7 +25,10 @@ description: |
 
 properties:
   compatible:
-    const: maxim,max96712
+    items:
+      - enum:
+          - maxim,max96712
+          - maxim,max96724
 
   reg:
     description: I2C device address
-- 
2.46.1


