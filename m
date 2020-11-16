Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECE72B4BE0
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 17:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732349AbgKPQ6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 11:58:14 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38109 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730972AbgKPQ6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 11:58:14 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9B809E0014;
        Mon, 16 Nov 2020 16:58:11 +0000 (UTC)
Date:   Mon, 16 Nov 2020 17:58:14 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal EOS
Message-ID: <20201116165814.keyj2gydiodphiss@uno.localdomain>
References: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
 <20201112225147.1672622-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112225147.1672622-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Nov 12, 2020 at 11:51:46PM +0100, Niklas Söderlund wrote:
> When a subdevice signals end of stream stop the VIN in addition to
> informing user-space of the event.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index dca3ab1656a66cef..fcaf68c3428b80fd 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -969,9 +969,23 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
>  static void rvin_notify_video_device(struct rvin_dev *vin,
>  				     unsigned int notification, void *arg)
>  {
> +	const struct v4l2_event *event;
> +

Can this go inside the switch ?

>  	switch (notification) {
>  	case V4L2_DEVICE_NOTIFY_EVENT:
> -		v4l2_event_queue(&vin->vdev, arg);
> +		event = arg;
> +
> +		switch (event->type) {
> +		case V4L2_EVENT_EOS:

As there's only a case where this happen, this could be an if, but I
see a switch is consistent with the existing one. Up to you.

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> +			rvin_stop_streaming(vin);
> +			v4l2_info(&vin->v4l2_dev,
> +				  "Subdevice signaled end of stream, stopping.\n");
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		v4l2_event_queue(&vin->vdev, event);
>  		break;
>  	default:
>  		break;
> --
> 2.29.2
>
