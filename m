Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9DC33CF5D
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 09:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234159AbhCPIL0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 04:11:26 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:40659 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234222AbhCPILS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 04:11:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M4nIl0W2P4ywlM4nMlAC5O; Tue, 16 Mar 2021 09:11:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615882276; bh=96NIcOrlYv32B056kK+dN/BjH4lJaED1Wc9o9skwZx0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=blzt7slQ7VvwpWEMlUdGxL2BvQWamzxwbPZNXFWnPXNpljAdneE+Dji9UJInHANTZ
         Smw2Qt2IJK+/QhdlVSEBO+CPMywLal5yxUYSEQMobpVjvThiP7KwDEuDCQB3wDVVDK
         qrFkubdTjE96Rc1bR5E45Uz0yOxhLn3rZkAzfILNQsGWCex1VHCDptQ3iTFBneQaB0
         qVw+XVAGixTi8FNX3kZWbwJ2136/vpYGZ+Yd3O6Qay++m2dLjyxjMjOewJz8b2E5iz
         pCxGy+5dZWElHzRKS15ZIB5BxSdjNALvsUIRi0g0/2wG3H1cEAmZgmzsPB7KsboHLX
         p/HGqsGn2IYew==
Subject: Re: [PATCH v3 1/2] rcar-vin: Stop stream when subdevice signal EOS
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20210310164527.3631395-1-niklas.soderlund+renesas@ragnatech.se>
 <20210310164527.3631395-2-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5f769ff4-6fd9-fa2c-6f83-ae0013969f55@xs4all.nl>
Date:   Tue, 16 Mar 2021 09:11:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310164527.3631395-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCzwn8Z0UX4AYGDYjZfwX7/zDkHr0Yz3aFwJ90uW4UKkdmlYPr034WjpghsMmgtCDzRPyz4as56Ca4mt10tPUC1q4VMUNXTzoswG9pxzaJ7jSf5PPOmL
 g2qgPjpiRxSGOhnKBLzgzAiS/XzR2gj2NQ7ghXzFsHOnav2DWHdAmbGjZqVzyodE+YObwhcPWNGupF85/Eo7h0CsIB3kCnsL5F5Xb/EMTxMH4i0E2jp51o9C
 /6fPTjx8RuLeJxIBACg1HuYvxbVJtqCn7oLCEZUm1Kgq0whXmWuKnH+RzePlMddr87dRDvgnjC+J+xksxXrT7aDbpvVwyfX0xKQ0e3ly5U0YhHPcqBhHt3Ds
 o9IKTmmZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 10/03/2021 17:45, Niklas Söderlund wrote:
> When a subdevice signals end of stream stop the VIN in addition to
> informing user-space of the event.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> * Changes since v2
> - Log using vin_dbg() instead of v4l2_info().
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 457a65bf6b664f05..76f6f46799e95791 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -969,9 +969,23 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
>  static void rvin_notify_video_device(struct rvin_dev *vin,
>  				     unsigned int notification, void *arg)
>  {
> +	const struct v4l2_event *event;
> +
>  	switch (notification) {
>  	case V4L2_DEVICE_NOTIFY_EVENT:
> -		v4l2_event_queue(&vin->vdev, arg);
> +		event = arg;
> +
> +		switch (event->type) {
> +		case V4L2_EVENT_EOS:

This is not the right event for this. EVENT_EOS is specific to codecs and does
not signal an error condition.

I think we need a new event for this, I've seen similar situations with HDMI
receivers. The SOURCE_CHANGE event was (ab)used for that, but I think a new
event (V4L2_EVENT_XFER_ERROR?) should be created for these situations.

> +			rvin_stop_streaming(vin);

In addition to this you should call vb2_queue_error(), that's typically used
in situations where there is an unrecoverable transfer error.

Regards,

	Hans

> +			vin_dbg(vin,
> +				"Subdevice signaled end of stream, stopping.\n");
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		v4l2_event_queue(&vin->vdev, event);
>  		break;
>  	default:
>  		break;
> 

