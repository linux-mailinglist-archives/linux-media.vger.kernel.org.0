Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A548F4C6523
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 09:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbiB1I74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 03:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234114AbiB1I7y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 03:59:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112C33D1CC
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 00:59:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A025B61196
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 08:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989E4C340E7;
        Mon, 28 Feb 2022 08:59:13 +0000 (UTC)
Message-ID: <122d316e-0372-4845-2795-f782ebca78f9@xs4all.nl>
Date:   Mon, 28 Feb 2022 09:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 5/7] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-6-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220216130049.508664-6-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/16/22 14:00, Tomi Valkeinen wrote:
> All suitable subdev ops are now passed either the TRY or the ACTIVE
> state by the v4l2 core. However, other subdev drivers can still call the
> ops passing NULL as the state, implying the active case.
> 
> For all current upstream drivers this doesn't matter, as they do not
> expect to get a valid state for ACTIVE case. But future drivers which
> support multiplexed streaming and routing will depend on getting a state
> for both active and try cases.
> 
> For new drivers we can mandate that the pipelines where the drivers are
> used need to pass the state properly, or preferably, not call such
> subdev ops at all.
> 
> However, if an existing subdev driver is changed to support multiplexed
> streams, the driver has to consider cases where its ops will be called
> with NULL state. The problem can easily be solved by using the
> v4l2_subdev_lock_and_return_state() helper, introduced here.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  include/media/v4l2-subdev.h | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 8d089a2dbd32..84c02488d53f 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1278,6 +1278,44 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>   */
>  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>  
> +/**
> + * v4l2_subdev_lock_and_return_state() - Gets locked try or active subdev state
> + * @sd: subdevice
> + * @state: subdevice state as passed to the subdev op
> + *
> + * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
> + * NULL as the state parameter, as subdevs always used to have their active
> + * state stored privately.
> + *
> + * However, newer state-aware subdev drivers, which store their active state in
> + * a common place, subdev->active_state, expect to always get a proper state as
> + * a parameter.
> + *
> + * These state-aware drivers can use v4l2_subdev_lock_and_return_state() instead
> + * of v4l2_subdev_lock_state(). v4l2_subdev_lock_and_return_state() solves the
> + * issue by using subdev->active_state in case the passed state is NULL.
> + *
> + * This is a temporary helper function, and should be removed when we can ensure
> + * that all drivers pass proper state when calling other subdevs.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state)
> +{
> +	if (state)
> +		return state;
> +
> +	dev_notice_once(sd->dev,
> +		"The provided state is NULL. Adjusting to the subdev active state.\n"
> +		"Please consider porting your driver to the new state management API.\n");
> +
> +	state = sd->active_state;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	return state;
> +}
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /**
