Return-Path: <linux-media+bounces-61823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO1XIyfeCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:14:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3EB55DCE0
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B1B83014298
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2650137D13E;
	Sat, 16 May 2026 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LYW4Gb7l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KWnGKtb4"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A732F12C5;
	Sat, 16 May 2026 21:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966046; cv=none; b=Q3tyXO6DrKxZgVYzujHbYwmGY+Zgi+f6uBWtgFKyEnRwX4AJWW5qw0oVBOpzfCgpHyQ9Cog1+pAP6GL8XXq6+rkPIFaUkfycmmn4eA1cjNt82xAWo5tm5WzMCsltK/jBW4Zvomm9XP7AoA7tVU1a7sx6K4TbI6+NQslyRsrO2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966046; c=relaxed/simple;
	bh=DQpsHhXISDr62BkS2F/Tyu4ElFVGMzfsG8QpOKEzOXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tmvZGvxETrs9Efb0oqIBv45TTCAwmmEDyW3e6gveSXy4jzcZcvwEIC8Dyaml0HaeX/U+iku0D/PFYv+l8k5bFVTooG6GvqcZbh1xnTBY3Nkq1BWevXUrUZ08PsKGApz/NqGO/IoM/l6rn44/ZR+rcGrsyhy2xtSo0yqFB0QwAVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LYW4Gb7l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KWnGKtb4; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 4A547EC0094;
	Sat, 16 May 2026 17:14:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 16 May 2026 17:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1778966044; x=1779052444; bh=0h
	Xcg3I8ZSfTMmZvI8GdX+9Hm4134ayfHscAnwEu18A=; b=LYW4Gb7ljqgTEN6OjO
	HootlEoMSDeRkjD2WlRD/koO4CCrkKvhxmw4Bd2wVsekYqsUWWw48ly+b+4VZt9U
	TYjgF/vp6jeGwPe4ppT6aEkCtlD7X54ZNfZVSEDGbqpzdhq2xNGW8kqscR9vQOl0
	8ZyamfAsdmS/wqkM9RxLug0TdSa47jggA9wDRh9ke9cMcaBiIR905Cg34eRljj/x
	MQiDzhpUEVdXj/S1k83MSb6CTMIBkTbsMvAbB13O4sAIv+aNahOU1S4l6tdFBwdo
	aQCPvQnNoFpC6kHC6XMmcDCVdDIccEc558GBwEopEa5j92UBjTISaryUn1kjGhuO
	aAwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1778966044; x=1779052444; bh=0hXcg3I8ZSfTMmZvI8GdX+9Hm413
	4ayfHscAnwEu18A=; b=KWnGKtb4kK6ljQ/KUYIB7R0EdxF0ytJ1Z1XC5ONISIYr
	XvsEu3UVhJtPkrBN0c5JA/50R+Lgybc6YLAdvbeOGbq/1EuwHhAZzipf23CsapJ3
	hJWYUtZf4qTVb7JUOQhZdWqgpm7CQo1ZfKXOo/nyHFON2cu+Y3ReZFHz5yHvzpNj
	RxzNqAOulnIs2L/6y88Y93xLwTzqH1zYszTt8TyUhY7So9myU0npXABvBoEzpvTB
	Ei34i6lGrXsxvxD16aBZT78jzlZdFL5ZF2VLwqyXrzAPjMPBVmqH6vf0FYb9+ac6
	3xgn5Md9XAGoTL6qEWfgEm8EZLEn4V2+KWiiMrNYbA==
X-ME-Sender: <xms:HN4Iarlo3KWttHXL6YDEVwkPL4VmmtHCs_yuCXPRYJtn2vB_uh9sNg>
    <xme:HN4IavSCHK8ZUDCuULK00xtrHdCTKyYiY1VlV6MBv3qZGZCbsdez0eBH8VM7QDcqg
    yIaQUwYINxpuwxvTWaRKd9fttMBPd5pn27py-wIskooghGQ9PfojZk0>
X-ME-Received: <xmr:HN4IaiX2wUaaDuPdmjvhxkRV4c2iO-_oxhIH5PhVOm1vdkxK16U_tu4z4lk8TwR8esLt43NQ9qHsQougUlqdMwSB3GnxFOZuE0m4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefhgefhveeghfetudeh
    fffhjeeileehkedvveffuddtleegudegjeeufeefvefftdenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnh
    gspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrtgho
    phhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrg
    hirdhluhhthhhrrgdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhr
    tghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhunh
    hinhhorhhirdhmohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtohhmpdhrtghpthht
    oheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:HN4IarLyotv8ebjByG4QmsQLfZ88Rnfl_j1vWonU1D-FNmSHOA1mUw>
    <xmx:HN4Iaq16K3bzw_tkPer_4pa3ci7Ir8ta-OBvOr_MtFQvjQH3kgC4ow>
    <xmx:HN4IagKrq67FJ9O9zr7fwBfO5BkaB8kDsEBj5DdQBarVxha4HqvhHg>
    <xmx:HN4IathzsVh8a_INa2LGbDH6Bc3TzZFo0X1K6q-48IFrqVo_zmbMHg>
    <xmx:HN4Iahxh2LrxP4JKjMd7usSyQJm0QXPgO9G-gvGJPAkABkJLZ_xAVxzS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:03 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v9 00/13] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Sat, 16 May 2026 23:13:07 +0200
Message-ID: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2C3EB55DCE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-61823-lists,linux-media=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

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
description of the RPPX1 see patch 3/13, and for details about the R-Car
ISP see commit message in patch 4/13.

