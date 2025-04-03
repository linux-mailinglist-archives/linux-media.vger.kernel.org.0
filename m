Return-Path: <linux-media+bounces-29302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976EFA79EC9
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 10:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2C13B59EC
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 08:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED99241CAF;
	Thu,  3 Apr 2025 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WfNsuAjB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z+j+9MRo"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753F19E7D1;
	Thu,  3 Apr 2025 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670627; cv=none; b=gyADjRsVOQMcfIdCK3zlCO4aytDhgDBrms60TxM/6gANGDmuXS1HDTzWztQCoHS3yPLoY85rpSEYn+tbUQY02ONpbSHb7mKvSwAEg9HNXHmOWn06eid2JWySzn8yy4/H/MeoIvM9EwfgG3G85NJ7YWc35pb05CW8I3R5gbkxdPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670627; c=relaxed/simple;
	bh=SB+xoFy1nJ7KOk1RdNXdI32g9OjbKrxD8GHgrpmRtgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qr7Wkr03q2knaaODs3gYk9kv8SxG4W2HSHLQikqGe+0l/IEQ4UTdASLC1ftVf2ltF05zHIrIVM31ZmzcfbXNiEbzIMBPiEHxRPGDXzzTfne0Y5P+/5jEH0egmwNleZoTbu2egeLg6dc1uaTbeXGA6qmEbLd1Sru7rDhu87btJrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WfNsuAjB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z+j+9MRo; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 24BD5138022F;
	Thu,  3 Apr 2025 04:57:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 03 Apr 2025 04:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743670623;
	 x=1743757023; bh=XttqXwIkB+SbzoxwV4Vg8HDBQrhlSsokjdPFrPgy+8c=; b=
	WfNsuAjBYotrx3tXFL9rV1WOQK4EfRCDOwvRopI/IO0VAB1zb8oh6d/ep1bggyFb
	saZKk0zZX/ob1S+ELX9/AacRIMOTNDG3L/2LrasUgNqQFUQUkrt4IctRAahkzLD5
	lRy3y/qhc1J10lh1mHHTzJkR+Al4tFWuQMkEUkJ+Ruc0qFiB/l77zalvnJW70qBy
	VndLzyohNQrwagBI1D4WCN0zJBFFs2ZP32gwlmRr6zjILPcje9GEn0sfT71MEEd9
	nR+/Fqm6/ZQKEZYvLZepDATwIiqkxIrpPFQDoFZIxhPz8Uu2yTaNrXgKeKwe6tDt
	mbYwSfR9MGV9639FPh9azQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743670623; x=
	1743757023; bh=XttqXwIkB+SbzoxwV4Vg8HDBQrhlSsokjdPFrPgy+8c=; b=Z
	+j+9MRoE6veA54UqoSSmDpngcoXSBWmnC3BkoMtgWTeea1RGY+YXusIKjLj/fq6e
	rzEuN+3+WQaqZQut1kblliEj0V5BR3b/S8E2cOL5aLjjY+ZZpDbRmi+/Hpjh+d+h
	cPUU4nr/rtzAJ70XNCMUMS6aDiIoaexqrIh1VzURLI4uvuJxx7dmHI2lw0KwJXyj
	X9LP1nWytVhr31784v+y5qke7mSWW1/1IAJW2SdoJp9lhhWJuq1ZSFsN9TeYwtLf
	fIW6jZ08Dy3C2SSwq/cqdQWHOT6dR+mpfbN1ohZqx0Yh52se7Hhopm+bxzv2bQfC
	SbVBC4AxigtCZ9GR1rq+Q==
X-ME-Sender: <xms:Xk3uZxe0QHljVpGF1xYuE9XsyN6evaH0Wm4gfPnmDCdNi-p00-vDNg>
    <xme:Xk3uZ_NzgwH3nZ4QSyRTfEeIMBl0Us9nOoqmSvsRATlUv8ilzQxwOfAEc8jvurSIY
    A5sZ2ucu-1gHiu37Zc>
X-ME-Received: <xmr:Xk3uZ6gIiVSIqpuVX4xs1EmBIgJWnQrFnB-4M0shkc785kLWaxEDMI5rgkbD4NE7nwyxB63Z10r322kH0YloNNB8QKAqYhlutQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthh
    gvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgv
    hhgrsgdohhhurgifvghisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Xk3uZ68L4wt9JIjMWuYB6FAfepT7zqO-pWoc4B8v6AeY2va9lczWuA>
    <xmx:Xk3uZ9v3ws-9qPELCtnNtB7qbAms4Tp3QX1qxqkGUgdHFWC-qDYxeA>
    <xmx:Xk3uZ5HmfIkndz9Df0vgam26B2DvhBJfeeU8FoKxt6p1Ld0Xhd0zrA>
    <xmx:Xk3uZ0MDnn-bSTfllqsykn6XYvifb-uUwdvXEEgnk8WfyQ8_BtXUAw>
    <xmx:X03uZ3bD2aakvAjFPaQrxnRVqAi4XTawBfpSrscRD0dE7zdvV_FG_Kga>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 04:57:02 -0400 (EDT)
Date: Thu, 3 Apr 2025 10:57:00 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 3/3] media: rcar-vin: Fix RAW10
Message-ID: <20250403085700.GU1240431@ragnatech.se>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
 <20250324-rcar-fix-raw-v1-3-ae56c1c7a2f6@ideasonboard.com>
 <20250331211122.GA1240431@ragnatech.se>
 <5ebccf6a-3860-4643-9f92-735163552b7e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ebccf6a-3860-4643-9f92-735163552b7e@ideasonboard.com>

