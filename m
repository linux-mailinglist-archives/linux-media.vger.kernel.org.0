Return-Path: <linux-media+bounces-49423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8373ECD9AF4
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 15:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF655303E642
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A6B344042;
	Tue, 23 Dec 2025 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="deDeggn9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99034330300
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766500498; cv=none; b=WDwkmpsh81jNOtQUBR8EQYx2LaIzrQh4CNSOjbMjFrC+4Hvdvjw7G+6SHvhFn4tBBWTzG58KPdc9avD6IvXAM5bwQePwyf8KBheqgEe/4axiwMXHs1xC2W1PKFCFCTLCSmffKOmK7soVxhGtL4Y754evTj7XhW6chf80Tyzwtsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766500498; c=relaxed/simple;
	bh=7BwaoOBz6s6GNyC567VzmPAZOq3j6wQqh/54zRWvqQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAVHEt43ztPRrcEMBIGT+6yPsw4MXBVppqi+M4xOlO52OG8L1r9WTIQpgKaa6srjazHarGQZPFI6gP56aQNo4HSlfCX/Jl/OPc0E4YQ8fHou4tFzPxEntZ3NE4ViDMt3qtGJzN8/3yMEN6HupDUrPVkyXBOPFhVU9A+uq4fvubQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=deDeggn9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 91077557;
	Tue, 23 Dec 2025 15:34:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766500480;
	bh=7BwaoOBz6s6GNyC567VzmPAZOq3j6wQqh/54zRWvqQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deDeggn91rZyTeNSZy4qhKIpco7Ip+n6brgWnZxbqe4ouk0MaIAMlqowBxiOs9MWh
	 tFLYLvC+6RJDXSUdeDkzHeSCT2QcJ1XL1+fJ4vB0P0FuBZpxWglftnn/nGHngZKMFF
	 SFYSG/lETS7f+bAVo7CUXC6+bZmQNOA7rKnZ5dUE=
Date: Tue, 23 Dec 2025 16:34:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 03/12] media: mt9m114: Use aptina-PLL helper to get
 PLL values
Message-ID: <20251223143433.GH9817@pendragon.ideasonboard.com>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-4-hansg@kernel.org>
 <20250603105712.GA27361@pendragon.ideasonboard.com>
 <f7d0ab89-f119-4ff9-a78d-00c51d45bb43@kernel.org>
 <20250603140557.GB12117@pendragon.ideasonboard.com>
 <40f968d7-2c88-4eb4-b9ce-604de03bf7be@kernel.org>
 <20250627180639.GE24912@pendragon.ideasonboard.com>
 <86d8d80e-8ce5-477e-be81-f8a46a021d5b@kernel.org>
 <20250629204655.GA2059@pendragon.ideasonboard.com>
 <77dc854a-8ff8-4b1a-ae28-ed39a0118aeb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77dc854a-8ff8-4b1a-ae28-ed39a0118aeb@kernel.org>

Hi Hans,

On Tue, Dec 23, 2025 at 02:27:50PM +0100, Hans de Goede wrote:
> Hi Laurent,
> 
> First of all sorry for dropping the ball on this series.

I won't blame you, it happens to me way too often too.

> I'm preparing a v4 of this series now.
> 
> On 29-Jun-25 22:46, Laurent Pinchart wrote:
> > On Sat, Jun 28, 2025 at 11:27:23AM +0200, Hans de Goede wrote:
> 
> ...
> 
> >>> Could you share the PLL configuration you obtain with the 400 MHz and
> >>> 768 MHz limits ?
> >>
> >> 400 MHz out_clock_max, working setup:
> >>
> >> [   40.136435] mt9m114 i2c-INT33F0:00: PLL: ext clock 19200000 pix clock 48000000
> >> [   40.136453] mt9m114 i2c-INT33F0:00: pll: mf min 4 max 38
> >> [   40.136463] mt9m114 i2c-INT33F0:00: pll: p1 min 4 max 8
> >> [   40.136473] mt9m114 i2c-INT33F0:00: PLL: N 2 M 40 P1 8
> >>
> >> 768 MHz non working setup:
> >>
> >> [   28.388940] mt9m114 i2c-INT33F0:00: PLL: ext clock 19200000 pix clock 48000000
> >> [   28.388955] mt9m114 i2c-INT33F0:00: pll: mf min 4 max 38
> >> [   28.388966] mt9m114 i2c-INT33F0:00: pll: p1 min 4 max 16
> >> [   28.388976] mt9m114 i2c-INT33F0:00: PLL: N 2 M 80 P1 16
> > 
> > Hmmm...
> > 
> > Re-reading the documentation, I wonder if I had misunderstood the PLL.
> > 
> > There is no single clear description of the PLL (it would be too easy),
> > but there's informatio scattered in multiple places. One of them states
> > that
> > 
> > Fout = (Fin*2*m)/((n+1)*(p+1)).
> > 
> > Note the *2 multiplier. In another location, multiple frequencies are
> > defined:
> > 
> > fSensor = (M x fin) / ((N + 1) x (P + 1)) (max 48 MHz)
> > fWord = fSensor x 2 (max 96 MHz)
> > fBit = fWord * 8 (max 763 MHz)
> > 
> > The '+1' for N and P are understood, they relate to the values
> > programmed in the registers. From the point of view of the PLL
> > calculator, we should reason with that offset, with
> > 
> > Fout = (Fin*2*m)/(n*p).
> > 
> > and
> > 
> > fSensor = (M x fin) / (N x P)
> > 
> > This leads me to believe that the PLL is organized as follows:
> > 
> >         +-----+     +-----+     +-----+     +-----+     +-----+
> > Fin --> | / N | --> | x M | --> | x 2 | --> | / P | --> | / 2 | -->
> >         +-----+     +-----+     +-----+     +-----+     +-----+
> > 	                                fBit       fWord        fSensor
> > ext_clock    int_clock   out_clock                             pix_clock

Could you capture this in a comment in v4 ?

> > Seen this way, the maximum limit for out_clock should be 384 MHz, and
> > the P factor should be hardcoded to 8 for CSI-2 output.
> > 
> > Does that make sense to you ?
> 
> Yes that sounds right and setting out_clock_max to 384MHz works.
> 
> I've set out_clock_max to 384MH and limited P to min = max = 8
> for the upcoming v4 of this series.

-- 
Regards,

Laurent Pinchart

