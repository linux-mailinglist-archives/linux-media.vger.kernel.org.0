Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E0B357023
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 17:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241578AbhDGPYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 11:24:46 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49119 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234867AbhDGPX4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 11:23:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id UA1slSst3MxedUA1vlJ4En; Wed, 07 Apr 2021 17:23:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617809024; bh=V835Zuis8g0KN1/PbqNJgIcK9rU9HnEL/KvW9G7jRkE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iGiYshcSi8j52JDjPCDMafo1/Dg0F0ji/4LeUOzWHPmtqlW8abjTvhKV61DWK/4i7
         l6Yb0zFQ0dLJHlkm7jH3nVMS4+/FbW1BxCs9TPZGVrh27QEV54D5zqsQ2352feAp2P
         yh+zvYgFWI6Y4sYTj9TFaE6Cz8puuRV8jrnHzxy/Zw4HBUTxM2xMWkGrgr7wgSon2x
         hyfGbBm4hZZX744JKARmTcZZWLim+2OBQWltd1vNi9vDOQmph8CFe8GWhZ1+lu6XT8
         80aqYHNBkF57gQU6KD02QYyOhgNomfWfUCT+G9NuB5K6vUExIVultJ6i+0muyrNT6Q
         IpEozZ+lQjXMA==
Subject: Re: [PATCH 2/2] staging: media: omap4iss: align arguments with open
 parenthesis
To:     Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <475dbbe5774cbfed2d924807d8a3cfeb84b3d845.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <80d633de-180e-6b2c-e75b-7e32116a078e@xs4all.nl>
Date:   Wed, 7 Apr 2021 17:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <475dbbe5774cbfed2d924807d8a3cfeb84b3d845.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEwDytVfm5vNpNSS4TjLfMfSvUD9BZf125p9d/GxUwTj1wVtkk7Wog3PHClCRJhD3ywS0A/Lp3VKA9982nK6ZsH9LRf5T9sWWJdS77f47+ulwnFkyqo9
 +9YtjnKVnKLbaXLQrk9mAQCi4RvWxD3nwb1LyWiDI75x3zIZkaH7z02JFBvukLVBr6Ar2Lgv9/A9eSudi2tlHwUULRWo0AV3EZ4TgU2dlLCmtaH3BsIzGCJl
 +N5K8ylxFs3vV8SLmQ4t6pN+iYEuWib5unp6U8d5JYywzXbvJU+Qq/Bz/dlXF/HtdSxO2UWqcNAuPhaXz8+GaQh2jdXx9k8UBoI6QzlfhKmv4sRsnI/7JK5M
 q/JXgMMJxE9KAsQuuqPt3TMQhUcQ7kpk+t1iaorEJRonxOLqZKz/qJStwd/zGG8S7OQGB1C+pFq/lgVDYFbccZrNYhvJQUYBhIzHH9UkSq2CEyMv3i+NB3xM
 U3JulNUigFU0vzdg7KfjcFqauvEylvqDaTq0+Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Beatriz,

On 01/04/2021 17:07, Beatriz Martins de Carvalho wrote:
> Cleans up checks of "Alignment should match open parenthesis"
> in iss.c:96.

Looks good. I'll take this patch.

You can use this reference to record your contribution:

https://patchwork.linuxtv.org/project/linux-media/patch/475dbbe5774cbfed2d924807d8a3cfeb84b3d845.1617287509.git.martinsdecarvalhobeatriz@gmail.com/

The state will change to Accepted once it is merged in our media tree
here: https://git.linuxtv.org/media_tree.git/log/

Regards,

	Hans

> 
> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
> ---
>  drivers/staging/media/omap4iss/iss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index e8f724dbf810..472f1837632e 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -963,7 +963,7 @@ iss_register_subdev_group(struct iss_device *iss,
>  		}
>  
>  		subdev = v4l2_i2c_new_subdev_board(&iss->v4l2_dev, adapter,
> -				board_info->board_info, NULL);
> +						   board_info->board_info, NULL);
>  		if (!subdev) {
>  			dev_err(iss->dev, "Unable to register subdev %s\n",
>  				board_info->board_info->type);
> 

