Return-Path: <linux-media+bounces-11593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60A8C84E5
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 12:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EE221C216E7
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 10:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40B9282FB;
	Fri, 17 May 2024 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zqad8Klp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580D779E4
	for <linux-media@vger.kernel.org>; Fri, 17 May 2024 10:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715941910; cv=none; b=hS/2QT3XZoZaPG718CDi6ReL5DSZM0x21oG4cvDSHgkp5ciD/U745UJ9jfm8fVQStCTOPgAsINbcKI0G0Y+2Y8EfhxT/o4Ns7Ipf0z5vqtsiRK1IVq+nm2IK7PWnAo4hS3QxOL510WoAx74mUkLJ81fG2CYzmk4rs2CZOI9bMg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715941910; c=relaxed/simple;
	bh=9D+RpSDP8/hGpge0wz79oP6bm3z8qutvm8EsMKr9Zx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyvSNZbrGngl7afn6V6Xra2tZstCF8YJ8HkGLQuKwlHNHtBntqOeFv5Hv5Ir5QeX+tAxeFHSdCHPtKGjIKr5vy5R8ALu6Bsn0/lKucPvB2I1VrEWJa4csga6K45f0u/DonH1ioZUY3AEcfmlRQiHCcFOiJ0MW2Cq8kiweR6ABWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zqad8Klp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [149.14.240.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A34082E;
	Fri, 17 May 2024 12:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715941897;
	bh=9D+RpSDP8/hGpge0wz79oP6bm3z8qutvm8EsMKr9Zx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zqad8KlpQe2v4Sti4pSpBpvhiT+u57rgdG7ZDzpZo5q3Uoofg8ZrBAeKuvLUzN9Zo
	 D6Wiz9Y7sdC+00V68hCz4dghY9aLGoeGAcRWv7aSA3akiwLol6ANYsWd7G0Kt6S6hz
	 PnAK3S0gyaFMydeyVnj+PJbcrf+MXZ+d9iASKh4w=
Date: Fri, 17 May 2024 12:31:43 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v6 2/4] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <auogsnxxlad6e43phqhtu4njj5vzps5njmvuk7fcmiitnj4imn@dms3jrdfyi3s>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
 <20240516122539.30787-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516122539.30787-3-sakari.ailus@linux.intel.com>

On Thu, May 16, 2024 at 03:25:37PM GMT, Sakari Ailus wrote:
> Add link_freq field to struct v4l2_mbus_config in order to pass the link
> frequency to the receiving sub-device.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
>  include/media/v4l2-mediabus.h         |  2 ++
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 01650aed7c30..ff859a340c5d 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -506,13 +506,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  			     unsigned int div)
>  {
> +	struct v4l2_mbus_config mbus_config = {};
>  	struct v4l2_subdev *sd;
> +	int ret;
>
>  	sd = media_entity_to_v4l2_subdev(pad->entity);
> -	if (!sd)
> -		return -ENODEV;
> +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> +			       &mbus_config);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		return ret;

Should we do like what we did with endpoint matching ? (let alone the
fact we then backtracked on that.. :)

WARN to encourage tx drivers to implement get_mbus_config and
advertise the link freq through it ?

>
> -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> +	return mbus_config.link_freq ?:
> +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 5bce6e423e94..cc5f776dc662 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -148,6 +148,7 @@ enum v4l2_mbus_type {
>  /**
>   * struct v4l2_mbus_config - media bus configuration
>   * @type: interface type
> + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
>   * @bus: bus configuration data structure
>   * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
>   *		  Used if the bus is parallel or BT.656.
> @@ -162,6 +163,7 @@ enum v4l2_mbus_type {
>   */
>  struct v4l2_mbus_config {
>  	enum v4l2_mbus_type type;
> +	u64 link_freq;

I will retaliate that link_freq has different meaning for serial and
parallel busses, and it would feel more natural having something like

mipi_csi2.link_freq
parallel.pixel_clock

or do you think it's an overkill ?

>  	union {
>  		struct v4l2_mbus_config_parallel parallel;
>  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> --
> 2.39.2
>

