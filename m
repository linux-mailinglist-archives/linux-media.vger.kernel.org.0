Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917ED188BE7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 18:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgCQRTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 13:19:02 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35354 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgCQRTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 13:19:02 -0400
Received: by mail-ed1-f65.google.com with SMTP id a20so27590078edj.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gu9EXPTfKkao/W8jv/FemJ9MYn/kCLdNIsXowFHz1To=;
        b=xqrM59kbnlls2IQoZqH75rUe2BOQ6HzHDSTFkQdK6HF5M+Cv/SrLIQ+vdyOfEF+g9Z
         94pcilXz4pLxcGBnrvIfAUyuF63JJ/1I4d6L+9uRLGU4pE/nvHkPUfcZfO9swcfQIB5U
         hCXEKksGkk5E+/Zc462N4cOaJm5Xiz1H3oB7O0nXhtexfuj4UfgthZ7EnFJe758Noa0g
         MuUSvdmjP3FFNJpr0R/1CNgr3GEzc/2IGtMl4MY5sJfQ18CKIPTspKC6lujqQjyGsaQP
         uGOUBxG73NQpp9CGO3S/iIrPElg2nGTFJydK83zxZelC8cZPbtV6CSg9BtJYb2fqYgIL
         Fnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gu9EXPTfKkao/W8jv/FemJ9MYn/kCLdNIsXowFHz1To=;
        b=dRo5kaHpzF/Td2NYAUShHNQKIhU/TefXcpAa9YtMceQusTTCfeWq/iv0ArwvzPwtnd
         2Mw9kC2w9E5i7eRyYKxIbVmvYuayK4umXzQXc5tB2MvmxKXua2nh1woY3f2gE0OKBZrV
         LQzi0lcwQNvXvFGI3rxhZVF1wSBiRGtuUPH/+S6QEqQ1PeRTJrMob2cS5hgtDu7uo9Ya
         7oPvgg+suY6CNDs0NcDuAtrsX5v0VhZVSVSfsAUc1rXnuQ6P8wKITJdmpK8BkFMMj9gv
         5TQdGSMHUHE7VhMfSkY2E+x/GmE1XxhK3OHWuSBIlib1mtJy1+x/45K3YB1BlvUnmAos
         xttg==
X-Gm-Message-State: ANhLgQ0ialCSAEt11y4JQ4kFkwZB7Cjzndquz0GHCwxXzSwkT7zOdw3m
        3Hvv83s2PNEHMzAF0j9HnCd1xkw4XkSuQOvVlk2O8w==
X-Google-Smtp-Source: ADFU+vt/7ery+oZwZWRxqgyPq9+WVXJuHw6ERorv5ePHTAGsZPCKzeZwlC9VmoCr1kyUNM9bXT6foUOjXCTgx8IBxtk=
X-Received: by 2002:a50:eb05:: with SMTP id y5mr3809506edp.168.1584465538957;
 Tue, 17 Mar 2020 10:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com> <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com> <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
In-Reply-To: <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Tue, 17 Mar 2020 12:18:47 -0500
Message-ID: <CAOFGe94vX5CMyjs8jehXj3f7t9yu__=-N+etNz5eY7sqwqb-jA@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux ecosystem
To:     Jacob Lifshay <programmerjake@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 12:13 PM Jacob Lifshay <programmerjake@gmail.com> wrote:
>
> One related issue with explicit sync using sync_file is that combined
> CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> rendering in userspace (like llvmpipe but for Vulkan and with extra
> instructions for GPU tasks) but need to synchronize with other
> drivers/processes is that there should be some way to create an
> explicit fence/semaphore from userspace and later signal it. This
> seems to conflict with the requirement for a sync_file to complete in
> finite time, since the user process could be stopped or killed.

Yeah... That's going to be a problem.  The only way I could see that
working is if you created a sync_file that had a timeout associated
with it.  However, then you run into the issue where you may have
corruption if stuff doesn't complete on time.  Then again, you're not
really dealing with an external unit and so the latency cost of going
across the window system protocol probably isn't massively different
from the latency cost of triggering the sync_file.  Maybe the answer
there is to just do everything in-order and not worry about
synchronization?
