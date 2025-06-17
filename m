Return-Path: <linux-media+bounces-35050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E7ADC85E
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D2D43B7C45
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 10:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6540629B773;
	Tue, 17 Jun 2025 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GG3zBT2l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VOo8bJf7"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AEC2BF3C3;
	Tue, 17 Jun 2025 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156410; cv=none; b=nGOWWyB8r/sDhLMIW2IM4j1VppCXwgcFtCcC/JuBANeDfKAdSmyW4lR7Yuq3wH4Ik5PQGcINsuzBc0pax5SDP/21B0R4vdvpNweL+HezWlBVwUv4Adqc51DUi2jT8NOmgMxDWQXYrQ41D237JSCfwUDkFeckpfzom80BS+sTXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156410; c=relaxed/simple;
	bh=LbVPOEWd4hCjlyt0BouIHs6rZQgphb0IHZv5zqXXydY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mfvkENJSFeBir3kslJS+VvTzjv+WMPDon8DKng7KGENKhBllk3D2tsUOHiJedIJ5dMVSjqJD/aIj3f2vtFNEgLvwU63ss5eHqtrPuhGR/U6tszDA91qkfnP2rhrfW93TJwdoagaliKA6xbPsJhFAJCydeQ96YYiSevPMyYbnwRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GG3zBT2l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VOo8bJf7; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id ABCFF1140175;
	Tue, 17 Jun 2025 06:33:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 17 Jun 2025 06:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1750156406; x=1750242806; bh=TG
	cWU2/67lbqRxrNe+W59yM+aJvIEGfvLNS+JibI49I=; b=GG3zBT2lwkElmCoECs
	Edlyj8wtPaejfqnXy+aiVO0jnverkgAGW2TWHuVyhgXQIi1TecLnZ/s5YE70R0zW
	elJJbk1dYVRLWbYoxJRjwjiInrBwMu0WnCx9ljdhLp1LuPjAJDfjzlbzSdVwjTbC
	ugswfwrh45VJAy55C7LCB31Kcxbhy364CthS/b/QzU7dpVWc8GgDGspJuUtou57b
	Fn03WH2L1kbSemmtO/ZGjq57OweY80ZTr3BjnX2BidzhsD6ZSvwP3MQZ4G1euDye
	fErJfP7R+Twp7VticiyCR5dHhKcWjVHL715A6AH47YEDJRk4EI6HTwV0F5cVgcr7
	qA1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1750156406; x=1750242806; bh=TGcWU2/67lbqRxrNe+W59yM+aJvI
	EGfvLNS+JibI49I=; b=VOo8bJf7IMfw0d2moBFg5Ss0hovYwmiaaSxAsUTS63j8
	tfACjr1ct9YGK+GwYtxtH30ThKaMDgvcE6NQ3WyxNA4e54gkb0Xn18mRk6zwbEBp
	N15Z+UgsyeVSF2BBKIH5WhpKjnB9pO/j3edFxDkezw5wJciKVocATWaCqrCuR9ej
	7kQnE17HY/LZcmHbpEmlO2HVQtGSMSX8c73AHtlDYlfrNc6xJ341YQ3HNEypsnIm
	hdLHSMsiybYjRcJPgJJ5Ak+O5kVfHk1Ju2sCk2KrBXPlE3jO1SbEy2f2Hvupio2c
	uqFFjQz1oiGdvfs6gOMs9uLLch5miWnPncMeb8flaA==
X-ME-Sender: <xms:dkRRaFmAa-07wqXCM2Tgsl1bct8kd0y5QsEk165Y4CTce5Z0H2UnBQ>
    <xme:dkRRaA24F3R3547G0LrtdUmwswtk7olr8rPix-CzwDEk1YIkJ_P2F0Sj5QcsnlBpG
    TpnEDdMOY9FRJzvmp8>
X-ME-Received: <xmr:dkRRaLpj0aaz3rTbFrFcyAjXuzrM-N86o0rE79TdIJHM_DPuKBkmNau6tkrnyHj49TcmuyWwW4PpaABo1psVCuoC0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvledtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:dkRRaFn-G6cvbmgAHrTbhTEYxnIsQG1OFlJP3ElQPCJf9_8QbhSj9g>
    <xmx:dkRRaD0GvzELsrEtuDxYvcrWADb8-PokzSGQHcSSThfiLp35HQ-JuA>
    <xmx:dkRRaEsSE_XxfusNp0yIZmVgt0-lVlsuhvVrVJnHNdDW6Jp0BcjQ7g>
    <xmx:dkRRaHW9T9UYPHnt_a2kAQM6xL7eHRp-Md2WeZYz8QR4pKY2OWZHPQ>
    <xmx:dkRRaGxcGpIa-I0ptfku2U1gUKmdPWZs-qSIR1mChYsuD62Bbp0VLgen>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 06:33:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/7] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Tue, 17 Jun 2025 12:31:54 +0200
Message-ID: <20250617103201.1594152-1-niklas.soderlund+renesas@ragnatech.se>
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

This series adds support for two different devices that together enable 
ISP support on Renesas R-Car Gen4 ISP processing. The first driver added 
is for Dreamchip RPPX1 ISP, this device purely deals with image 
processing algorithms, statistics and image conversion; but have no DMA 
engines. The second driver is for the R-Car ISP CORE, this device 
deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space 
interface for the ISP.

