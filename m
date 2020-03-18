Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92FFC18928D
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 01:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgCRAQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 20:16:17 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:36846 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbgCRAQR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 20:16:17 -0400
Received: by mail-wm1-f47.google.com with SMTP id g62so1343825wme.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 17:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z0F8dcnw8GckOaa6ldpJ2ShvxTCMiGL5hWZMpwK3BII=;
        b=Nclc+5+7JU/rKvad0iuuFeK3/YT8Cv7bO70fBBL4uEJwscQjHClt/r9GVME3oXZuPH
         dfhCxFvVufIW1HuAFKAWR0waZwMTI58KQyFdErrHAUr+GgmoelaB/32vVYVrXGDM4OG2
         VYQZUf13g02uPcN+I7aPr61mTXEjaWxyVMpys3LFU2ocGHjELxqR5kkOXsAqr/pD6gop
         45Rz79Q/kvjQL8l5m2u8gkkVMzYE0NHNJTGRN7tMPc3qsTy5H9PEi0M7bI8WESr38DAK
         1s6+sWGpbRz0K30wYZUcheUQY4MCgwaKRNe8XnVGk8CVevErxi5MVfjpFkrjQGSJBto8
         dDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z0F8dcnw8GckOaa6ldpJ2ShvxTCMiGL5hWZMpwK3BII=;
        b=I50iScxQoO/v0qATUxKdOIdlvI2ihRjJg9aMqmtoxvz27ecGddAXUMM7b9q4urz0Ep
         ZkO593HehwyXhfluB35ibZrrSg+EmorSZYQpf1YynFWO/bKlH7awAt4WdQaizNMgzaa6
         2ZgW4O0p6GDJu0CnPDE4Lj/ZXJsL2WhX2BXFm3rAkwNcqLLhVCU2r02cycX0uPFFIrgw
         PWBMADHdlVeIsacBtIUcxcrGdr45iKYyMqPkDSnyUcLi/vjFoSAu+sMh8Td8YIJwY9VW
         zhXD+Dp78IYbJSRHQZnkGt1tK2aaDCO8uzrMTfutgB2tTYxlW2swcYbA8EXV3/0MGyKI
         a4Jg==
X-Gm-Message-State: ANhLgQ10snbb9KHFmStSdYqHKiBtRSL3Oh0l76QFwvzQOPhf+VfyOwuN
        zLze5ZShBnCpjpy3zDI8IfGewoIL+5e6mYo18cu6Q+G6
X-Google-Smtp-Source: ADFU+vtcc0P+wc74IAqBGJt6hqHUGqN4v8QezAbJPX1woPJdWN2w+eWwdQD1jg1dc8mZgWWHMeqAn0jjnsV00D54RNU=
X-Received: by 2002:a1c:b789:: with SMTP id h131mr1441454wmf.141.1584490575487;
 Tue, 17 Mar 2020 17:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com> <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
 <CAC2bXD6f2LiJ9_S0V8gZdrczRzH8oNqyLprzzFnGYTMzGe5gUQ@mail.gmail.com> <949b8373908a9895e97981e872d6e35dcaaba632.camel@lynxeye.de>
In-Reply-To: <949b8373908a9895e97981e872d6e35dcaaba632.camel@lynxeye.de>
From:   Jacob Lifshay <programmerjake@gmail.com>
Date:   Tue, 17 Mar 2020 17:16:04 -0700
Message-ID: <CAC2bXD5+KwBXBo-qHWkGw+=cH_AytwS=jeDGbskXcmO0rfsREw@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux ecosystem
To:     Lucas Stach <dev@lynxeye.de>
Cc:     Jason Ekstrand <jason@jlekstrand.net>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 11:14 AM Lucas Stach <dev@lynxeye.de> wrote:
>
> Am Dienstag, den 17.03.2020, 10:59 -0700 schrieb Jacob Lifshay:
> > I think I found a userspace-accessible way to create sync_files and
> > dma_fences that would fulfill the requirements:
> > https://github.com/torvalds/linux/blob/master/drivers/dma-buf/sw_sync.c
> >
> > I'm just not sure if that's a good interface to use, since it appears
> > to be designed only for debugging. Will have to check for additional
> > requirements of signalling an error when the process that created the
> > fence is killed.
>
> Something like that can certainly be lifted for general use if it makes
> sense. But then with a software renderer I don't really see how fences
> help you at all. With a software renderer you know exactly when the
> frame is finished and you can just defer pushing it over to the next
> pipeline element until that time. You won't gain any parallelism by
> using fences as the CPU is busy doing the rendering and will not run
> other stuff concurrently, right?

There definitely may be other hardware and/or processes that can
process some stuff concurrently with the main application, such as the
compositor and or video encoding processes (for video capture).
Additionally, from what I understand, sync_file is the standard way to
export and import explicit synchronization between processes and
between drivers on Linux, so it seems like a good idea to support it
from an interoperability standpoint even if it turns out that there
aren't any scheduling/timing benefits.

Jacob
