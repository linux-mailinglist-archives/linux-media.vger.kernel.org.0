Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238FF10383A
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfKTLGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:06:03 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42160 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfKTLGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:06:03 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8C93528EE07
Message-ID: <dfaac47608a24f7b02e94cf9a490f9dfc8126493.camel@collabora.com>
Subject: Re: [PATCH v2] media: v4l2-core: set sd->devnode = NULL in
 v4l2_subdev_release
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, dafna3@gmail.com, helen.koike@collabora.com
Date:   Wed, 20 Nov 2019 08:05:54 -0300
In-Reply-To: <20191119175115.12385-1-dafna.hirschfeld@collabora.com>
References: <20191119175115.12385-1-dafna.hirschfeld@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-11-19 at 18:51 +0100, Dafna Hirschfeld wrote:
> The sd->devnode is release after calling this

s/release/released

> function. Therefore it should be set to NULL so that the
> subdev won't hold a pointer to a released object.
> This fixes a reference after free bug in function
> v4l2_device_unregister_subdev
> 

You could mention that this patch fixes a regression, either
in the commit description or in the commit title, or both.

I usually like to put the word "Fix" somewhere in the commit
title, as a hint to people backporting patches.

Something like "Fix subdev release ...".

Also, see below.

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> changes since v1: move the line to the funtion v4l2_subdev_release
> from the funtion v4l2_subdev_release
> 
>  drivers/media/v4l2-core/v4l2-device.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index 63d6b147b21e..2b3595671d62 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -177,6 +177,7 @@ static void v4l2_subdev_release(struct v4l2_subdev *sd)
>  {
>  	struct module *owner = !sd->owner_v4l2_dev ? sd->owner : NULL;
>  
> +	sd->devnode = NULL;
>  	if (sd->internal_ops && sd->internal_ops->release)
>  		sd->internal_ops->release(sd);
>  	module_put(owner);

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

The fix looks good. Interestingly, the devnode = NULL used to be here,
but then got removed when the internal_ops.release was introduced
in commit 0e43734d4c46e156785bb1d2acc5b3c10b7d5dd5.

This means:

Cc: stable@vger.kernel.org
Fixes: 0e43734d4c46e ("media: v4l2-subdev: add release() internal op")

Thanks,
Ezequiel

