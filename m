Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20DD06E0E73
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 15:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjDMNVo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 09:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjDMNVm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 09:21:42 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018F8D7
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 06:21:40 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33DDLQwl032274;
        Thu, 13 Apr 2023 08:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1681392086;
        bh=UUb6KgCwiI9qA+sEgkfG5Dq5+ULfrk1yaFqBKzpsXlc=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=RczDwQ5YbOlvKWKh52TpSq5O2PFsMJnJ0S5p08dZB7eV/5D8HFk37aRTnqPxD1ReC
         kbauLXpuqym7s4tugBzt4cn4ahUMAs9HY+ppBYDZ/OxhCqqoMUjVffJIdKdiSI4t6M
         cbll/dfaTxSCgiEmXQP+riogjbuM3n3sRhY3RK0w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33DDLQD6051934
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 13 Apr 2023 08:21:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 13
 Apr 2023 08:21:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 13 Apr 2023 08:21:25 -0500
Received: from [10.24.69.141] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33DDLNo5062088;
        Thu, 13 Apr 2023 08:21:24 -0500
Message-ID: <4cd24628-fafd-e280-200c-0c443e25cfa9@ti.com>
Date:   Thu, 13 Apr 2023 18:51:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] media: Accept non-subdev sinks in
 v4l2_create_fwnode_links_to_pad()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
CC:     Sakari Ailus <sakari.ailus@iki.fi>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230324103529.8704-1-laurent.pinchart@ideasonboard.com>
From:   Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <20230324103529.8704-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the patch, sorry for the delay in response,

On 24/03/23 16:05, Laurent Pinchart wrote:
> The v4l2_create_fwnode_links_to_pad() helper requires the sink pad
> passed to it to belong to a subdev. This requirement can be lifted
> easily. Make the function usable for non-subdev sinks, which allows
> using it with video_device sinks.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 15 ++++++---------
>  include/media/v4l2-mc.h           |  8 ++++----
>  2 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index b01474717dca..bf0c18100664 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -313,14 +313,11 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  				    struct media_pad *sink, u32 flags)
>  {
>  	struct fwnode_handle *endpoint;
> -	struct v4l2_subdev *sink_sd;
>  
>  	if (!(sink->flags & MEDIA_PAD_FL_SINK) ||
>  	    !is_media_entity_v4l2_subdev(sink->entity))

should we drop the second check here also, i.e

!is_media_entity_v4l2_subdev(sink->entity)

to accept non-subdev sinks? is my understanding correct?

Thanks and Regards,
Vaishnav

>  		return -EINVAL;
>  
> -	sink_sd = media_entity_to_v4l2_subdev(sink->entity);
> -
>  	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
>  		struct fwnode_handle *remote_ep;
>  		int src_idx, sink_idx, ret;
> @@ -340,7 +337,7 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  		 * ask the sink to verify it owns the remote endpoint,
>  		 * and translate to a sink pad.
>  		 */
> -		sink_idx = media_entity_get_fwnode_pad(&sink_sd->entity,
> +		sink_idx = media_entity_get_fwnode_pad(sink->entity,
>  						       remote_ep,
>  						       MEDIA_PAD_FL_SINK);
>  		fwnode_handle_put(remote_ep);
> @@ -362,17 +359,17 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  		if (media_entity_find_link(src, sink))
>  			continue;
>  
> -		dev_dbg(sink_sd->dev, "creating link %s:%d -> %s:%d\n",
> +		dev_dbg(src_sd->dev, "creating link %s:%d -> %s:%d\n",
>  			src_sd->entity.name, src_idx,
> -			sink_sd->entity.name, sink_idx);
> +			sink->entity->name, sink_idx);
>  
>  		ret = media_create_pad_link(&src_sd->entity, src_idx,
> -					    &sink_sd->entity, sink_idx, flags);
> +					    sink->entity, sink_idx, flags);
>  		if (ret) {
> -			dev_err(sink_sd->dev,
> +			dev_err(src_sd->dev,
>  				"link %s:%d -> %s:%d failed with %d\n",
>  				src_sd->entity.name, src_idx,
> -				sink_sd->entity.name, sink_idx, ret);
> +				sink->entity->name, sink_idx, ret);
>  
>  			fwnode_handle_put(endpoint);
>  			return ret;
> diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> index c181685923d5..b39586dfba35 100644
> --- a/include/media/v4l2-mc.h
> +++ b/include/media/v4l2-mc.h
> @@ -87,17 +87,17 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q);
>  
>  /**
>   * v4l2_create_fwnode_links_to_pad - Create fwnode-based links from a
> - *                                   source subdev to a sink subdev pad.
> + *                                   source subdev to a sink pad.
>   *
>   * @src_sd: pointer to a source subdev
> - * @sink:  pointer to a subdev sink pad
> + * @sink:  pointer to a sink pad
>   * @flags: the link flags
>   *
>   * This function searches for fwnode endpoint connections from a source
>   * subdevice to a single sink pad, and if suitable connections are found,
>   * translates them into media links to that pad. The function can be
> - * called by the sink subdevice, in its v4l2-async notifier subdev bound
> - * callback, to create links from a bound source subdevice.
> + * called by the sink, in its v4l2-async notifier bound callback, to create
> + * links from a bound source subdevice.
>   *
>   * The @flags argument specifies the link flags. The caller shall ensure that
>   * the flags are valid regardless of the number of links that may be created.

-- 
Regards,
Vaishnav
