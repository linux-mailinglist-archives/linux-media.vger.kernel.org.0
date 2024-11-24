Return-Path: <linux-media+bounces-21865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC99D6C87
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 04:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E1E281585
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 03:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0077425745;
	Sun, 24 Nov 2024 03:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxHwqCDy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2457A2D;
	Sun, 24 Nov 2024 03:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732417777; cv=none; b=mG4JPUTS2aHpqz12M+n8oWU6njv1m9lsGE3oHKUbnPFx0CvuvZmhRdOrJBYJXix0UKV04vNhbVpj0K/QCyKlQHPc0gRnciBzGqfXSUy9eAFhfMU7HJDC1tNBGfNQVj1POiSjdXO91pt6836DTxfUczUZGPuKQR02lDYuMcKREpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732417777; c=relaxed/simple;
	bh=89552l9zlXS9VoiJpLwko3hr66uBHvXZcSCvKZ6g1j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXFsy5OAW5QwJnDDCsEaPNLQvzvEAJCukLun8p36iFzYxINmFZksde9LmtNIQcgmOJ/+EO95q+m/KXLKGp/SLciVDqMmraHNkfaJw24h/rxZgXpHDg0LYmv+MbzY74dkqqUXUNzMLRqlxu/XDiJ2tL074ofokYY1Wm5wL6AMmTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxHwqCDy; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ee020ec76dso2919720a12.3;
        Sat, 23 Nov 2024 19:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732417775; x=1733022575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+SmZ5O1idyx9nxxUYpNJ/ay8b6RbqKKFo2QgDR4SSw=;
        b=QxHwqCDym+yi1H5HZXQY32b541prpfXQsrG4ytCHdg5QrNrzFFnC4eZ9IcTku2Mg7d
         iRWH0q9UV9WGnmQCyCCDhDvq54yqhJPWXfXEapTc+04yb36cVSUzNYJ2MdPcYqfNYqqg
         0aIGVLY3WsLqZrPJXRlcnCzpgN+eA3KWwNajSyVx4GQHFCL15LpGKqtEV+8CzG7mUxoW
         wOWmutq+EFfHnX894MFLX5J3V+R5FUXv08KdQXxs2GyXqNF7ztc+XAboIASmQv+cRxoN
         PXix/YTHKo58/orOpVANn9xqd5ywUAma96R13jMCKk1PnPFB9Q7S7Y+UsBkAwxUSucsE
         co8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732417775; x=1733022575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+SmZ5O1idyx9nxxUYpNJ/ay8b6RbqKKFo2QgDR4SSw=;
        b=Fv9KiDKLJ8PUVVNFoUMGD+qBY6knaePk2D3eojLjImmASGY8M8cLpFZJ8vB/WeUxzi
         u/3dhY2vK8genQea+9t1XhdYepRvIIChyrq1o9HRKruZmq5uurbNx97DUgGHu2qO08Xe
         ZvMO+cHAB0vBjRDiTvwO9kS0S7mchNNw/8mQZH2sH4O5poQbcjQaNRJP8XhNDwo8d7E+
         faIG8P/zPbJ2FGzUqKjT6pGAiJMCL14RvQhOLxtHYZBVfhM4NnRFhKKBsCVR+X1y8WTa
         BFq5i/FjzyfZv8eamWUv4WJOR0tyYipqKfZHQfTM/xF48mPL2PNyXY/TqJi2B+l3lcWs
         udDg==
X-Forwarded-Encrypted: i=1; AJvYcCUBHjL7rdunf7fyUshBdPz6IK0xR5hZBt+8d16ZRN4D3Vh9DInPP2rP+W2v68ay2zyfiv+qgkx1BReaCWA=@vger.kernel.org, AJvYcCXmgEA+q/LbBfwyM1+T0ldczCLuBZAt/xSGgTjbw0UfQ3s8QFwgWlGzX0EzxEfCweefPFYXhIQ8KVH4kJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhdUTdyWicJQs+Oux69JSOV9X5yO5R8DkwxqiBHmlDOMPH+G4M
	ZHtUUUUJuXg7+JxXy5XFj94PNluFfhE7pEDb1im+z4sm3113uxwNZoXbcceyIMeGucNcX1WYxdp
	go+XgDfMBNeOctWRnqnRiJVhFUHM=
X-Gm-Gg: ASbGncvPJXgw7dNhOZhpvqixcnG0c2V4FihP/3l9H5lUDtSx6XSqToMdXjyhawFgQnd
	T3Fd0OktqGq1h+oX18QGPeV9aWbwwL0I=
