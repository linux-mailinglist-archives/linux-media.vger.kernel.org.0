Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DD41CD667
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 12:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgEKKUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 06:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727093AbgEKKUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 06:20:52 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09EE8C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 03:20:51 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x73so7042015lfa.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7l3aJuCw1ZmCkBeYJdf5n98EOG+qDwjoqW0w6aiK8Jw=;
        b=Sikc5W36ZX6VLf4vxIpmICrDhJ9qmRTG+teL0qUfwHpirI6RkJ0v/hdzb+V3cF37dh
         poqmBP9D3KmtU4xWW4uVxU1M/fLBVgjGL/GEtQNHvCviUoj0IopFFElfZVB028qoKj7i
         Ag+GhK48JROPwo+bKXsnuOf+mgnNWfkx9wMmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7l3aJuCw1ZmCkBeYJdf5n98EOG+qDwjoqW0w6aiK8Jw=;
        b=F5kTxT+lmqct0od9CEqC7wavgqQ6yqj4B/w79WiorqJybyWoWnbocnaGKprWP6+g82
         VWBpFZvocCS/hm+xnzfgBbkWlwZaqoh4ZVVM7prfwu5oA5P/mzfi1hQSHGgynO8EvDqG
         vgW//eoAWwKeHJwmJmwLckrME57m+wpUeyFRCIOEIe8dqJbMJOZvd+SGkAgOxCWggoqQ
         HDBtV423pCYmWdYS5BXZsvO1sQGy0oR9hxvLGwtDUzwXoA9LnGzmQZjpgOJPs/HYtOys
         YmGJ1O+1VQbE0qsLr+6eUrsAEcwvE9kj/vym6TxnNU/0gZBqANkrhSdLkXxg4JmAl4Eg
         HlfA==
X-Gm-Message-State: AOAM530mn9ak+4ndApL6n6dJAJ864GEMpLuQt3Rkkr/HJuMVhScqW4h0
        4iUaLrvFADUtLlJVW2sbaRqsCFeV1Y6WpS4EcCdldw==
X-Google-Smtp-Source: ABdhPJwQliO9vuZUSjoSithFIp6Rh4GnLng2aK/kW3AYtqC4jRKZQweyrqj0jcFbUxqjG+HiYZc8QabdBuaOZVk+23w=
X-Received: by 2002:ac2:504c:: with SMTP id a12mr10601082lfm.110.1589192449476;
 Mon, 11 May 2020 03:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
 <CAK25hWMj5PyQFZVN5AToHjdySvi6iZ4zjZeUJQR85jNgoeLeAw@mail.gmail.com>
 <CAK25hWOPS1wGORXgtv8hUNu9-mLO+5C_k3Cj=8pnoFWmjuhJdg@mail.gmail.com> <2405792.XL1faGB9W5@os-lin-dmo>
In-Reply-To: <2405792.XL1faGB9W5@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 11 May 2020 19:20:38 +0900
Message-ID: <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        qemu-devel@nongnu.org, Saket Sinha <saket.sinha89@gmail.com>,
        virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
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

Hi Dmitry,

On Mon, May 11, 2020 at 6:40 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Saket and all,
>
> As we are working with automotive platforms, unfortunately we don't plan any
> Qemu reference implementation so far.
>
> Of course we are ready to support the community if any help is needed. Is
> there interest in support for the FWHT format only for testing purpose or you
> want a full-featured implementation on the QEMU side?

I guess we don't need to implement the codec algorithm in QEMU.
Rather, QEMU forwards virtio-video requests to the host video device
or a software library such as GStreamer or ffmpeg.
So, what we need to implement in QEMU is a kind of API translation,
which shouldn't care about actual video formats so much.

Regarding the FWHT format discussed in the patch thread [1], in my
understanding, Hans suggested to have QEMU implementation forwarding
requests to the host's vicodec module [2].
Then, we'll be able to test the virtio-video driver on QEMU on Linux
even if the host Linux has no hardware video decoder.
(Please correct me if I'm wrong.)

Let me add Hans and Linux media ML in CC.

[1]  https://patchwork.linuxtv.org/patch/61717/
[2] https://lwn.net/Articles/760650/

Best regards,
Keiichi

>
> Please note that the spec is not finalized yet and a major update is now
> discussed with upstream and the Chrome OS team, which is also interested and
> deeply involved in the process. The update mostly implies some rewording and
> reorganization of data structures, but for sure will require a driver rework.
>
> Best regards,
> Dmitry.
>
> On Samstag, 9. Mai 2020 16:11:43 CEST Saket Sinha wrote:
> > Hi,
> >
> > As suggested on #qemu-devel IRC channel, I am including virtio-dev, Gerd and
> > Michael to point in the right direction how to move forward with Qemu
> > support for Virtio Video V4L2 driver
> > posted in [1].
> >
> > [1]: https://patchwork.linuxtv.org/patch/61717/
> >
> > Regards,
> > Saket Sinha
> >
> > On Sat, May 9, 2020 at 1:09 AM Saket Sinha <saket.sinha89@gmail.com> wrote:
> > > Hi ,
> > >
> > > This is to inquire about Qemu support for Virtio Video V4L2 driver
> > > posted in [1].
> > > I am currently not aware of any upstream effort for Qemu reference
> > > implementation and would like to discuss how to proceed with the same.
> > >
> > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > >
> > > Regards,
> > > Saket Sinha
>
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
