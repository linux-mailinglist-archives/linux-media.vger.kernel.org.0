Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A49F56182
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 06:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfFZElS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 00:41:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45455 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfFZElS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 00:41:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so966093wre.12
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 21:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ntAoYL/Rm2CJcPJUaWQJZo0Ebr78bwFEe95ZmtoSouc=;
        b=f1P00UfE/WsJ1aI7gyl8grjD6wzsTo/IZw8xeM220M8Jgg/3M7/yR2e9+ahFRvj6l4
         0C73HTn4zvlzhYTL8jSPROB/ELQHqNmfxjHWwZ4CDqp3X4BBwUgZtRB1WUNnPhgh6X28
         eWs5tuJrhkcLcPa4sTmw7ZDDIDeVUcS2/KSPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ntAoYL/Rm2CJcPJUaWQJZo0Ebr78bwFEe95ZmtoSouc=;
        b=AWbOUgbYmyr7ygfQlB0JCT2GKqh2znf+ayxb+D0Pa95zcu9zSwniw+yQgG9EYi2OK3
         gz3iYjd3dytBLGQ0bp6cMPRr+GirolnpjSLvZI0ZTNweyaKy2s7RlvQjrYCsLDlsnUHk
         CyaTXqyJL8lTZ77gYOaCjGCzFd8sd9uMh4EYcLCuWv/FC6UShNRKchCqA4lMmqnn7Kn9
         GiVzgo36W4ukgRE6uhmo8fy5HM8Lz2gTzrztn9fqcBfJNE7YRcGSC86maBKWJ0qitKRh
         mW0aM8Nwux5Oga98AT7S88aiaIh36KF9G9U7qn8qs1yK6ubmVIs1wAXOlPH/RL05HZE9
         8buQ==
X-Gm-Message-State: APjAAAWRQ3dzuvfho92tt4rPCMKhhAB7jmLYfMF+bvBn1tk2kvMCYy7n
        R49qEiDTLpR71dtTNiEyb3Cu5t1c5RmxMqwzFNMc9Q==
X-Google-Smtp-Source: APXvYqwwaq2zdvwYCzJZqL3hdUoXF8+GcySNmmBoqCYQlQWdKeqD1faXsoyJVX1HjTCqAM3+Dom4UvO0x/DwX4HQvck=
X-Received: by 2002:adf:e48e:: with SMTP id i14mr1474498wrm.311.1561524075932;
 Tue, 25 Jun 2019 21:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
 <20190516032332.56844-5-daoyuan.huang@mediatek.com> <20190604112039.GA12168@chromium.org>
 <CAPBb6MUCYK3eyk5Oq_p8yBvFh1EszzPDcvbB0VLTu_KKzCLTMA@mail.gmail.com>
In-Reply-To: <CAPBb6MUCYK3eyk5Oq_p8yBvFh1EszzPDcvbB0VLTu_KKzCLTMA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 26 Jun 2019 13:41:04 +0900
Message-ID: <CAHD77HkJ8aHgKugC3+Du-OoqP9yg0yKt+-_RyL1cZ4e5QkuUhQ@mail.gmail.com>
Subject: Re: [RFC v2 4/4] media: platform: mtk-mdp3: Add Mediatek MDP3 driver
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Daoyuan Huang <daoyuan.huang@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yu Zhao <yuzhao@chromium.org>,
        Ross Zwisler <zwisler@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= 
        <holmes.chiou@mediatek.com>,
        Frederic Chen <frederic.chen@mediatek.com>,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 20, 2019 at 1:48 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> On Tue, Jun 4, 2019 at 8:20 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > +
> > > +     ret = mdp_vpu_get_locked(mdp);
> > > +     if (ret < 0)
> > > +             goto err_load_vpu;
> >
> > This shouldn't happen in open(), but rather the latest possible point in
> > time. If one needs to keep the VPU running for the time of streaming, then
> > it should be start_streaming. If one can safely turn the VPU off if there is
> > no frame queued for long time, it should be just in m2m job_run.
> >
> > Generally the userspace should be able to
> > just open an m2m device for querying it, without any side effects like
> > actually powering on the hardware or grabbing a hardware instance (which
> > could block some other processes, trying to grab one too).
>
> OTOH looking at the code of mdp_vpu_get_locked(), we do the whole
> rproc_boot and VPU init procedure if we were the only user. So I can
> understand we want to avoid doing this too often.
>
> Maybe mdp_vpu_get_locked() can be reorganized in a better way. I feel
> like the call to mdp_vpu_register() should be done in probe, and maybe
> we can use runtime PM (with a reasonable timeout) to control the rproc
> and VPU init?

I think it depends on when exactly the rproc and VPU need stay
initialized. In general, we want to turn off as much as possible as
quickly as possible, but keeping in mind any turn on latencies.

For example. if it takes 10 ms to boot rproc/VPU, we probably
shouldn't turn it off unless we already spent 20-30 ms idling, which
could be handled with runtime PM with (delayed) autosuspend. However,
things like clock gating are normally very fast, so we could just stop
any clocks as soon as frame processing ends and restart when next
frame is getting scheduled and if we use autosuspend, we wouldn't be
able to do it using PM runtime.

My point was that just open() is not the right place for doing this.
Any later stage should be okay, as long as it suits the hardware
architecture.

Best regards,
Tomasz
