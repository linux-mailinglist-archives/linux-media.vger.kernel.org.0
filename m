Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11ADE72E64A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 16:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242856AbjFMOvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 10:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242758AbjFMOvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 10:51:44 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3D01BC7
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686667897; x=1718203897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OgUFfGjURm6pYNL9IuGBjWGLiVUJxvu2Hzk18jsJ9Xo=;
  b=PsuUMgWOs/zdsf+xs0yNt/mlrVUa0zUs/uWsbZTcF1/mdyzmpd/kFzrG
   Kb45HsDFdFX+X591/y9Jaf+QjE3jGLN2kFaCq8i5SdOf2mDixOadfGE57
   rUVO3PbuDP1HPFQd13g5F/Zc+zp9xO/O3VEHGZnXaiMNfAyi97BWvbJk1
   cF4Njbq1Ct7GBVpMTgcWk7LZRNsBrmrPSXR0UjtSLEBN9mItgYZBb+Hql
   ZD/wKrLxvcojZQO7Pd7W4B8yYdvCGpA9ggQebGd9ZLJNqoe+4XQW/mnxu
   Cvw+5gd6VcA4b6VvQRgsNxJf/J+1C9LpwCFDdD1wraQNh3n1DbEOLcoaz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338713879"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="338713879"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="781701344"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="781701344"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:51:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id DCF9B11F9D2;
        Tue, 13 Jun 2023 17:51:27 +0300 (EEST)
Date:   Tue, 13 Jun 2023 14:51:27 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <ZIiCb2JkZpQi3TCP@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-13-sakari.ailus@linux.intel.com>
 <20230530030929.GM21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530030929.GM21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 06:09:29AM +0300, Laurent Pinchart wrote:
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

Yes, thank you.

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
> >   * is released later at notifier cleanup time.
> >   */
> >  #define v4l2_async_nf_add_fwnode(notifier, fwnode, type)		\
> > @@ -170,7 +170,7 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> >  /**
> >   * v4l2_async_nf_add_fwnode_remote - Allocate and add a fwnode
> >   *						  remote async subdev to the
> > - *						  notifier's master asd_list.
> > + *						  notifier's master asd_entry.
> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   * @ep: local endpoint pointing to the remote sub-device to be matched,
> > @@ -180,7 +180,7 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> >   *	  sub-device struct, i.e. both begin at the same memory address.
> >   *
> >   * Gets the remote endpoint of a given local endpoint, set it up for fwnode
> > - * matching and adds the async sub-device to the notifier's @asd_list. The
> > + * matching and adds the async sub-device to the notifier's @asd_entry. The
> >   * function also gets a reference of the fwnode which is released later at
> >   * notifier cleanup time.
> >   *
> > @@ -196,7 +196,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
> >  			unsigned int asd_struct_size);
> >  /**
> >   * v4l2_async_nf_add_i2c - Allocate and add an i2c async
> > - *				subdev to the notifier's master asd_list.
> > + *				subdev to the notifier's master asd_entry.
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

Oops. I'll fix this for v4.

-- 
Sakari Ailus
