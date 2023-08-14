Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC7577B698
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 12:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbjHNKYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 06:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbjHNKYL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 06:24:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97233EE
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 03:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692008644; x=1723544644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TAQGEj34dCnRguXKfubkwApEHTSIRAXNrjc5XqIrZYE=;
  b=YIpQoHcFqKoem0SXh/JN4EFC/IXSFwHg9VnZ3GwmNRuKzZAQnhG7HSQW
   EkHT0KcBn0ui9YKuGPMVq2Q6i6c7TPnLHdv6WJ+FXOhHaIPojMRo8e9Sv
   Zz/AuqFDi8Omn4o/OeAAA4tEFbrm37Ru0W8l3rggePpZRZOxmgBVCI8c+
   KdSTQ+qBeFOqYt4Q6FayYWWGYwAJ9oaNHbCjqex4yANi1XCCfEKhVPfL2
   D4wY4ONbc+uJRvbguJt7nTqRE16cmsW90zC+qhedl9quLEwP9uNBrloz4
   /mUhQtobFhh9OS/d8n9abhC13TaoAO5BG4pH7XUt6NCj5vt3B47RMqO+c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="458370218"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="458370218"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 03:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="768406497"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="768406497"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 03:24:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2617111FAE0;
        Mon, 14 Aug 2023 13:23:59 +0300 (EEST)
Date:   Mon, 14 Aug 2023 10:23:59 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 05/10] media: uapi: Document which mbus format fields
 are valid for metadata
Message-ID: <ZNoAv4i1hG7DBayi@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-6-sakari.ailus@linux.intel.com>
 <xh5qpzbzamydaanlmfcqzlpwd7dfaawpxabsnejuoupsbx2yx7@dk3s6zuujtvf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xh5qpzbzamydaanlmfcqzlpwd7dfaawpxabsnejuoupsbx2yx7@dk3s6zuujtvf>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the review.

On Thu, Aug 10, 2023 at 05:19:02PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Aug 08, 2023 at 10:55:33AM +0300, Sakari Ailus wrote:
> > Now that metadata mbus formats have been added, it is necessary to define
> > which fields in struct v4l2_mbus_format are applicable to them (not many).
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/uapi/linux/v4l2-mediabus.h | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> > index 6b07b73473b5..3cadb3b58b85 100644
> > --- a/include/uapi/linux/v4l2-mediabus.h
> > +++ b/include/uapi/linux/v4l2-mediabus.h
> > @@ -19,12 +19,18 @@
> >   * @width:	image width
> >   * @height:	image height
> >   * @code:	data format code (from enum v4l2_mbus_pixelcode)
> > - * @field:	used interlacing type (from enum v4l2_field)
> > - * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
> > - * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> > - * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
> > - * @quantization: quantization of the data (from enum v4l2_quantization)
> > - * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> > + * @field:	used interlacing type (from enum v4l2_field), not applicable
> > + *		to metadata mbus codes
> 
> "not applicable" is a bit geeric. Should this be set to
> V4L2_FIELD_NONE (for metadata, and progressive image formats maybe ?)

I actually intended to have the same wording here than for the other fields
but missed changing this.

0 corresponds to V4L2_FIELD_ANY.

> 
> > + * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
> > + *		metadata mbus codes
> > + * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
> > + *		on metadata mbus codes
> > + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
> > + *		metadata mbus codes
> 
> Can this be zero ?
> 
> enum v4l2_hsv_encoding {
> 
> 	/* Hue mapped to 0 - 179 */
> 	V4L2_HSV_ENC_180		= 128,
> 
> 	/* Hue mapped to 0-255 */
> 	V4L2_HSV_ENC_256		= 129,
> };

Good question. Neither value is meaningful for metadata.

The values appear to be such in the enum to avoid colliding with ycbcr
encoding values (another field above).

Generally, what doesn't matter will be zero. These fields have been added
at some point and a lot of drivers do not set them, even for pixel data.

I wonder what Hans and Laurent think.

> 
> > + * @quantization: quantization of the data (from enum v4l2_quantization), zero
> > + *		on metadata mbus codes
> > + * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
> > + *		on metadata mbus codes
> >   * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
> >   * @reserved:  reserved bytes that can be later used
> >   */

-- 
Kind regards,

Sakari Ailus
