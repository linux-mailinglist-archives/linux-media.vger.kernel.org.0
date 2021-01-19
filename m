Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC2A2FC0D1
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729433AbhASUVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:21:03 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33740 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729132AbhASSxe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:53:34 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 165C11F44B94
Subject: Re: [PATCH v2 06/14] media: cadence: Use
 v4l2_async_notifier_add_fwnode_remote_subdev
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20210118015258.3993-1-ezequiel@collabora.com>
 <20210118015258.3993-7-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <78612d15-f144-5fb5-023d-691f363990ef@collabora.com>
Date:   Tue, 19 Jan 2021 15:52:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118015258.3993-7-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
> The use of v4l2_async_notifier_add_subdev will be discouraged.
> Drivers are instead encouraged to use a helper such as
> v4l2_async_notifier_add_fwnode_remote_subdev.
> 
> This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> should get a kmalloc'ed struct v4l2_async_subdev,
> removing some boilerplate code while at it.
> 
> Use the appropriate helper v4l2_async_notifier_add_fwnode_remote_subdev,
> which handles the needed setup, instead of open-coding it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index be9ec59774d6..7d299cacef8c 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -81,7 +81,6 @@ struct csi2rx_priv {
>  	struct media_pad		pads[CSI2RX_PAD_MAX];
>  
>  	/* Remote source */
> -	struct v4l2_async_subdev	asd;
>  	struct v4l2_subdev		*source_subdev;
>  	int				source_pad;
>  };
> @@ -362,6 +361,7 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
>  static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  {
>  	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
> +	struct v4l2_async_subdev *asd;
>  	struct fwnode_handle *fwh;
>  	struct device_node *ep;
>  	int ret;
> @@ -395,17 +395,13 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  		return -EINVAL;
>  	}
>  
> -	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_port_parent(fwh);
> -	csi2rx->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	of_node_put(ep);
> -
>  	v4l2_async_notifier_init(&csi2rx->notifier);
>  
> -	ret = v4l2_async_notifier_add_subdev(&csi2rx->notifier, &csi2rx->asd);
> -	if (ret) {
> -		fwnode_handle_put(csi2rx->asd.match.fwnode);
> -		return ret;
> -	}
> +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi2rx->notifier,
> +							   fwh, sizeof(*asd));
> +	of_node_put(ep);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>  
>  	csi2rx->notifier.ops = &csi2rx_notifier_ops;
>  
> 
