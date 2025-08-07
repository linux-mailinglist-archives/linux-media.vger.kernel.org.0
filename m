Return-Path: <linux-media+bounces-39061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB731B1DAB1
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 17:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96E913AE5B3
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 15:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C89266581;
	Thu,  7 Aug 2025 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dF4lS6TQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B8219E7F7
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580065; cv=none; b=YbPPJfX7T2XB9oOfH4d16m57pEeUHmRlYYG+agLransoXz4HEpbNw/19uyJd9yelXqQpAqYVh+NaRCf04ba881P6On7t4/F8nGUAUFsgiEkQ4lY3mpO7v3Qn6yzqgjVjwUhoidTFkCmAerj7CopbjkRnLxUz+xqFjdeuRSqKB7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580065; c=relaxed/simple;
	bh=Y1veVBdfttZ0n8O8/DFke4giERwe+Pqsn7D3fSR4KXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSYymDhQ39HewatIIkhCKtOhq7sDvQ5dLTX481bnwqj0YPg6aQSZIkc5rG4UBhVx31uA8h7gwB0XlDTow7inSdz251CgD6dhPGIw+QmFgRvapQik8TRnefRLPm90M/wc1rJcHrxmKIX1Pk0QSABokKygsWnlTedhs+MH4/EKo9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dF4lS6TQ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b070b3b7adso20019271cf.3
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1754580063; x=1755184863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ47Gr8gkEiE1UAUhOYLFnuVTwG9WsgpCV3QwDVVHt0=;
        b=dF4lS6TQlXGGqhDKm3FQA0rtkCwkAsVl31PM/dcWpsAO4yO6ppax1+RDA99gHJh0Q7
         W+lxSfFTiyxbDZ1XzQnfdXdOzQMrV7Hyn6+LUn/rPYSvRIfUGXgf+Nue7zzDMgXFP+mK
         +5ExGVhzrlNkx2YAKN1gYzcMyfrlR525UiDClAxiUBR7zWul0Et97EhUKhc4XMXQtxox
         CCfQPukY1PxnV3Gqja9GtZBBxlBsO/WUoKAOtp8TCYSUKPGL/fMTPgZYA7bO8UOKHwtH
         19aTqw4Ou8t84Xc1Fbbo73I6cNecDsBrNogTUvtNFFV5Hz3CAuNyMb6OTP2emcRWf/xp
         7/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754580063; x=1755184863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ47Gr8gkEiE1UAUhOYLFnuVTwG9WsgpCV3QwDVVHt0=;
        b=f6o5SynqS7KFxCRhR7bPGZth8Cnwb5HHuu7ooUmyltSxmt7B1OzCbTxkPkqNsWS47W
         InW23liIHYOgK4r+1agRCUpgDsqiiqfZHQKIRVZ/0BN3/HguGvlcvZvTpbNysWt6f9LL
         sR39evuvK1SuXDoUVer8Lc4URrRD9faUDgd3AESjsq4bHyY8vGKR3+YlAKNih2rkmD71
         VmirIZgXTj9hhUSQ8VtjlZqVkdN6sPkhXKItKfBweMiir7xsK9JiYjK1fDfGSj5V44An
         yt7AjPNFgG8Aq6PjAPQ83Jlczr3kI9vd8Qzc6lDkhoPrN0JNSzWSkM/Lwb5anj2zVwUm
         ecVg==
X-Forwarded-Encrypted: i=1; AJvYcCVQK0WJI14NR8JWwsco0lxzoy+Q8oZXAnaA2Qb1dF8Jj/ELHQ4uYwtccagEMz4kN64ezXK485qDJnf10g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8EvotOukTSjw+95LgQcucxDzq78qsgdoOxkd9lXg8E8/jzwmc
	pahq8IZ4M4N2M3mH6y1rQcjQG7DeclT6Yh+7PC60Fr/9ARyG6C3X532wd1XTMlh9PhOkmV8A7LL
	5gjk=
