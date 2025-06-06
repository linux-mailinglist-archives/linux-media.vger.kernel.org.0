Return-Path: <linux-media+bounces-34269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA8AD0800
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE1A07A98DD
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D721C1EB193;
	Fri,  6 Jun 2025 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JvW60jL2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P0M3fauL"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF64433A6;
	Fri,  6 Jun 2025 18:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234412; cv=none; b=UceFspZBvn0Z35vRwk70m7N52EO+Bfj93VHNRWB5Fm+CmZkTci0mz7JvaojHof+Z7oO202ASOIms3A3TrC/IcSFGuf3h8RwWuqu9rdJAJsw4047qt9YF7xKtVXHoRT/mq1n7soDpDz1BEwTXlxRYHwunMXauKE7BD9KW69xPV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234412; c=relaxed/simple;
	bh=5xWuq3LxoxclhDkNwh3c/b+rdxuevBMvdO788VRgCFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NFEd09RNwJWiWqSXnrdYbLt/bONYcf7fcEwCO1btQHR1AP1wsaUjoUWkXKSJlKVwbwbOCm1+6Tj1A83+TV9EZXlLYbhaZnD736ibsS45+2Pkt+K9W5s6ViErxVUe8HETAIH5D9mpGN8JjJFS9D3GzU4x+q8H6mM5UsKtQYUvSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JvW60jL2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P0M3fauL; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4668A25400A1;
	Fri,  6 Jun 2025 14:26:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 06 Jun 2025 14:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1749234408; x=1749320808; bh=et
	Nis9p+KrV5C64IjprndT7QIQYfgjfmGfIez03n+Rc=; b=JvW60jL2RnYbouHZBI
	LGyhpVIdRrHE4STY0koYwHqmdnCpF1ypnfdnHRMvNXcYipcfx91r2CSZIFWvoQ5N
	Z7XVLN3veZpVBvEOUuSukc+pQWv0uNzvBBnDlZ2lXUb6lAwzzN6t6bUKq1vvkZNj
	csxEXx1pBG7tSjZm90yep+uET5G5K7xdyhaedSBkziQr3BURO0zMixlNAnS4ll74
	xiGW+XHiMovpStBDsPtxDZLYPyrB4A1IEVSeQ7mXpzzV0OExOaLeo+mpZnracgon
	+iypLvjZ7dXp1gNdkm7CAN+chrVUhrbNNKMW4UuYdBelS7L+skG/hdepxX4cp33W
	ybfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1749234408; x=1749320808; bh=etNis9p+KrV5C64IjprndT7QIQYf
	gjfmGfIez03n+Rc=; b=P0M3fauLA3neT9mMzazp6Ytap6+pIg3FJltaooYOAl0g
	oln53AAhJ0m6BMTMDmjkgfnWAtXc89oKHJZEKC2AH2TlOJ8vOpkMs6pqNOk/cxkR
	cKoaboPNEipl3Fk41TGnm6KWhkq2+iwLAK6C72OB2IaBLJzoM7otPBcZ1I1b+/1s
	3NF6n1dOX+zyGyjLG+Lg2u296yzni5uYPtbuArNdQkzPUcXHsXp5NwEiLuPYyTiC
	8AWtFIIRvGgczrFXu8jiDbOSKGR4SD38UFzQq1a8IvjhiLumi+MK48bTXe1iZMLn
	vow+OQFOeiq9aT9JSaYIb9/inqXm7iQEAzxVijSkRg==
X-ME-Sender: <xms:5zJDaKFrpzXuz2q9r2hmdhavzVTcuSo6pBEagZcr0UgEXWHoWpZneg>
    <xme:5zJDaLWVXWG86DYM_QOUxbqH-at6LsWFa6PcsABcFkh4dYxkeSMpMgTjTv_mv4BZw
    0prfTKz04BsPRrPXCY>
X-ME-Received: <xmr:5zJDaEK0lXmdy4A0VByjE97Z3nMvtN7oyxUdAg-DSoxADwZoFrrjzUrCcdxrihBE6Fk_MhYlG5EUImaIvAZXk8YZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhu
    sheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgv
    shgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnth
    drphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrg
    htvggthhdrshgv
