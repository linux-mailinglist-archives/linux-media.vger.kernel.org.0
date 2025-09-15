Return-Path: <linux-media+bounces-42566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2797B582EF
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 096BD7AD1C4
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C112877F7;
	Mon, 15 Sep 2025 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cLLM5mAt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZO9t8Rge"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0D261B91;
	Mon, 15 Sep 2025 17:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956230; cv=none; b=s6cfrMZXmPBaH3gZdMxiFeAMHA6yb8sQsx0eGniYqk/aQb3ecZI5fRM3MmZ/T5NHZ1vSW2s4RNFO6KJtRFSwKB35PuXvHAqdScMrY2xDg/KfIFC+Nu+CRDaNJzh9P2j/nFDa00t+U9xyJwePoxxI1dNmIu8FGKlb6G5TSr3M/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956230; c=relaxed/simple;
	bh=Xcd8mkoke1PVc0kSxJqNK6HgqRhXX6+2c1GRg7aMeJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hlwBWDHvZh9vTn85OzUszOYNXqkUYeM+5RdhsY1WAirUubu4qipY4s/aebSCeUpohTC0R/gF53RgG+rRRqIUogyepb5WfYcxx6AEsIo9Wsf0Os2rFEVdDPySVWKEamz8DWgU8oGXtnDb1dCd5C0XWhj05cISBqRYwXnGAaS/qY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cLLM5mAt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZO9t8Rge; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D1EF07A017E;
	Mon, 15 Sep 2025 13:10:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 15 Sep 2025 13:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757956224; x=1758042624; bh=0l
	L3So/stgVGMNw6jx5A9K3nOGAawQRCu/hP06Lb/X0=; b=cLLM5mAtdFizLChk83
	2Av0Zwm9OoR80YFS/MXDv4SaGTHzYQBzebhizfVuD07Qz9CTmwKHBvdKOc8+wn3n
	Pj8+Uk8HBfYWYBWftYBzyp1IJDZXvm3xzapnqucFsryXSFZ8XyaJcBNHymQR1N9B
	FCIAH4+rz7FfDEYfI+kZNj4/cShuCGxoStmSiX3HCTbSIvGPwR1Lp6PonDbbni1M
	RxwEg62//sRboIf0AYHkNn9dip76L0hHbUQp735a7o3/SpJKl2UcPpw7keVJXlD+
	LOooIotXfX3MN1A88TWF8Ry/aV+4z3oJPtzU8LAl8VuTu9jGDtP1l1fEeV3jOYpd
	5iHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757956224; x=1758042624; bh=0lL3So/stgVGMNw6jx5A9K3nOGAa
	wQRCu/hP06Lb/X0=; b=ZO9t8RgeiyJBbOr71c2D2KKV9R7+fDjIJO3Zm+NyLi/3
	7fAUblsLyFjRewFa2vz6V2EM0URhQZlDYZgDzXd2esS7iR9IdFiPTjwXHnhF9aZB
	eNj1nSqXhDfmIIWWJ7IW/59HBold84dthaHovMKQRRVBzeaA594ihZ+mnJruAvoR
	cpwxvj1gz2mR7mDG4WRooTf6sbG9+T8e8t/z9ik7vRCRKMNrl+SfdHV8v88VSFdU
	uFfsRF9YiYGL2kZ9hT4La7CXANr23JMrDzn7CYDxWFT00M8DJgBDgkICJsdm6dTn
	eTJG4WL6ql8mHNMMQXKwIQcpavVtX4puFtSSvUBILw==
X-ME-Sender: <xms:gEjIaFpCjVRxtDLpSS4KYILgM53q_mqpUS2ndNtRJF35dn7V-oBe0Q>
    <xme:gEjIaPR3lJTsDWCc50_H5pKfEMCg3l1C-M1gvPC4a4m9zfL1RGz_qOrty7zVihb4P
    DltZjvCAEVPoLZJ2SA>
X-ME-Received: <xmr:gEjIaP1FVWKP6CokBK4QehZs7gpSuz1xL9xWx30d2nnaEmU3vwGVX-n1BQYLXd5xPeekS_QJ00gFemSHQGxFoJ8BDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtph
    htthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgt
    ohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhr
    vghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:gEjIaLDY-Pn2oFRbzQ-oJLG5IFzP5zZwAH8Ma_ttRf1o8zE5WiOIpQ>
    <xmx:gEjIaLiAy9iaA7q3rZD9YCrCHRrJ9QSeiqfsQm0_KcKoSl3XC1lq5Q>
    <xmx:gEjIaNOsKYZFN1V7gNnmLBYq7SBn_AAM-TX58iu5DuoLC8_Wtd_mPA>
    <xmx:gEjIaL8lQL5T3a_U2TUc4_UDnur_LWlLHnNxcFls8h9DpR5B17RTqQ>
    <xmx:gEjIaBNkZYD70lPuhFvivwCundqzIO0lX5JKzbZ1aNdbC2ojlfsiOcL0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:23 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 00/12] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Mon, 15 Sep 2025 19:07:31 +0200
Message-ID: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
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

A libcamera pipeline reusing the Rk1ISP IPA have been posted [1] and it 
can exercise all function block enabled by this series. It produce good 
images using all algorithms available.

Patch 1/12 adds the foundation for the RPPX1 framework. It deals with
probing all function blocks making sure every blocks version register is
supported and setup a "passthru" pipeline that just debayer RAW images.

Patch 2/12 integrates the adds the R-Car ISP CORE DMA parts and 
integrates with the RPPX1 framework added in patch 1/12.

Patches 3/12 to 12/12 extends the RPPX1 framewok with the logic to drive 
the different IPS modules.

The sum of the work pass v4l2-compliance. A test suite for the enabled
function blocks exists and pass. The work have also been tested with
various libcamera utilities and compliance tests together with a IMX219
and IMX462 sensor on R-Car V4H.

Biggest change from v1 is that more function blocks have been enabled, 
and some small bugs found and fixed. See individual patches for 
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
 .../media/platform/dreamchip/rppx1/rppx1.c    |  337 ++++++
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
 .../media/platform/renesas/rcar-isp/core.c    |  790 +++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |   48 +-
 .../platform/renesas/rcar-isp/risp-core.h     |  163 +++
 include/media/rppx1.h                         |   33 +
 45 files changed, 5418 insertions(+), 8 deletions(-)
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
2.51.0


