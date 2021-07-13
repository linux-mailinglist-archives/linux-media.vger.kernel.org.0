Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC203C6816
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 03:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhGMBcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 21:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbhGMBcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 21:32:12 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD60C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 18:29:22 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t3so30762318edt.12
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 18:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=OOxh8WlUqDPYkCUCCUhxZLRBq1XONSESXR2p7q1HLSs=;
        b=vaW87OMHK4u62QjbsU5raswBFHwWj0E1OfLt3vkJ7uYJNhsrdqGbG5UMGM+6gyYiaD
         zWVNxII2mk1X3DaJdv3Asqze0v2nWZ8QjHeZA/GCtGbjme1gGkD6486CmK82y86AHt4W
         //elCoc8n5M/auA5DU5cmIo2h6iHa8VC7Bp8k7pX2op7WIXkndt7XrPyivlq0Ju51S5D
         FP7a1uoRWhjb28daETOo640qIM4pWs1VBeA7SkEzMmJAJEfBE0taIRQeQc/dFtz9JRBP
         WSM/qYLb5C+gfW8yvbvGqnpTj0b8EcQa3sLgf3qVjEda1i0D78Ov6S46NX3nsEBGeBLu
         DEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=OOxh8WlUqDPYkCUCCUhxZLRBq1XONSESXR2p7q1HLSs=;
        b=IsD1ALI3sXIGZ1hmGwOsKrXuemNh7dr5J7GGZJAd7/vsFVlBCzS4rMTUM/88JAaXx/
         T0ghSUwoHGcadq7rR1qRNQX+ciX7J+zsaAmDw2jAPVnfl5C4qGY5UNY6GXjxqW1/toBS
         +Q1WlQmp6w77I0iWqPGLUXRFso7FK4sXyDuOd7IE2s8JvtkJca6ISd+d71Tp1FnBEbDS
         +6PLOl1i+Vx/4lRqSl1eXWdODP2wmd/RviectOmD3NjHoOkXQpuCBJe9IyvlboTRJz1z
         R7/WKYeVPA3SzYtJscBXpfpe78LBGn556zi6w7q/Gn+b6a1aFbyON8rAGbUrV47d+V5V
         oflQ==
X-Gm-Message-State: AOAM533xCJjzrvh4CVCpUs+nU8c5Igv+lbJfH5mc7xCvQ9VaWKz2snCE
        z7ROksup6ISpYKzhffXDShb3Yub/kggb5ZnplwbweWFRYKc=
X-Google-Smtp-Source: ABdhPJxPj9oydrSnBu8U5pL9siQumRnaZO/kImQKehTHT1xMgKQuuN777Azy8zB/ngulXqgJHEZm9YyMja1bWXTe5Rc=
X-Received: by 2002:aa7:dc01:: with SMTP id b1mr2110835edu.239.1626139761217;
 Mon, 12 Jul 2021 18:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAOraNAaoHE9Xgfs0FNoMyKLP4Qd=FdsxaViJSkyuxf0j2rK5GA@mail.gmail.com>
In-Reply-To: <CAOraNAaoHE9Xgfs0FNoMyKLP4Qd=FdsxaViJSkyuxf0j2rK5GA@mail.gmail.com>
From:   Lucas <jaffa225man@gmail.com>
Date:   Mon, 12 Jul 2021 20:29:10 -0500
Message-ID: <CAOsVg8qHuia4nss+LxS+p1SLT2UvP9+pEErr=kU+4jvQ=n4tzA@mail.gmail.com>
Subject: Re: How do you capture (raw) VBI on Linux?
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I pieced this together myself, from Internet searches, in 2013:

Since (at that time at least) zvbi-ntsc-cc was ignoring null bytes the
time codes ended up being "significantly off," according to my
findings and those of the author of the program I've been using, I
switched completely to using it: https://github.com/codeman38/zvbi2raw

To use it to capture the raw VBI information, here's the command I use:
zvbi2raw -d /dev/vbi0 > file.vbi

Then, I convert it to a .srt file with ccextractor as you expected:
ccextractor -in=raw ./file.vbi -o ./file.srt

If you want to change the time offset in the .srt file, you can use a
program from the libsubtitles-perl package in debian (I didn't find it
in debian back then, so I compiled the source in its "subtitles-1.00"
directory).  The program is subs, and here's how it can be used to
subtract five minutes from every time in the .srt file (with -i, it
edits in-place, but keeps a (.bak) backup file of the previous
version, but I think repeating the command will lose your initial
version):
subs -i -b -5:00 file.srt

It took me a lot longer to figure out than it probably will with this
for you, but I didn't ask the mailing list. ;)

I hope that helps,

  Lucas


On Mon, Jul 12, 2021 at 6:21 PM Steven Zakulec <spzakulec@gmail.com> wrote:
>
> HI, I am writing to the Linux-media mailing list in hopes that someone
> can share how the /dev/vbi device can be captured from under Linux to
> disk so it can be processed back into captions.
>
> I've tried a long list of items (listed below), and the only success
> I've had under Linux is using old Hauppauge PVR (150 & 250) PCI cards,
> and extracting the embedded VBI data from those captures.
>
> I can successfully display closed captions on my Hauppauge HVR-950q
> USB device with "zvbi-ntsc-cc -d /dev/vbi0 -c" as long as I start a
> capture first in one terminal, then run that command in a second
> terminal, so I know that card works.
>
> With my Hauppauge HVR-950q, I've tried the following items:
> cat /dev/vbi (both before, during, and after a capture is started on the card
>
> Trying to use ffmpeg to capture /dev/vbi - unclear if this is even
> supposed to work, and if so, what the proper commands are
>
> I've tried using zvbi to capture the captions- at best, I can get the
> text dumped to a file, but no timestamps, or raw/sliced VBI that I
> could convert using ccextractor into a subtitle file.
> I had thought one of the commands below should work based on the
> descriptions from --help.
> zvbi-ntsc-cc -d /dev/vbi0 -r -C vbi.bin
> zvbi-ntsc-cc -d /dev/vbi0 -r -R -C vbi.bin
>
> I've tried some of the test tools in the zvbi source code test folder,
> but it's not entirely clear if they work with NTSC closed captions.
>
> I'm on Kubuntu 20.04 with kernel 5.4.0-77-generic.
>
> If anyone knows an application/device combination (any Linux OS),
> please let me know- this seems totally possible, I just can't figure
> out how to make it happen.
> Thank you in advance for any insights or guidance you can provide here.



-- 
Protect your digital freedom and privacy, eliminate DRM, learn more at
http://www.defectivebydesign.org/what_is_drm
On a related note, also see https://www.fsf.org/campaigns/surveillance
