Return-Path: <linux-media+bounces-19247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4A9947F2
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 036021C244D8
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 12:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB731D8E1F;
	Tue,  8 Oct 2024 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="iXVETm9W"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939E18C916;
	Tue,  8 Oct 2024 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388884; cv=fail; b=Rg+JSGB641GzqTxEMKRzR1jAW5TT6giTNfCU7C6QEsCG9wuWqhchojcA7VhEmn4/O9+3Sg0yC4HvBc33aW0OoOg5iRtT30lOBvlDioi5yA8/YDT911zAICwk8fbFU/kahd1PYYgehNanRoK728wpkcq3RZhXTABjrbEoaAm9nH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388884; c=relaxed/simple;
	bh=+d0eLXInjvHlTjxaMdjW4cbRjM5yhIeUeOjYqZre0y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH/AEkjomnGucbxOu47SQcPYa1Hj3T6JaTfsqMqYwnqWfGTayHW7sninBUM+jewU8si/ve2J8xw9zG6gPgriYsq0RNKauqpVXapF1CHW2RNMh1s3iyIeE/WwoeiWw8nmooYm5EOMVxmsvI1Jf0NxQcp+b2jsjDlrKZ1r71PN05o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=iXVETm9W; arc=fail smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XNF3g4bYYzyVQ;
	Tue,  8 Oct 2024 15:01:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1728388879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O4ko4aMiR/8zA/ySgAtjzjh0LCYvBYOIbNPGaV1Gw/o=;
	b=iXVETm9WTSRhmSIUCak+x/OnBlPHfpLwHFNA6X52CjNg+tTEyu9s/l+YuJjbOqcZGdMEAN
	s8vuj0Ggdt6yHAsmAq3cOSqoD4KDQ3mwnWJyDDVugSscLsw3TwXQuqcnMayXYcEzT6fZO7
	+3aSOaZCWE9XQa6qtK5GiASqLWl6yag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1728388879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O4ko4aMiR/8zA/ySgAtjzjh0LCYvBYOIbNPGaV1Gw/o=;
	b=jIC6YZGAwI+DzH2WQHOPuFKex4/K1tNUg2tXRK7VMG8vVqo+lpYBBzc3feQUpjUM49SaFd
	E2EFZuJkPnrMvHMpPo6I5RJvDrdkrpU8K2bCsrmZc93wZvyUB05utwAl9cBk9g5o5K3oym
	eESSzpYynrupBOee1VaqfNK3aM5v0kE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1728388879; a=rsa-sha256; cv=none;
	b=OCT4Vb//1vd0uFyrU8Uk+ZMJiBRNtSwndVHx7PfokpxNXOsa0YSjHuY43haZxbzyq5Xpbn
	ty/yodmJtqkMUZJI4b9gFK3PuICFeTtMhpG2UhLXkP7dTNU5B4JoncqsA7ckt++CIv3eCX
	IKgeEZoI5sEo/8HHT9klfyCGhTaXvsM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2D5F5634CBD;
	Tue,  8 Oct 2024 15:01:19 +0300 (EEST)
Date: Tue, 8 Oct 2024 12:01:19 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: uvcvideo: Refactor uvc_query_ctrl
Message-ID: <ZwUfD5Kfzv93-46f@valkosipuli.retiisi.eu>
References: <20241008-uvc-readless-v1-0-042ac4581f44@chromium.org>
 <20241008-uvc-readless-v1-2-042ac4581f44@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-uvc-readless-v1-2-042ac4581f44@chromium.org>

Hi Ricardo,

On Tue, Oct 08, 2024 at 07:06:15AM +0000, Ricardo Ribalda wrote:
> Move the query control error logic to its own function.
> There is no functional change introduced by this patch.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 45 ++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 853dfb7b5f7b..a57272a2c9e1 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -67,30 +67,12 @@ static const char *uvc_query_name(u8 query)
>  	}
>  }
>  
> -int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> -			u8 intfnum, u8 cs, void *data, u16 size)
> +static int uvc_query_ctrl_error(struct uvc_device *dev, u8 intfnum, void *data)
>  {
>  	int ret;
>  	u8 error;
>  	u8 tmp;
>  
> -	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> -				UVC_CTRL_CONTROL_TIMEOUT);
> -	if (likely(ret == size))
> -		return 0;
> -
> -	if (ret > 0 && ret < size) {
> -		memset(data + ret, 0, size - ret);
> -		return 0;
> -	}
> -
> -	if (ret != -EPIPE) {
> -		dev_err(&dev->udev->dev,
> -			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> -			uvc_query_name(query), cs, unit, ret, size);
> -		return ret ? ret : -EPIPE;
> -	}
> -
>  	/* Reuse data[0] to request the error code. */
>  	tmp = *(u8 *)data;
>  
> @@ -135,6 +117,31 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	return -EPIPE;
>  }
>  
> +int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> +		   u8 intfnum, u8 cs, void *data, u16 size)
> +{
> +	int ret;
> +
> +	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> +			       UVC_CTRL_CONTROL_TIMEOUT);
> +	if (likely(ret == size))
> +		return 0;
> +
> +	if (ret == -EPIPE)
> +		return uvc_query_ctrl_error(dev, intfnum, data);
> +
> +	dev_err(&dev->udev->dev,
> +		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> +		uvc_query_name(query), cs, unit, ret, size);

This message should probably be printed after the check below.

I'd actually move the below check before the ret == -EPIPE check as it's a
successful case (and changing the condition to <= would make the ret ==
size check redundant).

> +
> +	if (ret > 0 && ret < size) {
> +		memset(data + ret, 0, size - ret);
> +		return 0;
> +	}
> +
> +	return ret ? ret : -EPIPE;
> +}
> +
>  static const struct usb_device_id elgato_cam_link_4k = {
>  	USB_DEVICE(0x0fd9, 0x0066)
>  };
> 

-- 
Kind regards,

Sakari Ailus

