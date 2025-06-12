Return-Path: <linux-media+bounces-34600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BCCAD6C87
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9ABF189FF7C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D78B22B8D9;
	Thu, 12 Jun 2025 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XXuVRmap"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59F1F92E;
	Thu, 12 Jun 2025 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721619; cv=none; b=qKaALhyxqLhpbLWpX63FeXOJ/ZVYedpFEj+Y+5nWDyT80iQaq7T6VlUV0U/lnQR3e5Oj7iD3v8C0VWsYCz9a7qg/+MDrWuELz1tuCb+oaWSz4bBZ+mBs0+1oPMogT2u58bPO/FOeEAl2wBJUhby7MduvAsFV3GlPnFuxj1fv/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721619; c=relaxed/simple;
	bh=R+bE56ypbZBkGlHIlv3Cr3WEiW5cqDAMlUzTaz9EWiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3+FvLZGQOuopgC4NOe+MV8rvdwePSo4lwlbJmSy4yhl9fh9tLXOPa2OGYM8UBZVZL1unWPCInpN72QevGMdoik195SdWHmNh8LFRr0nNooQ4hIInSnfuBIr7lTXlVNGEOOPFaiVNOjPZvNvIltlg3Ym/b6uZ69oVVvIyYeip80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XXuVRmap; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41C42B5;
	Thu, 12 Jun 2025 11:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749721605;
	bh=R+bE56ypbZBkGlHIlv3Cr3WEiW5cqDAMlUzTaz9EWiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXuVRmapqT6rFu40ersf+ioMHVvW0neoj2B7NpA5dCSMpojWoK+uAm+t6CUeNSKo3
	 xDYCX65+/4YjwRs9GwmopkEDuJM70qhbsPpcoe8RhGFtXFkSQ+S6gvSA8CD1NMXIiL
	 EUekjF5daoJb+9gEIEacJRwyuxlv0+NAVATCXO+s=
Date: Thu, 12 Jun 2025 11:46:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
	LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 2/3] media: vsp1: Reset FCP for VSPD
Message-ID: <4ieuh56kqcx47mqcp3m3gwusazyklsm73cftkb5cxry5en2gh2@rrsjmkd5qwcz>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-2-9f17277ff1e2@ideasonboard.com>
 <20250611232956.GQ24465@pendragon.ideasonboard.com>
 <CAMuHMdVU0JJDff539YBMhM8xNQVf5Ufiw1D9TXitzsGWXPBMAg@mail.gmail.com>
 <20250612093757.GA4533@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612093757.GA4533@pendragon.ideasonboard.com>

Hi

On Thu, Jun 12, 2025 at 12:37:57PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 12, 2025 at 11:33:39AM +0200, Geert Uytterhoeven wrote:
> > On Thu, 12 Jun 2025 at 09:19, Laurent Pinchart wrote:
> > > On Mon, Jun 09, 2025 at 09:01:43PM +0200, Jacopo Mondi wrote:
> > > > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > > >
> > > > According to H/W manual v1.00, VSPD must be excecuted
> > > > FCP_RST.SOFTRST after VI6_SRESET.SRST. So this patch adds it.
> > > > VSPDL is not applicable.
> > >
> > > According to the R-Car Gen3 H/W manual v1.00, the FCP must be reset
> > > after resetting the VSPD, except for the VSPDL. Do so.
> >
> > "Rev.1.00"
> >
> > Stil, that is a very old version. "Rev.2.40" is 6 years younger...
>
> The good thing is that both document the reset procedure the same way
> :-)

I didn't want to modify Matsuoka-san original commit message, but if
it's appropriate to do so I will

Thanks
  j

>
> --
> Regards,
>
> Laurent Pinchart

