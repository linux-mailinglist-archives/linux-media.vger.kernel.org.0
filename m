Return-Path: <linux-media+bounces-60214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPRNE7Tx92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:09:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5E4B7DAD
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0083011BF2
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF8C1A683D;
	Mon,  4 May 2026 01:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SsrgMZlw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tZonJYUc"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D884369A;
	Mon,  4 May 2026 01:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856936; cv=none; b=EQirr/+i9oid0bjCa3Nv3Wbv51A/Wab/cVr/J/tDxASq5/q7r9XWTK43Le3nVjhKMAIAif6SthQ1U5JMWDJa1qICCpeQqELCgYxx8y7kAukbY4S97Ci9BVB6oI+T0e+B8IGQjWmVwenLLgJB5GgL8NOUB0sNR2dUS04xnyKFrvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856936; c=relaxed/simple;
	bh=UvSHpFehI1pGAoUYNdSkS3lSl9nFLYnio1WbzUWmZ3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rGX1xBucJwzPNYz1SUSUwPMIq0+33DpniYpeKHajPvborV+j15mAeQYrYJ7vUMtBk5QdpJdzj/Uf4H1kDhc17nsaXHiGXcr5mjLBZkQZs3uz5n4Ri/LxAxOJlatmfQZBpeqs12qnfJsabEE29Z1UaMapr5+IYx3VZ272tUgSo7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SsrgMZlw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tZonJYUc; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5AED57A0073;
	Sun,  3 May 2026 21:08:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 03 May 2026 21:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1777856932; x=1777943332; bh=iM
	PLuIwy4A+1U/J9wS3STfpzh6LPZ4JWavQ4XHJJuYo=; b=SsrgMZlwkXepClW6j9
	nC4ckpPJI8TrAbmdWZXP79TXi5CEeyw45TAMJs7XA0yggPdLRNDVjtpUuNg9gaip
	/4PYVMGqx4NF46NRM+ZNURMbTPTV01Tcx0WT2wpzYsNeAVWUAueuxab1IEeS3ApR
	jna9zcApLjzmuydvp+6ggNC8dyfH2zNWU8Iiibul9grhEVkcctdBo1h1sxNh75Iv
	/lsMzaQ9q0BMGcbuobCR6NtqcxA10Fs+L3Eu+xTqmndC43xkJw/iYiNWYCtRXwxl
	uXRmbcYJrTnr2H77DeYvqe6FP3VIqqFfcE3edM7y2KKR3/4J73JtrpYejUuMw0pj
	+55A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1777856932; x=1777943332; bh=iMPLuIwy4A+1U/J9wS3STfpzh6LP
	Z4JWavQ4XHJJuYo=; b=tZonJYUcDskA/l8LIqI2B/ZYx/qQrKgAdXxPE1/whx6z
	fLhVJl9zQibcLHWyf5MXXFje0IHPHvuGIc4qbmicfYDgaEvr9XqGupjl08QCGUqc
	s9KHOP03Zvq7BV6SX0OtONvV0ml234j1BZ/qpoxnEutLz9SXzjE2uWPOJaDDAHP8
	f3vcZd2tiQ1Bs63rZIp8nDc0Oy/WBhYZohGRMOHdssmDCCOIXmAdiP490r5sfllW
	woj2EHEvwgykYZuBSsvlOF5HPW58GsNcORuJGo5k+G2LTpx5iRIuyzK102K+40L3
	RYAmTjbKMeDbsMweHfBlQw0zA3KSfG28isUl41cS2Q==
X-ME-Sender: <xms:o_H3aRMsxwBLbgyldjMNnWURwKh_evtbgfuIVlh2PuccUTWkTnJOgg>
    <xme:o_H3aUaMjHPvqFlHJqglcd3cB5EQ59aqRdaLSroWusNmRopbKMv2XllfpwahV0FeK
    TdLOSO8XPKw8jIVCWTf5QuUo0e_D3oTIuPhmCh2mFLiJJPGtHxc>
X-ME-Received: <xmr:o_H3aQ-abUZx3TjVeO-CasqX_h5p8FGhDJZ4AbszLD7hpYkcfV7Ez_ENIQqMinaj-AAW07hFdOanK1A0axTJw1PcwYByBO4EL2gC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrodhrvghnvghsrghssehiuggvrghs
    ohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgv
    shgrshdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonh
    gsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehi
    uggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgr
    shdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:o_H3aVT5s_S2jr41mXPG2Ug_IYw18uAoNjHZcHGU06AQIibwbZs5uw>
    <xmx:o_H3aafZuAeaPHjHQDO9RwCfIOhvPgzQQq1NvrjyNcQahQTzQebziA>
    <xmx:o_H3aXS3qQWlNCv2WsLo9IgO4kr7yHVVoQXgcl93t00BFhCG9MGy8A>
    <xmx:o_H3aWIsI_fLwCnCio7jqID0JiPq7600hKZbMRzupsT0CiwijC4hqw>
    <xmx:pPH3aa5kjvKLiLc2lL7XhWjDl1Ub9R8hGsmrvmvamL7xGTA3zSlMITL8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:08:51 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [v8 00/14] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Mon,  4 May 2026 03:05:42 +0200
