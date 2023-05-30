Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C167153C6
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 04:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjE3Cmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 22:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjE3Cmb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 22:42:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D7AA8
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 19:42:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126158230151.30.openmobile.ne.jp [126.158.230.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CC42E4;
        Tue, 30 May 2023 04:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685414527;
        bh=P6dm5M/qqFqTeaAJjraDgN7DARmQ0rrTrG2G8TYM3Ds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gvohsUyQ7MUwE1WBuCrsf+Ulbo2FHCLnk0NdzmpLV8jbZoegJYBxMyeliXpQ0pWwr
         CYNEaCA2in3wGgdnN5x4Hgbgd/CiRsSwnWh0hoGU2pPP7+Pj9tbINIuWbdPaJ0XJDt
         OM60cvVUdaYPxJ8LKnYkkb8e2RlIAJw86fZRmZ10=
Date:   Tue, 30 May 2023 05:42:29 +0300
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
Subject: Re: [RESEND PATCH v3 06/32] media: v4l: async: Clean up testing for
 duplicate async subdevs
Message-ID: <20230530024229.GG21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-7-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:15:49PM +0300, Sakari Ailus wrote:
> There's a need to verify that a single async sub-device isn't being added
> multiple times, this would be an error. This takes place at the time of
> adding the async sub-device to the notifier's list as well as when the
> notifier is added to the global notifier's list.
> 
> Use the pointer to the sub-device for testing this instead of an index to
> an array that is long gone. (There was an array of async sub-devices in
> the notifier before it was converted to a linked list by commit
> 66beb323e4a0 ("media: v4l2: async: Remove notifier subdevs array").

Unbalanced opening and closing parentheses.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index c5781124337af..320fe5cbaaf41 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -520,21 +520,19 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>  
>  /*
>   * Find out whether an async sub-device was set up already or
> - * whether it exists in a given notifier before @this_index.
> - * If @this_index < 0, search the notifier's entire @asd_list.
> + * whether it exists in a given notifier.

Please document what the skip_self parameter does. The parameter name
doesn't match the 'break' in the test below, I was expecting a
'continue'. If my expectation is wrong documentation should help, if
it's correct, then you can fix the code :-)

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
> +		if (skip_self && asd == asd_y)
>  			break;
>  		if (asd_equal(asd, asd_y))
>  			return true;
> @@ -550,7 +548,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>  
>  static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd,
> -				   int this_index)
> +				   bool skip_self)
>  {
>  	struct device *dev = notifier_dev(notifier);
>  
> @@ -560,7 +558,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
>  	switch (asd->match_type) {
>  	case V4L2_ASYNC_MATCH_I2C:
>  	case V4L2_ASYNC_MATCH_FWNODE:
> -		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
> +		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
>  			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in a notifier\n");
>  			return -EEXIST;
>  		}
> @@ -583,7 +581,7 @@ EXPORT_SYMBOL(v4l2_async_nf_init);
>  static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  {
>  	struct v4l2_async_subdev *asd;
> -	int ret, i = 0;
> +	int ret;
>  
>  	INIT_LIST_HEAD(&notifier->waiting);
>  	INIT_LIST_HEAD(&notifier->done);
> @@ -591,7 +589,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	mutex_lock(&list_lock);
>  
>  	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> -		ret = v4l2_async_nf_asd_valid(notifier, asd, i++);
> +		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
>  		if (ret)
>  			goto err_unlock;
>  
> @@ -725,7 +723,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
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
