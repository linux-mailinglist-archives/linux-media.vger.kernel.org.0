Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D1E2FFEDD
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 09:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbhAVI6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 03:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbhAVI6F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 03:58:05 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8B7C0613D6
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 00:57:24 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id p18so3268523pgm.11
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 00:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Om1fWmk45UJnPODoi3J7JRR5hgr9TDBF5Ojj+VBLP+Q=;
        b=DQdwse1o8A4TFLSTf635UiaPyi6CNnDBdu5E/VRgybpjhBuPc82DnqYHZjg9t92Pzc
         UCF9pC7g/PGDlbtLtmLOdTiS8Tdhquzw4+i/E8QkV/k3FnXrSAHcDrBhxbByYv6RW/Xk
         rh1ZriX32mO6dzrqx8Bn4boIowsGWzV61/SfbmR07pY85OSd8cbypVBtAU7uRE71SPWP
         ZGvAgVm7e6EB80Mb9g20xsmyaq+xclF6iYsiqEgyJCVldiHH+6Ll4/6flPjuNvpwgBKy
         bYAQbRWKnEvkPf4yITKKlicI0Y8rb331KxOYB/Oq+WD6M3bsMFD9cDI0DmfkQoFKLUvq
         YVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Om1fWmk45UJnPODoi3J7JRR5hgr9TDBF5Ojj+VBLP+Q=;
        b=BlFxJ6ItQ0zif/0L6OV/ab0iI7JzFGzZzFBP92LLbK3KHte1LvlUigKcZUi5K3cqvi
         8N/HctJ9U9A4PFYIVLwQSYTvks2BAuQEONuxOX2AgZemPXlFQqvdgdp3CLgo1IwMYHVo
         bKGN0mkm4S5BWnTVfKQtnNdqDJofI3MW/dkqgpSmSkMnGT25x+h8nr5sn5C5xFqNaS0l
         //kCBDPpA/YEwFgssWjJ4K+W4UiWHWBdECgX/GnUgi2/hBnILKNlyBa4m0XGbHzAqZNd
         G1sr2LsxET3tB4NEQiKstu6LCyS4k5fccpUG9TmlQ0Tv8w7lBMoFJAedL59wvxC4Drqj
         HI1w==
X-Gm-Message-State: AOAM531Rx7NX4V0pXvPStrDQW/SHCoKhz3qW9RnNcMDbO3zGzqQvdFAv
        sN8LLzvVA2XZfWWGuOj0aDBXIOhWIkw5ewqi5uYgBg==
X-Google-Smtp-Source: ABdhPJz+NkTbQB3eSzWRE6o4dt43ME127orJ75xc5hTZL4LE30MLU3ITXQSmDnFKbpmkkVpVgOnCehiaM5NJZfbh6HM=
X-Received: by 2002:a62:8895:0:b029:19e:92ec:6886 with SMTP id
 l143-20020a6288950000b029019e92ec6886mr3763217pfd.12.1611305844294; Fri, 22
 Jan 2021 00:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20210121202855.17400-1-tiwai@suse.de>
In-Reply-To: <20210121202855.17400-1-tiwai@suse.de>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 22 Jan 2021 09:57:13 +0100
Message-ID: <CAG3jFyu5RWvbxkiLHXtijGuXChBoKy-kPv38qk-_h9ir8u=ybg@mail.gmail.com>
Subject: Re: [PATCH] media: pwc: Fix the URB buffer allocation
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the patch, it all looks good to me.

Feel free to add my r-b:
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 21 Jan 2021 at 21:34, Takashi Iwai <tiwai@suse.de> wrote:
>
> The URB buffer allocation of pwc driver involves with the
> dma_map_single(), and it needs to pass the right device.  Currently it
> passes usb_device.dev, but it's no real device that manages the DMA.
> Since the passed device has no DMA mask set up, now the pwc driver
> hits the WARN_ON_ONCE() check in dma_map_page_attrs() (that was
> introduced in 5.10), resulting in an error at URB allocations.
> Eventually this ended up with the black output.
>
> This patch fixes the bug by passing the proper device, the bus
> controller, to make the URB allocation and map working again.
>
> BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1181133
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/media/usb/pwc/pwc-if.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
> index 61869636ec61..d771160bb168 100644
> --- a/drivers/media/usb/pwc/pwc-if.c
> +++ b/drivers/media/usb/pwc/pwc-if.c
> @@ -461,7 +461,7 @@ static int pwc_isoc_init(struct pwc_device *pdev)
>                 urb->pipe = usb_rcvisocpipe(udev, pdev->vendpoint);
>                 urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
>                 urb->transfer_buffer_length = ISO_BUFFER_SIZE;
> -               urb->transfer_buffer = pwc_alloc_urb_buffer(&udev->dev,
> +               urb->transfer_buffer = pwc_alloc_urb_buffer(udev->bus->controller,
>                                                             urb->transfer_buffer_length,
>                                                             &urb->transfer_dma);
>                 if (urb->transfer_buffer == NULL) {
> @@ -524,7 +524,7 @@ static void pwc_iso_free(struct pwc_device *pdev)
>                 if (urb) {
>                         PWC_DEBUG_MEMORY("Freeing URB\n");
>                         if (urb->transfer_buffer)
> -                               pwc_free_urb_buffer(&urb->dev->dev,
> +                               pwc_free_urb_buffer(urb->dev->bus->controller,
>                                                     urb->transfer_buffer_length,
>                                                     urb->transfer_buffer,
>                                                     urb->transfer_dma);
> --
> 2.26.2
>
