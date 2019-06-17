Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC684832C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 14:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFQMxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 08:53:55 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55911 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726028AbfFQMxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 08:53:54 -0400
Received: from [IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc] ([IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cr8whuvNH5qKacr8xhWxwg; Mon, 17 Jun 2019 14:53:52 +0200
Subject: Re: [PATCH v7 0/3] media: v4l2-subdev: Verify arguments in
 v4l2_subdev_call()
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190520212747.368-1-jmkrzyszt@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4e2951b6-2fa7-c0c0-9c3c-85a6b04c3691@xs4all.nl>
Date:   Mon, 17 Jun 2019 14:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520212747.368-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBSmRzw+70wJnkv0H2WIQ8akfhoXjb1lZzw4t7GNm4BMPzwyLgzgqgx+Fg4vk9x6UDtuL0Z3lkS4K+H+n3yqFYU5+Sjrtg8c/2DCDo9W1/MAnMm5YA+l
 keekHiLcWJD68JQX+/OBTCB2l5Lpn0Dg1q68uCSVApyw5vitFXjQyUVxSQW0h9CyWRhewJgFTbhiFUClStK4zB5W1ha9+Fy2CoNYKgHFPnUjnh9TIDII8MYa
 t4dg6jTzRi0vkkK3qBMeEIGLULLbddKGxeXhpLTc+XRGAZPOI8M5I3wcmzNbZbQWgN3dOMGZO9jsx/UVc2yCPrddweLVsdsbs8AV1Ay92I6p/DYy1W4OtoKA
 ou4BAU7S2lMw6tyogCb39iNwY2tH4ZfR+OW/imBdz5i0365azoIpGAApPwuGsYKMMftejhCZtGHmprCssdOkX4jfnkgd9g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari,

Are you OK with this series? Please Ack if that's the case, so that I can
merge it.

Regards,

	Hans

On 5/20/19 11:27 PM, Janusz Krzysztofik wrote:
> Correctness of format type (try or active) and pad ID parameters passed
> to subdevice operation callbacks is now verified only for IOCTL calls.
> However, those callbacks are also used by drivers, e.g., V4L2 host
> interfaces.
> 
> Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
> macro while calling subdevice operations, move those parameter checks
> from subdev_do_ioctl() to v4l2_subdev_call().  Also, add check for
> non-NULL pointers, including pad config if V4L2_SUBDEV_FORMAT_TRY is
> requested.
> 
> Having that done, we can avoid taking care of those checks inside
> drivers.
> 
> Janusz Krzysztofik (3):
>   media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
>   media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
>   media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 268 +++++++++++++++++---------
>  include/media/v4l2-subdev.h           |   6 +
>  2 files changed, 188 insertions(+), 86 deletions(-)
> 
> Changelog:
> v6->v7:
> Changes suggested by Sakari - thanks!
> - never succeed pad check on media entities with pad_num == 0,
> - allow pad 0 on subdevies not registered as media entities.
> 
> v5->v6:
> - rename wrappers to call_something() as suggested by Sakari - thanks!
> - make check_ functions inline - also on Sakari's suggestion, thanks!
> - drop patch 2/4 and remove WARN_ONs from remaining patches to avoid
>   kernel WARNs on non-kernel bugs - thanks Hans for pointing this out!
> 
> v4->v5:
> - a few coding style and code formatting changes,
> - require CONFIG_MEDIA_CONTROLLER, not CONFIG_VIDEO_V4L2_SUBDEV_API,
>   for a valid pad ID check,
> - perform pad ID check only if at least one pad is configured so
>   drivers which don't configure pads are not affected if built with
>   CONFIG_MEDIA_CONTROLLER defined,
> - issue kernel warnings on invalid parameters (new patch - 2/4),
> - validate pointers before using them (new patch - 3/4).
> 
> v3->v4:
> - fix 'struct' keyword missing from patch 2/2,
> - fix checkpatch reported style issue in patch 2/2
> Sorry for that.
> 
> v2->v3:
> - add patch 2/2 with pad config check,
> - adjust continuation line alignments in patch 1/2 to match those
>   used in 2/2.
> 
> v1->v2:
> - replace the horrible macro with a structure of wrapper functions;
>   inspired by Hans' and Sakari's comments - thanks!
> 

