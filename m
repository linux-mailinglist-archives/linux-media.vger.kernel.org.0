Return-Path: <linux-media+bounces-36832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E0AF9182
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BFA3584D54
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5652C324A;
	Fri,  4 Jul 2025 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OQBIqF6y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SXvGb0Sa"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAD52C15AE;
	Fri,  4 Jul 2025 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628286; cv=none; b=QtnSHyyR6Kok0idx9sfkwnOCRmJzthz4imZXRQ2YxsAp91251UAO6IEX2kVdUSyLXWWpIma7hUGV6RmLUZ4fPIa3Ilupe8JdosT81SEBAzs7g1514HGT0NdLDIbMr30GdEHuV1aL8GdCfkZ+AWhDpBaHE+YLtUo/ya58a4B8Bcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628286; c=relaxed/simple;
	bh=IOkOV2oji1iN0YMt+CIZesbBk2GQRdw8bPDbeQvj/sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqyaUSKlmbtAp8pUfgi3jNrc2Mn0CVQHPhTnVf8w5igtR1wc2OjiQK3aEghV0RqPJrWMsQnBKGhn32RMx6YMf673DVw5m9IURCtjoLTf9zIlQO4Or1NNAiDUKs4yn2n2TPgS0ZlzND1GeJX8zFSJyi0meDfbLo3PmEYRDIloUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OQBIqF6y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SXvGb0Sa; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 88DA41D00126;
	Fri,  4 Jul 2025 07:24:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 04 Jul 2025 07:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751628282;
	 x=1751714682; bh=ufKeDcAtKAGFce2jg3k69t1E3FS7FbCL2dLQB+EU7Ng=; b=
	OQBIqF6yEEhsFF/mpIbsECRVhylYYjAgBBJel0l+a4cmtw+PLsl9545mHu/Tsnke
	DWBXFofxi7id+Ka50iCRF8SR5lkCPsCferboBjVDbD+rMLMb9ZgA5/G/XJ/mqL5/
	epxSjGOJGs1Qz26LhnUm1QuTCWWFRv3KYl0vjiLRG3d4TaP7IrqPcW42b1hylCaR
	oYr02apDVITeWc1isE7iUd3ybhdciGh+iufE5YC+G/nA8TQxdTC3BbV40H1kkwCx
	of39VykhEGNtksT5CLYELghicVKeldZpLTbhHjRvk9Lz76ewlJQpAHVK2oKhJl1G
	KuQT+zqvbG1Nzrcz6HhxmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751628282; x=
	1751714682; bh=ufKeDcAtKAGFce2jg3k69t1E3FS7FbCL2dLQB+EU7Ng=; b=S
	XvGb0SaoVh2HmrP01oCXour4rOxJ60hs9RBeTgig9Tmt6nlhe8MHjQT52VreX059
	XOQ6tc4eVFf7OpiUmtzjNpzi6ux2jt2TknJ5L9bqKVV76xGYScxyJskPBO6/wOeO
	R7VwCgOsYt/0aStYwNC8pI5TixAA9RkLVSvKnOY1H7Bn2RzmJ/9dTXXV6WR878Sf
	d0QK8Ytvy0hDJHXzl9RdYeC0ztGg3W248z5SL4YFAVGCeFjvE0Xvz0S10IA90JuC
	YVa/zOxfZJHOrlWnBoiTLlIcbar63zGLgvNcErQz0NEtw7UhVvkFYjAGKU55pqcR
	9ELrhXeBBhHBnmg2E9MgQ==
X-ME-Sender: <xms:-rlnaAYz-yMLDvZOOoRTWt8LLCqJuidi9Ve5pU-GqXlWKDjIqbdcXA>
    <xme:-rlnaLY5SofIyc77JmKMDajkRVLTJqGyO1PcgyJstNCAoBe9D8fb71sXTSq4fDwE2
    9c64w5gupKZMXAMFvM>
