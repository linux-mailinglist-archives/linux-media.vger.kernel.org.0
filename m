Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 399B9A52EF
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 11:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbfIBJgd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 05:36:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43463 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729612AbfIBJgd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 05:36:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id y8so13248794wrn.10;
        Mon, 02 Sep 2019 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=7S+vZhVc5zHeiLc/DC6Z2xOOWxBDBUvpp/e3pBI1NHw=;
        b=SdLltcIqfSTbhoDBqB0JMt9oUEV92Oj/pOU/Ob14cQsQPj+tVBpl3Rr/9U2efcxzSw
         G8V7L49e6FUh7X+XY0Pg/NAWU3hPUVh0bflsweMM8+44JIlZC41qyHKccjz9hEOHtKhY
         /QRuBI2cRf2dQ7DB1g4J4239lW7vLw2cgwLL1JxWT7n/w6icES8esjSDU3uL6EVcGoSN
         i+6J3BjMyq3zpw/INszfY/hWVYhfXhS323KJNFt4RJY0spsQRPWWQys/InPvU+ohDXba
         m9DYKI8EqZolY7g8hH/XWLgJB1E0iNyLz/UxqPT+3QFN1mecQQkw6V9VJz79skA3pCjJ
         44IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=7S+vZhVc5zHeiLc/DC6Z2xOOWxBDBUvpp/e3pBI1NHw=;
        b=kTeTp/Gqa93pdXOwdQdf8tZOneUqiqy0S8N4AreRpYJMK8KfyluKBUaA/evpMmA2SF
         3Z4H/cCubaBKTnKPKfHsg4R7ZxmJIKV295KdI69MfweSU72GYscLQXcLk5X3tXSXHzKX
         xpQ1LBGGzS1fKd33M5junwCxB+Y8prMJvPoxQvbVxDgUHALGW6zUYbixUoVACLAn8m9R
         Y3Grmean79Kx81ZD9K0u1NnPfpnT8v9t/mEBdXhDAxyALtO/P+NcU0oRJuhpMf0wo/is
         WVx/qU83edQvB3fu8/1Y/0654mRJzSteGuQk6As4OI7NSD4sb9Zcnvo25KFc6fDc3Bn1
         rdcA==
X-Gm-Message-State: APjAAAXk3hw1i+45Kl+vFbbYnds0UQoCF7dynRVF5DYDjIK4XKYtggnc
        C9IS+PEfJLXuC4zirtecYCXPPYK/gt8=
X-Google-Smtp-Source: APXvYqwnZx3UsFw9tXhL1LKY1pc0SI7+G9To5dGcweMEWFrJ8hdLdd2oaTaKuKhIo7cilHZxWPmycw==
X-Received: by 2002:adf:d187:: with SMTP id v7mr36485204wrc.33.1567416990962;
        Mon, 02 Sep 2019 02:36:30 -0700 (PDT)
Received: from arch-late (87-196-73-69.net.novis.pt. [87.196.73.69])
        by smtp.gmail.com with ESMTPSA id r6sm14586137wmf.0.2019.09.02.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 02:36:28 -0700 (PDT)
References: <20190805233505.21167-1-slongerbeam@gmail.com> <20190805233505.21167-15-slongerbeam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list\:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list\:ARM\/FREESCALE IMX \/ MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 14/22] media: imx7-mipi-csis: Create media links in bound notifier
In-reply-to: <20190805233505.21167-15-slongerbeam@gmail.com>
Date:   Mon, 02 Sep 2019 10:36:20 +0100
Message-ID: <m3d0gj59bf.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
Just to let you know that this series no longer apply clean after
your other series:
media: imx: Fix subdev unregister/register issues

And since you will need to send a new one, some notes...

On Tue 06 Aug 2019 at 00:34, Steve Longerbeam wrote:
> Implement a notifier bound op to register media links from the remote
> sub-device's source pad(s) to the mipi csi-2 receiver sink pad.
>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index f71d9183cad2..e03b2317a1ac 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -259,6 +259,12 @@ struct csi_state {
>  	bool sink_linked;
>  };
>
> +static inline struct csi_state *
> +notifier_to_csis_state(struct v4l2_async_notifier *n)
>

instead of adding this between structs declaration can you move it
down near the similar converter:

static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev *sdev)

and remove the inline since the compiler should do this and add
namespacing function name like the other functions, something like:

static struct csi_state * mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)

Just to coherency.

Other than this, looks good to me.

Cheers,
   Rui

> +{
> +	return container_of(n, struct csi_state, notifier);
> +}
> +
>  struct csis_pix_format {
>  	unsigned int pix_width_alignment;
>  	u32 code;
> @@ -863,6 +869,23 @@ static int mipi_csis_parse_endpoint(struct device *dev,
>  	return 0;
>  }
>
> +static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
> +				  struct v4l2_subdev *sd,
> +				  struct v4l2_async_subdev *asd)
> +{
> +	struct csi_state *state = notifier_to_csis_state(notifier);
> +	struct media_pad *sink = &state->mipi_sd.entity.pads[CSIS_PAD_SINK];
> +
> +	return media_create_fwnode_pad_links(sink,
> +					     dev_fwnode(state->mipi_sd.dev),
> +					     &sd->entity,
> +					     dev_fwnode(sd->dev), 0);
> +}
> +
> +static const struct v4l2_async_notifier_operations mipi_csis_notify_ops = {
> +	.bound = mipi_csis_notify_bound,
> +};
> +
>  static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
>  				 struct platform_device *pdev,
>  				 const struct v4l2_subdev_ops *ops)
> @@ -895,6 +918,8 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
>
>  	v4l2_async_notifier_init(&state->notifier);
>
> +	state->notifier.ops = &mipi_csis_notify_ops;
> +
>  	ret = v4l2_async_register_fwnode_subdev(mipi_sd, &state->notifier,
>  						sizeof(struct v4l2_async_subdev),
>  						&sink_port, 1,

