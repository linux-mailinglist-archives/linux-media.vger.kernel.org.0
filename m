Return-Path: <linux-media+bounces-30839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E64FA99565
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5E3F5A1AF2
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6502798E7;
	Wed, 23 Apr 2025 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ghMJZ6Li";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p6f9ufhE"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD6AEEAB;
	Wed, 23 Apr 2025 16:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426013; cv=none; b=LxmNgZQqjvT/v/ZyZTk/ieYCpOPvxDKLDB396JT5eJD2RNVH5bB6o6JQtNev3caTe6OLZ8O1Drtx9ptd1LfxSHc7ckCh8nCx4PK91pMuKFkHP9dM5aHI9COUO4Pp1QrJj/45rUOLGFHw9Eq1oCj82t4gJGTYIaJOHKhlL98Iejc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426013; c=relaxed/simple;
	bh=k9awTTUd7ZaQ39ohjaFaJnmuQ3yBWkwe6kUBoEOhz54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V/V3AF0hBAkXGbGdLkQke6bvHA0Is0bumDuHn/o/m9IzZfzNihx9cUC9d6v8DsB4JQ7JQRp5BAmmF/yHOjtdSI4s/wgS8cQ5RkUqeoJhullSzwAZngu3R/ceeRVRvxSjydlioiEju3juKF7J1LIEup/OJ76WBD/WjUTjhQVMp9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ghMJZ6Li; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p6f9ufhE; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3C6C8138021E;
	Wed, 23 Apr 2025 12:33:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 23 Apr 2025 12:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1745426009; x=1745512409; bh=Z3
	SikaDV9LXU5Luu9vlL7wDesVWT4qjhjBdRZpBP2Nk=; b=ghMJZ6Lijp5j0rH3fm
	M0/QZS+98SHHwVDV9yAXJz9y8x32beDLhTpMm17dJwflmrLW5u/pTZvBY/8YCHUH
	XQKU6mUF6VcTYCEesxgkSF9cRFHP+2t628na5fAzJQ+CXW+GIMLWIa1bOwVwMzuY
	RyJDxDf+YQByOraHajsu1ZGGC+ik61vriS6YUILLqHt/IHg6B+4zvduNp/Azbxon
	a4PK5ZVtLQdN/uLBU8rFX4jsMBQ9dOFpB+/5QUAYYimBGnUx3VeT2XKkf4JltYZD
	lPY5zp3aPI0Nl096XKXrQPCJRXGWRzXZ82jVrII1ak3KQUmIv1qx6VAo0ornq+pZ
	NwaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1745426009; x=1745512409; bh=Z3SikaDV9LXU5Luu9vlL7wDesVWT
	4qjhjBdRZpBP2Nk=; b=p6f9ufhExJZ78Qos+ry8HvySku15uj3obTcBGBBozfat
	U1SL3ywoTH3Jews8NTZrBjeKBXq+36UC+u8TeA4Ak4WdRllvprnAQEx4CAjSNFa9
	Qg+mC1G5sB/eXagepNHTv+OmzyBZYnr66LXct+5Oiv1NSincSvKrqNS0L7Oqs7fW
	a1VM8PnXrFcNcSuXFzV+Ub8JJWJ0bPVC6ry4jldwMRlwQJomhQTBjAHGutnoqkGD
	R4VNg5bSqF81to/ftNS14rmLyxn3xwTIFlXfNJVpTu4p1IiXwDd+ziZwOv2mBL1A
	AYx+JBUpkQNIga6DQBgckvulBnmhs2wlLZhIzc39lQ==
X-ME-Sender: <xms:WBYJaOue0Bpi4y81f7V0f8goKBnSHt6en2NIm2qdAYeNpKnyIzHdcQ>
    <xme:WBYJaDfoNGyYjfPixab323hUudr6xD-35Kors51wonYwlB4ai8YlPi5xQgTRWF-D6
    qTXjBBw6TZg0kUom9w>
X-ME-Received: <xmr:WBYJaJyhPFfKJ1AuaHbQeWeCx0bAaynw4aMXWaGPw-C5Y9bTZNcMbK6FVby2iNJFUX3XfrJsoz3TFZwgYU_2qqgW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtdelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:WBYJaJNjtiajs0wK1Rwo1gj4FflN5ayBGIpJyJgDG_Q762NfhWR1Qg>
    <xmx:WBYJaO875toEaQbOeyEn9qo3r136Ct4s7qSD0WtDUjgVfJp9G5mGZQ>
    <xmx:WBYJaBXbGhH1UzZ1Sv4Iwfr1thxrOyOsVAVDDGQLvKzkF0Hsjq_SeA>
    <xmx:WBYJaHe3PQlDtyPKN5bgs-MdFYdYcxdvojl15vEyQizxn-3v8Mic_g>
    <xmx:WRYJaG0p5bbEo5nD5WG1PrxQvODGfAYPSkG1k0ykNUO7mH20BxLForKR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:33:27 -0400 (EDT)
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
Subject: [PATCH v3 0/7] rcar-isp: Prepare for ISP core support
Date: Wed, 23 Apr 2025 18:31:06 +0200
Message-ID: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
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
 .../media/platform/renesas/rcar-isp/Kconfig   | 18 ++++++
 .../media/platform/renesas/rcar-isp/Makefile  |  4 ++
 .../renesas/{rcar-isp.c => rcar-isp/csisp.c}  | 57 ++++++++++-------
 10 files changed, 196 insertions(+), 79 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Kconfig
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Makefile
 rename drivers/media/platform/renesas/{rcar-isp.c => rcar-isp/csisp.c} (90%)

-- 
2.49.0


