Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2D92B8B1B
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 06:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgKSFpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 00:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgKSFpv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 00:45:51 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261EEC0617A7
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 21:45:51 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q5so3385070pfk.6
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 21:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VRQFbqxcZnIZQsIuuPQpUphiPXekKlVUIfYw241Xodw=;
        b=YGUHpEtqejq1pzXLvqVjUuY+1EWHXE/4NGBuRq5lsavsFbAvZ0qQqxI5lAceDlEN42
         chiX5EHs1NRIJZRGAXTacZOdcjD4Xr7OksTz7uquKHxheErRhxt+JOUvqe8FSq4j7oX8
         1EDLXBfY/uXbLRT9sn5P9joHbi4XIgGEzJHvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VRQFbqxcZnIZQsIuuPQpUphiPXekKlVUIfYw241Xodw=;
        b=HtF9WuR8bkuuV9A/voQDG7fu/VhpsEcfvKqzNp4+d1hxpzc8ylktIZ8fsR1oefzyCe
         7VPNTFqmJeQ+oxBhVGBFmq6ldW8MNJN+w/72LbggHWegluKbejDeu58Kup0I3l0TPyQQ
         fYTqlrGtsqjJEawiNQSGAxLa8jgvpBQEXPGrcc77l0xS5gAztX1bBAutaa7bD4JV5Iad
         Fhqvx2nNykIyv9z5vStikIm6+CUVmYIKinr9aNJRFtnIsSP/O6t4dyWlkc6XoOVchPZ3
         03VE1sypzMifeQARzt01XmdZ5DqI3WGE7xuEqUjH5/nu9G+yw8koGaui9HMVD0A4cRyt
         RLBw==
X-Gm-Message-State: AOAM531m0qpqh8sjs5IEWJXXvvHP4kLiRgAH45iIZf0TYBZmj7Dp7tmv
        WIjtap3nnqF/fb0ke/fqZUEyFA==
X-Google-Smtp-Source: ABdhPJyRjS0GWlpAx9+X/e+fgaHXvQ7EgoFQB/wu5HboUqbL1NMaJ/cw1EHlo4sTYe0E1/EsysCY7A==
X-Received: by 2002:a17:90a:8043:: with SMTP id e3mr2810453pjw.52.1605764750642;
        Wed, 18 Nov 2020 21:45:50 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
        by smtp.gmail.com with ESMTPSA id e22sm4564761pjh.45.2020.11.18.21.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 21:45:49 -0800 (PST)
Date:   Thu, 19 Nov 2020 14:45:44 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        mjourdan@baylibre.com, stanimir.varbanov@linaro.org
Subject: Re: [PATCH v5 1/7] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
Message-ID: <20201119054544.GA590258@chromium.org>
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-2-helen.koike@collabora.com>
 <20201002194935.GB1131147@chromium.org>
 <f5c9f7cd-f8e1-0671-b4d9-8ed79917b0aa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5c9f7cd-f8e1-0671-b4d9-8ed79917b0aa@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 14, 2020 at 11:21:26AM -0300, Helen Koike wrote:
> Hi Tomasz,
> 
> On 10/2/20 4:49 PM, Tomasz Figa wrote:
> > Hi Helen,
> > 
> > On Tue, Aug 04, 2020 at 04:29:33PM -0300, Helen Koike wrote:
[snip]
> >> +static void v4l_print_ext_pix_format(const void *arg, bool write_only)
> >> +{
> >> +	const struct v4l2_ext_pix_format *pix = arg;
> >> +	unsigned int i;
> >> +
> >> +	pr_cont("type=%s, width=%u, height=%u, format=%c%c%c%c, modifier %llx, field=%s, colorspace=%d, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> >> +		prt_names(pix->type, v4l2_type_names),
> >> +		pix->width, pix->height,
> >> +		(pix->pixelformat & 0xff),
> >> +		(pix->pixelformat >>  8) & 0xff,
> >> +		(pix->pixelformat >> 16) & 0xff,
> >> +		(pix->pixelformat >> 24) & 0xff,
> >> +		pix->modifier, prt_names(pix->field, v4l2_field_names),
> >> +		pix->colorspace, pix->ycbcr_enc,
> >> +		pix->quantization, pix->xfer_func);
> >> +	for (i = 0; i < VIDEO_MAX_PLANES && pix->plane_fmt[i].sizeimage; i++)
> > 
> > This is going to print 8 lines every time. Maybe we could skip 0-sized
> > planes or something?
> 
> I'm already checking pix->plane_fmt[i].sizeimage in the loop, it shouldn't
> print 8 lines every time.
> 

Oops, how could I not notice it. Sorry for the noise.

[snip]
> >> +int v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *e,
> >> +				  struct v4l2_format *f, bool mplane_cap,
> >> +				  bool strict)
> >> +{
> >> +	const struct v4l2_plane_ext_pix_format *pe;
> >> +	struct v4l2_plane_pix_format *p;
> >> +	unsigned int i;
> >> +
> >> +	memset(f, 0, sizeof(*f));
> >> +
> >> +	/*
> >> +	 * Make sure no modifier is required before doing the
> >> +	 * conversion.
> >> +	 */
> >> +	if (e->modifier && strict &&
> > 
> > Do we need the explicit check for e->modifier != 0 if we have to check for
> > the 2 specific values below anyway?
> 
> We don't, since DRM_FORMAT_MOD_LINEAR is zero.
> 
> But I wanted to make it explicit we don't support modifiers in this conversion.
> But I can remove this check, no problem.
> 

Yes, please. I think the double checking is confusing for the reader.

> > 
> >> +	    e->modifier != DRM_FORMAT_MOD_LINEAR &&
> >> +	    e->modifier != DRM_FORMAT_MOD_INVALID)
> >> +		return -EINVAL;
> >> +
> >> +	if (!e->plane_fmt[0].sizeimage && strict)
> >> +		return -EINVAL;
> > 
> > Why is this incorrect?
> 
> !sizeimage for the first plane means that there are no planes in ef.
> strict is true if the result for the conversion should be returned to userspace
> and it is not some internal handling.
> 
> So if there are no planes, we would return an incomplete v4l2_format struct
> to userspace.
> 
> But this is not very clear, I'll improve this for the next version.
> 

So I can see 2 cases here:

1) Userspace gives ext struct and driver accepts legacy.

