Return-Path: <linux-media+bounces-34797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE28AD9D5D
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 16:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01AB8178A0C
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 14:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352922DA740;
	Sat, 14 Jun 2025 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="I4/m7bDY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MVXXa0lL"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0783D994;
	Sat, 14 Jun 2025 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910581; cv=none; b=FHpCYZz4LvzDDaU7E7uk0okbJp1pTzs956UZVltyRXqgIAgQQr/MlpfPP4cDRK1gVW1TCTBstEH8p3k7Ag3rtZ86J4taCn1HBWuH4fujanI228W/De66PT2LwJB8KEAuPX4HmY6kizi2v0p6VMPBHl/15c43xSHHh5h9k8fCME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910581; c=relaxed/simple;
	bh=U4yQSxX+QVuomLBEgf9sZIWfa+E/mb0wq5uOSJVml1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r5ao28/T0WMw2/qnFv/uiciD7MgwMXmK/8RVfoopvw7UzqXfVzUfsymCN/msfLnlrdQdKW9nUxC1Uf9QZl6hSjNgU7tce6Kbu9gOgWIR9iB6DaF0XrK28ggRbT6OjNgGEJjPzU0spKJWpZCD/PplWLac4hsrYdD+wWI7v9Czh/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=I4/m7bDY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MVXXa0lL; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A0CF9114013C;
	Sat, 14 Jun 2025 10:16:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 14 Jun 2025 10:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1749910576; x=1749996976; bh=/D
	LDU2vpZE4NqKLhZ3pPTKEfAWUacf8pnN0p4apvaLs=; b=I4/m7bDYo2T4tPJaGB
	m70xwpWJEOlAaCx1fJ9DvrK+n5xcRSoyaB5U6Yg+aAZYCdPM9e/XcGEa5Vi+1Y/9
	bBRwYIrlqDQD7xd965jNArVnU9V+HFiU32n8CHEd5IKd9Cn5jbCJffAI2sCRiRGe
	URX0hBE3WepyQtUHxGPdiKZjcdjh9D7SLMrrJG3nLqi4DWyYK1vAIEmxg308Jm99
	rrWTe11Iqsi6UxONQYVHkxPWMO2zYShDLyWpDZV6Dbhj56oBxSbDkLJkS5WadfpN
	dxEG25m5URZTRpnj5tbVX6I8CRTM8WWu3ovt49qSDeZx78xnd6g7LNKKqL2kX8jO
	onhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1749910576; x=1749996976; bh=/DLDU2vpZE4NqKLhZ3pPTKEfAWUa
	cf8pnN0p4apvaLs=; b=MVXXa0lL4vE8DDTaDHYksn59gyjhw9UgE9Nn7JX7biGO
	/Y+fHu3a7VWOCsUhG6UXKJhdT0gY/Hoz+HB5hscX+XGuVS3aMo5zZs2DURTLX38v
	ddzw9Dxy+cryWd/l8mhivSBTrWPoBNSsJaQBxxvb1Lt8K8IG27atQMWZdvC9YNpx
	ZQ+a/tR1FHzB6ElGUj8ds7O2AeLRIRVjN5c0IK4cIaJCp6fgiOk1fX+i5JR+UpxV
	JQt/UZ3AtQaok7z/gIRlf0yryDjkQCbeYEOCs/nwBu6D8zrzS+Y0N6X7hk89AsZt
	Aos+wVVuMvmNkbTNaHFe9yoEltLs3L0Ml5/rGqT3BA==
X-ME-Sender: <xms:L4RNaM04i2XTPUQLr_mEluTWj5CoqUAQ7rK1kaWJoL32RbjII5gbmg>
    <xme:L4RNaHF5Qbyj7yvP6qrr6LK3uBKJmX7GgDG27cR8vpZcrQ15EQPc5WaPRf2PRvoLY
    ilH9G3YyswqMnimHXo>
X-ME-Received: <xmr:L4RNaE6TiOQSOhflTT_By0bWdGluotdpqLCxTy8DU7XsKBMjTFXsvg8YIjJEDvBg77EVYsKknW9-XI_yzAdxiYp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvgdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrsh
    honhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsoh
    gtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:L4RNaF04SrdGAlGjiFxI-1N88GBZCe3hKqJSPzaRSu5dL26FPq3BsA>
    <xmx:L4RNaPFRPZFf1JXp7SKAdgeHvxXOZkw9MHXlCgwQQ1hy2EVIP7RqjA>
    <xmx:L4RNaO8Fzfc9uHBYPZ8mOhTNR8prXO6XZ0a3H_SHJR5ibYN-5TUJ1A>
    <xmx:L4RNaEnSkeIip2sbl87U9irhurdU3AG6Gh3qkstErxQVtQrlugafNA>
    <xmx:MIRNaPRzctdiqoeAs58aiI0VZ4y7DFs1subTMWnqJ6Z1jbDiGfJ6mtoB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 10:16:15 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: rcar-vin: Generate FRAME_SYNC events
Date: Sat, 14 Jun 2025 16:15:42 +0200
Message-ID: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series extend the VIN interrupt handling to be able to generate 
FRAME_SYNC events. Having these events in user-space is a great help to 
know when a sensor starts to expose a new frame.

Patch 1/3 and 2/3 prepays the existing interrupt infrastructure to 
support more then "frame captured" interrupts. While patch 3/3 enables 
and checks for VSYNC detection and generates the new event.

The feature is tested on Gen2, Gen3 and Gen4 and all devices correctly 
generate FRAME_SYNC events.

Niklas Söderlund (3):
  media: rcar-vin: Fold interrupt helpers into only callers
  media: rcar-vin: Check for correct capture interrupt event
  media: rcar-vin: Generate FRAME_SYNC events

 .../platform/renesas/rcar-vin/rcar-dma.c      | 54 ++++++++++---------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  2 +
 2 files changed, 32 insertions(+), 24 deletions(-)

-- 
2.49.0