X-ME-Received: <xmr:-rlnaK9unEloLL-2EVHqUshc1PN-aVLS63h_5mPIXRZy_TRbcKC39kgvtRZPFMT4E1HvlebP8D31GNjsYp5CH2Juhe2UmJI-Xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhrvghnvghsrghssehiuggvrghs
    ohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihgvrhgrnhdrsghinh
    hghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophho
    rdhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehtohhmih
    drvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:-rlnaKrGQ_O3bu8n68opN3k4PgWIY2H4lUoQWVl8_KLS3FW_ogzsNg>
    <xmx:-rlnaLoWVEXzfvjUGAliPdDQOintYETB1atMR2WlaXi1uXq4-4hA-g>
    <xmx:-rlnaIRll9FIMq_93A9TBZmNTalOjqFT_yntxMS3cxtBCE146umq9g>
    <xmx:-rlnaLpi-MJSSTQQyTq7STfiw5H2cOxlgXLcQHLUo5V9mN1RTJjosQ>
    <xmx:-rlnaHozRYZDbO-bBufT_6gUatxVPYC71Q5Av0kG23uERjsDiIkxWk82>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 07:24:41 -0400 (EDT)
Date: Fri, 4 Jul 2025 13:24:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 0/8] media: renesas: vsp1: Fix v4l2-compliance failures
Message-ID: <20250704112440.GA309980@ragnatech.se>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

Thanks for your series.

On 2025-07-04 03:18:04 +0300, Laurent Pinchart wrote:
> Hello,
> 
> This series fixes all v4l2-compliance failures in the VSP1 driver. The
> v4l2-compliance log is long, and not that interesting as there's no
> failure. Here's the executive summary, if anyone wants the full log,
> please let me know.
> 
> ----------------------------------------
> root@buildroot ~ # v4l2-compliance -m /dev/media1
> v4l2-compliance 1.31.0-5383, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 58fb1141ca7c 2025-07-03 19:50:58
> 
> Compliance test for vsp1 device /dev/media1:
> 
> Media Driver Info:
>         Driver name      : vsp1
>         Model            : VSP2-BD
>         Serial           :
>         Bus info         : platform:fe960000.vsp
>         Media version    : 6.16.0
>         Hardware revision: 0x01011504 (16848132)
>         Driver version   : 6.16.0
> 
> [...]
> 
> 
> Grand Total for vsp1 device /dev/media1: 751, Succeeded: 751, Failed: 0, Warnings: 0
> ----------------------------------------
> 
> The series has also been tested with the vsp-tests suite, which reported
> no regression.
> 
> Compared to v2, I've fixed a bisection compilation breakage in patch 1/8.

I don't know the VSP internals good enough to provide a R-b, but I had 
read all commits and they look good.

I also tested the series together with the VSPX and the still out of 
tree ISP driver and all works as expected, for that use-case,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Laurent Pinchart (8):
>   media: renesas: vsp1: Store supported media bus codes in vsp1_entity
>   media: renesas: vsp1: Store size limits in vsp1_entity
>   media: renesas: vsp1: Fix code checks in frame size enumeration
>   media: renesas: vsp1: Fix crop left and top clamping on RPF
>   media: renesas: vsp1: Fix crop width and height clamping on RPF
>   media: renesas: vsp1: Fix RWPF media bus code and frame size
>     enumeration
>   media: renesas: vsp1: Fix format propagation on the BRX
>   media: renesas: vsp1: Implement control events
> 
>  .../media/platform/renesas/vsp1/vsp1_brx.c    |  37 ++---
>  .../media/platform/renesas/vsp1/vsp1_clu.c    |  47 ++-----
>  .../media/platform/renesas/vsp1/vsp1_entity.c | 110 +++++++--------
>  .../media/platform/renesas/vsp1/vsp1_entity.h |  21 +--
>  .../media/platform/renesas/vsp1/vsp1_histo.c  |  27 ++--
>  .../media/platform/renesas/vsp1/vsp1_histo.h  |   2 -
>  .../media/platform/renesas/vsp1/vsp1_hsit.c   |  24 ++--
>  .../media/platform/renesas/vsp1/vsp1_iif.c    |  39 ++----
>  .../media/platform/renesas/vsp1/vsp1_lif.c    |  40 ++----
>  .../media/platform/renesas/vsp1/vsp1_lut.c    |  47 ++-----
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    |   7 +-
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 127 ++++++++++++++----
>  .../media/platform/renesas/vsp1/vsp1_rwpf.h   |   6 +-
>  .../media/platform/renesas/vsp1/vsp1_sru.c    |  63 ++++-----
>  .../media/platform/renesas/vsp1/vsp1_uds.c    |  62 ++++-----
>  .../media/platform/renesas/vsp1/vsp1_uif.c    |  40 ++----
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    |  13 +-
>  17 files changed, 335 insertions(+), 377 deletions(-)
> 
> 
> base-commit: c26e8dcd9d4e86d788c5bf7a5dd0ea70a95ab067
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Kind Regards,
Niklas Söderlund

