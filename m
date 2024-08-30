Return-Path: <linux-media+bounces-17240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D8966A9C
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB01282200
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B534C1C0DE0;
	Fri, 30 Aug 2024 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="sjh/0qxr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cu7hY2mj"
X-Original-To: linux-media@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCD81BF7E8;
	Fri, 30 Aug 2024 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050101; cv=none; b=Tf9HXFJwA4BNJkSXJMf0AHp8BD/HqwnV4YUZ4YUT67FyMB73y9DNnOyCeJ66/QjMpIRPGpcncJ7+Ub2huasy8HOswkl/7VqYXbwNw1gm9leJlUiFDiTKlJcOomfw09yPC9FAvNMXv0lb1Gem3AGszpKkWP/dh6xd3g24myS3JgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050101; c=relaxed/simple;
	bh=PP52VW+hdDG/ryUUM29mko/Q7QX9Rkb6Kg/s9fNpTRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oUlaDQkNZ0OT9h9dhVrX1DBgGRftG3ftg8QeIXV3mNywYsf2Kt68+zWnLO8DXfcyCjh2B8RUsEaV5FstlWv1kcHB8s+gxwiPKSTQq68hKx/cWNx4Hq8mkoYPCU4NNSml+mkWZzUGfvPUJ41TQ5Hytn0Y0TYB2dewlDk/D6mz1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=sjh/0qxr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cu7hY2mj; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id B4F7613800DC;
	Fri, 30 Aug 2024 16:34:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 30 Aug 2024 16:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1725050096; x=1725136496; bh=6f
	6NERc6i30T4YoOg04z8yEi1BAkErRXeOlvcKvHBbs=; b=sjh/0qxrYsjmH5Xq1R
	InDjHgqxX6r8z0Fo1S+sq9tG/XCP4KqYpzUJG89AD5MlGTE1KTck0g8xHltf1Tgj
	tTkw4DUJennLkzH+ez5A99Dv1ocCzk3RJuUOnojF4g3E2A7fiUxiaIoLUZ/AbmbT
	VeOA4/zYbCBX6pMri2GgVPT986rsq0dtVYD6r0bA7WpK9d5j3Bhhl6lF8/BB75yK
	uC19vfxPyaXGRrMyTFovEb2aSLlOaGU4nyIOptC5Xfv/WhXUhLLp6njoHt80MleA
	mHW8WM3anzNWuiiB6n/GqZ3LJkTuG6G2DN6HGGJ2JFcnziRdP7hSnYi8K6dNJyT1
	3QLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725050096; x=1725136496; bh=6f6NERc6i30T4
	YoOg04z8yEi1BAkErRXeOlvcKvHBbs=; b=cu7hY2mjq6klilpj1kZpsaO7VxueQ
	N5gMOeaNZ/bTHkrNKpS04+QEudkXqA37YE5z0pszqj8Yj4zST9NTV3uW6Yn5CyNX
	C2EjZSKVL/vXlTVclj3IVWyhUlBIPwkltZm/FpTxnbFNsHO4stNt2id15T0Os4pa
	wCosprZGTbkfS4ZrOf4qSqx3BTLaENqti2CHH/P+kv6liOlWfsVjFequSw8ma+3O
	12HYyBBlytZZpb94gBEQIK277AFngudEofafbHQgUvH/NK+Q7wpMMXjM5Lm//ur7
	bAxKvbpE/ok4ineOP1LvRYCvWAx8etjLChNXElEdVNMOGJ7002amqeZMg==
X-ME-Sender: <xms:8CzSZh6nzBSNbWn0tTze0B8I3VhsLiBL30olguNjC-oyTbD3ZjbQmg>
    <xme:8CzSZu435hR08g9RFymHOPUVOsAp5wMDTDpD7NX5p3NxVf2UbK2PJKEFoH5suQmge
    9w7xqvL3j6UImGQPCA>
X-ME-Received: <xmr:8CzSZof8Dac8qbn2K1L40k4hh7oD8mifu3zP2IBf-ulX18MhnHT1GLC7WrdsrCm5WlpRQKDk5Ugc82klKu2UEcN6Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesih
    guvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhiodguthes
    lhhinhgrrhhordhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhr
    tghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8CzSZqI7LdV0voGWs5bkznq7o9UBZIeTagcTERkHlgUuzEijNVKinQ>
    <xmx:8CzSZlK0cRlsDt7eX0Ax6IFw7AOGxdMYFNWBEj7joFdkI96ZLybRiA>
    <xmx:8CzSZjwP6tViALnLRVaxZjA0kOOe0o8ENydjQgs5GgAvNFp4nKogig>
    <xmx:8CzSZhL2ReR5rJ1TMaGUQqXV1BitaRab3c1LQqmaH2Epx5pwLvkBcg>
    <xmx:8CzSZvxoUspq2f6YLvCpTx1n9K8n-5dKdOV-pHBSnVUz3SPBXeYmBjNK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:34:55 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/8] media: rcar-csi2: Add support for V4M
Date: Fri, 30 Aug 2024 22:30:56 +0200
Message-ID: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
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

This series enables support for R-Car V4M to the CSI-2 receiver.

Patch 1 adds the binding for the new device. This patch was posted 
separately in v1 but have now been folded in to this series.

Patch 2-3 clean up some simplifications in the driver which where
possible before V4M support but that now needs to be addressed.

Patch 4-6 prepares for V4M support by extending some of the abstractions
used in the driver to cover how they are implemented in the V4M version
of the CSI-2 IP.

Patch 7 improves the documentation around two registers used on Gen4 as
later datasheets now document them and they will be used when enabling
V4M support.

And finally patch 8 adds V4M support. The V4M is similar in design to
V4H with the big difference it only supports CSI-2 D-PHY. All of the
media graph setup and V4L2 callbacks can be reused, only the start
procedure is different.

See individual patches for changelog.

Niklas Söderlund (8):
  dt-bindings: media: renesas,csi2: Add binding for V4M
  media: rcar-csi2: Correct field size for PHTW writes
  media: rcar-csi2: Allow writing any code and data value to PHTW
  media: rcar-csi2: Abstract PHTW and PHYPLL register offsets
  media: rcar-csi2: Add helper to lookup mbps settings
  media: rcar-csi2: Move PHTW write helpers
  media: rcar-csi2: Add documentation for PHY_EN and PHY_MODE registers
  media: rcar-csi2: Add support for R-Car V4M

 .../bindings/media/renesas,csi2.yaml          |   1 +
 drivers/media/platform/renesas/rcar-csi2.c    | 518 ++++++++++++++----
 2 files changed, 419 insertions(+), 100 deletions(-)

-- 
2.46.0


