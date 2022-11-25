Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFE4638C4D
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 15:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbiKYOfr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 09:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiKYOfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 09:35:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F041631DD6;
        Fri, 25 Nov 2022 06:35:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2FC9B8298F;
        Fri, 25 Nov 2022 14:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5AAC433D6;
        Fri, 25 Nov 2022 14:35:35 +0000 (UTC)
Message-ID: <023c0d14-c3f1-4b59-4718-d2cf2bb4699f@xs4all.nl>
Date:   Fri, 25 Nov 2022 15:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 4/8] media: v4l: ctrls-api: Allow array update in
 __v4l2_ctrl_modify_range
Content-Language: en-US
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <1758f7525f6c8c602f36eef5e07a97ddfb1b548f.1669381013.git.vkh@melexis.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <1758f7525f6c8c602f36eef5e07a97ddfb1b548f.1669381013.git.vkh@melexis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> For V4L2_CID_TOF_TINT, which is dynamic array, it is required to use
> __v4l2_ctrl_modify_range.  So the idea is to use type_ops instead of u64
> from union. It will allow to work with any type.
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index d0a3aa3806fb..09735644a2f1 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -942,8 +942,6 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>  	case V4L2_CTRL_TYPE_U8:
>  	case V4L2_CTRL_TYPE_U16:
>  	case V4L2_CTRL_TYPE_U32:
> -		if (ctrl->is_array)
> -			return -EINVAL;
>  		ret = check_range(ctrl->type, min, max, step, def);
>  		if (ret)
>  			return ret;
> @@ -960,17 +958,10 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>  		ctrl->default_value = def;
>  	}
>  	cur_to_new(ctrl);
> -	if (validate_new(ctrl, ctrl->p_new)) {
> -		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> -			*ctrl->p_new.p_s64 = def;
> -		else
> -			*ctrl->p_new.p_s32 = def;
> -	}
> +	if (validate_new(ctrl, ctrl->p_new))
> +		ctrl->type_ops->init(ctrl, 0, ctrl->p_new);

Hmm, this sets *all* elements of the array to the default_value, not
just the elements whose value is out of range.

Is that what you want? Should this perhaps depend on the type of
control? I.e. in some cases it might make sense to do this, in other
cases it makes more sense to only adjust the elements that are out
of range.

How does that work for this TINT control?

Regards,

	Hans

>  
> -	if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> -		value_changed = *ctrl->p_new.p_s64 != *ctrl->p_cur.p_s64;
> -	else
> -		value_changed = *ctrl->p_new.p_s32 != *ctrl->p_cur.p_s32;
> +	value_changed = !ctrl->type_ops->equal(ctrl, ctrl->p_cur, ctrl->p_new);
>  	if (value_changed)
>  		ret = set_ctrl(NULL, ctrl, V4L2_EVENT_CTRL_CH_RANGE);
>  	else if (range_changed)

