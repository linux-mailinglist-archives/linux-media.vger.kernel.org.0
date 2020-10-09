Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875BA288647
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 11:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733217AbgJIJo5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 05:44:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:29682 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733208AbgJIJo5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 05:44:57 -0400
IronPort-SDR: T1ck9MC7/ANn85KQ9LkeYcGsaROvObqCFosfr3qnUVpNOK2MlDspPLJ4LfjFz0NBXZgO4DS1PH
 w9luCBOwx6dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="164675669"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="164675669"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 02:44:56 -0700
IronPort-SDR: AoWPURPwB90XQ5kBLv1HE3iucP15G0yU6v1Nktkg8RUAKxmezdqK8DkDAfs2qui9Dro2Cs0GP4
 1Rta98ftAYZQ==
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="345015270"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 02:44:54 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 91A4920728; Fri,  9 Oct 2020 12:44:52 +0300 (EEST)
Date:   Fri, 9 Oct 2020 12:44:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 3/3] ipu3-cio2: Only allow setting valid mbus codes
Message-ID: <20201009094452.GR26842@paasikivi.fi.intel.com>
References: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
 <20201008204747.26320-4-sakari.ailus@linux.intel.com>
 <20201009004949.GC12857@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009004949.GC12857@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 09, 2020 at 03:49:49AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Oct 08, 2020 at 11:47:47PM +0300, Sakari Ailus wrote:
> > Check the mbus code provided by the user is one of those the driver
> > supports. Ignore the code in set_fmt otherwise.
> 
> You're reading my mind :-)
> 
> The code shouldn't be ignored though, when an unsupported code is set,
> it's best to use a fixed default code instead to make the driver
> behaviour as stateless as possible.

I can change it to that, yes.

> 
> > Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index 9c7b527a8800..2ea6313e00b0 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -1270,10 +1270,17 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> >  	} else {
> > +		unsigned int i;
> > +
> >  		/* It's the sink, allow changing frame size */
> >  		q->subdev_fmt.width = fmt->format.width;
> >  		q->subdev_fmt.height = fmt->format.height;
> > -		q->subdev_fmt.code = fmt->format.code;
> > +		for (i = 0; i < ARRAY_SIZE(formats); i++) {
> > +			if (formats[i].mbus_code == fmt->format.code) {
> > +				q->subdev_fmt.code = fmt->format.code;
> > +				break;
> > +			}
> > +		}
> >  		fmt->format = q->subdev_fmt;
> 
> This should equally apply to the TRY format, we should accept an
> unsupported code. I'd rework the code as follows:
> 
> 	v4l2_mbus_framefmt *format;
> 
> 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> 		format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> 	else
> 		format = &q->subdev_fmt;
> 
> (this can be done outside of the mutex-protected section) and then
> operate on format unconditionally.

Agreed.

> Note that we should also allow changing the field and colorspace
> information.

Indeed.

-- 
Sakari Ailus
