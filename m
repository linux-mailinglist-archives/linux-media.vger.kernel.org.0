Return-Path: <linux-media+bounces-21602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE839D3044
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 23:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C636D1F243FC
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 22:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833321D31BE;
	Tue, 19 Nov 2024 22:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gT2QVDTX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UO1SgOka"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7A7199FDD;
	Tue, 19 Nov 2024 22:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732054426; cv=none; b=mlBq93dU8dbYeU7g0w0DPw+DR1B6QU/VMsTSFCPAeCby/8RMWJ3YqzPfaZm439muVEKuncFmmfUFZLqD7t+FYeQZA1C5po6xvOXpSecAakHZ2BO8p3OTAIy8oZBb9ahfJFFrEMcta9LhSqbTxZZgxnqjbYtNdSjWtCwqZBfND8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732054426; c=relaxed/simple;
	bh=96q9GqH/+GNUA3gKtaLxdJ6e7BoqcMt/kc8NGYKnfeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f4cl+eWYYgRPcfTj2yRmTCu0orZfh+zf1Pucyz/o9fczcFsIURM5tekDLuaZKncEM5R+MkmXWsAm4kB4GGKE+DI9VdtHoQl6vXS9N8t9O9UJ9dPXzeCclo+nC/lN0ZBErgU1y5kMnQ4Bk2Kl91uIdxiXpM1HC4tWrHSI5ggW+8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gT2QVDTX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UO1SgOka; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 845361140105;
	Tue, 19 Nov 2024 17:13:42 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 19 Nov 2024 17:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1732054422; x=1732140822; bh=Mi
	31dQz32ziAshRlrlLs+6dpXYI5Y+3e1KNvq0LkGL8=; b=gT2QVDTXmtgHs+6lh3
	s6lF5IEfoFo3I2Jwcjuoy9/YGFdbLrrHo+ZYFiQGLMrzZ1XVTNS0nxvr3qwfQgPf
	RG/MFyhA4nE557gvMzYzcEiMM4LEgtadn1V48wjlkNwEBSCdtyn4m+9KcRmsdOtm
	0X0PxGeThAuWnZmpdsM2SmDWzJvbnWH8vL+NGFx/8MUUe+tuGrarPj64TacOw2Zm
	RbhUGevnxHhAViHhE56UurdvF2ap4n/fMHIoSs39jyPPTcjdJp2jzxWyCXrvlEep
	EZQpw7Y2Y1kxkggYG/UWFvFWQLcl4UV1kiRCqyXEUK3FwFu8QoZT/bCm8iyoOhAP
	POjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1732054422; x=1732140822; bh=Mi31dQz32ziAshRlrlLs+6dpXYI5
	Y+3e1KNvq0LkGL8=; b=UO1SgOka/M1KRtJ6ErpBUmUAnIbbmYLSPpSy3YNJovLP
	Iis1Pe0ckNFRbZMyngV206fd837K4QIqoKDptq+Ot+1oXAgobRbadym14P3lmEW3
	0BdaGu3Ehr25WW9sY6WhSSmY8NhldPL1quyCLWsQU83xys4quMh4HIpAwk6d5xcj
	NwMbZ/Hs53ezAGbY/7/fTMPq7qF/ktOAowvQdgx8v4LQgtoS7OsHGhDBT8H9jEfB
	CvgWT/7a1iLgKdRM+ptlSIIgG+tm425zRh1K1QXsolHRuo47ZeT7kW/AhUOJzkvr
	x1H8aplK8xSsLfUXfIUyNNcx/09X1VK+ui8V2Jmliw==
X-ME-Sender: <xms:lg09Z35I0rH3jHPaksGADDE3VeyQOBrYDaBwNdHL7LreTvpJQ7OF8w>
    <xme:lg09Z84tyAMZIxk2aIETc-Ucz9RIOUS9NbodiveI_IeBkxG3hlRA7UKhAFGIqHRAV
    xLfGXEgTSdgsqH6Q6E>
