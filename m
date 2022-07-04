Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBD95651B4
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 12:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234044AbiGDKGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 06:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233949AbiGDKGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 06:06:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D497E31
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 03:06:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EFC43B80E63
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 10:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97C8C3411E;
        Mon,  4 Jul 2022 10:06:01 +0000 (UTC)
Message-ID: <7c9b222c-4189-7c97-945a-3db7a8f7ce87@xs4all.nl>
Date:   Mon, 4 Jul 2022 12:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] media: subdev: Add v4l2_subdev_call_state_try() macro
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
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



On 7/1/22 15:15, Tomi Valkeinen wrote:
> Add a helper macro for the situations where a non-MC driver needs to
> call a state-operation (operation which takes a subdev state as a
> parameter) in try-context in another subdev.
> 
> The macro allocates a new subdev state for the called subdev and frees
> the state afterwards.
> 
> An example use case is a media platform driver testing if a
> v4l2_subdev_format would be accepted by a source subdev.
> 
> This should not be used in MC drivers.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  include/media/v4l2-subdev.h | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index b661e1817470..9689f38a0af1 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1433,6 +1433,40 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  		__result;						\
>  	})
>  
> +/**
> + * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
> + *				takes state as a parameter, passing the
> + *				subdev a newly allocated try state.
> + *
> + * @sd: pointer to the &struct v4l2_subdev
> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> + *     Each element there groups a set of callbacks functions.
> + * @f: callback function to be called.
> + *     The callback functions are defined in groups, according to
> + *     each element at &struct v4l2_subdev_ops.
> + * @args: arguments for @f.
> + *
> + * This is similar to v4l2_subdev_call_state_active(), except that as this
> + * version allocates a new state, this is only usable for
> + * V4L2_SUBDEV_FORMAT_TRY use cases.
> + *
> + * Note: only legacy non-MC drivers may need this macro.
> + */
> +#define v4l2_subdev_call_state_try(sd, o, f, args...)                 \
> +	({                                                            \
> +		int __result;                                         \
> +		static struct lock_class_key __key;                   \
> +		const char *name = KBUILD_BASENAME                    \
> +			":" __stringify(__LINE__) ":state->lock";     \
> +		struct v4l2_subdev_state *state =                     \
> +			__v4l2_subdev_state_alloc(sd, name, &__key);  \
> +		v4l2_subdev_lock_state(state);                        \
> +		__result = v4l2_subdev_call(sd, o, f, state, ##args); \
> +		v4l2_subdev_unlock_state(state);                      \
> +		__v4l2_subdev_state_free(state);                      \
> +		__result;                                             \
> +	})
> +
>  /**
>   * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
>   *