All functional blocks present on the RPPX1 are not yet added to the
driver, but most are.

Patch 1/13 adds two new pixel formats, one for parameters and one for 
statistics. While patch 2/13 adds the scaffolding for the uAPI, each 
module will add the structures needed to this file in a backward 
compatible way.

Patch 3/13 adds the foundation for the RPPX1 framework. It deals with
probing all function blocks making sure every blocks version register is
supported and setup a "passthru" pipeline that just debayer RAW images.

Patch 4/13 integrates the adds the R-Car ISP CORE DMA parts and
integrates with the RPPX1 framework added in patch 3/13.

Patches 5/13 to 13/13 extends the RPPX1 framework with the logic to drive
the different IPS modules.

The sum of the work pass v4l2-compliance. A test suite for the enabled
function blocks exists and pass. I have also used Jacopo's and Jai's 
libcamera pipeline for the R-Car together with the updated header file to 
verify libcamera operation.

This series depends on the ISP extensible statistics definitions 
out-of-tree patches [1].

Biggest change since v7 is that a new pixel format dedicated for the 
RPPX1 have been created by Jai Luthra and Jacopo Mondi have reworked the 
statistics buffer for v4l2-isp extensible statistics blocks. Huge 
thanks!

I have taken that work in, reviewed and reworked parts of it. The 
biggest changes is a rework of naming of blocks and variables, as we are 
now free from the RkISP1 format proper names can be used to make it 
easier to map data structures to the datasheet.

1.  https://lore.kernel.org/all/20260505-extensible-stats-v1-6-e16f326b8dad@ideasonboard.com/

Jai Luthra (3):
  media: Add RPP_X1_PARAMS and RPP_X1_STATS meta formats
  media: uapi: Add extensible param and stats blocks for RPPX1
  media: rppx1: lin: Add support for gamma sensor linearization

Niklas Söderlund (10):
  media: rppx1: Add framework to support Dreamchip RPPX1 ISP
  media: rcar-isp: Add support for ISPCORE
  media: rppx1: wbmeas: Add support for white balance measurement
  media: rppx1: awbg: Add support for white balance gain settings
  media: rppx1: exm: Add support for exposure measurement
  media: rppx1: hist: Add support histogram measurement
  media: rppx1: bls: Add support for black level compensation
  media: rppx1: ccor: Add support for color correction matrix
  media: rppx1: lsc: Add support for lens shade correction
  media: rppx1: ga: Add support for gamma out correction

 .../userspace-api/media/v4l/metafmt-rppx1.rst |   99 ++
 MAINTAINERS                                   |   10 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/dreamchip/Kconfig      |    3 +
 drivers/media/platform/dreamchip/Makefile     |    6 +
 .../media/platform/dreamchip/rppx1/Kconfig    |   12 +
 .../media/platform/dreamchip/rppx1/Makefile   |   33 +
 .../platform/dreamchip/rppx1/rpp_module.c     |   39 +
 .../platform/dreamchip/rppx1/rpp_module.h     |  119 ++
 .../platform/dreamchip/rppx1/rpp_params.c     |  115 ++
 .../platform/dreamchip/rppx1/rpp_stats.c      |   66 ++
 .../media/platform/dreamchip/rppx1/rppx1.c    |  381 +++++++
 .../media/platform/dreamchip/rppx1/rppx1.h    |  105 ++
 .../platform/dreamchip/rppx1/rppx1_acq.c      |  148 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     |   63 ++
 .../media/platform/dreamchip/rppx1/rppx1_bd.c |   53 +
 .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |   81 ++
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  157 +++
 .../platform/dreamchip/rppx1/rppx1_cac.c      |   30 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     |  166 +++
 .../media/platform/dreamchip/rppx1/rppx1_db.c |   45 +
 .../platform/dreamchip/rppx1/rppx1_dpcc.c     |   77 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      |  128 +++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c |   91 ++
 .../platform/dreamchip/rppx1/rppx1_hist.c     |  190 ++++
 .../platform/dreamchip/rppx1/rppx1_hist256.c  |   47 +
 .../media/platform/dreamchip/rppx1/rppx1_is.c |   43 +
 .../platform/dreamchip/rppx1/rppx1_lin.c      |  113 ++
 .../platform/dreamchip/rppx1/rppx1_lsc.c      |  188 ++++
 .../platform/dreamchip/rppx1/rppx1_ltm.c      |   49 +
 .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |   42 +
 .../platform/dreamchip/rppx1/rppx1_outif.c    |   46 +
 .../platform/dreamchip/rppx1/rppx1_outregs.c  |   76 ++
 .../platform/dreamchip/rppx1/rppx1_rmap.c     |   63 ++
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |   47 +
 .../platform/dreamchip/rppx1/rppx1_shrp.c     |   65 ++
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   |  165 +++
 .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |   27 +
 .../media/platform/renesas/rcar-isp/Kconfig   |    2 +
 .../media/platform/renesas/rcar-isp/Makefile  |    2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 1000 +++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    |  890 +++++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |   48 +-
 .../platform/renesas/rcar-isp/risp-core.h     |  176 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/media/rppx1.h                         |   36 +
 .../uapi/linux/media/dreamchip/rppx1-config.h |  711 ++++++++++++
 include/uapi/linux/videodev2.h                |    4 +
 49 files changed, 6053 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
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
 create mode 100644 include/uapi/linux/media/dreamchip/rppx1-config.h

-- 
2.54.0


