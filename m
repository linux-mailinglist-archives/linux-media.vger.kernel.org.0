Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37F13C68EA
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 05:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhGMDmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 23:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhGMDmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 23:42:10 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4AEC0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 20:39:21 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id r132so32540736yba.5
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 20:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8SHhR+jRpjVf9VaJ4Q/uKFviy9BGEAn0UEBxCFsuAxA=;
        b=Afz2A79WOQ1g+t6BpyPtos+HHOQmP1wvlLbsfw2u5RPtQKfLrR6SH4rrlUGXBTZ2E6
         te2ftZJyvLxu09/i/quAH9Hf8zawuR130zrZFoXZFvgCfoH89gkaqtuPeKLEX4itJuA+
         ioJQsUiXx2D7ylg7Qy6TWPXhCARvl1vG1OWn/qg5W9hM0Uh6tulOUmcRShPQjqMCDvK+
         RGPrKbHHSkz3wPillVKMsp55NS0MuFyYZj0IvZWOirWvguQyzozFBnY528a71oVodW0O
         hkd6Ewzt//tC6dFLd1uRv84pxTMqklTL90EcMIoyxapxjHBGvRpOxSVgfi+COaljfCdd
         oufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8SHhR+jRpjVf9VaJ4Q/uKFviy9BGEAn0UEBxCFsuAxA=;
        b=D2kLqJWbLBR2BtIDWr78p0Am63sTV35atX49z4I0pPl5OHzfROjexqrjKEuSEf2oiC
         LWHhEkO0SXSYcyWtHW4i+ZeX5kJLUxrqb5LVo71DduYsj0uWP7/w25iHsOd1LOfR3ldV
         GdV6gFBlPvTZ3emmL/0MeGF2a/wejeskRxHBQpKA5eDjqOBlJ5ghytqRo5gzhObwmv/Z
         KB4FGr/rnVRai0cE6LON7Zul3aIl8Mkc6fzxlrqb2lKn+I/hhGDHlGb3Dm1yZ3WlTDPh
         mTIBTqRll0Gtg+jEVenW5MgZQOXd9IdfD3ULSimn8+d1zU3KGmEOFRkkqmnJNcfabcbR
         Er5w==
X-Gm-Message-State: AOAM5339Qm4TSGEShIJxvDc2x9a9wT9KIpnQ0Ih0PJrOPyAeR3wp42AP
        IwyR+K6QhKVpXkV+6HJvY4F8/lBBhsgJOHz5+DU=
X-Google-Smtp-Source: ABdhPJwTPDEzwT2WOYmR8CUSuBSTjc/YfJf2WYAIqGtc866t+rRP5QPvkP45VDqKzEKX/N1N9fsnC9KA/br3iVMtBFs=
X-Received: by 2002:a25:888b:: with SMTP id d11mr3240122ybl.385.1626147560337;
 Mon, 12 Jul 2021 20:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAOraNAaoHE9Xgfs0FNoMyKLP4Qd=FdsxaViJSkyuxf0j2rK5GA@mail.gmail.com>
 <CAOsVg8qHuia4nss+LxS+p1SLT2UvP9+pEErr=kU+4jvQ=n4tzA@mail.gmail.com>
In-Reply-To: <CAOsVg8qHuia4nss+LxS+p1SLT2UvP9+pEErr=kU+4jvQ=n4tzA@mail.gmail.com>
From:   Steven Zakulec <spzakulec@gmail.com>
Date:   Mon, 12 Jul 2021 23:39:08 -0400
Message-ID: <CAOraNAYcx-3zz8JYS+dnD8A+ATfbSi_dCWay3Htaek_p7kTA8w@mail.gmail.com>
Subject: Re: How do you capture (raw) VBI on Linux?
To:     Lucas <jaffa225man@gmail.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This worked exactly as you described- I had to install the libzvbi
devel headers, then a simple make of zvbi2raw let me use the program
with the exact command you provided.

Thank you so much for this!
I spent a ton of time searching and I just didn't have the right keywords.

On Mon, Jul 12, 2021 at 9:30 PM Lucas <jaffa225man@gmail.com> wrote:
>
> I pieced this together myself, from Internet searches, in 2013:
>
> Since (at that time at least) zvbi-ntsc-cc was ignoring null bytes the
> time codes ended up being "significantly off," according to my
> findings and those of the author of the program I've been using, I
> switched completely to using it: https://github.com/codeman38/zvbi2raw
>
> To use it to capture the raw VBI information, here's the command I use:
> zvbi2raw -d /dev/vbi0 > file.vbi
>
> Then, I convert it to a .srt file with ccextractor as you expected:
> ccextractor -in=raw ./file.vbi -o ./file.srt
>
> If you want to change the time offset in the .srt file, you can use a
> program from the libsubtitles-perl package in debian (I didn't find it
> in debian back then, so I compiled the source in its "subtitles-1.00"
> directory).  The program is subs, and here's how it can be used to
> subtract five minutes from every time in the .srt file (with -i, it
> edits in-place, but keeps a (.bak) backup file of the previous
> version, but I think repeating the command will lose your initial
> version):
> subs -i -b -5:00 file.srt
>
> It took me a lot longer to figure out than it probably will with this
> for you, but I didn't ask the mailing list. ;)
>
> I hope that helps,
>
>   Lucas
>
>
> On Mon, Jul 12, 2021 at 6:21 PM Steven Zakulec <spzakulec@gmail.com> wrote:
> >
> > HI, I am writing to the Linux-media mailing list in hopes that someone
> > can share how the /dev/vbi device can be captured from under Linux to
> > disk so it can be processed back into captions.
> >
> > I've tried a long list of items (listed below), and the only success
> > I've had under Linux is using old Hauppauge PVR (150 & 250) PCI cards,
> > and extracting the embedded VBI data from those captures.
> >
> > I can successfully display closed captions on my Hauppauge HVR-950q
> > USB device with "zvbi-ntsc-cc -d /dev/vbi0 -c" as long as I start a
> > capture first in one terminal, then run that command in a second
> > terminal, so I know that card works.
> >
> > With my Hauppauge HVR-950q, I've tried the following items:
> > cat /dev/vbi (both before, during, and after a capture is started on the card
> >
> > Trying to use ffmpeg to capture /dev/vbi - unclear if this is even
> > supposed to work, and if so, what the proper commands are
> >
> > I've tried using zvbi to capture the captions- at best, I can get the
> > text dumped to a file, but no timestamps, or raw/sliced VBI that I
> > could convert using ccextractor into a subtitle file.
> > I had thought one of the commands below should work based on the
> > descriptions from --help.
> > zvbi-ntsc-cc -d /dev/vbi0 -r -C vbi.bin
> > zvbi-ntsc-cc -d /dev/vbi0 -r -R -C vbi.bin
> >
> > I've tried some of the test tools in the zvbi source code test folder,
> > but it's not entirely clear if they work with NTSC closed captions.
> >
> > I'm on Kubuntu 20.04 with kernel 5.4.0-77-generic.
> >
> > If anyone knows an application/device combination (any Linux OS),
> > please let me know- this seems totally possible, I just can't figure
> > out how to make it happen.
> > Thank you in advance for any insights or guidance you can provide here.
>
>
>
> --
> Protect your digital freedom and privacy, eliminate DRM, learn more at
> http://www.defectivebydesign.org/what_is_drm
> On a related note, also see https://www.fsf.org/campaigns/surveillance
