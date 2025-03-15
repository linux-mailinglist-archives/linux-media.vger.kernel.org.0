Return-Path: <linux-media+bounces-28292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C388A62F1C
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3532176209
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1392045A1;
	Sat, 15 Mar 2025 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="p4fMIjsg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F1CQqFu6"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19EB1C8621;
	Sat, 15 Mar 2025 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052509; cv=none; b=fF1KMTJ2G/eXqYXDZ0lTlWcfSnwgefhE2dNjkbmgmlN8mkJKmqwberOO+eIkRb3Eu4j4dpcDu6qp0D1K0e30eRjkogLpaTRSvfHDZSeOeUsRkMY5rjXGo33v+kl8qd7BVEL5xvTs4TcbgFwJtiW5witcy0gA1kUdP+4LN/FWS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052509; c=relaxed/simple;
	bh=xQpMZTzVjfaxtZK3HFRaSD8FZty8a3G+WNehh/7Hm3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jPeAzgZiUe3ymJ1toyGfQ1LPp9/BSYBMxzo7fqzUrhB7Gumu4TKvcntSFgViv6kiBkBm3uIoQfSNunSNP9IptNv6t1YR2b1Zd8RluOj7YhLimTFYeGG92krZ1HjZfRU7HmpIdsLMcAW263m53ScteTED8UNatfJCqExwQuPUDKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=p4fMIjsg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F1CQqFu6; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AA71B2540169;
	Sat, 15 Mar 2025 11:28:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 15 Mar 2025 11:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1742052505; x=1742138905; bh=K1
	XvBQhkRucCWDCw23u4rf9x/uFMiCykS2+9ghIWZ7I=; b=p4fMIjsgLBPct+ybBH
	n5hvBxuzshztaP/ZS61I0XWJNHQgAqIFN2KJTStt+Zu1WUph7vQTS1xepq2iUwa1
	XZ5dSlhs1WuYmyqbGU0AeHLMOTWUD+Zp5Ky9iC2vZDQdAI4SbxDWVeDyQZy++fPM
	trTbeqDgNx3d4oRVQMFx5k6+t2vlsqbuDaXwsKacaVrxGWE8WGxaO7w1ACFUFpDo
	tZFIeC7twWst+lEbWrOQKoPSWcS/ICdf/M6Py1ufIhSAHCVOq5Rl6d3I4wSp7zLw
	dilQHzshbyB5fXG2Y9kWGQKU73W1R6n2doh5u0258f3CbR34ZQjlJOQyd0f6jDar
	iRPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1742052505; x=1742138905; bh=K1XvBQhkRucCWDCw23u4rf9x/uFM
	iCykS2+9ghIWZ7I=; b=F1CQqFu657KXbbJFaxGKufP2niSgMlIKdUfiSUgFrIsA
	pQSg4VapIXX3PDYugkQbX4t9jg8S5cUC3/pJJ1N9s4wUh77hJ32qpziQBMhy+qRf
	ffnZlZwlIoUVmfqH/NX3UEjlOyputDjYgE4vLBEoymqRsH+gfkgUYGM+ENMNJ0Zt
	ekzCL/oNzoSG5aaOpDcYV8oJZqROwk0b2vtt77aG7bRVqiWRrdf/zroH/jA73rrk
	1RHQqinlbfuZl4eGsDg3KU78QG5B2c36yVkOyU6e14LtwSzOx8bqNFsJwRfIujMI
	tBNwQX4fjvfHMjOpIn0F/WwyKsaC7V0RegplsiLrgg==
X-ME-Sender: <xms:mJzVZyXmRM9Lbo-yrlDQVPQuTPuZSVvb_l1Qn7xs5ITE66ptybxWCQ>
    <xme:mJzVZ-lXLa_gZ489GzLnq_R27Vr6RSCX1rjSMk4iJRL2QnGmj39QOCUjtdrn3D4eA
    C2HjIY0px1pDdu_Akk>
X-ME-Received: <xmr:mJzVZ2YcdmPyGRX2RFpk_6Rn4GF9KX--lHOYJTVBp5LfX80EfLCqEWh7rOZ0bU3cy3ucw0tzZqDTtPC9DnvATS5ryw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeegtdekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mJzVZ5UnuV0R2E9Lvg_0oufXQrh-bRI3bj8IFel0UIQ1KZ0fssonxg>
    <xmx:mJzVZ8l8BTFq5jhe8W039ZYbJzakzSJL7t5aVgnWcOYhhe30vPBM9w>
    <xmx:mJzVZ-dTpaXaBP-nLethBhvQHt1ixcb8c7MazB2MuK86qdGI2il7Hw>
    <xmx:mJzVZ-HUVy5zeEjLIybfncjqKkX62sfjTBz3QIVa53kK0cQD7DggTA>
    <xmx:mZzVZ6nuF8QCbZPMkx0k0qhP6WbsWZZ5nGX3Tnt4vFYiZTSX8Xu1_Z2->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Mar 2025 11:28:24 -0400 (EDT)
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
Subject: [PATCH 0/7] rcar-isp: Prepare for ISP core support
Date: Sat, 15 Mar 2025 16:27:01 +0100
Message-ID: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
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

Niklas Söderlund (7):
  dt-bindings: media: renesas,isp: Add ISP core function block
  arm64: dts: renesas: r8a779a0: Add ISP core function block
  arm64: dts: renesas: r8a779g0: Add ISP core function block
  arm64: dts: renesas: r8a779h0: Add ISP core function block
  media: rcar-isp: Move driver to own directory
  media: rcar-isp: Rename base register variable
  media: rcar-isp: Parse named cs memory region

 .../bindings/media/renesas,isp.yaml           | 56 +++++++++++++++--
 MAINTAINERS                                   |  2 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 60 ++++++++++++++-----
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 30 +++++++---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 21 +++++--
 drivers/media/platform/renesas/Kconfig        | 18 +-----
 drivers/media/platform/renesas/Makefile       |  2 +-
 .../media/platform/renesas/rcar-isp/Kconfig   | 17 ++++++
 .../media/platform/renesas/rcar-isp/Makefile  |  4 ++
 .../renesas/{rcar-isp.c => rcar-isp/csisp.c}  | 56 ++++++++++-------
 10 files changed, 189 insertions(+), 77 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Kconfig
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Makefile
 rename drivers/media/platform/renesas/{rcar-isp.c => rcar-isp/csisp.c} (89%)

-- 
2.48.1