X-Google-Smtp-Source: AGHT+IG0Y23MhsftEXKYRfu9HiZmUraCNXR69wteGncoeREYFexmu0TkcVsDHI751SLBgXR/i8ns8wQeV0KiejYebOU=
X-Received: by 2002:a17:903:244b:b0:211:f6e4:d68e with SMTP id
 d9443c01a7336-2129fce2e23mr120152755ad.10.1732417774793; Sat, 23 Nov 2024
 19:09:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 23 Nov 2024 21:09:23 -0600
Message-ID: <CAHCN7xJr-sXPGMr7aPH=-Cg+-YQMYChY0u6UNuH5rH8g6cpXhg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add WebP support to hantro decoder
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Erling Ljunggren <hljunggr@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 7:22=E2=80=AFAM Hugues Fruchet
<hugues.fruchet@foss.st.com> wrote:
>
> Add WebP image decoding support to stateless V4L2 VP8 decoder.
>
> This have been tested on STM32MP257-EV board using GStreamer.

I want to test this on an i.MX8M Mini.  Is there a certain gstreamer
version or branch I should use, or is 1.24 sufficient?

adam
>
> Simple basic test:
> $> wget https://www.gstatic.com/webp/gallery/1.webp
> $> gst-launch-1.0 filesrc location=3D 1.webp ! typefind ! v4l2slwebpdec !=
 imagefreeze num-buffers=3D20 ! waylandsink fullscreen=3Dtrue
>
> Slideshow of a set of WebP pictures and WebM video files:
> $> wget https://www.gstatic.com/webp/gallery/2.webp
> $> wget https://www.gstatic.com/webp/gallery/3.webp
> $> wget https://www.gstatic.com/webp/gallery/4.webp
> $> wget https://www.gstatic.com/webp/gallery/5.webp
> $> wget https://samplemedia.linaro.org/VP8/big_buck_bunny_480p_VP8_VORBIS=
_25fps_1900K_short.WebM
> $> gst-play-1.0 *.webp *.webm *.WebM --wait-on-eos
> <hit key ">" to display next file >
>
> Large WebP image > 16777215 (size > 2^24)
> $> gst-launch-1.0 fakesrc num-buffers=3D1 format=3D4 do-timestamp=3Dtrue =
filltype=3D3 sizetype=3D2 sizemax=3D25165824 blocksize=3D25165824 ! video/x=
-raw, format=3DI420, width=3D4096, height=3D3072, framerate=3D1/1 ! webpenc=
 quality=3D100 ! filesink location=3D4096x3072_HQ_random.webp
> $> ls -l 4096x3072_HQ_random.webp
> [...] 16877404 Nov 20 11:40 4096x3072_HQ_random.webp
> $> gst-launch-1.0 filesrc location=3D 4096x3072_HQ_random.webp blocksize=
=3D16876610 ! image/webp, width=3D1, height=3D1, framerate=3D0/1 ! v4l2slwe=
bpdec ! imagefreeze num-buffers=3D20 ! waylandsink fullscreen=3Dtrue
>
> Large WebP image decoding using post-processor is untested because of lac=
k
> of hardware support on this platform, nevertheless support is provided in
> this serie for further testing on another platform having post-processor
> support.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D history =3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> version 3:
>    - Fix remarks from Nicolas Dufresne:
>     - Document constraint about key frame only for WebP
>     - Fix rebase issue
>    - Fix typo detected by Diederik de Haas
>
> version 2:
>    - Fix remarks from Nicolas Dufresne:
>     - Use bytesperline helper to compute chroma size
>     - Introduce a new explicit WEBP frame compressed format
>       instead of relying on VP8 + WebP flag
>     - 4K support in both decoder and post-proc
>
> version 1:
>   - Initial submission
>
> Hugues Fruchet (3):
>   media: uapi: add WebP uAPI
>   media: verisilicon: add WebP decoding support
>   media: verisilicon: postproc: 4K support
>
>  .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
>  .../media/v4l/pixfmt-compressed.rst             | 17 +++++++++++++++++
>  drivers/media/platform/verisilicon/hantro.h     |  2 ++
>  .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
>  .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
>  .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
>  .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
>  .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>  include/uapi/linux/videodev2.h                  |  1 +
>  10 files changed, 68 insertions(+), 4 deletions(-)
>
> --
> 2.25.1
>
>

