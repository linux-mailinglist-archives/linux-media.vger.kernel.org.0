Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D85271555E
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 08:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjE3GL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 02:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjE3GL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 02:11:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FF9CD
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 23:11:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 591DDE4;
        Tue, 30 May 2023 08:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685427092;
        bh=fWNkQaYhFz5IEYCVaok+YJN6rl/31qleSPzDW0jrKoE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSapDc1rnT8NkX9Dh4bagPGTvp/Bk1wWkxjp8psr+6EA5vBwuxMUfCRkk8KwBroEe
         zG93jiquGajdOXxs8s/CCXJYBBdU18zdBQIXzbhRqeBVbdmMyJ6Pt/HrzvH9Rd+M6B
         /lOuIQIwnLhZ2Sb/sjAule2Ef5JlleuFKhivcjeI=
Date:   Tue, 30 May 2023 09:11:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 17/32] media: v4l: async: Rework internal lists
Message-ID: <20230530061153.GA6404@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-18-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-18-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:16:00PM +0300, Sakari Ailus wrote:
> This patch re-arranges internal V4L2 async lists for preparation of
> supporting multiple connections per sub-device as well as cleaning up used
> lists.
> 
> The list of unbound V4L2 sub-devices is maintained for the purpose of
> listing those sub-devices only, not for their binding status. Also, the
> V4L2 async connections have a single list entry in the notifier's list, be
> that either waiting or done lists, while the notifier's asc_list is
> removed.

Please use the imperative style in commit messages. To me it's unclear
if "is" here refers to the status before or after this patch. I need a
clear description of what you're doing in order to check if the code
matches the intent. Guessing the intent from the code makes review more
difficult and less useful.

