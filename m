Return-Path: <linux-media+bounces-29304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B6A7A028
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 11:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DB6017182A
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0152459D7;
	Thu,  3 Apr 2025 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nvQCEjZ3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n5G0QdQM"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90E245036;
	Thu,  3 Apr 2025 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672987; cv=none; b=MSE2gVU8g6G/LDkwC2kO0YM0kzF5R/Fwhw7TWTaSMIImiJL8nOTF315tX/pz3HmxYK3DoyxGkuCZzwpjV68UMcWOnWzVjC5aMuuhMi5httqz7yfLV872jYI4klcCx1l+IMMWjexJmT5phzk2z+/IejFjukUPtNDq0pmy1yoBjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672987; c=relaxed/simple;
	bh=4mzcNSK4mIf5zEdNH6yhQWrwkVV4GUuEe+ZCP/GnKEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ua78ZGI/di8+u4zUZ5HywGGrOtvcHM2BkjE6I1LafNqrsZCsGtaEV9RubgO4uKh/rUK88hLQfTPfGuMvgxaYZCLIQvcqaYHWHJKfjZlejSWPWaX9x8/D57PsDiHxMX5bAgRbFC8R82bJqpvifHCv2de0ZsscKHI3VbhSVxaqtWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nvQCEjZ3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n5G0QdQM; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id A3B0C138027A;
	Thu,  3 Apr 2025 05:36:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 03 Apr 2025 05:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743672983;
	 x=1743759383; bh=+WwVIxL9Qc/4TbzbpQH26LD7WP6uySKR61rUr+8lh+Q=; b=
	nvQCEjZ3+vhOVdZOU7nBi6LafH2SKpJysC2jgyeuOwGCY/93NGobKog3UAPxJYRU
	nJBrPskt+8q0B8S35+penPpv2+QkA1uMEShVjXCtlRxbGchP8DvhftGuybD8kfbp
	gdIIsZRRR3LrtdxUshfWVBNeXfVM5TeY7mz2tOT/PTSTGf3g9NrcNiC+5gDYwCoG
	GuruEDg2jjHM1ywvk7hai5yXyj4BD/zlFkIWRl6IqqWo6mS4putmMt+jojWYuOkC
	xZzivlwy4iQTcbWERSiZzcNAUBd5MuMHwGOj9ssrjxkG2WC682umnGfRCD7TLPcs
	RGKYR829biFgkDaAhETvNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743672983; x=
	1743759383; bh=+WwVIxL9Qc/4TbzbpQH26LD7WP6uySKR61rUr+8lh+Q=; b=n
	5G0QdQM7S2Zw5bNj18z2xslHrp+AQnEDB9fdwmYu7pnV3ECVT1Io0uEAO4LXaZKh
	5sGLEQ1NMKHn8gEj4IPav+JhCfW6jyZow/OsbLNXUCw97rQgJUBmYTgJKB2x1w7n
	03pHpijSa4TCbJ3if0GSRvNEFgQBUSJYbcxUCYBh5iZs/f+ozj4kXapTRMRd3uq2
	z7DgkAsHO2sX4/YS4UbztFIUFo2CvHhrVrnljFA6Sx3KdnQlklWYDsnEb+9dymR5
	mNMpaXYnE93xzTB67f/oljND5m/Bw3RbhppIbav35ZRhS6af8oQcNw3IBg0Y9tMf
	EmxuzAk73pUptNKnEmo8w==
X-ME-Sender: <xms:l1buZzEnUVGqOMsqewUyInfXs85r_-RsX3tne8XZqD4nJCUXEvql3g>
    <xme:l1buZwXS5W-MALrt1ecHektp3-VdXNXlGfcoHiRZf4gDsp2g4_UkrTZ6dKM8WfKSS
    EnwGwvO6pdqjKBCOO4>
