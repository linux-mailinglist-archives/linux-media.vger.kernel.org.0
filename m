Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E076478A64
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 12:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233609AbhLQLtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 06:49:00 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:52003 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhLQLs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 06:48:59 -0500
X-KPN-MessageId: 3f55e5cf-5f2f-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 3f55e5cf-5f2f-11ec-8862-005056aba152;
        Fri, 17 Dec 2021 12:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=tckwF8RcpnViX/2kDCsmuwRjb6dsTiaKPfbJ6ayKI5g=;
        b=EgErXeHe8kLZwXmj9fuZ15xSEpTbBrdMadxZtbLwLJV89LKAZKNt0/iDVfqR8Dek6tmiSFSdloWOh
         c4CPA1vt+0QWJbj/j4nVTbF4hYngRI+LVO9uY1wiRK6c+Tfbg+PZt4UxBrajPKyGKF9Id7jqhShw3Y
         /kghC52cu7xds2Ryw9grZiKF7O3Rva25J2yjepHXF3sL3SfS1oXhjbt6jCshSMx6puHvVuiKPdCKF+
         AN2Oy13ggwlrKDxqbSH7cqWLz/rAUubXUFU1LM0ijVjfacvPlm3mHHJZ5MVOXpaaKslcQVqahDjDoI
         cxRBibf8dG1e8AiaNAAAjIpHyde6vBg==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|FemmsokKmIoYGodezII4Dp48pa1YBbzWwI21kT4u/rwz3yF6fFaH7LDXmEaYuLQ
 LO/6F10QUdEAbpP+xUIWD9g==
X-Originating-IP: 80.101.105.217
Received: from [192.168.1.10] (marune.xs4all.nl [80.101.105.217])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 511a4e97-5f2f-11ec-81f5-005056ab7447;
        Fri, 17 Dec 2021 12:48:57 +0100 (CET)
Message-ID: <66a7fd43-663a-a180-4ddf-82dc896d3e16@xs4all.nl>
Date:   Fri, 17 Dec 2021 12:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v10 05/38] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-6-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211130141536.891878-6-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/11/2021 15:15, Tomi Valkeinen wrote:
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
> ---
>  include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1810dde9c7fc..873bbe0686e3 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1317,4 +1317,35 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>   */
>  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>  
> +/**
> + * v4l2_subdev_lock_and_return_state() - Gets locked TRY or ACTIVE subdev state
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
> + * issue by using subdev->state in case the passed state is NULL.

Should be: by using subdev->active_state

With that change:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	hans

> + *
> + * This is a temporary helper function, and should be removed when we can ensure
> + * that all drivers pass proper state when calling other subdevs.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state)
> +{
> +	state = state ? state : sd->active_state;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	return state;
> +}
> +
>  #endif
> 

