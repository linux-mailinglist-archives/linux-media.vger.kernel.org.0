Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8001188CB4
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 19:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgCQSAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 14:00:06 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40574 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgCQSAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 14:00:04 -0400
Received: by mail-wm1-f66.google.com with SMTP id z12so258096wmf.5
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 11:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=slGl/R7byfWGMBVfvYdzgflVP89pwccF4w3qibXt4fI=;
        b=Cw2za/4YphQmbHc3nT7FsBbfO952/9Vrw1WR5nKMsQGJvZqmFoLKLGfwRJNc1MGwhZ
         0OGRaViVvd7xLchAwxAI/rKJ/kUZJNiL92QwT92Gpu+s88ilS0lCdnhOkzH7TrkOnEEZ
         CQ+1dDPmvJbJM2WLxk59Ayvx0fFwAtuH+fP3uK/TQw+s3PkLr9nI5Ps01m7OMzYm1ZEv
         uo3FlArAqec+tRfIJz837N2gZtanfR/iOzOBTfqcsSCE/xSQngGA6xtfXI5dJXeJMy4/
         +jw7IC2Tc7L9JS+iGcrxT6CVocwQo2DTlr9sDAGj3ugE8I5HB0j6tBeuJUvAfQzv/K00
         U0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=slGl/R7byfWGMBVfvYdzgflVP89pwccF4w3qibXt4fI=;
        b=Guyly5nhaUNqo7s88UEMe42kqtS7Js3Q/PaNfXaNUQsWFSeOTuGOIcGoAwMaCYL0D5
         Aspm5oaAHwlIPFGQGC5cI9IeYPiIa8usZEIeHrKnalaXwwhV5f6TLVoNYRQc2NzuM+aY
         GMwS9Zusjld2ni+XSa7ALI+pdNWaB6oTQerpkpAYGFhg67eqFd4q30gPDEjrMVeYtbRR
         QUz3e5fhbwdfzcPfK3qEiVJ32QtuCb0YxqwDnyuQgovFSIiyv6T+aDBy5qpLHV56CdzX
         C6xR963AtJrr3v9AJ5938kIcL6Hv0x+n53O/kUgMx6NUQ/2PerxyJaoThZgbjuRCI079
         UPwA==
X-Gm-Message-State: ANhLgQ325Vh4TazHYdHyNo0TpkEgosYLKQ44Kl6y6cmbdbKQOrN37Vcf
        e43Jp+D+RU8IzxubVfPCS5nFgnBJO6hfaDsLzxc=
X-Google-Smtp-Source: ADFU+vvmq+uCRHAJfS6et01/Ll+XBwfayr+YxuSaUfbmc2SIWBTLKB1ufxJkQMj1XAPaSGLdKB9HOVk2Dw8qXFrXQL8=
X-Received: by 2002:a7b:c153:: with SMTP id z19mr198525wmi.37.1584468003095;
 Tue, 17 Mar 2020 11:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com> <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com> <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
In-Reply-To: <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
From:   Jacob Lifshay <programmerjake@gmail.com>
Date:   Tue, 17 Mar 2020 10:59:50 -0700
Message-ID: <CAC2bXD6f2LiJ9_S0V8gZdrczRzH8oNqyLprzzFnGYTMzGe5gUQ@mail.gmail.com>
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

On Tue, Mar 17, 2020 at 10:21 AM Lucas Stach <dev@lynxeye.de> wrote:
>
> Am Dienstag, den 17.03.2020, 10:12 -0700 schrieb Jacob Lifshay:
> > One related issue with explicit sync using sync_file is that combined
> > CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> > rendering in userspace (like llvmpipe but for Vulkan and with extra
> > instructions for GPU tasks) but need to synchronize with other
> > drivers/processes is that there should be some way to create an
> > explicit fence/semaphore from userspace and later signal it. This
> > seems to conflict with the requirement for a sync_file to complete in
> > finite time, since the user process could be stopped or killed.
> >
> > Any ideas?
>
> Finite just means "not infinite". If you stop the process that's doing
> part of the pipeline processing you block the pipeline, you get to keep
> the pieces in that case.

Seems reasonable.

> That's one of the issues with implicit sync
> that explicit may solve: a single client taking way too much time to
> render something can block the whole pipeline up until the display
> flip. With explicit sync the compositor can just decide to use the last
> client buffer if the latest buffer isn't ready by some deadline.
>
> With regard to the process getting killed: whatever you sync primitive
> is, you need to make sure to signal the fence (possibly with an error
> condition set) when you are not going to make progress anymore. So
> whatever your means to creating the sync_fd from your software renderer
> is, it needs to signal any outstanding fences on the sync_fd when the
> fd is closed.

I think I found a userspace-accessible way to create sync_files and
dma_fences that would fulfill the requirements:
https://github.com/torvalds/linux/blob/master/drivers/dma-buf/sw_sync.c

I'm just not sure if that's a good interface to use, since it appears
to be designed only for debugging. Will have to check for additional
requirements of signalling an error when the process that created the
fence is killed.

Jacob

>
> Regards,
> Lucas
>
