Return-Path: <linux-media+bounces-34938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8AADB3BE
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDE8B3B6FFE
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4732820D9;
	Mon, 16 Jun 2025 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qiDS3uJY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE342820CE
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083644; cv=none; b=Qzh2bp/i/PmIUp5RZUbAhbtcWT9kG0dGwt8UAwYTBqe4bABVk5/ypm9KnFBQiT7Ap8OuKw+7oaF6X3PnvJvXxO/IZhB0LVFgaJYMFtlccUaVG96XX5K1bj9obX6hGA+6Sg2w24wMW6f4CPOmTx9CCLsB5bTiP4mQxjqVEJAeyac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083644; c=relaxed/simple;
	bh=5cylBjR2JasUZkv4OpRrf94Tu0nKiuVq0okzHEArjzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv3x/VD+roGw1ONIsmLHJk2PYARdnPEgR7lF7nyV3nUM8jvhzoWB8Jzniv+aPuHuplYJ14IRsoynH3yX9dig9OV6QE9WNkZ8dt1C8JSAt/YxyTTmOuS+ccKrTTLZ3IDYvRgkcAIy7vtlcgE38JYkatoauF/AcWciw4450pvPHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qiDS3uJY; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3939ecb7dso479730785a.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750083641; x=1750688441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pDbQeIKQedNL3NEzD8YAm+JX1HrTgVcpjWLbIbYI9Ck=;
        b=qiDS3uJYXLxMB2pZ7dpUJjBtKnW4pVsOuEcN8ydtVI3FCXlpuf03Ebjq27JTHndMu5
         U5HqMPoT6hlSuW6jakEHoCpSf/3vGKSPLfaGWA0yKelPkpILTUgDkNsHb0zFkRcyo8bT
         OqdxPCMrMopslXHgPwLu4kf2qqoffNLvL0Rawqb05KkF2/oW56Ew3KolPYOpGcPQ09ia
         NBFXsYXm57GXGjEbAs4k964l5rrfg5gHviK8+b8XLw8b28h5jbQ75kAyZTamRM09Cl/g
         q3L/7506VFYG4xvDZOaTPbG186ISSIRDCY7gFgjrF57MyJYq3H9YEVP6cBUD6w1PwP5m
         yn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083641; x=1750688441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDbQeIKQedNL3NEzD8YAm+JX1HrTgVcpjWLbIbYI9Ck=;
        b=BjZ89PBkZASd+Z9VZg5VXw4otWRQRn8uFEsmb0Cttj6dhN5aGsKOChzybem6/8470z
         z1st0Y2bT99RvyMF2pZHahu0GoCEND914TQGVIsd+fbjm7rhsBnE68dDn3+cS6srIcuw
         A9ARJBHg+9w4cx7Zu+9l/vxghk4nsceHnCwqppXWMbklXT1BFOktpe2sEHiiVAOZkpN2
         JPHjlaOq3X6JzUPqM/wvetoKtPqBy4f4Ohj+vtcRORvd+s23eV73e8rX4BE/RmP5utdd
         Y1zk+AdPNSHbbEyTZbJ3HOv7XemiX9V2viKrgDeRox08HQzvoeFO4zTkEMtGxyctU9VZ
         7ftQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZNUd+9KaR6AIW9RMcOxtK+p9MtNFETHsjpJ3zsMc6HJePpBSYynA3y9Xg1zCb4Gv3CH/puiFZNoHtvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmV43FdTI6jC3Zd3iHKC9S6gBrc4KfrH2ytbn85eAuTRRwSs8E
	0ufqIEul2w1xDzknV/M2WcpW6R9j7tB/DirW+8R0hzsbPeqtETV62TA84amUlbIIEQ==
X-Gm-Gg: ASbGnctp//ySjiOmTF2z1cS9hNbLkLYLhKB3FB009TV8vr2XVZZXWEvLRMi2ZrQkuIj
	hIuMmAisZt7K8K345qULHGs/S3OrHRFLE505au8eJXAk47zWG98HNBvHl2XSAQv2CqGRyU0yARd
	xqXVeJMaeJ4BDMXNgm1jjBNkyOcd1y1MBbjxs0lxsSilOBveRxr85yRIELTA0whURyIAFOtNwxt
	l6I8u1zpYzcZiIJFZqYO/Ku/ARy1Zq8NuiJOaLkUMheHy4kpLsBPdI52RAvc5SE1sO5pkb6lNvn
	q2OrKxVSdhDbCSj2sDxJWvjQW1QIYNYxAhMgbUUSP6SPuAIUWSsF8bDV98blbXMFjh8ltSwFmft
	ZmNKn