Message-ID: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A1C5E4B7DAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60214-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]

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
description of the RPPX1 see patch 2/14, and for details about the R-Car
ISP see commit message in patch 3/14.

All functional blocks present on the RPPX1 are not yet added to the
driver, but most are.

Patch 1/14 adds two new pixel formats, one for parameters and one for 
statistics.

Patch 2/14 adds the foundation for the RPPX1 framework. It deals with
probing all function blocks making sure every blocks version register is
supported and setup a "passthru" pipeline that just debayer RAW images.

Patch 3/14 integrates the adds the R-Car ISP CORE DMA parts and
integrates with the RPPX1 framework added in patch 1/14.

Patches 4/14 to 14/14 extends the RPPX1 framework with the logic to drive
the different IPS modules.

The sum of the work pass v4l2-compliance. A test suite for the enabled
function blocks exists and pass.

This series depends on the ISP extensible statistics definitions 
out-of-tree patches.

Biggest change since v7 is that a new pixel format dedicated for the 
RPPX1 have been created by Jai Luthra and Jacopo Mondi have reworked the 
statistics buffer for v4l2-isp extensible statistics blocks. Huge 
thanks!

I have taken that work in, reviewed and reworked parts of it. The 
biggest changes is a rework of naming of blocks and variables, as we are 
now free from the RkISP1 format proper names can be used to make it 
easier to map data structures to the datasheet. I also added a new BLS 
statistics block as well as updated support for the BD and DB blocks, 
which where incomplete.

Biggest change since v6 is that v4l2-isp framework is now used to verify
the formats. There are also various small fixes here and there, see
individual patches for detailed change log.

Jai Luthra (2):
  media: Add RPP_X1_PARAMS and RPP_X1_STATS meta formats
  media: rppx1: lin: Add support for gamma sensor linearization

Niklas Söderlund (12):
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
  media: rppx1: db: Add support for debayering filters
  media: rppx1: bd: Add support for bilateral denoising

 MAINTAINERS                                   |    7 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/dreamchip/Kconfig      |    3 +
 drivers/media/platform/dreamchip/Makefile     |    6 +
 .../media/platform/dreamchip/rppx1/Kconfig    |   12 +
 .../media/platform/dreamchip/rppx1/Makefile   |   33 +
 .../platform/dreamchip/rppx1/rpp_module.c     |   40 +
 .../platform/dreamchip/rppx1/rpp_module.h     |  161 +++
 .../platform/dreamchip/rppx1/rpp_params.c     |  128 +++
 .../platform/dreamchip/rppx1/rpp_stats.c      |   73 ++
 .../media/platform/dreamchip/rppx1/rppx1.c    |  339 ++++++
 .../media/platform/dreamchip/rppx1/rppx1.h    |   99 ++
 .../platform/dreamchip/rppx1/rppx1_acq.c      |  147 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     |   62 +
 .../media/platform/dreamchip/rppx1/rppx1_bd.c |  171 +++
 .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |   80 ++
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  180 +++
 .../platform/dreamchip/rppx1/rppx1_cac.c      |   29 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     |  167 +++
 .../media/platform/dreamchip/rppx1/rppx1_db.c |  126 ++
 .../platform/dreamchip/rppx1/rppx1_dpcc.c     |   76 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      |  127 ++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c |   90 ++
 .../platform/dreamchip/rppx1/rppx1_hist.c     |  189 +++
 .../platform/dreamchip/rppx1/rppx1_hist256.c  |   46 +
 .../media/platform/dreamchip/rppx1/rppx1_is.c |   42 +
 .../platform/dreamchip/rppx1/rppx1_lin.c      |  113 ++
 .../platform/dreamchip/rppx1/rppx1_lsc.c      |  187 +++
 .../platform/dreamchip/rppx1/rppx1_ltm.c      |   48 +
 .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |   41 +
 .../platform/dreamchip/rppx1/rppx1_outif.c    |   45 +
 .../platform/dreamchip/rppx1/rppx1_outregs.c  |   75 ++
 .../platform/dreamchip/rppx1/rppx1_rmap.c     |   64 ++
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |   47 +
 .../platform/dreamchip/rppx1/rppx1_shrp.c     |   64 ++
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   |  164 +++
 .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |   26 +
 .../media/platform/renesas/rcar-isp/Kconfig   |    2 +
 .../media/platform/renesas/rcar-isp/Makefile  |    2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 1017 +++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    |  826 +++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |   48 +-
 .../platform/renesas/rcar-isp/risp-core.h     |  170 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/media/rppx1.h                         |   34 +
 .../uapi/linux/media/dreamchip/rppx1-config.h |  926 +++++++++++++++
 include/uapi/linux/videodev2.h                |    4 +
 48 files changed, 6332 insertions(+), 8 deletions(-)
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


