Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3341A8F90
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 02:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392287AbgDOAKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 20:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392281AbgDOAKf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 20:10:35 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9ACC061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 17:10:35 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v23so733362pfm.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 17:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zyyqlvme3qQ45a75TmPPDuVc/27ickwpQIFV8yUhSqI=;
        b=JIKllIO9ZE+LY7GsdOT+dyiGxrNPP/uACUei5kyoJoYA0PgEDlUP38hOjud0XJJBjg
         cvglmhnakvkFVSOSctMzC7WpTyHD5E9LjUiaMto5DEux2bxcM9WzouURtOyzMweV+q1v
         ENHiXkrY+dYu/0epPCmJVBrRiO1lfwHR6fPWYUdz3w+b7CZt0cUSZK2P9Op+6PDUq56r
         RwVeA1QQBfcCmfLJFfFP+hnht9L0EUnpoPjL+FsMO/++xKKtpf5A53RgHA55vHozglyJ
         TPMnqIxjzc3Qti32DRGcKk8S6Yspo+KheBy8fZPbFexdl8oXAz5zG0pTPrE0bC2LbJd9
         aP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zyyqlvme3qQ45a75TmPPDuVc/27ickwpQIFV8yUhSqI=;
        b=p/daaJDyiA9WRT8wEhD+GnqE2blUroePENsLjFYP0Ls22jfDnbMAIgRAarg2nKg9I4
         TvgSUCRHJc1wCT6XmqR3HAcs31262ZKsCFImlLJ9BsJkzRWNsPWqX+SiWDXrYzPLvXY9
         jXWcfvxu8+hvlkgOJvv7Aaistl7UvGS0V1QWJDbEnA8OprO7pEmtsARZJ8ykhpkumPtt
         0ZFhpEeVi4l7mQJAEsPXTh4uRB5Ga4FgYHp+PM43+OzNvy1QXzllAAFsawUGP+fuJwZa
         dEI76NCOETgkiRUz+odLEF3tfELHAoreLXC0qpSKOJz3Bu8KFI3n7bChG8BKIs2Te3pz
         LoVA==
X-Gm-Message-State: AGi0PuZSQLEoCYKbOTP+s+Ooak9or/yx8nYBcOpYkRxHeTl5oiUQVa6F
        GgfOpiHLpF6Z89FTSmEOFjU=
X-Google-Smtp-Source: APiQypI8HtNeHLjIviXnaZr+9gIk2YuMjmoGljDcVnEM8PqDFTXpUVRaSnVxYnHZoeu2UpfvOJLqLA==
X-Received: by 2002:a62:7515:: with SMTP id q21mr9943379pfc.1.1586909434459;
        Tue, 14 Apr 2020 17:10:34 -0700 (PDT)
Received: from [192.168.1.101] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id x76sm11835135pfc.190.2020.04.14.17.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 17:10:33 -0700 (PDT)
Subject: Re: [PATCH v4 15/17] media: imx: Create missing links from CSI-2
 receiver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-16-slongerbeam@gmail.com>
 <20200414233205.GD28533@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <6b62906b-f5a4-cd57-ddc7-cb3713732548@gmail.com>
