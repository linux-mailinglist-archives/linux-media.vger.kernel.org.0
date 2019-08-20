Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E392957C5
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 09:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbfHTG6o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 02:58:44 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42231 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfHTG6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 02:58:44 -0400
Received: by mail-qk1-f193.google.com with SMTP id 201so3652257qkm.9;
        Mon, 19 Aug 2019 23:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ITcxFeUfft3Vy3lqyYXRJNfFN26pjyx3u+nCq4lWiI=;
        b=V/6LX+OBuZ+VT0e9FNNeFfX6QUGSuswjnano8FkMEcDZCClNMfbnrpW8HBJ52u9+Il
         aug0/B7XfRUX83BSKhpGHlp18gX9sHTHxAn1gPUMoJc8NOlv+99lR1vI/J35PfLWuJrv
         o/7rfgVBI64GoDXXYFbZ2hYKerb+bGNmWsILMkGQzJomR9hXF47f21oABdlQrqmrik8G
         8djfPwUKKLbkZpZd8/Y8nBpmFKMQ4zLUrcwzB+6TmuAuVkgFd/QAFWartId9BgF4UoaB
         uqU63mDdArinrHKKpwPM5IWA5gP1DqHJnAhrwxyc1yvMoKXzKIpGe7y+AZ7Zfk5WnvaH
         vb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ITcxFeUfft3Vy3lqyYXRJNfFN26pjyx3u+nCq4lWiI=;
        b=O8mA6b6jfDMEJ/VSTG2N9W2rsO0kTPTtJN1haG+2Reow6duuDRfk9ENG683gogcmlJ
         AHPxOSSlF/4Be8rGYhryRF8bo+uZ5oWcKlN3RLCQyj6HLpkTh3hXjmjAqtw6Q35tHdol
         7EjD2gy/B5c4sgNZJDtsIN6EUeuWmZtEBNxhO0RV0McLdWxkpZBH7D/BU0XX4xlgL9fo
         DupNGoYqLwnR9Rvt25KGx7hyxPYm+fsB6JxsUM1mom/IA1gxQQft693h+9ClxLmSXBQt
         30brnMIgipkgKjCGThoC8mh32J1ADsPVzJRAn8w9JnHlKt2b1gbdM+Xo0txEiCMUfKtl
         m7Xw==
X-Gm-Message-State: APjAAAUsc8NsEdBWSXGls+I7Yb09vbrgfYfJvgv6s2Kc9xY//7BfO6I9
        vs319EGeQ1LFoZLrBi5mW5RXQm/rmiXNjdpfnaU=
X-Google-Smtp-Source: APXvYqzfYV+/el5Zyv8lynvbgYzKRSUamEOHTPvdnWw2EyExZ+yIMr1iJ1b0XGHwbEBaLlhyhZ3QbekCSvAotE6alTY=
X-Received: by 2002:ae9:ea1a:: with SMTP id f26mr15938828qkg.13.1566284323678;
 Mon, 19 Aug 2019 23:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
 <e616d881-25e2-c295-2a98-b51c8cbcbc81@nextdimension.cc> <CALaQ_hqEZ-kco1esyB4mk0z9Q9Xt1XZsgYKR7gSdF7COERKoOA@mail.gmail.com>
 <eada38a3-258b-52ff-94a7-b8877899267e@kernel.org> <da6a1b65-cbe5-4e5e-d61c-43644a23da34@kernel.org>
In-Reply-To: <da6a1b65-cbe5-4e5e-d61c-43644a23da34@kernel.org>
From:   Nathan Royce <nroycea+kernel@gmail.com>
Date:   Tue, 20 Aug 2019 01:58:35 -0500
Message-ID: <CALaQ_hrPZ7LMBvuHnCLayxHoVFi5U0gtxF-33-ehR=phRs3D5A@mail.gmail.com>
Subject: Re: Kernel 5.2.8 - au0828 - Tuner Is Busy
To:     shuah <shuah@kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>, sean@mess.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While your mention of quirks-table.h certainly had possibilities, I'm
afraid adding the "AU0828_DEVICE(0x05e1, 0x0400, "Hauppauge",
"Woodbury")," entry for my tuner did not make any difference regarding
the "Tuner is busy. Error -19" message.

I don't know if this means anything, but I see
https://patchwork.kernel.org/patch/97726/ from 2010 which contains
changes for the 0x0400 model. I guess it never got pulled in.

Really, it's fine for me just to hang back at v5.1 for a year or two
until ATSC 3.0 USB tuners come out at a reasonable price.

On Mon, Aug 19, 2019 at 4:44 PM shuah <shuah@kernel.org> wrote:
> You said you make changes to the
>
> "Whenever I update my kernel, I edit the
> ./drivers/media/usb/au0828/au0828-cards.c file adding an entry for my
> 0x400 device.
> I've been doing it for years and it's been working fine... until now..."
>
> Please send me the changes you make to the file. I see the following
> WOODBURY devices. I am assuming you add 0x400 entry.
>
> { USB_DEVICE(0x05e1, 0x0480),
>                  .driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
>          { USB_DEVICE(0x2040, 0x8200),
>                  .driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
>
>
> There is another table in sound/usb/quirks-table.h for AU0828
> devices. In addition to 812658d88d26, 66354f18fe5f makes change
> to this table to add a flag. I see two entries in that table:
>
> AU0828_DEVICE(0x05e1, 0x0480, "Hauppauge", "Woodbury"),
> AU0828_DEVICE(0x2040, 0x8200, "Hauppauge", "Woodbury"),
>
> Since these drivers are now coupled doing resource sharing,
> could it be that with your change to au02828 device table,
> your changes are bow incomplete.
>
> I don't have a Woodbury device though. This is something to
> try.
>
> Did you consider sending patch to add your device variant,
> so you don't have to keep making this change whenever you
> go to a new kernel?
>
> thanks,
> -- Shuah
