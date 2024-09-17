Return-Path: <linux-media+bounces-18331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F381197B081
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 15:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D6B11C20752
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AD017B4E9;
	Tue, 17 Sep 2024 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KceMzZkj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD8417ADFF
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726578091; cv=none; b=A1OajXA6U+WrLv72NoiiJmUJPVDHxmN6BzmgrcZzcDbs2ueyoNYlrdJMl1AB2cvvA4xIyX3RwiaIQbCJAr9SD6WGtr1ituffB5YXP7tTMjXWHviP3V1k0HPm17n1DEnIwAW5n5OIdt74fgoD9zfsNhQ6S+zrgS8m8AIYZ79XNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726578091; c=relaxed/simple;
	bh=qn26PPUmLnFy2sPy0MURRhfS1BPx19fr9dkFSlU1qKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJK0T77uApzQ4UZNVRPm4kKtRHZGhvJUkmDh2WqIThE/cd2UJ5EsPW4jSCJMFWmqfWdfdgagxmxm1Z2CeO157hk6QlH0+vsJGK2WN//PkISnGEaT0hRDv2bqlX096IYiO7tj7Fn0vdFEdehN8kq7evMO7oVCy4F4SdpFVZyGY+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KceMzZkj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (62-46-121-59.adsl.highway.telekom.at [62.46.121.59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C636514;
	Tue, 17 Sep 2024 15:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726578000;
	bh=qn26PPUmLnFy2sPy0MURRhfS1BPx19fr9dkFSlU1qKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KceMzZkjqVH0tTyLMV1EFQqk8MI+6D5Kdx01Z999u3aBcWldWbpKOWmtGubu15zD/
	 rIi2S1YXZlNAc6g0VyQPnVKWBD8uywasZvWMi/YPcyytgJjCTtRm/GSdMS7hxUPm2l
	 GI+/Sa92Ed5Jufr9CRrAJhAmPpmBKhX474Bc22ek=
Date: Tue, 17 Sep 2024 16:00:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/2] media: Documentation: Update
 {enable,disable}_streams documentation
Message-ID: <20240917130047.GC17350@pendragon.ideasonboard.com>
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
 <20240917124345.16681-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917124345.16681-2-sakari.ailus@linux.intel.com>

On Tue, Sep 17, 2024 at 03:43:45PM +0300, Sakari Ailus wrote:
> Document the expected {enable,disable}_streams callback behaviour for
> drivers that are stream-unaware i.e. don't specify the
> V4L2_SUBDEV_CAP_STREAMS sub-device capability flat. In this specific case,
> the mask argument can be ignored.

Wouldn't it be better to use BIT(0) in that case to simplifiy
interoperability with stream-aware devices ?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 3cc6b4a5935f..67a6e6ec58b8 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -834,11 +834,19 @@ struct v4l2_subdev_state {
>   *	v4l2_subdev_init_finalize() at initialization time). Do not call
>   *	directly, use v4l2_subdev_enable_streams() instead.
>   *
> + *	Drivers that support only a single stream without setting the
> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to
> + *	be concerned with the mask argument.
> + *
>   * @disable_streams: Disable the streams defined in streams_mask on the given
>   *	source pad. Subdevs that implement this operation must use the active
>   *	state management provided by the subdev core (enabled through a call to
>   *	v4l2_subdev_init_finalize() at initialization time). Do not call
>   *	directly, use v4l2_subdev_disable_streams() instead.
> + *
> + *	Drivers that support only a single stream without setting the
> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to
> + *	be concerned with the mask argument.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart

