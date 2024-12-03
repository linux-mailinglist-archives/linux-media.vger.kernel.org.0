Return-Path: <linux-media+bounces-22550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F6A9E25CB
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 17:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5AF169B5A
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 15:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923321F890B;
	Tue,  3 Dec 2024 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HASqnMMs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328D1F76AD;
	Tue,  3 Dec 2024 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733241540; cv=none; b=FuWYv4EHcaEqBXfNjbJ/yR5fSeavOzNkLg+CJs3rjYQKRslW/eqwZD7ogU0hHL6M9rIsCqzQ4e0OQq7S+7FC9QjSSexgYLRVYsG48+5O3YvV4dLUXhMo/C5oaPQQBnI4XBZShaKnf9iS0org4MkXsCo6xCHdeZe/1eifiOoJfAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733241540; c=relaxed/simple;
	bh=aNIYOm+BmWWU2hBdJEYlLVbxaTdWTBaUP7RaDpWKdts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYOK3l4aaScP9eqKQCFhmzb8lzIR7QaI2kBKLUJZCGsKWHz23qw9ttt/iKeAKXrpBRuGqmnDGSdzYNh0rYX1T17VJ0D2XHGX16aCtOn7OX3RVi5PF4RZrKVBnOAIAobg68ak2pOvb86sJxmS54BwjqWNzD4E0sWqAbKB9r/0Y5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HASqnMMs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DD324CE;
	Tue,  3 Dec 2024 16:58:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733241508;
	bh=aNIYOm+BmWWU2hBdJEYlLVbxaTdWTBaUP7RaDpWKdts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HASqnMMspCV6QhzACwvbRATGG2CxDEtCBg0DPNjfj7VYbJBSpuXN9qkBHh25UfpPa
	 k6NGQ4AJD8Q1JSKXt3/XRW4yX2rnl+qeUiasiZkiPoObEx6S54anBZaxvFpa6kcs1M
	 uxWUUtMb7fghXAczjVImTsldDPBj84DEMjNU1JYQ=
Date: Tue, 3 Dec 2024 17:58:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 2/2] media: uvcvideo: Add more logging to
 uvc_query_ctrl()
Message-ID: <20241203155843.GD26936@pendragon.ideasonboard.com>
References: <20241128-uvc-readless-v5-0-cf16ed282af8@chromium.org>
 <20241128-uvc-readless-v5-2-cf16ed282af8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128-uvc-readless-v5-2-cf16ed282af8@chromium.org>

On Thu, Nov 28, 2024 at 08:53:42PM +0000, Ricardo Ribalda wrote:
> If we fail to query the ctrl error code there is no information on dmesg

s/ctrl/control/

> or in uvc_dbg. This makes difficult to debug the issue.
> 
> Print a proper error message when we cannot retrieve the error code from
> the device.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll update the commit message, no need to resend.

> ---
>  drivers/media/usb/uvc/uvc_video.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 67f714bca417..a650d886e922 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -117,8 +117,12 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	error = *(u8 *)data;
>  	*(u8 *)data = tmp;
>  
> -	if (ret != 1)
> +	if (ret != 1) {
> +		dev_err_ratelimited(&dev->udev->dev,
> +				    "Failed to query (%s) UVC error code control %u on unit %u: %d (exp. 1).\n",
> +				    uvc_query_name(query), cs, unit, ret);
>  		return ret < 0 ? ret : -EPIPE;
> +	}
>  
>  	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
>  

-- 
Regards,

Laurent Pinchart

