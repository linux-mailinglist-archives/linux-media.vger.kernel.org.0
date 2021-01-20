Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C292FD062
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbhATMin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:38:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39500 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389008AbhATLP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 06:15:26 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DFE6813;
        Wed, 20 Jan 2021 12:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611141281;
        bh=HaJAvKcYlDmB9FAWVOPHs4uc5EfRItjpPBQei+OeaPw=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=BVoJI2RJSPQexw9hHn47EChZx4Ax/BYF9r3zHs8mFt0ZPpljlq+O0e7HmLQtYjYqE
         DO10pQFzi2ZSRLzvXitDspGcfRaJrsSvf2NHoWLigsqi2rLyK6o93uyrcqo1XbNBtm
         ZnAkQUgtRtAeIHZFtwGX6k25lAzzfJ38co+Np7Yc=
Subject: Re: [PATCH] media: v4l2-async: Safely unregister an non-registered
 async subdev
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20210107225458.4485-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <ec851753-b344-ea01-0551-7fb9ffa477bb@ideasonboard.com>
Date:   Wed, 20 Jan 2021 11:14:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107225458.4485-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 07/01/2021 22:54, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Make the V4L2 async framework a bit more robust by allowing to
> unregister a non-registered async subdev. Otherwise the
> v4l2_async_cleanup() will attempt to delete the async subdev from the
> subdev_list with the corresponding list_head not initialized.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 8bde33c21ce4..fc4525c4a75f 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -750,6 +750,9 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
>  
>  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  {
> +	if (!sd->async_list.next)
> +		return;

This is a bit opaque for anyone reading the code alone.

It could easily read as:

"If we don't have a following item in the async list - then don't
unregister?", which seems a bit nonsensical.

Hopefully that would make someone question what it's actually checking
but still.

I think I've seen you reference this pattern a couple of times so
perhaps having a way to check if a list is initialised would be worth
having as a helper in the list.

Otherwise, at least a comment to say that we're using the initialisation
of the list to determine if the async subdevice is already registered or
not. (perhaps a bit more briefly ;D)


Anyway, with that all in mind - I always like being able to simplify
error and clean up paths, so

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +
>  	mutex_lock(&list_lock);
>  
>  	__v4l2_async_notifier_unregister(sd->subdev_notifier);
> 

