Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5976F0AEC
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 19:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244395AbjD0RgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 13:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244186AbjD0RgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 13:36:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC6A4233
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 10:36:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3551BC7E;
        Thu, 27 Apr 2023 19:35:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682616958;
        bh=SQjmZYRa2mJwSPzRJYa+t1+T8gR/HkEAt4kOZSwhrBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D5ts9swQMCH3Y71aAKv7Rez2bAw/JDdeE4wxSgnlj9J0C+SqWHRWhyE51a76uq3TT
         pcgU3B2AG72gy/CSQB5vgTehnIGsEF4c0S3PLrgySemY8qiWA9oHsVKbQYvGBRquaS
         aSihdL0plSAu/b20gElua4Bu2wXmm2rf2LcEuccE=
Date:   Thu, 27 Apr 2023 20:36:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 07/18] media: v4l: async: Clean up list heads and entries
Message-ID: <20230427173621.GE26786@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-8-sakari.ailus@linux.intel.com>
 <20230425004936.GE4921@pendragon.ideasonboard.com>
 <ZEpiBX8b2rrO36vE@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZEpiBX8b2rrO36vE@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Apr 27, 2023 at 02:52:37PM +0300, Sakari Ailus wrote:
> On Tue, Apr 25, 2023 at 03:49:36AM +0300, Laurent Pinchart wrote:
> > On Thu, Mar 30, 2023 at 02:58:42PM +0300, Sakari Ailus wrote:
> > > The naming of list heads and list entries is confusing as they're named
> > > similarly. Use _head for list head and _list for list entries.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
> > >  .../platform/renesas/rcar-vin/rcar-core.c     |  2 +-
> > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 +-
> > >  drivers/media/platform/xilinx/xilinx-vipp.c   | 10 +--
> > >  drivers/media/v4l2-core/v4l2-async.c          | 66 +++++++++----------
> > >  .../staging/media/imx/imx-media-dev-common.c  |  2 +-
> > >  drivers/staging/media/tegra-video/vi.c        |  6 +-
> > >  include/media/v4l2-async.h                    | 21 +++---
> > >  8 files changed, 56 insertions(+), 55 deletions(-)
> > 
> > [snip]
> > 
> > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > > index 0c4cffd081c9..425280b4d387 100644
> > > --- a/include/media/v4l2-async.h
> > > +++ b/include/media/v4l2-async.h
> > > @@ -68,7 +68,7 @@ struct v4l2_async_match {
> > >   * @match:	struct of match type and per-bus type matching data sets
> > >   * @asd_list:	used to add struct v4l2_async_subdev objects to the
> > >   *		master notifier @asd_list
> > 
> > It's now called @asd_head.
> > 
> > > - * @list:	used to link struct v4l2_async_subdev objects, waiting to be
> > > + * @waiting_list: used to link struct v4l2_async_subdev objects, waiting to be
> > >   *		probed, to a notifier->waiting list
> > 
> > It's now called notifier->waiting_head.
> > 
> > Please double-check comments and documentation to catch other
> > occurrences.
> 
> Sure.
> 
> > 
> > >   *
> > >   * When this struct is used as a member in a driver specific struct,
> > > @@ -77,9 +77,10 @@ struct v4l2_async_match {
> > >   */
> > >  struct v4l2_async_subdev {
> > >  	struct v4l2_async_match match;
> > > +
> > >  	/* v4l2-async core private: not to be used by drivers */
> > > -	struct list_head list;
> > >  	struct list_head asd_list;
> > > +	struct list_head waiting_list;
> > >  };
> > >  
> > >  /**
> > > @@ -108,20 +109,20 @@ struct v4l2_async_notifier_operations {
> > >   * @v4l2_dev:	v4l2_device of the root notifier, NULL otherwise
> > >   * @sd:		sub-device that registered the notifier, NULL otherwise
> > >   * @parent:	parent notifier
> > > - * @asd_list:	master list of struct v4l2_async_subdev
> > > - * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
> > > - * @done:	list of struct v4l2_subdev, already probed
> > > - * @list:	member in a global list of notifiers
> > > + * @asd_head:	master list of struct v4l2_async_subdev
> > > + * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
> > > + * @done_head:	list of struct v4l2_subdev, already probed
> > > + * @notifier_list: member in a global list of notifiers
> > >   */
> > >  struct v4l2_async_notifier {
> > >  	const struct v4l2_async_notifier_operations *ops;
> > >  	struct v4l2_device *v4l2_dev;
> > >  	struct v4l2_subdev *sd;
> > >  	struct v4l2_async_notifier *parent;
> > > -	struct list_head asd_list;
> > > -	struct list_head waiting;
> > > -	struct list_head done;
> > > -	struct list_head list;
> > > +	struct list_head asd_head;
> > > +	struct list_head waiting_head;
> > > +	struct list_head done_head;
> > > +	struct list_head notifier_list;
> > 
> > I find the _head suffix to still be confusing. How about the following ?
> > 
> > 	struct {
> > 		struct list_head all;
> > 		struct list_head waiting;
> > 		struct list_head done;
> > 	} asds;
> 
> There are many list heads and entries in v4l2-async related structs and
> before this patch. _head is used for all list heads, _list for list
> entries. I prefer having _head as this way it is trivial to look for all
> instances of that list head, removing the _head part makes this much
> harder.
> 
> How about using _entry for list entries instead?

I like that. I would have used _entry for the list entries, and _list
for the list "heads". I don't like the _head suffix very much, as all of
them are struct list_head instances. I won't nack the series for this
though :-)

> There doesn't seem to be much consistency in the kernel but in the majority
> of cases it is self-evident I guess.

-- 
Regards,

Laurent Pinchart
