Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF3131356A
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 15:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhBHOlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 09:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhBHOl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 09:41:26 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DEEC061788
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 06:40:46 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5A5CB1F44D6A
Message-ID: <35b53b6ce11b2365487b5860ce39ad75143cff70.camel@collabora.com>
Subject: Re: [PATCH v5 11/13] media: v4l2-async: Discourage use of
 v4l2_async_notifier_add_subdev
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Mon, 08 Feb 2021 11:40:34 -0300
In-Reply-To: <20210208135403.68695519@coco.lan>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
         <20210202135611.13920-12-sakari.ailus@linux.intel.com>
         <20210206091546.1497bbcb@coco.lan>
         <20210208103244.GQ32460@paasikivi.fi.intel.com>
         <20210208135403.68695519@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, 2021-02-08 at 13:54 +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 8 Feb 2021 12:32:44 +0200
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > Hi Mauro,
> > 
> > Thanks for the review.
> > 
> > On Sat, Feb 06, 2021 at 09:15:46AM +0100, Mauro Carvalho Chehab wrote:
> > > Em Tue,  2 Feb 2021 15:56:09 +0200
> > > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> > >   
> > > > From: Ezequiel Garcia <ezequiel@collabora.com>
> > > > 
> > > > Most -if not all- use-cases are expected to be covered by one of:
> > > > v4l2_async_notifier_add_fwnode_subdev,
> > > > v4l2_async_notifier_add_fwnode_remote_subdev or
> > > > v4l2_async_notifier_add_i2c_subdev.  
> > > 
> > > Actually, all cases outside V4L2 core:
> > > 
> > > $ git grep v4l2_async_notifier_add_subdev
> > > Documentation/driver-api/media/v4l2-subdev.rst:using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> > > drivers/media/v4l2-core/v4l2-async.c:int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > > drivers/media/v4l2-core/v4l2-async.c:EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
> > > drivers/media/v4l2-core/v4l2-async.c:   ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > > drivers/media/v4l2-core/v4l2-async.c:   ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > > drivers/media/v4l2-core/v4l2-fwnode.c:  ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > > include/media/v4l2-async.h: * before the first call to @v4l2_async_notifier_add_subdev.
> > > include/media/v4l2-async.h: * v4l2_async_notifier_add_subdev - Add an async subdev to the
> > > include/media/v4l2-async.h:int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > > include/media/v4l2-async.h: * @v4l2_async_notifier_add_subdev,
> > > 
> > >   
> > > > 
> > > > We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
> > > > so rename it as __v4l2_async_notifier_add_subdev. This is
> > > > typically a good hint for drivers to avoid using the function.  
> > > 
> > > IMO, the best here would be to create a header file:
> > > 
> > >         drivers/media/v4l2-core/v4l2-async-priv.h
> > > 
> > > and move v4l2_async_notifier_add_subdev from include/media/v4l2-async.h.
> > > 
> > > This will warrant that only the V4L2 core would have access to it.
> > > Also, it is a lot better than adding something like this:  
> > 
> > It'd be the first header in the directory. I suppose there are other
> > functions that could have the prototype there.
> > 
> > I'll still see if there could be other options for this.
> > 
> > The topic of split into modules of v4l2-async and v4l2-fwnode was also
> > discussed recently, and it's obviously related to this. The two are
> > virtually always used together and so would make sense to be in the same
> > module. In practice this would mean moving v4l2-async out of videodev2. The
> > module wouldn't be large but the vast majority of regular laptop and
> > desktop PC users are having this in memory needlessly.
> 
> IMO, splitting kAPI headers from v4l-core internal usage is a good
> idea for the things that should be used only inside the core.
> 
> The RC core has one such header:
> 
>         drivers/media/rc/rc-core-priv.h
> 
> Several DVB frontend and tuner drivers also have things like that.
> 

This solution looks like the way to go. Thanks for bringing it up.

Specifically for v4l2-async, we were considering reorganizing the
code, perhaps removing the need for a private/core API.
We'll see how that goes.

Thanks,
Ezequiel

