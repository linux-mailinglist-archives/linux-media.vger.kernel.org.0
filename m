Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E936EDA31
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 04:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbjDYCOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 22:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbjDYCOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 22:14:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8404AF22
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 19:14:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10CF975B;
        Tue, 25 Apr 2023 04:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682388862;
        bh=I0rmZsjvsRZLHo6HmfahzoFfN6aVy94ZUIvbeBRSVqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=khHU2/GJeHU9N2bKylRe+uI8hA58XdYGJSomfUQD5AFybu0MrKx7OgNmzXUEn5ori
         caEzS1048MQnvqSOF00nLXQBYRqvPAoxyiGzC7CPU6vU8wJG2denNf3wwiWATYlap2
         fxmrHc0iIcT/hMNHYhHRRutmJ0HlcNVy5jjtVnmI=
Date:   Tue, 25 Apr 2023 05:14:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 09/18] media: v4l: async: Differentiate connecting and
 creating sub-devices
Message-ID: <20230425021442.GM4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-10-sakari.ailus@linux.intel.com>
 <jli4aguuxhjvlc6foz6acm4o7yuk7adzpx2ff2t26tter53ebh@qys7n4wgx5ls>
 <ZDlWhJGLuki4h+1z@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZDlWhJGLuki4h+1z@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Apr 14, 2023 at 04:35:00PM +0300, Sakari Ailus wrote:
> On Fri, Apr 14, 2023 at 10:52:25AM +0200, Jacopo Mondi wrote:
> > On Thu, Mar 30, 2023 at 02:58:44PM +0300, Sakari Ailus wrote:
> > > When the v4l2-async framework was introduced, the use case for it was to
> > > connect a camera sensor with a parallel receiver. Both tended to be rather
> > > simple devices with a single connection between them.
> > >
> > > The framework has been since improved in multiple ways but there are
> > > limitations that have remained, for instance the assumption an async
> > > sub-device is connected towards a single notifier and via a single link
> > > only.
> > >
> > > This patch adds an object that represents the device while an earlier
> > > patch in the series re-purposed the old struct v4l2_async_subdev as the
> > > connection.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
> > >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |   8 +-
> > >  drivers/media/platform/ti/omap3isp/isp.h      |   2 +-
> > >  drivers/media/v4l2-core/v4l2-async.c          | 163 ++++++++++++++++--
> > >  include/media/v4l2-async.h                    |  32 +++-
> > >  include/media/v4l2-subdev.h                   |   2 +-

We the introduction of such a new core concept, Documentation/ should
also be updated.

