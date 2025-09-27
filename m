Return-Path: <linux-media+bounces-43279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8689EBA59EB
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 08:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433324A64AC
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 06:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4768E26FDBB;
	Sat, 27 Sep 2025 06:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="or1t/Kyi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IiitGhCf"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A282258CDC;
	Sat, 27 Sep 2025 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758953831; cv=none; b=SL00nzl7i2Xk4SYpeWrl3eg6qks9OoWpdPLGGIJYdb6YEtbjY1Md3nhiUuL6I1yrOixIJtzA1irVxuAl31JumTtDIy6v27F6vPuux42BNdj7ehb/6tHIT7P733O8RZuyEirjfBDLOnNICBuSuVu5U/5C56IB3mdKip5F5R8M5qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758953831; c=relaxed/simple;
	bh=Mw5TBqc8ObImy/VzvyAW0LqNtXyvXGWCIJZuMNb2j5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GE5/EKmZ+JlcahaBvHCaqT03SiKui9lmq/httElY4LHK6b/Xo7+jHeMX8jOET8O5fU9z3+jnswbRYbJyeUUIX49ET3W0AB92Pt3pNW5xTKzMPejM+ihO0oAgkO8Fb6iOQcnruzhZ6IcTTe6FqmOD8O9BedBFQy1ocBy6CDM4g4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=or1t/Kyi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IiitGhCf; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 79D0C7A00C3;
	Sat, 27 Sep 2025 02:17:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 27 Sep 2025 02:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758953827;
	 x=1759040227; bh=RS6yuaADnvZ6pC8boGHVpGYnBRl6x45obIoXXRd6D24=; b=
	or1t/KyiXr+z0AuSqJobYcuPuIg6ITQs+1sOfsE+nbxrgNmFHq5wYJBod/tQ0iiR
	fws9G/3JXkz0PSx01aUdXpwHM1yBZi6a6I7F5ECZ4FGxkLjSb9OQUjIj4aMLIDQt
	hhJOMsSeRT7/SbVA0vkt07X5I3hMTxD3o2yc9YpXHVHHZ4l0yXFB3Vqc7sIqkQZ6
	ez4yAlLWMF1AfI4mm0CZxYW3LnvNuN1TorhhBx/rg+TdB/V7kaOCwt09Aa4xx7ty
	Cwnt5bNjMZFVWny1RBSgmCHLzuegKWW4bZs2xSQQhlbFeprYp9tklazdfk+PNiZa
	iVYgOmaRHRWf/yHTboOzvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1758953827; x=
	1759040227; bh=RS6yuaADnvZ6pC8boGHVpGYnBRl6x45obIoXXRd6D24=; b=I
	iitGhCfajDw1VYhaa71H9y3bd+r79eIdUj7sCShJSH5fdmy37EKPTBWwP1RhnM2t
	E8scA6fyy7UfctEynb14ZRq4AoNBJzk6GIhSj/AYzxuulZYfdBRuigbzUfETZwxm
	d3WC8rOyE9Rpf7mJra6l7oP/Pt53OskhTdUkfQdVtMrPyK5onU6ZEgn4CJJ9D6+D
	8fwfFxrwR1ljzT1jm1Oc/ATqfYdFYuw2Du4MWyYyzVsjoKQzRWRwGwu5PG2jFu71
	yv3tOYoDFfKeEVYik2d8Q2x1BWnq54zUErbIrj6vjlgc2Un93k5oDrPfh3sZH6W6
	hGH3+hPW1HZTb8h8A33uw==
X-ME-Sender: <xms:YoHXaP9yQ0TZMSb6BBACWUMMrM6Wm333wk6b5WmkOK2YWf9TosIypg>
    <xme:YoHXaIT36EaOXkPl7OkyIYpymqYqxAHAph4M-fdJzKxR6MxzVQqQSFE60GftzXcZ7
    _dIaoE4vsDe10692jgo3DGvnDt4SH5mevHk_E50CUFfVrajdDz0D2w>
X-ME-Received: <xmr:YoHXaBc06Jgq7Q40RR0rGAoSGAWVB_zmADB3Mxqvyfmhxp18vkUh_WPzewx_Wbivk2MiMVIvGP0YhU_cYUq6S5DqzYCF_Hc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesih
    guvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinh
    htvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgdohhhurgifvg
    hisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihgu
    vggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:YoHXaCTZU-HnRpuDQ8dXl4v4rSTDkAj7vNjj--b6TfJeAHiogPRpAg>
    <xmx:YoHXaFKkFweoNiOqlJUG711XDrFTfSR3Xaqv0l-KotbmHzvWMwqZWg>
    <xmx:YoHXaHIaTbM__G2SdgdeRE_30E-6KIp1SRjXrnOS7Zv3SI6_8QaBqw>
    <xmx:YoHXaIgXb27GFPg8wSOmRM1rDzq09HyHgzzh08yiYlLExrHezciB3Q>
    <xmx:Y4HXaCpe0iMvy-B9QlU2LZfLDxs1mzWXn2HPF1e49yBxwzB9dn9GR44T>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Sep 2025 02:17:06 -0400 (EDT)
