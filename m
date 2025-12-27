Return-Path: <linux-media+bounces-49603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1978CDFED2
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 16:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB69A3013EFD
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 15:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ABA2DCF7D;
	Sat, 27 Dec 2025 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S0+0gGFh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC82D9EDB;
	Sat, 27 Dec 2025 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766851180; cv=none; b=RfBfVDEVK7iALl5CwlWRMLPVJcWByWMnEI3wz1T7kWDEzWhPVUM1oLkA46bef/8f3QYMlo3zxgojOUwZf2erWXl4/tkPmiDT/ntXL3ckn9vPc+ou3Cvp8dD9qCbaq04dlZFQUO+h65B6pZTqH/VLPqNIW4xUIcUNm/F+fiW+b3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766851180; c=relaxed/simple;
	bh=R2rmLTi9vn2lgBtejXag+47w3U8fYpKbyF+C7PWdnKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZR13K673CzKDR4kvNN4CRETaQfgQgLkSMSj7Mjqtv+lKRl3EIQa3wTyhMU5OlESPVgL1Zt1xraM7+T0rxRvywRub2J3+lL5qA4SkWycMuLVRWrBsaIqMIpWhDEMWw/sPvZBwIWCaTVzTxpv0Ie+QH0olpHRCRWIbSEP2CxewkzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S0+0gGFh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4AF4FBB;
	Sat, 27 Dec 2025 16:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766851161;
	bh=R2rmLTi9vn2lgBtejXag+47w3U8fYpKbyF+C7PWdnKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0+0gGFh3VGdYLpx9noYFo6tbM6qvhDCXu4uFYd79owpV6ak1VlQbUP9CriniNfT5
	 XL8SBYuIY43PaRUm4eo2YodAk4HQl1vxWVJ/uANN0cnasEq2/5ReQJ7Ng/G9mnRMuH
	 0V0spYCBEJcK2elAIxIUjHp5Z/iEqGTXLQKAtN1Y=
Date: Sat, 27 Dec 2025 17:59:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Fix possible ERR_PTR
 dereference in rzg2l_cru_get_virtual_channel()
Message-ID: <20251227155918.GM4094@pendragon.ideasonboard.com>
References: <20251227121946.67935-1-alperyasinak1@gmail.com>
 <20251227130514.GA21104@pendragon.ideasonboard.com>
 <CAGpma=5i21ObECvQL9EZRQUJ3rfXTZ=78CFkFtLmwoq+Te7c1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGpma=5i21ObECvQL9EZRQUJ3rfXTZ=78CFkFtLmwoq+Te7c1w@mail.gmail.com>

On Sat, Dec 27, 2025 at 06:33:56PM +0300, Alper Ak wrote:
> > What makes you think this can happen ?
> 
> media_pad_remote_pad_unique() explicitly documents that it can return
> -ENOTUNIQ when multiple links are enabled and -ENOLINK when no connected
> pad is found.
> 
> The return value is dereferenced immediately via remote_pad->index in
> the v4l2_subdev_call() without any error check.
> 
> While these situations may not occur for this driver, I have
> seen other media drivers perform IS_ERR() checks after calling the same
> function, so adding the same defensive handling here would be
> consistent with existing usage.

Unless there's a situation where an error can be returned by that
function in this driver, I don't see a need for this change. If it's not
broken, don't fix it.

> Laurent Pinchart, 27 Ara 2025 Cmt, 16:05 tarihinde şunu yazdı:
> > On Sat, Dec 27, 2025 at 03:19:44PM +0300, Alper Ak wrote:
> > > media_pad_remote_pad_unique() can return ERR_PTR(-ENOTUNIQ) or
> > > ERR_PTR(-ENOLINK) on error situation.
> > >
> > > The current code dereferences remote_pad without checking for
> > > these error cases, which could lead to invalid memory access.
> >
> > What makes you think this can happen ?
> >
> > > Add IS_ERR() check before dereferencing the pointer.
> > >
> > > Fixes: d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel information")
> > > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 162e2ace6931..bf7d96841c78 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -411,6 +411,9 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> > >       int ret;
> > >
> > >       remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
> > > +     if (IS_ERR(remote_pad))
> > > +             return PTR_ERR(remote_pad);
> > > +
> > >       ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
> > >       if (ret < 0 && ret != -ENOIOCTLCMD) {
> > >               dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");

-- 
Regards,

Laurent Pinchart