In this case, the kernel needs to adjust the structure to be correct.
-EINVAL is only valid if

"The struct v4l2_format type field is invalid or the requested buffer type not supported."

as per the current uAPI documentation.

2) Driver gives ext struct and userspace accepts legacy.

If at this point we get a struct with no planes, that sounds like a
driver bug, so rather than signaling -EINVAL to the userspace, we should
probably WARN()?

Or am I getting something wrong? :)

[snip]
> >> +{
> >> +	const struct v4l2_plane_pix_format *p;
> >> +	struct v4l2_plane_ext_pix_format *pe;
> >> +	unsigned int i;
> >> +
> >> +	memset(e, 0, sizeof(*e));
> >> +
> >> +	switch (f->type) {
> >> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> >> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> >> +		e->width = f->fmt.pix.width;
> >> +		e->height = f->fmt.pix.height;
> >> +		e->pixelformat = f->fmt.pix.pixelformat;
> >> +		e->field = f->fmt.pix.field;
> >> +		e->colorspace = f->fmt.pix.colorspace;
> >> +		if (f->fmt.pix.flags)
> >> +			pr_warn("Ignoring pixelformat flags 0x%x\n",
> >> +				f->fmt.pix.flags);
> > 
> > Would it make sense to print something like video node name and/or function
> > name to explain where this warning comes from?
> 
> I would need to update the function to receive this information, I can try but
> I'm not sure if it is worthy.
> 

I don't have a strong opinion on this, so maybe let's see if others have
any comments.

> > 
> >> +		e->ycbcr_enc = f->fmt.pix.ycbcr_enc;
> >> +		e->quantization = f->fmt.pix.quantization;
> > 
> > Missing xfer_func?
> 
> Yes, thanks for catching this.
> 
> > 
> >> +		e->plane_fmt[0].bytesperline = f->fmt.pix.bytesperline;
> >> +		e->plane_fmt[0].sizeimage = f->fmt.pix.sizeimage;
> > 
> > This doesn't look right. In the ext API we expected the planes to describe
> > color planes, which means that bytesperline needs to be computed for planes
> >> = 1 and sizeimage replaced with per-plane sizes, according to the
> >> pixelformat.
> 
> Ack.
> 
> Just to be clear, even if we are using a planar format that isn't a V4L2_PIX_FMT_*M
> variant, we should describe every plane separatly.
> 
> For instance, if V4L2_PIX_FMT_YVU420 is being used, then f->fmt.pix.bytesperline
> will have data, and we need to calculate bytesperline for all 3 planes, so we'll fill
> out:
> 
> f->plane_fmt[0].bytesperline = f->fmt.pix.bytesperline;
> f->plane_fmt[1].bytesperline = f->fmt.pix.bytesperline / hdiv;
> f->plane_fmt[2].bytesperline = f->fmt.pix.bytesperline / hdiv;
> 
> I'll update this for the next version.
> 

Yes. This basically gives us a unified representation across all
pixelformats and allows userspace to handle them in a uniform way, as
opposed to current uAPI.

[snip]
> >> +		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> >> +			e->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> >> +		else
> >> +			e->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> >> +
> >> +		for (i = 0; i < VIDEO_MAX_PLANES; i++) {
> >> +			pe = &e->plane_fmt[i];
> >> +			p = &f->fmt.pix_mp.plane_fmt[i];
> >> +			pe->bytesperline = p->bytesperline;
> >> +			pe->sizeimage = p->sizeimage;
> >> +		}
> > 
> > Same here. A blind copy is not enough. For non-M formats, the plane
> > parameters need to be filled according to the pixelformat.
> 
> 
> Right, following the idea above, we need a different handling if we
> aren't using a M-variant of the pixelformat, and we also need to
> convert the pixelformat from the M-variant to non-M-variant.
> 
> I'll also need to save that the original format was a
> M-variant or not, so I can convert it back as expected.

I'm still reading the rest of the series, so it might be answered
already, but did we decide to do anything about the pixelformat codes
themselves? If both M and non-M variants would be allowed with the new
API, then I guess there isn't anything to save, because the original
format would be preserved?

> 
> I'll change this and submit for review.
> 

Cool, thanks.

Best regards,
Tomasz
