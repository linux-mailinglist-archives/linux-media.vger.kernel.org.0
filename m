Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E0430357E
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 06:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731935AbhAZFnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:43:51 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34047 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726794AbhAYJjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 04:39:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3yJrlSq3WiWRg3yJulfgVM; Mon, 25 Jan 2021 10:38:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611567483; bh=cRKWCdXjPiL2XlpvqcIxZhxldG0a5KVzheRGT3caeDc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Tnw5b+5VU9gyfGumDmaJ59suhuJbeF8Qw8hHr8rQzUfeLpCtLr7gfVYCtQRWQdfwa
         2jAWacX95PAvpfOipK/W+XiRYtfBlDzoGuhmuS8Z+WWOrG2VLxqgchyPhfcKaecog8
         sClpY7Voh7IMRynN6yPN12CRZz7ORtkBoQQSQDhHRpMETHqxByUTAytdnaJnau+YjX
         rvHmPpakafKkPjrJxrKZQlkaKYNLpDBmLYBmPAt8bKnf4uL3HWs8PVK20Vbmd64rg3
         Nf9xNeEm6vA/GrXoRgwZ8UzG76jmSMUKY21miNOWR9ulShSj3E7eqt6GFeBYWLzyGS
         boGCeYwkF4iFg==
Subject: Re: [PATCH v2 3/4] rcar-vin: Stop stream when subdevice signal EOS
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
 <20210115002148.4079591-4-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9d24ffee-120b-51af-cce0-089b96e9e0ed@xs4all.nl>
Date:   Mon, 25 Jan 2021 10:37:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115002148.4079591-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPknFU8MCKRNfDUhfhxQLihWHdtq9q27KJxMMb610mH0m+9NbOeP3vn9tYMRh16RHRvFlolWtBZqXZ1RmOaPPDBWcndIXSEougffh7ibO54W/AzaDdwL
 dtkZzOnpKQE9Gkv5SkfzOGWiUDwu7thjcxljieTyBdOXww8q5z2g+p3zm9Zy2VaB8cVcjQzFv3LdE/xc+WGO3dEKIiWI0VuWsW7ep9sse/ayjPmiismj1nYu
 0DQEdNhc0CxpA9kPMOoXzNgmm/B1CR4F/SJQ/MecGFBgqxpn6GaOcPxkn+b3GcxmFDtonSfRAHP+6s8bxTWfnKxIKX4pncETb4EFwTvaB00=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/01/2021 01:21, Niklas Söderlund wrote:
> When a subdevice signals end of stream stop the VIN in addition to
> informing user-space of the event.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 457a65bf6b664f05..176eae2dd5151ac9 100644
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
> +			rvin_stop_streaming(vin);
> +			v4l2_info(&vin->v4l2_dev,

Can you make this v4l2_dbg to avoid polluting the kernel log?

Regards,

	Hans

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
> 

