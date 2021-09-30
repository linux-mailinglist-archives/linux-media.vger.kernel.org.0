Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3A941D614
	for <lists+linux-media@lfdr.de>; Thu, 30 Sep 2021 11:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349282AbhI3JQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Sep 2021 05:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348400AbhI3JQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Sep 2021 05:16:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A5BC06176A
        for <linux-media@vger.kernel.org>; Thu, 30 Sep 2021 02:14:20 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mVs8w-00027n-HB; Thu, 30 Sep 2021 11:14:18 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mVs8w-000206-7u; Thu, 30 Sep 2021 11:14:18 +0200
Date:   Thu, 30 Sep 2021 11:14:18 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] media: tc358743: implement pre_streamon to put all lanes
 into LP-11 state
Message-ID: <20210930091418.GC28226@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
        kernel@pengutronix.de
References: <20210923164332.18227-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210923164332.18227-1-p.zabel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:04:33 up 224 days, 12:28, 116 users,  load average: 0.12, 0.31,
 0.24
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 23 Sep 2021 18:43:32 +0200, Philipp Zabel wrote:
> If the connected MIPI CSI-2 RX driver uses the new pre_streamon subdev
> call, we don't have to reinitialize the CSI-2 TX after streamoff.
> Just put all lanes into LP-11 state during pre_streamon if requested.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/media/i2c/tc358743.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 3205cd8298dd..40eec67604e0 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -93,6 +93,7 @@ struct tc358743_state {
>  	struct v4l2_dv_timings timings;
>  	u32 mbus_fmt_code;
>  	u8 csi_lanes_in_use;
> +	bool pre_streamon_used;

Maybe a name in the device domain instead of the driver domain would be
better. For example, "csi_in_lp11".

>  
>  	struct gpio_desc *reset_gpio;
>  
> @@ -1637,8 +1638,10 @@ static int tc358743_get_mbus_config(struct v4l2_subdev *sd,
>  
>  static int tc358743_s_stream(struct v4l2_subdev *sd, int enable)
>  {
> +	struct tc358743_state *state = to_state(sd);
> +
>  	enable_stream(sd, enable);
> -	if (!enable) {
> +	if (!enable && !state->pre_streamon_used) {
>  		/* Put all lanes in LP-11 state (STOPSTATE) */
>  		tc358743_set_csi(sd);
>  	}
> @@ -1646,6 +1649,19 @@ static int tc358743_s_stream(struct v4l2_subdev *sd, int enable)
>  	return 0;
>  }
>  
> +static int tc358743_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> +{
> +	struct tc358743_state *state = to_state(sd);
> +
> +	/* Put all lanes in LP-11 state (STOPSTATE) if requested */
> +	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP)
> +		tc358743_set_csi(sd);
> +
> +	state->pre_streamon_used = true;

I think pre_streamon_used should only be set, if the MANUAL_LP flag is set.

Do we need to reset pre_streamon_used on streamoff (or maybe on streamon)?

Michael

> +
> +	return 0;
> +}
> +
>  /* --------------- PAD OPS --------------- */
>  
>  static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
> @@ -1840,6 +1856,7 @@ static const struct v4l2_subdev_video_ops tc358743_video_ops = {
>  	.g_dv_timings = tc358743_g_dv_timings,
>  	.query_dv_timings = tc358743_query_dv_timings,
>  	.s_stream = tc358743_s_stream,
> +	.pre_streamon = tc358743_pre_streamon,
>  };
>  
>  static const struct v4l2_subdev_pad_ops tc358743_pad_ops = {
> -- 
> 2.30.2
> 
> 
