Return-Path: <linux-media+bounces-32242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6504FAB2A1D
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 19:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35C797A9FB7
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 17:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5953F25D55A;
	Sun, 11 May 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MinQk4MA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="il8OcWlp"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227425C808;
	Sun, 11 May 2025 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985665; cv=none; b=tcVCfiSWQnDim0R/F/TPAyZeStcfLDxXos27cXFPZxQFV1BCHlKh5CxuA5zTT5+ml7qnD3CoWDYdrnBBXAYk/2j7EiwDqNGrLMNqW2XFNv3jB9LXHglwOTPm+d0vEOKSJS7vzQ6V6WDqMNPqsJd8jC0i1q5yGQNwfsXhUkWqniE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985665; c=relaxed/simple;
	bh=+hEC0XMSQw9gDeHyFoQjr7nz7nmqiln9JonDapP9s+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MEDuZUzvZHzaR+o04QrqwNuMVnLcZdCu4kRDPL/3HqiRajfdHb65clf8GPut5cMSg8yWubkYwe09TB8hqIO52O30xUaUkd7P9hFk+NSne7TyszlEcvlnsen65n3xZ3g5SXQD58ecg92Phx4CMpYEVVe+o3qDTIIwQo+JeFMakBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MinQk4MA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=il8OcWlp; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 43839138015D;
	Sun, 11 May 2025 13:47:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 11 May 2025 13:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1746985661; x=1747072061; bh=uv
	2TAX3BLb6KM0Q6C1WKMn0ijkBPxWrmE8C+l0eLSrs=; b=MinQk4MAY1lKh48/ZQ
	6HWOVa7FalclRXTBtkYzj8tUPbx6Co8OqRvB2GkIPSY7IzJlD0ZT9HPtsMvMf7l0
	LdW095t3Y+Z5z4CnZJcr0Uj2+YvDYTHOsGQ/yAk2YawryqnfBpUSrZCBfL9OCGiB
	4MNKgM4vqbQn6ZeSDFHOtSexKRGmp5e8DMBoavKHnd0fHY1aFNCEagZFkZzwxBxf
	W0HhcZD20LAkEwIPcQqpAPjY1ZTQocXjXKYcS5w5zP2M9laLjnqs4tWrXPKsosKB
	CYckbbyHmy8vh9VWEK/r0m69TI/b/7PmWiMUKcX/R5Z55SDulMO4YCNskDAUcMsd
	cwPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746985661; x=1747072061; bh=uv2TAX3BLb6KM0Q6C1WKMn0ijkBP
	xWrmE8C+l0eLSrs=; b=il8OcWlpFKJFfwfMCllTWIjRVQaliHtaDf2lIfvIKkv5
	0LhCrx+R8ORG/Y96QfQ8nzKZrlY7ihJE6j2k91KvoHxOwPYE22whbQa4ioeDFZue
	+VJewPhVUfPkK8b1TD5lHBiQBQJJ6LKbYJMZFZ2jDFjEpgfjBdiAWkCPTt7xPv4v
	PACw+htJbAYx+DJ5z+ULWOZSQWQlIxaWmo6j+cZuinEllmDgEMXGa0TVfoC2nXRm
	FwM0IafCoFPsUSLBrnEX/FViP2sqSdBLsLvNuGI9ov+c5pC9L+K2mAw+T2CKvCkb
	mwSijBMHtVtMZRGMFejvPdGriruiOsstZNGYqFUZNg==
X-ME-Sender: <xms:vOIgaK2DJbGdDpd4OIqodFBYgtE4IOshis0o4hjX6kpiZPGPAg0QBg>
    <xme:vOIgaNGauNL2IjvMo_1S2bC1gUrI0NYpy_Ot0BKndJKCEeDSAQ86gd2AcwFwNJO4_
    meO7Kz_wvchMOp87fA>
X-ME-Received: <xmr:vOIgaC4JvoFFlIXHpaJBA19mpCxmS_45QqUO7h7uf9fVPG4molEXTj5Nn8HQsl7YDNpwr81FM-ig-DT5OFAEOi3f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeltddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiug
    gvrhdrsggvpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhht
    vghlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrg
    hssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhp
    ihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinh
    hugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvg
X-ME-Proxy: <xmx:vOIgaL2odJlhJtHhlKV1kUUl5d7ZJZo5eIO4dVLzoPY1UeR1qIYwhg>
    <xmx:vOIgaNFqxdaTLPUie1-SuaqJDrIu14B9ANVmIqiugdec7I8ZVrUIcA>
    <xmx:vOIgaE_dmAfh_QmF0Zyidjb6ORacAnH4Xrd8JZWogiWN_qieL9Vx7w>
    <xmx:vOIgaCnGXIyJxO68Mfg7vU4GrETvXVaTSIduh2Vp0MyBNa6k5ohQtA>
    <xmx:veIgaERJpadgrbh4UfCIK46-lbNfM5OO_XoH9Xoh0DsD0Q0KjLVhCOz2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 13:47:40 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/4] media: rcar-csi2: Add D-PHY support for V4H
Date: Sun, 11 May 2025 19:47:26 +0200
Message-ID: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
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

This series adds support for CSI-2 D-PHY reception on R-Car Gen4 V4H
devices. Previously only C-PHY reception due to poor documentation and
no hardware to test D-PHY on.

Later revisions of the datasheet (Rev.1.21) describes the start-up
procedure in some detail, and we now have hardware to test on! The
documentation however only sparsely documents the registers involved and
instead mostly document magic values and an order to write them to
register offsets without much documentation.

This series tries to in the extend possible to at least used named
register and use formulas and lookup tables to make some sens of the
magic values. Still most of them comes of a table of magic values in the
datasheet.

Patch 1/4 clears up a unfortunate mix of the name mbps (mega bits per
second) used in the D-PHY context and msps (mega symbols per second)
used in the C-PHY context.

Patch 2/4 and 3/4 prepares for adding D-PHY support by cleaning up
register names and an updated common startup procedure for V4H which
have been revised in later versions of the datasheet since the initial
C-PHY V4H support was added.

Finally patch 4/4 adds D-PHY support.

The work is to great extent at many different link speed and number of
lanes. In 2-lane mode using an IMX219 and in 4-lane mode using IMX462
sensors.

See individual patches for change log.

Niklas Söderlund (4):
  media: rcar-csi2: Clarify usage of mbps and msps
  media: rcar-csi2: Rework macros to access AFE lanes
  media: rcar-csi2: Update start procedure for V4H
  media: rcar-csi2: Add D-PHY support for V4H

 drivers/media/platform/renesas/rcar-csi2.c | 447 ++++++++++++++++++---
 1 file changed, 402 insertions(+), 45 deletions(-)

-- 
2.49.0