X-ME-Proxy: <xmx:5zJDaEF4bPLSiG2j80tTD8_ohc7nltxK9_vBVyOtRs-JhC-j5u7tbw>
    <xmx:5zJDaAVeaSLr1HZY7WcSn2f0YuVjUPiSK2WESij9OfwAUjv-sPCFFQ>
    <xmx:5zJDaHMi2NTWJY9erBII3P2Sg7oH0Q_xC3wIf-UJQz2XFmNOl9LY2Q>
    <xmx:5zJDaH2Om70XQK-ILBl57nUaBpgou6gO3WD23h7GakUHeSmRc7VADQ>
    <xmx:6DJDaHXfU3_amjEY2PZn6E1aPGA1yCzdUHHgX1FRH2qiNY8QSu0uCVwS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:26:47 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 00/12] media: rcar-vin: Unify notifiers and enable MC on Gen2
Date: Fri,  6 Jun 2025 20:25:54 +0200
Message-ID: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
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

This series completes the conversion of the soc_camera VIN driver to a
full fledge media-graph enabled driver for R-Car Gen2 devices, Gen3 and
later have been media-graph centric from the start. Having a single
driver supporting both MC and non-MC operation have lead do odd design
decisions in the driver, and it have prevented improving the driver over
all.

New features and bug fixes have always been more important then fixing
this old generation to be MC-centric. But in order to start to play with
libcamera support for the R-Car pipeline it have become more pressing to
make take the time to make this driver MC-only, and more importantly
test it to make sure nothing really breaks.

Patch 1/12, 2/12 and 3/12 are drive-by fixes correcting issues in the 
existing design. Patch 4/12 prepares for Gen2 MC by making sure each VIN 
instance on Gen2 gets a unique ID which will be needed to support VIN 
groups. Compared to Gen3 and later the group ID does not match what it 
can do in the group and does not need to be set from DT, all that 
matters is that each VIN instance have a unique ID.

Patch 5/12, 6/12 and 7/12 uses the fact that VIN instances on Gen2 now 
have unique IDs and greatly simplifies the unnecessarily complex 
vl4-async notifier usage in the VIN driver. This have in the past lead 
to some subtle bugs and having only a single notifier for all VIN will 
remove a lot of possibilities for this to go wrong in the future.

Patch 8/12 9/12 and 10/12 make to adapt Gen2 to MC in incremental steps 
to ease review. These two patches where previously part of a larger 
one-patch to change it all (now 11/12). There is on state of the series 
with 10/12 applied where controls from the sub-device are not exposed to 
user-space that is then addressed in 11/12.

Finally patch 11/12 removes all non MC code paths and have the Gen2
devices register a media device and configure links. While patch 12/12 
is a small cleanup that was previously part of 11/12.

This have been tested on Gen3 and Gen4 devices without any regressions.
And on Gen2 to make sure the media-graph behaves as it should. As a
bonus the Gen2 devices can now join the VIN CI and any future issues
should be caught as they are for Gen3 and Gen4.

See individual patches for changelog. Compared to v4 the patch [v4 6/6] 
have been broken apart into smaller bits to ease review.

Niklas Söderlund (12):
  media: rcar-vin: Use correct count of remote subdevices
  media: rcar-vin: Store platform info with group structure
  media: rcar-vin: Change link setup argument
  media: rcar-vin: Generate a VIN group ID for Gen2
  media: rcar-vin: Prepare for unifying all v4l-async notifiers
  media: rcar-vin: Improve error paths for parallel devices
  media: rcar-vin: Merge all notifiers
  media: rcar-vin: Always create a media pad
  media: rcar-vin: Remove NTSC workaround
  media: rcar-vin: Only expose VIN controls
  media: rcar-vin: Enable media-graph on Gen2
  media: rcar-vin: Fold event notifier into only user

 .../platform/renesas/rcar-vin/rcar-core.c     | 677 +++++++-----------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  23 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 488 +------------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  16 +-
 4 files changed, 281 insertions(+), 923 deletions(-)

-- 
2.49.0


