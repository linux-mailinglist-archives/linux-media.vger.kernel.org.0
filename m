Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03EA31BA96
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 14:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhBONwb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 08:52:31 -0500
Received: from mga14.intel.com ([192.55.52.115]:18236 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230396AbhBONwK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 08:52:10 -0500
IronPort-SDR: yZNs0EFOXYCE/qS0LsDyrtFV9TgokYIPKgP++f8eu2E0aETaTp3+SS8+zz4Z/O070FsuzbgCTx
 N32bJkVtnq+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="181905029"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="181905029"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:50:06 -0800
IronPort-SDR: 9QWvM8xuFYBl4HFSZ3i28lCGUe8igoX2wQowNppmudIDoqXasZanxG9WE5SzMAzTDa9ljcucBy
 xCocQnZgwzWQ==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="363812217"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:50:02 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0870B20345;
        Mon, 15 Feb 2021 15:50:00 +0200 (EET)
Date:   Mon, 15 Feb 2021 15:50:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v7 2/3] v4l: ioctl: Use %p4cc printk modifier to print
 FourCC codes
Message-ID: <20210215134959.GH3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-3-sakari.ailus@linux.intel.com>
 <YCp4TN0nMuHdKpkf@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCp4TN0nMuHdKpkf@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Mon, Feb 15, 2021 at 03:34:04PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 15, 2021 at 01:40:29PM +0200, Sakari Ailus wrote:
> > Now that we can print FourCC codes directly using printk, make use of the
> > feature in V4L2 core.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> See also below.

