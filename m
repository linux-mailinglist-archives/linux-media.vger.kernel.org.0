Return-Path: <linux-media+bounces-30590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC789A94FE8
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97B733A4E61
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AD32627FC;
	Mon, 21 Apr 2025 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nXmIOo1e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HIMOiTqC"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E529D0E;
	Mon, 21 Apr 2025 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233977; cv=none; b=M6zOnMVOO1EPmxL4jTloWEM7SFdDZh3YP/NViD0bsYYKEwbsodRZBHl6Rq3lestXiQh+frjHOBgqrIVGpLvKa22J0NYvx1m1yygWmB+SMfPWd999zqWEtm+sl8BKHSBo3JhI0jnMv30o4mb4W4d+yntKaFz9yexKwuxMkNmaBSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233977; c=relaxed/simple;
	bh=GDUjVSzG9YVOJMFQG9ZuWmDP/05NbhA7vKUA0roZJJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uY76/ze3TeV+F2JE+Be4YzSJ2kjgwZ9gbTmDv2tw5kfXRDOhSe88sFVFl7LgqKILlpB+xyxJuMOzbgCrmcH+GikcrTkHrMT7RGnHuNtvQ5gpNswaz7x4FFUNVbwViHJcXRro3HT9VGoXb2J7/SuBxAmC8hsWW60JqMxeWtQgWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nXmIOo1e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HIMOiTqC; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 1264613801E1;
	Mon, 21 Apr 2025 07:12:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 21 Apr 2025 07:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1745233973; x=1745320373; bh=YE
	TKtGgOFzpZAbDKhjHVboI0LgkBqgqvf5gh4ne1ffQ=; b=nXmIOo1exCU7uu0xvw
	lIGo+RNJ8tqR8aGRgXNEvKIZxmOIQ3IQWBoOTjK3atN8wcsJp9/gpyRJcTkMGkSt
	r1DaE41yx45ZIIpRXXQYtEufAnjherq5swuMuKCpUv6Biw7gDJd39vBKUbZlABcs
	NRaAtO8zbssPjYn56JF28y5vNNYgQV43/o4yrQ2sANQOj/cSOaNli3o2zpE/wiXE
	QgLKKVCr17u7vmjy5PiKoWVj/lKSbcXGion8I7Pb5lO9f05gA+cuTfm1b5EHgr4a
	FvKbdBr0ji4rGUS65zQI40uExcC4ztowww2TS9fOf2fQnmo9YbKbqu4DgEOKhdK/
	EeHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1745233973; x=1745320373; bh=YETKtGgOFzpZAbDKhjHVboI0LgkB
	qgqvf5gh4ne1ffQ=; b=HIMOiTqCjrUwZbVbKK+QXw52txmyrmsSHVa+GjBzaAAS
	mGTXsDG4KbJmykCkhXCH8etu2opa1B74Om/iQ2VdsnisOV77m5Dad/G5bkoLXCPx
	FNBI3/DcXJPZL77+xgJCxB8oxHZSSLXUDyInsfgCts3Vq+34ZH/zT18c69ivlNrw
	AcCIx/vYl2aPtSUYenwEAWwYQ5U4YeXGqL0bSfue6bUW0XKpqLzlTYqlW/fyRq31
	sIy3WTps+05AbPhi2O7yOuEAc92CLFyF8ZaAeL9znmg1Ft+/1IvullIixB4IUzXs
	R0Lla1EbxysMYlkr2YcxlTI2VytWm/OKPlHIdEYd+g==
X-ME-Sender: <xms:MygGaOhyz5d6lbL98n5Ysg7FxKBy1Mr-3JpowodZ19oSbBeRJDgrLw>
    <xme:MygGaPB4ZmorHqeri6hn5PqcfCD106h1Hd7SO10nNRBKbVD8XJpJDFyuOWlJCyxjU
    CxOOH58Q_dEXgi-l-E>
X-ME-Received: <xmr:MygGaGF26fJz0Ik8lDVUMiSYrpP-6IdCMo2Hrow6ZrujWbNB8u8_5wG8CCfkZgLTu1XNRD-_pxrGKG5kopJUIAjUKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvsh
    grshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegrlhhl
    rdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshho
    nhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrg
    hsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:NCgGaHT5EbKrAok76CE6izG2KRIArHX4dXElYXL9ODTFtJ5K2h7_aA>
    <xmx:NCgGaLwy-cJjblRxAx8fl7wxbTud68WdLdgGhUOewZThR_IwB-bfaQ>
    <xmx:NCgGaF4e5jUuyXbnC5qfg0ohIHw36SryYCfuoFKXhG8dS6hlmVTnJg>
    <xmx:NCgGaIzziKcuu_MvWMF3r4W4ePGqq44SXvsvgrc7OLC_s-GIectOPA>
    <xmx:NSgGaL4I1frHjsnnTscx8hKIuRPsF88bK2KFFbG5vKk-HsJHrhe_gmOp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 07:12:51 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/7] rcar-isp: Prepare for ISP core support
Date: Mon, 21 Apr 2025 13:12:33 +0200
Message-ID: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series prepares for adding support for the ISP core functionality
found on some R-Car ISP instances. No core support is however added in
this series, the focus is to get the easy changes out of the way to
avoid conflicts of fixes and new features being added in parallel on top
of this.

Patch 1/7 extends the dt-bindings to allow describing both the CSISP and
ISPCORE blocks. Patch 2/7, 3/7 and 4/7 updates the existing bindings to
match the new style. While the change breaks the dt-bindings the driver
is compatible with both styles.

Patch 5/7 prepares for the addition of the ISP core functions that will
span multiple files by moving the driver implementation from a single C
file to a directory where it can grow. The intent is to get this out of
the way without bikeshedding the real ISP core work so fixes and such
can be based on the new file structure as early as possible.

Patch 6/7 and 7/7 prepares the driver for dealing with two regions for
when the ISP core work is integrated.

There is no functional gain in this series apart from correctly
describing the hardware in dt.

See individual patches for changelog.

Niklas Söderlund (7):
  dt-bindings: media: renesas,isp: Add ISP core function block
  arm64: dts: renesas: r8a779a0: Add ISP core function block
  arm64: dts: renesas: r8a779g0: Add ISP core function block
  arm64: dts: renesas: r8a779h0: Add ISP core function block
  media: rcar-isp: Move driver to own directory
  media: rcar-isp: Rename base register variable
  media: rcar-isp: Parse named cs memory region

 .../bindings/media/renesas,isp.yaml           | 63 ++++++++++++++++---
 MAINTAINERS                                   |  2 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 60 +++++++++++++-----
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 30 ++++++---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 21 +++++--
 drivers/media/platform/renesas/Kconfig        | 18 +-----
 drivers/media/platform/renesas/Makefile       |  2 +-
 .../media/platform/renesas/rcar-isp/Kconfig   | 17 +++++
 .../media/platform/renesas/rcar-isp/Makefile  |  4 ++
 .../renesas/{rcar-isp.c => rcar-isp/csisp.c}  | 56 ++++++++++-------
 10 files changed, 194 insertions(+), 79 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Kconfig
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Makefile
 rename drivers/media/platform/renesas/{rcar-isp.c => rcar-isp/csisp.c} (89%)

-- 
2.49.0


