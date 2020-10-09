Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF40288717
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 12:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387747AbgJIKkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 06:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgJIKkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 06:40:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2FCC0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 03:40:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA7BC539;
        Fri,  9 Oct 2020 12:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602240012;
        bh=PqbODTrBE8wGQdG17mWpDVlg7eqLk9tFXKhRlqahTgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vfQUFtjOKlWYIpVZOpn+d8Ibgcr76xONKVuySpmWRU2PsIv4P5TIilDjErBy8BFII
         jopDIiPAG/Y0L/HyfOAhfmHvTXRd5sXMUxvnjtSH8kg+fj7Z59kdFXm1ZZX2FiQfHn
         PWg5V1Jn76sVr735KVBU9l8nWGkdVzDhUfFP0YpI=
Date:   Fri, 9 Oct 2020 13:39:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 2/3] ipu3-cio2: Serialise access to pad format
Message-ID: <20201009103929.GA3935@pendragon.ideasonboard.com>
References: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
 <20201008204747.26320-3-sakari.ailus@linux.intel.com>
 <20201009004412.GB12857@pendragon.ideasonboard.com>
 <20201009094347.GQ26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201009094347.GQ26842@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Oct 09, 2020 at 12:43:47PM +0300, Sakari Ailus wrote:
> On Fri, Oct 09, 2020 at 03:44:12AM +0300, Laurent Pinchart wrote:
> > On Thu, Oct 08, 2020 at 11:47:46PM +0300, Sakari Ailus wrote:
> > > Pad format can be accessed from user space. Serialise access to it.
> > > 
> > > Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 11 +++++++++++
> > >  drivers/media/pci/intel/ipu3/ipu3-cio2.h |  1 +
> > >  2 files changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > > index afa472026ba4..9c7b527a8800 100644
> > > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > > @@ -1233,11 +1233,15 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
> > >  {
> > >  	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
> > >  
> > > +	mutex_lock(&q->subdev_lock);
> > > +
> > >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > >  		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> > >  	else
> > >  		fmt->format = q->subdev_fmt;
> > >  
> > > +	mutex_unlock(&q->subdev_lock);
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > @@ -1261,6 +1265,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
> > >  	if (fmt->pad == CIO2_PAD_SOURCE)
> > >  		return cio2_subdev_get_fmt(sd, cfg, fmt);
> > >  
> > > +	mutex_lock(&q->subdev_lock);
> > > +
> > >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> > >  		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> > >  	} else {
> > > @@ -1271,6 +1277,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
> > >  		fmt->format = q->subdev_fmt;
> > >  	}
> > 
> > Not a candidate for this patch, but this should restrict the pixel
> > format and size to supported values.
> 
> Yes.
> 
> > 
> > >  
> > > +	mutex_unlock(&q->subdev_lock);
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > @@ -1529,6 +1537,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
> > >  
> > >  	/* Initialize miscellaneous variables */
> > >  	mutex_init(&q->lock);
> > > +	mutex_init(&q->subdev_lock);
> > >  
> > >  	/* Initialize formats to default values */
> > >  	fmt = &q->subdev_fmt;
> > > @@ -1646,6 +1655,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
> > >  	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
> > >  fail_fbpt:
> > >  	mutex_destroy(&q->lock);
> > > +	mutex_destroy(&q->subdev_lock);
> > >  
> > >  	return r;
> > >  }
> > > @@ -1658,6 +1668,7 @@ static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
> > >  	media_entity_cleanup(&q->subdev.entity);
> > >  	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
> > >  	mutex_destroy(&q->lock);
> > > +	mutex_destroy(&q->subdev_lock);
> > >  }
> > >  
> > >  static int cio2_queues_init(struct cio2_device *cio2)
> > > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > > index 549b08f88f0c..df0247326a1d 100644
> > > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > > @@ -335,6 +335,7 @@ struct cio2_queue {
> > >  
> > >  	/* Subdev, /dev/v4l-subdevX */
> > >  	struct v4l2_subdev subdev;
> > > +	struct mutex subdev_lock;
> > 
> > Can you add a small comment to tell which field(s) this lock protects ?
> 
> How about:
> 
> 	/* Serialise access to subdev_fmt field */

That's perfect :-)

> Currently it's just that, but I feel locking in this driver would generally
> benefit from refactoring. That can wait a little though as it's not an
> acute problem.

Sure.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > >  	struct media_pad subdev_pads[CIO2_PADS];
> > >  	struct v4l2_mbus_framefmt subdev_fmt;
> > >  	atomic_t frame_sequence;

-- 
Regards,

Laurent Pinchart
