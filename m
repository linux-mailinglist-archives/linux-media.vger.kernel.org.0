Return-Path: <linux-media+bounces-46155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 317FEC298ED
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 23:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0F8D188B8AB
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 22:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD741C831A;
	Sun,  2 Nov 2025 22:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Avur0pj/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xOZ9Oabw"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F818C1F;
	Sun,  2 Nov 2025 22:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124228; cv=none; b=Gi2QOEC1DlonEPYBL3hxISyjMGUORvO4ssF1QvlE7oJjabfZByEBeIFPXp3oqg0BQiNzxj7Iy44mruzjZfKRD6X+qDPmm5LRD5T2KSpLSQZn9fyhW4PWnA8CKCl3XQX/JU3MMbN9WZwdoXFJwG2/nE1U6Ie2R2+kUcwq2Paa2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124228; c=relaxed/simple;
	bh=bVp4hpRRJUMvY9GNH1Tl3vHHgTOS8kTXOA6BLZ5gV88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GY1YMTSj4fhFHJNv3IRaM35ZfuSChBQlL5Wi/80YsEV6IxxfJIp/5xAZl6ZtZh4rJb1LvcyaT4bJnEnmSzvNX/6OkV6/6Go4UyrmBJWZDUo4ki32rq7moRxABFGMy092nH1+TC73kX5peDXoBLBHI0EXgTwNm4uK0SkLXuttAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Avur0pj/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xOZ9Oabw; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 05577EC00C2;
	Sun,  2 Nov 2025 17:57:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 02 Nov 2025 17:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1762124224; x=1762210624; bh=Ik
	8oiB6HbbcPxrrKuLp0vxnLFuKdOLEGwji/bKz/QLc=; b=Avur0pj/D0BBg+qYhZ
	ZeszPOhoSue4H+UQKuYvEWwQ+dQ7NyNZ+vKmkz5zNnQlI5+lT10+pJA1VdOgjUw1
	uCwRtiDd6aQ2HGQL0DZicvE9x7mQZC0vKkPYWdoafjrLT8SBV9VQBkDyyEdT8qea
	DGuzAyi5z1tIZ9LxW4QBMZWnQSAVHBxSKjUpMCxhYZAhG8mrNe4qsAN9qMf8rbeH
	Lx/zeEfnhk9E29ZN2qBCPtqKbg0kCfnPRuDWY+Sdb8dr3+3hkiJ+gtPSzCG/mf4J
	ziPnCQnMRdq+GFlG0EWW/LUsfPQoqDK9dbLonH+AfXGhpKZK9w7qqf8ACmI/EtdD
	i8yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762124224; x=1762210624; bh=Ik8oiB6HbbcPxrrKuLp0vxnLFuKd
	OLEGwji/bKz/QLc=; b=xOZ9OabwF+ZR48RsUO9KvopJepoOjiTJLsjSzCCqX+oe
	ZwVkqPJ58Cd6rHBk7t0ddzlrwC6sPAC1SD3aiOMsnW8SLS/SPdCWaWcZFYQBoqtY
	3vyhYVsJs9c4ogn3Dk69nK5dFJ0IdtuiQk/wdkSvCx0j51uDgb+baYOncFuuIFUM
	/Yikb9SG+j5Kf+Krfr6fmxwGJhxHKzNFtIaxl4QQ+s2rGXOlQ93wOvcLeN/sd5J1
	+/IkZSGmZT71YVDeLyhf89SbwkGVm5bTBIB+r3ThvX3qfoqsby/3bxPOhYgTsf64
	Bwo3Ud6iMWFyDtoiLYVs49sF2XSrXa6url9Q3zb2kQ==
X-ME-Sender: <xms:v-EHaV69kFbomvpJqFRxo8YMayKQhzigvnfJcxhTMR-BwqpSqqCg8Q>
    <xme:v-EHac90uE5CwRONn5TwTtAyg5tLc8Uuz24xcsWofw1tSGBfnYgcyfTNmLq1Dv_Vy
    Up9_fS0wvajh4XGr67r7QHWvej87VMtcE3E1wse_j0XC4Fwo-LMHg>
