Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8365D7AAE68
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 11:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbjIVJlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 05:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbjIVJlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 05:41:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4922E19B
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695375668; x=1726911668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZARz2Vul3GFQmTXr9VEt7St8RNPxOx5PxwTV3nSv9P8=;
  b=AMOHEXFj/4M6q8XBYUmoQc5ylJRueQ8SlLM0ITdqesHGVaRQT+X95s2g
   YQ0k5EiGHAngI2ycX147GGpehvnZHrDeN7EoO3qy1uQB75Kmtl1OE4yvx
   X0Ztd5IOiyLzBslxLWL/26XWkmdSENT48GBx5jCFpJTc0btWYgL00hdb1
   WQiaR4sQvDYbJhXx8GETejn8UF+CtWGJunDe0DFIaTXcBfa/ed//2MhEY
   aIQz6QZrNJ4/drbiaOEKqWgMcI0HJ2cStlZ9X0GVC3jWSmHtSB2lQ92PH
   qPqrSDSXx8p2by8HXLmLOLYUxl1vIuaGl18td1b2bF5n5XKPUvJ5+mYPt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384624107"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="384624107"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 02:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="890757528"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="890757528"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 02:40:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 44BC811FC30;
        Fri, 22 Sep 2023 12:41:01 +0300 (EEST)
Date:   Fri, 22 Sep 2023 09:41:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v3 11/12] media: v4l: subdev: Print debug information on
 frame descriptor
Message-ID: <ZQ1hLRtz4ai+miPS@kekkonen.localdomain>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
 <20230919121728.126781-12-sakari.ailus@linux.intel.com>
 <20230919133248.GD1505@pendragon.ideasonboard.com>
 <ZQm0+U6n+rE2fjcD@kekkonen.localdomain>
 <20230919152123.GA18426@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919152123.GA18426@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 19, 2023 at 06:21:23PM +0300, Laurent Pinchart wrote:
> On Tue, Sep 19, 2023 at 02:49:29PM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Tue, Sep 19, 2023 at 04:32:48PM +0300, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Tue, Sep 19, 2023 at 03:17:27PM +0300, Sakari Ailus wrote:
> > > > Print debug level information on returned frame descriptors.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 32 ++++++++++++++++++++++++++-
> > > >  1 file changed, 31 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 7b087be3ff4f..504ca625b2bd 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -15,6 +15,7 @@
> > > >  #include <linux/module.h>
> > > >  #include <linux/overflow.h>
> > > >  #include <linux/slab.h>
> > > > +#include <linux/string.h>
> > > >  #include <linux/types.h>
> > > >  #include <linux/version.h>
> > > >  #include <linux/videodev2.h>
> > > > @@ -309,9 +310,38 @@ static int call_set_selection(struct v4l2_subdev *sd,
> > > >  static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > >  			       struct v4l2_mbus_frame_desc *fd)
> > > >  {
> > > > +	unsigned int i;
> > > > +	int ret;
> > > > +
> > > >  	memset(fd, 0, sizeof(*fd));
> > > >  
> > > > -	return sd->ops->pad->get_frame_desc(sd, pad, fd);
> > > > +	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
> > > > +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
> > > > +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
> > > > +		"unknown");
> > > > +
> > > > +	for (i = 0; i < fd->num_entries; i++) {
> > > > +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
> > > > +		char buf[20] = "";
> > > 
> > > Should this be sized for the worst case ? The vc and dt should not be
> > > large, but a buffer overflow on the stack in debug code if a subdev
> > > returns an incorrect value would be bad.
> > 
> > 17 should be enough but it's not useful to use a size not divisible by 4 in
> > practice here.
> 
> 18 with the terminating 0. But indeed, it's large enough as vc and dt

I can count only 17 --- there's no newline.

I guess it's most probably either of these then. X-)

> are u8. I'm just a bit worried we're opening the door to hard to debug
> problems if we later change the vc and dt types.

I can add a WARN_ON() to cover this.

> 
> > > > +
> > > > +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > > > +			snprintf(buf, sizeof(buf), ", vc %u, dt 0x%2.2x",
> > > 
> > > 0x%02x would be one character shorter ;-) Same below.
> > 
> > It would be, but I prefer the above notation as it's more generic.
> 
> Out of curiosity, how so ?

It works with data that would span more than 9 characters when printed.

> 
> > > > +				 entry->bus.csi2.vc, entry->bus.csi2.dt);
> > > > +
> > > > +		dev_dbg(sd->dev,
> > > > +			"\tstream %u, code 0x%4.4x, lenght %u, flags%s%s%s\n",
> > > 
> > > s/lenght/length/
> > 
> > Thanks, I'll fix this.
> > 
> > > > +			entry->stream, entry->pixelcode, entry->length,
> > > > +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_LEN_MAX ?
> > > > +			" LEN_MAX" : "",
> > > > +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_BLOB ?
> > > > +			" BLOB" : "", buf);
> > > 
> > > If no flags are set, you will get something like
> > > 
> > > 	stream 0, code 0x1234, length ..., flags, vc 0, dt 0x2a
> > > 
> > > Maybe printing the hex value for the flags would be simpler and clearer
> > > ?
> > 
> > How about adding the numerical value in addition to the strings?
> > 
> > The use of these flags is rare though. I could just remove the strings,
> > too.
> 
> Up to you.

On second thought, I'll make it an integer only. If we'll get more commonly
used flags, we can rethink about strings.

-- 
Regards,

Sakari Ailus
