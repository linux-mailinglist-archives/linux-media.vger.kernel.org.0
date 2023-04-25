Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5506ED9AE
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 03:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbjDYBPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 21:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjDYBPc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 21:15:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F855269
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 18:15:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 036F975B;
        Tue, 25 Apr 2023 03:15:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682385320;
        bh=ZfstWJJrICiVnPWiSN05UljgJOphqGuNWu1e0ShD9O4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=geNgmaq1KyUUGkGyImccaOz+iZXNI0Q5UYr4qL4qk5zbb7dp7YP2YslhBscxFCVVO
         Ha6xnRKFbY/ejJ1j8lO5U/C4lVeWucYKyHdQ75IR/2/b+YILzau5SuxIQdHmLHcbSq
         q0fPmITL/hS61EpleZuUs0juRM9KyknEovrwpZYA=
Date:   Tue, 25 Apr 2023 04:15:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 05/18] media: v4l: async: Clean testing for duplicated
 async subdevs
Message-ID: <20230425011541.GI4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-6-sakari.ailus@linux.intel.com>
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

On Thu, Mar 30, 2023 at 02:58:40PM +0300, Sakari Ailus wrote:
> There's a need to verify that a single async sub-device isn't being added
> multiple times, this would be an error. This takes place at the time of
> adding the async sub-device to the notifier's list as well as when the
> notifier is added to the global notifier's list.
> 
> Use the pointer to the sub-device for testing this instead of an index to
> an array that is long gone.

Reading the patch, I have no idea what the "long gone array" is. Could
you please expand the commit message to make this easier to review ?
v4l2-async is very difficult to follow in general, reviewing this series
is painful :-S Let's try to improve it with better commit messages.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index bb78e3618ab5..fc9ae22e2b47 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -456,21 +456,19 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>  
>  /*
>   * Find out whether an async sub-device was set up already or
> - * whether it exists in a given notifier before @this_index.
> - * If @this_index < 0, search the notifier's entire @asd_list.
> + * whether it exists in a given notifier.
>   */
>  static bool
>  v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> -			       struct v4l2_async_subdev *asd, int this_index)
> +			       struct v4l2_async_subdev *asd, bool skip_self)
>  {
>  	struct v4l2_async_subdev *asd_y;
> -	int j = 0;
>  
>  	lockdep_assert_held(&list_lock);
>  
>  	/* Check that an asd is not being added more than once. */
>  	list_for_each_entry(asd_y, &notifier->asd_list, asd_list) {
> -		if (this_index >= 0 && j++ >= this_index)
> +		if (asd == asd_y)
>  			break;
>  		if (asd_equal(asd, asd_y))
>  			return true;
> @@ -486,7 +484,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>  
>  static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd,
> -				   int this_index)
> +				   bool skip_self)
>  {
>  	struct device *dev =
>  		notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
> @@ -497,7 +495,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  	switch (asd->match.type) {
>  	case V4L2_ASYNC_MATCH_I2C:
>  	case V4L2_ASYNC_MATCH_FWNODE:
> -		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
> +		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
>  			dev_dbg(dev, "subdev descriptor already listed in this or other notifiers\n");
>  			return -EEXIST;
>  		}
> @@ -520,7 +518,7 @@ EXPORT_SYMBOL(v4l2_async_nf_init);
>  static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  {
>  	struct v4l2_async_subdev *asd;
> -	int ret, i = 0;
> +	int ret;
>  
>  	INIT_LIST_HEAD(&notifier->waiting);
>  	INIT_LIST_HEAD(&notifier->done);
> @@ -528,7 +526,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	mutex_lock(&list_lock);
>  
>  	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> -		ret = v4l2_async_nf_asd_valid(notifier, asd, i++);
> +		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
>  		if (ret)
>  			goto err_unlock;
>  
> @@ -661,7 +659,7 @@ int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
>  
>  	mutex_lock(&list_lock);
>  
> -	ret = v4l2_async_nf_asd_valid(notifier, asd, -1);
> +	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
>  	if (ret)
>  		goto unlock;
>  

-- 
Regards,

Laurent Pinchart
