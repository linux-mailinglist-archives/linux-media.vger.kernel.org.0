Return-Path: <linux-media+bounces-18311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321397A12A
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 14:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C17FE28655B
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 12:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4DA158553;
	Mon, 16 Sep 2024 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KxSDBh+z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC19155391
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488231; cv=none; b=saO2TdFauVuyQCpaGIuOxwvuGWz4mZ3Jw0QFub7ZyKQ+RZZdSJJwpu0Ph5IMc8bfIFRSsnajmuBlH2DwS2iTtjUDpFHcnlj2oRHDJ+IAgPqDktxrF29gZ5QDPq5PQygPJ1A/KpIJy+aUkV9GKETO3V0UQFQjd1DYf71P858+btY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488231; c=relaxed/simple;
	bh=r9KeEpm6dJ4YE+NtvCML5dk4ARSHcGWM+rasjeB1RBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/3jfzt/84TgmsIwJnwV3MluNirWArmY+WLdB23UUKVik4NBzE6vaJXMIS6fKBtU9/WsRJceaUHY+tj1IR3CfyZ50IyA43Yloqh+r7E1QayMOAnsOD/Q5YiZlDF2SAvG+1BDEcKTlsP3zuxk4414XeLVftHHZDKopdvE8uvspyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KxSDBh+z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.34.101.21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28B6A496;
	Mon, 16 Sep 2024 14:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726488147;
	bh=r9KeEpm6dJ4YE+NtvCML5dk4ARSHcGWM+rasjeB1RBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxSDBh+zK5PMwak3Cjbghy+CNkVoT8VmrWzYpN/oykMoZb0EiB1ITulAGLCXB2MnO
	 Cxv4bR4lB4E5Z5lUBoJSpD6WmoCHpF0xqjZZKvIbp0rkScOqRiK/PixsaFHork/P2G
	 5QTvy7IzXNtxkXYnmySKw3UOhPQxZwSA0l9WIfus=
Date: Mon, 16 Sep 2024 15:03:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: David Given <dg@cowlark.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] uvc: add support for the Kaiweets KTI-W02 infrared camera
Message-ID: <20240916120314.GA29857@pendragon.ideasonboard.com>
References: <CALgV52gHPWrcBBv2m6fAAyF_i_8T7cRTtBRS+FKe4TgfRVG0DA@mail.gmail.com>
 <CANiDSCti8SmcNWjhEKm1qM+Bzm30dumU=dptmHzcHeiObv-k+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCti8SmcNWjhEKm1qM+Bzm30dumU=dptmHzcHeiObv-k+Q@mail.gmail.com>

On Mon, Sep 16, 2024 at 01:55:15PM +0200, Ricardo Ribalda wrote:
> HI David
> 
> Can you add the output of lsusb -v -d 1fc9 ?
> 
> Also, the patch should be implemented of top of
> https://git.linuxtv.org/media_stage.git/log/
> 
> Could you rebase your patch and send as v2?
> https://patchwork.linuxtv.org/project/linux-media/patch/CALgV52gHPWrcBBv2m6fAAyF_i_8T7cRTtBRS+FKe4TgfRVG0DA@mail.gmail.com/

The patch should also be split in two, one patch to add the new format
to drivers/media/common/uvc.c and include/linux/usb/uvc.c, and a second
patch to add the device quirk to drivers/media/usb/uvc/uvc_driver.c.
This follows the "one change, one patch" principle of the kernel, and
eases review as well as backporting.

Indentation looks wrong in the patch, did you format it with
git-format-patch and send it with git-send-email ?

> On Sun, 15 Sept 2024 at 21:32, David Given <dg@cowlark.com> wrote:
> >
> > - adds support for the D3DFMT_R5G6B5 bitmap format (just RGBP but with
> > a different GUID)
> > - adds a quirk for the Kaiweets camera which uses it
> >
> > The camera uses an NXP chipset (product ID 0x1fc9), but I can't find
> > any references to a device with vendor ID 0x009b. It may be specific
> > to the Kaiweets camera.
> >
> > diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> > index c54c2268f..c12d58932 100644
> > --- a/drivers/media/common/uvc.c
> > +++ b/drivers/media/common/uvc.c
> > @@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
> >          .guid        = UVC_GUID_FORMAT_RGBP,
> >          .fcc        = V4L2_PIX_FMT_RGB565,
> >      },
> > +    {
> > +        .guid        = UVC_GUID_FORMAT_D3DFMT_R5G6B5,
> > +        .fcc        = V4L2_PIX_FMT_RGB565,
> > +    },
> >      {
> >          .guid        = UVC_GUID_FORMAT_BGR3,
> >          .fcc        = V4L2_PIX_FMT_BGR24,
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > b/drivers/media/usb/uvc/uvc_driver.c
> > index f0febdc08..5a29f6970 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -3072,6 +3072,15 @@ static const struct usb_device_id uvc_ids[] = {
> >        .bInterfaceSubClass    = 1,
> >        .bInterfaceProtocol    = 0,
> >        .driver_info        = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> > +    /* NXP Semiconductors IR VIDEO */
> > +    { .match_flags        = USB_DEVICE_ID_MATCH_DEVICE
> > +                | USB_DEVICE_ID_MATCH_INT_INFO,
> 
> The quirks are sorted by idVendor:IdProduct
> 
> > +      .idVendor        = 0x1fc9,
> > +      .idProduct        = 0x009b,
> > +      .bInterfaceClass    = USB_CLASS_VIDEO,
> > +      .bInterfaceSubClass    = 1,
> > +      .bInterfaceProtocol    = 0,
> > +      .driver_info        = (kernel_ulong_t)&uvc_quirk_probe_minmax },
> >      /* Generic USB Video Class */
> >      { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
> >      { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 88d96095b..01c3b2f45 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -140,6 +140,9 @@
> >  #define UVC_GUID_FORMAT_D3DFMT_L8 \
> >      {0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
> >       0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > +#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
> > +    {0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> > +     0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
> >  #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
> >      {0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
> >       0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

-- 
Regards,

Laurent Pinchart

