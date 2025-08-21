Return-Path: <linux-media+bounces-40571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF8B2F87B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60303AC4AD1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434AF32277F;
	Thu, 21 Aug 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K+dJIJQf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9B322765
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780083; cv=none; b=ixnWBcYN8vQoODHFFy8uQ8MzqP1FTZuijDfLBW7Jc8eCNyrppTshbg0dAm9+131BtD8BJbo3yHaKj3K1Ekcbw4ZglPtONfuCmjBNCCGpHV4B/g/2kvHPojR/PyC7EE8l4q+G6u+jz4yB70Hu+bWLDleQ4pzuHOBT4owF+bg9l/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780083; c=relaxed/simple;
	bh=c3ToNwqDDuULk30ffxLvTFPn+y7HhJ7ngN5mIJAlygQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9+J8U0WLY6xYizORPWnAa6qKnF3bVaKkmHKUVrFLeyIgxHEUJ9YAGK8lq+0iKEfBS7DQXv4hTsRRMSlLPIzjA64tTcL3JE8qgKdj0tSHTgUD5xx1XLqfoOoZYTBEdxNYCQ8hGqrB+SyLIx/OP2cyJp7l7osIjByngHsnH/8pKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K+dJIJQf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5FEF4EFF;
	Thu, 21 Aug 2025 14:40:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755780020;
	bh=c3ToNwqDDuULk30ffxLvTFPn+y7HhJ7ngN5mIJAlygQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+dJIJQfZEc4NTPyvawN+WrpDIJa0aeZ+e/QYWvXIJf5ME4oe7hybQG2aihHmp9gP
	 z32gmv3MNgLMzBd1BykHrsX3T9rdQ3Mvcr7pvWrBYaEO+cKzJi2sju49S7TK4eoGc4
	 8RnQC6IbrzxwkdDUywe6q6zE7jg5/2VyYE1aTxZk=
Date: Thu, 21 Aug 2025 15:40:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 3/3] media: v4l2-common: Update v4l2_get_link_freq()
 documentation
Message-ID: <20250821124056.GD8865@pendragon.ideasonboard.com>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821121207.552993-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821121207.552993-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Aug 21, 2025 at 03:12:07PM +0300, Sakari Ailus wrote:
> Document that v4l2_get_link_freq() obtains the link frequency primarily
> by calling the get_mbus_config sub-device pad operation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-common.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index ab0ce8e605c3..c387deffbdd0 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -567,9 +567,11 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>   *	 times two on D-PHY, 1 on parallel. 0 otherwise.
>   *
>   * This function is intended for obtaining the link frequency from the
> - * transmitter sub-device's pad. It returns the link rate, either from the
> - * V4L2_CID_LINK_FREQ control implemented by the transmitter, or value
> - * calculated based on the V4L2_CID_PIXEL_RATE implemented by the transmitter.
> + * transmitter sub-device's @pad. It returns the link rate, primarily obtained
> + * through the get_mbus_config sub-device pad operation or secondarily through
> + * either from the V4L2_CID_LINK_FREQ control implemented by the transmitter, or

"through either from" should be either "through either" or "either
from".

> + * value calculated based on the V4L2_CID_PIXEL_RATE implemented by the
> + * transmitter.

I think this can be clarified further:

 * This function obtains and returns the link frequency from the transmitter
 * sub-device's pad. The link frequency is retrieved using the get_mbus_config
 * sub-device pad operation. If this fails, the function falls back to obtaining
 * the frequency either directly from the V4L2_CID_LINK_FREQ control if
 * implemented by the transmitter, or by calculating it from the pixel rate
 * obtained from the V4L2_CID_PIXEL_RATE control.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>   *
>   * Return:
>   * * >0: Link frequency

-- 
Regards,

Laurent Pinchart

