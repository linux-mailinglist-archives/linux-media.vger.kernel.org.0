Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9AB28863C
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 11:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733177AbgJIJnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 05:43:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:56759 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731745AbgJIJnw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 05:43:52 -0400
IronPort-SDR: J5p2hHSsiXwaeQazh/jdR34aZgE/1wvzYz4fTqDLQRf+wRJAh7ExrdomYP0SWmaZXIsfOYJAex
 Efr/wbkao66Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="162003095"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="162003095"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 02:43:51 -0700
IronPort-SDR: 5JBFgGu1U2QF1q4VZo6/nyl5voMsdZWEeWzOJ/zPvTjyWnIvQ6gRNip1p3MniR0gx7Crs33von
 OpJO8FH6/sUQ==
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="312494444"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 02:43:49 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C7A3D20728; Fri,  9 Oct 2020 12:43:47 +0300 (EEST)
Date:   Fri, 9 Oct 2020 12:43:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 2/3] ipu3-cio2: Serialise access to pad format
Message-ID: <20201009094347.GQ26842@paasikivi.fi.intel.com>
References: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
 <20201008204747.26320-3-sakari.ailus@linux.intel.com>
 <20201009004412.GB12857@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009004412.GB12857@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 09, 2020 at 03:44:12AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review!

> 
> On Thu, Oct 08, 2020 at 11:47:46PM +0300, Sakari Ailus wrote:
> > Pad format can be accessed from user space. Serialise access to it.
> > 
> > Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 11 +++++++++++
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.h |  1 +
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index afa472026ba4..9c7b527a8800 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -1233,11 +1233,15 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
> >  {
> >  	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
> >  
> > +	mutex_lock(&q->subdev_lock);
> > +
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> >  		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> >  	else
> >  		fmt->format = q->subdev_fmt;
> >  
> > +	mutex_unlock(&q->subdev_lock);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1261,6 +1265,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
> >  	if (fmt->pad == CIO2_PAD_SOURCE)
> >  		return cio2_subdev_get_fmt(sd, cfg, fmt);
> >  
> > +	mutex_lock(&q->subdev_lock);
> > +
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> >  	} else {
> > @@ -1271,6 +1277,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
> >  		fmt->format = q->subdev_fmt;
> >  	}
> 
> Not a candidate for this patch, but this should restrict the pixel
> format and size to supported values.

Yes.

> 
> >  
> > +	mutex_unlock(&q->subdev_lock);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1529,6 +1537,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
> >  
> >  	/* Initialize miscellaneous variables */
> >  	mutex_init(&q->lock);
> > +	mutex_init(&q->subdev_lock);
> >  
> >  	/* Initialize formats to default values */
> >  	fmt = &q->subdev_fmt;
> > @@ -1646,6 +1655,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
> >  	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
> >  fail_fbpt:
> >  	mutex_destroy(&q->lock);
> > +	mutex_destroy(&q->subdev_lock);
> >  
> >  	return r;
> >  }
> > @@ -1658,6 +1668,7 @@ static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
> >  	media_entity_cleanup(&q->subdev.entity);
> >  	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
> >  	mutex_destroy(&q->lock);
> > +	mutex_destroy(&q->subdev_lock);
> >  }
> >  
> >  static int cio2_queues_init(struct cio2_device *cio2)
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > index 549b08f88f0c..df0247326a1d 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > @@ -335,6 +335,7 @@ struct cio2_queue {
> >  
> >  	/* Subdev, /dev/v4l-subdevX */
> >  	struct v4l2_subdev subdev;
> > +	struct mutex subdev_lock;
> 
> Can you add a small comment to tell which field(s) this lock protects ?

How about:

	/* Serialise access to subdev_fmt field */

Currently it's just that, but I feel locking in this driver would generally
benefit from refactoring. That can wait a little though as it's not an
acute problem.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  	struct media_pad subdev_pads[CIO2_PADS];
> >  	struct v4l2_mbus_framefmt subdev_fmt;
> >  	atomic_t frame_sequence;
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
