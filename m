Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADFA3BE653
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 12:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhGGK0s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 06:26:48 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57909 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbhGGK0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 06:26:48 -0400
X-Greylist: delayed 65746 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Jul 2021 06:26:47 EDT
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 44A7CC0003;
        Wed,  7 Jul 2021 10:24:05 +0000 (UTC)
Date:   Wed, 7 Jul 2021 12:24:54 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/11] rcar-vin: Extend group notifier DT parser to work
 with any port
Message-ID: <20210707102454.ysyl7y4rd4oyyrui@uno.localdomain>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-8-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413180253.2575451-8-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Apr 13, 2021 at 08:02:49PM +0200, Niklas Söderlund wrote:
> The R-Car VIN group notifier will be extend to support a new group of
> subdevices, the R-Car ISP channel selector in addition to the existing
> R-Car CSI-2 receiver subdevices.
>
> The existing DT parsing code can be reused if the port and max number of
> endpoints are provided as parameters instead of being hard-coded. While
> at it align the group notifier parser function names with the rest of
> the driver.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index d951f739b3a9a034..2628637084ae2aa9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -506,7 +506,8 @@ static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
>  	.complete = rvin_group_notify_complete,
>  };
>
> -static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
> +static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
> +			       unsigned int id)
>  {
>  	struct fwnode_handle *ep, *fwnode;
>  	struct v4l2_fwnode_endpoint vep = {
> @@ -515,7 +516,7 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
>  	struct v4l2_async_subdev *asd;
>  	int ret;
>
> -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), port, id, 0);
>  	if (!ep)
>  		return 0;
>
> @@ -563,7 +564,8 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
>  	mutex_unlock(&vin->group->lock);
>  }
>
> -static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
> +static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
> +				    unsigned int max_id)
>  {
>  	unsigned int count = 0, vin_mask = 0;
>  	unsigned int i, id;
> @@ -589,19 +591,18 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
>  	v4l2_async_notifier_init(&vin->group->notifier);
>
>  	/*
> -	 * Have all VIN's look for CSI-2 subdevices. Some subdevices will
> -	 * overlap but the parser function can handle it, so each subdevice
> -	 * will only be registered once with the group notifier.
> +	 * Some subdevices may overlap but the parser function can handle it and
> +	 * each subdevice will only be registered once with the group notifier.
>  	 */
>  	for (i = 0; i < RCAR_VIN_NUM; i++) {
>  		if (!(vin_mask & BIT(i)))
>  			continue;
>
> -		for (id = 0; id < RVIN_CSI_MAX; id++) {
> +		for (id = 0; id < max_id; id++) {
>  			if (vin->group->remotes[id].asd)
>  				continue;
>
> -			ret = rvin_mc_parse_of(vin->group->vin[i], id);
> +			ret = rvin_group_parse_of(vin->group->vin[i], port, id);
>  			if (ret)
>  				return ret;
>  		}
> @@ -981,7 +982,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>  	if (ret && ret != -ENODEV)
>  		goto err_group;
>
> -	ret = rvin_mc_parse_of_graph(vin);
> +	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);

You know, I would define RVIN_CSI2_ENDPOINT_NUM or similar.
Small nit apart, it's good to be able to reuse the same routines!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>  	if (ret)
>  		goto err_parallel;
>
> --
> 2.31.1
>
