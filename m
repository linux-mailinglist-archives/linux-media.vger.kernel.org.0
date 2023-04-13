Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE3E6E12EF
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 18:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjDMQ7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 12:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjDMQ7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 12:59:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AEE10D3
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 09:59:00 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F5451918;
        Thu, 13 Apr 2023 18:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681405136;
        bh=Rkhl4bZGBoevguIOeSE8yXYWfNWJ4fAS4DzoY6atrCw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GZYnbStb7WvQ5TQ0rh0HTcn7HnP4uGFm1BNMTI2KqG0KFYD20YY7/hGQejA9tksQ4
         oDiVv051vy4gBQ57mNEEIMenmodtS6pfXvTTPFcdLExmg0dhzhZXZtjQ+LjUw7wDm+
         eup+cUgSrR8GQm6dYp6JGxoEs7RYPyPsEyMu0Xqk=
Date:   Thu, 13 Apr 2023 18:58:56 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 05/18] media: v4l: async: Clean testing for duplicated
 async subdevs
Message-ID: <pp7ndz4qud6g5cmkcsbbqogybfqwvjcokqebnzka2wpv6bqqg7@thzj5mo4mjzt>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-6-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Thu, Mar 30, 2023 at 02:58:40PM +0300, Sakari Ailus wrote:
> There's a need to verify that a single async sub-device isn't being added
> multiple times, this would be an error. This takes place at the time of
> adding the async sub-device to the notifier's list as well as when the
> notifier is added to the global notifier's list.
>
> Use the pointer to the sub-device for testing this instead of an index to
> an array that is long gone.
>
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

is skip_self used ?

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
> --
> 2.30.2
>
