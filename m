Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D1824EDD8
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 17:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgHWPIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 11:08:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53756 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgHWPIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 11:08:47 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02EB9279;
        Sun, 23 Aug 2020 17:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598195321;
        bh=aRHKKbIzuzcc1zB3SZSw6wCNsc8boanIYJtbzti4zBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=axBoqfcmepkWKkVLe5pGATmqhgRBNucOb4IUgdEWmkPxONGIazO+qFAivbj7KVH5R
         sAhMWvsImPGMIzSz+Xo4MoNNkOudO5fJcB2c4lrtyB4+MVxmj/eF9a48fe+wY8KGZe
         q2asfzo0Jxl534PzmfcGvrqrG766wceWt8JjalOA=
Date:   Sun, 23 Aug 2020 18:08:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Goode <agoode@google.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/2] media: uvcvideo: Convey full ycbcr colorspace
 information to v4l2
Message-ID: <20200823150822.GD6002@pendragon.ideasonboard.com>
References: <20200823012134.3813457-1-agoode@google.com>
 <20200823012134.3813457-2-agoode@google.com>
 <20200823145417.GC6002@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200823145417.GC6002@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

(CC'ing Hans Verkuil)

On Sun, Aug 23, 2020 at 05:54:24PM +0300, Laurent Pinchart wrote:
> Hi Adam,
> 
> Thank you for the patch.
> 
> On Sat, Aug 22, 2020 at 09:21:34PM -0400, Adam Goode wrote:
> > The Color Matching Descriptor has been present in USB cameras since
> > the original version of UVC, but it has never been fully used
> > in Linux.
> > 
> > This change informs V4L2 of all of the critical colorspace parameters:
> > colorspace (called "color primaries" in UVC), transfer function
> > (called "transfer characteristics" in UVC), ycbcr encoding (called
> > "matrix coefficients" in UVC), and quantization, which is always
> > LIMITED for UVC, see section 2.26 in USB_Video_FAQ_1.5.pdf.
> 
> Isn't this valid for MJPEG only though ? There's not much else we can do
> though, as UVC cameras don't report quantization information. Shouldn't
> we however reflect this in the commit message, and in the comment below,
> to state that UVC requires limited quantization range for MJPEG, and
> while it doesn't explicitly specify the quantization range for other
> formats, we can only assume it should be limited as well ?
> 
> The code otherwise looks good to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Please let me know if you'd like to address the above issue.
> 
> > The quantization is the most important improvement for this patch,
> > because V4L2 will otherwise interpret MJPEG as FULL range. Web browsers
> > such as Chrome and Firefox already ignore V4L2's quantization for USB
> > devices and use the correct LIMITED value, but other programs such
> > as qv4l2 will incorrectly interpret the output of MJPEG from USB
> > cameras without this change.
> > 
> > Signed-off-by: Adam Goode <agoode@google.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 52 +++++++++++++++++++++++++++---
> >  drivers/media/usb/uvc/uvc_v4l2.c   |  6 ++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  5 ++-
> >  3 files changed, 58 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 431d86e1c94b..c0c81b089b7d 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -248,10 +248,10 @@ static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
> >  	return NULL;
> >  }
> >  
> > -static u32 uvc_colorspace(const u8 primaries)
> > +static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
> >  {
> > -	static const u8 colorprimaries[] = {
> > -		0,
> > +	static const enum v4l2_colorspace colorprimaries[] = {
> > +		V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
> >  		V4L2_COLORSPACE_SRGB,
> >  		V4L2_COLORSPACE_470_SYSTEM_M,
> >  		V4L2_COLORSPACE_470_SYSTEM_BG,
> > @@ -262,7 +262,43 @@ static u32 uvc_colorspace(const u8 primaries)
> >  	if (primaries < ARRAY_SIZE(colorprimaries))
> >  		return colorprimaries[primaries];
> >  
> > -	return 0;
> > +	return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
> > +}
> > +
> > +static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristics)
> > +{
> > +	static const enum v4l2_xfer_func xfer_funcs[] = {
> > +		V4L2_XFER_FUNC_DEFAULT,  /* Unspecified */
> > +		V4L2_XFER_FUNC_709,
> > +		V4L2_XFER_FUNC_709,      /* BT.470-2 M */
> > +		V4L2_XFER_FUNC_709,      /* BT.470-2 B, G */
> > +		V4L2_XFER_FUNC_709,      /* SMPTE 170M */
> > +		V4L2_XFER_FUNC_SMPTE240M,
> > +		V4L2_XFER_FUNC_NONE,     /* Linear (V = Lc) */
> > +		V4L2_XFER_FUNC_SRGB,
> > +	};
> > +
> > +	if (transfer_characteristics < ARRAY_SIZE(xfer_funcs))
> > +		return xfer_funcs[transfer_characteristics];
> > +
> > +	return V4L2_XFER_FUNC_DEFAULT;  /* Reserved */
> > +}
> > +
> > +static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coefficients)
> > +{
> > +	static const enum v4l2_ycbcr_encoding ycbcr_encs[] = {
> > +		V4L2_YCBCR_ENC_DEFAULT,  /* Unspecified */
> > +		V4L2_YCBCR_ENC_709,
> > +		V4L2_YCBCR_ENC_601,      /* FCC */

I may have spoken a bit too fast. Doesn't FCC differ from BT.601 ?
According to https://en.wikipedia.org/wiki/Talk%3AYCbCr, the former uses

 E'Y = 0.59 E'G + 0.11 E'B + 0.30 E'R
 E'PB = – 0.331 E'G + 0.500 E'B – 0.169 E'R
 E'PR = – 0.421 E'G – 0.079 E'B + 0.500 E'R

while the latter uses

 E'Y = 0.587 E'G + 0.114 E'B + 0.299 E'R
 E'PB = – 0.331 E'G + 0.500 E'B – 0.169 E'R
 E'PR = – 0.419 E'G – 0.081 E'B + 0.500 E'R

We seems to be missing FCC in the V4L2 color space definitions.

> > +		V4L2_YCBCR_ENC_601,      /* BT.470-2 B, G */
> > +		V4L2_YCBCR_ENC_601,      /* SMPTE 170M */
> > +		V4L2_YCBCR_ENC_SMPTE240M,
> > +	};
> > +
> > +	if (matrix_coefficients < ARRAY_SIZE(ycbcr_encs))
> > +		return ycbcr_encs[matrix_coefficients];
> > +
> > +	return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
> >  }
> >  
> >  /* Simplify a fraction using a simple continued fraction decomposition. The
> > @@ -704,6 +740,14 @@ static int uvc_parse_format(struct uvc_device *dev,
> >  		}
> >  
> >  		format->colorspace = uvc_colorspace(buffer[3]);
> > +		format->xfer_func = uvc_xfer_func(buffer[4]);
> > +		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
> > +		/* All USB YCbCr encodings use LIMITED range as of UVC 1.5.
> > +		 * This is true even for MJPEG, which V4L2 otherwise assumes to
> > +		 * be FULL.
> > +		 * See section 2.26 in USB_Video_FAQ_1.5.pdf.
> > +		 */
> > +		format->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> >  
> >  		buflen -= buffer[0];
> >  		buffer += buffer[0];
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 7f14096cb44d..79daf46b3dcd 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -279,6 +279,9 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> >  	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
> >  	fmt->fmt.pix.pixelformat = format->fcc;
> >  	fmt->fmt.pix.colorspace = format->colorspace;
> > +	fmt->fmt.pix.xfer_func = format->xfer_func;
> > +	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> > +	fmt->fmt.pix.quantization = format->quantization;
> >  
> >  	if (uvc_format != NULL)
> >  		*uvc_format = format;
> > @@ -315,6 +318,9 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> >  	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
> >  	fmt->fmt.pix.sizeimage = stream->ctrl.dwMaxVideoFrameSize;
> >  	fmt->fmt.pix.colorspace = format->colorspace;
> > +	fmt->fmt.pix.xfer_func = format->xfer_func;
> > +	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> > +	fmt->fmt.pix.quantization = format->quantization;
> >  
> >  done:
> >  	mutex_unlock(&stream->mutex);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 6ab972c643e3..6508192173dd 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -370,7 +370,10 @@ struct uvc_format {
> >  	u8 type;
> >  	u8 index;
> >  	u8 bpp;
> > -	u8 colorspace;
> > +	enum v4l2_colorspace colorspace;
> > +	enum v4l2_xfer_func xfer_func;
> > +	enum v4l2_ycbcr_encoding ycbcr_enc;
> > +	enum v4l2_quantization quantization;
> >  	u32 fcc;
> >  	u32 flags;
> >  

-- 
Regards,

Laurent Pinchart
