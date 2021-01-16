Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E3F2F8E3F
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 18:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbhAPRWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 12:22:05 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:36877 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbhAPRWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 12:22:05 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B154B20006;
        Sat, 16 Jan 2021 17:21:21 +0000 (UTC)
Date:   Sat, 16 Jan 2021 18:21:40 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 06/13] media: atmel: Use
 v4l2_async_notifier_add_fwnode_remote_subdev helpers
Message-ID: <20210116172140.pgcqutr7athfydvb@uno.localdomain>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-7-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112132339.5621-7-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, Jan 12, 2021 at 10:23:32AM -0300, Ezequiel Garcia wrote:
> The use of v4l2_async_notifier_add_subdev is discouraged.
> Drivers are instead encouraged to use a helper such as
> v4l2_async_notifier_add_fwnode_remote_subdev.
>
> This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> should get a kmalloc'ed struct v4l2_async_subdev,
> removing some boilerplate code while at it.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/atmel/atmel-isc.h      |  1 +
>  drivers/media/platform/atmel/atmel-isi.c      | 46 ++++++-------------
>  .../media/platform/atmel/atmel-sama5d2-isc.c  | 44 ++++++------------
>  3 files changed, 29 insertions(+), 62 deletions(-)
>
>  	}
>

[snip]

>  	list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
> +		struct v4l2_async_subdev *asd;
> +
>  		v4l2_async_notifier_init(&subdev_entity->notifier);
>
> -		ret = v4l2_async_notifier_add_subdev(&subdev_entity->notifier,
> -						     subdev_entity->asd);
> -		if (ret) {
> -			fwnode_handle_put(subdev_entity->asd->match.fwnode);
> -			kfree(subdev_entity->asd);
> +		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> +					&subdev_entity->notifier,
> +					of_fwnode_handle(subdev_entity->epn),
> +					sizeof(*asd));
> +
> +		of_node_put(subdev_entity->epn);
> +		subdev_entity->epn = NULL;
> +
> +		if (IS_ERR(asd)) {
> +			ret = PTR_ERR(asd);
>  			goto cleanup_subdev;

The isc_subdev_cleanup() this label jumps to does not put the other
subdev_entity->epn

The issue was there already if I'm not mistaken. If I'm not, I think
it's worth recording it with a FIXME: comment while you're here

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>  		}
>
> --
> 2.29.2
>
