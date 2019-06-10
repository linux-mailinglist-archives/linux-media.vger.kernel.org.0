Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A1D3B150
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 10:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388257AbfFJIyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 04:54:51 -0400
Received: from mga01.intel.com ([192.55.52.88]:18771 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388120AbfFJIyv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 04:54:51 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 01:54:50 -0700
X-ExtLoop1: 1
Received: from mwilganx-mobl2.ger.corp.intel.com (HELO mara.localdomain) ([10.249.140.122])
  by orsmga001.jf.intel.com with ESMTP; 10 Jun 2019 01:54:48 -0700
Received: from sailus by mara.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1haG4j-0000MC-6w; Mon, 10 Jun 2019 11:54:45 +0300
Date:   Mon, 10 Jun 2019 11:54:44 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        m.felsch@pengutronix.de
Subject: Re: [RFC 1/1] v4l2-subdev: Rework subdev format and selection macros
 to work without MC
Message-ID: <20190610085443.mdwxw6pehfr2o5e4@mara.localdomain>
References: <20190604175731.20596-1-sakari.ailus@linux.intel.com>
 <1846727.Tl316bQTBL@z50>
 <20190606135642.2fctrsymqmuxsxol@paasikivi.fi.intel.com>
 <60014338.tBqkIJZrQe@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60014338.tBqkIJZrQe@z50>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Thu, Jun 06, 2019 at 08:13:36PM +0200, Janusz Krzysztofik wrote:
> Hi Sakari,
> 
> On Thursday, June 6, 2019 3:56:42 PM CEST Sakari Ailus wrote:
> > Hi Janusz,
> > 
> > On Wed, Jun 05, 2019 at 09:33:41PM +0200, Janusz Krzysztofik wrote:
> > > Hi Sakari,
> > > 
> > > On Tuesday, June 4, 2019 7:57:31 PM CEST Sakari Ailus wrote:
> > > > Rework the macros for accessing subdev try formats to work meaningfully
> > > > and relatively safely without V4L2 sub-device uAPI (and without MC). This
> > > > is done by simply reverting to accessing the pad number zero if
> > > > CONFIG_VIDEO_V4L2_SUBDEV_API isn't enabled, and emitting a kernel warning
> > > > if the pad is non-zero in that case.
> > > > 
> > > > The functions are seen useful if subdev uAPI is disabled for drivers that
> > > > can work without the Kconfig option but benefit from the option if it's
> > > > enabled.
> > > 
> > > I'm not sure which drivers you (we) consider valid users of those functions.  
> > > Subdevice drivers only? Or other drivers which interact with subdevices as 
> > > well?  An answer to that question determines my possible other comments.
> > 
> > These functions are only by drivers for the devices they control directly
> > only.
> 
> That's what I expected.
> 
> Exposing those functions to drivers not supporting V4L2 subdev uAPI is 
> not a bad idea but it would make more sense to me if we also updated potential 
> users.  Otherwise I just don't believe anyone will care for as long as a 
> driver is not refreshed to support MC and V4L2 subdev uAPI.

The primary users of these functions are drivers that do support subdev
uAPI. Some drivers can function that disabled, so making these functions
usable to those drivers in all cases simplifies those drivers.

> 
> > > ...
> > > > As a by-product, the patch simplifies individual inline functions by
> > > > removing two lines of code from each of them and moving the functionality
> > > > to a common macro.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > Hi guys,
> > > > 
> > > > This might not be pretty but should provide some comfort for drivers
> > > > working with different Kconfig options. Comments are welcome...
> > > > 
> > > >  include/media/v4l2-subdev.h | 24 ++++++++++++++----------
> > > >  1 file changed, 14 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index e1e3c18c3fd6..3328f302326b 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -930,6 +930,17 @@ struct v4l2_subdev_fh {
> > > >  	container_of(fh, struct v4l2_subdev_fh, vfh)
> > > >  
> > > >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > > > +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
> > > > +	(WARN_ON(!(__cfg)) ? NULL :		\
> > > > +	 ((__sd)->entity.graph_obj.mdev ?				
> > > \strange
> > > > +	  (WARN_ON((__pad) >= (__sd)->entity.num_pads) ?		\
> > > > +	   NULL : &(__cfg)[__pad].__field) :				
> > > \
> > > > +	  &(__cfg)[WARN_ON(__pad) && 0].__field))
> > > > +#else /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> > > > +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
> > > > +	(WARN_ON(!(__cfg)) ? NULL :				
> > > 	\
> > > > +	 &(__cfg)[WARN_ON(__pad) && 0].__field)
> > > > +#endif /* !CONFIG_VIDEO_V4L2_SUBDEV_API */
> 
> I think that as long as we already have in place the same checks performed by 
> v4l2_subdev_call() which seems the only user entry point to a subdevice 
> driver, invalid cfg or pad values you are trying to catch here will never be 
> passed unless the driver performs unusual operations and, moreover, is 
> internally broken.

You can't rely on checks done by the v4l2_subdev_call macro as these
parameters do not come from the caller; they are set by the driver itself.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
