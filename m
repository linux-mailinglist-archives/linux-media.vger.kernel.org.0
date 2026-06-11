Return-Path: <linux-media+bounces-64617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fK2gCq0dK2qd2wMAu9opvQ
	(envelope-from <linux-media+bounces-64617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:42:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6E66753E1
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:42:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=tFWrFJH0;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="a/7ffHgS";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64617-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64617-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14612300D563
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D1547F2F8;
	Thu, 11 Jun 2026 20:42:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDD336F421;
	Thu, 11 Jun 2026 20:42:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210529; cv=none; b=CMaq4rZVI9ThGbN+ALgMXOkEAL9NtbBJcALpu4WuaX6kich7kQS+bUuKrpMRQ8upjxa2W+TOi8gjini3w/j5P5as3oqh4bQKMiDOORZLIvBusM0HFeODcf/czPeKEsyTy0V4Y33lgbPw4qhxeB1f7f3DQCYDmMwxkeNeutjDs48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210529; c=relaxed/simple;
	bh=LWrvANq3GEkdsm8LRxOAKTdxijUly9AtqfOgfTUJ6ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CeuRKq+Gc8vznWV1ZfJgIC/JJ0cVWrIB97X05rU7fshn/H/rfsAUFLSyYPVBAFbAMN+hbZnz4fiFMja7TvnDkiQ7SccfvD1M2EDBz83fj3v3izSlE22IKOErFC/S1uEuBWz4EfOAW2WUo+TPZfl9IvoH5Rxw5G7oxW73SKmMuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tFWrFJH0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a/7ffHgS; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 45866140002A;
	Thu, 11 Jun 2026 16:42:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 11 Jun 2026 16:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781210526; x=1781296926; bh=am
	bbtTlwI43NZGEsOn9ght4nQrNoqL6qdvUcD7mchPk=; b=tFWrFJH0FaTFuL9G+I
	2UQZPjbKAyO75HXj5y74BFcj4GBhSrzNlrEvoYBAotMTJVTxygLqKEcgUZKvdx1N
	3Ss3D3ZHpdpUWB39zR5m3spXWf4iFZdLSu1f68p+IbIrGCbpa59aI7IlYs+hdEvM
	NzjJJ9RQdn/XK7L+C7offUt59tZGvXuKvolS6P2bSNqu0NDMPgkL3/A5TNgWpxdG
	JXHDsVwfCG98nhSWYdP+SMX7r1oROZEJhQKRbR0kO6bBWXb6TwRXmZ+I4/go//lO
	vyr+lTy86XMjVCOe6+6y3YvTHTqGeqIX80M3tW7+GMJD8Osgk4FTy1/lIrjvXXlh
	8XQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781210526; x=1781296926; bh=ambbtTlwI43NZGEsOn9ght4nQrNo
	qL6qdvUcD7mchPk=; b=a/7ffHgS84SZfTsbAQsfJz82pbv7/WEs+EfHROlBWp6A
	ztCIvZqD0P2TWL0TrkmwcCfhSW1OxHq8n/+8Ej4va10EP2wkpMbkkrK4ixwHTorV
	Cf+dqj7omvC1ailjQTqxZwQiuzmShDFQmNjOFEbaG5ZkjfVP1PKukmV4gFBYYv9i
	Sjwpk0vO3EjCELyGJZt6TnXTWTDtp3vvQTE+qyopz21bYUn5Cmo7K4XB2fg8ZbpM
	3zav2TArFuDMMq/EdUe/w5lXBSRYlOd980RwW3FFNen21gHvD8zRMXxatT2mGMLq
	DLsLxEuuvvTGfSBzjCV/bjRILS+fjuiyUYlnj5oEQw==
X-ME-Sender: <xms:nR0ralYPhIhPtrxkiMJaAEl3MUdcuhltAWZfc3YEUTrWAGGgaPrpXQ>
    <xme:nR0ras2B644n3iNUNe0QgVHdDO8VlyyIFJAnFT-sWMKuklrlFJlc_hRhmeAdTEMF0
    s6txYfPVmsH7qZIrTZdt_r43paAUDDqt99kPK2H4eoJ1m9z0vxRYEE>
X-ME-Received: <xmr:nR0raopu56jjd-WeDRiK--Zjq4M9OJI1FVnuvPicIC_2riDbEsG5ygDHjYuapiAfYheoU2pBNV1DKnBpvY9DHVsXwzll>
X-ME-Proxy-Cause: dmFkZTFCy0anKb5iwwZHoxvrU1iu9nl260o6vKd8bcxksJNiAyBXhTlsy7J9gu0RYJ5QiX
    2XlXsd8MOkpJ8tsTJsH3UA9k9P+qXlTbeUOorMimk7CboaIax0jVxRomuQ6mYLHmQYkD/t
    dR5bQjdBS94QX9U5JiOMNRY1+3hV/8R8r5DVyFFsm2og4kvLkGz60IpgwgrMXmGg1AhLPK
    JWwt6x8QrRsnNE50RGUVMCnfqMoczngTBdIj3/1XgVNC2buNNOtQrWnauri2OBb5Jxo1iJ
    QMPC+X0r9AUQ9PV0UGfvKCyLwqxv4dIRczeQDIxt23aKwtmUcqxCG0be1JkHDVzEBgMuHj
    ogeAfAqOJUs1iTVes7An01DHQAZgbYa9VromOjQZXwBrCC5DV2snz4wWgyu7mFEuAiuhG8
    2fg4l3q7PrD6HmhUtaBMDWJeziqC4aZkjnIjvOAk1Qff8MwlnFLcMq5/h25WM3GO176Ov6
    NJgX1dmivbtBicQZ3QDmjXaRDX1WmSGT4/BfFhLnpzmLrvmAAeXOmF0U/hAEdYx60/01TM
    UXYTxNXsV53CI9xmGSgzdMJxqolb+aPshsXuagESNwm6eBci+tYvfzhIf5+4W4osTBeJVu
    YY7/0kuPzK/hLTJiztJaD5gZYJsG6xm/bgHqoIcKoMduSxyZsX8JSfRQ3BAw
X-ME-Proxy: <xmx:nR0rarPz3eIDbvORW_T1nfPNIsmOiBnPEC2BV27XdyVDtaEekIsSrg>
    <xmx:nR0rahrOHViuKqi2o-kcOVOgRnmyFm2P7bKYl2UpB61ntisBCbewzg>
    <xmx:nR0ramseSQhIRhaXlPPfhu_8N1updGzAiQq37NXiDR2BFNIglcv4oA>
    <xmx:nR0rao3tN2kUIitHCs7PjgJqanUWBFwwoUeXt62tW6Z_bkoki5lHPg>
    <xmx:nh0rahUjwd2BdX6-zLfcgc0iHAvmaBGJg6UPT2crTUsTaOcnUtie0GYH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:05 -0400 (EDT)
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
Subject: [PATCH v10 00/13] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Thu, 11 Jun 2026 22:41:35 +0200
Message-ID: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64617-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB6E66753E1

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

See individual patches for change log since v9.

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

 .../userspace-api/media/v4l/metafmt-rppx1.rst |  99 ++
 MAINTAINERS                                   |  10 +
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/dreamchip/Kconfig      |   3 +
 drivers/media/platform/dreamchip/Makefile     |   6 +
 .../media/platform/dreamchip/rppx1/Kconfig    |  12 +
 .../media/platform/dreamchip/rppx1/Makefile   |  33 +
 .../platform/dreamchip/rppx1/rpp_module.c     |  39 +
 .../platform/dreamchip/rppx1/rpp_module.h     | 119 +++
 .../platform/dreamchip/rppx1/rpp_params.c     | 115 ++
 .../platform/dreamchip/rppx1/rpp_stats.c      |  66 ++
 .../media/platform/dreamchip/rppx1/rppx1.c    | 381 +++++++
 .../media/platform/dreamchip/rppx1/rppx1.h    | 105 ++
 .../platform/dreamchip/rppx1/rppx1_acq.c      | 148 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     |  63 ++
 .../media/platform/dreamchip/rppx1/rppx1_bd.c |  53 +
 .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |  81 ++
 .../platform/dreamchip/rppx1/rppx1_bls.c      | 157 +++
 .../platform/dreamchip/rppx1/rppx1_cac.c      |  30 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 166 +++
 .../media/platform/dreamchip/rppx1/rppx1_db.c |  45 +
 .../platform/dreamchip/rppx1/rppx1_dpcc.c     |  77 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      | 127 +++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c |  91 ++
 .../platform/dreamchip/rppx1/rppx1_hist.c     | 184 ++++
 .../platform/dreamchip/rppx1/rppx1_hist256.c  |  47 +
 .../media/platform/dreamchip/rppx1/rppx1_is.c |  43 +
 .../platform/dreamchip/rppx1/rppx1_lin.c      | 112 ++
 .../platform/dreamchip/rppx1/rppx1_lsc.c      | 188 ++++
 .../platform/dreamchip/rppx1/rppx1_ltm.c      |  49 +
 .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |  42 +
 .../platform/dreamchip/rppx1/rppx1_outif.c    |  46 +
 .../platform/dreamchip/rppx1/rppx1_outregs.c  |  76 ++
 .../platform/dreamchip/rppx1/rppx1_rmap.c     |  63 ++
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |  47 +
 .../platform/dreamchip/rppx1/rppx1_shrp.c     |  65 ++
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 165 +++
 .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |  27 +
 .../media/platform/renesas/rcar-isp/Kconfig   |   2 +
 .../media/platform/renesas/rcar-isp/Makefile  |   2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 997 ++++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    | 901 ++++++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |  48 +-
 .../platform/renesas/rcar-isp/risp-core.h     | 179 ++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/media/rppx1.h                         |  36 +
 .../uapi/linux/media/dreamchip/rppx1-config.h | 710 +++++++++++++
 include/uapi/linux/videodev2.h                |   4 +
 49 files changed, 6055 insertions(+), 8 deletions(-)
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