X-ME-Received: <xmr:l1buZ1JChwnLVuzTq5bzueM9kmISxkMHBoc1m9gsGlMdsjUhjetprn1KjxT1pVS_OAlqHK_Z5Fi7_Jmzt4hQRi8Wsr3_1V2fwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekvddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:l1buZxFVqBhvRSKIkfzon7ty9j_O_MLY4ci7yteSEgxcrR8vjkMViw>
    <xmx:l1buZ5VCCSKjH_WGsKjiPUJmzXaSn-oGn5METBThA5Ne99ZCjN1ahA>
    <xmx:l1buZ8PTBejbNwo-7EE-EOKdemeLuTSOdy9FDBRViThhisESxOzJ8w>
    <xmx:l1buZ43tHcuLqisxr8VGnuclIZPRSL-ffKk6W7eB6-pNFaUgCsqQTQ>
    <xmx:l1buZ3iODN6AKQhQQdrFEyUL669rcGwfRZ90M0gZsG0GM8D-8rV2v393>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 05:36:22 -0400 (EDT)
Date: Thu, 3 Apr 2025 11:36:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 3/3] media: rcar-vin: Fix RAW10
Message-ID: <20250403093621.GV1240431@ragnatech.se>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
 <20250324-rcar-fix-raw-v1-3-ae56c1c7a2f6@ideasonboard.com>
 <20250331211122.GA1240431@ragnatech.se>
 <5ebccf6a-3860-4643-9f92-735163552b7e@ideasonboard.com>
 <20250403085700.GU1240431@ragnatech.se>
 <e1a770cb-8767-4251-9d96-599240d0efa8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1a770cb-8767-4251-9d96-599240d0efa8@ideasonboard.com>

Hi Tomi,

On 2025-04-03 12:12:06 +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 03/04/2025 11:57, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > On 2025-04-03 11:15:04 +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 01/04/2025 00:11, Niklas Söderlund wrote:
> > > > Hi Tomi,
> > > > 
> > > > Thanks for your work.
> > > > 
> > > > On 2025-03-24 13:48:54 +0200, Tomi Valkeinen wrote:
> > > > > Fix the following to get RAW10 formats working:
> > > > > 
> > > > > In rvin_formats, the bpp is set to 4 for RAW10. As VIN unpacks RAW10 to
> > > > > 16-bit containers, the bpp should be 2.
> > > > > 
> > > > > Don't set VNDMR_YC_THR to the VNDMR register. The YC_THR is "YC Data
> > > > > Through Mode", used for YUV formats and should not be set for RAW10.
> > > > > 
> > > > > Fix the check related to the RGB666 format and CSI-2 mode. The
> > > > > VNMC_INF_RGB666 define is the same as used for RAW10 on Gen4, and RAW10
> > > > > is allowed on CSI-2 (whereas RGB666 is not allowed on Gen3 on CSI-2).
> > > > > This feels a bit hacky, though, and the formats should really have been
> > > > > verified already earlier.
> > > > 
> > > > I agree, it feels hacky. I would rather just remove the while switch
> > > > then try to "fix" it by extending it more. When testing this series I
> > > > needed a similar fix for VNMC_INF_RAW8 check below to get it to work on
> > > > Gen4.
> > > 
> > > Why is that? What is VNMC_INF_RAW8 overlapping with?
> > 
> > VNMC_INF_RAW8 is not overlapping the issue is the "if (!vin->is_csi)"
> > check. On Gen3 RAW8 was supposedly only supported on the CSI-2 input,
> > and not on the parallel bus available on some VIN instances.
> > 
> > On Gen4 the checks around vin->is_csi becomes skewed and as you point
> > out should be cloned up. The effect at the moment however is that o Gen4
> > when trying to capture RAW8 is_csi is not set (as this is a gen3 thing)
> > and the "Invalid setting in Digital Pins" error path is hit.
> 
> Ok. I was wondering why it worked for me. But maybe the reason it worked for
> me was the extra series from you, which also changed these checks to
> rvin_remote_is_parallel(). And perhaps that function works fine, while the
> older vin->is_csi didn't.

Ahh yes that might be it. There are so many VIN series floating around 
:-)

