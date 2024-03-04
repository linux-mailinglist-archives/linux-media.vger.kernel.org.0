Return-Path: <linux-media+bounces-6374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2173870927
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 19:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC279B2315F
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 18:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0D162157;
	Mon,  4 Mar 2024 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="wMEtOlG0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477FF26293
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709575844; cv=none; b=Ccnlp+c7TO6YUC8/6Bv2UEgofJ1A8H0DFrw1gVQ4SPFmjgxkDWF5TqiO6l6zB7cywRXROs2gsgTBKjzZzjCYe64rO2V+7JzU/Lhxr9p3NpgIfeJ3U+NmxC0dVvQzGqfWi4vg6Lfjw7hRpw4ifwbipG6lSNNj1n2Ud6ASV6JgfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709575844; c=relaxed/simple;
	bh=9kFutXoYlDdEgfM74Nt+6mZ86bCWCCbmBSSYKsEwLgM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q4l2rC82HtVoIDV8GpFPp2if2/1LF6T3lTh5RLgKFO/wjT7m2O3XmvcgLRxRrXI+rkyhj5ukbxnF1AW9HtBhhPed3gPBMcJp9YkJrzyai3zw5o2fZX02809pj70tYRTGSQlErWwLJRy6Po8JhsxePsAy9fPlNLBCXqK4dXrHmRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=wMEtOlG0; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-68f9e399c91so41438946d6.2
        for <linux-media@vger.kernel.org>; Mon, 04 Mar 2024 10:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1709575840; x=1710180640; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dYn1GcICl1bkmF1fsDcU/ugPzPxpkialBLQax1krF1k=;
        b=wMEtOlG0EoT9UG/o/7nosOPT6uR09Njk1f1CLmxsnz4eOmr/JMT1O9ShHW++xf5l7y
         8jQp1mTf1JWIkqLeqlPzH87v6njndp/SsJU8/WsRyrNeQHKsv9w08RC6y+9+TjKGoZqu
         UzVc/iYt2IzGw2/qtK6Dnk5RfhXdABylwdTyOKhfjrNANnWX57Fs3HRIbG7eu3NGEN+G
         VRA6ZdZ1IKrmv5qiH0jYp5HImRyj6cfJAnCqfp4rXYn1Kv0R95gC6YORTYa2nNQ47fIA
         V4c+KEwMEBoghyZ+tl2218++S7+7/HfuwJYBOC+HMifZcxBL2SjdnrI8wD2Ol+kt0Mg7
         z5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709575840; x=1710180640;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYn1GcICl1bkmF1fsDcU/ugPzPxpkialBLQax1krF1k=;
        b=gvDHRdSMTVCm+/M1IQuFQaANBRi1VDJi2kKZpIhtLWC3GFJsFOtax43x7IhyAuXIsK
         xpo9ii2JmlTm3RB2xlDukhywmnUiIvVfv/JV2FgK08UPGQ/CZcklzycOvoPrd0kjlflD
         Z3h8tdJJ5XHvlrJUimecsc1tXLxede6Gk6OWccFP9CdlAnKgDfF/jcAsTD0fEs/6oyZ1
         Wc1MSDxJpKi03sYZdykgla3bQIgUiP15HA4w8Yi5u+mElRhO95IZXm+crQMmuMMGsW3+
         jkeB8mCgg+4mtIFboFw3MBua567+z02OtOjI8e5PuX3ZAVPdASJtKZMu23Sz/hQAXYr5
         Pqrw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Z3r9keFQtpTmzAmCblY1JZ19f6vsvOpdrTEkPDZF1kxQwAiSwViw+tFAh3Pgaxgp7uj7VFst3grBeHAHvBwfBJ4fRJlLEhcNDzY=
X-Gm-Message-State: AOJu0YyXRutOjtY7JiNYXB8kb9+xXjZdlUa4NjhckLmahvWSnId2Kior
	dOTVRlmp4GY3opgSGzRJ/jUEwtrp/7lxdVRMPCS6c/aKEmO7e0wrkW1PqUKFE5g=
X-Google-Smtp-Source: AGHT+IGdRHtZjr9fbsWdgOibDMsvBaS7qadFdn7Q0DI2/522MaPGxVrbN8k5jFMKOBnBfLczy1W2kA==
X-Received: by 2002:a05:6214:114d:b0:690:30b1:5fcf with SMTP id b13-20020a056214114d00b0069030b15fcfmr10853449qvt.51.1709575840075;
        Mon, 04 Mar 2024 10:10:40 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:eba4::7a9])
        by smtp.gmail.com with ESMTPSA id pd6-20020a056214490600b006907801a000sm1090580qvb.26.2024.03.04.10.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 10:10:39 -0800 (PST)