The R-Car ISP driver uses the RPPX1 framework to drive the ISP and 
together the two devices provide a functional ISP. For detailed 
description of the RPPX1 see patch 1/7, and for details about the R-Car 
ISP see commit message in patch 7/7.

The RPPX1 ISP is similar to functionality and design to the Rk1ISP 
already supported upstream. For this reason this series reuses the pixel 
format for ISP parameters (RK1E) and statistics (RK1S) as the user-space 
ABI to configure the ISP. The primary difference to Rk1iSP is the over 
all pipeline design and the register layout out is different enough to 
make it impractical to bolt it on the existing drivers.

However on a functional block level the blocks amiable and their 
register layout mapped to the buffer formats are similar enough to make 
the reuse practical. Another difference is that RPPX1 operates at a 
hight bitdepth then Rk1ISP, but this is easily supported by scaling the 
values to/from the buffers.

All functional blocks present on the RPPX1 are not yet added to the 
driver. Hence not all configuration blocks of the Rk1E extensible format 
are supported, but most if not all can be added. Enough blocks are added 
so a libcamera pipeline reusing the Rk1ISP IPA can be supported and 
produce good images using the AWB and AE algorithms. A libcamera 
pipeline for testing will is available.

Patch 1/7 adds the foundation for the RPPX1 framework. It deals with 
probing all function blocks making sure every blocks version register is 
supported and setup a "passthru" pipeline that just debayer RAW images.

Patch 2/7 to 6/7 adds the function blocks needed to support AWB and AE.  
While finally patch 7/7 adds the R-Car ISP CORE DMA user of the 
framework.

The work depends on Jacopo's excellent VSPX work,

    [PATCH v13] media: vsp1: Add VSPX support

The sum of the work pass v4l2-compliance. A test suite for the enabled 
function blocks exists and pass. The work have also been tested with 
various libcamera utilities and compliance tests together with a IMX219 
and IMX462 sensor on R-Car V4H.

Niklas Söderlund (7):
  media: rppx1: Add framework to support Dreamchip RPPX1 ISP
  media: rppx1: Add support for AWB measurement parameters and
    statistics
  media: rppx1: Add support for AWB gain settings
  media: rppx1: Add support for Auto Exposure Measurement
  media: rppx1: Add support for Histogram Measurement
  media: rppx1: Add support for Black Level Subtraction
  media: rcar-isp: Add support for ISPCORE

 MAINTAINERS                                   |    6 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/dreamchip/Kconfig      |    3 +
 drivers/media/platform/dreamchip/Makefile     |    6 +
 .../media/platform/dreamchip/rppx1/Kconfig    |   11 +
 .../media/platform/dreamchip/rppx1/Makefile   |   33 +
 .../platform/dreamchip/rppx1/rpp_module.c     |   40 +
 .../platform/dreamchip/rppx1/rpp_module.h     |  157 +++
 .../platform/dreamchip/rppx1/rpp_params.c     |   56 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   30 +
 .../media/platform/dreamchip/rppx1/rppx1.c    |  337 ++++++
 .../media/platform/dreamchip/rppx1/rppx1.h    |   99 ++
 .../platform/dreamchip/rppx1/rppx1_acq.c      |  147 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     |   67 ++
 .../media/platform/dreamchip/rppx1/rppx1_bd.c |   52 +
 .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |   80 ++
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  175 +++
 .../platform/dreamchip/rppx1/rppx1_cac.c      |   29 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     |  106 ++
 .../media/platform/dreamchip/rppx1/rppx1_db.c |   44 +
 .../platform/dreamchip/rppx1/rppx1_dpcc.c     |   76 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      |  140 +++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c |   49 +
 .../platform/dreamchip/rppx1/rppx1_hist.c     |  249 ++++
 .../platform/dreamchip/rppx1/rppx1_hist256.c  |   46 +
 .../media/platform/dreamchip/rppx1/rppx1_is.c |   42 +
 .../platform/dreamchip/rppx1/rppx1_lin.c      |   60 +
 .../platform/dreamchip/rppx1/rppx1_lsc.c      |   68 ++
 .../platform/dreamchip/rppx1/rppx1_ltm.c      |   48 +
 .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |   41 +
 .../platform/dreamchip/rppx1/rppx1_outif.c    |   45 +
 .../platform/dreamchip/rppx1/rppx1_outregs.c  |   75 ++
 .../platform/dreamchip/rppx1/rppx1_rmap.c     |   64 +
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |   47 +
 .../platform/dreamchip/rppx1/rppx1_shrp.c     |   64 +
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   |  188 +++
 .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |   26 +
 .../media/platform/renesas/rcar-isp/Kconfig   |    1 +
 .../media/platform/renesas/rcar-isp/Makefile  |    2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 1053 +++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    |  790 +++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |   48 +-
 .../platform/renesas/rcar-isp/risp-core.h     |  163 +++
 include/media/rppx1.h                         |   33 +
 45 files changed, 4890 insertions(+), 8 deletions(-)
 create mode 100644 drivers/media/platform/dreamchip/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_params.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_stats.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_db.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_is.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core-io.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/risp-core.h
 create mode 100644 include/media/rppx1.h

-- 
2.49.0