Thanks for the review, and the tag!

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 85 +++++++---------------------
> >  1 file changed, 21 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 31d1342e61e8..31662c3a8c9e 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -265,13 +265,9 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
> >  {
> >  	const struct v4l2_fmtdesc *p = arg;
> >  
> > -	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
> > +	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%p4cc, mbus_code=0x%04x, description='%.*s'\n",
> >  		p->index, prt_names(p->type, v4l2_type_names),
> > -		p->flags, (p->pixelformat & 0xff),
> > -		(p->pixelformat >>  8) & 0xff,
> > -		(p->pixelformat >> 16) & 0xff,
> > -		(p->pixelformat >> 24) & 0xff,
> > -		p->mbus_code,
> > +		p->flags, &p->pixelformat, p->mbus_code,
> >  		(int)sizeof(p->description), p->description);
> >  }
> >  
> > @@ -293,12 +289,8 @@ static void v4l_print_format(const void *arg, bool write_only)
> >  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> >  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> >  		pix = &p->fmt.pix;
> > -		pr_cont(", width=%u, height=%u, pixelformat=%c%c%c%c, field=%s, bytesperline=%u, sizeimage=%u, colorspace=%d, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> > -			pix->width, pix->height,
> > -			(pix->pixelformat & 0xff),
> > -			(pix->pixelformat >>  8) & 0xff,
> > -			(pix->pixelformat >> 16) & 0xff,
> > -			(pix->pixelformat >> 24) & 0xff,
> > +		pr_cont(", width=%u, height=%u, pixelformat=%p4cc, field=%s, bytesperline=%u, sizeimage=%u, colorspace=%d, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> > +			pix->width, pix->height, &pix->pixelformat,
> >  			prt_names(pix->field, v4l2_field_names),
> >  			pix->bytesperline, pix->sizeimage,
> >  			pix->colorspace, pix->flags, pix->ycbcr_enc,
> > @@ -307,12 +299,8 @@ static void v4l_print_format(const void *arg, bool write_only)
> >  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> >  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> >  		mp = &p->fmt.pix_mp;
> > -		pr_cont(", width=%u, height=%u, format=%c%c%c%c, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> > -			mp->width, mp->height,
> > -			(mp->pixelformat & 0xff),
> > -			(mp->pixelformat >>  8) & 0xff,
> > -			(mp->pixelformat >> 16) & 0xff,
> > -			(mp->pixelformat >> 24) & 0xff,
> > +		pr_cont(", width=%u, height=%u, format=%p4cc, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> > +			mp->width, mp->height, &mp->pixelformat,
> >  			prt_names(mp->field, v4l2_field_names),
> >  			mp->colorspace, mp->num_planes, mp->flags,
> >  			mp->ycbcr_enc, mp->quantization, mp->xfer_func);
> > @@ -337,13 +325,9 @@ static void v4l_print_format(const void *arg, bool write_only)
> >  	case V4L2_BUF_TYPE_VBI_CAPTURE:
> >  	case V4L2_BUF_TYPE_VBI_OUTPUT:
> >  		vbi = &p->fmt.vbi;
> > -		pr_cont(", sampling_rate=%u, offset=%u, samples_per_line=%u, sample_format=%c%c%c%c, start=%u,%u, count=%u,%u\n",
> > +		pr_cont(", sampling_rate=%u, offset=%u, samples_per_line=%u, sample_format=%p4cc, start=%u,%u, count=%u,%u\n",
> >  			vbi->sampling_rate, vbi->offset,
> > -			vbi->samples_per_line,
> > -			(vbi->sample_format & 0xff),
> > -			(vbi->sample_format >>  8) & 0xff,
> > -			(vbi->sample_format >> 16) & 0xff,
> > -			(vbi->sample_format >> 24) & 0xff,
> > +			vbi->samples_per_line, &vbi->sample_format,
> >  			vbi->start[0], vbi->start[1],
> >  			vbi->count[0], vbi->count[1]);
> >  		break;
> > @@ -360,21 +344,13 @@ static void v4l_print_format(const void *arg, bool write_only)
> >  	case V4L2_BUF_TYPE_SDR_CAPTURE:
> >  	case V4L2_BUF_TYPE_SDR_OUTPUT:
> >  		sdr = &p->fmt.sdr;
> > -		pr_cont(", pixelformat=%c%c%c%c\n",
> > -			(sdr->pixelformat >>  0) & 0xff,
> > -			(sdr->pixelformat >>  8) & 0xff,
> > -			(sdr->pixelformat >> 16) & 0xff,
> > -			(sdr->pixelformat >> 24) & 0xff);
> > +		pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
> >  		break;
> >  	case V4L2_BUF_TYPE_META_CAPTURE:
> >  	case V4L2_BUF_TYPE_META_OUTPUT:
> >  		meta = &p->fmt.meta;
> > -		pr_cont(", dataformat=%c%c%c%c, buffersize=%u\n",
> > -			(meta->dataformat >>  0) & 0xff,
> > -			(meta->dataformat >>  8) & 0xff,
> > -			(meta->dataformat >> 16) & 0xff,
> > -			(meta->dataformat >> 24) & 0xff,
> > -			meta->buffersize);
> > +		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
> > +			&meta->dataformat, meta->buffersize);
> >  		break;
> >  	}
> >  }
> > @@ -383,15 +359,10 @@ static void v4l_print_framebuffer(const void *arg, bool write_only)
> >  {
> >  	const struct v4l2_framebuffer *p = arg;
> >  
> > -	pr_cont("capability=0x%x, flags=0x%x, base=0x%p, width=%u, height=%u, pixelformat=%c%c%c%c, bytesperline=%u, sizeimage=%u, colorspace=%d\n",
> > -			p->capability, p->flags, p->base,
> > -			p->fmt.width, p->fmt.height,
> > -			(p->fmt.pixelformat & 0xff),
> > -			(p->fmt.pixelformat >>  8) & 0xff,
> > -			(p->fmt.pixelformat >> 16) & 0xff,
> > -			(p->fmt.pixelformat >> 24) & 0xff,
> > -			p->fmt.bytesperline, p->fmt.sizeimage,
> > -			p->fmt.colorspace);
> > +	pr_cont("capability=0x%x, flags=0x%x, base=0x%p, width=%u, height=%u, pixelformat=%p4cc, bytesperline=%u, sizeimage=%u, colorspace=%d\n",
> > +		p->capability, p->flags, p->base, p->fmt.width, p->fmt.height,
> > +		&p->fmt.pixelformat, p->fmt.bytesperline, p->fmt.sizeimage,
> > +		p->fmt.colorspace);
> >  }
> >  
> >  static void v4l_print_buftype(const void *arg, bool write_only)
> > @@ -761,13 +732,8 @@ static void v4l_print_frmsizeenum(const void *arg, bool write_only)
> >  {
> >  	const struct v4l2_frmsizeenum *p = arg;
> >  
> > -	pr_cont("index=%u, pixelformat=%c%c%c%c, type=%u",
> > -			p->index,
> > -			(p->pixel_format & 0xff),
> > -			(p->pixel_format >>  8) & 0xff,
> > -			(p->pixel_format >> 16) & 0xff,
> > -			(p->pixel_format >> 24) & 0xff,
> > -			p->type);
> > +	pr_cont("index=%u, pixelformat=%p4cc, type=%u",
> > +		p->index, &p->pixel_format, p->type);
> >  	switch (p->type) {
> >  	case V4L2_FRMSIZE_TYPE_DISCRETE:
> >  		pr_cont(", wxh=%ux%u\n",
> > @@ -793,13 +759,8 @@ static void v4l_print_frmivalenum(const void *arg, bool write_only)
> >  {
> >  	const struct v4l2_frmivalenum *p = arg;
> >  
> > -	pr_cont("index=%u, pixelformat=%c%c%c%c, wxh=%ux%u, type=%u",
> > -			p->index,
> > -			(p->pixel_format & 0xff),
> > -			(p->pixel_format >>  8) & 0xff,
> > -			(p->pixel_format >> 16) & 0xff,
> > -			(p->pixel_format >> 24) & 0xff,
> > -			p->width, p->height, p->type);
> > +	pr_cont("index=%u, pixelformat=%p4cc, wxh=%ux%u, type=%u",
> > +		p->index, &p->pixel_format, p->width, p->height, p->type);
> >  	switch (p->type) {
> >  	case V4L2_FRMIVAL_TYPE_DISCRETE:
> >  		pr_cont(", fps=%d/%d\n",
> > @@ -1459,12 +1420,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  				return;
> >  			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
> >  			flags = 0;
> > -			snprintf(fmt->description, sz, "%c%c%c%c%s",
> > -					(char)(fmt->pixelformat & 0x7f),
> > -					(char)((fmt->pixelformat >> 8) & 0x7f),
> > -					(char)((fmt->pixelformat >> 16) & 0x7f),
> > -					(char)((fmt->pixelformat >> 24) & 0x7f),
> > -					(fmt->pixelformat & (1UL << 31)) ? "-BE" : "");
> 
> I'm wondering how it handled before the characters 0x80 or so...

The code is different in here than in the other instances but in practice
the output has been the same as the MSB is only set for the endianness
byte.

-- 
Regards,

Sakari Ailus
