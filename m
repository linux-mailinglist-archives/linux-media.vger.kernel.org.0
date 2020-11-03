Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5172A43AD
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 12:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgKCLCr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 06:02:47 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36409 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727068AbgKCLCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 06:02:47 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Zu5JkFhPTlQTrZu5Nk8VKP; Tue, 03 Nov 2020 12:02:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604401365; bh=QAyymFnXaba58QfApZkMn7wNpNLqt4UXOM0wwUuKR9k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dyv8gfHM72OwFl488ErIQe4h+TTXSsL5fqlGnWIre2HYGoIUnzws6QYSz1CX6QbIr
         02/2SA9mkh3smIrJXqjbJc7aU6ISzyvpjlPj2G1JyGmAIDWcfYN7vCOrPPfprYmBzZ
         Se4J/TFaUivNqeg1AV9AzIv5zwMjTN/QoMrPLaRQ4C12L8xr9og2vFz4L7eQozUABq
         Iuu5ZUOqDtV3LfBWH5gHA5HckcaV9ZUnSnQ3TI8MnoHN++Qs1uaNUHaT+40dIfditT
         gNOC35ay5IjhKtnRNjqeEmIUp4D4Oafw2YKFUfynaWFxOD+P59l8Vzuy8BKih40V0e
         BIz7F0J7Jd/Wg==
Subject: Re: [PATCH v2 108/108] media: ti-vpe: cal: Implement media controller
 centric API
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
 <20200706183709.12238-109-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5266cec4-33ba-ba91-d55e-ff22a9b3e013@xs4all.nl>
Date:   Tue, 3 Nov 2020 12:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200706183709.12238-109-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNdwztR5zDMwqeJ0G4bMD/mSr51h2RUwAZvLTK/EUyteRFhjN1+TjMEuHZpABNPf2IA8UNAM9T+lAeiBsdNoRqiXX7mZX37jXsBb5I6YvGM5XS4f4fjG
 +Cdg/5NZKWJGSsyY0K1hGJciYrwRCG+LdxvbZERBMKXlgknD58DJtXEsG+ZXbaloxmcXpDuuDHZgYLWVTD/jkcc33kOJ4JJ2TbuP/fl8TptFm8dBx5OqPEwA
 tMxMLgSRqtvyc4pNv+vlEi324X9axYqA7aoI8RP1nFaWhluGmlmfVrMnLN9MJsPOYA2II3Ipc6itzV8+AaMBvQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

This was still on my TODO list to review. Of the other patch only my comment
for 100/108 needs to be addressed in a v3.

I have just one comment for this patch:

On 06/07/2020 20:37, Laurent Pinchart wrote:

> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 293cbac905b3..2ce2b6404c92 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -43,6 +43,10 @@ unsigned int cal_debug;
>  module_param_named(debug, cal_debug, uint, 0644);
>  MODULE_PARM_DESC(debug, "activates debug info");
>  
> +bool cal_mc_api;
> +module_param_named(mc_api, cal_mc_api, bool, 0444);
> +MODULE_PARM_DESC(mc_api, "activates the MC API");

I think it would be very useful if a Kconfig option is added that selects
the default of cal_mc_api. If you know that you want the MC API, then you
can select the option and that will be the default.

It is probably best if you rebase this series, fix 100/108 and (hopefully)
this patch and post it as a v3. I'll take it.

Regards,

	Hans

> +
>  /* ------------------------------------------------------------------
>   *	Format Handling
>   * ------------------------------------------------------------------
> @@ -660,13 +664,17 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct cal_dev *cal = container_of(notifier, struct cal_dev, notifier);
>  	unsigned int i;
> +	int ret = 0;
>  
>  	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
>  		if (cal->ctx[i])
>  			cal_ctx_v4l2_register(cal->ctx[i]);
>  	}
>  
> -	return 0;
> +	if (cal_mc_api)
> +		ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_async_notifier_operations cal_async_notifier_ops = {
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 2d935691bf75..f5609216b7c6 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -160,6 +160,7 @@ struct cal_camerarx {
>  	struct device_node	*sensor_ep_node;
>  	struct device_node	*sensor_node;
>  	struct v4l2_subdev	*sensor;
> +	struct media_pipeline	pipe;
>  
>  	struct v4l2_subdev	subdev;
>  	struct media_pad	pads[2];
> @@ -224,6 +225,7 @@ struct cal_ctx {
>  
>  extern unsigned int cal_debug;
>  extern int cal_video_nr;
> +extern bool cal_mc_api;
>  
>  #define cal_dbg(level, cal, fmt, arg...)				\
>  	do {								\
> 

