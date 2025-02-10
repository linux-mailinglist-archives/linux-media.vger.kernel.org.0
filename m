Return-Path: <linux-media+bounces-25944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702BA2F610
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEBC5164CC6
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D29F243945;
	Mon, 10 Feb 2025 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XTGtMdZ9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="spkI8om1"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865825B68D;
	Mon, 10 Feb 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210207; cv=none; b=miKaKqkAFQjQXrrWVjDWxAF+95uWn8m+Gh8oGDSQif2K03PHK8WKMTeGv9jJrKovng02chIZrOqyU9gCVGdUmZFy5pAKBjd0ZywxB+/6ntnLy8tMsN9k/E+nRGxHJ9v4moHY2Y7vSqNBpJtHjxXQLjXKTKIvchnpkVc4wppKprI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210207; c=relaxed/simple;
	bh=zanr0Rvco2X6yCtrqiaHCX5WrY3B9zkm0/099sXDRrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uCP3mrBqthS5O0j8CltU/A738pcxFHqT5IKxD4V5OoWrPDbFGZdK3bm2ypy+gazOSQTQEvnjO5M8WtDC8RCprSV0wt1konRircOf3xotviykL0hTygZqbnSggwroktGG171fkNaYCsSn4p7ypfylT0Jt6v7kUMsQOt6YEQYQSIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XTGtMdZ9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=spkI8om1; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 1E50D138016A;
	Mon, 10 Feb 2025 12:56:43 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 10 Feb 2025 12:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1739210203; x=1739296603; bh=oy
	vwNRLrt6bsmaX+kj3Lci83QE5SXWaneaIuBcKf3UQ=; b=XTGtMdZ9OAGxvcv4Nj
	ugzjv8ckLKicGZ85kxujq29MXWGLCYqev1w1Ul+sku0tMK54anfwfglFfhFxcBTh
	OHKS0KehOktUnC/wy8QkiRdKl6Akgpn3RSrC9iZrXWFpGXJ4yLZ2WJJNAv6r8Oru
	HNuy040t0EHEsKIxQv3t6a6Of12kRhs5s0+/idWvwNLq4vulhe2WJVM7sStnA+0g
	zLa0IDgiC8gETLt3kLbgqLX4pDJjBxA6N7pxnfN9IIqpSGEngg8HUPi3Jkow7fS8
	yaN3Uh5fUrWzpwQMuyca2ARyZKwepGmYQ4ZO2QoVJAWqoEQKyFTP4i3myy601DSk
	P07w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739210203; x=1739296603; bh=oyvwNRLrt6bsmaX+kj3Lci83QE5S
	XWaneaIuBcKf3UQ=; b=spkI8om1AyrXTY8ZMtN0jp+3du6lZUTTco9cSgrnyaVz
	+jNRZkxgNqPDz1aWJ0tLKZdpAGQ9bwfrQYwbPie/N1aKmHDSd62U34E86vyJPrSu
	Qm2ZVPkXLTSSTe6XXwad+pgMHpj1pIkXTlAkdbZoC6aXPGaz0eLUf2cwyiuPI8vd
	NGukhbWIYJ6siHoLMJRJSgW+zSW2jyJulRnvZOaceVK/zpVIhPrE0vdKjaa1KPPI
	aIdS7GseWTEi6vucm5iTkCe1w2c/SvRzU062mYQ7fD0g7zTS7xSuYYwQF+Ukzhc9
	vFBMUX4hHliV19a5IBbKwRJ/qCIU2GOraQT8mf3hrQ==
X-ME-Sender: <xms:2j2qZ6QyT-HuQ1nOoSoSIHvETMaPOWfy3jimeANBAtlzo76hqssNXA>
    <xme:2j2qZ_wDXkVUDQ6fydf2CRJPSm219R5fkTseHZkHAlhYv3tAX3I4dFXtn8GWgb6Sq
    AK63xFg0RZAOgkLmqE>
X-ME-Received: <xmr:2j2qZ31yTCxZ_AMyuXEFXTh-I2TnbtE1y9uy7NBLNcvUhWBw-GlpTk26jUqDAFp9CA2AhArWA5FFAFhMXzbIukiPbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeejfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:2j2qZ2B5iMFloGWnXOuhoYqQYTjg5qJaXLfT2UJmdZU00ay9Cg7XOQ>
    <xmx:2j2qZziy62RfaQQqnvJae43O0SuGhE-m9uAJJtz3i_254wE1fEyRXg>
    <xmx:2j2qZyrO_xYGY_rRTBslz6TONgrW_zqbSIfnKG6sEhJlorVGIQHH6A>
    <xmx:2j2qZ2gVeotWEBGlZaiBBJ13OK-fTB0j5opnX1jkzWNidTtxDfTdKQ>
    <xmx:2z2qZ-WIPvGfgrwWxSarfzdYuvVMsD8YODAOFm-lyJoKUrcYPj0dRmZH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 12:56:42 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
Date: Mon, 10 Feb 2025 18:56:10 +0100
Message-ID: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
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