> > >  6 files changed, 179 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > index d30f0ecb1bfd..a1293c45aae1 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > @@ -148,7 +148,7 @@ struct rkisp1_info {
> > >   * @port:		port number (0: MIPI, 1: Parallel)
> > >   */
> > >  struct rkisp1_sensor_async {
> > > -	struct v4l2_async_connection asd;
> > > +	struct v4l2_async_subdev asd;

Ah, we're back to "asd" naming... There's no point in going back and
forth in drivers, so you can ignore my comment about renaming the
variables in drivers. Please however record the reason why variables are
not renamed in the commit message of patch 08/18.

On second thought, why does patch 08/18 switch to v4l2_async_connection
in a very large number of drivers, and this patch only moves back to
v4l2_async_subdev in rkisp1 and omap3isp ? What's special about these
two drivers ?

And on third thought this seems completely wrong,
v4l2_async_nf_add_fwnode() will return a pointer to a struct
v4l2_async_connection that is expected to be the first member of the
driver-specific async structure.

> > >  	unsigned int index;
> > >  	struct fwnode_handle *source_ep;
> > >  	unsigned int lanes;
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > index 39fa98e6dbbc..5bdb1ecedf6a 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > @@ -122,12 +122,12 @@ struct rkisp1_isr_data {
> > >
> > >  static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> > >  					struct v4l2_subdev *sd,
> > > -					struct v4l2_async_connection *asd)
> > > +					struct v4l2_async_connection *asc)

This belongs to a previous patch. Same for other changes below.

> > >  {
> > >  	struct rkisp1_device *rkisp1 =
> > >  		container_of(notifier, struct rkisp1_device, notifier);
> > >  	struct rkisp1_sensor_async *s_asd =
> > > -		container_of(asd, struct rkisp1_sensor_async, asd);
> > > +		container_of(asc->asd, struct rkisp1_sensor_async, asd);
> > >  	int source_pad;
> > >  	int ret;
> > >
> > > @@ -165,10 +165,10 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
> > >  	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
> > >  }
> > >
> > > -static void rkisp1_subdev_notifier_destroy(struct v4l2_async_connection *asd)
> > > +static void rkisp1_subdev_notifier_destroy(struct v4l2_async_connection *asc)
> > >  {
> > >  	struct rkisp1_sensor_async *rk_asd =
> > > -		container_of(asd, struct rkisp1_sensor_async, asd);
> > > +		container_of(asc->asd, struct rkisp1_sensor_async, asd);
> > >
> > >  	fwnode_handle_put(rk_asd->source_ep);
> > >  }
> > > diff --git a/drivers/media/platform/ti/omap3isp/isp.h b/drivers/media/platform/ti/omap3isp/isp.h
> > > index 32ea70c8d2f9..a9d760fbf349 100644
> > > --- a/drivers/media/platform/ti/omap3isp/isp.h
> > > +++ b/drivers/media/platform/ti/omap3isp/isp.h
> > > @@ -220,7 +220,7 @@ struct isp_device {
> > >  };
> > >
> > >  struct isp_async_subdev {
> > > -	struct v4l2_async_connection asd;
> > > +	struct v4l2_async_subdev asd;
> > >  	struct isp_bus_cfg bus;
> > >  };
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 56ce40481ec4..4c3bd64d6a00 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -134,6 +134,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> > >  }
> > >
> > >  static LIST_HEAD(subdev_head);
> > > +static LIST_HEAD(asd_head);
> > >  static LIST_HEAD(notifier_head);
> > >  static DEFINE_MUTEX(list_lock);
> > >
> > > @@ -304,13 +305,20 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> > >  	struct v4l2_async_notifier *subdev_notifier;
> > >  	int ret;
> > >
> > > -	ret = v4l2_device_register_subdev(v4l2_dev, sd);
> > > -	if (ret < 0)
> > > -		return ret;
> > > +	if (!asc->asd->registered) {
> > > +		ret = v4l2_device_register_subdev(v4l2_dev, sd);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	}
> > >
> > >  	ret = v4l2_async_nf_call_bound(notifier, sd, asc);
> > 
> > This is the part that puzzles me the most: are we going to receive
> > multiple bound() calls for the same subdevice when matched on multiple
> > connections ? If that's the case, is this desirable ?
> 
> Yes, that is the intent: we're dealing with connections, not to much
> sub-devices as such. That is what the current bound callbacks generally do.
> Some also deal with sub-devices but that's fine: driver changes may be
> needed to add support for new functionality.

Do I understand correctly that this change is meant to support the needs
of the i.MX6 media drivers ? If so, I'd like to see them using this new
capability of v4l2-async, to make sure it works as expected.

