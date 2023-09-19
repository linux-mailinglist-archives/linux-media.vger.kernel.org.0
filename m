Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7797A5F61
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 12:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjISKWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 06:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjISKWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 06:22:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DC7F4
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695118914; x=1726654914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CoOz66JvWBqbwn0b+N0HtQwc2thuQVwbK0QEJnvriXs=;
  b=DG8BymmWQMW7CTsISrEuslyKZNebTyCQRyAsXlL+H9FMZxqHiKRZ1z7k
   Gr1ahkcBwk8iGXKVM1f2vQMpC3UHAMEwZ27kXwlNkUoVB8hbT9ZKwNUyF
   bRLgS9ssBM24BMHhNIsP5/kJ09X/s/Qb6uTb+HFmEq9UD0e7dHbotMJJ+
   ln9/dCAwku681JCjGIcJ8YTIdcCBlkW62TuvReXS6yruFvfdt3K3INdMV
   45h7cuEqPQfwqqnSPS1OBBaJfhTO6Tn+9coto4v4Iq9ai8Jh2UEIFYwwO
   Qtguaqz5DaVM4RkwkfwMD+W7dVuwmIacKqOY0TmdLNEWdKBIzM0M9YM+Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359303017"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="359303017"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 03:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869928796"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="869928796"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 03:21:51 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 13CB2120BE5;
        Tue, 19 Sep 2023 13:21:48 +0300 (EEST)
Date:   Tue, 19 Sep 2023 10:21:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 11/12] media: v4l: subdev: Print debug information on
 frame descriptor
Message-ID: <ZQl2PBsGfyZyv4A9@kekkonen.localdomain>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-12-sakari.ailus@linux.intel.com>
 <20230918133926.GG28874@pendragon.ideasonboard.com>
 <749451b9-b754-fd9c-d0e8-4edb3cb613ac@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <749451b9-b754-fd9c-d0e8-4edb3cb613ac@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi, Laurent,

Thanks for the review.

On Tue, Sep 19, 2023 at 11:19:36AM +0300, Tomi Valkeinen wrote:
> On 18/09/2023 16:39, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Sep 18, 2023 at 03:51:37PM +0300, Sakari Ailus wrote:
> > > Print debug level information on returned frame descriptors.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-subdev.c | 35 ++++++++++++++++++++++++++-
> > >   1 file changed, 34 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 7b087be3ff4f..abd9275febdb 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -309,9 +309,42 @@ static int call_set_selection(struct v4l2_subdev *sd,
> > >   static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > >   			       struct v4l2_mbus_frame_desc *fd)
> > >   {
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > >   	memset(fd, 0, sizeof(*fd));
> > > -	return sd->ops->pad->get_frame_desc(sd, pad, fd);
> > > +	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	dev_dbg(sd->dev, "Frame descriptor\n");
> > > +	dev_dbg(sd->dev, "\ttype %s\n",
> > > +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
> > > +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
> > > +		"unknown");
> > > +	dev_dbg(sd->dev, "\tentries %u\n", fd->num_entries);
> > 
> > You could skip this line, it's implied by the entries that you print
> > below.

I guess that's reasonable if I switch to the format Tomi proposed. You'd
only need to count lines.

> > 
> > > +
> > > +	for (i = 0; i < fd->num_entries; i++) {
> > > +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
> > > +
> > > +		dev_dbg(sd->dev, "\tentry %u\n", i);
> > > +		dev_dbg(sd->dev, "\tflags%s%s\n",
> > > +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_LEN_MAX ?
> > > +			" LEN_MAX" : "",
> > > +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_BLOB ?
> > > +			" BLOB" : "");
> > > +		dev_dbg(sd->dev, "\t\tstream %u\n", entry->stream);
> > > +		dev_dbg(sd->dev, "\t\tpixelcode 0x%4.4x\n", entry->pixelcode);
> > > +		dev_dbg(sd->dev, "\t\tlength %u\n", entry->length);
> > > +
> > > +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> > > +			dev_dbg(sd->dev, "\t\tvc %u\n", entry->bus.csi2.vc);
> > > +			dev_dbg(sd->dev, "\t\tdt 0x%2.2x\n", entry->bus.csi2.dt);
> > 
> > I'd merge those two in a single line.
> > 
> > > +		}
> > > +	}
> > 
> > All this is a bit verbose. If it was in a hot path I would be annoyed,
> > but in this case I suppose it can be useful for debugging and won't
> > affect runtime too much.
> > 
> > It would be nice if we could have a single check and return early. That
> > should be possible by using DEFINE_DYNAMIC_DEBUG_METADATA() and
> > DYNAMIC_DEBUG_BRANCH(), like done in alloc_contig_dump_pages() for
> > instance. It has the additional upside of being able to control all the
> > messages with a single flag. I'm not sure it's worth it though, I'll let
> > you decide.
> 
> Yes, this is very spammy. Maybe instead of:
> 
> Frame descriptor
> 	type CSI-2
> 	entries 2
> 	entry 0
> 	flags LEN_MAX
> 		stream 0
> 		pixelcode 0x3012
> 		length 3194400
> 		vc 0
> 		dt 0x2c
> 	entry 1
> 	flags LEN_MAX
> 		stream 1
> 		pixelcode 0x8003
> 		length 2904
> 		vc 0
> 		dt 0x12
> 
> 
> Frame descriptor type CSI-2:
>   pad 0 stream 0 code 0x3012 len 3194400 vc 0 dt 0x2c LEN_MAX
>   pad 0 stream 1 code 0x8003 len 2904 vc 0 dt 0x12 LEN_MAX
> 
> (note: pad is missing in your patch)

It's indeed much more condensed but still contains all the relevant
information. I'll switch to this (or something alike).

-- 
Regards,

Sakari Ailus
