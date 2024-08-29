Return-Path: <linux-media+bounces-17157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35193964C04
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 18:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 868E1B22E54
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A964B1B654D;
	Thu, 29 Aug 2024 16:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="A2+pZeVQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JzN3tj9J"
X-Original-To: linux-media@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBE01B5EBD;
	Thu, 29 Aug 2024 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950286; cv=none; b=Q0S5egDS/gvY9xRPI89Klj/dM9n2Yb6rPkLccO1/2dZylaXhVas7DiNrAUJ0N1Y9HWwP09nWSw2pOi6ftdvWp2AkIRloUnw1iZQTlONq1AJJ6wN06Gnx84G++xtkBjYtaw4OEhUmJrvzsZFeCkTtzk7M4RsXZZXdDXKySGGFFlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950286; c=relaxed/simple;
	bh=x+E2xSOliwv3VwbYh1SEe1FzDL+mwxesX5L5sUtes/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dz3+7s03Kd9VoEnUj5RSlfSP/+Ot0Yuy4C6vgMyi5O5E5rx2/nZ6FC/qfnygKGQMHCblb945xnANLDqEgE+oV2ccbXjzt9+8zZhOXgC5o/hwJzi3+Y7NNJ0OyYllMSWDDi+fbS/i9nmL7Z27mWr+mfHwSXrJMw/u6BpcYaays30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=A2+pZeVQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JzN3tj9J; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0B18F138FFE9;
	Thu, 29 Aug 2024 12:51:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 29 Aug 2024 12:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1724950282; x=1725036682; bh=d7
	tiux3bXoYy+XC0KmOAU1uT04Wchk6bNlYn19sLwJ0=; b=A2+pZeVQ2JmheOBOY4
	cgtm09kr6zxQuRLXfFltH8kpKsLNtyYn8s7wx6PMIvP7/cGpg51UMofgP2+BEjPA
	xXnyvoVwmmxkmjOA2qN28Yh1v9GOfcUTn8FYXIwi0ibXwsfs1FpRuIzre+f1hfSa
	CYKCoF8/nWqbJb8sJd/pSnOir0Hak7c+Fq/scY1eAVcU40qIhUU24RTzii4DbJcW
	I3sAYKRtf7x1pG3Yf4BAEBFDjH3+Y81Eu0JfN7kFkZCozFVGT2tSUK4ZdDSyc0Ru
	EGcIFzckZmWc+etJBpqIZCqy9pFGOqoAFfanNXsbLZ/KLexoJYAGFg7Ckro//PEC
	gVxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1724950282; x=1725036682; bh=d7tiux3bXoYy+
	XC0KmOAU1uT04Wchk6bNlYn19sLwJ0=; b=JzN3tj9Jc1gFzA9L2qZlinKZ8jI+1
	g110LTBBMfLFQmnE2s5TGAkz3tJZ0zbmZgCArBU7DNnGeJjioVYxWoiggVO96cEL
	va6XJkRCNnKmzY6I5/uinJTmdQtEb/L6wia0aGeqW3KVpBErprXt9OTX01woEVv+
	jcg1ZktluTM/Aoc7p7UD/lY1r3ICb470KS/3rYdhYZrx2d8eHQgqKCVBX8dp8W/o
	AGcVtssEnMqI6yn+45Ko03PjdbmCSzTch8Q8KlEOX1dD2DXcFset1ZwxBfFLVZiQ
	ijGmngn/E+Z9t1uyjGSD/fM6qclKRrzqMUvwFxLa5dVUerL82umcQLiDA==
X-ME-Sender: <xms:CafQZlff3duRQCnDvCgbmSoAp3O09PeMC6T8LnJCFoArsnUmpn7P3Q>
    <xme:CafQZjNeSpIs8ByIKv2OEJ3yyK4BLNBPMm6epSgTSbVlNi2gWHDMazMmC3rpktxgu
    rjblUliqnZIBPKGtFk>
X-ME-Received: <xmr:CafQZuhFsCLXBnQ9t2nMJxJPKOI8_TKtxUfZegzl00_BEeJv7SSvWKe-vz5pCr2whMEOXp3652zEIXAwcitKb9Crpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhho
    rhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugi
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhushes
    ihhkihdrfhhipdhrtghpthhtohepjhhulhhivghnrdhmrghsshhothestgholhhlrggsoh
    hrrgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:CafQZu-fnwohCDI0A8QlbxC0Ylb2Rn_-uu9NkPP2_InpYE3KIws8Cw>
    <xmx:CafQZhuXP97abxKXh-O4QVTSW-ufxHzu_BsyqW-UERrIGXJ0KIBKTA>
    <xmx:CafQZtE0oPqY87NV2EFEjkrg5IyJe-u6RwTse31gI4adR_OyPjW-mA>
    <xmx:CafQZoPU8wZE0Rmft-yHM4x8YUVSDv0R3tKu2L_JeXXUAsL7V-SiAw>
    <xmx:CqfQZqH7mb3bkRWtIN8K7dHCwPl9hBEzNdrrHI7nee_OeGzYNp1_rvhG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Aug 2024 12:51:21 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/5] media: staging: max96712: Add support for MAX96724
Date: Thu, 29 Aug 2024 18:50:46 +0200
Message-ID: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series extends the max96712 driver in staging to also support
the MAX96724 device.

The devices are similar but not identical. As the staging driver only
supports the video pattern generator the changes in the driver are
small, but needed, to generate a stable test pattern.

Patch 1/2 extends the bindings with a new compatible for MAX96724, while
patchs 2/5 - 4/5 prepare for the new device with small improvements and 
moving device specific settings to a device information struct. Finaly 
patch 5/5 takes care of updating the driver to support generating a test
pattern without changing the test pattern clock (which is not supported
on MAX96724).

See individual patches for changelog.

Niklas Söderlund (5):
  dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
  media: staging: max96712: Remove device id check
  media: staging: max96712: Move link frequency setting to device struct
  media: staging: max96712: Document the DEBUG_EXTRA register
  media: staging: max96712: Add support for MAX96724

 .../bindings/media/i2c/maxim,max96712.yaml    |  5 +-
 drivers/staging/media/max96712/max96712.c     | 56 ++++++++++---------
 2 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.46.0


