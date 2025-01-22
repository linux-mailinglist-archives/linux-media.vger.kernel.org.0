Return-Path: <linux-media+bounces-25160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F9A196EB
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79F771887D29
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF11215075;
	Wed, 22 Jan 2025 16:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CYuJsY2P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="emrJtngw"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C92147F8;
	Wed, 22 Jan 2025 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564870; cv=none; b=XYn7OmuFfzDg3dybwE2mM0jxyQhwmS0eD+pjsVIRGTP9iTJtgZCzbS0SlD6F44wJ22LeN3TkMmIXxyzMAqp05P6j/CcKcBtNRPH6LKINolSoTEu5F6R/nrhAjVlInMCkHOy3J3hoXcUR8yjs7hVorQzScP3mLhg6tJ3q+qb0zrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564870; c=relaxed/simple;
	bh=zanr0Rvco2X6yCtrqiaHCX5WrY3B9zkm0/099sXDRrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RBwEQn7/DzyVxRzmeUqAHezT4w8pxl27IHtFCAgeuRJgLEu98EuMn6IRT4a2KuI6z6xZaHsIisnarQQzn6oZX5t7QsMaM3RBeSsdwG1WIUxpr72l0dizkXazxn4DnUtMeKMR9vYNn529k+7+n59jSsCRM+QNNldVTl+291zhm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CYuJsY2P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=emrJtngw; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BDBEC2540148;
	Wed, 22 Jan 2025 11:54:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 22 Jan 2025 11:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1737564866; x=1737651266; bh=oy
	vwNRLrt6bsmaX+kj3Lci83QE5SXWaneaIuBcKf3UQ=; b=CYuJsY2PkGzoPSJgQ+
	6+hCof6f6o0dMr+k9LwJAotUBOJiymy0sogdWsr+g/1zM75Am1ywr23owS7TGdLQ
	ZujPGOMJJKM9/1bf2XWxdG1iqKH/HgU+XKwF11Xg0U9ccS9Tl0q/jZxr7+ATC+Z0
	7V2qnDmKfCnpypKDpHZCp4RiPM/ow1i53qRnNTVvf7xeKQesHnYAaqIO166hmRKA
	o6BmXjbtxknvRP215MMs6de/1EeDCRdGMfGRGfkq5glndUfhUgoCO95OFEG+HtUw
	c22xi/FzLyFTIf7nIb3KnTcriMHYniGYzxU634Sf2sYP9fF86uv3EpoKIczp4ush
	6lew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1737564866; x=1737651266; bh=oyvwNRLrt6bsmaX+kj3Lci83QE5S
	XWaneaIuBcKf3UQ=; b=emrJtngw7W05xAFmPwbRRufUsD6/Eg4N4Lj3OWOiuU7s
	tbNFWLYM4Iisbn9qzxhnzjXRU4yx/ghPvQ/5GM3KKA75OZE2qLLLv1IBIjKBPvDA
	ORSzs09tVRrAvwZ6ve5L1z7GfSmejdJGjHhp529768/jQ3mo1QNFWBk1sbI3DdW5
	pSPHmfpOj7O7j2FdCahFz0vbbWTIuov3lIAfOAF4nrP1PcpWt6D1zhtpoP9FPQtY
	ueTKUxx9n1UP6CaoRmXLYpEm3Ycxk27MqIfBYJthzXbS/ND83KM1d3aXYNjt3knQ
	2waSr09IiDAWtLpLrlUrc698mnggM6JNluKWPqv6jQ==
X-ME-Sender: <xms:wiKRZxd3PG2YTjBeE-aeHLq5vZxrYT2UKi5uBW7R3V49wllZK6NOYA>
    <xme:wiKRZ_N659ie10Pncm6iZiHGSEcLtd5t3u5u8LUULmC3m0402Wmy7D044em2wPKfd
    0asLF_5ZwdUr9zZktY>
X-ME-Received: <xmr:wiKRZ6gDalxHDIcSTQ2odacbRLTvVPsmxxM_o5-IgxTZWonnixTJgY-zKvL9C2Ji8ebVMLcyth-sHqxzfKLypdTz5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgvddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghn
    vghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdr
    shgv
X-ME-Proxy: <xmx:wiKRZ6_qL-xSH8Wh2Ukn5O6FMSH9nowRmKhCrlYnvd_PVRVktD6I8Q>
    <xmx:wiKRZ9vq1_T-9GWcgPNWC84M3RmbGTYA1eQlbjTmPOC-T6XqIUDVow>
    <xmx:wiKRZ5FduinUc4D9uQndmYW9KWYtwiI5CnGbxIf7SYPK3IKmOUxS_Q>
    <xmx:wiKRZ0Ous6aDHaYX4y2r9Hy4SK0jE7O6xoWox2OyUj42mG2aL-KYFg>
    <xmx:wiKRZxjQIXddIcUqQpxDxObdI6NnXDe3qQQPjGoUmdnhXd9xIKUtq7Yt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 11:54:25 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
Date: Wed, 22 Jan 2025 17:53:48 +0100
Message-ID: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
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

When the driver was converted from soc_camera emulated support for
V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT where added. This was done by
capturing twice to the same VB2 buffer, but at different offsets.

This trend out to be a bad idea and the wrong place to try and emulate
this kind of thing. Further more it is fragile when it comes to things
like suspend/resume and scaling. Just how fragile it was have been made
more apparent when more features where added to the driver for things
the hardware really can do.

If user-space really want to capture things in a SEQ_{TB,BT} fashion
this emulation of capturing twice to the same buffer with a different
offset can be emulated their instead of the kernel, where it always
should have been.

This series removes this emulation in patch 1/5 and then proceeds to
remove a lot of cruft code needed to support it. The primary cleanups in
patch 2/5 - 4/5 revolve around simplifying the VIN internal state
tracking from 5 to 2 states needed to support the emulation.

Finally patch 5/5 removes a hack in the R-Car CSI-2 driver which was
added to support this emulation, and is no longer needed.

I have tested this on Gen2, Gen3 and Gen4 without hitting any
regressions or other issues, other then of course SEQ_{TB,BT} are no
longer enumerated as output formats.

For changelog see individual patches.

Niklas Söderlund (5):
  media: rcar-vin: Remove emulated SEQ_{TB,BT}
  media: rcar-vin: Remove superfluous suspended state
  media: rcar-vin: Remove superfluous starting state
  media: rcar-vin: Simplify the shutdown process
  media: rcar-csi2: Remove hack to detect NTSC content

 drivers/media/platform/renesas/rcar-csi2.c    |   8 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |   6 +-
 .../platform/renesas/rcar-vin/rcar-dma.c      | 132 ++++--------------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |   7 -
 .../platform/renesas/rcar-vin/rcar-vin.h      |  40 +-----
 5 files changed, 33 insertions(+), 160 deletions(-)

-- 
2.48.1


