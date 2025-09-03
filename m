Return-Path: <linux-media+bounces-41738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF48B42BF3
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 23:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12FD3BB0B9
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9002EBBA8;
	Wed,  3 Sep 2025 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vztf87wj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81572EBB89
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756935000; cv=none; b=oAaS8ETcYotX+ciKb9701dV6yShcVhd0wEPidu375RatG/87mRImRIMN1ml4igvZA/ZCtiQDPv7QGu0+A+Tg492AV3xc03Au6o6Li4BTVWTGcTP0Oe48MfFAosqHLjz55+W04ETpTOsmAHcVMqrinA/WPhImUBYWABsuaf7EmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756935000; c=relaxed/simple;
	bh=oCiyzq52/ZtRwo9JpfJBzpVpzYKaZjipLdGuP8jqfm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPIEH3ju+Zy1tadEPR5ANcSM7LV4DPW5NebPycWz3+H/as5pKpd4ANngYUwSiwbUkrDxsfWgVpZ9fqA4Y133xoPehLjssvjfZHG2Z+BEPf/CJb7CeXAt+jQRap71dXrdzon0GR1rZNXwgSqIaytor/Lx5QE7Dv3bykK5FaTwdVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vztf87wj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D43BC6F3;
	Wed,  3 Sep 2025 23:28:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756934926;
	bh=oCiyzq52/ZtRwo9JpfJBzpVpzYKaZjipLdGuP8jqfm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vztf87wjW8RhsSEsYPzu46DomRk4zijEXbXDF9qUdVpAg7FXI9Q4vrRlaL7fQksp4
	 oxd5y4gjO48ohqqJwkEE3r22+ZAgvWlSdtE2nIyfPBAes4VoDvZL1PI5pRTPo59jtM
	 Z8PLxoIHvojZMo4LIQSxfk+neTArDPkuNNjNo3hw=
Date: Wed, 3 Sep 2025 23:29:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 40/66] media: Document enable_streams and
 disable_streams behaviour
Message-ID: <20250903212935.GA3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-41-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-41-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Aug 25, 2025 at 12:50:41PM +0300, Sakari Ailus wrote:
> Document that enable_streams may start additional streams and
> disable_streams may not disable requested streams if other related streams
> are still enabled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 4b28086808c9..96a9c869ffb1 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -814,6 +814,10 @@ struct v4l2_subdev_state {
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
>   *
> + *	Starting the requested streams may require starting additional
> + *	streams. Streams that are started together due to hardware are called a
> + *	stream group.

I initially interpreted this as meaning that, to start the requested
streams at the hardware level, the caller may need to start additional
streams. That is, the .enable_streams() call may not have any effect
until other streams are also started by the caller.

> + *
>   * @disable_streams: Disable the streams defined in streams_mask on the given
>   *	source pad. Subdevs that implement this operation must use the active
>   *	state management provided by the subdev core (enabled through a call to
> @@ -823,6 +827,9 @@ struct v4l2_subdev_state {
>   *	Drivers that support only a single stream without setting the
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
> + *
> + *	A stream is only disabled once all streams in the stream group are
> + *	disabled.

But this implies it's the other way around. A clarification is needed.
Which behaviour are you trying to document ?

>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart

