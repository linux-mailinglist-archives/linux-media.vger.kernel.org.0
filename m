Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6869E7AAD0F
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 10:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbjIVIr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 04:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbjIVIr5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 04:47:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F4699
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695372471; x=1726908471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KFuvMCpPyam7/1ngX40xj6TEU//pTjXBpOpdmG301bI=;
  b=TZn6QjjTaNIWTNuSf8YmIO8X0K9OXeBoAl0eBnJPyNV7UpjEgZKLy4y0
   KW5Iipk6CTeyGS7kC4HS7h23dOMsYRHvd8ElU0hrnQ+ngt2wBxrKS1B1t
   EtIaOFDDP07GYvAraacoiy35BvxZv/oekGKvJBW/KqnL3RtJQ7YkW2hm4
   Wm5Tg8+/7Cx5YMgKedbXtQIkieNbcPbwMpipidOdKZ+WgAa4HO9GwGyO7
   oYplITqp/zjfVeKSg/eooltiBQTOz7mVZplRsuHQ1PgBp7mdeQNmj5xjX
   hEZVW8+7hTas/F+yH5CSkfIB3yOoiefnwkDt4Fjz+z93VcB+oupGgl07S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="360158962"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360158962"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 01:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="782561824"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="782561824"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 01:47:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 07C3411FC30;
        Fri, 22 Sep 2023 11:47:46 +0300 (EEST)
Date:   Fri, 22 Sep 2023 08:47:45 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 08/10] media: v4l: Support line-based metadata capture
Message-ID: <ZQ1UsQIxrlMPFspK@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-9-sakari.ailus@linux.intel.com>
 <ejo4a5dhvdukmle6lqddhsmvge6krezx5mhfq2ghoy23cnjygb@byo2u34seqz3>
 <ZNoJ0Fv/3Ir+sdyf@kekkonen.localdomain>
 <20230905171533.GH7971@pendragon.ideasonboard.com>
 <23xi3pdbcuzzdkus6xumdu4z6aue7dwcqdlmazqqzpchnjqyid@lb7zbgmi3ybp>
 <ZPhveqkcfkQfcXFE@kekkonen.localdomain>
 <20230906132037.GL17308@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906132037.GL17308@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Sep 06, 2023 at 04:20:37PM +0300, Laurent Pinchart wrote:
> On Wed, Sep 06, 2023 at 12:24:26PM +0000, Sakari Ailus wrote:
> > On Wed, Sep 06, 2023 at 09:21:42AM +0200, Jacopo Mondi wrote:
> > > On Tue, Sep 05, 2023 at 08:15:33PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Aug 14, 2023 at 11:02:40AM +0000, Sakari Ailus wrote:
> > > > > On Thu, Aug 10, 2023 at 05:24:14PM +0200, Jacopo Mondi wrote:
> > > > > > On Tue, Aug 08, 2023 at 10:55:36AM +0300, Sakari Ailus wrote:
> > > > > > > many camera sensors, among other devices, transmit embedded data and image
> > > >
> > > > s/many/Many/
> > > >
> > > > > > > data for each CSI-2 frame. This embedded data typically contains register
> > > > > > > configuration of the sensor that has been used to capture the image data
> > > > > > > of the same frame.
> > > > > > >
> > > > > > > The embedded data is received by the CSI-2 receiver and has the same
> > > > > > > properties as the image data, including that it is line based: it has
> > > > > > > width, height and bytesperline (stride).
> > > > > > >
> > > > > > > Add these fields to struct v4l2_meta_format and document them.
> > > > > > >
> > > > > > > Also add V4L2_FMT_FLAG_META_LINE_BASED to tell a given format is
> > > > > > > line-based i.e. these fields of struct v4l2_meta_format are valid for it.
> > > > > > >
> > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > ---
> > > > > > >  .../userspace-api/media/v4l/dev-meta.rst          | 15 +++++++++++++++
> > > > > > >  .../userspace-api/media/v4l/vidioc-enum-fmt.rst   |  7 +++++++
> > > > > > >  .../media/videodev2.h.rst.exceptions              |  1 +
> > > > > > >  drivers/media/v4l2-core/v4l2-ioctl.c              |  5 +++--
> > > > > > >  include/uapi/linux/videodev2.h                    | 10 ++++++++++
> > > > > > >  5 files changed, 36 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
> > > > > > > index 0e7e1ee1471a..4b24bae6e171 100644
> > > > > > > --- a/Documentation/userspace-api/media/v4l/dev-meta.rst
> > > > > > > +++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
> > > > > > > @@ -65,3 +65,18 @@ to 0.
> > > > > > >        - ``buffersize``
> > > > > > >        - Maximum buffer size in bytes required for data. The value is set by the
> > > > > > >          driver.
> > > > > > > +    * - __u32
> > > > > > > +      - ``width``
> > > > > > > +      - Width of a line of metadata in samples. Valid when :c:type`v4l2_fmtdesc`
> > > > > > > +	flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> > > > > > > +	:c:func:`VIDIOC_ENUM_FMT`.
> > > > > > > +    * - __u32
> > > > > > > +      - ``height``
> > > > > > > +      - Number of rows of metadata. Valid when :c:type`v4l2_fmtdesc` flag
> > > > > > > +	``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> > > > > > > +	:c:func:`VIDIOC_ENUM_FMT`.
> > > > > > > +    * - __u32
> > > > > > > +      - ``bytesperline``
> > > > > > > +      - Offset in bytes between the beginning of two consecutive lines. Valid
> > > > > > > +	when :c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is
> > > > > > > +	set, otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> > > > > > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > > > > > index 000c154b0f98..6d7664345a4e 100644
> > > > > > > --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > > > > > +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > > > > > @@ -227,6 +227,13 @@ the ``mbus_code`` field is handled differently:
> > > > > > >  	The application can ask to configure the quantization of the capture
> > > > > > >  	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
> > > > > > >  	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
> > > > > > > +    * - ``V4L2_FMT_FLAG_META_LINE_BASED``
> > > > > > > +      - 0x0200
> > > > > > > +      - The metadata format is line-based. In this case the ``width``,
> > > > > > > +	``height`` and ``bytesperline`` fields of :c:type:`v4l2_meta_format` are
> > > > > > > +	valid. The buffer consists of ``height`` lines, each having ``width``
> > > > > > > +	bytes of data and offset between the beginning of each two consecutive
> > > > > >
> > > > > > Isn't ``width`` in samples ?
> > > > >
> > > > > Indeed, it's better to refer to samples for clarity. I'll fix for v4.
> > > >
> > > > How do you define a "sample" in this case ? I wonder if it wouldn't be
> > > > simpler for both userspace and kernel drivers if the width was specified
> > > > in bytes, including the padding bytes.
> > > 
> > > Wouldn't this make the image line length (expressed in 'samples')
> > > different than the embedded data line length ? Would this confuse
> > > userspace or is it fine ?
> > 
> > If padding is included to width, then the user needs to calculate how many
> > bytes of metadata there is, apart from the padding (which is redundant).
> > That value is provided to the user for this purpose --- just like for image
> > data.
> 
> The bytesperline value includes padding at the end of the line to
> achieve a particular stride, so that doesn't tell how many bytes to
> parse. If the width is specified in "samples", then the parser will need
> to compute the number of bytes it spans, and then parse those bytes.

The parser is interested in metadata bytes only, not the padding. The
padding should be skipped by the data access function in order to avoid
complicating the parser with different padding options.

That's why width should be in data units (bytes of metadata without
padding).

-- 
Regards,

Sakari Ailus
