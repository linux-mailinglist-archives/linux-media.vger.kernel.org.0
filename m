Return-Path: <linux-media+bounces-19260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE09995014
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A610A1C21631
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2881DEFED;
	Tue,  8 Oct 2024 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="jrzJscVt"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36401DF729;
	Tue,  8 Oct 2024 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394287; cv=fail; b=gKqhIKg3/Gankb8CybVAH4R1QlkYRXTT+FRrw3VJP7KJYadNqCGUT2OmPYTkHpGEGmYzp7iVMmVO4Wd/r4SpBYKpYKWx9AkNSMtH/1nnLb7LqVEpqk2h8S+PnI2zY9CFWt7YY6oktgSMuIu/Bj6efxFbqgDOETbJUQMtLVV9dC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394287; c=relaxed/simple;
	bh=BfeOqdeV7G2DU+eXLL5PaWIQnBpyUyKA0ntzebVM8QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7hVMfMAzbq6MV7/+zhFhT7mjBPsyCerMLIXt9KZfwBTrXEK/vTus4s1jAUH39QQvaiYCoZxIC25G5LCbGUwQL7fBZMFLyIITrBZbl5dHlGCvPkZxaZiPAOUI1d3dOFosqVhz8KiC2TGZiy4Ii9wJ1Q3LRGp2pkfYU9jvcy8uRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=jrzJscVt; arc=fail smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XNH3W4CTvz49PyG;
	Tue,  8 Oct 2024 16:31:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1728394279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kftToYm0djzngiyLTS5l7DC7KUiCFKab6TYyxhOQK70=;
	b=jrzJscVtITBvcYBARbXvgI+Al0z4nravlXTAhJTHT9KMaqvrM/EuHqmS0uVDClOkKHP74M
	mmy8DyIJyxKDF/DLP222ZMM8gZuWp4F2KA5oR+7aZ3Ml3T7LScjsGsYBC0yGiuZIT/tY5X
	791jQHuoPFFJz6mBHmO4yBWUCNiu+H/q7XRYH9sUvDqjVEX81RY+faB3sdxS82q+JNH7XL
	pPWYtiC6YKVLhyb2MJp8v9hc8ib94UyMQNZEDBhDW+KkyaqoQNO8LPrStphC5hJYvXBc5R
	uPOtNEroRkaMkFFYPJtUT8ZDKYYrgXd0bvUJ4F5joe1XUkXIitPOg4ans/7+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1728394279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kftToYm0djzngiyLTS5l7DC7KUiCFKab6TYyxhOQK70=;
	b=i4boPEjHo30ijxKCsjtDwebJFhyx3ZO4XebH/RLQ06WpoLDMPrFAnuwmrKQXUBYH6vEVeO
	qt1YDPCk9qB9TlgojPHB0o52ayfXkiCqNhXmnNAsKNyL4iaxTcVBZXF3Du4rlJWj753+9p
	By640qR3yfdpXG0VD97WvcBJRDZ0NzD1Y/n1BjeVSLvP/pqBDkn3gEbzxSHH2UdUlnWjtI
	TA89mG/soh017S6B6bEvxga9rvImED0EgnYEgdVyhsSKWW07hwVmLKMo0+mM1DutqduG/R
	evlZiB+liHN6nKbPego0N9BFBaRI+SASUI25/A6do9VJhSPA8lgeHIshYHs89g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1728394279; a=rsa-sha256;
	cv=none;
	b=RYmfeyKutlmXwfSqY3POuqnqtJO8ziApDPreJoqpraEqFsLWG6Ov17xDlysw+1CChTSDtl
	0W/UQesrOYb32JDqcCooeHAlOkb1gzFe/hyKZfSG1hwXPFOBn4IXkKMHBdHCLwNQ5IepZ5
	Jtc8TM5lD6BEHgtFyKUxQKAhZOMeE6ulroHBoNYh1Ntj62ai18qZtKjDJ9uRCjWJQQSTo7
	JwkguljNpgBck5pe6P6FbW/wn1xkQBEYHMdDMKgX9YtFiErpky50o5lJD0wCrB8j7M1/Sn
	EAV8xvbg2FJpcXfoxDpGVye631w7AX7oRu9DYKBhS1VizdR4sMyE7fRUFEO4Rg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4CE14634CA9;
	Tue,  8 Oct 2024 16:31:19 +0300 (EEST)
