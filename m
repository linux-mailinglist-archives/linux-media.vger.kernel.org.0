Return-Path: <linux-media+bounces-36100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0151AEB9CB
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 16:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC1994A1C6D
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 14:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60142E336C;
	Fri, 27 Jun 2025 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="adPe40Td"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE82E2EF2
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034223; cv=none; b=t1Mfn78Fqu6JulxAkzLStwMti+4zaSjdrqX3+6iyYbUiBZyjz28TgJYePKCcMYuDC7vk5gpU6Zjmkc5V3nb8bUWreZ3ARx+sj9fwGXY/wWlS802GSXtLFyJtA4QRArAkJJ7jvw0UFkUF/lnBqno+PlP3PWi0de0tMSkv0tdi7J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034223; c=relaxed/simple;
	bh=QXCsL7vS7mFvhzNXf8DjS7hrvdMO+odeJz0t39ie72o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3a1n7pf3ZCi7yi9WIDhlkQwQZ3K8MlwS6h+VkzGBx918+Zbq0JIbrdWFLAufoa8G+lHkNGtI2pP39HX9YS1FDbG99U0fHxn8XYj53+aTYZwPTplrouJZVfuFtI4rlQ4zuj0KuKJC5U2+Ts1H/3U2qlgLO9o/ekj2/a0Tx0f6u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=adPe40Td; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fada2dd785so26345536d6.2
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751034220; x=1751639020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9NXmX4vbwGCbqn6D1k17tKEXOD0obRo+KVbdSlDBXM=;
        b=adPe40Td5LzEDQsf9wp+elHaMnh38hiBs8g4L+qg3Js2dxU/jv4kyg1i87sytO5AG/
         KIgysClKYU6sCfe4akhWzbV0eHDts4OqoBQY8oH+lDPq3KZpIIvHbx0kf8zBLKurAWIQ
         peDE/DophJo9kr1PDHk0QJMNC6BwQuCSwocNwxxX2MVas4DvfoqAkFwyKF6vLP9UODZs
         ln4zjTGeOsUuCxP3HF7fw2tYmTAuXOid+N7VaQUyvUVG1CCgNSo8enrA3lcdBmLwUCCO
         4sIy8sMb5/IIqLanC3/D+PGl88lIKFAJwgrVMkP5l+y9kqbam/EZ49rK/9hlzHsW7aA5
         I7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034220; x=1751639020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9NXmX4vbwGCbqn6D1k17tKEXOD0obRo+KVbdSlDBXM=;
        b=NJQTcfwt8cAS8hGwxBOQ1aQ1NTOLTvtv/LJMNZz8b7UTx3+9T7ezl8AutDe3MAVahl
         ZrkXq37nPrj8YvxY/WJN/KuH0HwaT3Q4mbcQjgt/FlbkVmdh1c9Ag23SOdIk3aRf/ihe
         VpCw5tAVHbTkazGea7g/+g4eS3ahQqLKXuLhdyd4DEspDdNGyhyVS7LBaveq2h6DavBh
         ikqqam2Uuen/4MoYAYJGu8ARNGl+xfEtp1RV/wX+Ji4JDh3jPdblo9KU3ns43z1hG6Bx
         IzEoxmCxs5JYwLZ0/gkJxfeRHrUXLDy+88QtnFJqHSuY3RMPFwV36Xh1JRxC+8g59D70
         r0nA==
X-Forwarded-Encrypted: i=1; AJvYcCUcR2sQdbId5tp6foBHXKl0DCmJLmVSE/n+NLl3JYTxJJI/LJi/B3dDsD18zxw5TNhHmgDxqyNaFdyNKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm932eZdlTgz+seCgTk/QPlc/egbh/t5mqsfHVX4MtZQX7D+AZ
	v7GFCdkWNLO8MsB/0NWrH9k/3YVF79nNvACrMBl7aRUfvmCGJ6jSs0JUbg5cWfLDVw==
X-Gm-Gg: ASbGncuvjMHLiC/CEBbBtt8z2KMaF39ssqDv9SQ5TE6/JhEETZ0oTNVTRiN6YV2shRk
	bKJ/G3OHmABBBWN0onWa7aUQg5ZWo3JEeTe3LJiLmSJm6D9u/3Q5pjLgfHuKnDOD0JyEYqWkNff
	IaK6dLtf9R2i6NbP7JE+2909agrwVTP719U3g/PyIuMdUdO8cv7ggqdVn2Bbu9SG3weWtZP+wq2
	tgtEsNHSRMHqWi1Voo+6GhF76a+cdGIEZGu7KcW2Urvn5lT1NpPBc2bATMKUpXqhuzQ2W4mm7Vp
	XbF6ai3B9/wMY9TBDqI+a0cFkPHm9kTUlmomuxJQ0SMcOP99qIe4NPMvjdt2pxAhwNKVRNoua1v
	TIp9X
X-Google-Smtp-Source: AGHT+IGuzlQ4coveIb3aJO1JXLxRiAQiyFnfLoJRnxBPJ+E7GV+Z/ZfFSQcDG+29Z/ZESK2AT9OPdg==
X-Received: by 2002:a05:6214:2468:b0:6fa:c5be:dad6 with SMTP id 6a1803df08f44-6ffed7a55fdmr51444156d6.6.1751034219846;
        Fri, 27 Jun 2025 07:23:39 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44313926asm137703185a.22.2025.06.27.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:39 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:23:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627101939.3649295-2-xu.yang_2@nxp.com>

On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/core/hcd.c | 30 ++++++++++++++++
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    |  9 +++++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..5fa00d32afb8 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
>  
> +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> +					     struct urb *urb)
> +{
> +	enum dma_data_direction dir;
> +
> +	if (!urb->sgt)
> +		return;
> +
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;

Are the following operations really necessary if the direction is OUT?  
There are no bidirectional URBs, and an OUT transfer never modifies the 
contents of the transfer buffer so the buffer contents will be the same 
after the URB completes as they were when the URB was submitted.

> +	invalidate_kernel_vmap_range(urb->transfer_buffer,
> +				     urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> +}

This entire routine should be inserted at the appropriate place in 
usb_hcd_unmap_urb_for_dma() instead of being standalone.

> +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> +						struct urb *urb)
> +{
> +	enum dma_data_direction dir;
> +
> +	if (!urb->sgt)
> +		return;
> +
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +	flush_kernel_vmap_range(urb->transfer_buffer,
> +				urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> +}

Likewise, this code belongs inside usb_hcd_map_urb_for_dma().

Also, the material that this routine replaces in the uvc and stk1160 
drivers do not call flush_kernel_vmap_range().  Why did you add that 
here?  Was this omission a bug in those drivers?

Alan Stern

