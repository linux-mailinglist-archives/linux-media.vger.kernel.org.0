Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C15D32596
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 01:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfFBXJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 19:09:09 -0400
Received: from mga03.intel.com ([134.134.136.65]:16004 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfFBXJJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 2 Jun 2019 19:09:09 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jun 2019 16:09:07 -0700
X-ExtLoop1: 1
Received: from lfgiles-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.33.77])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2019 16:09:05 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 85BDC21D78; Mon,  3 Jun 2019 02:08:54 +0300 (EEST)
Date:   Mon, 3 Jun 2019 02:08:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [RESEND PATCH 1/1] v4l2-subdev: Try formats are only available
 if subdev API is enabled
Message-ID: <20190602230853.zjeoklpuwi26nd5e@kekkonen.localdomain>
References: <20190531115426.15697-1-sakari.ailus@linux.intel.com>
 <4923128.VWv0Upv8b6@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4923128.VWv0Upv8b6@z50>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Fri, May 31, 2019 at 08:40:26PM +0200, Janusz Krzysztofik wrote:
> Hi Sakari,
> 
> On Friday, May 31, 2019 1:54:26 PM CEST Sakari Ailus wrote:
> > Return an error for which == V4L2_SUBDEV_FORMAT_TRY if
> > CONFIG_VIDEO_V4L2_SUBDEV_API is not enabled.  This is because the try
> > formats are not available in that case. 
> 
> As far as I can see, there are 21 V4L2 subdevice drivers which don't support 
> V4L2 subdev API but implement V4L2_SUBDEV_FORMAT_TRY operation mode somehow.  
> Someone already took that decision in the past and replaced video operation 
> callbacks with pad operation callbacks supporting V4L2_SUBDEV_FORMAT_TRY 
> without the requirement for V4L2 subdev API support.
> 
> With this change in place, those drivers will loose that functionality if 
> built without CONFIG_VIDEO_V4L2_SUBDEV_API, but will happily work as before 
> otherwise.  That's probably not exactly what you intended.

Right. Indeed. The old format video ops were converted to use the pad
ops, even for drivers that knew nothing about pads. When writing this
patch, I missed the try_fmt was actually still supported the same way. Not
many drivers use it, but it's still there.

I believe your earlier patchset almost covers the thinkable pitfalls that
could arise from supporting both legacy subdev format and subder pad format
semantics. I'll submit another patch, let's see if people can poke holes
into that one. :-)

> 
> > Do the check here so that drivers
> > don't need to.
> 
> So only beneficiaries of this change will be V4L2 subdevice drivers which don't 
> support V4L2 subdev API and don't support V4L2_SUBDEV_FORMAT_TRY.  Existing 
> drivers of that kind already have that check in place and I can hardly imagine 
> someone is going to optimize them by removing it.  Any new drivers will 
> probably support V4L2 subdev API from the beginning so they'll not benefit from 
> this patch at all as they won't build without CONFIG_VIDEO_V4L2_SUBDEV_API.
> 
> I think that if a driver doesn't support V4L2_SUBDEV_FORMAT_TRY, it should 
> simply check for that value itself and respond accordingly, no matter if it 
> supports V4L2 subdev API or not.  As time passes, old drivers will be either 
> depreciated or refreshed to handle V4L2_SUBDEV_FORMAT_TRY the V4L2 subdev API 
> way, as we would like them to.
> 
> Thanks,
> Janusz
> 
> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Depends-on: ("media: v4l2-subdev: Verify v4l2_subdev_call() pad config 
> argument")
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/
> v4l2-subdev.c
> > index 34219e489be27..88b4b9d7c41be 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -122,7 +122,10 @@ static int subdev_close(struct file *file)
> >  
> >  static inline int check_which(__u32 which)
> >  {
> > -	if (which != V4L2_SUBDEV_FORMAT_TRY &&
> > +	if (
> > +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> > +	    which != V4L2_SUBDEV_FORMAT_TRY &&
> > +#endif
> >  	    which != V4L2_SUBDEV_FORMAT_ACTIVE)
> >  		return -EINVAL;
> >  
> > 
> 
> 
> 
> 

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
