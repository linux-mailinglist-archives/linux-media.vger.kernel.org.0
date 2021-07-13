Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363FB3C6954
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 06:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhGME2i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 00:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhGME2h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 00:28:37 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE326C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 21:25:47 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ec55so6419031edb.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 21:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pfhucnwFF5Xrj2Ob7yfsON3ft8Vs6AOquku40xqd+y0=;
        b=mm7ZElbmoXg2ThOTMJJna1ATY9JO93efcFgBe9Okmm1ByIRnXJL94SUlLOHdiuUbLV
         Vvmb9fPeqV2aKxqvX5Mjotey2H9YyqsQBu/nJAOQ3CEUgEdKLDtnVeGlvJP2YIsU6Uvl
         p4qVT+KygPQzdWO4xSWeefY9+J2K8QMWo94k/l74p2zeLy1spt1fJbwqL5D1OzAVFDUN
         mpyJUfX0FtwvDcVhCQM2HVanqRhQqmnFVlpij1kYiljckLxnBEkr4GKOtS9GB3yDCiHA
         QW2eOlbLQuIR1eUek0BDFds1rsz5MYGt0TC8nC+9egpSf7Iqq4W9TX0LGxJONSYqxBFz
         aNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pfhucnwFF5Xrj2Ob7yfsON3ft8Vs6AOquku40xqd+y0=;
        b=gekBTKPfuoc8KVjqu5NcrifhwpvyL/b+Zv0D2VDHFBGRa8WXW0hZ9or9oFTxIN+Omd
         /y0sZqXwqiZ9nc6hwedc59KnA4NsXSx1unFPb3RWu3zbwRIHGsfZ/xKRKEQpqnZ1+PzR
         QU7GXkMnm7UIc+MNocTvU0sYH7Bk7r1IP3OP6naWSgb6N4FTw3X2Tv8SIkwxPKKXXb1N
         bE3GLEf1iBeOkXbPomL7hTnITOKGwcKxAp9E+9VxVdjqmS7LkQt1WRS7hYTUTN8yrcur
         bb/d30cZWvWPlMu4tiXCIBtDBDg+W+VJCyz4+AN75r4tY6cICbgcpoHru/P/ckdkTDXS
         XfBg==
X-Gm-Message-State: AOAM5312GKBHH8KuVpCinMGjRIj2MygYAtKAIpB7lBo/pSko3s8nU09l
        580j94sLilkKzHYGwRaW7/tFT8+J61k2910IoxY=
X-Google-Smtp-Source: ABdhPJzhgL5tI0rJN/mvG7APxmotJpzeNsG3SHt1mI3P/2nQX7TKvMIeUtiG1hukHft2ObrLzwFgJj+gH4wveIcFwM0=
X-Received: by 2002:aa7:dc01:: with SMTP id b1mr2844648edu.239.1626150346193;
 Mon, 12 Jul 2021 21:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAOraNAaoHE9Xgfs0FNoMyKLP4Qd=FdsxaViJSkyuxf0j2rK5GA@mail.gmail.com>
 <CAOsVg8qHuia4nss+LxS+p1SLT2UvP9+pEErr=kU+4jvQ=n4tzA@mail.gmail.com> <CAOraNAYcx-3zz8JYS+dnD8A+ATfbSi_dCWay3Htaek_p7kTA8w@mail.gmail.com>
In-Reply-To: <CAOraNAYcx-3zz8JYS+dnD8A+ATfbSi_dCWay3Htaek_p7kTA8w@mail.gmail.com>
From:   Lucas <jaffa225man@gmail.com>
Date:   Mon, 12 Jul 2021 23:25:35 -0500
Message-ID: <CAOsVg8ruRSUAO8G6-yGGkN-dzd9ETV8tG=jgM8ntK042Y5hJFg@mail.gmail.com>
Subject: Re: How do you capture (raw) VBI on Linux?
To:     Steven Zakulec <spzakulec@gmail.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

You're quite welcome, and I'm so glad it works for you too!  I spent a
lot of time, and documented every new lead, back then.  I doubt these
three simple commands appear consolidated until now, so when I saw
your question I felt I had to share my experience.

Good luck in the future!

