Return-Path: <linux-media+bounces-31459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A30AA4C10
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB8317A8938
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81B225D90F;
	Wed, 30 Apr 2025 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IpTYrnkD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rUFTkrMp"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52B425A633;
	Wed, 30 Apr 2025 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017701; cv=none; b=JAWZ4TDjUWI8MTroJemr+wmJ9eW1ogaNL2JnE5CjgTLuU+h8xmYh8w5eGx6kbVGHyAUN3wDoDU7njn5HbGa3JLxQzyQbHgZveNtaF+5ui+oP5fFe6u0AJ85d6zYxIKPj9EKQyXVqotokGI0FwZ5HMVXASfOmm95J5r2sAwo5ktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017701; c=relaxed/simple;
	bh=aZ4H92vLDbh8EF+CKVfa4l0bEzisByBnu5HBJhGo0oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=igqy7GapbljRvuBi//MEjBecVx4yip263pnSOdjzfrpnZnscV0pNXUdhlBQHmzyX+d4bU2QCFvgdq1MVbumDTYMRAP5OmIHeAeNxODvdlk4bdD5mMRBkhvSF1dlmEZ5pkoid+pxkSfcDdhxUbiXdq3idGqsqhmtzF8ZMXMm43Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IpTYrnkD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rUFTkrMp; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5D2042540243;
	Wed, 30 Apr 2025 08:54:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 30 Apr 2025 08:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1746017697; x=1746104097; bh=qW
	c4isue4hFDy/D7OaeR7F5B3QTCc+RTpjYWzMnZSys=; b=IpTYrnkDZfr1TughyM
	dCDN6nv1t2emyizbhDnal/4UO6xz9bKLWPc3yfzrel37YPXLdS7ToxgzFQCcZuTh
	3JkhVJgRTvft+pPfl1PPoTFCNHXB5cJybEj5Lx21yvW/yeMxEQEmZ9O8eHPgVclN
	9VVF2Z0O0dlPswTldOMw+Ljbb+JFBVP6i0fbETc4y7zZPskxcNP/pQMbibnCaJc+
	KCl/QAwA0M+RD3aLjHF7W9LIqXoymZBz0gwAeq9RNDdEMdkbIIcalxDfVjATAD3d
	gx5nQT4w8Xhm+/uCB/vigGghX4b4rsvHC1Y1bH+Eg6sJpwcO49aww173uZ+jiQB1
	1a1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746017697; x=1746104097; bh=qWc4isue4hFDy/D7OaeR7F5B3QTC
	c+RTpjYWzMnZSys=; b=rUFTkrMppAhi1MYn16KVWNcx0fV+PckM+m03D9JG0wjU
	I6Tp74I/rsFFIfr6EjsL6/NRTEauXChxLJ+eNyU176rCU94ut7I20PbTlOgx3PoR
	omzsl/cuZ0W6RwbRPU4Cytps/nMOfq0enly87HcmvjwgwWIVAYC4v0/o6gfsVfjF
	Uo2k7lL4vdSLq8BEQsY3u6bsizJryNcpH5Pj6BmbMzo/+8MSpzt/pc+7GVqwi7MZ
	86crSwSmA9S5WE3NuiAgo2HCIxRtgm9iIhbjUs0XSP90QSyaI55Kq3MMdVqxYOAC
	hKWb8i5JA+aLxKTVGlP/DtbgPa0Y/tRoCEJTgFyimw==
X-ME-Sender: <xms:oB0SaHHrBKBeElSfQSKQDbwqXpKGtXm6tni4xANrL4yRmZFew5AaDw>
    <xme:oB0SaEXhwd-nxgjHDyJqHLKu-OBo6DmekdTmt5vdPlAioCaAtJj7gRXYp9CuRcuM8
    6S1ES4mv6Soc-pV3sM>
X-ME-Received: <xmr:oB0SaJJA7e67m2ScmkMKMh2q8XoAf2EEmhOB8QGK7PkgQa-_rzu-Iu7oHEIEQvas2-QqmxsNfd1Qhc0N0LCytKtY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrnhhivhgrnhhn
    rghnrdhsrgguhhgrshhivhgrmheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgthh
    gvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhg
    uhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuth
    hrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidr
    uggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:oB0SaFEWg0ofivupDFQOpPdB9u9qIoeTtb8IYpRp3GGADYZ93xC_Kw>
    <xmx:oB0SaNUKzYzKF0BYaY97eY4K0d8yo0id64sCMTgnMQhGuy8xf5zdJA>
    <xmx:oB0SaAOXS16M4bjYe0rjl6k0alnV8OJQNh0vK94s_m1xTl9SE58UEA>
    <xmx:oB0SaM2PPVOMB-bTdxtuzSAGYflPej0TwxoOJyxYzQp3TXfScuqPmQ>
    <xmx:oR0SaFQ85yxc6_g9iq9mo9kp66BPvtRIDWfiy6La1ZC2By4Slb__oS0r>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Apr 2025 08:54:56 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Date: Wed, 30 Apr 2025 14:53:22 +0200
Message-ID: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
frequency and pixel rate") the driver expects two specific
link-frequency settings 2-lane (445500000, 297000000) and 4-lane
(222750000, 148500000) operation. The driver fails to probe without
these exact settings.

Update the example in the bindings to match this to make it easier for
users to incorporate this sensor in their device tree descriptions
without having to read the driver sources when the driver fails to
probe.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index fa69bd21c8da..990acf89af8f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -136,7 +136,7 @@ examples:
             port {
                 imx290_ep: endpoint {
                     data-lanes = <1 2 3 4>;
-                    link-frequencies = /bits/ 64 <445500000>;
+                    link-frequencies = /bits/ 64 <222750000 148500000>;
                     remote-endpoint = <&csiphy0_ep>;
                 };
             };
-- 
2.49.0


