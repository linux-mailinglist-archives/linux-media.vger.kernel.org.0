Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5910483411
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 16:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbiACPTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 10:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiACPTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 10:19:10 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DAAC061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 07:19:10 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id m21so138355277edc.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jan 2022 07:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QzOXYAPrOHI6DJqHkAqwAENqAKttxNki28hkFq8addA=;
        b=d7kXbj0o2vvZeffu031MAUN1wPRekiFa4ogbyv3aHdmcsv7qAw89uP4crSf+dNTh8K
         v6+mA3eVNyQOj1jFUzKGERFk5YsF4E0MFclNpey33vqlhh9+OWyImSTIedN2nha/h7Z4
         Y+2ZlFSSUiYIZx8y5W282nKFbkaki7kzxnkCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QzOXYAPrOHI6DJqHkAqwAENqAKttxNki28hkFq8addA=;
        b=6VZwd8QOvCldZDnXUKZFFmG6QGkEZ2UjWT0Nz0Ehn5oMUyq+MGTtLG07+NQHJ4tSPV
         8qbVWopfNes1zg38FeOQzhSQDg95xWbYEILRghl6X8BgNLLP/SnZ7ZiLIohzAhWTMnL/
         xD3X+LyEsEhCOqcjyjb5Xh6rnIL0+h6SwGqL1rAs7aeiqbcCFXpDUOn0OqLoGBy41RwT
         lApVZQF2E+ivPjyqW9b3KCyEBFwJSqOr32BVsiGsIJs9hxMdEj6ws/Qg56OnxpFljxaC
         jLnVjVMyHtxSsKwKLGQLGYgpMAKJRow1eSZgsgHxVlRctUxjeaRQzzAEtGphaE9DRclz
         vVfQ==
X-Gm-Message-State: AOAM5317Y2xac7f9A07+dvU7lCYQvExnSjUX1dxHNu6pm9YUA+OYpqrm
        sFd/42BA6FMZsyTSx+Un3TsVIuTKyYvZdw==
X-Google-Smtp-Source: ABdhPJzLpyzYhlj28G1WJEQg7OxYIsxdd4bdLQStV2ovKWaoIcTrmzNuqEYSS4uoW6pmQREBUsxVdA==
X-Received: by 2002:a17:907:a088:: with SMTP id hu8mr37206169ejc.56.1641223148842;
        Mon, 03 Jan 2022 07:19:08 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id f23sm10708825ejj.128.2022.01.03.07.19.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 07:19:08 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id n30so25068989eda.13
        for <linux-media@vger.kernel.org>; Mon, 03 Jan 2022 07:19:08 -0800 (PST)
X-Received: by 2002:a17:906:6848:: with SMTP id a8mr34602123ejs.40.1641223148061;
 Mon, 03 Jan 2022 07:19:08 -0800 (PST)
MIME-Version: 1.0
References: <06c00e24-cdad-8776-9fc1-2c0f3db5af9a@selasky.org>
 <CANiDSCtB=mu6wtZxkck3E0GnJT7OOVXKDe+yzEFK+ygsDwoxKg@mail.gmail.com> <d0090976-6d4d-ab15-dcdf-9352ed12fea7@selasky.org>
In-Reply-To: <d0090976-6d4d-ab15-dcdf-9352ed12fea7@selasky.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 3 Jan 2022 16:18:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCspxoJGMfaVL0eE0ob4NVuWyiMPmLV1osnLoTBOAMk7dg@mail.gmail.com>
Message-ID: <CANiDSCspxoJGMfaVL0eE0ob4NVuWyiMPmLV1osnLoTBOAMk7dg@mail.gmail.com>
Subject: Re: [PATCH] Make sure we parse really received data.
To:     Hans Petter Selasky <hps@selasky.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Fri, 31 Dec 2021 at 10:59, Hans Petter Selasky <hps@selasky.org> wrote:
>
> On 12/23/21 20:09, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > Thanks for your patch
> >
> > On Thu, 23 Dec 2021 at 16:42, Hans Petter Selasky <hps@selasky.org> wrote:
> >>
> >> Hi,
> >>
> >> USB control requests may return less data than we ask for.
> >> Found using valgrind and webcamd on FreeBSD.
> >
> > If the usb control request returns less data, then the checks for
> > ret!=size will trigger.
> >
> > Am I missing something obvious?
> >
>
> Hi,
>
> USB control transfers are allowed to be short terminated! But there is
> no flag to error out on short terminated control transfers, from what I
> can see. This is sometimes used for reading strings. You setup a fixed
> 255 byte buffer, and then simply issue the control read string request.
> The length you get back is the actual string length.
>
>  > If the usb control request returns less data, then the checks for
>  > ret!=size will trigger.
>
> Can you point in the code where this check is?


