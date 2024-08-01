Return-Path: <linux-media+bounces-15716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71F945186
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 19:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1431F2358E
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 17:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428811B9B28;
	Thu,  1 Aug 2024 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DuO94Ghj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1190D143743;
	Thu,  1 Aug 2024 17:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722533451; cv=none; b=m8IqKO53wDGRFFsdkmxp0pERV9V34OsSpbfb+MON9Sf7VrEVlW2XQtUZuIUeWSuB/IoaBTkixtaoqHEedsaJhzzyBZAWo6RX801H4KrUct60We2v4w/QdJqtmYXD68P+isq32BmEaPh90xz5thy8fun/xn+ZYWX2MgrNyobEJhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722533451; c=relaxed/simple;
	bh=55DhPcRDuHS5ZpJARG/nkE7q25pYrGpOdf2s6UK6Pxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBoEpjnKT0dIebvoqCZhj0yx98vdo3fi5YRW76Q4B4u9kqTlq2G1vMY9FAhMM1P0hkibeSyhf9erkxbMWwWifiUs6Gew7SLEyl0duM/HmdjP0guF+lvMq8nXW1ROKyjy9Hu7dk6d+fPfUMd58XvIdmZSTIGv5qovV5LA6oFuksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DuO94Ghj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 408D1667;
	Thu,  1 Aug 2024 19:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722533399;
	bh=55DhPcRDuHS5ZpJARG/nkE7q25pYrGpOdf2s6UK6Pxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuO94GhjJoHXRM+sCAEccIi2c9T2/6OGnRjs0Aav44GhSzzHJMHLANynwEmfd1cE4
	 IlJ8v0+PMvu6GdVJKBj8AENST4iqD0iZ3NsgZk8OwCa0wWyNgfQyEuAvDCn17ugNfA
	 PXeHqO+Cp3uzVQj5sZkj/KZg5tS5ZmmdicJp+/JI=
Date: Thu, 1 Aug 2024 20:30:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricard Wanderlof <ricardw@axis.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] drm: bridge: adv7511: Accept audio sample widths of 32
 bits via I2S
Message-ID: <20240801173026.GC18732@pendragon.ideasonboard.com>
References: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
 <dad42efe-7895-50f5-6bba-9b8abb97f34a@axis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dad42efe-7895-50f5-6bba-9b8abb97f34a@axis.com>

On Mon, Jul 29, 2024 at 10:15:55AM +0200, Ricard Wanderlof wrote:
> 
> Hi,
> 
> I submitted the patch below a while ago (two months) but as far as I can 
> make out it has not been included. There was an initial concern from 
> Dmitry Baryshkov which was subsequently addressed but no other objections. 
> 
> On Tue, 28 May 2024, Ricard Wanderlof wrote:
> 
> > 
> > Even though data is truncated to 24 bits, the I2S interface does
> > accept 32 bit data (the slot widths according to the data sheet
> > can be 16 or 32 bits) so let the hw_params callback reflect this,
> > even if the lowest 8 bits are not used when 32 bits are specified.
> > 
> > This is normally how 24 bit audio data is handled (i.e. as 32 bit
> > data, with the LSB:s unused) and this is also reflected in other
> > bridge drivers which handle audio, for instance sii902x.c and
> > synopsis/dw-hdmi-i2s-audio.c .
> > 
> > Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > index 61f4a38e7d2b..4563f5d8136f 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > @@ -101,11 +101,14 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
> >  	case 20:
> >  		len = ADV7511_I2S_SAMPLE_LEN_20;
> >  		break;
> > -	case 32:
> > -		if (fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
> > -			return -EINVAL;
> > -		fallthrough;
> >  	case 24:
> > +	case 32:
> > +		/*
> > +		 * 32 bits are handled like 24 bits, except that the lowest
> > +		 * 8 bits are discarded. In fact, the accepted I2S slot widths
> > +		 * are 16 and 32 bits, so the chip is fully compatible with
> > +		 * 32 bit data.
> > +		 */
> >  		len = ADV7511_I2S_SAMPLE_LEN_24;
> >  		break;
> >  	default:
> 
> I recently discovered that the maintainer for the ADV7511 driver (in the 
> I2C) framework is not included by the get_maintainers script, so perhaps 
> this is the reason?
> 
> Otherwise, please enlighten me on what I need to do to get this patch 
> accepted!

I have no experience with HDMI audio, so I didn't comment on your patch.

Hans, is this within your area of expertise ?

-- 
Regards,

Laurent Pinchart

