Return-Path: <linux-media+bounces-6512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC68727DA
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 20:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF1B428E98C
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 19:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B9B5915D;
	Tue,  5 Mar 2024 19:43:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1DB58128
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709667832; cv=none; b=XXObsaG3XRftluB+n45fMcRUBVmxjiN1MMEgyY9FLyMN22eOPR+7slH8SRPRJIDqEjcF4OfjEe0ZdDOPLIYyUgmjq46SEW3roEaa9lnaA3yXPQuO1OyI09+oan/hBiNNZTyTmF2CFUvGmCg1+6NIeRoMEyopc1J52n1ZKP9zgwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709667832; c=relaxed/simple;
	bh=GE5PYdhYZ/5fXM7hMUnWUK1/bWOQbzdz5vNrfjTWJ7g=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=M7xnuhtx7yVgrJ4IrFvcW93fMZalBYZiRi5J4Uyeqi7U5mwd7E7gLv5qrARP2tTUvWvCyHcU4NX16PXIy56ZT5M03zMLE8YF9b4/yN9q0/fbo2EVqy1l+1eK8WTGAhIKlxM7OdoIEp6PE1nYlN+YzPbVmmR6YDWqM2Rqs8PpVhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
	by mail.rmail.be (Postfix) with ESMTP id 28D454C741;
	Tue,  5 Mar 2024 20:43:49 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 05 Mar 2024 20:43:48 +0100
From: Maarten <maarten@rmail.be>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Kieran Bingham
 <kbingham@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [RFC PATCH 04/13] media: videodev2.h: Add a format for column
 YUV4:2:0 modes
In-Reply-To: <CAPY8ntBOEtigg-8mR9CZoMiNMDGkYnB-5Rq4NT96AXYbH2K38A@mail.gmail.com>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-5-maarten@rmail.be>
 <42bfe748423d0992d001ce23ec1cf209142c3739.camel@ndufresne.ca>
 <CAPY8ntBOEtigg-8mR9CZoMiNMDGkYnB-5Rq4NT96AXYbH2K38A@mail.gmail.com>
Message-ID: <517b5decb4c358017c0000772c5b23c6@rmail.be>
X-Sender: maarten@rmail.be
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Dave Stevenson schreef op 2024-03-05 19:53:
> Hi Maarten and Nicolas
> 
> Sorry, I've not got much time to look at these patches at present.

No problem, neither do I :-)

> On Mon, 4 Mar 2024 at 18:10, Nicolas Dufresne <nicolas@ndufresne.ca> 
> wrote:
>> 
>> Hi,
>> 
>> Le dimanche 03 mars 2024 à 16:09 +0100, Maarten Vanraes a écrit :
>> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> >
>> > Some of the Broadcom codec blocks use a column based YUV4:2:0 image
>> > format, so add the documentation and defines for both 8 and 10 bit
>> > versions.
> 
> TBH Whilst some of the firmware components do support the column
> format, this has limited gain in this series.
> 
> It will be needed for the HEVC stateless decoder as and when that gets
> upstreamed.

Should I look at some further patches regarding this in a branch where 
this HEVC stateless decoder is?

Maarten

>> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> > Signed-off-by: Maarten Vanraes <maarten@rmail.be>
>> > ---
>> >  .../media/v4l/pixfmt-nv12-col128.rst          | 215 ++++++++++++++++++
>> >  .../media/v4l/pixfmt-yuv-planar.rst           |  12 +
>> >  .../userspace-api/media/v4l/yuv-formats.rst   |  19 ++
>> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>> >  include/uapi/linux/videodev2.h                |   4 +
>> >  5 files changed, 252 insertions(+)
>> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12-col128.rst
>> >
>> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-nv12-col128.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12-col128.rst
>> > new file mode 100644
>> > index 000000000000..196ca33a5dff
>> > --- /dev/null
>> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12-col128.rst
>> > @@ -0,0 +1,215 @@
>> > +.. Permission is granted to copy, distribute and/or modify this
>> > +.. document under the terms of the GNU Free Documentation License,
>> > +.. Version 1.1 or any later version published by the Free Software
>> > +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>> > +.. and no Back-Cover Texts. A copy of the license is included at
>> > +.. Documentation/media/uapi/fdl-appendix.rst.
>> > +..
>> > +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>> > +
>> > +.. _V4L2_PIX_FMT_NV12_COL128:
>> > +.. _V4L2_PIX_FMT_NV12_10_COL128:
>> > +
>> > +********************************************************************************
>> > +V4L2_PIX_FMT_NV12_COL128, V4L2_PIX_FMT_NV12_10_COL128
>> > +********************************************************************************
>> > +
>> > +
>> > +V4L2_PIX_FMT_NV21_COL128
>> > +Formats with ½ horizontal and vertical chroma resolution. This format
>> > +has two planes - one for luminance and one for chrominance. Chroma
>> > +samples are interleaved. The difference to ``V4L2_PIX_FMT_NV12`` is the
>> > +memory layout. The image is split into columns of 128 bytes wide rather than
>> > +being in raster order.
>> > +
>> > +V4L2_PIX_FMT_NV12_10_COL128
>> > +Follows the same pattern as ``V4L2_PIX_FMT_NV21_COL128`` with 128 byte, but is
>> > +a 10bit format with 3 10-bit samples being packed into 4 bytes. Each 128 byte
>> > +wide column therefore contains 96 samples.
>> 
>> Might be worth saying which side the padding goes. Xilinx uses a 
>> non-tiled
>> version of this, but depending were the padding is placed (LSB or MSB) 
>> it may
>> not actually be the same format.
> 
> It's documented later in this page
>  +    * - Y'\ :sub:`00[7:0]`
>  +      - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub:`00[9:8]`\ (bits 
> 1--0)
>  +      - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub:`01[9:6]`\ (bits 
> 3--0)
>  +      - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\ (bits 5--0)
> 
> I only see V4L2_PIX_FMT_P010 and V4L2_PIX_FMT_NV12M_10BE_8L128 in the
> tree as 10bit YUV formats. Neither matches that packing.
> 
>> > +
>> > +
>> > +Description
>> > +===========
>> > +
>> > +This is the two-plane versions of the YUV 4:2:0 format where data is
>> > +grouped into 128 byte wide columns. The three components are separated into
>> > +two sub-images or planes. The Y plane has one byte per pixel and pixels
>> > +are grouped into 128 byte wide columns. The CbCr plane has the same width,
>> > +in bytes, as the Y plane (and the image), but is half as tall in pixels.
>> > +The chroma plane is also in 128 byte columns, reflecting 64 Cb and 64 Cr
>> > +samples.
>> > +
>> > +The chroma samples for a column follow the luma samples. If there is any
>> > +paddding, then that will be reflected via the selection API.
>> > +The luma height must be a multiple of 2 lines.
>> > +
>> > +The normal bytesperline is effectively fixed at 128. However the format
>> > +requires knowledge of the stride between columns, therefore the bytesperline
>> > +value has been repurposed to denote the number of 128 byte long lines between
>> > +the start of each column.
>> 
>> I would refrain from a redefinition of bytesperline here. Specially 
>> that this
>> seems to be a non-mplane definition (single allocation format). In 
>> that case,
>> userspace may be forced to extrapolate some information. I'd keep it 
>> strictly to
>> the definition.
>> 
>>   byteperlines = n_col * 128
>>   n_cols = roundup_128(width) / 128
>> 
>> As the height returned by TRY_FMT (and S_FMT), is padded, you can 
>> always
>> retrieve your tile stride (column stride in this specific case) with:
>> 
>>   tile_stride = height * 128
> 
> Each column (tile if you wish) contains both luma and chroma. Height
> is the height of the luma. Chroma comes after the luma per column.
> tile_stride = height * 128 does not give you where the next column
> begins - it'd be the start of the chroma for the first column, and
> then a useless pointer. This is why we were repurposing bytesperline
> for column stride.
> 
> There may be an option if you only allow sizeimage to be set by the
> driver, then I believe you could flip it around and use sizeimage /
> n_cols.
> 
>   Dave
> 
>> Nicolas
>> 
>> > +
>> > +**Byte Order.**
>> > +
>> > +
>> > +.. flat-table::
>> > +    :header-rows:  0
>> > +    :stub-columns: 0
>> > +    :widths: 12 12 12 12 12 4 12 12 12 12
>> > +
>> > +    * - start + 0:
>> > +      - Y'\ :sub:`0,0`
>> > +      - Y'\ :sub:`0,1`
>> > +      - Y'\ :sub:`0,2`
>> > +      - Y'\ :sub:`0,3`
>> > +      - ...
>> > +      - Y'\ :sub:`0,124`
>> > +      - Y'\ :sub:`0,125`
>> > +      - Y'\ :sub:`0,126`
>> > +      - Y'\ :sub:`0,127`
>> > +    * - start + 128:
>> > +      - Y'\ :sub:`1,0`
>> > +      - Y'\ :sub:`1,1`
>> > +      - Y'\ :sub:`1,2`
>> > +      - Y'\ :sub:`1,3`
>> > +      - ...
>> > +      - Y'\ :sub:`1,124`
>> > +      - Y'\ :sub:`1,125`
>> > +      - Y'\ :sub:`1,126`
>> > +      - Y'\ :sub:`1,127`
>> > +    * - start + 256:
>> > +      - Y'\ :sub:`2,0`
>> > +      - Y'\ :sub:`2,1`
>> > +      - Y'\ :sub:`2,2`
>> > +      - Y'\ :sub:`2,3`
>> > +      - ...
>> > +      - Y'\ :sub:`2,124`
>> > +      - Y'\ :sub:`2,125`
>> > +      - Y'\ :sub:`2,126`
>> > +      - Y'\ :sub:`2,127`
>> > +    * - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +    * - start + ((height-1) * 128):
>> > +      - Y'\ :sub:`height-1,0`
>> > +      - Y'\ :sub:`height-1,1`
>> > +      - Y'\ :sub:`height-1,2`
>> > +      - Y'\ :sub:`height-1,3`
>> > +      - ...
>> > +      - Y'\ :sub:`height-1,124`
>> > +      - Y'\ :sub:`height-1,125`
>> > +      - Y'\ :sub:`height-1,126`
>> > +      - Y'\ :sub:`height-1,127`
>> > +    * - start + ((height) * 128):
>> > +      - Cb\ :sub:`0,0`
>> > +      - Cr\ :sub:`0,0`
>> > +      - Cb\ :sub:`0,1`
>> > +      - Cr\ :sub:`0,1`
>> > +      - ...
>> > +      - Cb\ :sub:`0,62`
>> > +      - Cr\ :sub:`0,62`
>> > +      - Cb\ :sub:`0,63`
>> > +      - Cr\ :sub:`0,63`
>> > +    * - start + ((height+1) * 128):
>> > +      - Cb\ :sub:`1,0`
>> > +      - Cr\ :sub:`1,0`
>> > +      - Cb\ :sub:`1,1`
>> > +      - Cr\ :sub:`1,1`
>> > +      - ...
>> > +      - Cb\ :sub:`1,62`
>> > +      - Cr\ :sub:`1,62`
>> > +      - Cb\ :sub:`1,63`
>> > +      - Cr\ :sub:`1,63`
>> > +    * - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +    * - start + ((height+(height/2)-1) * 128):
>> > +      - Cb\ :sub:`(height/2)-1,0`
>> > +      - Cr\ :sub:`(height/2)-1,0`
>> > +      - Cb\ :sub:`(height/2)-1,1`
>> > +      - Cr\ :sub:`(height/2)-1,1`
>> > +      - ...
>> > +      - Cb\ :sub:`(height/2)-1,62`
>> > +      - Cr\ :sub:`(height/2)-1,62`
>> > +      - Cb\ :sub:`(height/2)-1,63`
>> > +      - Cr\ :sub:`(height/2)-1,63`
>> > +    * - start + (bytesperline * 128):
>> > +      - Y'\ :sub:`0,128`
>> > +      - Y'\ :sub:`0,129`
>> > +      - Y'\ :sub:`0,130`
>> > +      - Y'\ :sub:`0,131`
>> > +      - ...
>> > +      - Y'\ :sub:`0,252`
>> > +      - Y'\ :sub:`0,253`
>> > +      - Y'\ :sub:`0,254`
>> > +      - Y'\ :sub:`0,255`
>> > +    * - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +      - ...
>> > +
>> > +V4L2_PIX_FMT_NV12_10_COL128 uses the same 128 byte column structure, but
>> > +encodes 10-bit YUV.
>> > +3 10-bit values are packed into 4 bytes as bits 9:0, 19:10, and 29:20, with
>> > +bits 30 & 31 unused. For the luma plane, bits 9:0 are Y0, 19:10 are Y1, and
>> > +29:20 are Y2. For the chroma plane the samples always come in pairs of Cr
>> > +and Cb, so it needs to be considered 6 values packed in 8 bytes.
>> > +
>> > +Bit-packed representation.
>> > +
>> > +.. raw:: latex
>> > +
>> > +    \small
>> > +
>> > +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
>> > +
>> > +.. flat-table::
>> > +    :header-rows:  0
>> > +    :stub-columns: 0
>> > +    :widths: 8 8 8 8
>> > +
>> > +    * - Y'\ :sub:`00[7:0]`
>> > +      - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub:`00[9:8]`\ (bits 1--0)
>> > +      - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub:`01[9:6]`\ (bits 3--0)
>> > +      - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\ (bits 5--0)
>> > +
>> > +.. raw:: latex
>> > +
>> > +    \small
>> > +
>> > +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
>> > +
>> > +.. flat-table::
>> > +    :header-rows:  0
>> > +    :stub-columns: 0
>> > +    :widths: 12 12 12 12 12 12 12 12
>> > +
>> > +    * - Cb\ :sub:`00[7:0]`
>> > +      - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :sub:`00[9:8]`\ (bits 1--0)
>> > +      - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :sub:`00[9:6]`\ (bits 3--0)
>> > +      - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ (bits 5--0)
>> > +      - Cr\ :sub:`01[7:0]`
>> > +      - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :sub:`01[9:8]`\ (bits 1--0)
>> > +      - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :sub:`02[9:6]`\ (bits 3--0)
>> > +      - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ (bits 5--0)
>> > +
>> > +.. raw:: latex
>> > +
>> > +    \normalsize
>> > +
>> > +
>> > +
>> > +
>> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> > index 1840224faa41..56ef9ee9c0e1 100644
>> > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> > @@ -697,6 +697,18 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
>> >        - Cr\ :sub:`11`
>> >
>> >
>> > +V4L2_PIX_FMT_NV12_COL128
>> > +------------------------
>> > +
>> > +``V4L2_PIX_FMT_NV12_COL128`` is the tiled version of
>> > +``V4L2_PIX_FMT_NV12`` with the image broken down into 128 pixel wide columns of
>> > +Y followed by the associated combined CbCr plane.
>> > +The normal bytesperline is effectively fixed at 128. However the format
>> > +requires knowledge of the stride between columns, therefore the bytesperline
>> > +value has been repurposed to denote the number of 128 byte long lines between
>> > +the start of each column.
>> > +
>> > +
>> >  Fully Planar YUV Formats
>> >  ========================
>> >
>> > diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
>> > index 24b34cdfa6fe..458e07782c8d 100644
>> > --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
>> > +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
>> > @@ -270,4 +270,23 @@ image.
>> >      pixfmt-y8i
>> >      pixfmt-y12i
>> >      pixfmt-uv8
>> > +    pixfmt-yuyv
>> > +    pixfmt-uyvy
>> > +    pixfmt-yvyu
>> > +    pixfmt-vyuy
>> > +    pixfmt-y41p
>> > +    pixfmt-yuv420
>> > +    pixfmt-yuv420m
>> > +    pixfmt-yuv422m
>> > +    pixfmt-yuv444m
>> > +    pixfmt-yuv410
>> > +    pixfmt-yuv422p
>> > +    pixfmt-yuv411p
>> > +    pixfmt-nv12
>> > +    pixfmt-nv12m
>> > +    pixfmt-nv12mt
>> > +    pixfmt-nv12-col128
>> > +    pixfmt-nv16
>> > +    pixfmt-nv16m
>> > +    pixfmt-nv24
>> 
>> Unrelated fixes should have their own patch.
>> 
>> >      pixfmt-m420
>> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> > index f3584bc3e278..20c83a4c02d6 100644
>> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> > @@ -1368,6 +1368,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>> >       case V4L2_PIX_FMT_NV12MT:       descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
>> >       case V4L2_PIX_FMT_NV12MT_16X16: descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
>> >       case V4L2_PIX_FMT_P012M:        descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
>> > +     case V4L2_PIX_FMT_NV12_COL128:  descr = "Y/CbCr 4:2:0 (128b cols)"; break;
>> > +     case V4L2_PIX_FMT_NV12_10_COL128: descr = "10-bit Y/CbCr 4:2:0 (128b cols)"; break;
>> >       case V4L2_PIX_FMT_YUV420M:      descr = "Planar YUV 4:2:0 (N-C)"; break;
>> >       case V4L2_PIX_FMT_YVU420M:      descr = "Planar YVU 4:2:0 (N-C)"; break;
>> >       case V4L2_PIX_FMT_YUV422M:      descr = "Planar YUV 4:2:2 (N-C)"; break;
>> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> > index 1c9e1275c422..f93e341a1dd7 100644
>> > --- a/include/uapi/linux/videodev2.h
>> > +++ b/include/uapi/linux/videodev2.h
>> > @@ -807,6 +807,10 @@ struct v4l2_pix_format {
>> >  #define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcomm 10-bit compressed */
>> >  #define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
>> >  #define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /* Hextile compressed */
>> > +#define V4L2_PIX_FMT_NV12_COL128 v4l2_fourcc('N', 'C', '1', '2') /* 12  Y/CbCr 4:2:0 128 pixel wide column */
>> > +#define V4L2_PIX_FMT_NV12_10_COL128 v4l2_fourcc('N', 'C', '3', '0')
>> > +                                                             /* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
>> > +                                                              * a 128 bytes / 96 pixel wide column */
>> >
>> >  /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
>> >  #define V4L2_PIX_FMT_IPU3_SBGGR10    v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
>> 
>> Can you add this format to v4l2-common please?
>> 
>> Nicolas
>> 

