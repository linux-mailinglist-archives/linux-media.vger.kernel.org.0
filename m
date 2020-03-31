Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBD519A204
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 00:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731424AbgCaWlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 18:41:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50876 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729153AbgCaWlA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 18:41:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1DE612971E6
Subject: Re: [PATCH v3 2/2] media: staging: rkisp1: replace the call to
 v4l2_async_notifier_parse_fwnode_endpoints_by_port
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org
References: <20200317180701.6035-1-dafna.hirschfeld@collabora.com>
 <20200317180701.6035-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <5aaa761d-f528-face-2a15-24c6e4f7e305@collabora.com>
Date:   Tue, 31 Mar 2020 19:40:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200317180701.6035-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/17/20 3:07 PM, Dafna Hirschfeld wrote:
> don't call 'v4l2_async_notifier_parse_fwnode_endpoints_by_port'
> in order to register async subdevices. Instead call
> 'v4l2_fwnode_endpoint_parse' to parse the remote endpoints
> and then register each async subdev with
> 'v4l2_async_notifier_add_fwnode_remote_subdev'
> 
> Also remove the relevant item in the TODO file
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> changes since v1:
> in the function rkisp1_subdev_notifier:
> 1. move the test 'if (next_id == 0)' outside of the while loop
> 2. remove the 'end' label.
> The changes are due to Helen Koike's comments
> 
> changes since v2:
> in the function rkisp1_subdev_notifier:
> 1. remove a newline between a call to fwnode_graph_get_endpoint_by_id to the test of its ret value
> 2. define 'next_id' as 'unsigned int' instead of 'int'
> 3. rename 'parallel_bus_flags' to 'mbus_flags' and set it to vep.bus.mipi_csi2.flags instead of 0
> (this follows previous patch of the series)
> 4. when no remote sensor is found, log it with dev_dbg instead of dev_warn
> 
>  drivers/staging/media/rkisp1/TODO         |  3 -
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 90 +++++++++++++----------
>  2 files changed, 53 insertions(+), 40 deletions(-)
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
> index fcd2a3a4cc78..2eedabab4044 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -233,33 +233,6 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
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
> -	s_asd->mbus_flags = vep->bus.mipi_csi2.flags;
> -	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
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
> @@ -269,23 +242,66 @@ static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops =
>  static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
>  {
>  	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
> -	struct device *dev = rkisp1->dev;
> +	unsigned int next_id = 0;
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
> +		if (!ep)
> +			break;
>  
> -	ntf->ops = &rkisp1_subdev_notifier_ops;
> +		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +		if (ret)
> +			goto err_parse;
>  
> -	return v4l2_async_notifier_register(&rkisp1->v4l2_dev, ntf);
> +		rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
> +		if (!rk_asd) {
> +			ret = -ENOMEM;
> +			goto err_parse;
> +		}
> +
> +		rk_asd->mbus_type = vep.bus_type;
> +		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
> +		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
> +
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
> +
> +		continue;
> +err_parse:
> +		fwnode_handle_put(ep);
> +		kfree(rk_asd);
> +		v4l2_async_notifier_cleanup(ntf);
> +		return ret;
> +	}
> +
> +	if (next_id == 0)
> +		dev_dbg(rkisp1->dev, "no remote subdevice found\n");
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
> 