X-Google-Smtp-Source: AGHT+IEv+f3ZtoaV0bo+Dcs1xLfwwB1HrNMEo6Pfx6jOdLikPtpJR0gYvmJsKVgbMy7nAFyaoNhS/A==
X-Received: by 2002:a05:620a:3195:b0:7d2:1a54:f646 with SMTP id af79cd13be357-7d3c6c0e558mr1751582285a.7.1750083641177;
        Mon, 16 Jun 2025 07:20:41 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e1cf5esm528554285a.49.2025.06.16.07.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:20:40 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:20:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, mchehab@kernel.org,
	jeff.johnson@oss.qualcomm.com, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usbmon: do dma sync for cpu read if the buffer is
 not dma coherent
Message-ID: <d5a3e6aa-73e2-4086-908f-e95b522112cc@rowland.harvard.edu>
References: <20250614132446.251218-1-xu.yang_2@nxp.com>
 <20250614141647.GM25137@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614141647.GM25137@pendragon.ideasonboard.com>

On Sat, Jun 14, 2025 at 05:16:47PM +0300, Laurent Pinchart wrote:
> On Sat, Jun 14, 2025 at 09:24:45PM +0800, Xu Yang wrote:
> > The urb->transfer_dma may not be dma coherent, in this case usb monitor
> > may get old data. For example, commit "20e1dbf2bbe2 media: uvcvideo:
> > Use dma_alloc_noncontiguous API" is allocating non-coherent buffer.
> > 
> > To make usbmon result more reliable, this will add a flag
> > URB_USBMON_NEED_SYNC to indicate that usb monitor need do dma sync
> > before reading buffer data.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/mon/mon_main.c | 7 +++++++
> >  include/linux/usb.h        | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
> > index af852d53aac6..b9d5c1b46b85 100644
> > --- a/drivers/usb/mon/mon_main.c
> > +++ b/drivers/usb/mon/mon_main.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/notifier.h>
> >  #include <linux/mutex.h>
> > +#include <linux/dma-mapping.h>
> >  
> >  #include "usb_mon.h"
> >  
> > @@ -142,6 +143,12 @@ static void mon_complete(struct usb_bus *ubus, struct urb *urb, int status)
> >  {
> >  	struct mon_bus *mbus;
> >  
> > +	if (urb->transfer_flags & URB_USBMON_NEED_SYNC)
> > +		dma_sync_single_for_cpu(ubus->sysdev,
> > +					urb->transfer_dma,
> > +					urb->transfer_buffer_length,
> > +					DMA_FROM_DEVICE);
> 
> This will result in a double sync, impacting performance. Futhermore,
> the sync code in uvc_video.c reads as
> 
> 	/* Sync DMA and invalidate vmap range. */
> 	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> 				 uvc_urb->sgt, uvc_stream_dir(stream));
> 	invalidate_kernel_vmap_range(uvc_urb->buffer,
> 				     uvc_urb->stream->urb_size);
> 
> The difference makes me think something has been overlooked here.
> Finally, uvcvideo supports output devices, so the DMA_FROM_DEVICE
> direction doesn't seem universally applicable.
> 
> It seems there are quite a few issues to solve to merge this feature. If
> the DMA sync operation can be done in a generic way in usbmon, then we
> should consider moving it to the USB core and avoid the sync in the
> driver. That may remove too much flexibility from drivers though, in
> which case it may be best to let the driver handle the sync in a way
> that guarantees it gets performed before usbmon inspects the data.
> 
> The issue doesn't seem specific to the uvcvideo driver. All drivers that
> set URB_NO_TRANSFER_DMA_MAP seem to be affected. A more generic
> mechanism to handle that would also be good.

Handling this in the core does seem like the best approach.  Waiting 
until the class driver's callback does a DMA sync won't work for usbmon, 
because the usbmon callback occurs first.

It also won't work right with OUT transfers, because usbmon will read 
data from the buffer after it has been synced by the driver.  (While 
this might not actually hurt anything, I think it's still a violation of 
the DMA API.)

The places where usbcore does normal DMA mapping for URBs are okay:
after usbmon during submission, before usbmon during giveback.  But it 
doesn't handle unusual mapping schemes, only the commonly used ones.

Alan Stern

