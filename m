Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665294D3219
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbiCIPrd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbiCIPrc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:47:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5134113859F
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:46:33 -0800 (PST)
Received: from [IPV6:2a01:e0a:169:7140:3734:287e:1a7f:9772] (unknown [IPv6:2a01:e0a:169:7140:3734:287e:1a7f:9772])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF4C4A50;
        Wed,  9 Mar 2022 16:46:31 +0100 (CET)
Message-ID: <b2d41731-bc1d-c63f-db28-75869e7c34f4@gmail.com>
Date:   Wed, 9 Mar 2022 16:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/5] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20220302220304.1327896-1-djrscally@gmail.com>
 <20220302220304.1327896-6-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
In-Reply-To: <20220302220304.1327896-6-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NICE_REPLY_A,NML_ADSP_CUSTOM_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi !

Thanks for the patch !

On 02/03/2022 23:03, Daniel Scally wrote:
> Upon an async fwnode match, there's some typical behaviour that the
> notifier and matching subdev will want to do. For example, a notifier
> representing a sensor matching to an async subdev representing its
> VCM will want to create an ancillary link to expose that relationship
> to userspace.
> 
> To avoid lots of code in individual drivers, try to build these links
> within v4l2 core.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

> ---
> 
> Changes since v2:
> 
> 	- Stopped checking the notifier entity's function when creating the new
> 	links, and just create them whenever the subdev entity's function is either
> 	a lens controller or a flash. (Sakari)
> 
> Changes since v1:
> 
> 	- Added #ifdef guards for CONFIG_MEDIA_CONTROLLER
> 	- Some spelling and nomenclature cleanup (Laurent)
> 
> Changes since the rfc:
> 
> 	- None
> 
>   drivers/media/v4l2-core/v4l2-async.c | 31 ++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 0404267f1ae4..436bd6900fd8 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -275,6 +275,24 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>   static int
>   v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>   
> +static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> +					     struct v4l2_subdev *sd)
> +{
> +	struct media_link *link = NULL;
> +
> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +
> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
> +		return 0;
> +
> +	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> +
> +#endif
> +
> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
> +}
> +
>   static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>   				   struct v4l2_device *v4l2_dev,
>   				   struct v4l2_subdev *sd,
> @@ -293,6 +311,19 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>   		return ret;
>   	}
>   
> +	/*
> +	 * Depending of the function of the entities involved, we may want to
> +	 * create links between them (for example between a sensor and its lens
> +	 * or between a sensor's source pad and the connected device's sink
> +	 * pad).
> +	 */
> +	ret = v4l2_async_create_ancillary_links(notifier, sd);
> +	if (ret) {
> +		v4l2_async_nf_call_unbind(notifier, sd, asd);
> +		v4l2_device_unregister_subdev(sd);
> +		return ret;
> +	}
> +
>   	/* Remove from the waiting list */
>   	list_del(&asd->list);
>   	sd->asd = asd;