On Mon, Jul 12, 2021 at 10:39 PM Steven Zakulec <spzakulec@gmail.com> wrote:
>
> This worked exactly as you described- I had to install the libzvbi
> devel headers, then a simple make of zvbi2raw let me use the program
> with the exact command you provided.
>
> Thank you so much for this!
> I spent a ton of time searching and I just didn't have the right keywords.
>
> On Mon, Jul 12, 2021 at 9:30 PM Lucas <jaffa225man@gmail.com> wrote:
> >
> > I pieced this together myself, from Internet searches, in 2013:
> >
> > Since (at that time at least) zvbi-ntsc-cc was ignoring null bytes the
> > time codes ended up being "significantly off," according to my
> > findings and those of the author of the program I've been using, I
> > switched completely to using it: https://github.com/codeman38/zvbi2raw
> >
> > To use it to capture the raw VBI information, here's the command I use:
> > zvbi2raw -d /dev/vbi0 > file.vbi
> >
> > Then, I convert it to a .srt file with ccextractor as you expected:
> > ccextractor -in=raw ./file.vbi -o ./file.srt
> >
> > If you want to change the time offset in the .srt file, you can use a
> > program from the libsubtitles-perl package in debian (I didn't find it
> > in debian back then, so I compiled the source in its "subtitles-1.00"
> > directory).  The program is subs, and here's how it can be used to
> > subtract five minutes from every time in the .srt file (with -i, it
> > edits in-place, but keeps a (.bak) backup file of the previous
> > version, but I think repeating the command will lose your initial
> > version):
> > subs -i -b -5:00 file.srt
> >
> > It took me a lot longer to figure out than it probably will with this
> > for you, but I didn't ask the mailing list. ;)
> >
> > I hope that helps,
> >
> >   Lucas
> >
> >
> > On Mon, Jul 12, 2021 at 6:21 PM Steven Zakulec <spzakulec@gmail.com> wrote:
> > >
> > > HI, I am writing to the Linux-media mailing list in hopes that someone
> > > can share how the /dev/vbi device can be captured from under Linux to
> > > disk so it can be processed back into captions.
> > >
> > > I've tried a long list of items (listed below), and the only success
> > > I've had under Linux is using old Hauppauge PVR (150 & 250) PCI cards,
> > > and extracting the embedded VBI data from those captures.
> > >
> > > I can successfully display closed captions on my Hauppauge HVR-950q
> > > USB device with "zvbi-ntsc-cc -d /dev/vbi0 -c" as long as I start a
> > > capture first in one terminal, then run that command in a second
> > > terminal, so I know that card works.
> > >
> > > With my Hauppauge HVR-950q, I've tried the following items:
> > > cat /dev/vbi (both before, during, and after a capture is started on the card
> > >
> > > Trying to use ffmpeg to capture /dev/vbi - unclear if this is even
> > > supposed to work, and if so, what the proper commands are
> > >
> > > I've tried using zvbi to capture the captions- at best, I can get the
> > > text dumped to a file, but no timestamps, or raw/sliced VBI that I
> > > could convert using ccextractor into a subtitle file.
> > > I had thought one of the commands below should work based on the
> > > descriptions from --help.
> > > zvbi-ntsc-cc -d /dev/vbi0 -r -C vbi.bin
> > > zvbi-ntsc-cc -d /dev/vbi0 -r -R -C vbi.bin
> > >
> > > I've tried some of the test tools in the zvbi source code test folder,
> > > but it's not entirely clear if they work with NTSC closed captions.
> > >
> > > I'm on Kubuntu 20.04 with kernel 5.4.0-77-generic.
> > >
> > > If anyone knows an application/device combination (any Linux OS),
> > > please let me know- this seems totally possible, I just can't figure
> > > out how to make it happen.
> > > Thank you in advance for any insights or guidance you can provide here.
> >
> >
> >
> > --
> > Protect your digital freedom and privacy, eliminate DRM, learn more at
> > http://www.defectivebydesign.org/what_is_drm
> > On a related note, also see https://www.fsf.org/campaigns/surveillance



-- 
Protect your digital freedom and privacy, eliminate DRM, learn more at
http://www.defectivebydesign.org/what_is_drm
On a related note, also see https://www.fsf.org/campaigns/surveillance
