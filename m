Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61BDC423850
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 08:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhJFGtP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 02:49:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57068 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhJFGtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 02:49:14 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 210C4581;
        Wed,  6 Oct 2021 08:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633502841;
        bh=fx3Vw0p+YnUK2vG34/jnsvKyq/5irjKbwuwWfVBuk+c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BbzxCAAq3x7brDrkvYULx5Hh/VTQo9mqnPmXkZYVaO1/3wXZCgicUCk5DAqgqS9SG
         kYrFaHeyFIT69rNUzsG6Gd6zeUF9zRMrr6TEKs9Whdpqpf1PwPmDzqq2hkW2iQ7o2e
         bf/W88CYOeSRBUNQuGR0Gf/Ic20hqEpfKhabpvXg=
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e9771096-00bd-5c46-00bd-49c806686937@ideasonboard.com>
Date:   Wed, 6 Oct 2021 09:47:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 05/10/2021 11:57, Tomi Valkeinen wrote:

> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 658106f5b5dc..5ba409db47ff 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -188,6 +188,61 @@ struct v4l2_subdev_capability {
>   /* The v4l2 sub-device video device node is registered in read-only mode. */
>   #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>   
> +/*
> + * Is the route active? An active route will start when streaming is enabled
> + * on a video node.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1 << 0)
> +
> +/*
> + * Is the route immutable, i.e. can it be activated and inactivated?
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1 << 1)
> +
> +/*
> + * Is the route a source endpoint? A source endpoint route refers to a stream
> + * generated internally by the subdevice (usually a sensor), and thus there
> + * is no sink-side endpoint for the route. The sink_pad and sink_stream
> + * fields are unused.
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		(1 << 2)

These are still not correct. They should be unsigned. But I realized we 
have _BITUL() for this purpose, so I'll change the uapi headers to use 
that macro.

  Tomi