Date:   Tue, 14 Apr 2020 17:10:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414233205.GD28533@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/14/20 4:32 PM, Laurent Pinchart wrote:
> Hi Steve,
>
> Thank you for the patch.
>
> On Tue, Mar 03, 2020 at 03:42:54PM -0800, Steve Longerbeam wrote:
>> The entities external to the i.MX6 IPU and i.MX7 now create the links
>> to their fwnode-endpoint connected entities in their notifier bound
>> callbacks. Which means imx_media_create_of_links() and
>> imx_media_create_csi_of_links() are no longer needed and are removed.
>>
>> However there is still one case in which imx-media needs to create
>> fwnode-endpoint based links at probe completion. The v4l2-async framework
>> does not allow multiple subdevice notifiers to contain a duplicate
>> subdevice in their asd_list. Only the first subdev notifier that discovers
>> and adds that one subdevice to its asd_list will receive a bound callback
>> for it. Other subdevices that also have firmware endpoint connections to
>> this duplicate subdevice will not have it in their asd_list, and thus will
>> never receive a bound callback for it. In the case of imx-media, the one
>> duplicate subdevice in question is the i.MX6 MIPI CSI-2 receiver.
>>
>> Until there is a solution to that problem, rewrite imx_media_create_links()
>> to add the missing links from the CSI-2 receiver to the CSIs and CSI muxes.
>> The function is renamed imx_media_create_csi2_links().
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>> Changes in v3:
>> - call a local imx-media utility imx_media_create_fwnode_pad_links().
>> Changes in v2:
>> - this is a rewrite of v1 "media: imx: Use media_create_fwnode_links for
>>    external links", which only adds the missing CSI-2 receiver links.
>> ---
>>   .../staging/media/imx/imx-media-dev-common.c  |  46 +++----
>>   drivers/staging/media/imx/imx-media-of.c      | 114 ------------------
>>   drivers/staging/media/imx/imx-media.h         |   4 -
>>   3 files changed, 17 insertions(+), 147 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
>> index 66b505f7e8df..f7ad3cbbeec2 100644
>> --- a/drivers/staging/media/imx/imx-media-dev-common.c
>> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
>> @@ -30,41 +30,31 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
>>   }
>>   
>>   /*
>> - * Create the media links for all subdevs that registered.
>> + * Create the missing media links from the CSI-2 receiver.
>>    * Called after all async subdevs have bound.
>>    */
>> -static int imx_media_create_links(struct v4l2_async_notifier *notifier)
>> +static void imx_media_create_csi2_links(struct imx_media_dev *imxmd)
>>   {
>> -	struct imx_media_dev *imxmd = notifier2dev(notifier);
>> -	struct v4l2_subdev *sd;
>> +	struct v4l2_subdev *sd, *csi2 = NULL;
>>   
>>   	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
>> -		switch (sd->grp_id) {
>> -		case IMX_MEDIA_GRP_ID_IPU_VDIC:
>> -		case IMX_MEDIA_GRP_ID_IPU_IC_PRP:
>> -		case IMX_MEDIA_GRP_ID_IPU_IC_PRPENC:
>> -		case IMX_MEDIA_GRP_ID_IPU_IC_PRPVF:
>> -			/*
>> -			 * links have already been created for the
>> -			 * sync-registered subdevs.
>> -			 */
>> -			break;
>> -		case IMX_MEDIA_GRP_ID_IPU_CSI0:
>> -		case IMX_MEDIA_GRP_ID_IPU_CSI1:
>> -		case IMX_MEDIA_GRP_ID_CSI:
>> -			imx_media_create_csi_of_links(imxmd, sd);
>> -			break;
>> -		default:
>> -			/*
>> -			 * if this subdev has fwnode links, create media
>> -			 * links for them.
>> -			 */
>> -			imx_media_create_of_links(imxmd, sd);
>> +		if (sd->grp_id == IMX_MEDIA_GRP_ID_CSI2) {
>> +			csi2 = sd;
>>   			break;
>>   		}
>>   	}
>> +	if (!csi2)
>> +		return;
>>   
>> -	return 0;
>> +	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
>> +		/* skip if not a CSI or a video mux */
>> +		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
>> +		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
>> +		    sd->entity.function != MEDIA_ENT_F_VID_MUX)
> This is a bit dangerous, as the external source connected to the CSI-2
> receiver could be a video mux.

Yes I agree it looks dangerous on the face of it, but if there is a 
video-mux as a source to the csi-2 receiver, the video-mux's 
.get_fwnode_pad() verifies that the passed fwnode endpoint is actually 
owned by the video-mux, and imx_media_create_fwnode_pad_link() is only 
looking for a sink pad... Well, maybe that wasn't clear but if you 
follow the code you'll see that a weird link won't be created in that case.

But I agree, to make this at least look less dangerous, I'll do what you 
have done in "[PATCH 2/2] media: staging/imx: Don't create links between 
external entities" and mark the video-mux in the ipu-csi bound callbacks 
as one of the imx6 internal video muxes via a imx grp_id.

Steve

