Return-Path: <linux-media+bounces-28375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1AFA659A3
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 18:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5492A3A439C
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3CD1DF969;
	Mon, 17 Mar 2025 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="l7xPOAg8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E/OScibK"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20AA1DE884;
	Mon, 17 Mar 2025 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230780; cv=none; b=P8qzC/YND+0DPjT70i0LZyuAS3Cu7lck89c4V3V+WZ2iINR8TDLZNV0OO0e/dyDPd8ZgMTpI2ZIpcmP7947mGTW923PgHFs17ezUl1G3hgGBXjK8yLb3DGO+Pf12cpaeXqltkpFpSutkNE9tzzL8pRxEuLR4bANzDCfGcp/nEL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230780; c=relaxed/simple;
	bh=iFv3COJlaJqX5NqA3+y+iCPY9XVEMuTYr0B0UdFymds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UchoRJLaLw80+TkhF757zbBCxqkVyh8IQWu3bqOz9L9Wktvcy/d5tPLBq/x1Jw0XNfpTJx0Fnkn65IeHICBocvdaP1WQpCJqolhWGO6dJK8HNutixJxPTSFLXPbfAVEmhXtOguOdPvYVTDoXfv9KGYGcZSa+hZjwSTtzEIOcx/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=l7xPOAg8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E/OScibK; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CBE872540208;
	Mon, 17 Mar 2025 12:59:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 17 Mar 2025 12:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1742230776; x=1742317176; bh=Eu
	Xnian6ma9MPtaXZ1iWOkjof209TEFcEQ8di3R8/ik=; b=l7xPOAg8SGli/nMHLH
	7MQ+V6B5xt/FgMw4X7+5ASfX4K6TQoo8r298lWCbuDBzrYTjixz5gQxDoDQyiL68
	T35O07I3a9wiTu5qccak8f2GCDuizDOQgyfZ+2vC73s5EuZfWHUOBe5Gj6IYp7kg
	uAo0b+AxmI73lDm14HLbMsXLJZcxCYD13dY2Pg+Kc+BZmLsTBopicWThGWAb6miT
	maRUhzYAlHHtzO5ju9L03Nubl9W845+dF6IJDMqdQ3lwpHakF8YAixZE8VqcwX3T
	9lkypq1XrkuO7hCIuaJ5Xl/Nd4MBAtEoJ3NlRP9SjNDL09IlCcy7qwzEtdo2v058
	QVeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1742230776; x=1742317176; bh=EuXnian6ma9MPtaXZ1iWOkjof209
	TEFcEQ8di3R8/ik=; b=E/OScibKgXcHDkfH+qn2lgcL7ZXkxqSJbJbvJW7ovL4c
	/ckvUKJqdnI9U0HhJhav3XbmAOGrYMJ6rZfdGNLK/Ih/VbJSiRdhMKp2tfXNtpq6
	TaYRb+hU+8rQSxtKiNtDi1/KI++O6zLunFvi41jkLxtGwqsO9s9bVpKHw6zqy3/T
	vsi7BG6aehZrl8sAHrgVXyU8DW/09Hcn4wVRP/9YfzjPI6g/neHhvL9eOxhGpwJp
	Txujo03Cbw3yt8LZcC9/rtTI7VwWcMc+7wgHHQrsf0qI5bhQPSnfPtBUZP45w6Ry
	i27aLEpu6hQrfx0ruFzrDsbFGTLLHA8KaPT5SoBLiw==
X-ME-Sender: <xms:-FTYZ_lmmbBbPF6JYOPAXGdJP3z039egBNa0BQNZwQWnOGcE6V6rWQ>
    <xme:-FTYZy2qVicc1isscVeCeNB4LB_guWfuo5chCtZm0rj25ELiPG5IeTvdi1kv_Anav
    taNWMaHWFW7gHGF8Oo>
X-ME-Received: <xmr:-FTYZ1o7p3u5mEjXscUSPYaSpED44A03atl0mpJqUIGDz00v6_usmWF1ReQ-LwXLSMXHE6IyBPJBVsuo8g9jnpHIsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedttdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:-FTYZ3mNYu0qpuycx1MAeJjlebY3wQkwrKM4fGZz8m48c19i2RKBaw>
    <xmx:-FTYZ9224DO_toqAefhQ3Xl8eVzPiNwxRieRXPuXkqpsBkxgPRcBBA>
    <xmx:-FTYZ2sGm7WzobIQ9aTQfGoqMGO1y7EF48FXF8xgCSxvFgtQcdGKsw>
    <xmx:-FTYZxVvB8IvWNf9ilZa7uwn2kf_uHs3QCZJztRVGt5EaHd9b8nJ7g>
    <xmx:-FTYZ6kZI5mxzdhB9-e37xhbe8XTGzAZXJRDb2nRSX11d8nSdSS-VKe1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 12:59:35 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/6] media: rcar-vin: Unify notifiers and enable MC on Gen2
Date: Mon, 17 Mar 2025 17:59:01 +0100
Message-ID: <20250317165907.2412377-1-niklas.soderlund+renesas@ragnatech.se>
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

Patch 1/6 and 2/6 are drive-by fixes correcting issues in the existing
design. Patch 3/6 prepares for Gen2 MC by making sure each VIN instance
on Gen2 gets a unique ID which will be needed to support VIN groups.
Compared to Gen3 and later the group ID does not match what it can do in
the group and does not need to be set from DT, all that matters is that
each VIN instance have a unique ID.

Patch 4/6 and 5/6 uses the fact that VIN instances on Gen2 now have
unique IDs and greatly simplifies the unnecessarily complex vl4-async
notifier usage in the VIN driver. This have in the past lead to some
subtle bugs and having only a single notifier for all VIN will remove a
lot of possibilities for this to go wrong in the future.

Finally patch 6/6 removes all non MC code paths and have the Gen2
devices register a media device and configure links.

This have been tested on Gen3 and Gen4 devices without any regressions.
And on Gen2 to make sure the media-graph behaves as it should. As a
bonus the Gen2 devices can now join the VIN CI and any future issues
should be caught as they are for Gen3 and Gen4.

See individual patches for changelog.

Niklas Söderlund (6):
  media: rcar-vin: Use correct count of remote subdevices
  media: rcar-vin: Change link setup argument
  media: rcar-vin: Generate a VIN group ID for Gen2
  media: rcar-vin: Prepare for unifying all v4l-async notifiers
  media: rcar-vin: Merge all notifiers
  media: rcar-vin: Enable media-graph on Gen2

 .../platform/renesas/rcar-vin/rcar-core.c     | 703 +++++++-----------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 488 +-----------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  14 +-
 4 files changed, 302 insertions(+), 919 deletions(-)

-- 
2.48.1


