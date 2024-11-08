Return-Path: <linux-media+bounces-21089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1225B9C12E1
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 01:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 437571C2289C
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 00:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD6A7E9;
	Fri,  8 Nov 2024 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MyfpJxsX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419818D
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 00:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731024291; cv=none; b=e8FNW+L3cuHRu07CNOkePpcFR0z/YqWvzvIrhqnTfdXWpvpPxPdvBPdDs8e7f0rpngvy+tw698eS5L0f4HT+x68lddR0nOj4SqxuercegL87YvRKzKXtkXuDdZGhdUGlSic2zRBVpdsiEThFEsWIAZS6sGbSasc98D0leHzKUf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731024291; c=relaxed/simple;
	bh=hZ7bp7enBXU85KJzUtY3LmqIFa8+vpxF490C2AH0A/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaQr2oQ9F9aN6olpciyD3JSMqLmXIJDxVcJkusm9qf5uJiBFuD52AMFl5rJeZRoJrE5BPXK/tcM4UjioL/JzEVaBzhFZHwAA6548adjyTgfdMU+qFZMB8qA9J0fM/pHgjHTFq3j+ntGdwYXJOyXR4l2RxfUGnSagpZXbudBYGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MyfpJxsX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 952A1353;
	Fri,  8 Nov 2024 01:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731024276;
	bh=hZ7bp7enBXU85KJzUtY3LmqIFa8+vpxF490C2AH0A/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyfpJxsXzFN082NkjMO1Ui3q+g+bSqdxwfGkOTqpBEAujSNaVAkPTutIWbxpse4Ht
	 7BYqXpURpQiSbg2uIa++1pqaqmFBZnl0iYg7245YzBtmyhdH+6N/8vTs5zuRi3YiX/
	 JVpPKA0MRUihTU/0UowlTbT/v6ojZU64+tLikxI8=
Date: Fri, 8 Nov 2024 02:04:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benoit Sevens <bsevens@google.com>
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
	stable@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v1 1/2] media: uvcvideo: Skip parsing frames of type
 UVC_VS_UNDEFINED in uvc_parse_format
Message-ID: <20241108000439.GK31474@pendragon.ideasonboard.com>
References: <20241107142204.1182969-1-bsevens@google.com>
 <20241107142204.1182969-2-bsevens@google.com>
 <20241107150432.GD31474@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107150432.GD31474@pendragon.ideasonboard.com>

On Thu, Nov 07, 2024 at 05:04:32PM +0200, Laurent Pinchart wrote:
> Hi Benoît,
> 
> Thank you for the patch.
> 
> On Thu, Nov 07, 2024 at 02:22:02PM +0000, Benoit Sevens wrote:
> > This can lead to out of bounds writes since frames of this type were not
> > taken into account when calculating the size of the frames buffer in
> > uvc_parse_streaming.
> > 
> > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > Signed-off-by: Benoit Sevens <bsevens@google.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Mauro, Hans, could you pick this as a fix for v6.12 ?

> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 0fac689c6350..13db0026dc1a 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -371,7 +371,7 @@ static int uvc_parse_format(struct uvc_device *dev,
> >  	 * Parse the frame descriptors. Only uncompressed, MJPEG and frame
> >  	 * based formats have frame descriptors.
> >  	 */
> > -	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> > +	while (ftype && buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> >  	       buffer[2] == ftype) {
> >  		unsigned int maxIntervalIndex;
> >  

-- 
Regards,

Laurent Pinchart

