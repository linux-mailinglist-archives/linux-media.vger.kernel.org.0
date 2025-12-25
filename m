Return-Path: <linux-media+bounces-49541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6FCDDF68
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 829CD3006589
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E60117C220;
	Thu, 25 Dec 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="e/ieCVg6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PFh0Kn+i"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910FD17BED0;
	Thu, 25 Dec 2025 17:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682690; cv=none; b=dqBNM090F2+UM87rFjqQ5cT7/pawfDVJWFWldzDlFgQ4Ln0BJld7tLIBlRy1FOTft9XilwhF0awQXkLBRfmq4cswnqECdkm1Y2YRT/gDbCHlHn416CwQgw6HLfTYJQIIMEmFcBcb7moPcVoSpLqeJnBXd6J09fLH+Uvu+SG7e+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682690; c=relaxed/simple;
	bh=4Gk4YMOAOJ/dg3vvNsr2Jk5DVB+28GfRVtWvhBacqpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q+TrjIgzTwgpDi89nbub8KWtxBPFut6EsPbHqpNkcOdj8UCrmdjExXBZUpAnMkNPSp0H70TnLXGD7kR6Ji6hs6pnK9iCDpxPe1rOIDsCejMvbCsKmV8roOVvd9thmp+S5id3JyzOVAAV41MjQv6Oh/d49NWLto2ypPaldGTe8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=e/ieCVg6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PFh0Kn+i; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6D12F140003A;
	Thu, 25 Dec 2025 12:11:26 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 25 Dec 2025 12:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1766682686; x=1766769086; bh=O3
	jnlQ41PcWBZfe8QcvM4NqPfmJpDwXFXlvxno9RFdY=; b=e/ieCVg6ZPMGLFkAiT
	k62wPvnR7l5UpE7bjlLgW3QzNVPYWjPl3KTzipOulPKULo31xqU0fljtSE6F3xrK
	AupkUUrBDKKfZcbYmJRrg5hqQsZdj6lFJBbJkO7O5xEVAfDC47aaI86ngAa/+ujD
	OgrwA6pd6Mv1uQSVrEUdT+zRHLKLU/LMWN6lgE35AOtGBypX15Hvuuoea6dyTTYL
	bTsn3U+QRltRGgCuFqgIJIFZV82CzgkxC2MRDY2bwlkz2k2dagl/2/GMVoq7yhPg
	jebvaDmN6AkV9547GTmCQLMzHKifRrPR1DHAupKLxx3wjw1GfBIPxK7ZtjLCgFsS
	LUlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1766682686; x=1766769086; bh=O3jnlQ41PcWBZfe8QcvM4NqPfmJp
	DwXFXlvxno9RFdY=; b=PFh0Kn+iZjn0uCW4V0FtpfY20eXdND40sSEmzjjvZBen
	bf3nc9l5oJ+hzQQsXl6dvXFzLvaqTnSCRnCW/0fLyH4/DMi/qeNSbHlla6w2xzJ2
	ohDJswAJ7nxwSDcAXSEZ6se8tKl0gK+TV9lYhO7BAlkJWWzFvoVxOHPeiews3YWB
	lKQ01XFJbH3a6HFUsJUGWFMZQLZbUWXBCSy9qD2GSZwRfONRq9CZO8ez3JQb0iBT
	9ojuBPMyYbDPVTdYrxHolfJZc4fvUAnQ2kdvUczK3tVOCpH4T75RerInOARpU2R7
	JzYcVgDRqskrewXjN75o6qqe0u/0gNAj3MxMX9nAxQ==
X-ME-Sender: <xms:PXBNaVDm5OCOFf8n_tGCf7GMDYeW8dPpCLZLUkBj00oztm9EkJGz9w>
    <xme:PXBNafjt2foyBL1NEI1JY9pRo_qHOoYJdR5dINoH9LXvVbDNgq1nb8PN24FKBp7Ns
    6B9hFw6eJZ6_Plvvfbpes6GrO_EwlZkZIvRkc1CmO68MDwc2DBxTWg>
X-ME-Received: <xmr:PXBNaSxz-o0rJmednJI75x0PUAlmFDmoGiIDbypXiPPm38FTACDgh8Su2O9OOY1o2tJFfABoEbdUOojNGkBpm4gb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtohhmpd
    hrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsoh
    grrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:PXBNaQ1yYP7OUdhnHUgiLT8zI_DG2X8XmL3nWvIUt2YHLQiAPbXbOw>
    <xmx:PXBNaX8SoubgOhC7-zm4VWKnf-b3m3XdX5Ud5iL0l60uYZ_k6ZGR5Q>
    <xmx:PXBNaYqvQAzAU0Zc3yFzZhtXRG1UpybF0Fbqzi8lx9lg1XpgUzuLlw>
    <xmx:PXBNaZTp-FWwIqB2WFZYIslmcEMk9cdT5azGo8SHDKmMTWw55RREiA>
    <xmx:PnBNaeRstGyWCgoUb0QfN7pKddrdUJs89eIx50bnXz3N7dDXoq4bwBrc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:25 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 00/12] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Thu, 25 Dec 2025 18:10:42 +0100
Message-ID: <20251225171054.1370856-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
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
 .../platform/dreamchip/rppx1/rpp_module.h     |  158 +++
 .../platform/dreamchip/rppx1/rpp_params.c     |   82 ++
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
 .../media/platform/renesas/rcar-isp/Kconfig   |    2 +
 .../media/platform/renesas/rcar-isp/Makefile  |    2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 1053 +++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    |  826 +++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |   48 +-
 .../platform/renesas/rcar-isp/risp-core.h     |  170 +++
 include/media/rppx1.h                         |   33 +
 45 files changed, 5466 insertions(+), 8 deletions(-)
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
2.52.0


