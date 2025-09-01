Return-Path: <linux-media+bounces-41473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A2FB3ED34
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 19:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83BD71A80B24
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361C332F771;
	Mon,  1 Sep 2025 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mObl3k4H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB2431AF21
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 17:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746674; cv=none; b=sIUOaxQHnMMrSBnggxzpilIAHkeFaLZce2kJ664VvUZI8tbR4iprJIgIvthmJwgbCztuK4h7MQbpE0MuGOtTbadRyoRNszIOgBHQgtW4iC2GwlsIs9AwUJD2luqo2B33S+N20SkOHtO3/PK7VHxcOdg9Pa/N+SFvR3RwwWqYGJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746674; c=relaxed/simple;
	bh=ETjEiJRZVPtzmswFnSW3VokxXNtyaPr06Khzz86YGf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2tkl02J9oVsanqFrn5T6iZp19RHsRRogI+6Ad2IBm6O0LWMODiYPNk1/HxWieYi0gGX4r6AogN01qCeXNIceYkqsVwADq8OcSfu2u/A6or+MPCXADR3x4gSgIrYTSQxfzbLs2KAAsLdljkCJecC/jfSrJoKBaDQr3lwgk+6uyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mObl3k4H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58249F52;
	Mon,  1 Sep 2025 19:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756746603;
	bh=ETjEiJRZVPtzmswFnSW3VokxXNtyaPr06Khzz86YGf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mObl3k4HNs75sWIAd7TNotKw51yigPPr71+tncrsF9IpCtnM5AVdJT45A44lyT08h
	 31/K2sJwi7lzyesbxVENOI4uDCvEhV8a103mYY6eHqoLi99czrv8T5lbKS2JA+/9zh
	 n9JOOLLaQd/HpfeNtTJ+4C5UvCGhz3vubvZnVj8g=
Date: Mon, 1 Sep 2025 19:11:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 40/66] media: Document enable_streams and
 disable_streams behaviour
Message-ID: <6cptynkjq6zujvzmgbl5lwphodd2opgnvrac4ql27ayw6y5x7r@6ddxkpcsahks>
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

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:41PM +0300, Sakari Ailus wrote:
> Document that enable_streams may start additional streams and
> disable_streams may not disable requested streams if other related streams
> are still enabled.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Can be fast-tracked outside of this series even

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
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,
> --
> 2.47.2
>
>

