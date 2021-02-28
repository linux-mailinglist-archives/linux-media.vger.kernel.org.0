Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6C83271C3
	for <lists+linux-media@lfdr.de>; Sun, 28 Feb 2021 10:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhB1Jjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Feb 2021 04:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhB1Jj3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Feb 2021 04:39:29 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8306BC06174A
        for <linux-media@vger.kernel.org>; Sun, 28 Feb 2021 01:38:49 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id e9so8844357pjj.0
        for <linux-media@vger.kernel.org>; Sun, 28 Feb 2021 01:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uwPRDP6RNB29Cf6oAmI7WXPU+k3qJU+6ABg7bSwrX7o=;
        b=p7jDRXu9eNnjBy0yQ5YAmbnM7z2Z7rcmu+hZl1VEW4OTDWyB11q6US534GgfjDAj4s
         kf19p3z3NjMNgXBUeQ7mdYyKHYly2ckNlzfLnBO4fK4ZxAKdGSuFP8fmB8IKZDn6qOvw
         Hf214UkHQc+K/7NPbIG7tIbZhXuWDZf2g2nJPXwqmkXtuNvqZYfmtFS3UxBty5oPbHcM
         svarTkJAZGD9JUhTQibAwtmBb4JwteQ50WG8lhr68aOHMusr12DT/8an+hLLxtLpAMYR
         z7VnVmv//1pfeQ/HdVnRxqnu0T9ZIswiaNFbBcyQgYzSBdLvc3JTAIYGWXoaosYpkhVm
         0ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uwPRDP6RNB29Cf6oAmI7WXPU+k3qJU+6ABg7bSwrX7o=;
        b=G00JIxWd8G1tZH9qlapFZlGwBBQ6QJXzs6bgKorYuylj5TtTS6btC+Pxm9TgQKcFGo
         q8bw6GPK2mWmHVurwtYeqviwJ6dzpkRAmFml/EDfSNHkFgjn6sy5qjEjKkvvgD7XcOhF
         g3srciiD29wE8xzROyLQHCZt/hqQudGcuvsn7gv5sX+MpkV8Xy2z4/4AVoKa1YGdq46M
         rod24wv6Ivx+EL+Ai35PgQlCHsuyk4mg9I+dbj/vDWWYq3nUIg+MotDs98eojnVE4UHi
         rQKeVxixNt7za4LinKcd4dQK/uYicY0mziO06M1XGY/TpSFAdJRV+pbdnl7tGjT0mcRy
         7cyA==
X-Gm-Message-State: AOAM5330uONJ35+OxU/BmoIJHET0x8hpGo4Wwb1+jBzFL+M/bw90tULc
        g1YIvZXPnXmo7I1Q/miPFvdCFWqOD33GfWRO8NY+IZG1skkGgA==
X-Google-Smtp-Source: ABdhPJz137zhI6f6qiRTgXBHyegwz2RqsYlG39ANnA13/dMGOPrI+NEacCjs82C96j1T1qfm04AvBhpFukT8NUALDlY=
X-Received: by 2002:a17:902:70c7:b029:e3:71cf:33d2 with SMTP id
 l7-20020a17090270c7b02900e371cf33d2mr10640580plt.21.1614505128762; Sun, 28
 Feb 2021 01:38:48 -0800 (PST)
MIME-Version: 1.0
References: <CAK80=wMNP=1DPi=4G3ONxjLUm+5Kqv7YULcr85QHd85P_5aktA@mail.gmail.com>
In-Reply-To: <CAK80=wMNP=1DPi=4G3ONxjLUm+5Kqv7YULcr85QHd85P_5aktA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 28 Feb 2021 11:38:32 +0200
Message-ID: <CAHp75VftsNoroK3-fKaR5VGsbh-2dahPEM650+Sw880jPFD9dQ@mail.gmail.com>
Subject: Re: An unsupported UVC device
To:     Zhengyang Feng <zyfeng97@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Cc: maintainers / UVC maintainers


On Sat, Feb 27, 2021 at 12:04 PM Zhengyang Feng <zyfeng97@gmail.com> wrote:
>
> Dear maintainers,
>
> I'm resending this because the previous email was not clear and should
> be ignored. Sorry for the inconvenience caused.
>
> I was using HIK DS-U14 2K camera on Ubuntu 20.04 with built-in MIC
> (but it has only one USB cable) but it seems unsupported. It
> does not need a driver to be used on Windows (usable by just plugging
> in).
> I see no HIK devices on the support list
> (http://www.ideasonboard.org/uvc/), but when I run lsusb -d 2bdf:0281
> -v | grep "14 Video" it does output several lines like these:
>
> bFunctionClass         14 Video
> bInterfaceClass        14 Video
> bInterfaceClass        14 Video
> bInterfaceClass        14 Video
> bInterfaceClass        14 Video
>
> It also says "Couldn't open device, some information will be missing".
> But it does not require a driver to work on Windows, so it should be a
> normal UVC device right?
>
> I observed that it is not supported as a camera, because although I
> see /dev/video0 and /dev/video1 (quite odd since it is only 1 camera),
> it fails by either OpenCV (cv2.VideoCapture(id)) or `cheese`, where it
> says "cannot open by index" (I tried both video0 and video1).
> Then I got the logs with `cheese`, in the zip file attached. I think since the
> device is quite new on the market, maybe you guys haven't tested it.
>
> BTW, I installed the latest from
> https://git.linuxtv.org/media_build.git before I generated the logs.
> The camera shows same behavior before and after I installed the latest
> version. And the USB connection works fine (I can use other cameras on
> this machine), also the camera itself is fine (tested on Windows machines).
>
> Feel free to tell me this is unrelated to the project/this mailing
> list, in that case I'll just
> get another camera.
>
> --
> Yours sincerely,
> Zhengyang



-- 
With Best Regards,
Andy Shevchenko