Message-ID: <42bfe748423d0992d001ce23ec1cf209142c3739.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 04/13] media: videodev2.h: Add a format for column
 YUV4:2:0 modes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maarten Vanraes <maarten@rmail.be>, Raspberry Pi Kernel Maintenance
	 <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>,  Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Date: Mon, 04 Mar 2024 13:10:38 -0500
In-Reply-To: <20240303152635.2762696-5-maarten@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
	 <20240303152635.2762696-5-maarten@rmail.be>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le dimanche 03 mars 2024 =C3=A0 16:09 +0100, Maarten Vanraes a =C3=A9crit=
=C2=A0:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> Some of the Broadcom codec blocks use a column based YUV4:2:0 image
> format, so add the documentation and defines for both 8 and 10 bit
> versions.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maarten Vanraes <maarten@rmail.be>
> ---
>  .../media/v4l/pixfmt-nv12-col128.rst          | 215 ++++++++++++++++++
>  .../media/v4l/pixfmt-yuv-planar.rst           |  12 +
>  .../userspace-api/media/v4l/yuv-formats.rst   |  19 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  include/uapi/linux/videodev2.h                |   4 +
>  5 files changed, 252 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12-col=
128.rst
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv12-col128.rst=
 b/Documentation/userspace-api/media/v4l/pixfmt-nv12-col128.rst
> new file mode 100644
> index 000000000000..196ca33a5dff
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12-col128.rst
> @@ -0,0 +1,215 @@
> +.. Permission is granted to copy, distribute and/or modify this
> +.. document under the terms of the GNU Free Documentation License,
> +.. Version 1.1 or any later version published by the Free Software
> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
> +.. and no Back-Cover Texts. A copy of the license is included at
> +.. Documentation/media/uapi/fdl-appendix.rst.
> +..
> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
> +
> +.. _V4L2_PIX_FMT_NV12_COL128:
> +.. _V4L2_PIX_FMT_NV12_10_COL128:
> +
> +************************************************************************=
********
> +V4L2_PIX_FMT_NV12_COL128, V4L2_PIX_FMT_NV12_10_COL128
> +************************************************************************=
********
> +
> +
> +V4L2_PIX_FMT_NV21_COL128
> +Formats with =C2=BD horizontal and vertical chroma resolution. This form=
at
> +has two planes - one for luminance and one for chrominance. Chroma
> +samples are interleaved. The difference to ``V4L2_PIX_FMT_NV12`` is the
> +memory layout. The image is split into columns of 128 bytes wide rather =
than
> +being in raster order.
> +
> +V4L2_PIX_FMT_NV12_10_COL128
> +Follows the same pattern as ``V4L2_PIX_FMT_NV21_COL128`` with 128 byte, =
but is
> +a 10bit format with 3 10-bit samples being packed into 4 bytes. Each 128=
 byte
> +wide column therefore contains 96 samples.

Might be worth saying which side the padding goes. Xilinx uses a non-tiled
version of this, but depending were the padding is placed (LSB or MSB) it m=
ay
not actually be the same format.

> +
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is the two-plane versions of the YUV 4:2:0 format where data is
> +grouped into 128 byte wide columns. The three components are separated i=
nto
> +two sub-images or planes. The Y plane has one byte per pixel and pixels
> +are grouped into 128 byte wide columns. The CbCr plane has the same widt=
h,
> +in bytes, as the Y plane (and the image), but is half as tall in pixels.
> +The chroma plane is also in 128 byte columns, reflecting 64 Cb and 64 Cr
> +samples.
> +
> +The chroma samples for a column follow the luma samples. If there is any
> +paddding, then that will be reflected via the selection API.
> +The luma height must be a multiple of 2 lines.
> +
> +The normal bytesperline is effectively fixed at 128. However the format
> +requires knowledge of the stride between columns, therefore the bytesper=
line
> +value has been repurposed to denote the number of 128 byte long lines be=
tween
> +the start of each column.

I would refrain from a redefinition of bytesperline here. Specially that th=
is
seems to be a non-mplane definition (single allocation format). In that cas=
e,
userspace may be forced to extrapolate some information. I'd keep it strict=
ly to
the definition.

  byteperlines =3D n_col * 128
  n_cols =3D roundup_128(width) / 128