>   How about assigning a group id to the
> internal mux, as done in the "[PATCH 2/2] media: staging/imx: Don't
> create links between external entities" patch that I've posted, and
> checking the group id here ?
>
> With that fixed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> +			continue;
>> +
>> +		imx_media_create_fwnode_pad_links(csi2, sd);
>> +	}
>>   }
>>   
>>   /*
>> @@ -196,9 +186,7 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier)
>>   
>>   	mutex_lock(&imxmd->mutex);
>>   
>> -	ret = imx_media_create_links(notifier);
>> -	if (ret)
>> -		goto unlock;
>> +	imx_media_create_csi2_links(imxmd);
>>   
>>   	ret = imx_media_create_pad_vdev_lists(imxmd);
>>   	if (ret)
>> diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
>> index 2d3efd2a6dde..82e13e972e23 100644
>> --- a/drivers/staging/media/imx/imx-media-of.c
>> +++ b/drivers/staging/media/imx/imx-media-of.c
>> @@ -74,117 +74,3 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(imx_media_add_of_subdevs);
>> -
>> -/*
>> - * Create a single media link to/from sd using a fwnode link.
>> - *
>> - * NOTE: this function assumes an OF port node is equivalent to
>> - * a media pad (port id equal to media pad index), and that an
>> - * OF endpoint node is equivalent to a media link.
>> - */
>> -static int create_of_link(struct imx_media_dev *imxmd,
>> -			  struct v4l2_subdev *sd,
>> -			  struct v4l2_fwnode_link *link)
>> -{
>> -	struct v4l2_subdev *remote, *src, *sink;
>> -	int src_pad, sink_pad;
>> -
>> -	if (link->local_port >= sd->entity.num_pads)
>> -		return -EINVAL;
>> -
>> -	remote = imx_media_find_subdev_by_fwnode(imxmd, link->remote_node);
>> -	if (!remote)
>> -		return 0;
>> -
>> -	if (sd->entity.pads[link->local_port].flags & MEDIA_PAD_FL_SINK) {
>> -		src = remote;
>> -		src_pad = link->remote_port;
>> -		sink = sd;
>> -		sink_pad = link->local_port;
>> -	} else {
>> -		src = sd;
>> -		src_pad = link->local_port;
>> -		sink = remote;
>> -		sink_pad = link->remote_port;
>> -	}
>> -
>> -	/* make sure link doesn't already exist before creating */
>> -	if (media_entity_find_link(&src->entity.pads[src_pad],
>> -				   &sink->entity.pads[sink_pad]))
>> -		return 0;
>> -
>> -	v4l2_info(sd->v4l2_dev, "%s:%d -> %s:%d\n",
>> -		  src->name, src_pad, sink->name, sink_pad);
>> -
>> -	return media_create_pad_link(&src->entity, src_pad,
>> -				     &sink->entity, sink_pad, 0);
>> -}
>> -
>> -/*
>> - * Create media links to/from sd using its device-tree endpoints.
>> - */
>> -int imx_media_create_of_links(struct imx_media_dev *imxmd,
>> -			      struct v4l2_subdev *sd)
>> -{
>> -	struct v4l2_fwnode_link link;
>> -	struct device_node *ep;
>> -	int ret;
>> -
>> -	for_each_endpoint_of_node(sd->dev->of_node, ep) {
>> -		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
>> -		if (ret)
>> -			continue;
>> -
>> -		ret = create_of_link(imxmd, sd, &link);
>> -		v4l2_fwnode_put_link(&link);
>> -		if (ret)
>> -			return ret;
>> -	}
>> -
>> -	return 0;
>> -}
>> -EXPORT_SYMBOL_GPL(imx_media_create_of_links);
>> -
>> -/*
>> - * Create media links to the given CSI subdevice's sink pads,
>> - * using its device-tree endpoints.
>> - */
>> -int imx_media_create_csi_of_links(struct imx_media_dev *imxmd,
>> -				  struct v4l2_subdev *csi)
>> -{
>> -	struct device_node *csi_np = csi->dev->of_node;
>> -	struct device_node *ep;
>> -
>> -	for_each_child_of_node(csi_np, ep) {
>> -		struct fwnode_handle *fwnode, *csi_ep;
>> -		struct v4l2_fwnode_link link;
>> -		int ret;
>> -
>> -		memset(&link, 0, sizeof(link));
>> -
>> -		link.local_node = of_fwnode_handle(csi_np);
>> -		link.local_port = CSI_SINK_PAD;
>> -
>> -		csi_ep = of_fwnode_handle(ep);
>> -
>> -		fwnode = fwnode_graph_get_remote_endpoint(csi_ep);
>> -		if (!fwnode)
>> -			continue;
>> -
>> -		fwnode = fwnode_get_parent(fwnode);
>> -		fwnode_property_read_u32(fwnode, "reg", &link.remote_port);
>> -		fwnode = fwnode_get_next_parent(fwnode);
>> -		if (is_of_node(fwnode) &&
>> -		    of_node_name_eq(to_of_node(fwnode), "ports"))
>> -			fwnode = fwnode_get_next_parent(fwnode);
>> -		link.remote_node = fwnode;
>> -
>> -		ret = create_of_link(imxmd, csi, &link);
>> -		fwnode_handle_put(link.remote_node);
>> -		if (ret)
>> -			return ret;
>> -	}
>> -
>> -	return 0;
>> -}
>> -EXPORT_SYMBOL_GPL(imx_media_create_csi_of_links);
>> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
>> index 5f23d852122f..5271b84bea9a 100644
>> --- a/drivers/staging/media/imx/imx-media.h
>> +++ b/drivers/staging/media/imx/imx-media.h
>> @@ -248,10 +248,6 @@ void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
>>   /* imx-media-of.c */
>>   int imx_media_add_of_subdevs(struct imx_media_dev *dev,
>>   			     struct device_node *np);
>> -int imx_media_create_of_links(struct imx_media_dev *imxmd,
>> -			      struct v4l2_subdev *sd);
>> -int imx_media_create_csi_of_links(struct imx_media_dev *imxmd,
>> -				  struct v4l2_subdev *csi);
>>   int imx_media_of_add_csi(struct imx_media_dev *imxmd,
>>   			 struct device_node *csi_np);
>>   