X-ME-Received: <xmr:lg09Z-fsqkqX1Tf4CMi5UJr-Zf0GRtduGlH9T5Mqprh_njYztd4f_pNLIayKdCODNVo51Qi5mYfVCIXSrXg7CkmzsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedvgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgr
    shesghhlihguvghrrdgsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughi
    rgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lg09Z4LUdVfFofkN9-D3Z8jVEBG9DdqZsf-BH36S2AyObV0LvMNanQ>
    <xmx:lg09Z7ILNPoaEZsVslgrApZdjBtxZWe7cqYteV3-XmEh5EevJORIxw>
    <xmx:lg09ZxyDqe8v5v3O-tgwqhHiV4SILtqhCLYQt0di1JpjVNXLWDXoUQ>
    <xmx:lg09Z3KMZe_mlE0X5dtNkTDvJnbttsrwJf4iFpQ8Dclu40h3_eZaIw>
    <xmx:lg09Z9yUVlR9dAyZr4ifNWrzkacieIflB5tULdQWdusbQ39mw6IjkVoT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Nov 2024 17:13:41 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] media: v4l: fwnode: Add support for CSI-2 C-PHY line orders
Date: Tue, 19 Nov 2024 23:12:45 +0100
Message-ID: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series aims to extend the video interface bindings with a new 
property to describe the CSI-2 C-PHY line orders. In comparison with 
CSI-2 D-PHY where each data-lane is constructed from two lines making up 
a differential pair the C-PHY uses three phase encoding constructed from 
three lines to create a single data lane.

The three lines making up the C-PHY data lane are labeled A, B and C in 
the specification and can be ordered in any combination (ABC, ACB, BAC, 
BCA, CAB and CBA). This can be compared to the D-PHY model where the two 
lines in the differential pair can be "normal" or "inverted" to do the 
same thing.

For the D-PHY uses-case the exists a property 'lane-polarities' can be 
used to describe this line wiring. However there are no property to 
describe this ordering of the C-PHY lines in the video interfaces 
definition nor in the V4L2 fwnode structures or parser.

Patch 1/4 extends the video bindings with a new property 'line-orders' 
which can describe this property of the C-PHY. The property name and the 
const values used for different line configurations are taken from the 
MIPI Discovery and Configuration (DisCo) Specification for Imaging 
document.

Patch 2/4 extends the V4L2 fwnode data structure and parser to consume 
and exposes this property to drivers.

While patch 3/4 and 4/4 adds an example use of the property both in the 
bindings and in the driver using the R-Car CSI-2 receiver driver on V4H.

A note on the changes to the R-Car driver not relevant to the core V4L2 
or bindings work. The V4H WhiteHawk development platform is the only 
model where the CSI-2 bus is used in a C-PHY configuration. Early 
datasheets where used to add support for it and at that time the line 
order registers where not documented so magic values where used as-is.  
This have been addressed in later versions of the datasheet and this can 
now be done properly.

The magic values used however configured one of the data lanes used in a 
BCA configuration, which is required for proper operation on that 
development platform. Thus the change in patch 4/4 breaks proper 
operation with older DTS files lacking the new line-orders property.

I think this is fine as the only known use-case for this platform is 
together with the MAX96712 CSI-2 transmitter and for this we only have a 
staging driver capable of generating test patterns. To extend this to a 
capture pipeline capable of capturing frames from a real source DTS 
changes are needed to describe the video source, so an updated DTS are
need anyhow.

Niklas Söderlund (4):
  media: dt-bindings: Add property to describe CSI-2 C-PHY line orders
  media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders
  arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders
  media: rcar-csi2: Allow specifying C-PHY line order

 .../bindings/media/video-interfaces.yaml      | 20 +++++
 .../boot/dts/renesas/white-hawk-csi-dsi.dtsi  |  6 ++
 drivers/media/platform/renesas/rcar-csi2.c    | 74 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c         | 56 +++++++++++++-
 include/dt-bindings/media/video-interfaces.h  |  7 ++
 include/media/v4l2-mediabus.h                 | 21 ++++++
 6 files changed, 176 insertions(+), 8 deletions(-)

-- 
2.47.0