As the height returned by TRY_FMT (and S_FMT), is padded, you can always
retrieve your tile stride (column stride in this specific case) with:

  tile_stride =3D height * 128

Nicolas

> +
> +**Byte Order.**
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 12 12 12 12 4 12 12 12 12
> +
> +    * - start + 0:
> +      - Y'\ :sub:`0,0`
> +      - Y'\ :sub:`0,1`
> +      - Y'\ :sub:`0,2`
> +      - Y'\ :sub:`0,3`
> +      - ...
> +      - Y'\ :sub:`0,124`
> +      - Y'\ :sub:`0,125`
> +      - Y'\ :sub:`0,126`
> +      - Y'\ :sub:`0,127`
> +    * - start + 128:
> +      - Y'\ :sub:`1,0`
> +      - Y'\ :sub:`1,1`
> +      - Y'\ :sub:`1,2`
> +      - Y'\ :sub:`1,3`
> +      - ...
> +      - Y'\ :sub:`1,124`
> +      - Y'\ :sub:`1,125`
> +      - Y'\ :sub:`1,126`
> +      - Y'\ :sub:`1,127`
> +    * - start + 256:
> +      - Y'\ :sub:`2,0`
> +      - Y'\ :sub:`2,1`
> +      - Y'\ :sub:`2,2`
> +      - Y'\ :sub:`2,3`
> +      - ...
> +      - Y'\ :sub:`2,124`
> +      - Y'\ :sub:`2,125`
> +      - Y'\ :sub:`2,126`
> +      - Y'\ :sub:`2,127`
> +    * - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +    * - start + ((height-1) * 128):
> +      - Y'\ :sub:`height-1,0`
> +      - Y'\ :sub:`height-1,1`
> +      - Y'\ :sub:`height-1,2`
> +      - Y'\ :sub:`height-1,3`
> +      - ...
> +      - Y'\ :sub:`height-1,124`
> +      - Y'\ :sub:`height-1,125`
> +      - Y'\ :sub:`height-1,126`
> +      - Y'\ :sub:`height-1,127`
> +    * - start + ((height) * 128):
> +      - Cb\ :sub:`0,0`
> +      - Cr\ :sub:`0,0`
> +      - Cb\ :sub:`0,1`
> +      - Cr\ :sub:`0,1`
> +      - ...
> +      - Cb\ :sub:`0,62`
> +      - Cr\ :sub:`0,62`
> +      - Cb\ :sub:`0,63`
> +      - Cr\ :sub:`0,63`
> +    * - start + ((height+1) * 128):
> +      - Cb\ :sub:`1,0`
> +      - Cr\ :sub:`1,0`
> +      - Cb\ :sub:`1,1`
> +      - Cr\ :sub:`1,1`
> +      - ...
> +      - Cb\ :sub:`1,62`
> +      - Cr\ :sub:`1,62`
> +      - Cb\ :sub:`1,63`
> +      - Cr\ :sub:`1,63`
> +    * - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +    * - start + ((height+(height/2)-1) * 128):
> +      - Cb\ :sub:`(height/2)-1,0`
> +      - Cr\ :sub:`(height/2)-1,0`
> +      - Cb\ :sub:`(height/2)-1,1`
> +      - Cr\ :sub:`(height/2)-1,1`
> +      - ...
> +      - Cb\ :sub:`(height/2)-1,62`
> +      - Cr\ :sub:`(height/2)-1,62`
> +      - Cb\ :sub:`(height/2)-1,63`
> +      - Cr\ :sub:`(height/2)-1,63`
> +    * - start + (bytesperline * 128):
> +      - Y'\ :sub:`0,128`
> +      - Y'\ :sub:`0,129`
> +      - Y'\ :sub:`0,130`
> +      - Y'\ :sub:`0,131`
> +      - ...
> +      - Y'\ :sub:`0,252`
> +      - Y'\ :sub:`0,253`
> +      - Y'\ :sub:`0,254`
> +      - Y'\ :sub:`0,255`
> +    * - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +
> +V4L2_PIX_FMT_NV12_10_COL128 uses the same 128 byte column structure, but
> +encodes 10-bit YUV.
> +3 10-bit values are packed into 4 bytes as bits 9:0, 19:10, and 29:20, w=
ith
> +bits 30 & 31 unused. For the luma plane, bits 9:0 are Y0, 19:10 are Y1, =
and
> +29:20 are Y2. For the chroma plane the samples always come in pairs of C=
r
> +and Cb, so it needs to be considered 6 values packed in 8 bytes.
> +
> +Bit-packed representation.
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 8 8 8 8
> +
> +    * - Y'\ :sub:`00[7:0]`
> +      - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub:`00[9:8]`\ (bits 1--0)
> +      - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub:`01[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\ (bits 5--0)
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 12 12 12 12 12 12 12
> +
> +    * - Cb\ :sub:`00[7:0]`
> +      - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :sub:`00[9:8]`\ (bits 1--0)
> +      - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :sub:`00[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ (bits 5--0)
> +      - Cr\ :sub:`01[7:0]`
> +      - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :sub:`01[9:8]`\ (bits 1--0)
> +      - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :sub:`02[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ (bits 5--0)
> +
> +.. raw:: latex
> +
> +    \normalsize
> +
> +
> +
> +
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 1840224faa41..56ef9ee9c0e1 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -697,6 +697,18 @@ Data in the 12 high bits, zeros in the 4 low bits, a=
rranged in little endian ord
>        - Cr\ :sub:`11`
> =20
> =20
> +V4L2_PIX_FMT_NV12_COL128
> +------------------------
> +
> +``V4L2_PIX_FMT_NV12_COL128`` is the tiled version of
> +``V4L2_PIX_FMT_NV12`` with the image broken down into 128 pixel wide col=
umns of
> +Y followed by the associated combined CbCr plane.
> +The normal bytesperline is effectively fixed at 128. However the format
> +requires knowledge of the stride between columns, therefore the bytesper=
line
> +value has been repurposed to denote the number of 128 byte long lines be=
tween
> +the start of each column.
> +
> +
>  Fully Planar YUV Formats
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Docu=
mentation/userspace-api/media/v4l/yuv-formats.rst
> index 24b34cdfa6fe..458e07782c8d 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -270,4 +270,23 @@ image.
>      pixfmt-y8i
>      pixfmt-y12i
>      pixfmt-uv8
> +    pixfmt-yuyv
> +    pixfmt-uyvy
> +    pixfmt-yvyu
> +    pixfmt-vyuy
> +    pixfmt-y41p
> +    pixfmt-yuv420
> +    pixfmt-yuv420m
> +    pixfmt-yuv422m
> +    pixfmt-yuv444m
> +    pixfmt-yuv410
> +    pixfmt-yuv422p
> +    pixfmt-yuv411p
> +    pixfmt-nv12
> +    pixfmt-nv12m
> +    pixfmt-nv12mt
> +    pixfmt-nv12-col128
> +    pixfmt-nv16
> +    pixfmt-nv16m
> +    pixfmt-nv24

Unrelated fixes should have their own patch.

>      pixfmt-m420
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index f3584bc3e278..20c83a4c02d6 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1368,6 +1368,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_PIX_FMT_NV12MT:	descr =3D "Y/UV 4:2:0 (64x32 MB, N-C)"; break=
;
>  	case V4L2_PIX_FMT_NV12MT_16X16:	descr =3D "Y/UV 4:2:0 (16x16 MB, N-C)";=
 break;
>  	case V4L2_PIX_FMT_P012M:	descr =3D "12-bit Y/UV 4:2:0 (N-C)"; break;
> +	case V4L2_PIX_FMT_NV12_COL128:  descr =3D "Y/CbCr 4:2:0 (128b cols)"; b=
reak;
> +	case V4L2_PIX_FMT_NV12_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 (128b =
cols)"; break;
>  	case V4L2_PIX_FMT_YUV420M:	descr =3D "Planar YUV 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_YVU420M:	descr =3D "Planar YVU 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_YUV422M:	descr =3D "Planar YUV 4:2:2 (N-C)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 1c9e1275c422..f93e341a1dd7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -807,6 +807,10 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcom=
m 10-bit compressed */
>  #define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed =
JPEG */
>  #define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /* Hextile=
 compressed */
> +#define V4L2_PIX_FMT_NV12_COL128 v4l2_fourcc('N', 'C', '1', '2') /* 12  =
Y/CbCr 4:2:0 128 pixel wide column */
> +#define V4L2_PIX_FMT_NV12_10_COL128 v4l2_fourcc('N', 'C', '3', '0')
> +								/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
> +								 * a 128 bytes / 96 pixel wide column */
> =20
>  /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unuse=
d */
>  #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU=
3 packed 10-bit BGGR bayer */

Can you add this format to v4l2-common please?

Nicolas


