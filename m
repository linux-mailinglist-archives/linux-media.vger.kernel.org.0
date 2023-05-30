Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1AC71551C
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 07:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjE3FmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 01:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbjE3Fl5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 01:41:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BB1E49
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 22:41:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35FA927C;
        Tue, 30 May 2023 07:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685425239;
        bh=z3eeQ4auxcXNmwVD62L126g+Evjt/1ryopW19IQD6qw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PWCPiXedDJ+GggNIvQ1r6UpJb6ZV8lLO1bJBXQXiW/KunDw2w4IWqvBwqlNm8uCcs
         81Kr2jnEkBmoeJZqWlA4eBYMBg19y25mTVQxNY8+keWyVWBfWpjkqg+mtVQ+kxoJ2x
         ODdDpcUJZW+7Frn1dLI+dP44QfmYr16f04/RIkao=
Date:   Tue, 30 May 2023 08:40:59 +0300
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
Subject: Re: [RESEND PATCH v3 12/32] media: v4l: async: Clean up list heads
 and entries
Message-ID: <20230530054059.GA5714@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-13-sakari.ailus@linux.intel.com>
 <20230530030929.GM21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530030929.GM21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 30, 2023 at 06:09:29AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:55PM +0300, Sakari Ailus wrote:
> > The naming of list heads and list entries is confusing as they're named
> > similarly. Use _list for list head and _entry for list entries.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
> >  drivers/media/platform/xilinx/xilinx-vipp.c   |  6 +--
> >  drivers/media/v4l2-core/v4l2-async.c          | 54 +++++++++----------
> >  drivers/staging/media/tegra-video/vi.c        |  4 +-
> >  include/media/v4l2-async.h                    | 36 ++++++-------
> >  include/media/v4l2-subdev.h                   |  2 +-
> >  6 files changed, 52 insertions(+), 52 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > index 3c84cb1216320..9231d6a65f4ec 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > @@ -1420,7 +1420,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
> >  	unsigned int pad;
> >  	int ret;
> >  
> > -	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
> > +	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_entry) {
> >  		s_asd = to_sensor_asd(asd);
> >  		q = &cio2->queue[s_asd->csi2.port];
> >  
> > diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> > index b309af0c83749..52c5a7decf284 100644
> > --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> > +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> > @@ -56,7 +56,7 @@ xvip_graph_find_entity(struct xvip_composite_device *xdev,
> >  	struct xvip_graph_entity *entity;
> >  	struct v4l2_async_subdev *asd;
> >  
> > -	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
> > +	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
> >  		entity = to_xvip_entity(asd);
> >  		if (entity->asd.match.fwnode == fwnode)
> >  			return entity;
> > @@ -291,7 +291,7 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
> >  	dev_dbg(xdev->dev, "notify complete, all subdevs registered\n");
> >  
> >  	/* Create links for every entity. */
> > -	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
> > +	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
> >  		entity = to_xvip_entity(asd);
> >  		ret = xvip_graph_build_one(xdev, entity);
> >  		if (ret < 0)
> > @@ -393,7 +393,7 @@ static int xvip_graph_parse(struct xvip_composite_device *xdev)
> >  	if (ret < 0)
> >  		return 0;
> >  
> > -	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
> > +	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
> >  		entity = to_xvip_entity(asd);
> >  		ret = xvip_graph_parse_one(xdev, entity->asd.match.fwnode);
> >  		if (ret < 0) {
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 5eb9850f1c6c4..06b1e1a1a5f87 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -213,7 +213,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >  		      struct v4l2_async_match_desc *match);
> >  	struct v4l2_async_subdev *asd;
> >  
> > -	list_for_each_entry(asd, &notifier->waiting, list) {
> > +	list_for_each_entry(asd, &notifier->waiting_list, waiting_entry) {
> >  		/* bus_type has been verified valid before */
> >  		switch (asd->match.type) {
> >  		case V4L2_ASYNC_MATCH_TYPE_I2C:
> > @@ -262,7 +262,7 @@ v4l2_async_find_subdev_notifier(struct v4l2_subdev *sd)
> >  {
> >  	struct v4l2_async_notifier *n;
> >  
> > -	list_for_each_entry(n, &notifier_list, list)
> > +	list_for_each_entry(n, &notifier_list, notifier_entry)
> >  		if (n->sd == sd)
> >  			return n;
> >  
> > @@ -287,10 +287,10 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> >  {
> >  	struct v4l2_subdev *sd;
> >  
> > -	if (!list_empty(&notifier->waiting))
> > +	if (!list_empty(&notifier->waiting_list))
> >  		return false;
> >  
> > -	list_for_each_entry(sd, &notifier->done, async_list) {
> > +	list_for_each_entry(sd, &notifier->done_list, async_list) {
> >  		struct v4l2_async_notifier *subdev_notifier =
> >  			v4l2_async_find_subdev_notifier(sd);
> >  
> > @@ -312,7 +312,7 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> >  	struct v4l2_async_notifier *__notifier = notifier;
> >  
> >  	/* Quick check whether there are still more sub-devices here. */
> > -	if (!list_empty(&notifier->waiting))
> > +	if (!list_empty(&notifier->waiting_list))
> >  		return 0;
> >  
> >  	if (notifier->sd)
> > @@ -391,13 +391,12 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >  		return ret;
> >  	}
> >  
> > -	/* Remove from the waiting list */
> > -	list_del(&asd->list);
> > +	list_del(&asd->waiting_entry);
> >  	sd->asd = asd;
> >  	sd->notifier = notifier;
> >  
> >  	/* Move from the global subdevice list to notifier's done */
> > -	list_move(&sd->async_list, &notifier->done);
> > +	list_move(&sd->async_list, &notifier->done_list);
> >  
> >  	dev_dbg(notifier_dev(notifier), "v4l2-async: %s bound (ret %d)\n",
> >  		dev_name(sd->dev), ret);
> > @@ -478,7 +477,7 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
> >  {
> >  	struct v4l2_subdev *sd, *tmp;
> >  
> > -	list_for_each_entry_safe(sd, tmp, &notifier->done, async_list) {
> > +	list_for_each_entry_safe(sd, tmp, &notifier->done_list, async_list) {
> >  		struct v4l2_async_notifier *subdev_notifier =
> >  			v4l2_async_find_subdev_notifier(sd);
> >  
> > @@ -487,7 +486,8 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
> >  
> >  		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> >  		if (readd)
> > -			list_add_tail(&sd->asd->list, &notifier->waiting);
> > +			list_add_tail(&sd->asd->waiting_entry,
> > +				      &notifier->waiting_list);
> >  		v4l2_async_cleanup(sd);
> >  
> >  		list_move(&sd->async_list, &subdev_list);
> > @@ -504,11 +504,11 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
> >  	struct v4l2_async_subdev *asd;
> >  	struct v4l2_subdev *sd;
> >  
> > -	list_for_each_entry(asd, &notifier->waiting, list)
> > +	list_for_each_entry(asd, &notifier->waiting_list, waiting_entry)
> >  		if (v4l2_async_match_equal(&asd->match, match))
> >  			return true;
> >  
> > -	list_for_each_entry(sd, &notifier->done, async_list) {
> > +	list_for_each_entry(sd, &notifier->done_list, async_list) {
> >  		if (WARN_ON(!sd->asd))
> >  			continue;
> >  
> > @@ -533,7 +533,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
> >  	lockdep_assert_held(&list_lock);
> >  
> >  	/* Check that an asd is not being added more than once. */
> > -	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> > +	list_for_each_entry(asd, &notifier->asd_list, asd_entry) {
> >  		if (skip_self && &asd->match == match)
> >  			break;
> >  		if (v4l2_async_match_equal(&asd->match, match))
> > @@ -541,7 +541,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
> >  	}
> >  
> >  	/* Check that an asd does not exist in other notifiers. */
> > -	list_for_each_entry(notifier, &notifier_list, list)
> > +	list_for_each_entry(notifier, &notifier_list, notifier_entry)
> >  		if (v4l2_async_nf_has_async_match_entry(notifier, match))
> >  			return true;
> >  
> > @@ -583,17 +583,17 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
> >  	struct v4l2_async_subdev *asd;
> >  	int ret;
> >  
> > -	INIT_LIST_HEAD(&notifier->waiting);
> > -	INIT_LIST_HEAD(&notifier->done);
> > +	INIT_LIST_HEAD(&notifier->waiting_list);
> > +	INIT_LIST_HEAD(&notifier->done_list);
> >  
> >  	mutex_lock(&list_lock);
> >  
> > -	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> > +	list_for_each_entry(asd, &notifier->asd_list, asd_entry) {
> >  		ret = v4l2_async_nf_match_valid(notifier, &asd->match, true);
> >  		if (ret)
> >  			goto err_unlock;
> >  
> > -		list_add_tail(&asd->list, &notifier->waiting);
> > +		list_add_tail(&asd->waiting_entry, &notifier->waiting_list);
> >  	}
> >  
> >  	ret = v4l2_async_nf_try_all_subdevs(notifier);
> > @@ -605,7 +605,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
> >  		goto err_unbind;
> >  
> >  	/* Keep also completed notifiers on the list */
> > -	list_add(&notifier->list, &notifier_list);
> > +	list_add(&notifier->notifier_entry, &notifier_list);
> >  
> >  	mutex_unlock(&list_lock);
> >  
> > @@ -670,7 +670,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> >  	notifier->sd = NULL;
> >  	notifier->v4l2_dev = NULL;
> >  
> > -	list_del(&notifier->list);
> > +	list_del(&notifier->notifier_entry);
> >  }
> >  
> >  void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> > @@ -690,7 +690,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> >  	if (!notifier || !notifier->asd_list.next)
> >  		return;
> >  
> > -	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
> > +	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_entry) {
> >  		switch (asd->match.type) {
> >  		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
> >  			fwnode_handle_put(asd->match.fwnode);
> > @@ -699,7 +699,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> >  			break;
> >  		}
> >  
> > -		list_del(&asd->asd_list);
> > +		list_del(&asd->asd_entry);
> >  		v4l2_async_nf_call_destroy(notifier, asd);
> >  		kfree(asd);
> >  	}
> > @@ -727,7 +727,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
> >  	if (ret)
> >  		goto unlock;
> >  
> > -	list_add_tail(&asd->asd_list, &notifier->asd_list);
> > +	list_add_tail(&asd->asd_entry, &notifier->asd_list);
> >  
> >  unlock:
> >  	mutex_unlock(&list_lock);
> > @@ -823,7 +823,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
> >  
> >  	mutex_lock(&list_lock);
> >  
> > -	list_for_each_entry(notifier, &notifier_list, list) {
> > +	list_for_each_entry(notifier, &notifier_list, notifier_entry) {
> >  		struct v4l2_device *v4l2_dev =
> >  			v4l2_async_nf_find_v4l2_dev(notifier);
> >  		struct v4l2_async_subdev *asd;
> > @@ -890,7 +890,7 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> >  	if (sd->asd) {
> >  		struct v4l2_async_notifier *notifier = sd->notifier;
> >  
> > -		list_add(&sd->asd->list, &notifier->waiting);
> > +		list_add(&sd->asd->waiting_entry, &notifier->waiting_list);
> >  
> >  		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> >  	}
> > @@ -944,9 +944,9 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
> >  
> >  	mutex_lock(&list_lock);
> >  
> > -	list_for_each_entry(notif, &notifier_list, list) {
> > +	list_for_each_entry(notif, &notifier_list, notifier_entry) {
> >  		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
> > -		list_for_each_entry(asd, &notif->waiting, list)
> > +		list_for_each_entry(asd, &notif->waiting_list, waiting_entry)
> >  			print_waiting_match(s, &asd->match);
> >  	}
> >  
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> > index 2f1aff7e87170..350871f34f7cc 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -1565,7 +1565,7 @@ tegra_vi_graph_find_entity(struct tegra_vi_channel *chan,
> >  	struct tegra_vi_graph_entity *entity;
> >  	struct v4l2_async_subdev *asd;
> >  
> > -	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
> > +	list_for_each_entry(asd, &chan->notifier.asd_list, asd_entry) {
> >  		entity = to_tegra_vi_graph_entity(asd);
> >  		if (entity->asd.match.fwnode == fwnode)
> >  			return entity;
> > @@ -1709,7 +1709,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
> >  	}
> >  
> >  	/* create links between the entities */
> > -	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
> > +	list_for_each_entry(asd, &chan->notifier.asd_list, asd_entry) {
> >  		entity = to_tegra_vi_graph_entity(asd);
> >  		ret = tegra_vi_graph_build(chan, entity);
> >  		if (ret < 0)
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 8d1506a9755c3..54f9f45ed3d8e 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -65,10 +65,10 @@ struct v4l2_async_match_desc {
> >   * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
> >   *
> >   * @match:	struct of match type and per-bus type matching data sets
> > - * @asd_list:	used to add struct v4l2_async_subdev objects to the
> > - *		master notifier @asd_list
> > - * @list:	used to link struct v4l2_async_subdev objects, waiting to be
> > - *		probed, to a notifier->waiting list
> > + * @asd_entry:	used to add struct v4l2_async_subdev objects to the
> > + *		master notifier @asd_entry
> 
> I think you mean 'master notifier @asd_list' here.
> 
> > + * @waiting_entry: used to link struct v4l2_async_subdev objects, waiting to be
> > + *		probed, to a notifier->waiting_list list
> >   *
> >   * When this struct is used as a member in a driver specific struct,
> >   * the driver specific struct shall contain the &struct
> > @@ -76,8 +76,8 @@ struct v4l2_async_match_desc {
> >   */
> >  struct v4l2_async_subdev {
> >  	struct v4l2_async_match_desc match;
> > -	struct list_head list;
> > -	struct list_head asd_list;
> > +	struct list_head asd_entry;
> > +	struct list_head waiting_entry;
> >  };
> >  
> >  /**
> > @@ -107,9 +107,9 @@ struct v4l2_async_notifier_operations {
> >   * @sd:		sub-device that registered the notifier, NULL otherwise
> >   * @parent:	parent notifier
> >   * @asd_list:	master list of struct v4l2_async_subdev
> > - * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
> > - * @done:	list of struct v4l2_subdev, already probed
> > - * @list:	member in a global list of notifiers
> > + * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
> > + * @done_list:	list of struct v4l2_subdev, already probed
> > + * @notifier_entry: member in a global list of notifiers
> >   */
> >  struct v4l2_async_notifier {
> >  	const struct v4l2_async_notifier_operations *ops;
> > @@ -117,9 +117,9 @@ struct v4l2_async_notifier {
> >  	struct v4l2_subdev *sd;
> >  	struct v4l2_async_notifier *parent;
> >  	struct list_head asd_list;
> > -	struct list_head waiting;
> > -	struct list_head done;
> > -	struct list_head list;
> > +	struct list_head waiting_list;
> > +	struct list_head done_list;
> > +	struct list_head notifier_entry;
> >  };
> >  
> >  /**
> > @@ -134,7 +134,7 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   *
> > - * This function initializes the notifier @asd_list. It must be called
> > + * This function initializes the notifier @asd_entry. It must be called
> >   * before adding a subdevice to a notifier, using one of:
> >   * v4l2_async_nf_add_fwnode_remote(), v4l2_async_nf_add_fwnode() or
> >   * v4l2_async_nf_add_i2c().
> > @@ -147,7 +147,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
> >  			   unsigned int asd_struct_size);
> >  /**
> >   * v4l2_async_nf_add_fwnode - Allocate and add a fwnode async
> > - *				subdev to the notifier's master asd_list.
> > + *				subdev to the notifier's master asd_entry.
> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   * @fwnode: fwnode handle of the sub-device to be matched, pointer to
> > @@ -157,7 +157,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
> >   *	  sub-device struct, i.e. both begin at the same memory address.
> >   *
> >   * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
> > - * notifiers @asd_list. The function also gets a reference of the fwnode which
> > + * notifiers @asd_entry. The function also gets a reference of the fwnode which

This rename doesn't seem correct, I think it refers to the notifier's
asd_list, which didn't get renamed, not the v4l2_async_subdev.asd_list.

> >   * is released later at notifier cleanup time.
> >   */
> >  #define v4l2_async_nf_add_fwnode(notifier, fwnode, type)		\
> > @@ -170,7 +170,7 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> >  /**
> >   * v4l2_async_nf_add_fwnode_remote - Allocate and add a fwnode
> >   *						  remote async subdev to the
> > - *						  notifier's master asd_list.
> > + *						  notifier's master asd_entry.

Same here.

> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   * @ep: local endpoint pointing to the remote sub-device to be matched,
> > @@ -180,7 +180,7 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> >   *	  sub-device struct, i.e. both begin at the same memory address.
> >   *
> >   * Gets the remote endpoint of a given local endpoint, set it up for fwnode
> > - * matching and adds the async sub-device to the notifier's @asd_list. The
> > + * matching and adds the async sub-device to the notifier's @asd_entry. The

Same here.

> >   * function also gets a reference of the fwnode which is released later at
> >   * notifier cleanup time.
> >   *
> > @@ -196,7 +196,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
> >  			unsigned int asd_struct_size);
> >  /**
> >   * v4l2_async_nf_add_i2c - Allocate and add an i2c async
> > - *				subdev to the notifier's master asd_list.
> > + *				subdev to the notifier's master asd_entry.

Same here.

> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   * @adapter: I2C adapter ID to be matched
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index cfd19e72d0fc4..82e4cf3dd2e05 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1020,7 +1020,7 @@ struct v4l2_subdev_platform_data {
> >   * @dev: pointer to the physical device, if any
> >   * @fwnode: The fwnode_handle of the subdev, usually the same as
> >   *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
> > - * @async_list: Links this subdev to a global subdev_list or @notifier->done
> > + * @async_list: Links this subdev to a global subdev_entry or @notifier->done
> 
> There's no subdev_entry, and the list is now called notifier->done_list.
> Have you renamed the wrong thing ?
> 
> >   *	list.
> >   * @asd: Pointer to respective &struct v4l2_async_subdev.
> >   * @notifier: Pointer to the managing notifier.

-- 
Regards,

Laurent Pinchart
