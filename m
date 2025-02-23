Return-Path: <linux-media+bounces-26672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDFA40FA7
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 17:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5673B1895804
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 16:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092D87405A;
	Sun, 23 Feb 2025 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p1s/O5UW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114E41C6BE;
	Sun, 23 Feb 2025 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740326810; cv=none; b=P4H82ayVhoY5zDApjxis0vrBSHpSh8s78xrHlTij5s6XIAxx9Qf/dnyc6vzi07rDKhLrHi9mY4hhGNJxbl4GKVGPeXJeuJ4gnYULe9SlUhPqJksg0PnqmOzj7A2DRXCzCdEjHQ64KuWAu+pVkWu9B1qJVq+XrJLaIkof75ltzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740326810; c=relaxed/simple;
	bh=wcO689TqxH0eyMtlqxGrFAZ+bBEGdJoFNYF/hJd9eqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWrs3+abc9/N5RzMhcScT7KqkkOLCYvqLA9tKiGGtqOsOHqDbcKePwCU1r7gpVHOIYzobW2dBvr3djueY5Fhskk3trHmhlouXRn9yTJS9DhOIkkwDGebr88FFZXmzi3rlylwuSs1ySPe+12JygWY3CDtmXqAVoArXkdtftIGY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p1s/O5UW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D67F1496;
	Sun, 23 Feb 2025 17:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740326722;
	bh=wcO689TqxH0eyMtlqxGrFAZ+bBEGdJoFNYF/hJd9eqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p1s/O5UWFLXt5ajzyuDlVFn8Czg2jO0fKs5f0tUWZO9iK04j2WwEi683iOAqbgHZo
	 vwc6ytVdURbiaR+2hwDkGaNkxXI/w40GCcgCgwpWxWlNEhBz45hpXf7cUoTuW5u0le
	 M7FK9f1Rr0LSvKz2h3ix6G+jTHyZsfFvy9BYnOPQ=
Date: Sun, 23 Feb 2025 18:06:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 3/6] media: uvcvideo: Add a uvc_status guard
Message-ID: <20250223160631.GD27463@pendragon.ideasonboard.com>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
 <20250206-uvc-granpower-ng-v3-3-32d0d7b0c5d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206-uvc-granpower-ng-v3-3-32d0d7b0c5d8@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Feb 06, 2025 at 07:47:02PM +0000, Ricardo Ribalda wrote:
> It helps will help will the error handling of PM functions.

This is a one-liner without a user. Bundle it with the patch that makes
use of the feature, the result will be easier to review.

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvcvideo.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index bc87e1f2c669..be0817da538c 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -763,6 +763,8 @@ void uvc_status_suspend(struct uvc_device *dev);
>  int uvc_status_get(struct uvc_device *dev);
>  void uvc_status_put(struct uvc_device *dev);
>  
> +DEFINE_GUARD(uvc_status, struct uvc_device *, uvc_status_get(_T), uvc_status_put(_T))
> +
>  /* Controls */
>  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>  

-- 
Regards,

Laurent Pinchart

