Return-Path: <linux-media+bounces-22317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797849DC232
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ED691641BD
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529F218A6DB;
	Fri, 29 Nov 2024 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OtWV7sUe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69992155345
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732876580; cv=none; b=mCFg9Ch6MCmSNTeqWv5MD66CQD2rpCleR/ZsZ07/urr7cXcJ8Y6RecuBHYQfklKgKOndsEVPbat886JdMqk0w1ZMGUlg6o5Ab7EcMlCIgvdTqg3YX8+jZfZOWZco9NK9id+dR0Xxo9aajnugg6G6aDt59r2k/11OnZ9EA81ZLgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732876580; c=relaxed/simple;
	bh=idIYxXzBq6bKbXy4Mi4oFeOYC81NlV0gP7l4AwtvGUg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fjE7cso8bO47/KMD8LDmNpW8a8BIipp0qbNGn1gUiJ7tktwoZSpaQUyPTxeIgCzC54DAlBslzAfCktnmftkIEYn2GDnJrrz1Cqbrglp7LN2LjlWzP61FfatQnjrafwJk11EErAMee1UNv/iVXOdQIjED3b3eXABS7+Jblbg6kKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OtWV7sUe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CA28BDB;
	Fri, 29 Nov 2024 11:35:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732876551;
	bh=idIYxXzBq6bKbXy4Mi4oFeOYC81NlV0gP7l4AwtvGUg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OtWV7sUegCUzlXYh00SxHi77iJtGsEe1gSGBACD4mWe9TmM78HPyPPzFQSUv3O/p1
	 MAgV6GinKp2RWlHev3mBCQMDDBB6MBTppJ+TaNBV/njHZ3nd69pP6/+qqqGLN0S7Ys
	 c3FsYTgVTLCPESF/VXqMDzYYXqA6E8TZg3CDSx9E=
Message-ID: <db474dc5ad8ce5743a2120ae490ff9f6a723b6f3.camel@ideasonboard.com>
Subject: Re: [PATCH v8 1/2] media: uvcvideo: Implement dual stream quirk to
 fix loss of usb packets
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Date: Fri, 29 Nov 2024 10:36:13 +0000
In-Reply-To: <CANiDSCuQUEhxhqTvrKcKtRx4fbkQPUx5O22xBxuXOpGPzH=jVw@mail.gmail.com>
References: <20241128145144.61475-1-isaac.scott@ideasonboard.com>
	 <20241128145144.61475-2-isaac.scott@ideasonboard.com>
	 <CANiDSCuQUEhxhqTvrKcKtRx4fbkQPUx5O22xBxuXOpGPzH=jVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

I hope you are well!

