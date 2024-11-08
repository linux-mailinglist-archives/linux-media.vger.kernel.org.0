Return-Path: <linux-media+bounces-21195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C89C24F0
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 19:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CCCC1F2332E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 18:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC631A9B36;
	Fri,  8 Nov 2024 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KWefnw9q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE55233D6E
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731090954; cv=none; b=HknJb/pMJfLiJlEgpWDBlIsFpbOLNuaQoBfQUikaL1CfRqZ9v7+zzp+hCO/DW5lmdK+Hl7amxpHzEKWm4jlouoj/Gt7qSerJiXB1AZ6xi3rLFU+/D7qOm+PLZ9/VUpChWekWiAFY/KZfsuiRPazMX+IEvhOcdlCiOeNQHV8n5BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731090954; c=relaxed/simple;
	bh=a5ThfHEfPjTQJK336IzP/g+jFc3ahFS0znNvz1tLcjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUsRS3H6BlLZPUspCIQRz0XQr3fdF2395AWE/dJP2CP6pbOIx0UofT0KI5ANDYKVLb990Kvt56BLczjG83bPVocvMvrXsnV/OQu/r6/mTbceRDYywq4yCfwFL11YVzy8noHIOfOOw0Gr7oNKgbIKNPKH4+RSTzVcEX8ULOPIl2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KWefnw9q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC2622C5;
	Fri,  8 Nov 2024 19:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731090940;
	bh=a5ThfHEfPjTQJK336IzP/g+jFc3ahFS0znNvz1tLcjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWefnw9qalBknjrS9U582c+L8EochYlaAD3o9Cbgh0e/bOEBSaomvniLazqxSIjAT
	 usqe2BVQYyqOwgwl9svwsxvMdYsCInpWbKZ/FOYzTiQqIy0vJb4Mo78cKqrM1MBFlI
	 zlKDe8AXZau7O9z7QR8YWOnsA9vSrkFxGYDK1Rdw=
Date: Fri, 8 Nov 2024 20:35:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: uvcvideo: Implement dual stream quirk to fix
 loss of usb packets
Message-ID: <20241108183543.GA17916@pendragon.ideasonboard.com>
References: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
 <20241108142310.19794-4-isaac.scott@ideasonboard.com>
 <CANiDSCuO6AxZDEEWZmgV_gfcEph_acJ6eio6Gymx_2gRvM-QCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuO6AxZDEEWZmgV_gfcEph_acJ6eio6Gymx_2gRvM-QCw@mail.gmail.com>

On Fri, Nov 08, 2024 at 07:22:01PM +0100, Ricardo Ribalda wrote:
> On Fri, 8 Nov 2024 at 15:24, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
> >
> > Some cameras, such as the Sonix Technology Co. 292A exhibit issues when
> > running two parallel streams, causing USB packets to be dropped when an
> > H.264 stream posts a keyframe while an MJPEG stream is running
> > simultaneously. This occasionally causes the driver to erroneously
> > output two consecutive JPEG images as a single frame.
> >
> > To fix this, we inspect the buffer, and trigger a new frame when we
> > find an SOI, inverting the FID to make sure no frames are erroneously
> > dropped.
> >
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 2fb9f2b59afc..f754109f5e96 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1211,6 +1211,30 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >                 return -EAGAIN;
> >         }
> >
> > +       /*
> > +        * Some cameras, such as the Sonix Technology Co. 292A exhibit issues
> > +        * when running two parallel streams, causing USB packets to be dropped
> > +        * when an H.264 stream posts a keyframe while an MJPEG stream is
> > +        * running simultaneously. This occasionally causes the driver to
> > +        * erroneously output two consecutive JPEG images as a single frame.

The last sentence belongs to the commit message, not here, because once
the patch will be merged, this won't be true anymore.

Could you describe here what the device does in a bit more details ? I
think it's important to explain how the data is transferred, what
packets are lost, and why checking the first two bytes of the data is
the right quirk as opposed to having to search for the marker within the
whole packet.

> > +        *
> > +        * Check the buffer for a new SOI on JPEG streams and complete the
> > +        * preceding buffer using EAGAIN, and invert the FID to make sure the
> > +        * erroneous frame is not dropped.
> > +        */
> > +       if ((stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF) &&
> > +           (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> > +            stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> > +               const u8 *packet = data + header_len;
> 
>                   Don't you have to validate that data[header_len+1]
> can be read?
>
> > +
> > +               if ((packet[0] == 0xff && packet[1] == 0xd8) && buf->bytesused != 0) {
> 
> nit: maybe it would be nice to make a define for 0xd8 and say what it is

JPEG_MARKER_SOI in include/media/jpeg.h :-)

> > +                       buf->state = UVC_BUF_STATE_READY;
> > +                       buf->error = 1;
> > +                       stream->last_fid ^= UVC_STREAM_FID;
> > +                       return -EAGAIN;
> > +               }
> > +       }
> > +
> >         stream->last_fid = fid;
> >
> >         return header_len;

-- 
Regards,

Laurent Pinchart

