Return-Path: <linux-media+bounces-31198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F7A9EEFB
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 089B43A577B
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94D5263F47;
	Mon, 28 Apr 2025 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K18NFg5D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700DE25E800;
	Mon, 28 Apr 2025 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745839529; cv=none; b=e9hz+nBbfhU9JKcFzr4ZN2vc7jmPj1UFQNUKx5434GM5Co/IcxW5Nb4nB0PDRBBWX9LtTNUKgI3LSg4uouagfFECmbxvML0OonK5xHZvW/ofcHTD/mdDDLFy52vJBMAcdREf/waL7XUNgbFPMBUQDvjVk//nAJgn3PD3y/A6GwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745839529; c=relaxed/simple;
	bh=MItWLrljEADyLxdVtRlTVGsKMlCfzsO96jbvdW/cImE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNvpN+GuQF0sODbRFMb7xazs/VNxmFw1U5XN/HdpEpFtID3WWwUCARgZMbc3dBAiJgnSK+NSFjDTG5H5sVEOUr9KLyQP178txje6ys31DUcC55fNAaYAect+M5j+8UVJEukTcAeuN61Smbh9God1KgEM6XOm/GsIvJvJp7M7mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K18NFg5D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94F80475;
	Mon, 28 Apr 2025 13:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745839517;
	bh=MItWLrljEADyLxdVtRlTVGsKMlCfzsO96jbvdW/cImE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K18NFg5DbwdGQoCvHiF6X3A7bQxHaHwR8tm6lKf0zIjdDIkVZn07YI81vs0jwJxKR
	 WO3aDZyN6/1Js/L4m1iRR02AKeoWutt1Ns4n/Z9et9P9sNxdblSS7LmaBUln8z+hrK
	 atLCRDdX5kV1mo/eQqTx+stLF/UO+8mtmhJiaQ/8=
Date: Mon, 28 Apr 2025 14:25:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
Message-ID: <20250428112516.GG3371@pendragon.ideasonboard.com>
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428095940.GE3371@pendragon.ideasonboard.com>
 <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>

On Mon, Apr 28, 2025 at 12:17:54PM +0100, Lad, Prabhakar wrote:
> On Mon, Apr 28, 2025 at 10:59 AM Laurent Pinchart wrote:
> > On Mon, Apr 28, 2025 at 10:52:08AM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Simplify the `rzg2l_fifo_empty()` helper by removing the redundant
> > > comparison in the return path. Now the function explicitly returns `true`
> > > if the FIFO write and read pointers match, and `false` otherwise, improving
> > > readability without changing behavior.
> > >
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 067c6af14e95..97faefcd6019 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
> > >       if (amnfifopntr_w == amnfifopntr_r_y)
> > >               return true;
> > >
> > > -     return amnfifopntr_w == amnfifopntr_r_y;
> > > +     return false;
> >
> > So the function always returned true. This seems to be a bug fix, please
> > add a Fixes: tag. The commit message should also make it clear that
> > you're fixing an issue, not just simplifying the code.
>
> No, the function returned true only if the pointers matched;
> otherwise, amnfifopntr_w == amnfifopntr_r_y would return false. I was
> simply removing the repetitive pointer check and directly returning
> false at the end of the function, as we can be certain at that point.
> Hence, I did not add a Fixes tag. Am I missing something?

Oops, you're right, my bad.

> > Personally I'd have written
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 067c6af14e95..3d0810b3c35e 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
> >         amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> >         amnfifopntr_r_y =
> >                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> > -       if (amnfifopntr_w == amnfifopntr_r_y)
> > -               return true;
> >
> >         return amnfifopntr_w == amnfifopntr_r_y;
> >  }
> >
> > but that's also a bit of a style preference.
>
> I wanted to keep this consistent with the rz3e_fifo_empty(). If you
> prefer the above I'll do that in v2.

Up to you.

-- 
Regards,

Laurent Pinchart

