Return-Path: <linux-media+bounces-18577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC3598689B
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 23:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC902B213FC
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF86C15AAB6;
	Wed, 25 Sep 2024 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XVb1J1Yo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DEF18452A
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300821; cv=none; b=NQ5GRPH80ohY2H2CMiKE9LynCLeP4FtUQWCiimmpN1R6rezuwEv51k80pm2EtPE1Nwa/G+gaGugjH94mNgPaLWIyW7ZoBOgc/ygRU/4LEemSgYF8OIbj3Riy119RmYO6xun54fBHmzit6lU1YdUgf/qjJ3iohlDzhyGVjdw9ocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300821; c=relaxed/simple;
	bh=g6PBn7djUoTJkGCL+SBMP6lCsNt9S2JHsLk2hfPblm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcgW1DtqXHGFmxPVadild1qsV5Eq8leA9738IficaMJWAu5WHb5WRBHKpjJQIZlET2yNLiXdrbHT/IYTqJqXuxiaU61feJCSCI8jqEERee5gFHAN3NwarlHQmb0Rj7gm9Ipev9QKiLgvg0FXKBOYdkRYfmF3weEU56ENSOpm1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XVb1J1Yo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 808DD7E2;
	Wed, 25 Sep 2024 23:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727300729;
	bh=g6PBn7djUoTJkGCL+SBMP6lCsNt9S2JHsLk2hfPblm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVb1J1YoQ+ZTOC0nkQOwEu3xQqAVu4ubm5g26aEenp5NJnVK9HuxiDdE3ecsDnIXu
	 09hAd1oGHn03CrseXBuxODmTgEkpPUXO4J3/iKQuamPlaCTSv0zuzzE40tMYqxrYMP
	 kQiV5CGU6ZA2lUP1VJ2Xz5CcIRMC0zeweF9dRuTQ=
Date: Thu, 26 Sep 2024 00:46:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v3 2/3] media: Documentation: Update
 {enable,disable}_streams documentation
Message-ID: <20240925214654.GA11070@pendragon.ideasonboard.com>
References: <20240920073503.22536-1-sakari.ailus@linux.intel.com>
 <20240920073503.22536-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920073503.22536-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Sep 20, 2024 at 10:35:02AM +0300, Sakari Ailus wrote:
> Document the expected {enable,disable}_streams callback behaviour for
> drivers that are stream-unaware i.e. don't specify the
> V4L2_SUBDEV_CAP_STREAMS sub-device capability flat. In this specific case,

s/flat/flag/

> the mask argument can be ignored.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  include/media/v4l2-subdev.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 3cc6b4a5935f..ff63fb6046b1 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -834,11 +834,19 @@ struct v4l2_subdev_state {
>   *	v4l2_subdev_init_finalize() at initialization time). Do not call
>   *	directly, use v4l2_subdev_enable_streams() instead.
>   *
> + *	Drivers that support only a single stream without setting the
> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> + *	argument.
> + *
>   * @disable_streams: Disable the streams defined in streams_mask on the given
>   *	source pad. Subdevs that implement this operation must use the active
>   *	state management provided by the subdev core (enabled through a call to
>   *	v4l2_subdev_init_finalize() at initialization time). Do not call
>   *	directly, use v4l2_subdev_disable_streams() instead.
> + *
> + *	Drivers that support only a single stream without setting the
> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> + *	argument.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart

