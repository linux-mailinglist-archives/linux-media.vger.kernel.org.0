Return-Path: <linux-media+bounces-18578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BE798689C
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 23:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C50A1C20E35
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CB3158205;
	Wed, 25 Sep 2024 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PwHwQPYz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7834C91
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300853; cv=none; b=g3nH4kTKsapsO3hXvY6b+v2dEr+BJRFHqP4I/xTzErm8PfAMfPaRt1yeARUVW11UZr+OPnWz9gcHNerW9VbtMkeEEwSofvTPRqGhRjJ1Ogn5LtOPadFU0f4CQogZKLG9S8lTCqDAgOL04u9nu3WjgixbnP5rZGlBLYbtwkexIFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300853; c=relaxed/simple;
	bh=QDZTTUzSh/D1DhNYS53UtwSK5Aykg55QX1IWlQNLMFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B15bXCjkPjhhgrYlYqXlRpVSEAbE1kUCDLMYjNZkgXjAycAx3oXj4f/vFna4/xQrB1L+TJU2C5LUDKvHodm7icI8syF861zIe3jJNQ1Wbm8WAqI58RISce51+uvFtzmhZK151lk55jJEpPyNaAKQCoF9fPkPpSenfa9jCynXdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PwHwQPYz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80EFECDB;
	Wed, 25 Sep 2024 23:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727300762;
	bh=QDZTTUzSh/D1DhNYS53UtwSK5Aykg55QX1IWlQNLMFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PwHwQPYz/QyBj8omYGu2PJ31uo6sNHtPVOIJrcnFLwKgropb4CYmdEK02W7z2Q3Kt
	 VP4tpE2wb6dbi+rkeXfmx9d2DwwkQk006sb833G2qrp6Z8IqYCe78WT1GifMarYXwt
	 /6xTo3LO88/Ndq/TfwYWRgbvUFOj/QZO3xGUYEYU=
Date: Thu, 26 Sep 2024 00:47:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v3 3/3] media: Documentation: Improve
 v4l2_subdev_{en,dis}able_streams documentation
Message-ID: <20240925214728.GB11070@pendragon.ideasonboard.com>
References: <20240920073503.22536-1-sakari.ailus@linux.intel.com>
 <20240920073503.22536-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920073503.22536-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Sep 20, 2024 at 10:35:03AM +0300, Sakari Ailus wrote:
> Document that callers of v4l2_subdev_{en,dis}able_streams() need to set
> the mask to BIT_ULL(0).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  include/media/v4l2-subdev.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index ff63fb6046b1..2f2200875b03 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1685,6 +1685,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>   * function implements a best-effort compatibility by calling the .s_stream()
>   * operation, limited to subdevs that have a single source pad.
>   *
> + * Drivers that are not stream-aware shall set @streams_mask to BIT_ULL(0).
> + *
>   * Return:
>   * * 0: Success
>   * * -EALREADY: One of the streams in streams_mask is already enabled
> @@ -1715,6 +1717,8 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>   * function implements a best-effort compatibility by calling the .s_stream()
>   * operation, limited to subdevs that have a single source pad.
>   *
> + * Drivers that are not stream-aware shall set @streams_mask to BIT_ULL(0).
> + *
>   * Return:
>   * * 0: Success
>   * * -EALREADY: One of the streams in streams_mask is not enabled

-- 
Regards,

Laurent Pinchart

