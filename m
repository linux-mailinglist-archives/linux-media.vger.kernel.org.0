Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5954F6467
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 18:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237104AbiDFQFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 12:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237076AbiDFQFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 12:05:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4EC4C03D1
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 06:36:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFF10616AE
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 13:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CE7C385A3;
        Wed,  6 Apr 2022 13:36:40 +0000 (UTC)
Message-ID: <b3276db7-05fc-a79e-3fd7-10d25feb5bc6@xs4all.nl>
Date:   Wed, 6 Apr 2022 15:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 3/8] media: subdev: add v4l2_subdev_get_pad_* helpers
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
 <20220324080030.216716-4-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220324080030.216716-4-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 24/03/2022 09:00, Tomi Valkeinen wrote:
> The subdev state is now used for both try and active cases. We should
> rename v4l2_subdev_get_try_* helpers to v4l2_subdev_get_pad_*, but due
> to the size of that change lets add temporary wrapper helpers which can
> be used in drivers that support active state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  include/media/v4l2-subdev.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1bbe4383966c..b9587a265b32 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1042,6 +1042,16 @@ v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
>  	return &state->pads[pad].try_compose;
>  }
>  
> +/* Temprary helpers until v4l2_subdev_get_try_* functions have been renamed */
> +#define v4l2_subdev_get_pad_format(sd, state, pad) \
> +	v4l2_subdev_get_try_format(sd, state, pad)
> +
> +#define v4l2_subdev_get_pad_crop(sd, state, pad) \
> +	v4l2_subdev_get_try_crop(sd, state, pad)
> +
> +#define v4l2_subdev_get_pad_compose(sd, state, pad) \
> +	v4l2_subdev_get_try_compose(sd, state, pad)
> +
>  #endif
>  
>  extern const struct v4l2_file_operations v4l2_subdev_fops;
