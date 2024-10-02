Return-Path: <linux-media+bounces-18987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3901498D158
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 12:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFF1B284959
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8701E7653;
	Wed,  2 Oct 2024 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VOd1QZJR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nvYpgwV5"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31041E6DFE;
	Wed,  2 Oct 2024 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727865273; cv=none; b=RXAH9Fyor8x33HMOzfKcImfQX2XbDWJ+J6OXyGJ3ByBNCz3gkKc7Lin+IQ5q0ici8+r0H19RicHqqTLvrWUxfuPe/Go+t22j1Q85WMO2bsfuZSorjwywCSjD2h1ulEuJLTuDUgfQgKVZfddFXJ4RKyNGZSjB9tP2gbNMGLyX0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727865273; c=relaxed/simple;
	bh=UJvLAOOdkyNTc45AEJD0rQF7xbyEMfEtM7RFdqNtzPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RU7aUn0wErIdC8qY/7X/nmbQOn3q/Q9dmJXVw7J3LxEQO5x+WZltiUEI66AoTnodYE3H+XoiwnpuoABW+XpbDs0XFURk4PZVxqy6GFX1cjbsz+Vm4oplmyu8TF5TzdtxImYdy5rXTiwZaQkF/huqpUV3In4geRIxxhriGzJpFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VOd1QZJR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nvYpgwV5; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id D405913804BF;
	Wed,  2 Oct 2024 06:34:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 02 Oct 2024 06:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1727865268; x=1727951668; bh=MH
	UxFNK6Kj0O6vRoXpXcWRw2nL8Vq/neYJBDtKDNXvI=; b=VOd1QZJRFhFKBkX0DQ
	SV+HTRIQH9/+jtlyN+F15TNAw/MZzupi3aiyQWzz9rVZMy2al7JAKIKDzteRDman
	35W/4UCmG8WU0w/G0td2dNBGBdmmaeJzelK8rn9XkJBRDIYKMvtG/ax5U71DE7be
	4YEWjCUtw/uA7vLaUl4oKgtySUtUQD7AGhShmO7Ea2bhxlPLx/jiHUMPCrcXXsfN
	YYsBBxBs+vaeB0o48CUheyaiTbrAioNXKnO6OMqz9kIJr7oPI5ShW9NF9pql6juv
	XT1GF28HiPsAVoFCU0D+u3HGIrE5tkH6cAb7WVZTPWtHHgPiJkafaSsIHRHs5zM8
	r3FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727865268; x=1727951668; bh=MHUxFNK6Kj0O6
	vRoXpXcWRw2nL8Vq/neYJBDtKDNXvI=; b=nvYpgwV5BrkfT5apMTyBJ7+fRKaHu
	d5TI5vBiiJD2w1mIapq9NaEIZU5D0TcB2dJuBLBCg3bOZd+2bmCsnDSUD8qt9kxG
	YT8b+UQNH3US0NveVyhzXO5Ox2NU4ykGNOQqbMtq/Cxi/BwkvMLbxd2AHXNxWr+J
	D6goPKcJkH+ts7TgqdTnGRtAm+6l+glpApktX180JLq4fZIxWLkqMwo07Duq425F
	xnJV9PNOk5l2H2EkItOccYOHM6EFsWXeVcT1/dK6y2e5G7vnkUP+Wlc2agGiCh+W
	pRdcvkxbLVMOtjh/S2pMZxQDUAccL0GQYwoqQexUdhYPSfIEh4th4A4dw==
X-ME-Sender: <xms:tCH9Zr47zd_IT1RK2ri6gDXXuutR6GP-MdlTWsx16ljGsd1JvowZ-A>
    <xme:tCH9Zg5ALc2yOTI8a96yNy_d-aYBBumVt_Mk75yot0vMGSjPM1K9LpO0HVhqBh2EA
    3i4gU_TIM1gYEIC9u0>
X-ME-Received: <xmr:tCH9ZicyGSy41G5gzzOmgAwUkj5-MIhwP8eR4O1pAhjSIiKwb2iWlPL0yS8fffOJYMPlF4FNPBb5yY_RePRJnIlspQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhr
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhsse
    hikhhirdhfihdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdr
    sggvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsg
    horghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:tCH9ZsLQoLxMM-alJzKILtBND3_vBtNdo72-DqyaPa9UiUbiMOvfoQ>
    <xmx:tCH9ZvLyIre7GDWdurgRz3aSwZ2VWoPH-zdIUnE0to2CLvIKseYCRQ>
    <xmx:tCH9Zlx5JbTMhEC4TP53bacK-LZCbPvwgkUGrjmduxLyPbI-jpJgzA>
    <xmx:tCH9ZrLlanolvJQLjQNmiJYPB8dX3uxbDtCAgmKuG9TW0Z05I-jtSQ>
    <xmx:tCH9ZhybvMSAB0jmCA9WG0vqjE693oJNp4dboRHRh5BVYbYHBVNC04VO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 06:34:27 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/3] rcar-isp: Add support for R-Car V4M
Date: Wed,  2 Oct 2024 12:33:15 +0200
Message-ID: <20241002103318.24289-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.1
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
Gen4, and similar work adds a family compatible for that modules
[1]. This series mirrors that work for the CSISP module. Hopefully this
pain now will pay off later.

This change requires updating existing DTS files to add this new family
fallback. This is done in a backward compatible way and the driver
retains the compatible values. These patches where previously part of 
this series but have now already been merged by Geert in the Renesas 
tree.

See individual patches for changes since previous versions.

1. commit 9fba8eb8d55d ("dt-bindings: media: renesas,vin: Add Gen4 family fallback")

Niklas Söderlund (3):
  dt-bindings: media: renesas,isp: Add Gen4 family fallback
  media: rcar-isp: Add family compatible for R-Car Gen4 family
  dt-bindings: media: renesas,isp: Add binding for V4M

 Documentation/devicetree/bindings/media/renesas,isp.yaml | 4 +++-
 drivers/media/platform/renesas/rcar-isp.c                | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.46.1


