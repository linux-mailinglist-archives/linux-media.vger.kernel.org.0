Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C167AAF62
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 12:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbjIVKXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 06:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbjIVKXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 06:23:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854D31A5
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695378205; x=1726914205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I4w8hcyD3bnBsV4pKQiWrbq7R02zF4QbTRYg0ROh1J0=;
  b=HIGCfD9fp8WMAlud/7+1q59BCokiPkCIZ2j7AvOrJ1c8m1CDnLM6C+d2
   D4sGcLZ2rDplcXNeqfaGufgGKQpmWuWQMSH72/tvD5pF++ZCX6o4HYp7q
   lJSfclxLbt44sjunrjyitZmSLrf73T8IjJZqwVYkGwFDRtJ0VbzsR2NFT
   uxAQM7i7r11hB+t97LDIIL3W6uaaOEViyvAeSNs3MtSHGXahkv4Anuk9n
   RwRuK1BUIm9BFylOCNsQpbjmFY7ZqSEGLrxsP2j1cy+l7vj6yh5eHig3l
   xQvHo6EgkgBoMP2M21tiJZsOHLqm4/25eIfzMld0OEkue2anZUWLJXJ1D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="371116982"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="371116982"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="871201883"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="871201883"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:23:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E385711FC30;
        Fri, 22 Sep 2023 13:23:19 +0300 (EEST)
Date:   Fri, 22 Sep 2023 10:23:19 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v3 11/12] media: v4l: subdev: Print debug information on
 frame descriptor
Message-ID: <ZQ1rF7MG7WfcKDKf@kekkonen.localdomain>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
 <20230919121728.126781-12-sakari.ailus@linux.intel.com>
 <20230919133248.GD1505@pendragon.ideasonboard.com>
 <ZQm0+U6n+rE2fjcD@kekkonen.localdomain>
 <20230919152123.GA18426@pendragon.ideasonboard.com>
 <ZQ1hLRtz4ai+miPS@kekkonen.localdomain>
 <20230922095320.GE19112@pendragon.ideasonboard.com>
 <ZQ1n8ZycYUNJnLSc@kekkonen.localdomain>
 <09af9c43-f9b8-d426-f7ce-959a6dea87d2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09af9c43-f9b8-d426-f7ce-959a6dea87d2@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 22, 2023 at 01:16:21PM +0300, Tomi Valkeinen wrote:
> On 22/09/2023 13:09, Sakari Ailus wrote:
> > On Fri, Sep 22, 2023 at 12:53:20PM +0300, Laurent Pinchart wrote:
> > > On Fri, Sep 22, 2023 at 09:41:01AM +0000, Sakari Ailus wrote:
> > > > On Tue, Sep 19, 2023 at 06:21:23PM +0300, Laurent Pinchart wrote:
> > > > > On Tue, Sep 19, 2023 at 02:49:29PM +0000, Sakari Ailus wrote:
> > > > > > On Tue, Sep 19, 2023 at 04:32:48PM +0300, Laurent Pinchart wrote:
> > > > > > > On Tue, Sep 19, 2023 at 03:17:27PM +0300, Sakari Ailus wrote:
> > > > > > > > Print debug level information on returned frame descriptors.
> > > > > > > > 
> > > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > ---
> > > > > > > >   drivers/media/v4l2-core/v4l2-subdev.c | 32 ++++++++++++++++++++++++++-
> > > > > > > >   1 file changed, 31 insertions(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > > > index 7b087be3ff4f..504ca625b2bd 100644
> > > > > > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > > > @@ -15,6 +15,7 @@
> > > > > > > >   #include <linux/module.h>
> > > > > > > >   #include <linux/overflow.h>
> > > > > > > >   #include <linux/slab.h>
> > > > > > > > +#include <linux/string.h>
> > > > > > > >   #include <linux/types.h>
> > > > > > > >   #include <linux/version.h>
> > > > > > > >   #include <linux/videodev2.h>
> > > > > > > > @@ -309,9 +310,38 @@ static int call_set_selection(struct v4l2_subdev *sd,
> > > > > > > >   static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > > > > >   			       struct v4l2_mbus_frame_desc *fd)
> > > > > > > >   {
> > > > > > > > +	unsigned int i;
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > >   	memset(fd, 0, sizeof(*fd));
> > > > > > > > -	return sd->ops->pad->get_frame_desc(sd, pad, fd);
> > > > > > > > +	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
> > > > > > > > +	if (ret)
> > > > > > > > +		return ret;
> > > > > > > > +
> > > > > > > > +	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
> > > > > > > > +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
> > > > > > > > +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
> > > > > > > > +		"unknown");
> > > > > > > > +
> > > > > > > > +	for (i = 0; i < fd->num_entries; i++) {
> > > > > > > > +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
> > > > > > > > +		char buf[20] = "";
> > > > > > > 
> > > > > > > Should this be sized for the worst case ? The vc and dt should not be
> > > > > > > large, but a buffer overflow on the stack in debug code if a subdev
> > > > > > > returns an incorrect value would be bad.
> > > > > > 
> > > > > > 17 should be enough but it's not useful to use a size not divisible by 4 in
> > > > > > practice here.
> > > > > 
> > > > > 18 with the terminating 0. But indeed, it's large enough as vc and dt
> > > > 
> > > > I can count only 17 --- there's no newline.
> > > > 
> > > > I guess it's most probably either of these then. X-)
> > > > 
> > > > > are u8. I'm just a bit worried we're opening the door to hard to debug
> > > > > problems if we later change the vc and dt types.
> > > > 
> > > > I can add a WARN_ON() to cover this.
> > > > 
> > > > > > > > +
> > > > > > > > +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > > > > > > > +			snprintf(buf, sizeof(buf), ", vc %u, dt 0x%2.2x",
> > > > > > > 
> > > > > > > 0x%02x would be one character shorter ;-) Same below.
> > > > > > 
> > > > > > It would be, but I prefer the above notation as it's more generic.
> > > > > 
> > > > > Out of curiosity, how so ?
> > > > 
> > > > It works with data that would span more than 9 characters when printed.
> > > 
> > > And 0x%02x doesn't ?
> > 
> > Ah, it should indeed work, 0 is actually a flag here and part of the field
> > width or precision. I can use that in v4.
> 
> Or %#04x, even shorter!

No-one has used that in the media tree so far. I'll use 0x%02x, that
appears to be common.

-- 
Sakari Ailus
