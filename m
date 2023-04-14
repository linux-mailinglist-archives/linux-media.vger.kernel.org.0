Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11496E1D19
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 09:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjDNH0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 03:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDNH03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 03:26:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB9526BA
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 00:26:26 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9B7FD20;
        Fri, 14 Apr 2023 09:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681457181;
        bh=MyAuan///iq2PC5SgY1bGdUDfgtnX1doFo14pTmXIkQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NqJjmNYeH1/UmyEKjEh+J6qbM7hsqVSIU/LZL2I79NA4HxWZxnFanXJEbMe62aXIX
         UQLsoSMU+Cpr24MbF7z1MdfI8wniEaEG4mST8dpe5kc5R9AHj/aOIY5SJiqK65xicI
         TSipTbMdzntzSlVJmlxslAbHsIkdn/hIgAhuVuWU=
Date:   Fri, 14 Apr 2023 09:26:21 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 07/18] media: v4l: async: Clean up list heads and entries
Message-ID: <muutiamv7h32mwd2yq3mlkegrohlm2qj4yq2566nx4rsnhxvai@jubl5vdbbpuh>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-8-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-8-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Thu, Mar 30, 2023 at 02:58:42PM +0300, Sakari Ailus wrote:
> The naming of list heads and list entries is confusing as they're named
> similarly. Use _head for list head and _list for list entries.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
>  .../platform/renesas/rcar-vin/rcar-core.c     |  2 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c   | 10 +--
>  drivers/media/v4l2-core/v4l2-async.c          | 66 +++++++++----------
>  .../staging/media/imx/imx-media-dev-common.c  |  2 +-
>  drivers/staging/media/tegra-video/vi.c        |  6 +-
>  include/media/v4l2-async.h                    | 21 +++---
>  8 files changed, 56 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 3b76a9d0383a..8b37c2ec8643 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1419,7 +1419,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
>  	unsigned int pad;
>  	int ret;
>
> -	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
> +	list_for_each_entry(asd, &cio2->notifier.asd_head, asd_list) {
>  		s_asd = to_sensor_asd(asd);
>  		q = &cio2->queue[s_asd->csi2.port];
>
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 5e53d6b7036c..1b530da1c341 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -397,7 +397,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  		}
>  	}
>
> -	if (list_empty(&vin->group->notifier.asd_list))
> +	if (list_empty(&vin->group->notifier.asd_head))
>  		return 0;
>
>  	vin->group->notifier.ops = &rvin_group_notify_ops;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 5939f5165a5e..bfef297f5ec5 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -191,7 +191,7 @@ static int rzg2l_cru_mc_parse_of_graph(struct rzg2l_cru_dev *cru)
>
>  	cru->notifier.ops = &rzg2l_cru_async_ops;
>
> -	if (list_empty(&cru->notifier.asd_list))
> +	if (list_empty(&cru->notifier.asd_head))
>  		return 0;
>
>  	ret = v4l2_async_nf_register(&cru->v4l2_dev, &cru->notifier);
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 0a16c218a50a..80157b7a28ee 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -56,7 +56,7 @@ xvip_graph_find_entity(struct xvip_composite_device *xdev,
>  	struct xvip_graph_entity *entity;
>  	struct v4l2_async_subdev *asd;
>
> -	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
> +	list_for_each_entry(asd, &xdev->notifier.asd_head, asd_list) {
>  		entity = to_xvip_entity(asd);
>  		if (entity->asd.match.fwnode == fwnode)
>  			return entity;
> @@ -291,7 +291,7 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  	dev_dbg(xdev->dev, "notify complete, all subdevs registered\n");
>
>  	/* Create links for every entity. */
> -	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
> +	list_for_each_entry(asd, &xdev->notifier.asd_head, asd_list) {
>  		entity = to_xvip_entity(asd);
>  		ret = xvip_graph_build_one(xdev, entity);
>  		if (ret < 0)
> @@ -322,7 +322,7 @@ static int xvip_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  	/* Locate the entity corresponding to the bound subdev and store the
>  	 * subdev pointer.
>  	 */
> -	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
> +	list_for_each_entry(asd, &xdev->notifier.asd_head, asd_list) {
>  		entity = to_xvip_entity(asd);
>
>  		if (entity->asd.match.fwnode != subdev->fwnode)
> @@ -415,7 +415,7 @@ static int xvip_graph_parse(struct xvip_composite_device *xdev)
>  	if (ret < 0)
>  		return 0;
>
> -	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
> +	list_for_each_entry(asd, &xdev->notifier.asd_head, asd_list) {
>  		entity = to_xvip_entity(asd);
>  		ret = xvip_graph_parse_one(xdev, entity->asd.match.fwnode);
>  		if (ret < 0) {
> @@ -523,7 +523,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
>  		goto done;
>  	}
>
> -	if (list_empty(&xdev->notifier.asd_list)) {
> +	if (list_empty(&xdev->notifier.asd_head)) {
>  		dev_err(xdev->dev, "no subdev found in graph\n");
>  		ret = -ENOENT;
>  		goto done;
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 224ebf50f2d0..fdc995dfc15c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -133,8 +133,8 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, match);
>  }
>
> -static LIST_HEAD(subdev_list);
> -static LIST_HEAD(notifier_list);
> +static LIST_HEAD(subdev_head);
> +static LIST_HEAD(notifier_head);
>  static DEFINE_MUTEX(list_lock);
>
>  static struct v4l2_async_subdev *
> @@ -145,7 +145,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_subdev *sd, struct v4l2_async_match *match);
>  	struct v4l2_async_subdev *asd;
>
> -	list_for_each_entry(asd, &notifier->waiting, list) {
> +	list_for_each_entry(asd, &notifier->waiting_head, waiting_list) {
>  		/* bus_type has been verified valid before */
>  		switch (asd->match.type) {
>  		case V4L2_ASYNC_MATCH_I2C:
> @@ -194,7 +194,7 @@ v4l2_async_find_subdev_notifier(struct v4l2_subdev *sd)
>  {
>  	struct v4l2_async_notifier *n;
>
> -	list_for_each_entry(n, &notifier_list, list)
> +	list_for_each_entry(n, &notifier_head, notifier_list)
>  		if (n->sd == sd)
>  			return n;
>
> @@ -219,12 +219,12 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct v4l2_subdev *sd;
>
> -	if (!list_empty(&notifier->waiting)) {
> +	if (!list_empty(&notifier->waiting_head)) {
>  		dev_dbg(notifier_dev(notifier), "async: waiting for subdevs\n");
>  		return false;
>  	}
>
> -	list_for_each_entry(sd, &notifier->done, async_list) {
> +	list_for_each_entry(sd, &notifier->done_head, async_list) {
>  		struct v4l2_async_notifier *subdev_notifier =
>  			v4l2_async_find_subdev_notifier(sd);
>
> @@ -249,7 +249,7 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>  	struct v4l2_async_notifier *__notifier = notifier;
>
>  	/* Quick check whether there are still more sub-devices here. */
> -	if (!list_empty(&notifier->waiting))
> +	if (!list_empty(&notifier->waiting_head))
>  		return 0;
>
>  	if (notifier->sd)
> @@ -327,13 +327,12 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>
> -	/* Remove from the waiting list */
> -	list_del(&asd->list);
> +	list_del(&asd->waiting_list);
>  	sd->asd = asd;
>  	sd->notifier = notifier;
>
>  	/* Move from the global subdevice list to notifier's done */
> -	list_move(&sd->async_list, &notifier->done);
> +	list_move(&sd->async_list, &notifier->done_head);
>
>  	/*
>  	 * See if the sub-device has a notifier. If not, return here.
> @@ -369,7 +368,7 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
>  		return 0;
>
>  again:
> -	list_for_each_entry(sd, &subdev_list, async_list) {
> +	list_for_each_entry(sd, &subdev_head, async_list) {
>  		struct v4l2_async_subdev *asd;
>  		int ret;
>
> @@ -411,7 +410,7 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
>  {
>  	struct v4l2_subdev *sd, *tmp;
>
> -	list_for_each_entry_safe(sd, tmp, &notifier->done, async_list) {
> +	list_for_each_entry_safe(sd, tmp, &notifier->done_head, async_list) {
>  		struct v4l2_async_notifier *subdev_notifier =
>  			v4l2_async_find_subdev_notifier(sd);
>
> @@ -420,10 +419,11 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
>
>  		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
>  		if (readd)
> -			list_add_tail(&sd->asd->list, &notifier->waiting);
> +			list_add_tail(&sd->asd->waiting_list,
> +				      &notifier->waiting_head);
>  		v4l2_async_cleanup(sd);
>
> -		list_move(&sd->async_list, &subdev_list);
> +		list_move(&sd->async_list, &subdev_head);
>  	}
>
>  	notifier->parent = NULL;
> @@ -437,11 +437,11 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>  	struct v4l2_async_subdev *asd;
>  	struct v4l2_subdev *sd;
>
> -	list_for_each_entry(asd, &notifier->waiting, list)
> +	list_for_each_entry(asd, &notifier->waiting_head, waiting_list)
>  		if (asd_equal(&asd->match, match))
>  			return true;
>
> -	list_for_each_entry(sd, &notifier->done, async_list) {
> +	list_for_each_entry(sd, &notifier->done_head, async_list) {
>  		if (WARN_ON(!sd->asd))
>  			continue;
>
> @@ -465,7 +465,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>  	lockdep_assert_held(&list_lock);
>
>  	/* Check that an asd is not being added more than once. */
> -	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> +	list_for_each_entry(asd, &notifier->asd_head, asd_list) {
>  		if (&asd->match == match)
>  			break;
>  		if (asd_equal(&asd->match, match))
> @@ -473,7 +473,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>  	}
>
>  	/* Check that an asd does not exist in other notifiers. */
> -	list_for_each_entry(notifier, &notifier_list, list)
> +	list_for_each_entry(notifier, &notifier_head, notifier_list)
>  		if (__v4l2_async_nf_has_async_subdev(notifier, match))
>  			return true;
>
> @@ -510,7 +510,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>
>  void v4l2_async_nf_init(struct v4l2_async_notifier *notifier)
>  {
> -	INIT_LIST_HEAD(&notifier->asd_list);
> +	INIT_LIST_HEAD(&notifier->asd_head);
>  }
>  EXPORT_SYMBOL(v4l2_async_nf_init);
>
> @@ -519,17 +519,17 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	struct v4l2_async_subdev *asd;
>  	int ret;
>
> -	INIT_LIST_HEAD(&notifier->waiting);
> -	INIT_LIST_HEAD(&notifier->done);
> +	INIT_LIST_HEAD(&notifier->waiting_head);
> +	INIT_LIST_HEAD(&notifier->done_head);
>
>  	mutex_lock(&list_lock);
>
> -	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> +	list_for_each_entry(asd, &notifier->asd_head, asd_list) {
>  		ret = v4l2_async_nf_asd_valid(notifier, &asd->match, true);
>  		if (ret)
>  			goto err_unlock;
>
> -		list_add_tail(&asd->list, &notifier->waiting);
> +		list_add_tail(&asd->waiting_list, &notifier->waiting_head);
>  	}
>
>  	ret = v4l2_async_nf_try_all_subdevs(notifier);
> @@ -541,7 +541,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  		goto err_unbind;
>
>  	/* Keep also completed notifiers on the list */
> -	list_add(&notifier->list, &notifier_list);
> +	list_add(&notifier->notifier_list, &notifier_head);
>
>  	mutex_unlock(&list_lock);
>
> @@ -606,7 +606,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
>  	notifier->sd = NULL;
>  	notifier->v4l2_dev = NULL;
>
> -	list_del(&notifier->list);
> +	list_del(&notifier->notifier_list);
>  }
>
>  void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> @@ -623,10 +623,10 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
>  {
>  	struct v4l2_async_subdev *asd, *tmp;
>
> -	if (!notifier || !notifier->asd_list.next)
> +	if (!notifier || !notifier->asd_head.next)
>  		return;
>
> -	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
> +	list_for_each_entry_safe(asd, tmp, &notifier->asd_head, asd_list) {
>  		switch (asd->match.type) {
>  		case V4L2_ASYNC_MATCH_FWNODE:
>  			fwnode_handle_put(asd->match.fwnode);
> @@ -662,7 +662,7 @@ int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
>  	if (ret)
>  		goto unlock;
>
> -	list_add_tail(&asd->asd_list, &notifier->asd_list);
> +	list_add_tail(&asd->asd_list, &notifier->asd_head);
>
>  unlock:
>  	mutex_unlock(&list_lock);
> @@ -768,7 +768,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>
>  	INIT_LIST_HEAD(&sd->async_list);
>
> -	list_for_each_entry(notifier, &notifier_list, list) {
> +	list_for_each_entry(notifier, &notifier_head, notifier_list) {
>  		struct v4l2_device *v4l2_dev =
>  			v4l2_async_nf_find_v4l2_dev(notifier);
>  		struct v4l2_async_subdev *asd;
> @@ -792,7 +792,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  	}
>
>  	/* None matched, wait for hot-plugging */
> -	list_add(&sd->async_list, &subdev_list);
> +	list_add(&sd->async_list, &subdev_head);
>
>  out_unlock:
>  	mutex_unlock(&list_lock);
> @@ -833,7 +833,7 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	if (sd->asd) {
>  		struct v4l2_async_notifier *notifier = sd->notifier;
>
> -		list_add(&sd->asd->list, &notifier->waiting);
> +		list_add(&sd->asd->waiting_list, &notifier->waiting_head);
>
>  		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
>  	}
> @@ -887,9 +887,9 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
>
>  	mutex_lock(&list_lock);
>
> -	list_for_each_entry(notif, &notifier_list, list) {
> +	list_for_each_entry(notif, &notifier_head, notifier_list) {
>  		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
> -		list_for_each_entry(asd, &notif->waiting, list)
> +		list_for_each_entry(asd, &notif->waiting_head, waiting_list)
>  			print_waiting_subdev(s, &asd->match);
>  	}
>
> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
> index e6d6ed3b1161..eaa54848df6a 100644
> --- a/drivers/staging/media/imx/imx-media-dev-common.c
> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
> @@ -398,7 +398,7 @@ int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
>  	int ret;
>
>  	/* no subdevs? just bail */
> -	if (list_empty(&imxmd->notifier.asd_list)) {
> +	if (list_empty(&imxmd->notifier.asd_head)) {
>  		v4l2_err(&imxmd->v4l2_dev, "no subdevs\n");
>  		return -ENODEV;
>  	}
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 11dd142c98c5..4818646fe637 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1563,7 +1563,7 @@ tegra_vi_graph_find_entity(struct tegra_vi_channel *chan,
>  	struct tegra_vi_graph_entity *entity;
>  	struct v4l2_async_subdev *asd;
>
> -	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
> +	list_for_each_entry(asd, &chan->notifier.asd_head, asd_list) {
>  		entity = to_tegra_vi_graph_entity(asd);
>  		if (entity->asd.match.fwnode == fwnode)
>  			return entity;
> @@ -1707,7 +1707,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  	}
>
>  	/* create links between the entities */
> -	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
> +	list_for_each_entry(asd, &chan->notifier.asd_head, asd_list) {
>  		entity = to_tegra_vi_graph_entity(asd);
>  		ret = tegra_vi_graph_build(chan, entity);
>  		if (ret < 0)
> @@ -1874,7 +1874,7 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
>
>  		ret = tegra_vi_graph_parse_one(chan, remote);
>  		fwnode_handle_put(remote);
> -		if (ret < 0 || list_empty(&chan->notifier.asd_list))
> +		if (ret < 0 || list_empty(&chan->notifier.asd_head))
>  			continue;
>
>  		chan->notifier.ops = &tegra_vi_async_ops;
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 0c4cffd081c9..425280b4d387 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -68,7 +68,7 @@ struct v4l2_async_match {
>   * @match:	struct of match type and per-bus type matching data sets
>   * @asd_list:	used to add struct v4l2_async_subdev objects to the
>   *		master notifier @asd_list
> - * @list:	used to link struct v4l2_async_subdev objects, waiting to be
> + * @waiting_list: used to link struct v4l2_async_subdev objects, waiting to be
>   *		probed, to a notifier->waiting list

notifier->waiting_head

>   *
>   * When this struct is used as a member in a driver specific struct,
> @@ -77,9 +77,10 @@ struct v4l2_async_match {
>   */
>  struct v4l2_async_subdev {
>  	struct v4l2_async_match match;
> +
>  	/* v4l2-async core private: not to be used by drivers */
> -	struct list_head list;
>  	struct list_head asd_list;
> +	struct list_head waiting_list;
>  };
>
>  /**
> @@ -108,20 +109,20 @@ struct v4l2_async_notifier_operations {
>   * @v4l2_dev:	v4l2_device of the root notifier, NULL otherwise
>   * @sd:		sub-device that registered the notifier, NULL otherwise
>   * @parent:	parent notifier
> - * @asd_list:	master list of struct v4l2_async_subdev
> - * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
> - * @done:	list of struct v4l2_subdev, already probed
> - * @list:	member in a global list of notifiers
> + * @asd_head:	master list of struct v4l2_async_subdev
> + * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers

waiting_head

> + * @done_head:	list of struct v4l2_subdev, already probed
> + * @notifier_list: member in a global list of notifiers
>   */
>  struct v4l2_async_notifier {
>  	const struct v4l2_async_notifier_operations *ops;
>  	struct v4l2_device *v4l2_dev;
>  	struct v4l2_subdev *sd;
>  	struct v4l2_async_notifier *parent;
> -	struct list_head asd_list;
> -	struct list_head waiting;
> -	struct list_head done;
> -	struct list_head list;
> +	struct list_head asd_head;
> +	struct list_head waiting_head;
> +	struct list_head done_head;
> +	struct list_head notifier_list;
>  };
>
>  /**
> --
> 2.30.2
>
