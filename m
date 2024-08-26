Return-Path: <linux-media+bounces-16811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A495F293
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBFA5280E79
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E112317C9B2;
	Mon, 26 Aug 2024 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HLjRh81L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A454F13C695;
	Mon, 26 Aug 2024 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678089; cv=none; b=sYLUKhSzTK3b+pe6TpCIUULyYgrdl67rtbg1lHfOngWzk4F5w3TIwvJU52t/SH5iB9lPvZ3Q+NmcZuZTbUbZH9gg/BrGFirG5HxJZwBnUHgD5bPTWZdu/Kyzq+eSW5tO4OvDvZpGSJ7GyWE6rKO8kbzWRi5tmG7BB6CtUYJhAMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678089; c=relaxed/simple;
	bh=Zbu3owATBHFE0dCENHORTCh7/a9HLQ8mEjtM08wyPOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPShDU57QuaDmADvb9LXgSeUIQ8FLKSK69A19hxtfLU5wi7ffCJPNsGK9BMks1Jkdzoc0A0MIHDfVqkVNXSVVSzu12Ng1V9vXXE/vYVhi744+EJVM10cYrvvMagQwT9CYoUu9DKibphwoM1hwQaZTrgKV+8wrVsE8E2ZBNaH42g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HLjRh81L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 792DA480;
	Mon, 26 Aug 2024 15:13:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724678019;
	bh=Zbu3owATBHFE0dCENHORTCh7/a9HLQ8mEjtM08wyPOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLjRh81LSBTLTMuEG3hDepKeiYueP1Hx+sX69mvSY5ZXT0cbOL0WkfLYOAtQ+ZZUB
	 uo3XqbYojg90nUFA7NZZvOrdic4DdON3+szMxegLDzasd5qkTg3dH/iVpswG+CSweE
	 Z7JZIEAJeeKpSz1l6/7TBPmJ22jEFOdRiWt7Bb7M=
Date: Mon, 26 Aug 2024 16:14:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Perchanov <dmitry.perchanov@intel.com>
Cc: linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@iki.fi, demisrael@gmail.com,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/2] v4l: Add luma 16-bit interlaced pixel format
Message-ID: <20240826131441.GA11033@pendragon.ideasonboard.com>
References: <c7c24f3f6661e5a01aae4e7ef549801411f063cb.camel@intel.com>
 <568efbd75290e286b8ad9e7347b5f43745121020.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <568efbd75290e286b8ad9e7347b5f43745121020.camel@intel.com>

Hi Dmitry,

Thank you for the patch.

On Mon, Aug 26, 2024 at 04:04:23PM +0300, Dmitry Perchanov wrote:
> The formats added by this patch are:
> 
>         V4L2_PIX_FMT_Y16I
> 
> Interlaced lumina format primary use in RealSense
> Depth cameras with stereo stream for left and right
> image sensors.
> 
> Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-y16i.rst   | 74 +++++++++++++++++++
>  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 77 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> new file mode 100644
> index 000000000000..fe4f441cd63c
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> @@ -0,0 +1,74 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _V4L2-PIX-FMT-Y16I:
> +
> +**************************
> +V4L2_PIX_FMT_Y16I ('Y16I')
> +**************************
> +
> +Interleaved grey-scale image, e.g. from a stereo-pair
> +
> +
> +Description
> +===========
> +
> +This is a grey-scale image with a depth of 16 bits per pixel, but with
> +pixels from 2 sources interleaved and unpacked. Each pixel is stored
> +in a 16-bit word in the little-endian order.
> +The first pixel is from the left source.

You can reflow this to 80 columns:

This is a grey-scale image with a depth of 16 bits per pixel, but with pixels
from 2 sources interleaved and unpacked. Each pixel is stored in a 16-bit word
in the little-endian order. The first pixel is from the left source.

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I can make that change locally, no need to send a new version just for
this.

> +
> +**Pixel unpacked representation.**
> +Left/Right pixels 16-bit unpacked - 16-bit for each interleaved pixel.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - Y'\ :sub:`0L[7:0]`
> +      - Y'\ :sub:`0L[15:8]`
> +      - Y'\ :sub:`0R[7:0]`
> +      - Y'\ :sub:`0R[15:8]`
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00Llow`
> +      - Y'\ :sub:`00Lhigh`
> +      - Y'\ :sub:`00Rlow`
> +      - Y'\ :sub:`00Rhigh`
> +      - Y'\ :sub:`01Llow`
> +      - Y'\ :sub:`01Lhigh`
> +      - Y'\ :sub:`01Rlow`
> +      - Y'\ :sub:`01Rhigh`
> +    * - start + 8:
> +      - Y'\ :sub:`10Llow`
> +      - Y'\ :sub:`10Lhigh`
> +      - Y'\ :sub:`10Rlow`
> +      - Y'\ :sub:`10Rhigh`
> +      - Y'\ :sub:`11Llow`
> +      - Y'\ :sub:`11Lhigh`
> +      - Y'\ :sub:`11Rlow`
> +      - Y'\ :sub:`11Rhigh`
> +    * - start + 16:
> +      - Y'\ :sub:`20Llow`
> +      - Y'\ :sub:`20Lhigh`
> +      - Y'\ :sub:`20Rlow`
> +      - Y'\ :sub:`20Rhigh`
> +      - Y'\ :sub:`21Llow`
> +      - Y'\ :sub:`21Lhigh`
> +      - Y'\ :sub:`21Rlow`
> +      - Y'\ :sub:`21Rhigh`
> +    * - start + 24:
> +      - Y'\ :sub:`30Llow`
> +      - Y'\ :sub:`30Lhigh`
> +      - Y'\ :sub:`30Rlow`
> +      - Y'\ :sub:`30Rhigh`
> +      - Y'\ :sub:`31Llow`
> +      - Y'\ :sub:`31Lhigh`
> +      - Y'\ :sub:`31Rlow`
> +      - Y'\ :sub:`31Rhigh`
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> index 24b34cdfa6fe..78ee406d7647 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -269,5 +269,6 @@ image.
>      pixfmt-yuv-luma
>      pixfmt-y8i
>      pixfmt-y12i
> +    pixfmt-y16i
>      pixfmt-uv8
>      pixfmt-m420
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 5eb4d797d259..4fffa5739895 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1327,6 +1327,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y16I:		descr = "Interleaved 16-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
>  	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
>  	case V4L2_PIX_FMT_CNF4:		descr = "4-bit Depth Confidence (Packed)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 4e91362da6da..46f616e43ad6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -797,6 +797,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_S5C_UYVY_JPG v4l2_fourcc('S', '5', 'C', 'I') /* S5C73M3 interleaved UYVY/JPEG */
>  #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greyscale 8-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
> +#define V4L2_PIX_FMT_Y16I     v4l2_fourcc('Y', '1', '6', 'I') /* Greyscale 16-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
>  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
>  #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */

-- 
Regards,

Laurent Pinchart

