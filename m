Return-Path: <linux-media+bounces-23347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC219EF5B1
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 18:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D23B61943267
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 17:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC979222D4C;
	Thu, 12 Dec 2024 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ll9K7lng"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E83D2F44
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023165; cv=none; b=i6gpixyZgF12YVhQ2NXu3DEqVI5RHzHOjMsSFzKyvnTVjCeQd4G6AULQYR94bJTgJuQwP1SRRRlVAfTNo9lPdRfzQ4BFLgb4/sOCJmvc6arWAJT0qkPBzUHpL5kVBS5cmdK7WKNOUtY2EgVVX+hl54sJJ1cXtX6QYO7a3JGhFo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023165; c=relaxed/simple;
	bh=CLaEX7RkVKoXVilhx2yHmJrFCVZdKfMkA+ahWOHGPGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da+L5F6LADIx3qSZBQ0op8B9WRZc2Gstu++2/ro4pJGYjXvgEFdyTpekJaie0boQrr/DGQoUNvGfbMMRE+yhPP33LHMieA/17O0z6s8HMkln5VfDxt9FuqaOZb74nvIhCeCu5aDr+gornKgwKlWhiKlL/KU4IhDjqvqXl5Kat2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ll9K7lng; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13F3918D;
	Thu, 12 Dec 2024 18:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734023128;
	bh=CLaEX7RkVKoXVilhx2yHmJrFCVZdKfMkA+ahWOHGPGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ll9K7lngt4OHbYUJFR/TdCYIbzPlZNkZf64oBKRXrdrUkN9DfJG9LghTN25oG4vEn
	 Lkh63YCJfet+L7fNn+k9IGBVLAdSwskC2fP8HMTY8kCyWVswAx4kAYXFw1BNAk7PJI
	 7HnEfPkf+v6LkQ38GRN5RTkj9gm1+rFzSOSIMuXs=
Date: Thu, 12 Dec 2024 18:05:58 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v7 2/5] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <byaegzecfzq3ljacntxxovp6o23ivv62kxluf7udjwjmef54vr@n2tn7zjikdfp>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210075906.609490-3-sakari.ailus@linux.intel.com>

Hi Sakari

On Tue, Dec 10, 2024 at 09:59:03AM +0200, Sakari Ailus wrote:
> Add link_freq field to struct v4l2_mbus_config in order to pass the link
> frequency to the receiving sub-device.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
>  include/media/v4l2-mediabus.h         |  2 ++
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 9fe74c7e064f..88fbd5608f00 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -508,13 +508,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
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
>  	union {
>  		struct v4l2_mbus_config_parallel parallel;
>  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> --
> 2.39.5
>
>

