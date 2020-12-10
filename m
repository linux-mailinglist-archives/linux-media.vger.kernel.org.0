Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5A52D592D
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389194AbgLJL0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 06:26:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbgLJL0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 06:26:53 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3595C0613D6
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 03:26:13 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id o25so5348606oie.5
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 03:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=26Ds+xjLYxlyiDrAw+q/Gft3jO8RNSIH1EaBVr3YRWw=;
        b=lSdOxFmO/wAApZldtzGe+fP9ge2caZIKfgzOJZKuezeQuMaShUSlqonQqUJiHUnUuQ
         4Kx9jXT1bYcD9HXyMyArkkW5rvBsAkOjIxoS/4sQzEt4lvQk9ORQMeRMN1UK9q7/z1RV
         TlzumT2ceJkyprsJiui9j3FjdAk8Igcu+zSPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=26Ds+xjLYxlyiDrAw+q/Gft3jO8RNSIH1EaBVr3YRWw=;
        b=IuKnN8eU9TXly570KIV+tBPaFsF2s/Pp2Jza+St4skk/CytAhnIWmS0Q0cD9qP/a/s
         dgC7U1Q0A/AXgA9NICg1zmaQQ8AZzuTlJgvTrjrS1aUrknc7QVkeO6F+6OUkzPG/vjAL
         Sg9MP2SACtec+kd6ppbdG62ooU5OS/I6RyBiwNg5TzCEKIkb3x0hXlC/Fw7w7SF5Ze4f
         eK9uZTq0vmrxEOWvH6x2EHf7H2efPX24wOAEVvZp5EXdpPEbbsVkuGk8OcoBwRUNqt/Y
         D0xrXDcDEMpJI0LqH+VOGonYE2jS69Lu/qgFAwb5H0LkReCc6/h2mr9wMD2TmE9JvKY5
         vtbQ==
X-Gm-Message-State: AOAM532V0s8PrhLKg+RjjQlfmoiDL8vLX9QkoYR+bU1GxVtQX/9sg7No
        mJd/QtjL4VK2ax7ZD+dvAAV8rva/hTf7CWF5PgS+Qw==
X-Google-Smtp-Source: ABdhPJwbfyYDyl38Hj6hY63Lt/8OMxO1ziTnn78ExJw8HG0XQ5S0YP1OIT0YrNdt1q0dNRR7Pcbp1BfkD8VJOBGCCmQ=
X-Received: by 2002:aca:4d08:: with SMTP id a8mr5091494oib.128.1607599572945;
 Thu, 10 Dec 2020 03:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20201210044400.1080308-1-hridya@google.com> <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com> <20201210102727.GE401619@phenom.ffwll.local> <X9H+3AP1q39aMxeb@kroah.com>
In-Reply-To: <X9H+3AP1q39aMxeb@kroah.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 10 Dec 2020 12:26:01 +0100
Message-ID: <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in sysfs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Hridya Valsaraju <hridya@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 11:55 AM Greg KH <gregkh@linuxfoundation.org> wrote=
:
>
> On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
> > On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
> > > On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian K=C3=B6nig wrote:
> > > > In general a good idea, but I have a few concern/comments here.
> > > >
> > > > Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> > > > > This patch allows statistics to be enabled for each DMA-BUF in
> > > > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > > >
> > > > > The following stats will be exposed by the interface:
> > > > >
> > > > > /sys/kernel/dmabuf/<inode_number>/exporter_name
> > > > > /sys/kernel/dmabuf/<inode_number>/size
> > > > > /sys/kernel/dmabuf/<inode_number>/dev_map_info
> > > > >
> > > > > The inode_number is unique for each DMA-BUF and was added earlier=
 [1]
> > > > > in order to allow userspace to track DMA-BUF usage across differe=
nt
> > > > > processes.
> > > > >
> > > > > Currently, this information is exposed in
> > > > > /sys/kernel/debug/dma_buf/bufinfo.
> > > > > However, since debugfs is considered unsafe to be mounted in prod=
uction,
> > > > > it is being duplicated in sysfs.
> > > >
> > > > Mhm, this makes it part of the UAPI. What is the justification for =
this?
> > > >
> > > > In other words do we really need those debug information in a produ=
ction
> > > > environment?
> > >
> > > Production environments seem to want to know who is using up memory :=
)
> >
> > This only shows shared memory, so it does smell a lot like $specific_is=
sue
> > and we're designing a narrow solution for that and then have to carry i=
t
> > forever.
>
> I think the "issue" is that this was a feature from ion that people
> "missed" in the dmabuf move.  Taking away the ability to see what kind
> of allocations were being made didn't make a lot of debugging tools
> happy :(

If this is just for dma-heaps then why don't we add the stuff back
over there? It reinforces more that the android gpu stack and the
non-android gpu stack on linux are fairly different in fundamental
ways, but that's not really new.
-Daniel

> But Hridya knows more, she's been dealing with the transition for a long
> time now.
>
> > E.g. why is the list of attachments not a sysfs link? That's how we
> > usually expose struct device * pointers in sysfs to userspace, not as a
> > list of things.
>
> These aren't struct devices, so I don't understand the objection here.
> Where else could these go in sysfs?
>
> > Furthermore we don't have the exporter device covered anywhere, how is
> > that tracked? Yes Android just uses ion for all shared buffers, but tha=
t's
> > not how all of linux userspace works.
>
> Do we have the exporter device link in the dmabuf interface?  If so,
> great, let's use that, but for some reason I didn't think it was there.
>
> > Then I guess there's the mmaps, you can fish them out of procfs. A tool
> > which collects all that information might be useful, just as demonstrat=
ion
> > of how this is all supposed to be used.
>
> There's a script somewhere that does this today, again, Hridya knows
> more.
>
> > There's also some things to make sure we're at least having thought abo=
ut
> > how other things fit in here. E.d. dma_resv attached to the dma-buf
> > matters in general a lot. It doesn't matter on Android because
> > everything's pinned all the time anyway.
> >
> > Also I thought sysfs was one value one file, dumping an entire list int=
o
> > dev_info_map with properties we'll need to extend (once you care about
> > dma_resv you also want to know which attachments are dynamic) does not
> > smell like sysfs design at all.
>
> sysfs is one value per file, what is being exported that is larger than
> that here?  Did I miss something on review?
>
> thanks,
>
> greg k-h
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
