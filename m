Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644725A4308
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 08:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiH2GOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 02:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbiH2GO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 02:14:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9964649B4C
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 23:14:25 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE365481;
        Mon, 29 Aug 2022 08:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661753664;
        bh=k9qu5vt1kK1iGClPtvEtvCSbZ7GvGG6vbb035yEWVps=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZvBPE/6QoSNCzz5H/rsKHrQSLJmhqU7rjjyZVr+FiVwVCBcmwzPN0/SOgg6QN4P8L
         7IByrGvb8/dUZpjysZ3UirEsU3ilo3WDvIGaf2ped2b/om0TyGBtc8VP9eW7C67sju
         WDJtNhSk2nt6O6oUTeMNgGqu1uL4OmbdjZELD388=
Message-ID: <8047c693-d71c-8427-564e-154cadf54182@ideasonboard.com>
Date:   Mon, 29 Aug 2022 09:14:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] v4l: subdev: Fail graciously when getting try data
 for NULL state
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
References: <20220826115631.3243890-1-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220826115631.3243890-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/08/2022 14:56, Sakari Ailus wrote:
> The state argument for the functions for obtaining various parts of the
> state is NULL if it is called by drivers for active state. Fail graciously

Only for drivers that do not use active state. Which is most of them at 
the moment.

> in that case instead of dereferencing a NULL pointer.
> 
> Suggested-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   include/media/v4l2-subdev.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 9689f38a0af1f..ec1896886dbd6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1046,6 +1046,8 @@ v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
>   			   struct v4l2_subdev_state *state,
>   			   unsigned int pad)
>   {
> +	if (WARN_ON(!state))
> +		return NULL;
>   	if (WARN_ON(pad >= sd->entity.num_pads))
>   		pad = 0;
>   	return &state->pads[pad].try_fmt;
> @@ -1064,6 +1066,8 @@ v4l2_subdev_get_pad_crop(struct v4l2_subdev *sd,
>   			 struct v4l2_subdev_state *state,
>   			 unsigned int pad)
>   {
> +	if (WARN_ON(!state))
> +		return NULL;
>   	if (WARN_ON(pad >= sd->entity.num_pads))
>   		pad = 0;
>   	return &state->pads[pad].try_crop;
> @@ -1082,6 +1086,8 @@ v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
>   			    struct v4l2_subdev_state *state,
>   			    unsigned int pad)
>   {
> +	if (WARN_ON(!state))
> +		return NULL;
>   	if (WARN_ON(pad >= sd->entity.num_pads))
>   		pad = 0;
>   	return &state->pads[pad].try_compose;

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
