Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545D24D9A62
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 12:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347859AbiCOLbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 07:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235350AbiCOLbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 07:31:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A128A4F9CF
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 04:30:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B86B6BC0;
        Tue, 15 Mar 2022 12:30:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647343838;
        bh=MGq9poPLet2fnjOGFvQqlUM6L7oV2SpDn65l21UfXKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BZmzODtrMBEI7hj7UKCfZdpk958KhP6+bCo8snpXz5I0/c5nceOcL5TWtXRYJnVkH
         /kQDn2NwWtzy0KhaiwTs4NH4RlDVz6+5a2CVftWnR4KbDzt4ARZDa5uSV7GHoB1H5J
         11aVGQC0NsF+Py/udq0jNxlM33iu4iUYEMuGGoYo=
Date:   Tue, 15 Mar 2022 13:30:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 4/5] media: imx: imx-mipi-csis: Remove duplicated check
Message-ID: <YjB4zDdyQxJG6u7U@pendragon.ideasonboard.com>
References: <20220314103941.46021-1-jacopo@jmondi.org>
 <20220314103941.46021-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220314103941.46021-5-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 14, 2022 at 11:39:40AM +0100, Jacopo Mondi wrote:
> The mipi_csis_log_counters() function already checks for
> csis->debug.enable, it is not necessary to do the same in the caller.

Does it ? It does only to decide whether or not to print counters that
have a zero value.

> Compatc the code in the caller as well by removing an empty line.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 4a6152c13d52..4bb469fcb6b3 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -913,11 +913,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	if (!enable) {
>  		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> -
>  		mipi_csis_stop_stream(csis);
> -		if (csis->debug.enable)
> -			mipi_csis_log_counters(csis, true);
> -
> +		mipi_csis_log_counters(csis, true);
>  		pm_runtime_put(csis->dev);
>  
>  		return 0;

-- 
Regards,

Laurent Pinchart