X-Gm-Gg: ASbGncutQg5ZFE9yLz2EN/FDIAILnE8/g5LaudPZj8YQlSCS1m+RA0dbmykLQzUUt0r
	g6tMxzYCRjxGKze1MTXoMM9lGSGhCgpxBF/ZJZlnkecQUjPRjoDSJfYi2hj66EjbIMkvdi6yqxk
	/WDMyH7NsY0sIE8F1rMRpNnsPe5g49/blA7ZKAUIwWSHjqjwp6bhHzvCBHpKDN3aN0lnPWkv1S8
	SYGneBYsOlzx7tJdYcjOdtel0AOMdGITcZtZOXENZ1iSwkIyoESe4Gvuasell6fi2+kU7+BDdsZ
	kuy21Vx4NvRJXQa6F6N3lxejmRD1tpJi1XamIQ8xOqKJw/iYheAO9MIowqc1lbs4lkZ0ih/tRd+
	xVabqKQmglGhmjMD1mNl+S0A=
X-Google-Smtp-Source: AGHT+IHTHGt/s+i73eewgbmgPrmRvtfQE+p+rUr62KfvDejHSjzMR+pCi9prvIX7ii4QzRZGCt4mZQ==
X-Received: by 2002:a05:622a:1ba6:b0:4b0:889b:bc60 with SMTP id d75a77b69052e-4b0912cb723mr97700351cf.10.1754580062647;
        Thu, 07 Aug 2025 08:21:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f595525sm970567085a.2.2025.08.07.08.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:21:02 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:20:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 2/4] USB: core: support eUSB2 double bandwidth large
 isoc URB frames
Message-ID: <428b0027-a9f6-40bd-8f3b-f148c1cc4912@rowland.harvard.edu>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
 <20250807055355.1257029-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807055355.1257029-3-sakari.ailus@linux.intel.com>

On Thu, Aug 07, 2025 at 08:53:53AM +0300, Sakari Ailus wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> eUSB2 double isochronous in bandwidth devices support up to 6 transactions
> per microframe, and thus doubles the total bytes possible to receive per
> microframe.
> 
> Support larger URB isoc frame sizes for eUSB2 double isoc in endpoints.
> 
> Also usb_endpoint_maxp() returns a natural number so there's no need to
> assume it could be < 0.
> 
> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/urb.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 7a76d5a62db1..6f8f3d751854 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -372,6 +372,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>  	struct usb_host_endpoint	*ep;
>  	int				is_out;
>  	unsigned int			allowed;
> +	bool				is_eusb2_isoch_double;
>  
>  	if (!urb || !urb->complete)
>  		return -EINVAL;
> @@ -434,7 +435,11 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>  		return -ENODEV;
>  
>  	max = usb_endpoint_maxp(&ep->desc);
> -	if (max <= 0) {
> +	is_eusb2_isoch_double = dev->speed == USB_SPEED_HIGH &&
> +				usb_endpoint_is_isoc_in(&ep->desc) &&
> +				ep->eusb2_isoc_ep_comp.bDescriptorType &&
> +				le16_to_cpu(ep->desc.wMaxPacketSize) == 0;
> +	if (!max && !is_eusb2_isoch_double) {
>  		dev_dbg(&dev->dev,
>  			"bogus endpoint ep%d%s in %s (bad maxpacket %d)\n",
>  			usb_endpoint_num(&ep->desc), is_out ? "out" : "in",
> @@ -467,9 +472,13 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>  			max = le32_to_cpu(isoc_ep_comp->dwBytesPerInterval);
>  		}
>  
> -		/* "high bandwidth" mode, 1-3 packets/uframe? */
> -		if (dev->speed == USB_SPEED_HIGH)
> -			max *= usb_endpoint_maxp_mult(&ep->desc);
> +		/* High speed, 1-3 packets/uframe, max 6 for eUSB2 double bw */
> +		if (dev->speed == USB_SPEED_HIGH) {
> +			if (is_eusb2_isoch_double)
> +				max = le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> +			else
> +				max *= usb_endpoint_maxp_mult(&ep->desc);
> +		}
>  
>  		if (urb->number_of_packets <= 0)
>  			return -EINVAL;
> -- 
> 2.39.5
> 