Hi Tomi,

On 2025-04-03 11:15:04 +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 01/04/2025 00:11, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > Thanks for your work.
> > 
> > On 2025-03-24 13:48:54 +0200, Tomi Valkeinen wrote:
> > > Fix the following to get RAW10 formats working:
> > > 
> > > In rvin_formats, the bpp is set to 4 for RAW10. As VIN unpacks RAW10 to
> > > 16-bit containers, the bpp should be 2.
> > > 
> > > Don't set VNDMR_YC_THR to the VNDMR register. The YC_THR is "YC Data
> > > Through Mode", used for YUV formats and should not be set for RAW10.
> > > 
> > > Fix the check related to the RGB666 format and CSI-2 mode. The
> > > VNMC_INF_RGB666 define is the same as used for RAW10 on Gen4, and RAW10
> > > is allowed on CSI-2 (whereas RGB666 is not allowed on Gen3 on CSI-2).
> > > This feels a bit hacky, though, and the formats should really have been
> > > verified already earlier.
> > 
> > I agree, it feels hacky. I would rather just remove the while switch
> > then try to "fix" it by extending it more. When testing this series I
> > needed a similar fix for VNMC_INF_RAW8 check below to get it to work on
> > Gen4.
> 
> Why is that? What is VNMC_INF_RAW8 overlapping with?

VNMC_INF_RAW8 is not overlapping the issue is the "if (!vin->is_csi)" 
check. On Gen3 RAW8 was supposedly only supported on the CSI-2 input, 
and not on the parallel bus available on some VIN instances.

On Gen4 the checks around vin->is_csi becomes skewed and as you point 
out should be cloned up. The effect at the moment however is that o Gen4 
when trying to capture RAW8 is_csi is not set (as this is a gen3 thing) 
and the "Invalid setting in Digital Pins" error path is hit.

Locally I have now removed this whole swtich, as you point out the 
formats should already be checked, and as far as I can tell they are.  
This check is a relic from early Gen3 support. And really proves after 
the Gen2 media graph clenups are done we should split rcar-dma.c -> 
rcar-dma-gen{2,3,4}.c to get rid of this mess ;-)

I would change this patch to just remove the whole switch. If you want 
to keep this fix as is I'm ok with that. I can submit a patch removing 
the switch if you like on top.

> 
>  Tomi
> 
> > > 
> > > Fixes: 1b7e7240eaf3 ("media: rcar-vin: Add support for RAW10")
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > ---
> > >   drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 9 +++++++--
> > >   drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 8 ++++----
> > >   2 files changed, 11 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > index 53046614f7a1..f8394be8a922 100644
> > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > @@ -811,12 +811,17 @@ static int rvin_setup(struct rvin_dev *vin)
> > >   		case VNMC_INF_YUV8_BT656:
> > >   		case VNMC_INF_YUV10_BT656:
> > >   		case VNMC_INF_YUV16:
> > > -		case VNMC_INF_RGB666:
> > >   			if (vin->is_csi) {
> > >   				vin_err(vin, "Invalid setting in MIPI CSI2\n");
> > >   				return -EINVAL;
> > >   			}
> > >   			break;
> > > +		case VNMC_INF_RGB666:
> > > +			if (vin->info->model == RCAR_GEN3 && vin->is_csi) {
> > > +				vin_err(vin, "Invalid setting in MIPI CSI2\n");
> > > +				return -EINVAL;
> > > +			}
> > > +			break;
> > >   		case VNMC_INF_RAW8:
> > >   			if (!vin->is_csi) {
> > >   				vin_err(vin, "Invalid setting in Digital Pins\n");
> > > @@ -913,7 +918,7 @@ static int rvin_setup(struct rvin_dev *vin)
> > >   	case V4L2_PIX_FMT_SGBRG10:
> > >   	case V4L2_PIX_FMT_SGRBG10:
> > >   	case V4L2_PIX_FMT_SRGGB10:
> > > -		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
> > > +		dmr = VNDMR_RMODE_RAW10;
> > >   		break;
> > >   	default:
> > >   		vin_err(vin, "Invalid pixelformat (0x%x)\n",
> > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > index 756fdfdbce61..65da8d513b52 100644
> > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > @@ -88,19 +88,19 @@ static const struct rvin_video_format rvin_formats[] = {
> > >   	},
> > >   	{
> > >   		.fourcc			= V4L2_PIX_FMT_SBGGR10,
> > > -		.bpp			= 4,
> > > +		.bpp			= 2,
> > >   	},
> > >   	{
> > >   		.fourcc			= V4L2_PIX_FMT_SGBRG10,
> > > -		.bpp			= 4,
> > > +		.bpp			= 2,
> > >   	},
> > >   	{
> > >   		.fourcc			= V4L2_PIX_FMT_SGRBG10,
> > > -		.bpp			= 4,
> > > +		.bpp			= 2,
> > >   	},
> > >   	{
> > >   		.fourcc			= V4L2_PIX_FMT_SRGGB10,
> > > -		.bpp			= 4,
> > > +		.bpp			= 2,
> > >   	},
> > >   };
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
Kind Regards,
Niklas Söderlund

