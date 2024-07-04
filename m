Return-Path: <linux-media+bounces-14652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803A927AEC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 18:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 996911C22465
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F3D1B29C2;
	Thu,  4 Jul 2024 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ShNM8R5Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KyjTkGwL"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1DB171A7;
	Thu,  4 Jul 2024 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109796; cv=none; b=scbQM3QNfShjWhvVzMab8lTiLjFle6BSFiDJilFPLVaX1ovsn626yIjg6Cr95pLHPfyt6bdQYxBSS6WfrS/N52+5k/JU4GTCw+EX9uTZrvnRo3PrU6cK2aT3OL6SRg5RWdl4xeYUxQAkE28mbFDR0VKNhOgVhcwyRW0Nn8+lzoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109796; c=relaxed/simple;
	bh=8sZtNYMkUhwzPskaBjQHvmB5XCd2PC1AYXhLCZoGuCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LtIUOVDAU/PT8Fhm1+mlTdPrGpPo/zu53hUlf/3CqF8fmg/D8ipt05Sj0j4N3pd16A9VEUPxhGkHEahqQonF+XsmGz53LuDQR5iY2iYrXfjoqqD/b4k4VMulhuNXnC1FfU1bwnOT85Gr7t1QWUYVBZtfHbvaLW1bSfPFhwZwJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ShNM8R5Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KyjTkGwL; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9BE521140295;
	Thu,  4 Jul 2024 12:16:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 04 Jul 2024 12:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1720109792; x=1720196192; bh=4P
	oMfw4m4WwOBfDTFXaUq2bsk0HbBjYfxItkN+GhB28=; b=ShNM8R5Y9jjNlhzx6Y
	fZCfzj6KpFOu8dmYH3LCPFXZkNdTervkMZP5tDb1jn6Z6FlCR5DrhJvEHssqDppv
	/I1uh+do96KrueLJFmbgI/lAI/wOWF6i7mxvZW75vT5aRs3V1sttIPJsFdNo8+Xa
	p7xwJZDDitubibt4O3HcyaM8KUHTvo2V7DiqXjMwCDEEr9NpbyTcLzSqZolsOxOY
	bMHeGMToSXepnOMTmuTJcENGvZdGn/hEiqZB83iND+dNPJrpC6CLM86pgMr//o5D
	u69l+2DFHtD9FWdnCUrn9BBRXhHkmZ1bVmS1O5CUir8c5dQOD00zzhy0EK2olOu7
	3IZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1720109792; x=1720196192; bh=4PoMfw4m4WwOB
	fDTFXaUq2bsk0HbBjYfxItkN+GhB28=; b=KyjTkGwL06mN6qoq0uZdssf8/OwHl
	7bWpQE+s4TmGwEM4uMZZbxxZFYxA5jxxPRpBnecYa33wp/DK7K1lFctOvkzYi7y3
	XYZo/hlbu4fa13VjNr9TyydbDDM2pCOpTX/6wbLwPJU2gYfH6tRkDSLxoDt/sOWf
	Ynn+5fP3gLq/Vhg334LQGnjzusf6v4jNkOCuTXFm93gnnXwu+Fi4bVe5bqrJQ4mc
	kAudQbrJ83HhLt3z7E09t/nX2Y0+jeCre2/j1lPM3xrzgaZZH2+hckLu7tyy2XfA
	hYfMRY5TZjnV6yoNDMr+u3wvtCSFhNf3MOFX2RXRzss19eTCSjAeDY0kQ==
X-ME-Sender: <xms:38qGZqiSML1gwo0pFvGhBrMd7EkEAR7jbnQ_g9aUixyZP_BK9B43gA>
    <xme:38qGZrB9R1xFSWatphGMNJUb0doqGTl5Y9Rw-3Rqd9V06QyBcMmOEwK0P7EihWnDC
    869oUp76ojylzJBDuo>
X-ME-Received: <xmr:38qGZiH8_Pqp1MxgxIKittALPaeaE-YkNddu8OewQLdxg0zRvN6O6Pai0hRiPY1klK6JyJapS3MxDMKq6bWeLrkTdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgfff
    fedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:38qGZjRsjHnHyZy6tjAPT2WvugtP5VRCPfW1-GJbRQHKTHK7UsUsvQ>
    <xmx:38qGZnyONP6UJAnmKbDKaz9CCym7k_MhDvHKvh-4YXFMtLe2vORZ7w>
    <xmx:38qGZh6vmtet1yLm_BDzqwzRTfYOuIQKgQMRlvp6Laxc0coHqOIPzQ>
    <xmx:38qGZkwVd6wBwrFCqdjAx0uOwmff8WWXGmMZNI1jlOCCbL7nxKiCNg>
    <xmx:4MqGZsq3C5WCP5RKR5gOx286WI96-MFUlcmW-julAYSDuO5n8xCx-lIS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jul 2024 12:16:31 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
Date: Thu,  4 Jul 2024 18:16:14 +0200
Message-ID: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series adds bindings and support to rcar-vin for R-Car V4M by the
means of adding a Gen4 family fallback compatible.

Previous versions of this series added V4M support like done for VIN
since the first Gen3 device, by the use of only a single SoC specific
compatible value. This was done as in Gen3 almost every new device
differed from the others and a family fallback was not very useful.

For the Gen4 devices with a video capture pipeline currently documented 
the VIN instances are very similar and a family fallback can be used.  
This however requires updating existing DTS files to add this new family 
fallback. This is done in a backward compatible way and the driver 
retains the compatible values.

See individual patches for changes since previous versions.

Niklas Söderlund (6):
  dt-bindings: media: renesas,vin: Add Gen4 family fallback
  arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
  arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
  media: rcar-vin: Add family compatible for R-Car Gen4 family
  dt-bindings: media: renesas,vin: Add binding for V4M
  arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP

 .../bindings/media/renesas,vin.yaml           |  4 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 96 ++++++++++++-------
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 48 ++++++----
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 48 ++++++----
 .../platform/renesas/rcar-vin/rcar-core.c     | 21 ++--
 5 files changed, 141 insertions(+), 76 deletions(-)

-- 
2.45.2


