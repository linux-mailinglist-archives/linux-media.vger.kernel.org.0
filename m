Return-Path: <linux-media+bounces-34518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B35AD5AE9
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 17:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2CBB3A2E1F
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 15:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB26B1E285A;
	Wed, 11 Jun 2025 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FUBZ8KQp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nbj5zBLN"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848C813B788;
	Wed, 11 Jun 2025 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656718; cv=none; b=DH2i7OwJrZBRpLlWtZW+26lHjB9JZWehPUekOC7OCjBkiojvk3zK/pVsqJbmL/yu2m4Qku/rnQmxRyXnVolgbPeSuxHoaB81S6vpzw2mBTW7coqvyjh92uEBThga5ADpUqIBRKqEyIdJGuetbHP9Nl0tkV6g/q/4KT9dbXoomLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656718; c=relaxed/simple;
	bh=g5gDM9BaAcIO8mGPjXVT8TBMia9r+YDhsrRz0Pkic7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pKK/tNPwpf2Kn+uHeWlPIW0YKimA3TwxiejZ0lTrfhNRmvTWXikaxPClBAWDHr0Suxg6DReVuKneZm2O53hVpBNuRrNbz55aRIZ4EDPR3Zvgm2L+MDSK6/ePD+nrgdE7iVOLJcoDNYdLjBjBaZrBCRVgPnNPpFDAaRhoY1lLGiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FUBZ8KQp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Nbj5zBLN; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 80EE813804EF;
	Wed, 11 Jun 2025 11:45:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 11 Jun 2025 11:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1749656714; x=1749743114; bh=Qq
	Qarfb9o9AmaL3wVNVjneHMuUgklP/HGelBXJo2VwI=; b=FUBZ8KQpcdkPd1k6NN
	4OH+EJEjIr0DyF4hpbDc7xfYB1gXixe8bzZRZQCbRIaohfDWJjtKqhQ8LLq2iXnM
	sc0IliVuIVP4R8M2e0vmmErpTKes5yIIvekgotAQfaGsqqICWh89XJPjPnth6xST
	Fon/3TGGbawGBG2FZGlVHAU+wv3nMHDGJQju77xQUc5hdm7En8guKy1lk41NiEZn
	TFJCSx5c9xn7BryWJr+hL4E+n3CfLn3CtIgiYV3STNlFnNbUDNkiztFXu05txgeX
	pq71RME79uhwq89uUVDkYEn04EonoIyWTosFuXjkFJD4qiYp9tu5NBJ+ZXrPg5s4
	pVFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1749656714; x=1749743114; bh=QqQarfb9o9AmaL3wVNVjneHMuUgk
	lP/HGelBXJo2VwI=; b=Nbj5zBLNjNHt3UsRHqKmSPQdZTQqzAioRQQo0e5ATIg5
	75NAHBLGh22GG8w79BLv7YJj3XB06Q93yiKWZjP3ZAJdcqMtI2noqqVq8Os+A+GG
	ege6Kkw/+cAeAn4pRf2lAqhRuBLdsauHVz8QYHOYlzbx/7YhE4Roro6mx/NG+MsP
	wL2FyykQ5S/D/ZaUwZH2/UU6jYasQbaIaQxxGaUK6q+N6uSRRB4C72gEuCNMp9pV
	q0hi/GKJAg4Oud33T3sazh+PoGuyDci8cyZjlbf7spUn3PmnZo05kO+ET6nyUkoD
	2IhsZB9cV677c4nwnNeQdeZ+pyBQthc3aEKoa2vYRg==
X-ME-Sender: <xms:iqRJaE25d0Zh4xAqQGjfyCKJOLSr5xiHV4Stc0hFp3tm9QHjnLKuTQ>
    <xme:iqRJaPEvZ3IHUwxeZuT3HxKfCve7l92YtMQt9ozn06_-2pQhSx6FQC2wFi5L_0XhM
    MHbVxbk08sshTg0Wzc>
X-ME-Received: <xmr:iqRJaM5HjpKMbENdQ856dtKcTUK1Dkq87pEjDrL7PmT4GUV60u_uQCG2WiqoTGJkd5VJMUkkflZr3oAQqJUNmhTx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvgdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrsh
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhi
    nhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvg
    gthhdrshgv
X-ME-Proxy: <xmx:iqRJaN0S41VuwBqP-h9M9slvgrJxv8JwlgwjSHPu0QTXumbSEwSOCQ>
    <xmx:iqRJaHFaodqo4SvHw0-hYt4FTDrcQxACe17udlDW7FsyA4m5zDWoOw>
    <xmx:iqRJaG-kB-0uTvts73OzBH-Itc_vpj-z9ABice-Wc8f9NjSsNZFizA>
    <xmx:iqRJaMlO7hTt1WKUdEaMFZIObuM4XHg-gO4QpTg5HzKwdNe90izg8w>
    <xmx:iqRJaGQ4iKWUb4zlXik5TVLRE4R8vEXVaKkBk2RmHmbkWxHK_B9_n08a>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 11:45:13 -0400 (EDT)
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
Subject: [PATCH v3 0/4] media: rcar-csi2: Add D-PHY support for V4H`
Date: Wed, 11 Jun 2025 17:44:41 +0200
Message-ID: <20250611154445.123412-1-niklas.soderlund+renesas@ragnatech.se>
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
devices. Previously only C-PHY reception was supported due lack of 
documentation and no hardware to test D-PHY on.

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

The work is tested at many different link speed and number of
lanes. In 2-lane mode using an IMX219 and in 4-lane mode using IMX462
sensors.

See individual patches for change log.

Niklas Söderlund (4):
  media: rcar-csi2: Clarify usage of mbps and msps
  media: rcar-csi2: Rework macros to access AFE lanes
  media: rcar-csi2: Update start procedure for V4H
  media: rcar-csi2: Add D-PHY support for V4H

 drivers/media/platform/renesas/rcar-csi2.c | 342 ++++++++++++++++++---
 1 file changed, 297 insertions(+), 45 deletions(-)

-- 
2.49.0


