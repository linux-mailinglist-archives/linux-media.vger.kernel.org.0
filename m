Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C46792CE6
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 19:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235654AbjIER6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 13:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240588AbjIER6B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 13:58:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E4E8695
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 10:53:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23891AF2;
        Tue,  5 Sep 2023 18:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693932145;
        bh=1dQJDIPvpHwTECVb0TQPMnQFxhiYSGO8WkAcs0GVvCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fcCqAuNKbwkzwK/g/uW1jspZlsQ7Qw4r0p0WEII+wAQmhmWX49LgbcR4SIOPXCdhA
         qaz2hacDml7Xd/OCrywh1fSZteAFrDxYbXYv9t07js6foa2JCoAQQR2CaPUrUVRMZz
         M1QPsYBi318qMhNGfB7+mbFyq7hCdrq6gq8YqOS8=
Date:   Tue, 5 Sep 2023 19:44:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 05/10] media: uapi: Document which mbus format fields
 are valid for metadata
Message-ID: <20230905164404.GB7971@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-6-sakari.ailus@linux.intel.com>
 <xh5qpzbzamydaanlmfcqzlpwd7dfaawpxabsnejuoupsbx2yx7@dk3s6zuujtvf>
 <ZNoAv4i1hG7DBayi@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZNoAv4i1hG7DBayi@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 14, 2023 at 10:23:59AM +0000, Sakari Ailus wrote:
> On Thu, Aug 10, 2023 at 05:19:02PM +0200, Jacopo Mondi wrote:
> > On Tue, Aug 08, 2023 at 10:55:33AM +0300, Sakari Ailus wrote:
> > > Now that metadata mbus formats have been added, it is necessary to define
> > > which fields in struct v4l2_mbus_format are applicable to them (not many).
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  include/uapi/linux/v4l2-mediabus.h | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> > > index 6b07b73473b5..3cadb3b58b85 100644
> > > --- a/include/uapi/linux/v4l2-mediabus.h
> > > +++ b/include/uapi/linux/v4l2-mediabus.h
> > > @@ -19,12 +19,18 @@
> > >   * @width:	image width
> > >   * @height:	image height
> > >   * @code:	data format code (from enum v4l2_mbus_pixelcode)
> > > - * @field:	used interlacing type (from enum v4l2_field)
> > > - * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
> > > - * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> > > - * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
> > > - * @quantization: quantization of the data (from enum v4l2_quantization)
> > > - * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> > > + * @field:	used interlacing type (from enum v4l2_field), not applicable
> > > + *		to metadata mbus codes
> > 
> > "not applicable" is a bit geeric. Should this be set to
> > V4L2_FIELD_NONE (for metadata, and progressive image formats maybe ?)
> 
> I actually intended to have the same wording here than for the other fields
> but missed changing this.
> 
> 0 corresponds to V4L2_FIELD_ANY.
> 
> > > + * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
> > > + *		metadata mbus codes
> > > + * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
> > > + *		on metadata mbus codes
> > > + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
> > > + *		metadata mbus codes
> > 
> > Can this be zero ?
> > 
> > enum v4l2_hsv_encoding {
> > 
> > 	/* Hue mapped to 0 - 179 */
> > 	V4L2_HSV_ENC_180		= 128,
> > 
> > 	/* Hue mapped to 0-255 */
> > 	V4L2_HSV_ENC_256		= 129,
> > };
> 
> Good question. Neither value is meaningful for metadata.
> 
> The values appear to be such in the enum to avoid colliding with ycbcr
> encoding values (another field above).
> 
> Generally, what doesn't matter will be zero. These fields have been added
> at some point and a lot of drivers do not set them, even for pixel data.
> 
> I wonder what Hans and Laurent think.

ycbcr_enc and hsv_enc are stored in an unnamed union.

> > > + * @quantization: quantization of the data (from enum v4l2_quantization), zero
> > > + *		on metadata mbus codes
> > > + * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
> > > + *		on metadata mbus codes
> > >   * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
> > >   * @reserved:  reserved bytes that can be later used
> > >   */

-- 
Regards,

Laurent Pinchart