On Thu, 2024-11-28 at 17:16 +0100, Ricardo Ribalda wrote:
> On Thu, 28 Nov 2024 at 15:53, Isaac Scott
> <isaac.scott@ideasonboard.com> wrote:
> >=20
> > Some cameras, such as the Sonix Technology Co. 292A, exhibit issues
> > when
> > running two parallel streams, causing USB packets to be dropped
> > when an
> > H.264 stream posts a keyframe while an MJPEG stream is running
> > simultaneously. This occasionally causes the driver to erroneously
> > output two consecutive JPEG images as a single frame.
> >=20
> > To fix this, we inspect the buffer, and trigger a new frame when we
> > find an SOI.
> >=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> > =C2=A0drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++=
-
> > =C2=A0drivers/media/usb/uvc/uvcvideo.h=C2=A0 |=C2=A0 1 +
> > =C2=A02 files changed, 27 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/usb/uvc/uvc_video.c
> > b/drivers/media/usb/uvc/uvc_video.c
> > index e00f38dd07d9..6d800a099749 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -20,6 +20,7 @@
> > =C2=A0#include <linux/atomic.h>
> > =C2=A0#include <linux/unaligned.h>
> >=20
> > +#include <media/jpeg.h>
> > =C2=A0#include <media/v4l2-common.h>
> >=20
> > =C2=A0#include "uvcvideo.h"
> > @@ -1116,6 +1117,7 @@ static void uvc_video_stats_stop(struct
> > uvc_streaming *stream)
> > =C2=A0static int uvc_video_decode_start(struct uvc_streaming *stream,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct uvc_buffer *buf, const u8 *data, int len)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 header_len;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 fid;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > @@ -1129,6 +1131,7 @@ static int uvc_video_decode_start(struct
> > uvc_streaming *stream,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 header_len =3D data[0];
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fid =3D data[1] & UVC_STREAM=
_FID;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > @@ -1210,9 +1213,31 @@ static int uvc_video_decode_start(struct
> > uvc_streaming *stream,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -EAGAIN;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Some cameras, when runnin=
g two parallel streams (one
> > MJPEG alongside
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * another non-MJPEG stream)=
, are known to lose the EOF
> > packet for a frame.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We can detect the end of =
a frame by checking for a new
> > SOI marker, as
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the SOI always lies on th=
e packet boundary between two
> > frames for
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * these devices.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (stream->dev->quirks & UVC_QUI=
RK_MJPEG_NO_EOF &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stream->=
cur_format->fcc =3D=3D V4L2_PIX_FMT_MJPEG ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream->c=
ur_format->fcc =3D=3D V4L2_PIX_FMT_JPEG)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const u8 *packet =3D data + header_len;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (len >=3D header_len + 2 &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packet[0] =3D=3D 0xff && packet[1] =
=3D=3D
> > JPEG_MARKER_SOI &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->bytesused !=3D 0) {
> nit: !buf->bytesused (please ignore if you prefer your way)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->state =
=3D UVC_BUF_STATE_READY;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->error =
=3D 1;
>=20
> I have a question. Lets say that=C2=A0 you have two frames: A and B, each
> one has 4 packets:
> A1A2A3A4B1B2B3B4
> The last package of A is lost because the device is non-compliant.
> A1A2A3B1B2B3B4
>=20
> You detect this by inspecting every packet, and checking for the
> values 0xff, JPEG_MARKER_SOI at the beggining of the packet.
>=20
> Can't that value happen in the middle of the image, let's say in A2,
> A3, B2, B3... ? If that happens, won't you be losing frames?
>=20

I have found that in MJPEG, it is required to have both an SOI (0xFFD8)
and an EOI (0xFFD9) in every payload.

Source: p.16, USB Device Class Definition for Video Devices: MJPEG
Payload
(https://usb.org/document-library/video-class-v15-document-set))

Furthermore, the JPEG standard also explicitly defines 0xFFD8 to be the
start of image marker, meaning its usage outside that functionality
would not adhere to the standard. If it appears in the middle of a
payload, the payload should be marked as invalid.

Source: p. 32, Digital Compression and Coding of Continuous-Tone Still
Images - Requirements and Guidelines
(https://www.w3.org/Graphics/JPEG/itu-t81.pdf)

> Also, If I get it right, the device not only loses the packet A4, but
> it sends the wrong fid for all the Bx packets?

Before the patch, B would be joined into A, and gets delivered to user
space as A1, A2, A3, A4, A5, A6, A7, A8, C1, C2, C3...


> Maybe the device is not losing A4 but sending wrong fids? Have you
> tried not setting buf->error=3D1 and inspecting the "invalid" image?
>=20

I saw during the diagnosis of the issue by analysing the USB packets
sent by the camera that the packet containing the EOF does not get sent
whatsoever when the two streams are running simultaneously.

> I am not saying that it is incorrect. I am just trying to understand
> the patch better. :)
>=20
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream->las=
t_fid ^=3D UVC_STREAM_FID;
> It would be nice to have uvc_dbg() here, in case we want to debug
> what
> is going on.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EAG=
AIN;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream->last_fid =3D fid;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return data[0];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return header_len;
> > =C2=A0}
> >=20
> > =C2=A0static inline enum dma_data_direction uvc_stream_dir(
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h
> > b/drivers/media/usb/uvc/uvcvideo.h
> > index b7d24a853ce4..040073326a24 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -76,6 +76,7 @@
> > =C2=A0#define UVC_QUIRK_NO_RESET_RESUME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x00004000
> > =C2=A0#define UVC_QUIRK_DISABLE_AUTOSUSPEND=C2=A0 0x00008000
> > =C2=A0#define UVC_QUIRK_INVALID_DEVICE_SOF=C2=A0=C2=A0 0x00010000
> > +#define UVC_QUIRK_MJPEG_NO_EOF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00020000
> >=20
> > =C2=A0/* Format flags */
> > =C2=A0#define UVC_FMT_FLAG_COMPRESSED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000001
> > --
> > 2.43.0
> >=20
> >=20
>=20
>=20

Best wishes,

Isaac

