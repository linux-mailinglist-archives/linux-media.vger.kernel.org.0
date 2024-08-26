Return-Path: <linux-media+bounces-16826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525595F426
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CCD7283233
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A76718F2C5;
	Mon, 26 Aug 2024 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UY5BR5G2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="plyHdM7Q"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A08C186298;
	Mon, 26 Aug 2024 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683475; cv=none; b=l1nRvzRdFJnMgWIW3KJtx6yi8ky03hrMeAePfSuDVtuER4vcZ0q6Eyktxp5gQLFxPtWTaNPXbmjKI0WIpQzp7gaxCDoELzeaoOpoeZ4PpztjeRw5h5JAopNEx6pVmvC9q+pfLqakXepJ+fZHQ4f/0PE9bLRjvPAfVGk+315ZzwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683475; c=relaxed/simple;
	bh=JR2NEyh4VH/HX2BQBH1eIbU1qIvcry/5j0YultvlByk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jiyx1a/z4lA/aaHdgMaH30//iWGsOcftcMtv3g1PJjBqYGQq7dnCrgFm19DAGkvfOgYhMiHzVGRqMmXGLIdmmUj+1yBeAngUaCxCgsijq+6K250Adegp1AjbJvGvFuS02UtZTBVsidfigyTP5w6b/yvykAtLCL/925gILRVqXSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UY5BR5G2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=plyHdM7Q; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 72B241151AA5;
	Mon, 26 Aug 2024 10:44:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 26 Aug 2024 10:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1724683470; x=1724769870; bh=Cw
	yDN9q8eDeAyDEeiovcNcWnwWDEKkQ6mnezq4RY5yM=; b=UY5BR5G2ZeNLkiy+hf
	0ZzYLpPEuUw9MmZroHIxuvVdfXdctT57NMpYfHrGo8YcsqBHFmeda6efYnXBDlL9
	FCIfhaFIYkTHxDFOUU+ui+WiSWk2iq/UNE3/q5vUng5djAri6dX0TMPnSw6fXnSX
	dMTEZgEGnbgknujM4idaPJgFFLf5QnKxFddXmxwvss0CVE/NLmlR+gGBh4p/VgTO
	Z7/UD7/AIEsfX0JThkiiokJdEplEJRX4Y6LYP0vroeXistzkf3vXg5iCkcnf6X4U
	lj6cKNXmxQSCbkU9SUUtw6u1e+8c0c/CKNkX2NxnLQU0OvAe4do8Hm21MGGGEC8S
	g/ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1724683470; x=1724769870; bh=CwyDN9q8eDeAy
	DEeiovcNcWnwWDEKkQ6mnezq4RY5yM=; b=plyHdM7QBMkDHFQ3z6824qK0BVKmU
	3QBVuX2/0Kre6JmeQSaFicVIWTPoRJ6n819FFNX1vMWNrc42lJFw2zd8GbyPxaDS
	VM8odbzTKB8tyf0H3r9+/DraTgw4Tti2iqXNBAlHT4QlNSRVJIc+tMmdBuTyroVJ
	FaLpq2ZRJoFl2ffsiMACF9h4zB+Tay5g853peh14ISVJDX0g67UYRl6WDzIuTZK6
	i79fZSAt0QYP74uSl7Vm60X46ebm8I8wGCbJ6mRwu8A/P+v8cUTZt5BVgOkuQW2O
	buxHH/0MQyRaasAeCch5O0mSBG5IMzfupjEVIika4oykvehbPT5cZLW/A==
X-ME-Sender: <xms:zpTMZhSJH8u2BiF-GUUSaHcG5zkh8d-zxzZlSDn3iban2EsrQvuzwQ>
    <xme:zpTMZqxx-892gF2eWGDuf2rUvR4E0Yom1vD4pOPyXlrLDViyULQuuWHEEGXBTPieP
    O9jj2jfFRUYXm2L9Hg>
X-ME-Received: <xmr:zpTMZm1GIGCthcBx4qx-48-5Ge_e-_fmzjSgccf9iGKbNJVbACmSY_tTo6Nse8X55lR5uH_a9HelYVGXeb0cC6zm3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvkedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpefhgefhveeghfetudehfffhjeeileehkedvveffuddtleegudegjeeufeefvefftd
    enucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrg
    hgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhr
    tghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsii
    htohhfrdhkohiilhhofihskhhiodgutheslhhinhgrrhhordhorhhgpdhrtghpthhtohep
    tghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvg
    hnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhugidqmhgvughirges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghs
    qdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zpTMZpBWY6SRjguwo6D3-YfvoD11mT2rUwGHzdGD3lCN-kXDr2AQlQ>
    <xmx:zpTMZqj_FCc7o3fVvGA-9Lfy7b6DEyRIf8gS2avJrXWApA64ReszXQ>
    <xmx:zpTMZtpmaGGFp_Rm65aJ-lrrwvWkFf4fWxz9X541tDIPWfdiZFXUwQ>
    <xmx:zpTMZlg4cZWm6SczOO_weKbzuEBf8vaKN6R0f4qzrm_k3QRinyZXFg>
    <xmx:zpTMZvbL2n7lcdffDinoF0rgwELuK4R1Cwa4uLLIUipIbO96HaxAZ_Qs>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Aug 2024 10:44:29 -0400 (EDT)
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
Subject: [PATCH v2 0/6] rcar-isp: Add support for R-Car V4M
Date: Mon, 26 Aug 2024 16:43:46 +0200
Message-ID: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series adds bindings and support to rcar-isp for R-Car V4M by the
means of adding a Gen4 family fallback compatible.

Previous versions of this work did not recognise that the CSISP on found 
on R-Car Gen4 is very similar and a family compatible to cover them all 
would have been beneficial. The same is true for the VIN module found on 
Gen4, and a similar series adds a family compatible for that modules 
[1]. This series mirrors that work for the CSISP module. Hopefully this 
pain now will pay off later.

This change requires updating existing DTS files to add this new family
fallback. This is done in a backward compatible way and the driver
retains the compatible values.

See individual patches for changes since previous versions.

1. [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
   https://lore.kernel.org/all/20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se/

Niklas Söderlund (6):
  dt-bindings: media: renesas,isp: Add Gen4 family fallback
  arm64: dts: renesas: r8a779g0: Add family fallback for CSISP IP
  arm64: dts: renesas: r8a779a0: Add family fallback for CSISP IP
  media: rcar-isp: Add family compatible for R-Car Gen4 family
  dt-bindings: media: renesas,isp: Add binding for V4M
  arm64: dts: renesas: r8a779h0: Add family fallback for CSISP IP

 .../devicetree/bindings/media/renesas,isp.yaml       |  4 +++-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi            | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi            |  6 ++++--
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi            |  6 ++++--
 drivers/media/platform/renesas/rcar-isp.c            |  3 +++
 5 files changed, 22 insertions(+), 9 deletions(-)

-- 
2.45.2