> 
> > Locally I have now removed this whole swtich, as you point out the
> > formats should already be checked, and as far as I can tell they are.
> > This check is a relic from early Gen3 support. And really proves after
> > the Gen2 media graph clenups are done we should split rcar-dma.c ->
> > rcar-dma-gen{2,3,4}.c to get rid of this mess ;-)
> > 
> > I would change this patch to just remove the whole switch. If you want
> > to keep this fix as is I'm ok with that. I can submit a patch removing
> > the switch if you like on top.
> 
> Ok, if you think removing the switch is fine, we can do that. I wasn't sure
> of the flow in the driver so I wasn't confident I could just drop it
> (especially considering pre-gen4, with which I have no experience). Thus
> this patch.
> 
>  Tomi
> 
> > 
> > > 
> > >   Tomi
> > > 
> > > > > 
> > > > > Fixes: 1b7e7240eaf3 ("media: rcar-vin: Add support for RAW10")
> > > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > > ---
> > > > >    drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 9 +++++++--
> > > > >    drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 8 ++++----
> > > > >    2 files changed, 11 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > > > index 53046614f7a1..f8394be8a922 100644
> > > > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > > > @@ -811,12 +811,17 @@ static int rvin_setup(struct rvin_dev *vin)
> > > > >    		case VNMC_INF_YUV8_BT656:
> > > > >    		case VNMC_INF_YUV10_BT656:
> > > > >    		case VNMC_INF_YUV16:
> > > > > -		case VNMC_INF_RGB666:
> > > > >    			if (vin->is_csi) {
> > > > >    				vin_err(vin, "Invalid setting in MIPI CSI2\n");
> > > > >    				return -EINVAL;
> > > > >    			}
> > > > >    			break;
> > > > > +		case VNMC_INF_RGB666:
> > > > > +			if (vin->info->model == RCAR_GEN3 && vin->is_csi) {
> > > > > +				vin_err(vin, "Invalid setting in MIPI CSI2\n");
> > > > > +				return -EINVAL;
> > > > > +			}
> > > > > +			break;
> > > > >    		case VNMC_INF_RAW8:
> > > > >    			if (!vin->is_csi) {
> > > > >    				vin_err(vin, "Invalid setting in Digital Pins\n");
> > > > > @@ -913,7 +918,7 @@ static int rvin_setup(struct rvin_dev *vin)
> > > > >    	case V4L2_PIX_FMT_SGBRG10:
> > > > >    	case V4L2_PIX_FMT_SGRBG10:
> > > > >    	case V4L2_PIX_FMT_SRGGB10:
> > > > > -		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
> > > > > +		dmr = VNDMR_RMODE_RAW10;
> > > > >    		break;
> > > > >    	default:
> > > > >    		vin_err(vin, "Invalid pixelformat (0x%x)\n",
> > > > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > > > index 756fdfdbce61..65da8d513b52 100644
> > > > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > > > @@ -88,19 +88,19 @@ static const struct rvin_video_format rvin_formats[] = {
> > > > >    	},
> > > > >    	{
> > > > >    		.fourcc			= V4L2_PIX_FMT_SBGGR10,
> > > > > -		.bpp			= 4,
> > > > > +		.bpp			= 2,
> > > > >    	},
> > > > >    	{
> > > > >    		.fourcc			= V4L2_PIX_FMT_SGBRG10,
> > > > > -		.bpp			= 4,
> > > > > +		.bpp			= 2,
> > > > >    	},
> > > > >    	{
> > > > >    		.fourcc			= V4L2_PIX_FMT_SGRBG10,
> > > > > -		.bpp			= 4,
> > > > > +		.bpp			= 2,
> > > > >    	},
> > > > >    	{
> > > > >    		.fourcc			= V4L2_PIX_FMT_SRGGB10,
> > > > > -		.bpp			= 4,
> > > > > +		.bpp			= 2,
> > > > >    	},
> > > > >    };
> > > > > 
> > > > > -- 
> > > > > 2.43.0
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
Kind Regards,
Niklas Söderlund

