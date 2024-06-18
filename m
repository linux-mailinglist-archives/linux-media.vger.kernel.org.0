Return-Path: <linux-media+bounces-13562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394790D5FB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC1A281383
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE73515AAC8;
	Tue, 18 Jun 2024 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IcDqWoPL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C4E15A874;
	Tue, 18 Jun 2024 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721693; cv=none; b=jNvGi2CXySpJ29BQP7FhgSUG7XADgz/dpcE7F1jWNLOXR/LE/xiSlHTx8TKzFbDTa1EMpsWPYxQM8/kxcoHtDRfWpr4dU4BegQ/NNszV+U/VjSJVZEboirRb6frtd68SWh8oGaFZaiE8p2zJJu4pSLaKS8UVny1k9PWPiVyXNjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721693; c=relaxed/simple;
	bh=A/KYmU66Xq13z8gs9UdYA6svl8qr4hl13P5zLmqWiwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCCbEUeLT3kZ4zSjqnpHDE3VcCsSDRrh3wW9L/K6jTm5quG7wLD225catx1DOQYcPuj1iO9KbrG7v+AtyXDPs1L/QmX2V1Jf/h9jXTXBCFjqg1a4lqP1q18FhpB2qfUTuzvFEsZKHeMCD46yLP0IZCDUYAAq4o8fSVdq+n5aI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IcDqWoPL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4351E564;
	Tue, 18 Jun 2024 16:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718721666;
	bh=A/KYmU66Xq13z8gs9UdYA6svl8qr4hl13P5zLmqWiwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcDqWoPLbJLAZV4heNOzq4meKdEEZKwVpyVXkbSKtLN/Z02iZ+amlFH7uDu3jGu2g
	 Po/4cxa3Oy5mP3Fln8KN2T8cmbEg6ZeCbTxh0gg26EswZd+tBfE7rLbQ5PAidB1bZN
	 5pSBhSElVcqyBf3Zh4KjuBlExb4ui14Lk6rbSs28=
Date: Tue, 18 Jun 2024 17:41:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Add support for RAW10
Message-ID: <20240618144101.GB17243@pendragon.ideasonboard.com>
References: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWxxzn2t2qURChY=62GmDPKbQku63uRCCg=CDRCeOwJTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWxxzn2t2qURChY=62GmDPKbQku63uRCCg=CDRCeOwJTw@mail.gmail.com>

Hi Geert,

On Wed, Apr 17, 2024 at 03:34:36PM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 17, 2024 at 2:06 PM Niklas Söderlund wrote:
> > Some R-Car SoCs are capable of capturing RAW10. Add support for it
> > using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
> > format to express RAW10 unpacked to users.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> I am no VIN or V4L2 expert, but the register bits LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
> >         case MEDIA_BUS_FMT_Y8_1X8:
> >                 vnmc |= VNMC_INF_RAW8;
> >                 break;
> > +       case MEDIA_BUS_FMT_Y10_1X10:
> > +               vnmc |= VNMC_INF_RGB666;
> 
> The actual meaning of this bit is not uniform across all SoCs.
> On R-Car V3U it means (partial) 16 bpp, on R-Car Gen3 it means 18 bpp.

The INF bits have different meanings depending on the VIN input. What
you refer to above for V3U is for the CSI-2 input, while for the rest of
Gen3 you quote the values for the parallel input. Value 111 is
documented as "prohibit" for the CSI-2 input on the rest of Gen3.

> > +               break;
> >         default:
> >                 break;
> >         }

-- 
Regards,

Laurent Pinchart

