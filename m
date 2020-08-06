Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2493E23D79E
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 09:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgHFHnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 03:43:01 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:52423 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727998AbgHFHm6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 03:42:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 3aY9k75OMuuXO3aYAknFvT; Thu, 06 Aug 2020 09:42:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596699775; bh=T4xmSgXs0W8ROOKjQGmNEDC52VAJozMGJbV9msYiY78=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sxoCuLkSAHsCrhGUN8kwQr4MgQGFYrWB2DLyVpXFkivfqUfIMRF3Axub2IzCkgVO3
         i4/o8PgBy5XbA9siZ34LPHqyzlG0rcziTwo96agHx3GCfoNlCSVL3JTmm1Q59UeeE7
         OaTeQHHtezPZr9n4kHLmlhmR3ZWa1Ps1M26leVB66FAyGAWIONWmxiu18PpPL3P4Jb
         hbDYpuGX4Kg5445iP1RsVDLeLVeqpJ0oIJvA3pOWMyXA/w4nn4y5u7T+c5tWaSAZ2O
         /uX6XofWEL7KesSYhtgBeRLO29o1RG2qiSurrhyi6Gptu5bN/hNgua/zfsmPI5z6Ay
         k6q5TvaPBNwRg==
Subject: Re: [PATCH V1] media: mc-device.c: change media_device_request_alloc
 to match media_ioctl_info
To:     frederic.chen@mediatek.com, hans.verkuil@cisco.com,
        laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
        matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com
References: <20200806072952.11709-1-frederic.chen@mediatek.com>
 <20200806072952.11709-2-frederic.chen@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4b1291c4-ee97-8ada-fa2c-3eb5ed22305b@xs4all.nl>
Date:   Thu, 6 Aug 2020 09:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806072952.11709-2-frederic.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOrGz3rAhHZCAaKgjiDYR2ekXp4TQjOJE+TmODTu53NnUKnI2WkbUL3u96jvhjAfRgG0gtyQoephVb46g6j0p2btiGqDXzrF9+GySKl3HRFIjJtPMB7W
 qu3P4GwP3E7L2lEI/Y0GaK8SYEI5KMI8UJB+OzAU64a/Mw067K6o4heiu8xuW46wccZIhdDSt4oRBpnDI5vEB6b2FwwlatIVYvO4PcWCxfbhABAzb1Smt2W2
 jk/OWrU82UCFeEt7PIc0WjYCoPFdQekx0sUv2jh5G8HN52IEOTUKuR9FWYyKHaHl7Bpmu8zWxNCuW2aaU52r3BNG8/j+pQ/7bImzKoMcL/bzl2vnDQeuIU5a
 uU/vlDwdeXOpeocMgKqdEZ3lnR3r53/rc8gKy9V96HDGGvi8IZrWs/XcG9NueXn2r2ZidwRdhYswaVyUiGuFzJhtvoeo1E4k9TCCxuAblNL6BtjjypwoxwiT
 edaovHKNoCPOd3qCawp+IzqkCIoWp7UZZqSev+zRq38QcXn7BMmb9ysjgPJgw01mA2qVEH9ldz4u2Kc1ioZLQweayu3ulPgx+zxiC6xt11WRIBttnDsSuqNu
 j3msTQY+9chXeMvlHUdj1X5VBosbO0r9S/nl6NkzN2Ahb4c8BADc9386LgNJnnLxVgYsouEvi5OzmLgJNLsWCmS/GOoFmu3h09Fz8zLrhwn/m1l4ioFHqS9d
 XH8M+05eUIcY1ozUs8wGXx5/d/w7zQkLysZWZEqlHVuyJec1HZrTi8Ka/CGfzwtyt/Z9IaNlMRcLtod7hCqOoF5asPg1n/utpDN7jXenpIVSlZXYFt56uQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/08/2020 09:29, frederic.chen@mediatek.com wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> We modified the type of media_device_request_alloc()'s second
> parameter from int* to void* so that it can match the interface
> defined in struct media_ioctl_info.
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> ---
>  drivers/media/mc/mc-device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index da8088351135..bc5b5ecb6581 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -370,9 +370,10 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
>  	return ret;
>  }
>  
> -static long media_device_request_alloc(struct media_device *mdev,
> -				       int *alloc_fd)
> +static long media_device_request_alloc(struct media_device *mdev, void *arg)
>  {
> +	int *alloc_fd = arg;
> +
>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (!mdev->ops || !mdev->ops->req_validate || !mdev->ops->req_queue)
>  		return -ENOTTY;
> 

This change is fine, but the reason this wasn't noticed before is the cast in
the MEDIA_IOC_ARG define:

#define MEDIA_IOC_ARG(__cmd, func, fl, from_user, to_user)              \
        [_IOC_NR(MEDIA_IOC_##__cmd)] = {                                \
                .cmd = MEDIA_IOC_##__cmd,                               \
                .fn = (long (*)(struct media_device *, void *))func,    \
                .flags = fl,                                            \
                .arg_from_user = from_user,                             \
                .arg_to_user = to_user,                                 \
        }

When assigning to .fn the func is cast to a specific function prototype.
Without that cast the compiler would have warned about the mismatch.

I see no reason for that cast, so drop that cast as well.

Regards,

	Hans
