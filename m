Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6CB6715405
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 04:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjE3Cr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 22:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjE3Cr5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 22:47:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83109109
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 19:47:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126158230151.30.openmobile.ne.jp [126.158.230.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 813A8E4;
        Tue, 30 May 2023 04:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685414788;
        bh=NHFlr4lzig4t/GU95A4kucQyWsJfhI2P/jPP9q3ttaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DfY1q4FmJtHfm/5Q+y2u/B7i5ZAjGJIMlPsv5l4XmvGEa+UoleMhKqizZVFwqffN1
         VnaiuzZ+PJi6jrTl6YQXNZhbDDVAiyGHaxA8VxmUAUMCxHtQv8gbQY+YMHoghDazyd
         aYIxJ8Km1D8zFMUDedkLvJzaAqXdefYv84fx4Z0I=
Date:   Tue, 30 May 2023 05:46:50 +0300
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
Subject: Re: [RESEND PATCH v3 07/32] media: v4l: async: Drop unneeded list
 entry initialisation
Message-ID: <20230530024650.GH21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-8-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-8-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:15:50PM +0300, Sakari Ailus wrote:
> The list entry is initialised as a head in v4l2_async_register_subdev()
> just before being added to the list. This isn't needed, drop the
> initialisation.

Is this really unneeded ? Before the initialization and the list_add()
call there are a few code paths that can access the async_list. For
instance, the error path calls v4l2_async_cleanup(), which calls

	list_del_init(&sd->async_list);

That won't work well on an uninitialized (or zero-initialized)
list_head.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 320fe5cbaaf41..aef9a16e892ef 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -823,8 +823,6 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  
>  	mutex_lock(&list_lock);
>  
> -	INIT_LIST_HEAD(&sd->async_list);
> -
>  	list_for_each_entry(notifier, &notifier_list, list) {
>  		struct v4l2_device *v4l2_dev =
>  			v4l2_async_nf_find_v4l2_dev(notifier);

-- 
Regards,

Laurent Pinchart
