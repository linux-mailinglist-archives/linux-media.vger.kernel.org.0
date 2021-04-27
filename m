Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD0936C8E3
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 17:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237894AbhD0Pw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 11:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhD0PwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 11:52:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C255C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 08:51:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 12so94160137lfq.13
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 08:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=McWAkcVwrA6Ykc6YbmSu7yIpHv0FzUYyiEUg6mICoPM=;
        b=ApLpnWicUJNRWBiEzBCc5bP7X3AIJ+PlYFB7vzx/1xrbxO8oySup3WBHgBAvuEaAL6
         bcRmyRBD92tey8/68bo6LoqryopgHjcytYdVIbVpJFX+hMNzPXcIey+qDP0qzOuBrBdW
         5tB7ye1pfZdnZP6wIK6Q7fLI/kYLRBNIe/1O2Qrr/VJLTz1dKlSlxqzWZVlCSExOcdPW
         h7nPfdh9O2bFm4Kc3FBBCzBBdEhYFlee+QMnXjwyVb96YnttuphdffrTW87MmnVZJf4X
         RsxbiBtbqdJYNikW/v+DtD0YKIxX7BRqiTWO1xztD51eTQhvsgA5x3c9+rxrkNNsE6XK
         5j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=McWAkcVwrA6Ykc6YbmSu7yIpHv0FzUYyiEUg6mICoPM=;
        b=FayWzGHDNlQi5DoAs1b4JdijWcUWMaQDpHK6vDYsYOtg8hNnWQPv0BCZb7Y0QJ0Dxc
         SeIArD9sQ2lCmx2+RgLRnNXcly61C+Gr2a2pX6Wn5q9v0b+6Yx+3OaYPtYTbWv91RH5S
         gM2lGWVbaXp+UIgHOnFY627XmpB6ClpfnhXYIHkPi4NEqbtZYWV/srs3uBh89CYydUNZ
         9NGf/waH85Afzpu7Iz9YY8CpuLuaI8OvutJo8+f8DwcVo0DPoiq2V8AAFo9A5+bWWLMf
         Gqr7Ckrkp9xVw5BFn/MC7ZoYkt3jHsW+FPVIY7ANqhHnSXnROXtPPKocsKn1ljKRt89V
         ZdNw==
X-Gm-Message-State: AOAM5339M0p7b/lX5luK4N+2dLArM02nh6Ka6VE2SmPWcio6ZIE5bxRo
        37XMsAkx29I8gCh2buclPGNflIansG4F6MqB/xw=
X-Google-Smtp-Source: ABdhPJzAY1xaRfZKqfxETobopBDSaxtpFrhPl9Bvlo6cgS4eg2lCuw4skd45KmVHrZ19Hk7r7mTFzy1gig3/ngRGDJU=
X-Received: by 2002:a19:c391:: with SMTP id t139mr2158083lff.295.1619538700889;
 Tue, 27 Apr 2021 08:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
 <CAJ+vNU09LC1i_-HzybPSy02DY5x-JNfMrO9wPMsb5BSK0ofEYg@mail.gmail.com>
In-Reply-To: <CAJ+vNU09LC1i_-HzybPSy02DY5x-JNfMrO9wPMsb5BSK0ofEYg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 27 Apr 2021 12:51:29 -0300
Message-ID: <CAOMZO5DJ0Y5CaeBLanQssqsb6fA5ma+B363g=d33BPb9+me3wQ@mail.gmail.com>
Subject: Re: adv7280: Scrolling images on imx6
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Tue, Apr 27, 2021 at 12:20 PM Tim Harvey <tharvey@gateworks.com> wrote:

> Fabio,
>
> GStreamer does not use the g_skip_frames feature as far as I know. If
> it did then we likely wouldn't need Steves patch
> https://github.com/Gateworks/linux-imx6/commit/959fbd4. His commit
> explains the issue pretty well and yes, this should be mainlined in my
> opinion unless someone presents a more proper way to handle it.

Yes, I have submitted Steve's patch to the list.

> The proper way to set the video standard (PAL vs NTSC) is 'v4l2-ctl
> --device /dev/v4l-subdev2 --set-standard PAL' (on the proper subdev of
> course).

Thanks, Frieder gave me the same suggestion and it worked.

> The https://patchwork.kernel.org/project/linux-media/patch/20190827215539.1286-1-mmichilot@gateworks.com/
> patch is only needed if you are using adv7280 which I thought you
> mentioned you were at some point. I still don't have a solution for
> that other than add a kernel module parameter or something.

Ops, sorry. The chip I am using is in fact an ADV7280 connected to the
CSI parallel bus.

I didn't apply Matthew's patch and I am getting a good quality image though.

What is the problem you notice when not applying this patch?

Thanks
