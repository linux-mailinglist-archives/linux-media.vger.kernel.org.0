Return-Path: <linux-media+bounces-14063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC2915043
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 16:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B195B2357B
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1DF19ADB5;
	Mon, 24 Jun 2024 14:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DIDGi5DW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vu+5iuzj"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F39148849;
	Mon, 24 Jun 2024 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240206; cv=none; b=EChWarNNZA6J35gs+Avs+mz8ZF5lxxumYR51a+Ofel7P7PPBPDbGyU8QVnTPbH8KAjerWw/CnZ4ATDkiQLPclND421b/7FDmJ8JdMIel0YzIenCqLtqTTvyB9G/blzhNX6lANaYNHIKA8QVn15C8jzjeKTNf8jgoqGfwsWbE9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240206; c=relaxed/simple;
	bh=2i8CvIfWueteq+RiyyDoWTxNLGDT4inf912od4bVtHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Iv3uvybNuRMMAj5k7gjrTTVU81UpRQVR793E9A4Dzq4IfH4Cg1hA01f0406b1k0YuQyphvfGtdGbkTANZmkknBBzD3VUAwZbexIYvgy+IrItyTpYqXlRcIO8vt7yjrsGyU5hiefYb9vy5OAZzz0bCtswo+dg2aorTiWUp5GBB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DIDGi5DW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vu+5iuzj; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 03D75114010E;
	Mon, 24 Jun 2024 10:43:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 24 Jun 2024 10:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1719240201; x=1719326601; bh=+i
	w/gkjYFx12UBDnI1BpM/8ug8Cqs7Dpl7CEgkW7Hw8=; b=DIDGi5DWdW8HODpmpK
	wzFP/JaXw81kVd5Aj9Gek8VwPfN17qx4Qx8gLDZ2/dCtrwy/+Kd1rl33Ns9D6L4q
	HVCE10fvJefulgzgOw+qtgAwycuYhpNr7iFtbOI1wcOiif8KjQrO5jPbc1W4kB3Q
	v7DZkwu6v6mEk+g1njHw7H+LBz0KTc7JrYw4Uuqht60KjfvqF2nQqTfcY3I606/u
	chAyy8xtWy35qJMQlzF9QiT/FeFRC9VbVBWoQRMClv2hvsdmH5pPU0RgR9LDylzB
	1aq85YhIXcYIpC4ZPtg3r91y6i1rXcnU5VeEJtmZ2f4rrayfJjMO2aWnxGoquRAC
	3Z6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1719240201; x=1719326601; bh=+iw/gkjYFx12U
	BDnI1BpM/8ug8Cqs7Dpl7CEgkW7Hw8=; b=vu+5iuzjleq7EUOUi2/H9HTO8d5xs
	mCyLdhnEA/E9d1hmb8lEf1Zof69vv48fE8hfTeyH/JABO9+wvVsTpah4U29kNtLz
	9goeciTsEsC9GNdadgTx5y2+Rzyu075SDXXx06rHIHA4poZYjDjs+XCqyjHdWK8F
	P9xwUt1xx/n+jPo/IRBrZYAG2yVwRu8iOh8Wys8FSValyeoeQeKLdHUnjPnG1Xn1
	AM1HTHeU1LLYWw8GCfwGKZPpM2C2r0+spO5zN7OUPgzISDkHAkSw9NJowtN7WJSD
	RWSDJoceWI7IZxbWzU2ShB23QUMs7KmSyd5Vho0etdBIG+kRRZTNeBZKg==
X-ME-Sender: <xms:CYZ5Zk_qNCLXgMNbCcu4d8cHfSTBsJ4WSfl5Nx1q9RdrdMW7Y6BOGw>
    <xme:CYZ5ZsvZ1OUbLBVa1tbsuDpP-juIeZF9dUb_x0mE6TgPM1FLnxsev7hjWsoyyxoLN
    wrxPjOwdsfllLqJo40>
X-ME-Received: <xmr:CYZ5ZqB10d-qArIovpPLGobcvCilrptJ4yQrwV4yoWvq0izIQfG5e9VQXj9V0vb2pBk6kY2v0BxSe6Qx216e-uvP-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:CYZ5ZkdBQPBH8UctjuZ8-8dILpZo3Tpox7RTAz6b9TJqYPDlBtObcA>
    <xmx:CYZ5ZpNZuQHMp_QtYBM-MaJxGHlWTLjf81EXT2Zrl5C9fzBqO0Sn-g>
    <xmx:CYZ5ZunRz9DsVIzX2ztGxOZbPJwFpqwncwru6fEq-nG-s9R_e_8ulw>
    <xmx:CYZ5ZrtHfaLLKqZC4cXuRIyXoPVf4MhX90ITuFw9_QbiciKLe6iujA>
    <xmx:CYZ5ZqF2xSmzUOPFCA1hJ9GxfmJ0nXSR18HDPI4lg8GO7dnYX72REHmf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 10:43:20 -0400 (EDT)
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
Subject: [PATCH v4 0/5] rcar-vin: Add support for R-Car V4M
Date: Mon, 24 Jun 2024 16:41:03 +0200
Message-ID: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series adds bindings and support to rcar-vin for R-Car V4M by the 
means of adding a Gen4 family fallback compatible.

Previous versions of this series added V4M support like done for VIN 
since the first Gen3 device, by the use of only a single SoC specific 
compatible value. This was done as in Gen3 almost every new device 
differed from the others and a family fallback was not very useful.

For the two Gen4 devices with a video capture pipeline currently 
documented the VIN instances are very similar and a family fallback can 
be used. This however requires updating existing DTS files for V4H to 
add this new family fallback. This is done in a backward compatible way 
and the driver retains the compatible value for V4H.

See individual patches for changes since previous version.

Niklas Söderlund (5):
  dt-bindings: media: renesas,vin: Add Gen4 family fallback
  arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
  media: rcar-vin: Add family compatible for R-Car Gen4 family
  dt-bindings: media: renesas,vin: Add binding for V4M
  arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP

 .../bindings/media/renesas,vin.yaml           |  4 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 48 ++++++++++++-------
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 48 ++++++++++++-------
 .../platform/renesas/rcar-vin/rcar-core.c     | 23 +++++----
 4 files changed, 79 insertions(+), 44 deletions(-)

-- 
2.45.2