Date: Tue, 8 Oct 2024 13:31:19 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: uvcvideo: Refactor uvc_query_ctrl
Message-ID: <ZwU0JyfBPRpkINCu@valkosipuli.retiisi.eu>
References: <20241008-uvc-readless-v1-0-042ac4581f44@chromium.org>
 <20241008-uvc-readless-v1-2-042ac4581f44@chromium.org>
 <ZwUfD5Kfzv93-46f@valkosipuli.retiisi.eu>
 <CANiDSCu5ho_CFCgRQVdUzaWtfSi_eNk+N7c-DGxcO+6Ks_Vmvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCu5ho_CFCgRQVdUzaWtfSi_eNk+N7c-DGxcO+6Ks_Vmvg@mail.gmail.com>

Hi Ricardo,

On Tue, Oct 08, 2024 at 09:22:25PM +0800, Ricardo Ribalda wrote:
> Hi Sakari!
> 
> On Tue, 8 Oct 2024 at 20:01, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Ricardo,
> >
> > On Tue, Oct 08, 2024 at 07:06:15AM +0000, Ricardo Ribalda wrote:
> > > Move the query control error logic to its own function.
> > > There is no functional change introduced by this patch.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 45 ++++++++++++++++++++++-----------------
> > >  1 file changed, 26 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index 853dfb7b5f7b..a57272a2c9e1 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -67,30 +67,12 @@ static const char *uvc_query_name(u8 query)
> > >       }
> > >  }
> > >
> > > -int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > -                     u8 intfnum, u8 cs, void *data, u16 size)
> > > +static int uvc_query_ctrl_error(struct uvc_device *dev, u8 intfnum, void *data)
> > >  {
> > >       int ret;
> > >       u8 error;
> > >       u8 tmp;
> > >
> > > -     ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> > > -                             UVC_CTRL_CONTROL_TIMEOUT);
> > > -     if (likely(ret == size))
> > > -             return 0;
> > > -
> > > -     if (ret > 0 && ret < size) {
> > > -             memset(data + ret, 0, size - ret);
> > > -             return 0;
> > > -     }
> > > -
> > > -     if (ret != -EPIPE) {
> > > -             dev_err(&dev->udev->dev,
> > > -                     "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > > -                     uvc_query_name(query), cs, unit, ret, size);
> > > -             return ret ? ret : -EPIPE;
> > > -     }
> > > -
> > >       /* Reuse data[0] to request the error code. */
> > >       tmp = *(u8 *)data;
> > >
> > > @@ -135,6 +117,31 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > >       return -EPIPE;
> > >  }
> > >
> > > +int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > +                u8 intfnum, u8 cs, void *data, u16 size)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> > > +                            UVC_CTRL_CONTROL_TIMEOUT);
> > > +     if (likely(ret == size))
> > > +             return 0;
> > > +
> > > +     if (ret == -EPIPE)
> > > +             return uvc_query_ctrl_error(dev, intfnum, data);
> > > +
> > > +     dev_err(&dev->udev->dev,
> > > +             "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > > +             uvc_query_name(query), cs, unit, ret, size);
> >
> > This message should probably be printed after the check below.
> 
> If the device is returning less bytes, the hardware is not behaving
> according to spec and it is good information, specially if you are
> bringing up a new device.
> I could make it  a dev_warn() (or even uvc_debug) if ret <size. WDYT?

What I also came to think whether this is worth an explicit quirk flag.
There could well be devices that have other bugs that would still fall
under the same check.

Either way, there should not be a message every single time this workaround
is applied. Isn't uvc_query_ctrl() also used in some IOCTLs outside probe?

> 
> 
> >
> > I'd actually move the below check before the ret == -EPIPE check as it's a
> > successful case (and changing the condition to <= would make the ret ==
> > size check redundant).
> 
> something like this?
> 
> if (ret > 0)  {
>    if (ret != size) {
>       print_error();
>       memcpy();
>    }
>    return 0;
> }

Well, if you think it's reasonable to keep the error message (should be a
warning in that case IMO), then the original code makes sense.

I wonder what Laurent thinks.

> 
> >
> > > +
> > > +     if (ret > 0 && ret < size) {
> > > +             memset(data + ret, 0, size - ret);
> > > +             return 0;
> > > +     }
> > > +
> > > +     return ret ? ret : -EPIPE;
> > > +}
> > > +
> > >  static const struct usb_device_id elgato_cam_link_4k = {
> > >       USB_DEVICE(0x0fd9, 0x0066)
> > >  };
> > >
> >

-- 
Kind regards,

Sakari Ailus

