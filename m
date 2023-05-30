Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B976715411
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 04:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjE3CzW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 22:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjE3CzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 22:55:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B04A8
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 19:55:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126158230151.30.openmobile.ne.jp [126.158.230.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE0FDE4;
        Tue, 30 May 2023 04:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685415296;
        bh=ylF25j6tjMtUb2ObZlTAQUuUfpuIXH8RV4t1+K0596w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FBQGCjCyJ+kmJF+F5XYMF7ZSWqQ8p4+VY6c+Td89o8OTVyluB2NX2Spf1ech19omz
         RmkWpCndFUQIxxD5Y3l6J4TeiCofUM7DmSm6M1ufoKVV3UBjDvcc7lXYM59fxbxlrc
         8ZA3pu6jf7hRdWDTXxIf1rORwXCGOQhinnKrPpYY=
Date:   Tue, 30 May 2023 05:55:19 +0300
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
Subject: Re: [RESEND PATCH v3 10/32] media: v4l: async: Rename
 V4L2_ASYNC_MATCH_ macros, add TYPE_
Message-ID: <20230530025519.GK21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-11-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-11-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:15:53PM +0300, Sakari Ailus wrote:
> The async match type is a struct field now, rename V4L2_ASYNC_MATCH_*
> macros as V4L2_ASYNC_MATCH_TYPE_* instead.
> 
> This patch has been produced by:
> 
> git grep -l V4L2_ASYNC_MATCH_ -- drivers/media/ drivers/staging/media/ \
> 	include/ Documentation/|xargs perl -i -pe \
> 	's/V4L2_ASYNC_MATCH_\K/TYPE_/g'
> 
> so it must be correct.

I was really hoping to prove you wrong here :-)

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-async.c | 22 +++++++++++-----------
>  include/media/v4l2-async.h           | 16 ++++++++--------
>  2 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 7f56648e40c44..93234c316aa6e 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -213,10 +213,10 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  	list_for_each_entry(asd, &notifier->waiting, list) {
>  		/* bus_type has been verified valid before */
>  		switch (asd->match.type) {
> -		case V4L2_ASYNC_MATCH_I2C:
> +		case V4L2_ASYNC_MATCH_TYPE_I2C:
>  			match = match_i2c;
>  			break;
> -		case V4L2_ASYNC_MATCH_FWNODE:
> +		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
>  			match = match_fwnode;
>  			break;
>  		default:
> @@ -241,12 +241,12 @@ static bool asd_equal(struct v4l2_async_subdev *asd_x,
>  		return false;
>  
>  	switch (asd_x->match.type) {
> -	case V4L2_ASYNC_MATCH_I2C:
> +	case V4L2_ASYNC_MATCH_TYPE_I2C:
>  		return asd_x->match.i2c.adapter_id ==
>  			asd_y->match.i2c.adapter_id &&
>  			asd_x->match.i2c.address ==
>  			asd_y->match.i2c.address;
> -	case V4L2_ASYNC_MATCH_FWNODE:
> +	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
>  		return asd_x->match.fwnode == asd_y->match.fwnode;
>  	default:
>  		break;
> @@ -553,8 +553,8 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  	struct device *dev = notifier_dev(notifier);
>  
>  	switch (asd->match.type) {
> -	case V4L2_ASYNC_MATCH_I2C:
> -	case V4L2_ASYNC_MATCH_FWNODE:
> +	case V4L2_ASYNC_MATCH_TYPE_I2C:
> +	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
>  		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
>  			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in a notifier\n");
>  			return -EEXIST;
> @@ -689,7 +689,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
>  
>  	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
>  		switch (asd->match.type) {
> -		case V4L2_ASYNC_MATCH_FWNODE:
> +		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
>  			fwnode_handle_put(asd->match.fwnode);
>  			break;
>  		default:
> @@ -743,7 +743,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
>  	if (!asd)
>  		return ERR_PTR(-ENOMEM);
>  
> -	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
> +	asd->match.type = V4L2_ASYNC_MATCH_TYPE_FWNODE;
>  	asd->match.fwnode = fwnode_handle_get(fwnode);
>  
>  	ret = __v4l2_async_nf_add_subdev(notifier, asd);
> @@ -790,7 +790,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
>  	if (!asd)
>  		return ERR_PTR(-ENOMEM);
>  
> -	asd->match.type = V4L2_ASYNC_MATCH_I2C;
> +	asd->match.type = V4L2_ASYNC_MATCH_TYPE_I2C;
>  	asd->match.i2c.adapter_id = adapter_id;
>  	asd->match.i2c.address = address;
>  
> @@ -902,11 +902,11 @@ static void print_waiting_subdev(struct seq_file *s,
>  				 struct v4l2_async_subdev *asd)
>  {
>  	switch (asd->match.type) {
> -	case V4L2_ASYNC_MATCH_I2C:
> +	case V4L2_ASYNC_MATCH_TYPE_I2C:
>  		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
>  			   asd->match.i2c.address);
>  		break;
> -	case V4L2_ASYNC_MATCH_FWNODE: {
> +	case V4L2_ASYNC_MATCH_TYPE_FWNODE: {
>  		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
>  
>  		devnode = fwnode_graph_is_endpoint(fwnode) ?
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index d347ef32f4ecb..8d1506a9755c3 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -22,15 +22,15 @@ struct v4l2_async_notifier;
>   * enum v4l2_async_match_type - type of asynchronous subdevice logic to be used
>   *	in order to identify a match
>   *
> - * @V4L2_ASYNC_MATCH_I2C: Match will check for I2C adapter ID and address
> - * @V4L2_ASYNC_MATCH_FWNODE: Match will use firmware node
> + * @V4L2_ASYNC_MATCH_TYPE_I2C: Match will check for I2C adapter ID and address
> + * @V4L2_ASYNC_MATCH_TYPE_FWNODE: Match will use firmware node
>   *
>   * This enum is used by the asynchronous sub-device logic to define the
>   * algorithm that will be used to match an asynchronous device.
>   */
>  enum v4l2_async_match_type {
> -	V4L2_ASYNC_MATCH_I2C,
> -	V4L2_ASYNC_MATCH_FWNODE,
> +	V4L2_ASYNC_MATCH_TYPE_I2C,
> +	V4L2_ASYNC_MATCH_TYPE_FWNODE,
>  };
>  
>  /**
> @@ -38,17 +38,17 @@ enum v4l2_async_match_type {
>   *
>   * @type:	type of match that will be used
>   * @fwnode:	pointer to &struct fwnode_handle to be matched.
> - *		Used if @match_type is %V4L2_ASYNC_MATCH_FWNODE.
> + *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_FWNODE.
>   * @i2c:	embedded struct with I2C parameters to be matched.
>   *		Both @match.i2c.adapter_id and @match.i2c.address
>   *		should be matched.
> - *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> + *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
>   * @i2c.adapter_id:
>   *		I2C adapter ID to be matched.
> - *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> + *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
>   * @i2c.address:
>   *		I2C address to be matched.
> - *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> + *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
>   */
>  struct v4l2_async_match_desc {
>  	enum v4l2_async_match_type type;

-- 
Regards,

Laurent Pinchart
