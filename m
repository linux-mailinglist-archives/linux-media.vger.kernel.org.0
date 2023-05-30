Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E06EF715539
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 08:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjE3GBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 02:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjE3GBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 02:01:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902D0B0
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 23:01:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E844E27C;
        Tue, 30 May 2023 08:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685426454;
        bh=XIfCDRQRn0ELZJRrwrVc+RHzP3XPaJHcUkIjB31fD1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qmRR660qqwvsWjkdojwSvI4ySkQryWeFsGs5ApUG7eruWpzw6TsEw0GA5z0+oHHLg
         HEGk9RPju/y8J9yS4ca5vpgkHCpjh5BCO6mhG9O8sKKKIaNqy4KQMX6+M7sdbSWvJk
         KrOI6vpVo0sJyF7pyoqw5pYnX+5yuvyVocIa6qCI=
Date:   Tue, 30 May 2023 09:01:15 +0300
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
Subject: Re: [RESEND PATCH v3 16/32] media: v4l: async: Drop duplicate
 handling when adding connections
Message-ID: <20230530060115.GU21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-17-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-17-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:15:59PM +0300, Sakari Ailus wrote:
> The connections are checked for duplicates already when the notifier is
> registered. This is effectively a sanity check for driver (and possibly
> obscure firmware) bugs. Don't do this when adding the connection.

Isn't it better to have this sanity check when the connection is added,
instead of later when the notifier is registered ? The latter is more
difficult to debug. If you want to avoid duplicate checks, could we drop
the one at notifier registration time ?

> Retain the int return type for now. It'll be needed very soon again.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index f51f0c37210c9..5dfc6d5f6a7c3 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -475,8 +475,7 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
>   */
>  static bool
>  v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
> -			      struct v4l2_async_match_desc *match,
> -			      bool skip_self)
> +			      struct v4l2_async_match_desc *match)
>  {
>  	struct v4l2_async_connection *asc;
>  
> @@ -484,7 +483,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
>  
>  	/* Check that an asd is not being added more than once. */
>  	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
> -		if (skip_self && &asc->match == match)
> +		if (&asc->match == match)
>  			break;
>  		if (v4l2_async_match_equal(&asc->match, match))
>  			return true;
> @@ -499,16 +498,14 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
>  }
>  
>  static int v4l2_async_nf_match_valid(struct v4l2_async_notifier *notifier,
> -				     struct v4l2_async_match_desc *match,
> -				     bool skip_self)
> +				     struct v4l2_async_match_desc *match)
>  {
>  	struct device *dev = notifier_dev(notifier);
>  
>  	switch (match->type) {
>  	case V4L2_ASYNC_MATCH_TYPE_I2C:
>  	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
> -		if (v4l2_async_nf_has_async_match(notifier, match,
> -						  skip_self)) {
> +		if (v4l2_async_nf_has_async_match(notifier, match)) {
>  			dev_dbg(dev, "v4l2-async: match descriptor already listed in a notifier\n");
>  			return -EEXIST;
>  		}
> @@ -539,7 +536,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	mutex_lock(&list_lock);
>  
>  	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
> -		ret = v4l2_async_nf_match_valid(notifier, &asc->match, true);
> +		ret = v4l2_async_nf_match_valid(notifier, &asc->match);
>  		if (ret)
>  			goto err_unlock;
>  
> @@ -668,19 +665,13 @@ EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
>  static int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
>  					  struct v4l2_async_connection *asc)
>  {
> -	int ret;
> -
>  	mutex_lock(&list_lock);
>  
> -	ret = v4l2_async_nf_match_valid(notifier, &asc->match, false);
> -	if (ret)
> -		goto unlock;
> -
>  	list_add_tail(&asc->asc_entry, &notifier->asc_list);
>  
> -unlock:
>  	mutex_unlock(&list_lock);
> -	return ret;
> +
> +	return 0;
>  }
>  
>  struct v4l2_async_connection *

-- 
Regards,

Laurent Pinchart
