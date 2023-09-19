Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20D77A6745
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 16:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbjISOty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 10:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbjISOtk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 10:49:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F54BC
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695134975; x=1726670975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ej99fxi8D6kd2105lfESzqlD/HF6e9y5pQQkEze3SSs=;
  b=J1dPWrxt8Bs4YZOVNyStQR2O6rgNBYF1BIPdtiZh5/bu5oH9MqXsmw06
   DNsEhP3VnXLvhcG3d6WseczQQ4IWtFJ8ADva0Kne5C6fyKoGhrZv1/+9t
   w8yGopTcMxfagIsw1Uz1fO7ns2L5Eg3RwusRDirnHAVMEw+ePZH6qAM7H
   hNY4iAxYaPuPlznC7Og/0gVEa1FQXrZyMsGqnemF4fjWNRzUK9wxwEIsP
   Ahj0ySSyaTZM0cZv6vRVmsg6OehWce4FoMY84SE8E8hI0ipSaudsdsCu5
   jecFl+xSWljzH47KSd8SDHV1LlwR9xleCqg5sKrxrskcn4gsPtNkbRyPh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="379864042"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="379864042"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="889535262"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="889535262"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:48:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id DADE7120232;
        Tue, 19 Sep 2023 17:49:29 +0300 (EEST)
Date:   Tue, 19 Sep 2023 14:49:29 +0000
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
Message-ID: <ZQm0+U6n+rE2fjcD@kekkonen.localdomain>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
 <20230919121728.126781-12-sakari.ailus@linux.intel.com>
 <20230919133248.GD1505@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919133248.GD1505@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Sep 19, 2023 at 04:32:48PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Sep 19, 2023 at 03:17:27PM +0300, Sakari Ailus wrote:
> > Print debug level information on returned frame descriptors.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 32 ++++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 7b087be3ff4f..504ca625b2bd 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/module.h>
> >  #include <linux/overflow.h>
> >  #include <linux/slab.h>
> > +#include <linux/string.h>
> >  #include <linux/types.h>
> >  #include <linux/version.h>
> >  #include <linux/videodev2.h>
> > @@ -309,9 +310,38 @@ static int call_set_selection(struct v4l2_subdev *sd,
> >  static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >  			       struct v4l2_mbus_frame_desc *fd)
> >  {
> > +	unsigned int i;
> > +	int ret;
> > +
> >  	memset(fd, 0, sizeof(*fd));
> >  
> > -	return sd->ops->pad->get_frame_desc(sd, pad, fd);
> > +	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
> > +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
> > +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
> > +		"unknown");
> > +
> > +	for (i = 0; i < fd->num_entries; i++) {
> > +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
> > +		char buf[20] = "";
> 
> Should this be sized for the worst case ? The vc and dt should not be
> large, but a buffer overflow on the stack in debug code if a subdev
> returns an incorrect value would be bad.

17 should be enough but it's not useful to use a size not divisible by 4 in
practice here.

> 
> > +
> > +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > +			snprintf(buf, sizeof(buf), ", vc %u, dt 0x%2.2x",
> 
> 0x%02x would be one character shorter ;-) Same below.

It would be, but I prefer the above notation as it's more generic.

> 
> > +				 entry->bus.csi2.vc, entry->bus.csi2.dt);
> > +
> > +		dev_dbg(sd->dev,
> > +			"\tstream %u, code 0x%4.4x, lenght %u, flags%s%s%s\n",
> 
> s/lenght/length/

Thanks, I'll fix this.

> 
> > +			entry->stream, entry->pixelcode, entry->length,
> > +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_LEN_MAX ?
> > +			" LEN_MAX" : "",
> > +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_BLOB ?
> > +			" BLOB" : "", buf);
> 
> If no flags are set, you will get something like
> 
> 	stream 0, code 0x1234, length ..., flags, vc 0, dt 0x2a
> 
> Maybe printing the hex value for the flags would be simpler and clearer
> ?

How about adding the numerical value in addition to the strings?

The use of these flags is rare though. I could just remove the strings,
too.

-- 
Regards,

Sakari Ailus
