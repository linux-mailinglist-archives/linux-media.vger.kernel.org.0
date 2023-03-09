Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711E56B243A
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjCIMeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjCIMeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:34:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291C514495
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:34:34 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95DA9589;
        Thu,  9 Mar 2023 13:34:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678365271;
        bh=La1JONZegkwXgS503AtlBzAqUBDblzXNhfMgVSz30aw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=A11hKszGSn84lA7QQ5D8iuZbrkxPeaV+w+ea94lkS1PxB/cd54Jc0j3ssO2z05Koh
         6/7OtEbHxdEvM9aq5C8NbEcBHPOBSOj66Wp55OShzrIaGgMbZy4TDk+DaNlF2uvbLR
         Arvs3GIsPGMDoDqkdo917RfSRYInPABofHr0zaCQ=
Message-ID: <93679d76-1817-f9b9-3683-f96de55dc13d@ideasonboard.com>
Date:   Thu, 9 Mar 2023 14:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     hdegoede@redhat.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 09/03/2023 14:27, Sakari Ailus wrote:
> Link validation currently accesses invalid pointers if the link passed to it
> is not between two sub-devices. This is of course a driver bug.
> 
> Ignore the error but print a debug message, as this is how it used to work
> previously.
> 
> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1bebcda2bd20c..dd911180ec899 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1209,6 +1209,17 @@ int v4l2_subdev_link_validate(struct media_link *link)
>   	struct v4l2_subdev_state *source_state, *sink_state;
>   	int ret;
>   
> +	if (!is_media_entity_v4l2_subdev(link->sink->entity)) {
> +		pr_warn_once("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
> +			     link->sink->entity->name);
> +		return 0;
> +	}
> +	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> +		pr_warn_once("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
> +			     link->source->entity->name);
> +		return 0;
> +	}
> +
>   	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
>   	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
>   

I think this is supposed to be v2. You missed my RB, but here it is again:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Also, the commit message says "debug message", but it's a warn now.

  Tomi

