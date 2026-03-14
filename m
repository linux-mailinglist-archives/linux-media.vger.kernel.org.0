Return-Path: <linux-media+bounces-55803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNJCCPLctWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:10:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B855E28F326
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8ADC300D1D6
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E677386565;
	Sat, 14 Mar 2026 22:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bhTPvjEr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YpwmYKgn"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80DF40DFA1;
	Sat, 14 Mar 2026 22:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526253; cv=none; b=MAze6H9mZLBPYrobiwdNEnpXFdPD+O/Gnc1SiFtiku1vNsBgjdH7raUBsefnijrQj0yPDghtfv2fh0Z6zU6befhgnXj+0FkYulJi9iwEVthz9uM/gS2O2zsGKcqwqMsXsXiCSfg7LyQr0XFJ6fulIVDsLTi4fElZyyYugpMlw3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526253; c=relaxed/simple;
	bh=ThsWKrp1cdqG5UmAUL+r2UEqQjyw/j9jInMXBPFS5bY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qdgDN0+3lyijGzdiarBBqNKrZjHqOsbhEDL2hIckoj5ZpY40ebQwhHi9zMqoFbZQ9GsaUrpDIf566dcVac2zDLu0FeA56rSXWyRsvYvWZhdXK0bwY4Hnxck7pmjc1vIA/Hf1RJmMUqPKUgXgAEOwjd5tX0Gs/qf5IcV9Dxj7co4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bhTPvjEr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YpwmYKgn; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 20E39EC0AEA;
	Sat, 14 Mar 2026 18:10:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 14 Mar 2026 18:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1773526250; x=1773612650; bh=xv
	P7Bikx2coLQ1xLTWU/37O9E826V31EymGHhhLGz8c=; b=bhTPvjErqdW8mfExzL
	MqTfNnOZ9KOWmtl1SzQeeonD+WKpiCKiPv5qmMjOp/OQo6rbJ6fjkNgDA63CEkRs
	kqGF0i6cp1+ZLjHIt5F8y2QV0JXLpUa4vdeFAmcOQW4yVeec9P5c8ttnW5VAAort
	Unp3DjbfsfOuOCzmbtIhhQi/uK1gnFxL6rCjowz5kMvYJ9yWLUa3gKquDY/BsHbI
	vrD94s7VQFN2r/cY+u8RapfdN1+7KYGdy7sHWkYpsmKM6e0Zlu5m145WHsrGrjyV
	J/cYSdCoMY+NQSw4F2D+NIvamxB82YRqQall2YldqpRkjqtdP5qrPsUCwcXHUpbp
	JR4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773526250; x=1773612650; bh=xvP7Bikx2coLQ1xLTWU/37O9E826
	V31EymGHhhLGz8c=; b=YpwmYKgnHY+Inho+MOudUsfMRmlNkBsMoqwpeqJSYZVF
	+XMj5+Me0QxgMt6WpXySeUf4dwnGUCWdoVQ/zZkuD9BcqUZIuPTEWcj1CaZYHegJ
	XJyL1vHQdemaOd1quan87jOQINh3xmjZJ6GFQ6RrzTycIyuvZbW1h5KOhIXgegfI
	rMwVdEauSfoSe6+33+4rC6hnVX9Hi88o0QJEPw0nsaWDhgAcGdYUqP7wt/qyLM9F
	HrS0aLuqgoaY4eTiwLlQQIvrwlP4EpKBUgxQ3FDiBMnfHvYhuFR1mAyfWqXeJOi8
	db/kjKS5mZaKpQASQnqqGGSJhCs6u/TthpIb+gRt/g==
X-ME-Sender: <xms:6dy1af6w7gcFbs0tc2826b3d5UOL02FDOi-DQ91RhQIoebvn1EDJqw>
    <xme:6dy1aQ6OhSLOs2Mak617dBUhL_SWmPxXjQsqRAMnNQ2w_NbtYK72lN8fqI_5jBF-G
    RSBjpyYe7MDwl1OGHW6yN1R04KPRBdrk5a2vAuxPjJ-dYyQeW_VKA>
X-ME-Received: <xmr:6dy1aYpgKUxaTostexi6x78UgJ4tfAn3fkzdfubD0ZgG_mW7-XW3IO3a4dpPMjTBZHvl7WnRPWhsxQ1hLrH1S4eY705BwJ7PnKQC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtghomh
    dprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgt
    ohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsg
    horghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:6dy1aRP3RXi0K4LiYXcZhrXnUV7m2gTHE3D4rnYfi8icYw-difQkCw>
    <xmx:6dy1aQ0aZ9g4OSTpAWjsiOPuC1sOp8WxZxv2COVJ9uE0KUsmwVbGzw>
    <xmx:6dy1aQB71hzUFO2H_ZPRRNU6kIHC_ebD0mo244glQC5phgNu9zD9cw>
    <xmx:6dy1adKOVN9XPjTmVAZojgHk0jDIZYq_L2lnv32eIbkZtdko12NcDg>
    <xmx:6ty1adRu1Fn5q4aA-ovc5mVrSfJPaajJ3NSHZD9DFdjh0KzTPAFFtxa2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:10:48 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 00/12] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Sat, 14 Mar 2026 22:59:32 +0100
Message-ID: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55803-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B855E28F326
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Biggest change since v5 is that v4l2-isp framework is now used to verify 
the formats. There are also various small fixes here and there, see 
individual patches for detailed change log.

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
 .../media/platform/dreamchip/rppx1/Kconfig    |   12 +
 .../media/platform/dreamchip/rppx1/Makefile   |   33 +
 .../platform/dreamchip/rppx1/rpp_module.c     |   40 +
 .../platform/dreamchip/rppx1/rpp_module.h     |  158 +++
 .../platform/dreamchip/rppx1/rpp_params.c     |  118 ++
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
 .../platform/dreamchip/rppx1/rppx1_lsc.c      |  194 ++++
 .../platform/dreamchip/rppx1/rppx1_ltm.c      |   48 +
 .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |   41 +
 .../platform/dreamchip/rppx1/rppx1_outif.c    |   45 +
 .../platform/dreamchip/rppx1/rppx1_outregs.c  |   75 ++
 .../platform/dreamchip/rppx1/rppx1_rmap.c     |   64 ++
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |   47 +
 .../platform/dreamchip/rppx1/rppx1_shrp.c     |   64 ++
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   |  188 +++
 .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |   26 +
 .../media/platform/renesas/rcar-isp/Kconfig   |    2 +
 .../media/platform/renesas/rcar-isp/Makefile  |    2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 1016 +++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    |  826 ++++++++++++++
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
2.53.0


