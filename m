Return-Path: <linux-media+bounces-13565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C3090D643
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D61FA1C2453E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EDE157E88;
	Tue, 18 Jun 2024 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M069FmSO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53813C66F;
	Tue, 18 Jun 2024 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722299; cv=none; b=qbMX+UQ+ytDxlTba/h8vbhFYycr5kPDN5St6a+J1glPAK/m09v6HKD37yv96ZrQElMH0ue8L3NaZK1Ja0TDnlHeLprUnc2OGCb5IsM+lLHvwkLruQWv1QSN7H+XkQl9jH7R/gJQkSmXS2ayF2M6vW0qUSTUlebLhwS3pW3xG0/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722299; c=relaxed/simple;
	bh=KYv3NvuCWTj4RCOxWQM0SaCyrKyypHlYvyVAVvXvgw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDgstX5iKps/EZabKhZsAvO3qLqhEGLhAbtxZAyGmNM9iZEhfVZQ/PXo2tkQFkP+3aXtnE/gtNhyzf/RnaRa1vyQXlFPRthE73dcQItuwQQG51KvgEvr2eZe8D3xyUK6Seum60h+yvGO09IJOrc5MbPJgHq9Nv1pH3v2Grk1Dkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M069FmSO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE241564;
	Tue, 18 Jun 2024 16:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718722277;
	bh=KYv3NvuCWTj4RCOxWQM0SaCyrKyypHlYvyVAVvXvgw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M069FmSOtfXAzovhh9yzBf8rNO6nUG71R/siWg80daDfk0EuqYv/EAt1giX6gUqKl
	 bTqEOypDczCMe9pFbx/os9e8N7WrKsEZjgiFwH2j206ygkDBJ4p4FpJ1RLkRA5Bj0d
	 0LpPsORkP3N/iY5ysZf1JLMbFladrKOnBWMi/QYc=
Date: Tue, 18 Jun 2024 17:51:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Add support for RAW10
Message-ID: <20240618145113.GC17243@pendragon.ideasonboard.com>
References: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWxxzn2t2qURChY=62GmDPKbQku63uRCCg=CDRCeOwJTw@mail.gmail.com>
 <20240618144101.GB17243@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618144101.GB17243@pendragon.ideasonboard.com>

On Tue, Jun 18, 2024 at 05:41:03PM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Wed, Apr 17, 2024 at 03:34:36PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Apr 17, 2024 at 2:06 PM Niklas Söderlund wrote:
> > > Some R-Car SoCs are capable of capturing RAW10. Add support for it
> > > using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
> > > format to express RAW10 unpacked to users.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > Thanks for your patch!
> > 
> > I am no VIN or V4L2 expert, but the register bits LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > @@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
> > >         case MEDIA_BUS_FMT_Y8_1X8:
> > >                 vnmc |= VNMC_INF_RAW8;
> > >                 break;
> > > +       case MEDIA_BUS_FMT_Y10_1X10:
> > > +               vnmc |= VNMC_INF_RGB666;
> > 
> > The actual meaning of this bit is not uniform across all SoCs.
> > On R-Car V3U it means (partial) 16 bpp, on R-Car Gen3 it means 18 bpp.
> 
> The INF bits have different meanings depending on the VIN input. What
> you refer to above for V3U is for the CSI-2 input, while for the rest of
> Gen3 you quote the values for the parallel input. Value 111 is
> documented as "prohibit" for the CSI-2 input on the rest of Gen3.

To be precise, for V3U the documentation indicates "Input from Channel
Selector", not CSI-2. V3U has no parallel input.

The macros for the INF bits mix names for different types of inputs, it
could be a good idea to clean this up.

> > > +               break;
> > >         default:
> > >                 break;
> > >         }

-- 
Regards,

Laurent Pinchart

