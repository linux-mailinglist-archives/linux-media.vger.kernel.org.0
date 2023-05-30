Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB27371540D
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 04:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjE3CwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 22:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjE3CwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 22:52:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1501C8E
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 19:52:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126158230151.30.openmobile.ne.jp [126.158.230.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DB1AE4;
        Tue, 30 May 2023 04:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685415120;
        bh=mjtmKXXVZwe/eljbEyQ7Jo4in1MIW87PJMXU0l4E1ZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cmjr0ZUpRbIWKpvguAPuMo/oJuLngHuI6q3i/u8YzxZnd0RB4NXP2fZAjq1A6J3p2
         IpD+L39tq0zncQEAPwzXxsSN2Cxw/xygFSV3eE5/FsWG//GrLRXeUsYFBfeqqCdCiR
         ITK428AN25CJqliOUkIridosN+3GOnXbWvUJRhkY=
Date:   Tue, 30 May 2023 05:52:22 +0300
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
Subject: Re: [RESEND PATCH v3 09/32] media: v4l: async: Make V4L2 async match
 information a struct
Message-ID: <20230530025222.GJ21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-10-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-10-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:15:52PM +0300, Sakari Ailus wrote:
> Make V4L2 async match information a struct, making it easier to use it
> elsewhere outside the scope of struct v4l2_async_subdev.
> 
> Also remove an obsolete comment --- none of these fields are supposed to
> be touched by drivers.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 20 +++++++-------
>  include/media/v4l2-async.h           | 41 ++++++++++++++++------------
>  2 files changed, 33 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 7c924faac4c10..7f56648e40c44 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -212,7 +212,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  
>  	list_for_each_entry(asd, &notifier->waiting, list) {
>  		/* bus_type has been verified valid before */
> -		switch (asd->match_type) {
> +		switch (asd->match.type) {
>  		case V4L2_ASYNC_MATCH_I2C:
>  			match = match_i2c;
>  			break;
> @@ -237,10 +237,10 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  static bool asd_equal(struct v4l2_async_subdev *asd_x,
>  		      struct v4l2_async_subdev *asd_y)
>  {
> -	if (asd_x->match_type != asd_y->match_type)
> +	if (asd_x->match.type != asd_y->match.type)
>  		return false;
>  
> -	switch (asd_x->match_type) {
> +	switch (asd_x->match.type) {
>  	case V4L2_ASYNC_MATCH_I2C:
>  		return asd_x->match.i2c.adapter_id ==
>  			asd_y->match.i2c.adapter_id &&
> @@ -552,7 +552,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  {
>  	struct device *dev = notifier_dev(notifier);
>  
> -	switch (asd->match_type) {
> +	switch (asd->match.type) {
>  	case V4L2_ASYNC_MATCH_I2C:
>  	case V4L2_ASYNC_MATCH_FWNODE:
>  		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
> @@ -561,8 +561,8 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  		}
>  		break;
>  	default:
> -		dev_err(dev, "v4l2-async: Invalid match type %u on %p\n",
> -			asd->match_type, asd);
> +		dev_err(dev, "v4l2-asymc: Invalid match type %u on %p\n",

Is this for asymmetrical notification ?

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +			asd->match.type, asd);
>  		return -EINVAL;
>  	}
>  
> @@ -688,7 +688,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
>  		return;
>  
>  	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
> -		switch (asd->match_type) {
> +		switch (asd->match.type) {
>  		case V4L2_ASYNC_MATCH_FWNODE:
>  			fwnode_handle_put(asd->match.fwnode);
>  			break;
> @@ -743,7 +743,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
>  	if (!asd)
>  		return ERR_PTR(-ENOMEM);
>  
> -	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> +	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
>  	asd->match.fwnode = fwnode_handle_get(fwnode);
>  
>  	ret = __v4l2_async_nf_add_subdev(notifier, asd);
> @@ -790,7 +790,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
>  	if (!asd)
>  		return ERR_PTR(-ENOMEM);
>  
> -	asd->match_type = V4L2_ASYNC_MATCH_I2C;
> +	asd->match.type = V4L2_ASYNC_MATCH_I2C;
>  	asd->match.i2c.adapter_id = adapter_id;
>  	asd->match.i2c.address = address;
>  
> @@ -901,7 +901,7 @@ EXPORT_SYMBOL(v4l2_async_unregister_subdev);
>  static void print_waiting_subdev(struct seq_file *s,
>  				 struct v4l2_async_subdev *asd)
>  {
> -	switch (asd->match_type) {
> +	switch (asd->match.type) {
>  	case V4L2_ASYNC_MATCH_I2C:
>  		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
>  			   asd->match.i2c.address);
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 2c9baa3c9266a..d347ef32f4ecb 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -34,23 +34,37 @@ enum v4l2_async_match_type {
>  };
>  
>  /**
> - * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
> + * struct v4l2_async_match_desc - async sub-device match information
>   *
> - * @match_type:	type of match that will be used
> - * @match:	union of per-bus type matching data sets
> - * @match.fwnode:
> - *		pointer to &struct fwnode_handle to be matched.
> + * @type:	type of match that will be used
> + * @fwnode:	pointer to &struct fwnode_handle to be matched.
>   *		Used if @match_type is %V4L2_ASYNC_MATCH_FWNODE.
> - * @match.i2c:	embedded struct with I2C parameters to be matched.
> + * @i2c:	embedded struct with I2C parameters to be matched.
>   *		Both @match.i2c.adapter_id and @match.i2c.address
>   *		should be matched.
>   *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> - * @match.i2c.adapter_id:
> + * @i2c.adapter_id:
>   *		I2C adapter ID to be matched.
>   *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> - * @match.i2c.address:
> + * @i2c.address:
>   *		I2C address to be matched.
>   *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> + */
> +struct v4l2_async_match_desc {
> +	enum v4l2_async_match_type type;
> +	union {
> +		struct fwnode_handle *fwnode;
> +		struct {
> +			int adapter_id;
> +			unsigned short address;
> +		} i2c;
> +	};
> +};
> +
> +/**
> + * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
> + *
> + * @match:	struct of match type and per-bus type matching data sets
>   * @asd_list:	used to add struct v4l2_async_subdev objects to the
>   *		master notifier @asd_list
>   * @list:	used to link struct v4l2_async_subdev objects, waiting to be
> @@ -61,16 +75,7 @@ enum v4l2_async_match_type {
>   * v4l2_async_subdev as its first member.
>   */
>  struct v4l2_async_subdev {
> -	enum v4l2_async_match_type match_type;
> -	union {
> -		struct fwnode_handle *fwnode;
> -		struct {
> -			int adapter_id;
> -			unsigned short address;
> -		} i2c;
> -	} match;
> -
> -	/* v4l2-async core private: not to be used by drivers */
> +	struct v4l2_async_match_desc match;
>  	struct list_head list;
>  	struct list_head asd_list;
>  };

-- 
Regards,

Laurent Pinchart