https://elixir.bootlin.com/linux/latest/source/drivers/media/usb/uvc/uvc_video.c#L281
and
https://elixir.bootlin.com/linux/latest/source/drivers/media/usb/uvc/uvc_video.c#L291
>
> --HPS
>
> > Best regards
> >
> >
> >>
> >> ==15522== Conditional jump or move depends on uninitialised value(s)
> >> ==15522==    at 0x662EF4: uvc_fixup_video_ctrl (uvc_video.c:135)
> >> ==15522==    by 0x662EF4: uvc_get_video_ctrl (uvc_video.c:297)
> >> ==15522==    by 0x6640B0: uvc_video_init (uvc_video.c:2078)
> >> ==15522==    by 0x65E79D: uvc_register_video (uvc_driver.c:2258)
> >> ==15522==    by 0x65E79D: uvc_register_terms (uvc_driver.c:2300)
> >> ==15522==    by 0x65E79D: uvc_register_chains (uvc_driver.c:2321)
> >> ==15522==    by 0x65E79D: uvc_probe (uvc_driver.c:2463)
> >> ==15522==    by 0x3C8F46: usb_linux_probe_p (linux_usb.c:449)
> >> ==15522==    by 0x75B4B2: main (webcamd.c:1021)
> >> ==15522==  Uninitialised value was created by a heap allocation
> >> ==15522==    at 0x4853844: malloc (in
> >> /usr/local/libexec/valgrind/vgpreload_memcheck-amd64-freebsd.so)
> >> ==15522==    by 0x3BC8A4: kmalloc (linux_func.c:1807)
> >> ==15522==    by 0x662C8C: uvc_get_video_ctrl (uvc_video.c:229)
> >> ==15522==    by 0x6640B0: uvc_video_init (uvc_video.c:2078)
> >> ==15522==    by 0x65E79D: uvc_register_video (uvc_driver.c:2258)
> >> ==15522==    by 0x65E79D: uvc_register_terms (uvc_driver.c:2300)
> >> ==15522==    by 0x65E79D: uvc_register_chains (uvc_driver.c:2321)
> >> ==15522==    by 0x65E79D: uvc_probe (uvc_driver.c:2463)
> >> ==15522==    by 0x3C8F46: usb_linux_probe_p (linux_usb.c:449)
> >> ==15522==    by 0x75B4B2: main (webcamd.c:1021)
> >>
> >> Signed-off-by: Hans Petter Selasky <hps@selasky.org>
> >> ---
> >>    drivers/media/usb/uvc/uvc_video.c | 6 +++++-
> >>    1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_video.c
> >> b/drivers/media/usb/uvc/uvc_video.c
> >> index 9f37eaf28ce7..6233703f9a50 100644
> >> --- a/drivers/media/usb/uvc/uvc_video.c
> >> +++ b/drivers/media/usb/uvc/uvc_video.c
> >> @@ -258,7 +258,11 @@ static int uvc_get_video_ctrl(struct uvc_streaming
> >> *stream,
> >>                          query == UVC_GET_DEF)
> >>                  return -EIO;
> >>
> >> -       data = kmalloc(size, GFP_KERNEL);
> >> +       /*
> >> +        * Make sure we parse really received data
> >> +        * by allocating a zeroed buffer.
> >> +        */
> >> +       data = kzalloc(size, GFP_KERNEL);
> >>          if (data == NULL)
> >>                  return -ENOMEM;
> >>
> >> --
> >> 2.34.1
> >
> >
> >
>


-- 
Ricardo Ribalda
