Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F95E1CD728
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgEKLGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728341AbgEKLGb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:06:31 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DC4C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:06:30 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id a9so7127075lfb.8
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KSdV8YwHmMgDkf6Pwl9t/927NVpXsj0ABhibj8ETPcM=;
        b=uxgmj0gCX3b4PO/vmNX6t36IpMRSSmdEYZ/bwLOrf+zPWMLomjBbAXedUAIynSIYpW
         07CdCOpDEYoBiFHG83tpDzrIPh+fzWpl5BraatflAYDIZ8gDAIZUSLSpxQV5Ekui5Eky
         F8ov4qwzXnd9wKT1L2DQGojk4DLsx/A6vK8y6JhZiLXwNculi3W8HWtYHhaW/uiCl//z
         5rew024meoeqkW7zFvCQk52AAjsCur1KOw3Db7eBxsJV8kSN2kJaGRuRILcIuD+TjV2c
         0wJr7hXP3grSf5nXkgsWaNZJTzYtXyHeW0hVnwH6fCi88zfhNdsmtahPmi6mPxFz7/9s
         bGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSdV8YwHmMgDkf6Pwl9t/927NVpXsj0ABhibj8ETPcM=;
        b=H2ziHxUZDqoqpKddriyas8sugh67CPSGGTaO01nBL5XgQZ44ONAKTgx/e4il7zG0X9
         fmQFIs2hh9LZx6XGtXoFi7r/9sS96mqfuRgs0jOZvdXPTYvVMly/+Vxw0LKgh2fCia+2
         vIly02q2/77qqQ7/0iRLmhruGK5q115+mQT4wJy1a9P5m9PjP0q1Rb9LjQRGxVZekcgI
         +Qc6CPuXVG8Fx4YVQM4/yZFWI695HfcelMZwiDEum7LOIA+soxXsToUBnzKqoIhDt9jo
         3JLPqQf9OMR0InSQtIz7tpZZQDlnr4OiWXQmzgLeowuaw5qqjcB+Lpo8KSTX/QwB02cy
         DZ1g==
X-Gm-Message-State: AOAM5337QAQ6kUvpiYcJpIG9m4EUcnL5hKPqpiegr7RXCrQh+KIa335e
        OJU2p9ay8etDa1XL+1A+h2bdtEKpDapuJ46cTmuBN/y6e8h00w==
X-Google-Smtp-Source: ABdhPJwT39ClB4Ia2auEe6RFV5Mc/FVxWsDEMw16ZLKiZfalWxA3rYein0AC/ZeGa5OELIYcCKgIanksOJres51V2a0=
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr11144039lfm.63.1589195188918;
 Mon, 11 May 2020 04:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
 <CAK25hWMj5PyQFZVN5AToHjdySvi6iZ4zjZeUJQR85jNgoeLeAw@mail.gmail.com>
 <CAK25hWOPS1wGORXgtv8hUNu9-mLO+5C_k3Cj=8pnoFWmjuhJdg@mail.gmail.com>
 <2405792.XL1faGB9W5@os-lin-dmo> <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
In-Reply-To: <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
From:   Saket Sinha <saket.sinha89@gmail.com>
Date:   Mon, 11 May 2020 13:05:53 +0200
Message-ID: <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

I do not support the approach of  QEMU implementation forwarding
requests to the host's vicodec module since  this can limit the scope
of the virtio-video device only for testing, which instead can be used
with multiple use cases such as -

1. VM gets access to paravirtualized  camera devices which shares the
video frames input through actual HW camera attached to Host.

2. If Host has multiple video devices (especially in ARM SOCs over
MIPI interfaces or USB), different VM can be started or hotplugged
with selective video streams from actual HW video devices.

Also instead of using libraries like Gstreamer in Host userspace, they
can also be used inside the VM userspace after getting access to
paravirtualized HW camera devices .

Regards,
Saket Sinha

On Mon, May 11, 2020 at 12:20 PM Keiichi Watanabe <keiichiw@chromium.org> wrote:
>
> Hi Dmitry,
>
> On Mon, May 11, 2020 at 6:40 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
> >
> > Hi Saket and all,
> >
> > As we are working with automotive platforms, unfortunately we don't plan any
> > Qemu reference implementation so far.
> >
> > Of course we are ready to support the community if any help is needed. Is
> > there interest in support for the FWHT format only for testing purpose or you
> > want a full-featured implementation on the QEMU side?
>
> I guess we don't need to implement the codec algorithm in QEMU.
> Rather, QEMU forwards virtio-video requests to the host video device
> or a software library such as GStreamer or ffmpeg.
> So, what we need to implement in QEMU is a kind of API translation,
> which shouldn't care about actual video formats so much.
>
> Regarding the FWHT format discussed in the patch thread [1], in my
> understanding, Hans suggested to have QEMU implementation forwarding
> requests to the host's vicodec module [2].
> Then, we'll be able to test the virtio-video driver on QEMU on Linux
> even if the host Linux has no hardware video decoder.
> (Please correct me if I'm wrong.)
>
> Let me add Hans and Linux media ML in CC.
>
> [1]  https://patchwork.linuxtv.org/patch/61717/
> [2] https://lwn.net/Articles/760650/
>
> Best regards,
> Keiichi
>
> >
> > Please note that the spec is not finalized yet and a major update is now
> > discussed with upstream and the Chrome OS team, which is also interested and
> > deeply involved in the process. The update mostly implies some rewording and
> > reorganization of data structures, but for sure will require a driver rework.
> >
> > Best regards,
> > Dmitry.
> >
> > On Samstag, 9. Mai 2020 16:11:43 CEST Saket Sinha wrote:
> > > Hi,
> > >
> > > As suggested on #qemu-devel IRC channel, I am including virtio-dev, Gerd and
> > > Michael to point in the right direction how to move forward with Qemu
> > > support for Virtio Video V4L2 driver
> > > posted in [1].
> > >
> > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > >
> > > Regards,
> > > Saket Sinha
> > >
> > > On Sat, May 9, 2020 at 1:09 AM Saket Sinha <saket.sinha89@gmail.com> wrote:
> > > > Hi ,
> > > >
> > > > This is to inquire about Qemu support for Virtio Video V4L2 driver
> > > > posted in [1].
> > > > I am currently not aware of any upstream effort for Qemu reference
> > > > implementation and would like to discuss how to proceed with the same.
> > > >
> > > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > > >
> > > > Regards,
> > > > Saket Sinha
> >
> >
> >
> > ---------------------------------------------------------------------
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> >
