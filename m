Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E0D5995F
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 13:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfF1LrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 07:47:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:64067 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbfF1LrV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 07:47:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jun 2019 04:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; 
   d="scan'208";a="361045904"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2019 04:47:18 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 10AE52071F; Fri, 28 Jun 2019 14:47:17 +0300 (EEST)
Date:   Fri, 28 Jun 2019 14:47:17 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Subject: Re: [PATCH v2 4/9] v4l2-async: Add
 v4l2_async_notifier_add_fwnode_remote_subdev
Message-ID: <20190628114717.jkpyvrmfsnvkeaoj@paasikivi.fi.intel.com>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
 <20190606130225.10751-5-sakari.ailus@linux.intel.com>
 <20190614161416.z4ykn7rdzmizxsts@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614161416.z4ykn7rdzmizxsts@uno.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Jun 14, 2019 at 06:14:16PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Thu, Jun 06, 2019 at 04:02:20PM +0300, Sakari Ailus wrote:
> > v4l2_async_notifier_add_fwnode_remote_subdev is a convenience function for
> > parsing information on V4L2 fwnode subdevs.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 23 +++++++++++++++++++++++
> >  include/media/v4l2-async.h           | 25 +++++++++++++++++++++++++
> >  2 files changed, 48 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index dc4e83b4f6ba..2ea8afbcbf8f 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -609,6 +609,29 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_subdev);
> >
> > +int
> > +v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> > +					     struct fwnode_handle *endpoint,
> > +					     struct v4l2_async_subdev *asd)
> > +{
> > +	struct fwnode_handle *remote_ep;
> > +	int ret;
> > +
> > +	remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
> > +	if (!remote_ep)
> > +		return -ENOTCONN;
> > +
> > +	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> > +	asd->match.fwnode = remote_ep;
> > +
> > +	ret = v4l2_async_notifier_add_subdev(notif, asd);
> > +	if (ret)
> > +		fwnode_handle_put(remote_ep);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_remote_subdev);
> > +
> >  struct v4l2_async_subdev *
> >  v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
> >  				   int adapter_id, unsigned short address,
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index b9141ffa188a..55ce3c1672a4 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -185,6 +185,31 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >  				      unsigned int asd_struct_size);
> >
> >  /**
> > + * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
> > + *						  remote async subdev to the
> > + *						  notifier's master asd_list.
> > + *
> > + * @notif: pointer to &struct v4l2_async_notifier
> > + * @endpoint: local endpoint the remote sub-device to be matched
> 
> Not sure I get what you mean here, maybe you're missing a "to" between
> the "local endpoint" and "the remote sub-device" ?

This was meant to read "local endpoint pointing to the remote sub-device to
be matched".

> 
> > + * @asd: Async sub-device struct allocated by the caller. The &struct
> > + *	 v4l2_async_subdev shall be the first member of the driver's async
> > + *	 sub-device struct, i.e. both begin at the same memory address.
> > + *
> > + * Gets the remote endpoint of a given local endpoint, set it up for fwnode
> > + * matching and add the async sub-device to the notifier's @asd_list. The
> 
> and adds

Fixed.

> 
> > + * function also gets a reference of the fwnode which is released later at
> > + * notifier cleanup time.
> > + *
> > + * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
> > + * exception that the fwnode refers to a local endpoint, not the remote one, and
> > + * the function relies on the caller to allocate the async sub-device struct.
> 
> This makes v4l2_async_notifier_add_fwnode_subdev behave differently from
> v4l2_async_notifier_add_subdev and the here introduced
> v4l2_async_notifier_add_remote_subdev in the sense that it's the only
> one that allocates the asd for the caller. I'm not sure I see the
> advantage of having many functions for doing similar things with a
> slightly different interface. What is the reason add_fwnode-subdev
> allocates the asd for the caller?

Having to do less work in drivers that can be moved elsewhere. The old
function is used by around 20 users so I think it'll be around for a while.

The fwnode API is getting big and I think after this set there should be
more work done in converting the old drivers to use newer (and better)
interfaces.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