X-ME-Received: <xmr:v-EHacURKuJgCXhiWcZMN1aQ0kyeJ_hvMybqGjukvmcVpxy7SvyF28pQtif8AppI5PzUjMzoLtCD9XpYo94_uXFF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtg
    hpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdo
    rhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:v-EHafqJ5d0FAOEFzcG9A-Zto890DZZBBbc41Q5iyVTciWXQkt1ScQ>
    <xmx:v-EHaWkZt0ZrXdCROMgz73M7afQuiFD6IqhKQCl1EpivzizJQdfO8w>
    <xmx:v-EHaX1Ff4we0zB54Pj-6sH32zPjelrEjI5q8C6dl4wdXuMBqBZT0Q>
    <xmx:v-EHabRyGchGjFOAM28w03MJRHvYGkzBulLWsII7sICF5GwJ7kalgA>
    <xmx:v-EHaWVBsp-2H6mhIDYrOt8EkJoflVGNnkhruU_CnpwW8-6ceKV48Kcx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:03 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 00/12] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Sun,  2 Nov 2025 23:56:30 +0100
Message-ID: <20251102225642.3125325-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
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
description of the RPPX1 see patch 1/12, and for details about the R-Car
ISP see commit message in patch 2/12.

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
driver, but most are. Hence not all configuration blocks of the Rk1E
extensible format are supported, but most if not all can be added.

A libcamera pipeline reusing the Rk1ISP IPA have been posted and it can 
exercise all function block enabled by this series. It produce good
images using all algorithms available.

Patch 1/12 adds the foundation for the RPPX1 framework. It deals with
probing all function blocks making sure every blocks version register is
supported and setup a "passthru" pipeline that just debayer RAW images.

Patch 2/12 integrates the adds the R-Car ISP CORE DMA parts and
integrates with the RPPX1 framework added in patch 1/12.

Patches 3/12 to 12/12 extends the RPPX1 framework with the logic to drive
the different IPS modules.

The sum of the work pass v4l2-compliance. A test suite for the enabled
function blocks exists and pass. The work have also been tested with
various libcamera utilities and compliance tests together with a IMX219
and IMX462 sensor on R-Car V4H.

Biggest change from v2 is big improvements when starting and stopping 
streaming to keep ISP and VSPX in sync. See individual patches for
changelog.

Niklas Söderlund (12):
  media: rppx1: Add framework to support Dreamchip RPPX1 ISP
  media: rcar-isp: Add support for ISPCORE
  media: rppx1: Add support for AWB measurement parameters and
    statistics
  media: rppx1: Add support for AWB gain settings
  media: rppx1: Add support for Auto Exposure Measurement
  media: rppx1: Add support for Histogram Measurement
  media: rppx1: Add support for Black Level Subtraction
  media: rppx1: Add support for Color Correction Matrix
  media: rppx1: Add support for Lens Shade Correction
  media: rppx1: Add support for Gamma Correction
  media: rppx1: Add support for Bayer Demosaicing
  media: rppx1: Add support for Bilateral Denoising

 MAINTAINERS                                   |    6 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/dreamchip/Kconfig      |    3 +
 drivers/media/platform/dreamchip/Makefile     |    6 +
 .../media/platform/dreamchip/rppx1/Kconfig    |   11 +
 .../media/platform/dreamchip/rppx1/Makefile   |   33 +
 .../platform/dreamchip/rppx1/rpp_module.c     |   40 +
 .../platform/dreamchip/rppx1/rpp_module.h     |  157 +++
 .../platform/dreamchip/rppx1/rpp_params.c     |   80 ++
 .../platform/dreamchip/rppx1/rpp_stats.c      |   30 +
 .../media/platform/dreamchip/rppx1/rppx1.c    |  338 ++++++
 .../media/platform/dreamchip/rppx1/rppx1.h    |   99 ++
 .../platform/dreamchip/rppx1/rppx1_acq.c      |  147 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     |   67 ++
 .../media/platform/dreamchip/rppx1/rppx1_bd.c |  210 ++++
 .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |   80 ++
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  175 +++
 .../platform/dreamchip/rppx1/rppx1_cac.c      |   29 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     |  180 +++
 .../media/platform/dreamchip/rppx1/rppx1_db.c |  156 +++
 .../platform/dreamchip/rppx1/rppx1_dpcc.c     |   76 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      |  140 +++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c |   83 ++
 .../platform/dreamchip/rppx1/rppx1_hist.c     |  249 ++++
 .../platform/dreamchip/rppx1/rppx1_hist256.c  |   46 +
 .../media/platform/dreamchip/rppx1/rppx1_is.c |   42 +
 .../platform/dreamchip/rppx1/rppx1_lin.c      |   60 +
 .../platform/dreamchip/rppx1/rppx1_lsc.c      |  194 +++
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
 .../media/platform/renesas/rcar-isp/core.c    |  826 +++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |   48 +-
 .../platform/renesas/rcar-isp/risp-core.h     |  170 +++
 include/media/rppx1.h                         |   33 +
 45 files changed, 5462 insertions(+), 8 deletions(-)
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
2.51.1


