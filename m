Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525772D5B5D
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 14:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389188AbgLJNLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389075AbgLJNLC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:11:02 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C43C0613D6
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 05:10:22 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id w3so4755813otp.13
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 05:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5SZx0SF1+bmdIPGDx8XS9Yvh6cMFc1HMujYWwx4oFXo=;
        b=ljmsD/nZGyo/+nDuS0o0wS7bR94cQDN8VGl9oI3x9gF6FY1HbovjAwtbwEL91ATJtm
         1xTzwHF+H8teshZzyQ3IR9ZGQiWUlsBu2AfAUddntFcJyQQeHRNrIFzGacznjrhKTKvg
         zGEZhXmHkuly95lHRKyzmo3PZkbgX74s/29oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5SZx0SF1+bmdIPGDx8XS9Yvh6cMFc1HMujYWwx4oFXo=;
        b=c9N06HYMRNapeo8Za0n9kD9cRJ3Yt42PafDaYVeA0PmAjkuEcaoqh8c6OXpmNZqCxW
         wZQKqMEiSSyRk7WZY31oa84tyF15U9av0ZNuvyjHGssusPkNn8Yaovn+QibNww3wyn8K
         Cooz1rbfSm/aOcACCx2ZxJhdlNhEh1h1nWHyu7a/vPGm7T7U6UavPoTisFDFxxtZ7lor
         EU4KfvGMX3pr798o073wSTd9M1+7NXcmft+q6MdeATaaFerIhdgFsx+X/U/BJ4aHuk4H
         xfvflKSUFdc89WH+f4gMjPAQqwe3T7aD2xeadyeqB7b/8jJ0fG11Q8FUjYERAMaxDRoK
         BPuw==
X-Gm-Message-State: AOAM533jPs+GyabyfW7Wo6Pd8NnSru6TXQy81MPB1UVIDNnC+E3egwNF
        WPRawmqGHjRQcfryV1lgadLoZzSp9C0hboVvDuimpw==
X-Google-Smtp-Source: ABdhPJwe0G/fIm4wrIEbslkY/Xrvlb1182PcLJFrYAgq3Tmq7oxccHPXXb0WkMQH6isTqYmJy19qnmcJPRyIsmZ6nTE=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr5751241otb.281.1607605822145;
 Thu, 10 Dec 2020 05:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20201210044400.1080308-1-hridya@google.com> <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com> <20201210102727.GE401619@phenom.ffwll.local>
 <X9H+3AP1q39aMxeb@kroah.com> <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
 <X9IPhEkcZO+Ut5RH@kroah.com>
In-Reply-To: <X9IPhEkcZO+Ut5RH@kroah.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 10 Dec 2020 14:10:10 +0100
Message-ID: <CAKMK7uEM636NjEcxLfsKJa9H71i0mkQ3dsT3yWwHTcVFk4r+Sg@mail.gmail.com>
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

On Thu, Dec 10, 2020 at 1:06 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 10, 2020 at 12:26:01PM +0100, Daniel Vetter wrote:
> > On Thu, Dec 10, 2020 at 11:55 AM Greg KH <gregkh@linuxfoundation.org> w=
rote:
> > >
> > > On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
> > > > On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
> > > > > On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian K=C3=B6nig wr=
ote:
> > > > > > In general a good idea, but I have a few concern/comments here.
> > > > > >
> > > > > > Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> > > > > > > This patch allows statistics to be enabled for each DMA-BUF i=
n
> > > > > > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > > > > >
> > > > > > > The following stats will be exposed by the interface:
> > > > > > >
> > > > > > > /sys/kernel/dmabuf/<inode_number>/exporter_name
> > > > > > > /sys/kernel/dmabuf/<inode_number>/size
> > > > > > > /sys/kernel/dmabuf/<inode_number>/dev_map_info
> > > > > > >
> > > > > > > The inode_number is unique for each DMA-BUF and was added ear=
lier [1]
> > > > > > > in order to allow userspace to track DMA-BUF usage across dif=
ferent
> > > > > > > processes.
> > > > > > >
> > > > > > > Currently, this information is exposed in
> > > > > > > /sys/kernel/debug/dma_buf/bufinfo.
> > > > > > > However, since debugfs is considered unsafe to be mounted in =
production,
> > > > > > > it is being duplicated in sysfs.
> > > > > >
> > > > > > Mhm, this makes it part of the UAPI. What is the justification =
for this?
> > > > > >
> > > > > > In other words do we really need those debug information in a p=
roduction
> > > > > > environment?
> > > > >
> > > > > Production environments seem to want to know who is using up memo=
ry :)
> > > >
> > > > This only shows shared memory, so it does smell a lot like $specifi=
c_issue
> > > > and we're designing a narrow solution for that and then have to car=
ry it
> > > > forever.
> > >
> > > I think the "issue" is that this was a feature from ion that people
> > > "missed" in the dmabuf move.  Taking away the ability to see what kin=
d
> > > of allocations were being made didn't make a lot of debugging tools
> > > happy :(
> >
> > If this is just for dma-heaps then why don't we add the stuff back
> > over there? It reinforces more that the android gpu stack and the
> > non-android gpu stack on linux are fairly different in fundamental
> > ways, but that's not really new.
>
> Back "over where"?
>
> dma-bufs are not only used for the graphics stack on android from what I
> can tell, so this shouldn't be a gpu-specific issue.

dma-buf heaps exist because android, mostly because google mandates
it. There's not a whole lot (meaning zero) of actually open gpu stacks
around that run on android and use dma-buf heaps like approved google
systems, largely because the gralloc implementation in mesa just
doesnt.

So if android needs some quick debug output in sysfs, we can just add
that in dma-buf heaps, for android only, problem solved. And much less
annoying review to make sure it actually fits into the wider ecosystem
because as-is (and I'm not seeing that chance anytime soon), dma-buf
heaps is for android only. dma-buf at large isn't, so merging a debug
output sysfs api that's just for android but misses a ton of the more
generic features and semantics of dma-buf is not great.
-Daniel

-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