> The one-to-one relation between a sub-device and a connection is still
> maintained in this patch.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   2 +-
>  .../platform/renesas/rcar-vin/rcar-core.c     |   2 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |   2 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c   |   8 +-
>  drivers/media/v4l2-core/v4l2-async.c          | 102 +++++++++---------
>  .../staging/media/imx/imx-media-dev-common.c  |   2 +-
>  drivers/staging/media/tegra-video/vi.c        |   6 +-
>  include/media/v4l2-async.h                    |   9 +-
>  8 files changed, 68 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 1893d1ff4f169..0f43b5e10f187 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1420,7 +1420,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
>  	unsigned int pad;
>  	int ret;
>  
> -	list_for_each_entry(asd, &cio2->notifier.asc_list, asc_entry) {
> +	list_for_each_entry(asd, &cio2->notifier.done_list, asc_entry) {
>  		s_asd = to_sensor_asd(asd);
>  		q = &cio2->queue[s_asd->csi2.port];
>  
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index b0f76477b54c7..498778eb9892b 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -396,7 +396,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  		}
>  	}
>  
> -	if (list_empty(&vin->group->notifier.asc_list))
> +	if (list_empty(&vin->group->notifier.waiting_list))
>  		return 0;
>  
>  	vin->group->notifier.ops = &rvin_group_notify_ops;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 2d1093997db52..e026ed5337513 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -191,7 +191,7 @@ static int rzg2l_cru_mc_parse_of_graph(struct rzg2l_cru_dev *cru)
>  
>  	cru->notifier.ops = &rzg2l_cru_async_ops;
>  
> -	if (list_empty(&cru->notifier.asc_list))
> +	if (list_empty(&cru->notifier.waiting_list))
>  		return 0;
>  
>  	ret = v4l2_async_nf_register(&cru->v4l2_dev, &cru->notifier);
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 96fbbc55eb12c..a535a7584da0f 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -56,7 +56,7 @@ xvip_graph_find_entity(struct xvip_composite_device *xdev,
>  	struct xvip_graph_entity *entity;
>  	struct v4l2_async_connection *asd;
>  
> -	list_for_each_entry(asd, &xdev->notifier.asc_list, asc_entry) {
> +	list_for_each_entry(asd, &xdev->notifier.done_list, asc_entry) {
>  		entity = to_xvip_entity(asd);
>  		if (entity->asd.match.fwnode == fwnode)
>  			return entity;
> @@ -291,7 +291,7 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  	dev_dbg(xdev->dev, "notify complete, all subdevs registered\n");
>  
>  	/* Create links for every entity. */
> -	list_for_each_entry(asd, &xdev->notifier.asc_list, asc_entry) {
> +	list_for_each_entry(asd, &xdev->notifier.done_list, asc_entry) {
>  		entity = to_xvip_entity(asd);
>  		ret = xvip_graph_build_one(xdev, entity);
>  		if (ret < 0)
> @@ -393,7 +393,7 @@ static int xvip_graph_parse(struct xvip_composite_device *xdev)
>  	if (ret < 0)
>  		return 0;
>  
> -	list_for_each_entry(asd, &xdev->notifier.asc_list, asc_entry) {
> +	list_for_each_entry(asd, &xdev->notifier.waiting_list, asc_entry) {
>  		entity = to_xvip_entity(asd);
>  		ret = xvip_graph_parse_one(xdev, entity->asd.match.fwnode);
>  		if (ret < 0) {
> @@ -501,7 +501,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
>  		goto done;
>  	}
>  
> -	if (list_empty(&xdev->notifier.asc_list)) {
> +	if (list_empty(&xdev->notifier.waiting_list)) {
>  		dev_err(xdev->dev, "no subdev found in graph\n");
>  		ret = -ENOENT;
>  		goto done;
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 5dfc6d5f6a7c3..d8de9ff3249d4 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -160,7 +160,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_async_match_desc *match);
>  	struct v4l2_async_connection *asc;
>  
> -	list_for_each_entry(asc, &notifier->waiting_list, waiting_entry) {
> +	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
>  		/* bus_type has been verified valid before */
>  		switch (asc->match.type) {
>  		case V4L2_ASYNC_MATCH_TYPE_I2C:
> @@ -232,14 +232,14 @@ v4l2_async_nf_find_v4l2_dev(struct v4l2_async_notifier *notifier)
>  static bool
>  v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
>  {
> -	struct v4l2_subdev *sd;
> +	struct v4l2_async_connection *asc;
>  
>  	if (!list_empty(&notifier->waiting_list))
>  		return false;
>  
> -	list_for_each_entry(sd, &notifier->done_list, async_list) {
> +	list_for_each_entry(asc, &notifier->done_list, asc_entry) {
>  		struct v4l2_async_notifier *subdev_notifier =
> -			v4l2_async_find_subdev_notifier(sd);
> +			v4l2_async_find_subdev_notifier(asc->sd);
>  
>  		if (subdev_notifier &&
>  		    !v4l2_async_nf_can_complete(subdev_notifier))
> @@ -333,12 +333,13 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  	if (ret)
>  		goto err_call_unbind;
>  
> -	list_del(&asc->waiting_entry);
>  	sd->asd = asc;
>  	sd->notifier = notifier;
>  
> -	/* Move from the global subdevice list to notifier's done */
> -	list_move(&sd->async_list, &notifier->done_list);
> +	asc->sd = sd;
> +
> +	/* Move from the waiting list to notifier's done */
> +	list_move(&asc->asc_entry, &notifier->done_list);
>  
>  	dev_dbg(notifier_dev(notifier), "v4l2-async: %s bound (ret %d)\n",
>  		dev_name(sd->dev), ret);
> @@ -422,25 +423,23 @@ static void v4l2_async_cleanup(struct v4l2_subdev *sd)
>  
>  /* Unbind all sub-devices in the notifier tree. */
>  static void
> -v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
> -				 bool readd)
> +v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
>  {
> -	struct v4l2_subdev *sd, *tmp;
> +	struct v4l2_async_connection *asc, *asc_tmp;
>  
> -	list_for_each_entry_safe(sd, tmp, &notifier->done_list, async_list) {
> +	list_for_each_entry_safe(asc, asc_tmp, &notifier->done_list,
> +				 asc_entry) {
>  		struct v4l2_async_notifier *subdev_notifier =
> -			v4l2_async_find_subdev_notifier(sd);
> +			v4l2_async_find_subdev_notifier(asc->sd);
>  
>  		if (subdev_notifier)
> -			v4l2_async_nf_unbind_all_subdevs(subdev_notifier, true);
> +			v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
>  
> -		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> -		if (readd)
> -			list_add_tail(&sd->asd->waiting_entry,
> -				      &notifier->waiting_list);
> -		v4l2_async_cleanup(sd);
> -
> -		list_move(&sd->async_list, &subdev_list);
> +		v4l2_async_nf_call_unbind(notifier, asc->sd, asc);
> +		v4l2_async_cleanup(asc->sd);
> +		list_move_tail(&asc->asc_entry, &notifier->waiting_list);
> +		list_move(&asc->sd->async_list, &subdev_list);
> +		asc->sd = NULL;
>  	}
>  
>  	notifier->parent = NULL;
> @@ -452,17 +451,16 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
>  				    struct v4l2_async_match_desc *match)
>  {
>  	struct v4l2_async_connection *asc;
> -	struct v4l2_subdev *sd;
>  
> -	list_for_each_entry(asc, &notifier->waiting_list, waiting_entry)
> +	list_for_each_entry(asc, &notifier->waiting_list, asc_entry)
>  		if (v4l2_async_match_equal(&asc->match, match))
>  			return true;
>  
> -	list_for_each_entry(sd, &notifier->done_list, async_list) {
> -		if (WARN_ON(!sd->asd))
> +	list_for_each_entry(asc, &notifier->done_list, asc_entry) {
> +		if (WARN_ON(!asc->sd->asd))
>  			continue;
>  
> -		if (v4l2_async_match_equal(&sd->asd->match, match))
> +		if (v4l2_async_match_equal(&asc->match, match))
>  			return true;
>  	}
>  
> @@ -477,16 +475,24 @@ static bool
>  v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
>  			      struct v4l2_async_match_desc *match)
>  {
> -	struct v4l2_async_connection *asc;
> +	struct list_head *heads[] = {
> +		&notifier->waiting_list,
> +		&notifier->done_list,
> +	};
> +	unsigned int i;
>  
>  	lockdep_assert_held(&list_lock);
>  
>  	/* Check that an asd is not being added more than once. */
> -	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
> -		if (&asc->match == match)
> -			break;
> -		if (v4l2_async_match_equal(&asc->match, match))
> -			return true;
> +	for (i = 0; i < ARRAY_SIZE(heads); i++) {
> +		struct v4l2_async_connection *asc;
> +
> +		list_for_each_entry(asc, heads[i], asc_entry) {
> +			if (&asc->match == match)
> +				break;
> +			if (v4l2_async_match_equal(&asc->match, match))
> +				return true;
> +		}
>  	}
>  
>  	/* Check that an asc does not exist in other notifiers. */
> @@ -521,7 +527,8 @@ static int v4l2_async_nf_match_valid(struct v4l2_async_notifier *notifier,
>  
>  void v4l2_async_nf_init(struct v4l2_async_notifier *notifier)
>  {
> -	INIT_LIST_HEAD(&notifier->asc_list);
> +	INIT_LIST_HEAD(&notifier->waiting_list);
> +	INIT_LIST_HEAD(&notifier->done_list);
>  }
>  EXPORT_SYMBOL(v4l2_async_nf_init);
>  
> @@ -530,17 +537,12 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	struct v4l2_async_connection *asc;
>  	int ret;
>  
> -	INIT_LIST_HEAD(&notifier->waiting_list);
> -	INIT_LIST_HEAD(&notifier->done_list);
> -
>  	mutex_lock(&list_lock);
>  
> -	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
> +	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
>  		ret = v4l2_async_nf_match_valid(notifier, &asc->match);
>  		if (ret)
>  			goto err_unlock;
> -
> -		list_add_tail(&asc->waiting_entry, &notifier->waiting_list);
>  	}
>  
>  	ret = v4l2_async_nf_try_all_subdevs(notifier);
> @@ -562,7 +564,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	/*
>  	 * On failure, unbind all sub-devices registered through this notifier.
>  	 */
> -	v4l2_async_nf_unbind_all_subdevs(notifier, false);
> +	v4l2_async_nf_unbind_all_subdevs(notifier);
>  
>  err_unlock:
>  	mutex_unlock(&list_lock);
> @@ -612,7 +614,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
>  	if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
>  		return;
>  
> -	v4l2_async_nf_unbind_all_subdevs(notifier, false);
> +	v4l2_async_nf_unbind_all_subdevs(notifier);
>  
>  	notifier->sd = NULL;
>  	notifier->v4l2_dev = NULL;
> @@ -634,10 +636,12 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
>  {
>  	struct v4l2_async_connection *asc, *tmp;
>  
> -	if (!notifier || !notifier->asc_list.next)
> +	if (!notifier || !notifier->waiting_list.next)
>  		return;
>  
> -	list_for_each_entry_safe(asc, tmp, &notifier->asc_list, asc_entry) {
> +	WARN_ON(!list_empty(&notifier->done_list));
> +
> +	list_for_each_entry_safe(asc, tmp, &notifier->waiting_list, asc_entry) {
>  		switch (asc->match.type) {
>  		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
>  			fwnode_handle_put(asc->match.fwnode);
> @@ -667,7 +671,7 @@ static int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
>  {
>  	mutex_lock(&list_lock);
>  
> -	list_add_tail(&asc->asc_entry, &notifier->asc_list);
> +	list_add_tail(&asc->asc_entry, &notifier->waiting_list);
>  
>  	mutex_unlock(&list_lock);
>  
> @@ -808,10 +812,12 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  	 */
>  	subdev_notifier = v4l2_async_find_subdev_notifier(sd);
>  	if (subdev_notifier)
> -		v4l2_async_nf_unbind_all_subdevs(subdev_notifier, false);
> +		v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
>  
> -	if (sd->asd)
> +	if (sd->asd) {
>  		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> +		sd->asd->sd = NULL;
> +	}
>  	v4l2_async_cleanup(sd);
>  
>  	mutex_unlock(&list_lock);
> @@ -837,9 +843,9 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	if (sd->asd) {
>  		struct v4l2_async_notifier *notifier = sd->notifier;
>  
> -		list_add(&sd->asd->waiting_entry, &notifier->waiting_list);
> -
> +		list_move(&sd->asd->asc_entry, &notifier->waiting_list);
>  		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> +		sd->asd->sd = NULL;
>  	}
>  
>  	v4l2_async_cleanup(sd);
> @@ -893,7 +899,7 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
>  
>  	list_for_each_entry(notif, &notifier_list, notifier_entry) {
>  		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
> -		list_for_each_entry(asc, &notif->waiting_list, waiting_entry)
> +		list_for_each_entry(asc, &notif->waiting_list, asc_entry)
>  			print_waiting_match(s, &asc->match);
>  	}
>  
> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
> index c1216b4557b69..67c1b16db6558 100644
> --- a/drivers/staging/media/imx/imx-media-dev-common.c
> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
> @@ -384,7 +384,7 @@ int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
>  	int ret;
>  
>  	/* no subdevs? just bail */
> -	if (list_empty(&imxmd->notifier.asc_list)) {
> +	if (list_empty(&imxmd->notifier.waiting_list)) {
>  		v4l2_err(&imxmd->v4l2_dev, "no subdevs\n");
>  		return -ENODEV;
>  	}
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index c93e5ac9dbf0c..146b4fd3c8b52 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1565,7 +1565,7 @@ tegra_vi_graph_find_entity(struct tegra_vi_channel *chan,
>  	struct tegra_vi_graph_entity *entity;
>  	struct v4l2_async_connection *asd;
>  
> -	list_for_each_entry(asd, &chan->notifier.asc_list, asc_entry) {
> +	list_for_each_entry(asd, &chan->notifier.done_list, asc_entry) {
>  		entity = to_tegra_vi_graph_entity(asd);
>  		if (entity->asd.match.fwnode == fwnode)
>  			return entity;
> @@ -1709,7 +1709,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  	}
>  
>  	/* create links between the entities */
> -	list_for_each_entry(asd, &chan->notifier.asc_list, asc_entry) {
> +	list_for_each_entry(asd, &chan->notifier.done_list, asc_entry) {
>  		entity = to_tegra_vi_graph_entity(asd);
>  		ret = tegra_vi_graph_build(chan, entity);
>  		if (ret < 0)
> @@ -1876,7 +1876,7 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
>  
>  		ret = tegra_vi_graph_parse_one(chan, remote);
>  		fwnode_handle_put(remote);
> -		if (ret < 0 || list_empty(&chan->notifier.asc_list))
> +		if (ret < 0 || list_empty(&chan->notifier.waiting_list))
>  			continue;
>  
>  		chan->notifier.ops = &tegra_vi_async_ops;
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 38d9d097fdb52..56b7238e2cbe2 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -66,9 +66,8 @@ struct v4l2_async_match_desc {
>   *
>   * @match:	struct of match type and per-bus type matching data sets
>   * @asc_entry:	used to add struct v4l2_async_connection objects to the
> - *		master notifier @asc_list
> - * @waiting_entry: used to link struct v4l2_async_connection objects, waiting to
> - *		be probed, to a notifier->waiting_list list
> + *		notifier @waiting_list or @done_list
> + * @sd:		the related sub-device
>   *
>   * When this struct is used as a member in a driver specific struct,
>   * the driver specific struct shall contain the &struct
> @@ -77,7 +76,7 @@ struct v4l2_async_match_desc {
>  struct v4l2_async_connection {
>  	struct v4l2_async_match_desc match;
>  	struct list_head asc_entry;
> -	struct list_head waiting_entry;
> +	struct v4l2_subdev *sd;
>  };
>  
>  /**
> @@ -106,7 +105,6 @@ struct v4l2_async_notifier_operations {
>   * @v4l2_dev:	v4l2_device of the root notifier, NULL otherwise
>   * @sd:		sub-device that registered the notifier, NULL otherwise
>   * @parent:	parent notifier
> - * @asc_list:	master list of struct v4l2_async_subdev
>   * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
>   * @done_list:	list of struct v4l2_subdev, already probed
>   * @notifier_entry: member in a global list of notifiers
> @@ -116,7 +114,6 @@ struct v4l2_async_notifier {
>  	struct v4l2_device *v4l2_dev;
>  	struct v4l2_subdev *sd;
>  	struct v4l2_async_notifier *parent;
> -	struct list_head asc_list;
>  	struct list_head waiting_list;
>  	struct list_head done_list;
>  	struct list_head notifier_entry;

-- 
Regards,

Laurent Pinchart
