Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483107DB4D2
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 09:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjJ3IHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 04:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbjJ3IHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 04:07:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59920E1
        for <linux-media@vger.kernel.org>; Mon, 30 Oct 2023 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698653234; x=1730189234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R6EgUX9MLkLtUMjsUFUlQtwJYKRJ2HJage590k9wq9Q=;
  b=IBTjAJj9qcQiNNBZWKhG8Sxl3H1K2uEOYmgxu5LZZjPFCEhuFz2Vbpka
   +ObcOeOY0J8D4KnvAGECAN5JBm6YDaTOwFAzZl4I4PwbT4f8QCnTyQRPh
   ygpIqKtjFamN7gCXuXfsoTyAy5wkR+ZAAAS3zStma7xfS2CtRqd76de+Y
   rVYtnojva8kn5qrrgqUrnE6PcaosbaFtpkzh/Pn0bXK7H7spCtpbIbr5q
   3QEy2afzqktUC9f7aV9yzPHG7k8GHv/u5R3hi4x1/7D3fvx/0GFfhZQ5y
   WvVjbFav5Ao7krzLhWBanuMzR0hVE084IY0d9VGt1i6gA8L48gCYEmV7E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="6663819"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="6663819"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 01:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="710031781"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="710031781"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 01:07:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 6C56011F82E;
        Mon, 30 Oct 2023 09:57:13 +0200 (EET)
Date:   Mon, 30 Oct 2023 07:57:13 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 18/28] media: uapi: Allow a larger number of routes
 than there's room for
Message-ID: <ZT9h2cNZAJNaCVrk@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-9-sakari.ailus@linux.intel.com>
 <811d8344-192f-4fb6-8da6-b0c8b93165b8@ideasonboard.com>
 <20231025210726.GA16151@pendragon.ideasonboard.com>
 <adaadd6e-c163-4c3a-b851-b2de184b5b5e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adaadd6e-c163-4c3a-b851-b2de184b5b5e@xs4all.nl>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Oct 27, 2023 at 03:13:55PM +0200, Hans Verkuil wrote:
> On 25/10/2023 23:07, Laurent Pinchart wrote:
> > On Mon, Oct 09, 2023 at 01:56:21PM +0300, Tomi Valkeinen wrote:
> >> On 03/10/2023 15:08, Sakari Ailus wrote:
> >>> On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
> >>> as there's room. Do not consider it an error if more routes existed.
> >>> Simply inform the user there are more routes.
> >>
> >> Inform how? And I agree with Hans here. How about return ENOSPC, but the 
> >> kernel fills in num_routes to tell the userspace how many there actually 
> >> are?
> > 
> > For VIDIOC_SUBDEV_G_ROUTING I have no objection. For
> > VIDIOC_SUBDEV_S_ROUTING, however, I would prefer the ioctl to succeed if
> > the routes can be applied but there's not enough space to return them
> > all to the application. The application may not have an interest in
> > getting the applied routes back.
> 
> For S_ROUTING, do we still want to update num_routes in that case? Even
> though we return 0 since we could actually set the routes.

num_routes should be updated in this case, otherwise the caller won't know
there are more routes. The caller can then decide what to do about it, to
get the routes using G_ROUTING for instance: the length of the routing
table is now known.

> 
> I think it depends a bit on the naming of these fields in v7.

I recall there was a comment on the naming now, possibly from you, but I
can't find the comments at the moment. :-I I'm open to renaming them but I
don't think the current naming is bad either.

> 
> How likely is it that an application would run into this anyway? I suspect a
> typical app will get the routes first, then modify it.

Laurent can probably comment on this from libcamera perspective, but I
presume that most users of routes are somehow specific to the device. I
would expect source sub-devices that produce the streams are typical places
where you may have dependencies between streams, but they do exist
elsewhere (but there are very few cases).

> 
> It's worth giving this a try, but it depends a bit on how easy it is to
> document it. If you need to jump through hoops to try to explain it to an
> end user, then perhaps this is overly complicated.

The documentation is changed in patch "media: v4l: subdev: Add len_routes
field to struct v4l2_subdev_routing", two patches prior to this. The
changes are split across several patches in order to avoid fewer difficult
to review patches.

I'll change the prefix of this patch to "v4l: subdev:" as well.

-- 
Regards,

Sakari Ailus