Date: Sat, 27 Sep 2025 08:17:04 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 03/15] media: rcar-isp: Move
 {enable|disable}_streams() calls
Message-ID: <20250927061704.GA2027750@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-3-026655df7138@ideasonboard.com>
 <20250602055742.GC11750@pendragon.ideasonboard.com>
 <62890f7a-8ce9-47af-be36-e7384d2a99fd@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62890f7a-8ce9-47af-be36-e7384d2a99fd@ideasonboard.com>

Hi Tomi,

On 2025-09-26 14:22:10 +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/06/2025 12:43, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > Thank you for the patch.
> > 
> > On Fri, May 30, 2025 at 04:50:32PM +0300, Tomi Valkeinen wrote:
> >> With multiple streams the operation to enable the ISP hardware and to
> >> call {enable|disable}_streams() on upstream subdev will need to be
> >> handled separately.
> >>
> >> Prepare for that by moving {enable|disable}_streams() calls out from
> >> risp_start() and risp_stop().
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>  drivers/media/platform/renesas/rcar-isp/csisp.c | 18 ++++++++++--------
> >>  1 file changed, 10 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> >> index 8fb2cc3b5650..2337c5d44c40 100644
> >> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> >> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> >> @@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
> >>  	/* Start ISP. */
> >>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
> >>  
> >> -	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> >> -					 BIT_ULL(0));
> >> -	if (ret)
> >> -		risp_power_off(isp);
> >> -
> >> -	return ret;
> >> +	return 0;
> >>  }
> >>  
> >>  static void risp_stop(struct rcar_isp *isp)
> >>  {
> >> -	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
> >> -
> >>  	/* Stop ISP. */
> >>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
> >>  
> >> @@ -305,6 +298,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
> >>  			return ret;
> >>  	}
> >>  
> >> +	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> >> +					 BIT_ULL(0));
> > 
> > You're now potentially calling v4l2_subdev_disable_streams() multiple
> > times on the same pad and stream, as this call isn't covered by the
> > stream_count check anymore. Is that correct ? Maybe because
> > risp_enable_streams() is guaranteed to never be called multiple times,
> > with stream_count never becoming larger than 1 ? If so that should be
> > explained in the commit message, and stream_count should probably be
> > dropped.
> 
> At this point in the series risp_enable_streams() is called just once,
> from a single VIN. That is, assuming only a single stream is supported.
> In the cover letter I mention that there seems to be some kind of
> attempts for multistreaming in upstream, which breaks during this
> series. My understanding from Niklas was that the custom multistreaming
> doesn't work or at least can be dropped. Niklas, correct me if I'm wrong
> (and if I am wrong, someone else needs to take care of the custom
> multistreaming =).

And as discussed on IRC the main issue for the VIN pipeline will be on 
Gen3 where media graph links are made to model VC-to-VIN as we had no 
streams concept at the time. And that would need to be changed _before_ 
adding streams to instead model the physical busses between the R-Car 
CSI-2 Rx and VIN instances, with all their fun limitations.

If that is not done and streams added to the R-Car CSI-2 driver it would 
do the correct thing, but the VIN driver would still create a lot of 
media links that after streams are not possible to setup in hardware.

> 
> Later in the series risp_enable_streams will be called multiple times.
> Each VIN video node will call it once when enabling.
> 
>  Tomi
> 
> > 
> > Same when stopping.
> > 
> >> +	if (ret) {
> >> +		risp_stop(isp);
> > 
> > This is also not covered by the stream_count, while risp_start() is.
> > 
> >> +		return ret;
> >> +	}
> >> +
> >>  	isp->stream_count += 1;
> >>  
> >>  	return ret;
> >> @@ -322,6 +322,8 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
> >>  	if (!isp->remote)
> >>  		return -ENODEV;
> >>  
> >> +	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
> >> +
> >>  	if (isp->stream_count == 1)
> >>  		risp_stop(isp);
> >>  
> > 
> 

-- 
Kind Regards,
Niklas Söderlund

