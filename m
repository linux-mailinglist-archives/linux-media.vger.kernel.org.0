Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 897F0FE772
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 23:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfKOWNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 17:13:12 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:44325 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfKOWNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 17:13:12 -0500
Received: by mail-vk1-f195.google.com with SMTP id z19so773562vkb.11
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2019 14:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGwU0qPHQP1HYiOqJuwqUk6QFXXX99pg2ML2U8dDhKw=;
        b=Iv/h1GVOMr/eABCJWqQU9N0xcIr+qyrljL8rzXf0frGZ7unnixL2u47n03kNFfSB6a
         QwYy8ImVYpDEfi6IwSMbotg3LNmSMAJ74p5Lx2mT5Xp92aX4GPVrWtPec++2+4dnulrx
         G4Ud9NTIZdBT5cKR6673ru4vd51waQ2u2dafqgRW9pnA2oiq5s0clJJu/p5ybbl5SdaR
         zE8JKuVCjD3NVn1hjK21MkhXOel1sDOhk6+VZuMLvgAfrgFv9+t7Wv2Y/tScZF1lhMVk
         XcAfx/bnEn4v0YmnP39KhnYWgDw740aYVqVXCqHE4pDxIX0dEkZ6qkIKx6tCEwsaiVPk
         RxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGwU0qPHQP1HYiOqJuwqUk6QFXXX99pg2ML2U8dDhKw=;
        b=Kmc4v+XW9BaMwE/bcpnvxBb5IqNXx8BWUx0KMDsmlAeebms0TaxnkspohtzxOiceit
         rswEZb+jIyuP4aGFSoPrFj/wsAAqSFZj9HdWKdfSPsJiEcFsMi3WPq+80T2L5iSFPyLm
         0ZyYzBthHKEGRiaM0gcDdSCdiETsJq2zuDhrkFAHeW9GgZZ05GkdGNdFmKxirVqZQ67c
         xDPzDOMdoO/KB+4LExzpOw+SVVdif0puv/zEBwlpD6F2sCFZWBAHwFZ4XHVDHhhSTM9Z
         5VmrZd2Pi07hpIkcwisl8oWAiitjfUt6PhmwmYTWK5QV6HpPrAZBY8hduR3VM2GuKw3q
         fp5Q==
X-Gm-Message-State: APjAAAXAj5IsVgjAIY7xSWAZ5CAO8rKXrOl2i+cnTWKv1LsiEr/A7BwD
        Ex2ykmlWLZjcofUMz9ro4/ijsTqr1j0cvU2L7xU7kQ==
X-Google-Smtp-Source: APXvYqw0bsLPosodctF+Kq7/OaBHLLzY0B5e8kw29KZVvGzL7V6zb/L/eAgcFckW5g7EYIZMGIUKdCNgSpb27movLbM=
X-Received: by 2002:a1f:8dc5:: with SMTP id p188mr10063943vkd.13.1573855990961;
 Fri, 15 Nov 2019 14:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20191115161116.16304-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20191115161116.16304-1-dafna.hirschfeld@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 15 Nov 2019 19:12:59 -0300
Message-ID: <CAAEAJfCpszObksiU7uZcX2Aw=oiuYCMEUgxU_ZC1zBPq+soQaw@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-core: set sd->devnode = NULL if
 v4l2_device_register_subdev_nodes fails
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch!

On Fri, 15 Nov 2019 at 13:13, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> In case v4l2_device_register_subdev_nodes fails, sd->devnode is
> unregistered and then released. Therefore the field is set to
> NULL so that the subdev won't hold a pointer to a released object.
> This fixes a reference after free bug in function
> v4l2_device_unregister_subdev
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index 63d6b147b21e..468705c85e97 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -250,6 +250,7 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
>                 if (!sd->devnode)
>                         break;
>                 video_unregister_device(sd->devnode);
> +               sd->devnode = NULL;
>         }
>

You also need to clear devnode in v4l2_device_unregister_subdev, as we
discussed in IRC.
It would mean fixing a different issue that is triggered upon driver
removal/unbinding,
but it seems fine to address both issues as one: don't leave devnode
incorrectly defined.

Can you send a new version (and amend the commit description)?

Thanks,
Ezequiel
