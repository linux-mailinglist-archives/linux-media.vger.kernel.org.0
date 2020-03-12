Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 492F3182CB2
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 10:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCLJtZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 05:49:25 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34342 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLJtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 05:49:25 -0400
Received: by mail-lf1-f65.google.com with SMTP id i19so4258819lfl.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihDA5z/RB6EziP2l1mK0CTlDF0iu+inIbruq+zZtDCQ=;
        b=Z7CsPvtViFrzA/69kofxcBVaBnbTWNmbuL51JtAh+O33iyTY0Eo6PsMCIvNlF3nM/P
         cUVuzZ3giLxRuysQCRLgfhHVKSp+YGvC2d2nKIuCudR/LIXHV1/y9TWkl4hImqt0yxzk
         zTghrM9Lnt2M1F7TnIBpQWnz4ulugPqOEjnck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihDA5z/RB6EziP2l1mK0CTlDF0iu+inIbruq+zZtDCQ=;
        b=dNMybY0S50vCuwPxr/rWSNflLiB2uZ1nuhrAKFNlKItoj2zyKjkWsXdYcN08yWguaK
         AQTkcHfDxwH8wllP7NznjPkOTIX2BcaOPbxlH3SKtevW9TiJ3Amo8ekFSXYITpeaADln
         n8U1J6Gt7RKC0pAS5xGVUlu8Nvp6pG/kTi0/ICTYXlx1Zt+WQEWfY+QSIqty/toqQ7NP
         ZTKOajdvcrY93uWxmahnGJm/OZR/7vZeJ1cPefs63qlft8lziwho+G+qImrtIVl2SwL6
         QXoKU3o8e/0I/rxi2XXb1OVmrKvNCP8ezDxLwouikpaJY/2qk7ycobSqGwsK8Iq4dzlr
         OhSw==
X-Gm-Message-State: ANhLgQ3TYSnXQchTx1urLqfFLWr2oElEANf+0Kn20QYZwgmly2jlaGs6
        2vUmgGUen8CZcsdQIfJoJEpFEsDK3AiAcjRKeyKC6A==
X-Google-Smtp-Source: ADFU+vs/N/pAegpoMyJQhDsktbDiRdVGouE4qmZM6UzCstoU9btKXYbgO9oLeOdJ4ZD2a+8VDCJ7cl1oH4OYRe+kRzg=
X-Received: by 2002:a19:f00d:: with SMTP id p13mr4700463lfc.147.1584006563275;
 Thu, 12 Mar 2020 02:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com> <c4d7622b-e396-3920-0e14-5a73a0225c0f@xs4all.nl>
In-Reply-To: <c4d7622b-e396-3920-0e14-5a73a0225c0f@xs4all.nl>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Thu, 12 Mar 2020 18:49:11 +0900
Message-ID: <CAD90VcZUqU0nVQEn1vNOQkcicR5GA+HzBGd+M7O_b69f2BCUxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
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

Hi Hans,

On Wed, Mar 11, 2020 at 10:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Dmitry,
>
> On 2/18/20 9:27 PM, Dmitry Sepp wrote:
> > Hi all,
> >
> > This is a v4l2 virtio video driver for the virtio-video device
> > specification v3 [1].
> >
> > The first version of the driver was introduced here [2].
> >
> > Changes v1 -> v2:
> > * support the v3 spec (mostly)
> > * add a module parameter to ask for pages from ZONE_DMA
> >
> > What is not implemented:
> > * Plane layout flags should be used to propagate number of planes to
> >   user-space
> > * There is no real use of stream creation with bitstream format in the
> >   parameter list. The driver just uses the first bitstream format from
> >   the list.
> > * Setting bitrate is done in a different way compared to the spec. This
> >   is because it has been already agreed on that the way the spec
> >   currently describes it requires changes.
> >
> > Potential improvements:
> > * Do not send stream_create from open. Use corresponding state machine
> >   condition to do this.
> > * Do not send stream_destroy from close. Do it in reqbufs(0).
> > * Cache format and control settings. Reduce calls to the device.
>
> Some general notes:
>
> Before this can be merged it needs to pass v4l2-compliance.
>
> I also strongly recommend adding support for V4L2_PIX_FMT_FWHT to
> allow testing with the vicodec emulation driver. This will also
> allow testing all sorts of corner cases without requiring special
> hardware.

I agree that it's great if we could test virtio-video with vicodec,
but I wonder if supporting FWHT is actually needed for the initial
patch.
Though it wouldn't be difficult to support FWHT in the driver, we also
needs to support it in the host's hypervisor to test it. It's not easy
for our hypervisor to support FWHT, as it doesn't talk to v4l2 driver
directly.
Without the host-side implementation, it makes no sense to support it.
Also, if we support FWHT, we should have the format in a list of
supported formats in the virtio specification. However, I'm not sure
if FWHT is a general codec enough to be added in the spec, which
shouldn't be specific to Linux.

Best regards,
Keiichi

>
> Regards,
>
>         Hans
>
> >
> > Best regards,
> > Dmitry.
> >
> > [1] https://markmail.org/message/dmw3pr4fuajvarth
> > [2] https://markmail.org/message/wnnv6r6myvgb5at6
> >
> >
>
