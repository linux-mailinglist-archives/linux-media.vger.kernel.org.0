Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279965994A
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 13:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfF1LgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 07:36:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:35217 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfF1LgC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 07:36:02 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jun 2019 04:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; 
   d="scan'208";a="170723679"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2019 04:35:58 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CF1602071F; Fri, 28 Jun 2019 14:35:57 +0300 (EEST)
Date:   Fri, 28 Jun 2019 14:35:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Subject: Re: [PATCH v2 3/9] v4l2-async: Get fwnode reference when putting it
 to the notifier's list
Message-ID: <20190628113557.cie4x6njqlj2lorb@paasikivi.fi.intel.com>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
 <20190606130225.10751-4-sakari.ailus@linux.intel.com>
 <20190614160141.mlw5imwejevunhou@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614160141.mlw5imwejevunhou@uno.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the review!

On Fri, Jun 14, 2019 at 06:01:41PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Thu, Jun 06, 2019 at 04:02:19PM +0300, Sakari Ailus wrote:
> > The v4l2_async_notifier_add_fwnode_subdev() did not take a reference of
> > the added fwnode, relying on the caller to handle that instead, in essence
> > putting the fwnode to be added if there was an error.
> >
> > As the reference is eventually released during the notifier cleanup, this
> > is not intuitive nor logical. Improve this by always getting a reference
> > when the function succeeds, and the caller releasing the reference when it
> > does not *itself* need it anymore.
> >
> > Luckily, perhaps, there were just a handful of callers using the function.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c   |  5 ++---
> >  drivers/media/platform/davinci/vpif_capture.c | 16 ++++++++--------
> >  drivers/media/platform/qcom/camss/camss.c     |  2 +-
> >  drivers/media/platform/xilinx/xilinx-vipp.c   |  2 +-
> >  drivers/media/v4l2-core/v4l2-async.c          |  3 ++-
> >  drivers/media/v4l2-core/v4l2-fwnode.c         | 23 ++++++-----------------
> >  include/media/v4l2-async.h                    |  5 +++--
> >  7 files changed, 23 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > index db263c0ce48e..ccdbd9227955 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -2505,10 +2505,9 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
> >  		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
> >  			&vpfe->notifier, of_fwnode_handle(rem),
> >  			sizeof(struct v4l2_async_subdev));
> > -		if (IS_ERR(pdata->asd[i])) {
> > -			of_node_put(rem);
> > +		of_node_put(rem);
> > +		if (IS_ERR(pdata->asd[i]))
> >  			goto cleanup;
> > -		}
> >  	}
> >
> >  	of_node_put(endpoint);
> > diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> > index 8fdea45ae090..2a0c3f3fb443 100644
> > --- a/drivers/media/platform/davinci/vpif_capture.c
> > +++ b/drivers/media/platform/davinci/vpif_capture.c
> > @@ -1512,6 +1512,7 @@ static struct vpif_capture_config *
> >  vpif_capture_get_pdata(struct platform_device *pdev)
> >  {
> >  	struct device_node *endpoint = NULL;
> > +	struct device_node *rem = NULL, *rem_ep = NULL;
> >  	struct vpif_capture_config *pdata;
> >  	struct vpif_subdev_info *sdinfo;
> >  	struct vpif_capture_chan_config *chan;
> > @@ -1542,7 +1543,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> >
> >  	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
> >  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> > -		struct device_node *rem, *rem_ep;
> >  		unsigned int flags;
> >  		int err;
> >
> > @@ -1565,7 +1565,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> >  			of_node_put(rem_ep);
> >  			goto done;
> >  		}
> > -		of_node_put(rem_ep);
> >
> >  		sdinfo = &pdata->subdev_info[i];
> >  		chan = &pdata->chan_config[i];
> > @@ -1573,10 +1572,8 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> >  					    VPIF_CAPTURE_NUM_CHANNELS,
> >  					    sizeof(*chan->inputs),
> >  					    GFP_KERNEL);
> > -		if (!chan->inputs) {
> > -			of_node_put(rem);
> > +		if (!chan->inputs)
> >  			goto err_cleanup;
> > -		}
> >
> >  		chan->input_count++;
> >  		chan->inputs[i].input.type = V4L2_INPUT_TYPE_CAMERA;
> > @@ -1588,6 +1585,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> >  		if (err) {
> >  			dev_err(&pdev->dev, "Could not parse the endpoint\n");
> >  			of_node_put(rem);
> > +			of_node_put(rem_ep);
> >  			goto done;
> >  		}
> >
> > @@ -1608,11 +1606,11 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> >  		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
> >  			&vpif_obj.notifier, of_fwnode_handle(rem_ep),
> >  			sizeof(struct v4l2_async_subdev));
> > -		if (IS_ERR(pdata->asd[i])) {
> > -			of_node_put(rem);
> > +		if (IS_ERR(pdata->asd[i]))
> >  			goto err_cleanup;
> > -		}
> >
> > +		of_node_put(rem);
> > +		of_node_put(rem_ep);
> >  	}
> >
> >  done:
> > @@ -1624,6 +1622,8 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> >  	return pdata;
> >
> >  err_cleanup:
> > +	of_node_put(rem);
> > +	of_node_put(rem_ep);
> >  	of_node_put(endpoint);
> >  	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > index a979f210f441..4ab4a47d34f3 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -486,9 +486,9 @@ static int camss_of_parse_ports(struct camss *camss)
> >
> >  		asd = v4l2_async_notifier_add_fwnode_subdev(
> >  			&camss->notifier, remote, sizeof(*csd));
> > +		fwnode_handle_put(remote);
> >  		if (IS_ERR(asd)) {
> >  			ret = PTR_ERR(asd);
> > -			fwnode_handle_put(remote);
> >  			goto err_cleanup;
> >  		}
> >
> > diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> > index 41df417153bd..d788f4870a23 100644
> > --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> > +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> > @@ -392,9 +392,9 @@ static int xvip_graph_parse_one(struct xvip_composite_device *xdev,
> >  		asd = v4l2_async_notifier_add_fwnode_subdev(
> >  			&xdev->notifier, remote,
> >  			sizeof(struct xvip_graph_entity));
> > +		fwnode_handle_put(remote);
> >  		if (IS_ERR(asd)) {
> >  			ret = PTR_ERR(asd);
> > -			fwnode_handle_put(remote);
> >  			goto err_notifier_cleanup;
> >  		}
> >  	}
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 304969ff3191..dc4e83b4f6ba 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -596,10 +596,11 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >  		return ERR_PTR(-ENOMEM);
> >
> >  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> > -	asd->match.fwnode = fwnode;
> > +	asd->match.fwnode = fwnode_handle_get(fwnode);
> >
> >  	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> >  	if (ret) {
> > +		fwnode_handle_put(fwnode);
> >  		kfree(asd);
> >  		return ERR_PTR(ret);
> >  	}
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 810b6584b522..b48725824580 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -780,23 +780,17 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
> >  		asd = v4l2_async_notifier_add_fwnode_subdev(notifier,
> >  							    args.fwnode,
> >  							    sizeof(*asd));
> > +		fwnode_handle_put(args.fwnode);
> >  		if (IS_ERR(asd)) {
> > -			ret = PTR_ERR(asd);
> >  			/* not an error if asd already exists */
> > -			if (ret == -EEXIST) {
> > -				fwnode_handle_put(args.fwnode);
> > +			if (PTR_ERR(asd) == -EEXIST)
> >  				continue;
> > -			}
> >
> > -			goto error;
> > +			return PTR_ERR(asd);
> >  		}
> >  	}
> >
> >  	return 0;
> > -
> > -error:
> > -	fwnode_handle_put(args.fwnode);
> > -	return ret;
> >  }
> >
> >  /*
> > @@ -1085,22 +1079,17 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
> >
> >  		asd = v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
> >  							    sizeof(*asd));
> > +		fwnode_handle_put(fwnode);
> >  		if (IS_ERR(asd)) {
> >  			/* not an error if asd already exists */
> > -			if (PTR_ERR(asd) == -EEXIST) {
> > -				fwnode_handle_put(fwnode);
> > +			if (PTR_ERR(asd) == -EEXIST)
> >  				continue;
> > -			}
> >
> > -			goto error;
> > +			return PTR_ERR(asd);
> >  		}
> >  	}
> >
> >  	return PTR_ERR(fwnode) == -ENOENT ? 0 : PTR_ERR(fwnode);
> > -
> > -error:
> > -	fwnode_handle_put(fwnode);
> > -	return PTR_ERR(fwnode);
> >  }
> >
> >  int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 1497bda66c3b..b9141ffa188a 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -175,8 +175,9 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> >   *		     the driver's async sub-device struct, i.e. both
> >   *		     begin at the same memory address.
> >   *
> > - * Allocate a fwnode-matched asd of size asd_struct_size, and add it
> > - * to the notifiers @asd_list.
> > + * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
> > + * notifiers @asd_list. The function also gets a reference of the fwnode which
> > + * is released later at notifier cleanup time.
> 
> I would add that, as a consequence, the caller need to put their local
> references as soon as they don't need them anymore (possibly just
> after calling this function).

I'd say that's redundant, as it's in line how refcounting generally works:
when you no longer need a reference, you put it.

> 
> That apart
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks. :-)

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
