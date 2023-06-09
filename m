Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3B8729BE3
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 15:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjFINqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 09:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbjFINqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 09:46:20 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0836830F4
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 06:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686318378; x=1717854378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VcIErgDpa5WQA4MjznMRGXLbAS2BB0oFeT/rqffXT1Q=;
  b=LOkDMCgVOXAZccHZK8tWa6ESO1UNpsUGQN6vSE2YYvm2jIq7fmyjNX0E
   HnckLGiNX9+EFTqeIFZnI/bDTsbwbVPyMCvu+0O2aCcRBVAC4ftm18i3W
   +74ST+80yGbMwUI5dGZoC9bK3KpKFQ8ShrlIJE8FylY/I6QomWjjSeN0h
   08TgO1JfAZTnXYnyknw0CpGmz9Nx613JE3Stf23TcyksfO+cHKwbBMzZy
   n4Rw+u3rln1KZ2nnH7lU9H2jPDq51L8YLE8mjdUtvBUblBxB0ZIA039vJ
   UNEDyieW2869J2+Hg9gURyzaqMCgcLvtuNvgvvW6K85xAUhibQC71xJdi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360955447"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="360955447"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="660774246"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="660774246"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:46:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 59148120A0E;
        Fri,  9 Jun 2023 16:46:14 +0300 (EEST)
Date:   Fri, 9 Jun 2023 13:46:14 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 7/7] media: v4l: Support line-based metadata capture
Message-ID: <ZIMtJqI50Bi9K9MF@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-8-sakari.ailus@linux.intel.com>
 <20230602105054.GA26944@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602105054.GA26944@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jun 02, 2023 at 01:50:54PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Sat, May 06, 2023 at 12:52:57AM +0300, Sakari Ailus wrote:
> > many camera sensors, among other devices, transmit embedded data and image
> 
> s/many/Many/
> 
> > data for each CSI-2 frame. This embedded data typically contains register
> > configuration of the sensor that has been used to capture the image data
> > of the same frame.
> > 
> > The embedded data is received by the CSI-2 receiver and has the same
> > properties as the image data, including that it is line based: it has
> > width, height and bytesperline (stride).
> > 
> > Add these fields to struct v4l2_meta_format and document them.
> > 
> > Also add V4L2_FMT_FLAG_META_LINE_BASED to tell a given format is
> > line-based i.e. these fields of struct v4l2_meta_format are valid for it.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/dev-meta.rst          | 15 +++++++++++++++
> >  .../userspace-api/media/v4l/vidioc-enum-fmt.rst   |  7 +++++++
> >  include/uapi/linux/videodev2.h                    | 10 ++++++++++
> >  3 files changed, 32 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
> > index 0e7e1ee1471a..7d3a64514db0 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-meta.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
> > @@ -65,3 +65,18 @@ to 0.
> >        - ``buffersize``
> >        - Maximum buffer size in bytes required for data. The value is set by the
> >          driver.
> > +    * - __u32
> > +      - ``width``
> > +      - Width of a line of metadata in bytes. Valid when :c:type`v4l2_fmtdesc`
> 
> This departs from pixel formats, where the width is defined in pixels. I
> wonder what the implications will be for userspace. Seeing one
> implementation, both in a kernel driver and in libcamera, will help
> validating the API.

I thought of bytes when writing this but pixels (or samples) are probably a
better term for this.

> 
> > +	flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> > +	:c:func:`VIDIOC_ENUM_FMT`.
> > +    * - __u32
> > +      - ``height``
> > +      - Height of a line of metadata in bytes. Valid when :c:type`v4l2_fmtdesc`
> 
> The "height of a line" seems like a weird concept, especially if the
> height is expressed in bytes. I assume this is a bad copy&paste.

Yes. I'll address these for v2.

> 
> > +	flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> > +	:c:func:`VIDIOC_ENUM_FMT`.
> > +    * - __u32
> > +      - ``bytesperlines``
> > +      - Offset in bytes between the beginning of two consecutive lines. Valid
> > +	when :c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is
> > +	set, otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > index 000c154b0f98..6d7664345a4e 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > @@ -227,6 +227,13 @@ the ``mbus_code`` field is handled differently:
> >  	The application can ask to configure the quantization of the capture
> >  	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
> >  	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
> > +    * - ``V4L2_FMT_FLAG_META_LINE_BASED``
> > +      - 0x0200
> > +      - The metadata format is line-based. In this case the ``width``,
> > +	``height`` and ``bytesperline`` fields of :c:type:`v4l2_meta_format` are
> > +	valid. The buffer consists of ``height`` lines, each having ``width``
> > +	bytes of data and offset between the beginning of each two consecutive
> > +	lines is ``bytesperline``.
> 
> If we add width and height for metadata formats, does it mean that
> drivers have to (or can) implement VIDIOC_ENUM_FRAMESIZES ? This should
> be documented.

Good point.

I don't think it's meaningful to implement that as the pipeline
configuration determines this in any case.

But I wonder whether this would better be documented for V4L2_CAP_IO_MC
rather than for metadata formats. There's currently only a reference to
this in ENUM_FMT documentation.

> 
> >  
> >  Return Value
> >  ============
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index adcbdc15dcdb..3681b2c15901 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -873,6 +873,7 @@ struct v4l2_fmtdesc {
> >  #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
> >  #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
> >  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> > +#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> >  
> >  	/* Frame Size and frame rate enumeration */
> >  /*
> > @@ -2407,10 +2408,19 @@ struct v4l2_sdr_format {
> >   * struct v4l2_meta_format - metadata format definition
> >   * @dataformat:		little endian four character code (fourcc)
> >   * @buffersize:		maximum size in bytes required for data
> > + * @width:		number of bytes of data per line (valid for line based
> > + *			formats only, see format documentation)
> > + * @height:		number of lines of data per buffer (valid for line based
> > + *			formats only)
> > + * @bytesperline:	offset between the beginnings of two adjacent lines in
> > + *			bytes (valid for line based formats only)
> >   */
> >  struct v4l2_meta_format {
> >  	__u32				dataformat;
> >  	__u32				buffersize;
> > +	__u32				width;
> > +	__u32				height;
> > +	__u32				bytesperline;
> >  } __attribute__ ((packed));
> >  
> >  /**

-- 
Regards,

Sakari Ailus
