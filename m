Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65702176E0
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 20:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgGGSg7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 14:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgGGSg6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 14:36:58 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5661EC08C5DC
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 11:36:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so46287957wrs.11
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xs/zEC2jUxxPZpO/qCdnGmXC49c7mTM4qEZvyzmAiE4=;
        b=j8Zl2rIos41vLw2JLZbCpYD9mec/2aTFapjUeJgKm37M8nGwujrClLL0UJ0Iu6QMyt
         hP9LrGHKfycvXeK2XelwyJYsIWLfybdn3F6xkLDE70wBxYIBjYjV2OxJXuGGdioTCJ9B
         yFFmlIXUdqG02Wz1QpcIvuLMv74eN1mouQ/Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xs/zEC2jUxxPZpO/qCdnGmXC49c7mTM4qEZvyzmAiE4=;
        b=RGaMTnrpdPYaQUA8/t8S/SkmN2llBO5SIVA04BcsjevN3LsEiw44i+IGE7FcRgphHV
         obRqy2CckiG+tQhGW/OqhC50oKsEB2tnXTCOh6JYAvzdPukytOW3kpakBOvB2Ya8b2rT
         VJTRWojllFmugRvJLkrzQdUBWjQwYH971OT0yjl2M4BTGSoAloNW2MVlMrNSM690b2LI
         HBzYHuD29ZV08g1eUSemitbjVe3p1OEzA8WxRSrqsu7PVV35qrJ9SqCwcdpnRMAGfbBP
         aov/vZ5hYvbp2aLDhpunB6IBRpFM1rPtiJ9+A/Qnc0PyfSVSf4piMWwRRtbCHw91Wr+O
         VS7g==
X-Gm-Message-State: AOAM533Ctn8lTQAyIBMO9DOETFXI9IBdaLj+WfEovbOcV+oMd0dcrlfh
        bzgrEgeb/1LwhBipHn7igyR1Ug==
X-Google-Smtp-Source: ABdhPJwaC6T+kfA8qybERBV51Yle5n7vTNwr7sCMV00fSA/7zQcs6BDUT3Z8vS/mf+l8gyQhwDRijg==
X-Received: by 2002:a5d:5310:: with SMTP id e16mr52741384wrv.289.1594147016935;
        Tue, 07 Jul 2020 11:36:56 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5sm2036815wmk.9.2020.07.07.11.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:36:56 -0700 (PDT)
Date:   Tue, 7 Jul 2020 18:36:55 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] media: exynos4-is: Add support for multiple
 sensors on one port
Message-ID: <20200707183655.GG2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660CE60DA8585C5E1DA9EB9A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660CE60DA8585C5E1DA9EB9A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 25, 2020 at 07:26:46PM -0700, Jonathan Bakker wrote:
> On some devices, there may be multiple camera sensors attached
> to the same port.  Make sure we probe all of them, not just the
> first one.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 32 ++++++++++++-------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index b38445219c72..a87ebd7913be 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -397,25 +397,28 @@ static void fimc_md_pipelines_free(struct fimc_md *fmd)
>  /* Parse port node and register as a sub-device any sensor specified there. */
>  static int fimc_md_parse_port_node(struct fimc_md *fmd,
>  				   struct device_node *port,
> -				   unsigned int index)
> +				   unsigned int *index)
>  {
> -	struct fimc_source_info *pd = &fmd->sensor[index].pdata;
> +	struct fimc_source_info *pd;
>  	struct device_node *rem, *ep, *np;
> -	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
> +	struct v4l2_fwnode_endpoint endpoint;
>  	int ret;
>  
> -	/* Assume here a port node can have only one endpoint node. */
>  	ep = of_get_next_child(port, NULL);
>  	if (!ep)
>  		return 0;
>  
> +parse_sensor:
> +	pd = &fmd->sensor[*index].pdata;
> +	endpoint.bus_type = 0;
> +
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &endpoint);
>  	if (ret) {
>  		of_node_put(ep);
>  		return ret;
>  	}
>  
> -	if (WARN_ON(endpoint.base.port == 0) || index >= FIMC_MAX_SENSORS) {
> +	if (WARN_ON(endpoint.base.port == 0) || *index >= FIMC_MAX_SENSORS) {
>  		of_node_put(ep);
>  		return -EINVAL;
>  	}
> @@ -462,16 +465,16 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>  		pd->fimc_bus_type = pd->sensor_bus_type;
>  	of_node_put(np);
>  
> -	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
> +	if (WARN_ON(*index >= ARRAY_SIZE(fmd->sensor))) {
>  		of_node_put(rem);
>  		return -EINVAL;
>  	}
>  
> -	fmd->sensor[index].asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	fmd->sensor[index].asd.match.fwnode = of_fwnode_handle(rem);
> +	fmd->sensor[*index].asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> +	fmd->sensor[*index].asd.match.fwnode = of_fwnode_handle(rem);
>  
>  	ret = v4l2_async_notifier_add_subdev(&fmd->subdev_notifier,
> -					     &fmd->sensor[index].asd);
> +					     &fmd->sensor[*index].asd);
>  	if (ret) {
>  		of_node_put(rem);
>  		return ret;
> @@ -479,6 +482,13 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>  
>  	fmd->num_sensors++;
>  
> +	/* Check for additional sensors on same port */
> +	ep = of_get_next_child(port, ep);
> +	if (ep) {
> +		(*index)++;

Do we need this index argument at all? I can see that we already have
fmd->num_sensors and we increment it every time we discover a sensor.
Perhaps we could just use it instead?

> +		goto parse_sensor;

As we know, goto in principle isn't the best coding pattern. There is a
number of exceptions where it is welcome, e.g. error handling, but
reimplementing a loop using goto is not very nice.

Instead, could you separate the code that probes one sensor into
fimc_md_parse_one_endpoint() and in this one simply iterate over all child
nodes of the port using for_each_child_of_node()?

Best regards,
Tomasz
