Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FD242A6FD
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237240AbhJLOS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237015AbhJLOS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:18:27 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65906C06161C
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:16:25 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aIZomsOPZx7rIaIZrmMJHw; Tue, 12 Oct 2021 16:16:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634048183; bh=rE26Onarf9mv0iwfowGou4R3SK1b8CimeNtaCDYdS2k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qL8BhOoVHUs4+xfbDZCN1Lc9uXBA8yW5rxbQPfZ6D3J54KWc/9TBbDy6nPQTQPrTh
         iJmhWP52L5Lyur5Jhoq3LOcMAl2+K4W9Li8rKr3A8bmvWm99Uz3kG65bb012nW2h3d
         lXOWDV/5EadM9vdXDpPBh+JxHa0hpcwDqUXKqKYB3Xx+5fnuzUXaHLPe4hQFgaKUDO
         Ob/Fiu6bXWhkW3xll8A/tB44xxdqihPYTmrCXmnbnp0KrbKfqzM4NjyVo/sjx0ugQd
         v2Od4V2+1xDoTD8gPEvw33yNEyyix8IYezk7vCac6Rnbn9rKd8K2gsMTlwdF0KDJrU
         6kLXdlyMVIM2Q==
Subject: Re: [PATCH v9 05/36] media: subdev: Add
 v4l2_subdev_validate_and_lock_state()
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-6-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c09d0bef-ad85-64aa-2165-beee40097e51@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:16:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-6-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMccAPxoo/cJ2XlHVICNbZb8sFgZmzxsTzhhBugul95SQKaL5OrvZJktr6YICEilvId1qiFpcb6iNO6R7sSj+bvPyvWtkSHSy1nr7aYer3GAxyk7zMBD
 pbBmmrW+ijvaUkGF/sJQgUP8OSh1PzShye/miyATLhVzGY36lwTbpfFbrJYTUpEd+fU8NGDKq2EreGb/QNVCvbcfccoE/js//sHwfWybtsCGuWhVPHHvanB5
 PkuK2frLgcd+3A5nxbKvv+G+B4esBlolMiz3eD/LWb++nVY9BtFO1Yhe2kEhX0abHqD8AouQNWruO+dd5buQaqy2+khfKPyqeQ/DFoxxpjyrR7n0ei8ZYF0P
 xR6tgHAe2iWIovZnRQvMRUDIvGHURRgpPuWWgWWlejcn4SPMyn9XC2vmsj/8yytX7nJy+3ZwQFW2p6PcaJ2ukYEJylgQy+HaoFxNV1eRRoVF8RBywlyJRGZJ
 5HQSHP09vgnWQku7j+1KIPAinMCEWzNMqcxz6g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
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
> v4l2_subdev_validate_and_lock_state() helper, introduced here.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a6e8f531a396..b75eeaee492b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1313,4 +1313,37 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>   */
>  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>  
> +/**
> + * v4l2_subdev_validate_and_lock_state() - Gets locked TRY or ACTIVE subdev

I think this name is confusing since it isn't validating anything.

I'd call it v4l2_subdev_lock_and_return_state().

Regards,

	Hans

> + *					   state
> + * @sd: subdevice
> + * @state: subdevice state as passed to the subdev op
> + *
> + * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
> + * NULL as the state parameter, as subdevs always used to have their active
> + * state stored privately.
> + *
> + * However, newer state-aware subdev drivers, which store their active state in
> + * a common place, subdev->state, expect to always get a proper state as a
> + * parameter.
> + *
> + * These state-aware drivers can use v4l2_subdev_validate_and_lock_state()
> + * instead of v4l2_subdev_lock_state(). v4l2_subdev_validate_and_lock_state()
> + * solves the issue by using subdev->state in case the passed state is
> + * NULL.
> + *
> + * This is a temporary helper function, and should be removed when we can ensure
> + * that all drivers pass proper state when calling other subdevs.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state)
> +{
> +	state = state ? state : sd->state;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	return state;
> +}
> +
>  #endif
> 

