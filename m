Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D449F18F40D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 13:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgCWMIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 08:08:09 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35051 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgCWMIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 08:08:09 -0400
Received: by mail-lj1-f194.google.com with SMTP id u12so14262442ljo.2
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G1kmi4azK6I9kl/p6cHctZkv1a8MPJawGqGhCqNb2yk=;
        b=QLcac98mZfYlUtwusKNdWQU97I9Gs25cvgovhkOCpd4RgltH2AGqXNffMFrSq68r4j
         zuKISq/voPy0eDDl+v6U5R5VlAwahbwWP8eJCxYRW2G79FmHM8Lh7JgQcvBq/c7fWg7u
         KZSSdprcwLpwe+/YXyfW0E6p570hudPMSMmLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G1kmi4azK6I9kl/p6cHctZkv1a8MPJawGqGhCqNb2yk=;
        b=hpAdZmox/dcf6Sn44lq2NYXxT/nRq66PYMlFYY96cLua/wy7AZyvtuO18yn4EEsY6w
         jERsHQr1Bk/U4zXLxTO5Pet3EnG9wXWbFfVMklm2zuSEPeU6gM2fV7iTVa2cmhyFtpU+
         y7Kgph2Xt3CMeDcxi0GpAukRTLCerbcjMAp7CC4TShgCkbWuwoSPHhDZk1pSauGPgPBv
         DUKZd+G4NEqOhnbgjvP6H2GpHln/Fpe4xfz6D9ozccJecnRtyJiaraxvwe9g89iAgvI8
         NDotOUpBmK0LTkAtYwyg8Z5a00XjZZfDviM/e64Ks7RNXuAnIrpqylfX05D8tWBBpKiB
         9QHA==
X-Gm-Message-State: ANhLgQ30vang4gRFnMjOUpFtk4xPVA2kmFV+V5wrKmV3mOsvGJdiudBE
        xTPTRJ42Dylc5h8GjcGLsQvf2SgxAqWqZvPP/ICkjA==
X-Google-Smtp-Source: ADFU+vtLvIvZ3eN7AZJeNEGr1wODw+/sFDTcLwS1UWMXcHhKbrn9CKkocKY6q2JoeJ/iLSi2NCXOlm9wfjftCJtm2hs=
X-Received: by 2002:a2e:9a90:: with SMTP id p16mr14058285lji.277.1584965285362;
 Mon, 23 Mar 2020 05:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <20200206102058.247258-2-keiichiw@chromium.org> <20200225095956.7rtwugfru4dbjj7q@sirius.home.kraxel.org>
 <CAD90VcaTJh5MTRggpOmCK2LAryMHha2+7nPkFVTT8N8S06tf-A@mail.gmail.com>
 <20200227092856.p4kuh5dhh2tk3nnf@sirius.home.kraxel.org> <CAPBb6MWwBbNULCfMxN_KLt_Zd8kmmNy2JPi6XjLF1YgxxCPydw@mail.gmail.com>
 <20200304064251.zzkhevqgth6uets6@sirius.home.kraxel.org> <CAPBb6MVPjgLkbVjOY6O3srywNm8Zb1pMR2pGM1NinByhgFaZ_A@mail.gmail.com>
In-Reply-To: <CAPBb6MVPjgLkbVjOY6O3srywNm8Zb1pMR2pGM1NinByhgFaZ_A@mail.gmail.com>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 23 Mar 2020 21:07:54 +0900
Message-ID: <CAD90VcaYi2KawNOewRaL1QihUjgja6nLyzU+0R7nsHPN3voXDA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

I have implemented a virtio-video device following my v3 spec in
crosvm, which worked well together with Dmitry's driver [1]. I've
started preparing v4 proposal to address problems found while
implementing the driver and the devices.

Regarding v3 protocol, I'm thinking about how we can differentiate
'parameters' and 'controls' in the virtio-video spec?
In the previous discussion, we decided to have a profile, level and
bitrate as controls because we want to query supported values for each
field.
But, I don't think it's a good criteria because it'd be possible to
query other values in params.

So, I'm thinking about what should be the difference between params
and controls. If no difference, we should deprecate
virtio_video_params and have every field there as a control value
instead.
If we add a new command to get and set multiple controls at once, this
change won't cause overhead.

What do you think? Is there anything I missed?
If it sounds fine, I'll remove virtio_video_params from the v4 spec proposal.

Best regards,
Keiichi

[1]: https://patchwork.linuxtv.org/patch/61717/
