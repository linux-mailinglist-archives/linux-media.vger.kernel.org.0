Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F136511C60A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 07:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbfLLGk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 01:40:56 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34561 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbfLLGk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 01:40:56 -0500
Received: by mail-qk1-f194.google.com with SMTP id d202so759816qkb.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2019 22:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXRap6BBWQzWAyS8XpX73+bYNdrI0cAeZpXa9H/bRAc=;
        b=MA51rQXW0kUy/eH8a+CHW4cprcJcqsH2HDzbo+OKNkS1fIXDmPWFSH3Msg+CjLkt0o
         Hn/0mqSAS7p59uvMv2wKRkhzzpGh/xZo8lBVIiBJppJf7GsAmMMTWL+CZJ5TtspASJzS
         NaTGJFY7ayj0hAf+odDLpymBHQaz1OrCu/eC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXRap6BBWQzWAyS8XpX73+bYNdrI0cAeZpXa9H/bRAc=;
        b=UXaCXdXmNljSCU0GR4FC8Kgdomwe5wOs1QVVjMHImhu+e6tcd8sloW0gRxO/A+lG63
         Ou4dl8Ij/P7PJPirXg86qox0dRlYnMxBSFWBQi4nIYf1CUw07ddzMLm5uF1CmbeaDyvw
         zKL57VjtbUyDdkpA+oFj1fBXCxTGQuc6jtnjbF3HcRbkUvCwYGHQG0EM4NhvH40BrNyi
         vZ5gy04WPCsS62sC5ODdT7CpiSd62uk1n/UPd1qy5o8+MXLF37OK2k6EZiM2ZqJVJDgz
         fXTBBOtaP621EzTrdIrXCJ0bPGBEn96m8t7uE8cQAU8Aj/KFLpfADWuFwnw3sXc4YJJT
         zRKg==
X-Gm-Message-State: APjAAAXPxLcFHKiMJSuouUQUQ/WUHEmVS/knAF5vIJsvrFZWdcldYAaT
        s3hME5Etm0xr4D/Zh6PM3PofiPQXlh31ZsrdWB0dSA==
X-Google-Smtp-Source: APXvYqxMMjzivuQZLMAX1uEdLyogQxiS5pr/nUVktTqgng9NiXTmVutloTIAjZEQhboxEVr3pF5DU82GdhtuG5OkV90=
X-Received: by 2002:a05:620a:101b:: with SMTP id z27mr6394282qkj.241.1576132855363;
 Wed, 11 Dec 2019 22:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
 <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org> <72712fe048af1489368f7416faa92c45@hostfission.com>
 <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
 <d65bec5074eda5f389668e28922c1609@hostfission.com> <CAAFQd5AWqYaNWfYQ2hepjg7OD8y8ehHn0guusAR8JYefc+BNaw@mail.gmail.com>
 <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
 <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com> <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org>
In-Reply-To: <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 12 Dec 2019 15:40:44 +0900
Message-ID: <CAD=HUj7d3SWqCH=57ymy-BVd6xdJWc=WSqHAFyQXt-3MjchEAA@mail.gmail.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Geoffrey McRae <geoff@hostfission.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> First the addressing is non-trivial, especially with the "transport
> specific device address" in the tuple.

There is complexity here, but I think it would also be present in the
buffer sharing device case. With a buffer sharing device, the same
identifying information would need to be provided from the exporting
driver to the buffer sharing driver, so the buffer sharing device
would be able to identify the right device in the vmm. And then in
both import cases, the buffer is just identified by some opaque bytes
that need to be given to a buffer manager in the vmm to resolve the
actual buffer.

> Second I think it is a bad idea
> from the security point of view.  When explicitly exporting buffers it
> is easy to restrict access to the actual exports.

Restricting access to actual exports could perhaps help catch bugs.
However, I don't think it provides any security guarantees, since the
guest can always just export every buffer before using it. Using
implicit addresses doesn't mean that the buffer import actually has to
be allowed - it can be thought of as fusing the buffer export and
buffer import operations into a single operation. The vmm can still
perform exactly the same security checks.

> Instead of using a dedicated buffer sharing device we can also use
> virtio-gpu (or any other driver which supports dma-buf exports) to
> manage buffers.

I don't think adding generic buffer management to virtio-gpu (or any
specific device type) is a good idea, since that device would then
become a requirement for buffer sharing between unrelated devices. For
example, it's easy to imagine a device with a virtio-camera and a
virtio-encoder (although such protocols don't exist today). It
wouldn't make sense to require a virtio-gpu device to allow those two
devices to share buffers.

> With no central instance (buffer sharing device) being there managing
> the buffer identifiers I think using uuids as identifiers would be a
> good idea, to avoid clashes.  Also good for security because it's pretty
> much impossible to guess buffer identifiers then.

Using uuids to identify buffers would work. The fact that it provides
a single way to refer to both guest and host allocated buffers is
nice. And it could also directly apply to sharing resources other than
buffers (e.g. fences). Although unless we're positing that there are
different levels of trust within the guest, I don't think uuids really
provides much security.

If we're talking about uuids, they could also be used to simplify my
proposed implicit addressing scheme. Each device could be assigned a
uuid, which would simplify the shared resource identifier to
(device-uuid, shmid, offset).

In my opinion, the implicit buffer addressing scheme is fairly similar
to the uuid proposal. As I see it, the difference is that one is
referring to resources as uuids in a global namespace, whereas the
other is referring to resources with fully qualified names. Beyond
that, the implementations would be fairly similar.

-David
