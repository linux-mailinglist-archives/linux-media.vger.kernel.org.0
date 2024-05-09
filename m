Return-Path: <linux-media+bounces-11260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DFA8C1997
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D8D71F22C4C
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDBB12D209;
	Thu,  9 May 2024 22:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qAXgC/Fm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c72Elt0F"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F890770E0;
	Thu,  9 May 2024 22:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294933; cv=none; b=aw40jLjq3F+v4J03fF5U9yuKu2EyKSI5Awf/p0TPwdwT/SOAcSMKmGrXtmv7ZaTJeXV2zOK3j0Xw1Y8GmHdZiVQrxjFn+2AbiHi7YNtoHw4iwQHwNbkAbo8Ha93w6CiWm9Ut/Uqx1o82x9VuKyVpShevC/3AowUd7Batx2GrU8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294933; c=relaxed/simple;
	bh=NnvUNv2iD9nideSf8CYpaIE72bbC/KUI/6n7DOWf3Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzYXHBKMvcVyHJ+mTjB5P+fRpDuDb812+Df8h7zRnWyUvuPpMaIruNJ0944mTIyBZYQHhJAEhkqYvdtCEuII/SP+IoC2qfWmJrynZ/GSZLoxp4E7gJJVHyiAALxyfYiPAk4cRqHA0NFvAkmTVj7KMmuJq6uTB04QAVkRABEyc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qAXgC/Fm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c72Elt0F; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 58496114010E;
	Thu,  9 May 2024 18:48:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 09 May 2024 18:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715294930;
	 x=1715381330; bh=OKVeOREnD8AKUXWMNujwO3th/F6WTniDvhAZ6JV5oVY=; b=
	qAXgC/FmKcuELm68QueUb6iQcxyrjdbqVCW7COS69yemdCWpwkbtxwV3EZwG8HPI
	gDbExMR2+QiXaiHDAHPWxmaiSvpzvgMX/vOIrJPxj7FE/6FgXlsZNShahUGGc1LE
	avzfSrLjTuEsfLiox+qCCWsmzBs6+gY5UIG1WfMSI6Hq4xX5A0uWDPGPYNnOosf3
	rzlIIQ5rHlnZHxT71Dz1mmGVhAgVnS2I94W6v7pFkMEOHXTK+WEJz49acRO3Jg+y
	C26cBfZavYYWNHYkED9hMvT0uaPm/PwsVY1L/eadXtYPQFQbuw8VOsca+OCbieOk
	Hru9P3klRxJH7pvmtdPnVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715294930; x=
	1715381330; bh=OKVeOREnD8AKUXWMNujwO3th/F6WTniDvhAZ6JV5oVY=; b=c
	72Elt0FQk/MAq53UrqWwlZzWKpIaUHL38HRoWLXEngUCy0Xu0q3p9gEAYx73eJHN
	isQRGmPCrH9JCxsipWRnHxTKYfntCHW+H1Pjxcu8pK+zRPrHB8xZqjcndMHVWEwb
	sAxC4YrrjvdDjuET0NqRYssUAWmuGzcqA4NHwmhKBwTvv3ZW0jM2gjlFBcRDj6J/
	L9BJF/EbV94TcrwDibqxhMr7C+zwhAWrk1ilsOr3vcn93Y20xFxDC2fXBAp/VkYb
	Lf7Fal4RYXDXk4Qgzi36yu7tblNmD/JEj7uBJUoBlfay5BT9C6VpU8ONl4IeLBrT
	Au3UV4/DMeGQXHkMRqfKA==
X-ME-Sender: <xms:0lI9Zvtpck_BqnzreVQli3nBlV5QcK_7NM-vUa52By-gKuZkObltWw>
    <xme:0lI9Zge-SET5vUaMewYp_L6N7J8RojznDObD-YlbZXn9nREEV5FgoXIaS_wJ-TELw
    qUgL1URi0AvF1j2Cmo>
