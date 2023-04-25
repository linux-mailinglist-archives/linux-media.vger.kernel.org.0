Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0225F6ED9A6
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 03:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbjDYBK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 21:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjDYBK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 21:10:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EB7AF30
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 18:10:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9972675B;
        Tue, 25 Apr 2023 03:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682385035;
        bh=Oekwx7HqnDtGnvD+sG0M93fhOmtlzDIFzUGGdKo7z0s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lRCdzS3iFCFddN+rOU5gBxGSmVPDesz4HnWzwoomHB74oJKsV8KXrb7TYH7Tr5iqe
         xrKFSOWuIhhP3sPfOwcrgIb7jhKornYlHIUrCCwqMGoptf1Yl3ANEGMF2APnuurJfX
         TkUvy9AvKtbRpRYqS/vMuOh6XanDQY/Ioein+83Q=
Date:   Tue, 25 Apr 2023 04:10:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 04/18] media: v4l: async: Make V4L2 async match
 information a struct
Message-ID: <20230425011057.GH4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-5-sakari.ailus@linux.intel.com>
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

On Thu, Mar 30, 2023 at 02:58:39PM +0300, Sakari Ailus wrote:
> Make V4L2 async match information a struct, making it easier to use it
> elsewhere outside the scope of struct v4l2_async_subdev.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c  | 18 ++++++-------
>  drivers/media/v4l2-core/v4l2-fwnode.c |  2 +-
>  include/media/v4l2-async.h            | 39 ++++++++++++++++-----------
>  3 files changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 13fe0bdc70b6..bb78e3618ab5 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -147,7 +147,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  
>  	list_for_each_entry(asd, &notifier->waiting, list) {
>  		/* bus_type has been verified valid before */
> -		switch (asd->match_type) {
> +		switch (asd->match.type) {
>  		case V4L2_ASYNC_MATCH_I2C:

Renaming V4L2_ASYNC_MATCH_* to V4L2_ASYNC_MATCH_TYPE_* would be nice in
a separate patch.

>  			match = match_i2c;
>  			break;
> @@ -172,10 +172,10 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
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
> @@ -494,7 +494,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  	if (!asd)
>  		return -EINVAL;
>  
> -	switch (asd->match_type) {
> +	switch (asd->match.type) {
>  	case V4L2_ASYNC_MATCH_I2C:
>  	case V4L2_ASYNC_MATCH_FWNODE:
>  		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
> @@ -504,7 +504,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  		break;
>  	default:
>  		dev_err(dev, "Invalid match type %u on %p\n",
> -			asd->match_type, asd);
> +			asd->match.type, asd);
>  		return -EINVAL;
>  	}
>  
> @@ -630,7 +630,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
>  		return;
>  
>  	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
> -		switch (asd->match_type) {
> +		switch (asd->match.type) {
>  		case V4L2_ASYNC_MATCH_FWNODE:
>  			fwnode_handle_put(asd->match.fwnode);
>  			break;
> @@ -685,7 +685,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
>  	if (!asd)
>  		return ERR_PTR(-ENOMEM);
>  
> -	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> +	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
>  	asd->match.fwnode = fwnode_handle_get(fwnode);
>  
>  	ret = __v4l2_async_nf_add_subdev(notifier, asd);
> @@ -732,7 +732,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
>  	if (!asd)
>  		return ERR_PTR(-ENOMEM);
>  
> -	asd->match_type = V4L2_ASYNC_MATCH_I2C;
> +	asd->match.type = V4L2_ASYNC_MATCH_I2C;
>  	asd->match.i2c.adapter_id = adapter_id;
>  	asd->match.i2c.address = address;
>  
> @@ -850,7 +850,7 @@ EXPORT_SYMBOL(v4l2_async_unregister_subdev);
>  static void print_waiting_subdev(struct seq_file *s,
>  				 struct v4l2_async_subdev *asd)
>  {
> -	switch (asd->match_type) {
> +	switch (asd->match.type) {
>  	case V4L2_ASYNC_MATCH_I2C:
>  		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
>  			   asd->match.i2c.address);
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 3d9533c1b202..e6bd63364bed 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -811,7 +811,7 @@ v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
>  	if (!asd)
>  		return -ENOMEM;
>  
> -	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> +	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
>  	asd->match.fwnode =
>  		fwnode_graph_get_remote_port_parent(endpoint);
>  	if (!asd->match.fwnode) {
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 25eb1d138c06..0c4cffd081c9 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -34,23 +34,38 @@ enum v4l2_async_match_type {
>  };
>  
>  /**
> - * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
> + * struct v4l2_async_match - async sub-device match information

The new structure name sounds like it stores data about an actual match,
while in reality it stores information for matching subdevs with
notifier entries. How about naming the structure v4l2_async_match_info,
or v4l2_async_match_descriptor or v4l2_async_match_desc ?

>   *
> - * @match_type:	type of match that will be used
> - * @match:	union of per-bus type matching data sets
> - * @match.fwnode:
> + * @type:	type of match that will be used
> + * @fwnode:
>   *		pointer to &struct fwnode_handle to be matched.
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
> +struct v4l2_async_match {
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
> @@ -61,15 +76,7 @@ enum v4l2_async_match_type {
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
> +	struct v4l2_async_match match;
>  	/* v4l2-async core private: not to be used by drivers */
>  	struct list_head list;
>  	struct list_head asd_list;

-- 
Regards,

Laurent Pinchart
