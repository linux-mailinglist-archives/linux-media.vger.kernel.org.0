Return-Path: <linux-media+bounces-21440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01E9C967F
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 00:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 610E1283A5D
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 23:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAC61B3938;
	Thu, 14 Nov 2024 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZT3rr4wB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9EE1B3922
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 23:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731628720; cv=none; b=LUxom5p/UzVv2h1iER/KtnMLmai0uGFHqmb2t2uYvjyXigjI2ac20Ho3TdLRRdQw0hQEmMcT6sSxhiqcsPvBLJGeVEOqk14f8golgRgvyG9IQyLkfbVKUj0kw55KrH9FpsCFNAg2NjmsLuRx4K5lDe9DMnhuuVGtxbsKp65LbEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731628720; c=relaxed/simple;
	bh=CsV4mBCfIuxkiRbwU3GBaP91/kX/nq0EzPdL9iLN9Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZtUS7OfxdeG0e/l9D8zeyTCbLxHXt7NfBDTrf36hR+Cls4e2G//REQWuMrP8+IA8rUsw7npjNsdY+EmRi8EKgxsGOcmQQ7WvbV99onFbDggL9+sjK2CPKnCPPsQXcZ4L6qmqvFOa8uiJ5tUy01e1p+Ba6+qUuCLkFTn+MBO4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZT3rr4wB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EA48502;
	Fri, 15 Nov 2024 00:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731628702;
	bh=CsV4mBCfIuxkiRbwU3GBaP91/kX/nq0EzPdL9iLN9Ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZT3rr4wBAmrv9lFRpV9Pu0iDu0p8H6rdNKr6ZWy57I179mEHNw3Mr/MVljh/uViIG
	 sP3GAmYIQztJSdcWjVtKEbMiEVYiqe3lhrMVxBnUOHbEAV4k5K9Q0nOx0R2XE2zYb8
	 9b812ys7pEAlyHAm7GagfOn1UqHUJ4wHjyuiSSgE=
Date: Fri, 15 Nov 2024 01:58:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 1/2] media: uvcvideo: Implement dual stream quirk to
 fix loss of usb packets
Message-ID: <20241114235827.GG31681@pendragon.ideasonboard.com>
References: <20241112112926.17848-1-isaac.scott@ideasonboard.com>
 <20241112112926.17848-2-isaac.scott@ideasonboard.com>
 <CANiDSCuA7MFzo4Oyk3wiaoa=7CpVgFkaxxD+BHeJS1i5G9qSRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuA7MFzo4Oyk3wiaoa=7CpVgFkaxxD+BHeJS1i5G9qSRw@mail.gmail.com>

On Thu, Nov 14, 2024 at 08:47:52PM +0100, Ricardo Ribalda wrote:
> Hi Isaac
> 
> I am curious... How is this v7?

I see on the list v1 (implicit, it's not versioned), v5 and v7. I'm
curious to know if there's a pattern, we need a few more versions to
figure it out :-)

Jokes aside, Isaac, you should increment the version number only when
sending a new public version.

> Remember to run
>  scripts/checkpatch.pl --strict -g HEAD
> 
> It is complaining about an open parenthesis match here. Not the end of
> the world, but rather fix it locally than discussing :)
> 
> Totally optional... maybe you can add to the cover-letter a run of
> yavta -c /dev/videoX
> with and without the patch. So people can see practically what changes.
> 
> Regards!
> 
> On Tue, 12 Nov 2024 at 12:33, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
> >
> > Some cameras, such as the Sonix Technology Co. 292A, exhibit issues when
> > running two parallel streams, causing USB packets to be dropped when an
> > H.264 stream posts a keyframe while an MJPEG stream is running
> > simultaneously. This occasionally causes the driver to erroneously
> > output two consecutive JPEG images as a single frame.
> >
> > To fix this, we inspect the buffer, and trigger a new frame when we
> > find an SOI.
> >
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++-
> >  drivers/media/usb/uvc/uvcvideo.h  |  1 +
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index e00f38dd07d9..9bb41362c48d 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/atomic.h>
> >  #include <linux/unaligned.h>
> >
> > +#include <media/jpeg.h>
> >  #include <media/v4l2-common.h>
> >
> >  #include "uvcvideo.h"
> > @@ -1116,6 +1117,7 @@ static void uvc_video_stats_stop(struct uvc_streaming *stream)
> >  static int uvc_video_decode_start(struct uvc_streaming *stream,
> >                 struct uvc_buffer *buf, const u8 *data, int len)
> >  {
> > +       u8 header_len;
> >         u8 fid;
> >
> >         /*
> > @@ -1129,6 +1131,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >                 return -EINVAL;
> >         }
> >
> > +       header_len = data[0];
> >         fid = data[1] & UVC_STREAM_FID;
> >
> >         /*
> > @@ -1210,9 +1213,31 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >                 return -EAGAIN;
> >         }
> >
> > +       /*
> > +        * Some cameras, when running two parallel streams (one MJPEG alongside
> > +        * another non-MJPEG stream), are known to lose the EOF packet for a frame.
> > +        * We can detect the end of a frame by checking for a new SOI marker, as
> > +        * the SOI always lies on the packet boundary between two frames for
> > +        * these devices.
> > +        */
> > +       if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
> > +          (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> > +           stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> > +               const u8 *packet = ((const u8 *)data) + header_len;
>
> Do you need the (const u8 *) casting here? . I believe data has
> exactly that datatype

It doesn't seem to be needed indeed.

Can you send a new version that fixes these two issues (checkpatch
warning and unnecessary cast), as well as address the comment on 2/2 ?

> > +
> > +               if (len >= header_len + 2 &&
> > +                   packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
> > +                   buf->bytesused != 0) {
> > +                       buf->state = UVC_BUF_STATE_READY;
> > +                       buf->error = 1;
> > +                       stream->last_fid ^= UVC_STREAM_FID;
> > +                       return -EAGAIN;
> > +               }
> > +       }
> > +
> >         stream->last_fid = fid;
> >
> > -       return data[0];
> > +       return header_len;
> >  }
> >
> >  static inline enum dma_data_direction uvc_stream_dir(
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b7d24a853ce4..040073326a24 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -76,6 +76,7 @@
> >  #define UVC_QUIRK_NO_RESET_RESUME      0x00004000
> >  #define UVC_QUIRK_DISABLE_AUTOSUSPEND  0x00008000
> >  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
> > +#define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED                0x00000001

-- 
Regards,

Laurent Pinchart

