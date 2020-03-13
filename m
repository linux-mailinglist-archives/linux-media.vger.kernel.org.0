Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A578184391
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 10:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgCMJSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 05:18:11 -0400
Received: from mga07.intel.com ([134.134.136.100]:49530 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgCMJSK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 05:18:10 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Mar 2020 02:18:09 -0700
X-IronPort-AV: E=Sophos;i="5.70,548,1574150400"; 
   d="scan'208";a="261831342"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Mar 2020 02:18:06 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9A8BF20854; Fri, 13 Mar 2020 11:18:04 +0200 (EET)
Date:   Fri, 13 Mar 2020 11:18:04 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/2] media: staging: rkisp1: replace the call to
 v4l2_async_notifier_parse_fwnode_endpoints_by_port
Message-ID: <20200313091804.GP5379@paasikivi.fi.intel.com>
References: <20200312154604.24996-1-dafna.hirschfeld@collabora.com>
 <20200312154604.24996-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312154604.24996-3-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch.

On Thu, Mar 12, 2020 at 04:46:04PM +0100, Dafna Hirschfeld wrote:
> don't call 'v4l2_async_notifier_parse_fwnode_endpoints_by_port'
> in order to register async subdevices. Instead call
> 'v4l2_fwnode_endpoint_parse' to parse the remote endpoints
> and then register each async subdev with
> 'v4l2_async_notifier_add_fwnode_remote_subdev'
> 
> Also remove the relevant item in the TODO file
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/TODO         |  3 -
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 94 +++++++++++++----------
>  2 files changed, 55 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index 0aa9877dd64a..1aa3bb9fd6cb 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -1,6 +1,3 @@
> -* Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
> -e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
> -cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
>  * Fix pad format size for statistics and parameters entities.
>  * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
>  * Fix checkpatch errors.
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index d2186856bb24..1035a39f3e49 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -233,35 +233,6 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
>  	return 0;
>  }
>  
> -static int rkisp1_fwnode_parse(struct device *dev,
> -			       struct v4l2_fwnode_endpoint *vep,
> -			       struct v4l2_async_subdev *asd)
> -{
> -	struct rkisp1_sensor_async *s_asd =
> -			container_of(asd, struct rkisp1_sensor_async, asd);
> -
> -	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
> -		dev_err(dev, "Only CSI2 bus type is currently supported\n");
> -		return -EINVAL;
> -	}
> -
> -	if (vep->base.port != 0) {
> -		dev_err(dev, "The ISP has only port 0\n");
> -		return -EINVAL;
> -	}
> -
> -	s_asd->mbus_type = vep->bus_type;
> -	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
> -
> -	/* Parallel bus is currently not supported */
> -	s_asd->parallel_bus_flags = 0;
> -
> -	if (s_asd->lanes < 1 || s_asd->lanes > 4)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
>  static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
>  	.bound = rkisp1_subdev_notifier_bound,
>  	.unbind = rkisp1_subdev_notifier_unbind,
> @@ -271,23 +242,68 @@ static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops =
>  static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
>  {
>  	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
> -	struct device *dev = rkisp1->dev;
> +	int next_id = 0;
>  	int ret;
>  
>  	v4l2_async_notifier_init(ntf);
>  
> -	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(dev, ntf,
> -					sizeof(struct rkisp1_sensor_async),
> -					0, rkisp1_fwnode_parse);
> -	if (ret)
> -		return ret;
> +	while (1) {

I might loop over each port here instead.

> +		struct v4l2_fwnode_endpoint vep = {
> +			.bus_type = V4L2_MBUS_CSI2_DPHY
> +		};
> +		struct rkisp1_sensor_async *rk_asd = NULL;
> +		struct fwnode_handle *ep;
>  
> -	if (list_empty(&ntf->asd_list))
> -		return -ENODEV;
> +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> +			0, next_id, FWNODE_GRAPH_ENDPOINT_NEXT);

The port number is always zero, whereas the endpoint id changes on each
iteration. Is that intended?

>  
> -	ntf->ops = &rkisp1_subdev_notifier_ops;
> +		if (!ep)
> +			break;
> +
> +		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +		if (ret)
> +			goto err_parse;
> +
> +		rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
> +		if (!rk_asd) {
> +			ret = -ENOMEM;
> +			goto err_parse;
> +		}
> +
> +		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
> +		rk_asd->mbus_type = vep.bus_type;
> +
> +		/* Parallel bus is currently not supported */
> +		rk_asd->parallel_bus_flags = 0;
> +		ret = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> +								   &rk_asd->asd);
> +		if (ret)
> +			goto err_parse;
> +
> +		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
> +			vep.base.id, rk_asd->lanes);
> +
> +		next_id = vep.base.id + 1;
> +
> +		fwnode_handle_put(ep);
>  
> -	return v4l2_async_notifier_register(&rkisp1->v4l2_dev, ntf);
> +		continue;
> +err_parse:
> +		fwnode_handle_put(ep);
> +		kfree(rk_asd);
> +		v4l2_async_notifier_cleanup(ntf);
> +		return ret;
> +	}
> +
> +	if (next_id == 0)
> +		dev_warn(rkisp1->dev, "no remote subdevice found\n");

I guess the driver will be loaded if the module is around and the device
exists. If the board has no cameras, is that something on which a warning
should be produced? I'd perhaps use dev_dbg(), if I'd print this at all.

> +	ntf->ops = &rkisp1_subdev_notifier_ops;
> +	ret = v4l2_async_notifier_register(&rkisp1->v4l2_dev, ntf);
> +	if (ret) {
> +		v4l2_async_notifier_cleanup(ntf);
> +		return ret;
> +	}
> +	return 0;
>  }
>  
>  /* ----------------------------------------------------------------------------

-- 
Kind regards,

Sakari Ailus