> > >  	if (ret < 0) {
> > > -		v4l2_device_unregister_subdev(sd);
> > > +		if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE)
> > > +			dev_dbg(notifier_dev(notifier),
> > > +				"failed binding %pfw (%d)\n",
> > > +				asc->match.fwnode, ret);
> > > +		if (!asc->asd->registered)
> > 
> > This should probably be
> > 		if (asc->asd->registered)
> 
> Oops! Well, almost. The sub-device should only be unregistered here if it
> was just registered. But I'll fix it for v2.
> 
> > > +			v4l2_device_unregister_subdev(sd);
> > >  		return ret;
> > >  	}
> > >
> > > @@ -322,14 +330,26 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> > >  	 */
> > >  	ret = v4l2_async_create_ancillary_links(notifier, sd);
> > 
> > Also this part seems suspicious if called multiple times for the same
> > subdevice when matched on multiple connections
> > 
> > Do we need to refcount the connections for each async sub-dev,
> > decrement at each match, and only when all of them are matched
> > operated on the subdevice ?
> > :
> 
> The ancillary link can be created when the sub-device is registered so I
> don't think we'll need to refcount it. I'll address this in v2.
> 
> > >  	if (ret) {
> > > +		if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE)
> > > +			dev_dbg(notifier_dev(notifier),
> > > +				"failed creating links for %pfw (%d)\n",
> > > +				asc->match.fwnode, ret);
> > >  		v4l2_async_nf_call_unbind(notifier, sd, asc);
> > > -		v4l2_device_unregister_subdev(sd);
> > > +		list_del(&asc->asc_subdev_list);
> > > +		if (!asc->asd->registered)
> > > +			v4l2_device_unregister_subdev(sd);
> > >  		return ret;
> > >  	}
> > >
> > >  	list_del(&asc->waiting_list);
> > > -	sd->asd = asc;
> > > -	sd->notifier = notifier;
> > > +	if (!sd->asd) {
> > > +		WARN_ON(asc->asd->registered);
> > > +		sd->asd = asc->asd;
> > > +		sd->notifier = notifier;
> > > +		asc->asd->registered = true;
> > > +	} else {
> > > +		WARN_ON(sd->asd != asc->asd);
> > > +	}
> > >
> > >  	/* Move from the global subdevice list to notifier's done */
> > >  	list_move(&sd->async_list, &notifier->done_head);
> > > @@ -403,6 +423,21 @@ static void v4l2_async_cleanup(struct v4l2_subdev *sd)
> > >  	sd->asd = NULL;
> > >  }
> > >
> > > +static void v4l2_async_unbind_subdev_one(struct v4l2_async_notifier *notifier,
> > > +					 struct v4l2_subdev *sd, bool readd)
> > > +{
> > > +	struct v4l2_async_connection *asc, *tmp;
> > > +
> > > +	list_for_each_entry_safe(asc, tmp, &sd->asd->asc_head,
> > > +				 asc_subdev_list) {
> > > +		v4l2_async_nf_call_unbind(notifier, sd, asc);
> > > +		list_del(&asc->asc_subdev_list);
> > > +		if (readd)
> > > +			list_add_tail(&asc->waiting_list,
> > > +				      &notifier->waiting_head);
> > > +	}
> > > +}
> > > +
> > >  /* Unbind all sub-devices in the notifier tree. */
> > >  static void
> > >  v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
> > > @@ -417,10 +452,8 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
> > >  		if (subdev_notifier)
> > >  			v4l2_async_nf_unbind_all_subdevs(subdev_notifier, true);
> > >
> > > -		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> > > -		if (readd)
> > > -			list_add_tail(&sd->asd->waiting_list,
> > > -				      &notifier->waiting_head);
> > > +		v4l2_async_unbind_subdev_one(notifier, sd, readd);
> > > +
> > >  		v4l2_async_cleanup(sd);
> > >
> > >  		list_move(&sd->async_list, &subdev_head);
> > > @@ -445,8 +478,9 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> > >  		if (WARN_ON(!sd->asd))
> > >  			continue;
> > >
> > > -		if (asc_equal(&sd->asd->match, match))
> > > -			return true;
> > > +		list_for_each_entry(asc, &sd->asd->asc_head, asc_list)
> > > +			if (asc_equal(&asc->match, match))
> > > +				return true;
> > >  	}
> > >
> > >  	return false;
> > > @@ -619,6 +653,18 @@ void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> > >  }
> > >  EXPORT_SYMBOL(v4l2_async_nf_unregister);
> > >
> > > +static void release_async_subdev(struct kref *kref)
> > > +{
> > > +	struct v4l2_async_subdev *asd =
> > > +		container_of_const(kref, struct v4l2_async_subdev, kref);
> > > +
> > > +	list_del(&asd->asd_list);
> > > +
> > > +	WARN_ON(!list_empty(&asd->asc_head));
> > > +
> > > +	kfree(asd);
> > > +}
> > > +
> > >  static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> > >  {
> > >  	struct v4l2_async_connection *asc, *tmp;
> > > @@ -627,16 +673,24 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> > >  		return;
> > >
> > >  	list_for_each_entry_safe(asc, tmp, &notifier->asc_head, asc_list) {
> > > +		list_del(&asc->asc_list);
> > > +		v4l2_async_nf_call_destroy(notifier, asc);
> > > +
> > >  		switch (asc->match.type) {
> > >  		case V4L2_ASYNC_MATCH_FWNODE:
> > > +			pr_debug("release async connection for fwnode %pfw\n",
> > > +				 asc->match.fwnode);
> > 
> > Why pr_debug ? Can't you use notifier_dev() ?
> 
> The notifier is being cleaned up. We should have dev still around though,
> so I'll change this.
> 
> > >  			fwnode_handle_put(asc->match.fwnode);
> > >  			break;
> > > -		default:
> > > +		case V4L2_ASYNC_MATCH_I2C:
> > > +			pr_debug("release I²C async connection\n");
> > >  			break;
> > > +		default:
> > > +			pr_debug("release invalid async connection type %u\n",
> > > +				 asc->match.type);
> > >  		}
> > >
> > > -		list_del(&asc->asc_list);
> > > -		v4l2_async_nf_call_destroy(notifier, asc);
> > > +		kref_put(&asc->asd->kref, release_async_subdev);
> > >  		kfree(asc);
> > >  	}
> > >  }
> > > @@ -651,6 +705,71 @@ void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
> > >
> > > +static bool async_subdev_has_connection(struct v4l2_async_notifier *notifier,
> > > +					struct v4l2_async_subdev *asd,
> > > +					struct v4l2_async_connection *asc)
> > > +{
> > > +	struct v4l2_async_connection *__asc;
> > > +
> > > +	list_for_each_entry(__asc, &asd->asc_head, asc_subdev_list) {
> > > +		if (__asc->match.type != V4L2_ASYNC_MATCH_FWNODE)
> > > +			continue;
> > > +
> > > +		if (__asc->match.fwnode != asc->match.fwnode)
> > > +			continue;
> > > +
> > > +		dev_dbg(notifier_dev(notifier), "found!\n");
> > 
> > Such message without much context can quickly become noise
> 
> I think I'll just drop it.
> 
> > > +
> > > +		return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +
> > > +/* Find an async sub-device for the async connection. */
> > > +static int v4l2_async_find_async_subdev(struct v4l2_async_notifier *notifier,
> > > +					struct v4l2_async_connection *asc)
> > > +{
> > > +	struct v4l2_async_subdev *asd;
> > > +
> > > +	lockdep_assert_held(&list_lock);
> > > +
> > > +	if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE)
> > > +		dev_dbg(notifier_dev(notifier),
> > > +			"async: looking up subdev for %pfw\n",
> > > +			asc->match.fwnode);
> > > +
> > > +	/*
> > > +	 * Matching by endpoint nodes may mean there are multiple connections to
> > > +	 * a single device. This is only possible with fwnode matching.
> > > +	 */
> > > +	if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE &&
> > > +	    fwnode_graph_is_endpoint(asc->match.fwnode)) {

Maybe

	if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE) {
		dev_dbg(notifier_dev(notifier),
			"async: looking up subdev for %pfw\n",
			asc->match.fwnode);

		if (fwnode_graph_is_endpoint(asc->match.fwnode)) {
			list_for_each_entry(asd, &asd_head, asd_list) {
				if (async_subdev_has_connection(notifier, asd, asc)) {
					kref_get(&asd->kref);
					goto found;
				}
			}
		}
	}

> > > +		list_for_each_entry(asd, &asd_head, asd_list) {
> > > +			if (async_subdev_has_connection(notifier, asd, asc)) {
> > > +				kref_get(&asd->kref);
> > > +				goto found;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	dev_dbg(notifier_dev(notifier), "not found, allocating new one\n");
> > > +
> > > +	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
> > > +	if (!asd)
> > > +		return -ENOMEM;
> > > +
> > > +	kref_init(&asd->kref);
> > > +	INIT_LIST_HEAD(&asd->asc_head);
> > > +	list_add(&asd->asd_list, &asd_head);

There may be something I'm missing, but it seems that this function will
allocate a v4l2_async_subdev

> > > +
> > > +found:
> > > +	list_add(&asc->asc_subdev_list, &asd->asc_head);
> > > +	asc->asd = asd;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
> > >  				   struct v4l2_async_connection *asc)
> > >  {
> > > @@ -662,6 +781,10 @@ int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
> > >  	if (ret)
> > >  		goto unlock;
> > >
> > > +	ret = v4l2_async_find_async_subdev(notifier, asc);
> > > +	if (ret)
> > > +		goto unlock;
> > > +
> > >  	list_add_tail(&asc->asc_list, &notifier->asc_head);
> > >
> > >  unlock:
> > > @@ -809,7 +932,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
> > >  		v4l2_async_nf_unbind_all_subdevs(subdev_notifier, false);
> > >
> > >  	if (sd->asd)
> > > -		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> > > +		v4l2_async_unbind_subdev_one(notifier, sd, true);
> > >  	v4l2_async_cleanup(sd);
> > >
> > >  	mutex_unlock(&list_lock);
> > > @@ -832,10 +955,12 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> > >
> > >  	if (sd->asd) {
> > >  		struct v4l2_async_notifier *notifier = sd->notifier;
> > > +		struct v4l2_async_connection *asc;
> > >
> > > -		list_add(&sd->asd->waiting_list, &notifier->waiting_head);
> > > +		list_for_each_entry(asc, &sd->asd->asc_head, asc_subdev_list)
> > > +			list_add(&asc->waiting_list, &notifier->waiting_head);
> > >
> > > -		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> > > +		v4l2_async_unbind_subdev_one(notifier, sd, true);
> > >  	}
> > >
> > >  	v4l2_async_cleanup(sd);
> > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > > index 9cf383e81a16..750bf4ddb267 100644
> > > --- a/include/media/v4l2-async.h
> > > +++ b/include/media/v4l2-async.h
> > > @@ -8,6 +8,7 @@
> > >  #ifndef V4L2_ASYNC_H
> > >  #define V4L2_ASYNC_H
> > >
> > > +#include <linux/kref.h>
> > >  #include <linux/list.h>
> > >  #include <linux/mutex.h>
> > >
> > > @@ -63,24 +64,47 @@ struct v4l2_async_match {
> > >  };
> > >
> > >  /**
> > > - * struct v4l2_async_connection - sub-device descriptor, as known to a bridge
> > > + * struct v4l2_async_subdev - sub-device descriptor
> > >   *
> > > + * @kref:	kref for refcounting the subdev
> > > + * @asd_list:	Entry in the list of async sub-devices
> > > + * @subdev_list: used to link struct v4l2_async_subdev objects, waiting to be
> > > + *		probed, to a notifier->waiting_head list
> > > + * @asc_head:	head for struct v4l2_async_connection.asd_list list
> > > + * @registered:	whether the sub-device has been registered
> > > + */
> > > +struct v4l2_async_subdev {
> > > +	struct kref kref;
> > > +	struct list_head asd_list;
> > > +	struct list_head subdev_list;
> > 
> > subdev_list is not used
> 
> Thanks, I think I just forgot this here when splitting the two.
> 
> > > +	struct list_head asc_head;
> > > +	bool registered;
> > > +};
> > > +
> > > +/**
> > > + * struct v4l2_async_connection - sub-device connection descriptor, as known to
> > > + *				  a bridge
> > > + *
> > > + * @asd:	the async sub-device related to this connection
> > >   * @match:	struct of match type and per-bus type matching data sets
> > >   * @asc_list:	used to add struct v4l2_async_connection objects to the
> > >   *		master notifier @asc_list
> > >   * @waiting_list: used to link struct v4l2_async_connection objects, waiting to
> > >   *		be probed, to a notifier->waiting list
> > > + * @asc_subdev_list:	entry in struct v4l2_async_subdev.asc_head list
> > >   *
> > > - * When this struct is used as a member in a driver specific struct,
> > > - * the driver specific struct shall contain the &struct
> > > - * v4l2_async_connection as its first member.
> > > + * When this struct is used as a member in a driver specific struct, the driver
> > > + * specific struct shall contain the &struct v4l2_async_connection as its first
> > > + * member.
> > >   */
> > >  struct v4l2_async_connection {
> > > +	struct v4l2_async_subdev *asd;
> > >  	struct v4l2_async_match match;
> > >
> > >  	/* v4l2-async core private: not to be used by drivers */
> > >  	struct list_head asc_list;
> > >  	struct list_head waiting_list;
> > > +	struct list_head asc_subdev_list;
> > >  };
> > >
> > >  /**
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index a2cce11dda5c..d510fe6ea243 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -1063,7 +1063,7 @@ struct v4l2_subdev {
> > >  	struct device *dev;
> > >  	struct fwnode_handle *fwnode;
> > >  	struct list_head async_list;
> > > -	struct v4l2_async_connection *asd;
> > > +	struct v4l2_async_subdev *asd;
> > >  	struct v4l2_async_notifier *notifier;
> > >  	struct v4l2_async_notifier *subdev_notifier;
> > >  	struct v4l2_subdev_platform_data *pdata;

-- 
Regards,

Laurent Pinchart