X-ME-Received: <xmr:0lI9ZiyLh6WOEYW81p__wWVKYWyNbkUTURg_PEdzFmDb0OgcgP-t4lOly-M1iN-lMb22t2lmdqL0zhYuBf0mNf_29fH5Ub0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeffkefgudek
    gefhhfejtedviedtgeetieekffeiudfhgeevteejvedtffdvkefftdenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:0lI9ZuM1M_toUPyBIEMxvRPB9izQWGMVXrPEAPvE1jn5CrPG01hZeQ>
    <xmx:0lI9Zv-nv7qA54azsh3qx19tzN9Z6teeyR8Yb-0L1Fsw6eT74yGFiQ>
    <xmx:0lI9ZuU9hDa86BKWgGP_e2cZjjCwWsot6ydmgvrniAcEGRCj1Q2iWg>
    <xmx:0lI9Zgeqox1xWpUxIrTJyYNdWcB2hD1ls3qld7D6G1-oASe1YNUHmQ>
    <xmx:0lI9ZgPYiZUrcKJ5LCeSCvXkCtoV2BqrprfHM7yotZBFIJvTWOILnBrX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:48:49 -0400 (EDT)
Date: Fri, 10 May 2024 00:48:48 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 00/11] media: renesas: rcar-csi2: Use the subdev
 active state
Message-ID: <20240509224848.GV1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509205129.GD6407@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509205129.GD6407@pendragon.ideasonboard.com>

Hello,

On 2024-05-09 23:51:29 +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Thu, May 09, 2024 at 06:13:50PM +0200, Jacopo Mondi wrote:
> > v2->v3:
> > - rcar-csi2: Collect v2.2 of [4/11]
> > - adv748x: enum_mbus_code: reduce the number of formats to the ones supported
> >   by the HDMI and Analog front ends;
> > - adv748x: enum_mbus_code: enumerate all formats on sink pad; enumerate the
> >   active format on the source pad
> > - max9286: Apply the format to all pads to enforce all links to have the same
> >   format
> > - max9286: Remove max9286_set_fsync_period() from setup
> > 
> > v2->v1:
> >   - Remove "media: adv748x-csi2: Initialize subdev format"
> >   - Add "media: adv748x-afe: Use 1X16 media bus code"
> >   - Tested with CVBS
> >   - address comments from Laurent and Niklas
> > 
> > A branch is available at
> > https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git/
> > jmondi/renesas-drivers-2024-04-23-v6.9-rc5/multistream-prep
> > 
> > As a follow-up to the recently sent
> > "media: renesas: rcar-csi2: Support multiple streams" series, this smaller
> > version collects some fixes and implement usage of the subdev active state
> > to simplify the R-Car CSI-2, ADV748x and MAX9286 drivers implementations.
> > 
> > Tested with GMSL on Eagle V3M
> > Tested with HDMI on Salvator-X
> > Tested with CVBS on Salvator-X
> > Boot tested on WhiteHawk V4H
> 
> Niklas, would you be able to runtime-test this on V4H ? The series is
> otherwise ready to be merged in my opinion.

I have run-time tested this on Gen4 and it works as expected. I also 
tested on Gen2 and Gen3 and all looks good.

Patch 7 needs to be moved earlier in the series to avoid breaking git 
bisect, but that move causes no conflicts so should be easy. With that 
fixed I too think this is ready to be merged. Nice work Jacopo!

> 
> > Jacopo Mondi (11):
> >   media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
> >   media: rcar-csi2: Disable runtime_pm in probe error
> >   media: rcar-csi2: Cleanup subdevice in remove()
> >   media: rcar-csi2: Use the subdev active state
> >   media: adv748x-csi2: Implement enum_mbus_codes
> >   media: adv748x-csi2: Validate the image format
> >   media: adv748x-csi2: Use the subdev active state
> >   media: adv748x-afe: Use 1X16 media bus code
> >   media: max9286: Fix enum_mbus_code
> >   media: max9286: Use the subdev active state
> >   media: max9286: Use frame interval from subdev state
> > 
> >  drivers/media/i2c/adv748x/adv748x-afe.c       |   4 +-
> >  drivers/media/i2c/adv748x/adv748x-csi2.c      | 145 +++++++++-----
> >  drivers/media/i2c/adv748x/adv748x.h           |   1 -
> >  drivers/media/i2c/max9286.c                   | 182 +++++++-----------
> >  drivers/media/platform/renesas/rcar-csi2.c    | 155 +++++++++------
> >  .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
> >  6 files changed, 271 insertions(+), 232 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

