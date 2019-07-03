Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B4B5E0F7
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 11:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfGCJY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 05:24:29 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40289 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfGCJY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 05:24:29 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so1360139eds.7
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhHPfQGlndbA8oi+QW+5dq5HVpW84z/IoMjC7IB6Ax4=;
        b=lhB2El1Hhm97dgirKUL9kxxpDXkKFkHVoEjXPIabNt29zPX6wFvVvWuK5In1atmaRP
         cNRh52RD7UebEQBB6WMV9KlWG0rj41TE1L+3eZ1bhDGjzm1tbu4Hpg238OH3l/Cj0U1x
         vtAQhvVsDOQv0sFbFrCLJUhNIkz3kRFu/P9Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhHPfQGlndbA8oi+QW+5dq5HVpW84z/IoMjC7IB6Ax4=;
        b=prg2gxdr7x72TYMmIGhTd8sYGkFFx3LTWhF6AIV4S/9Gi7c9jxcn0dIpzxJ2hq9pqU
         PVHd2UV9HHWapmzGLYTukbf/8vkQTxZGHSpowLDHASzoCavE/FykqMRt/yi14AhRQckI
         3klno3mEKP3BipSqUvThsOh7IfRqQ239WCnICf6qgJdVWva4tL822PJng2O3oq2vM94u
         ZBkb6THI/1SVeggqTlCQLcyzONUrDPag+f98XeE9gJxo0SkslpIK1Z0PlPZibzaj+0Nz
         0JfJ5NwApyuo+0RAZBl5uW5z+GqSdb454q9tCpm56Ns+oQIm79vwprixGrMfQKcnT1At
         spZg==
X-Gm-Message-State: APjAAAUuJRuNJ8luZdR2zSd36qWoAsIikEaHoUU23n7nLFzBhdf0Li3o
        TdD9xQIHFA4dNgoftgeLlmCtol6Rf6M99g==
X-Google-Smtp-Source: APXvYqx6c1ugkakkm+otSXokPqZbtLx+YYBfSlxdi7PzIVkGbJmb1bhcaKmYaU2Npb8kIy6LNhyS6g==
X-Received: by 2002:a17:906:7855:: with SMTP id p21mr33505781ejm.287.1562145867235;
        Wed, 03 Jul 2019 02:24:27 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id v12sm343202ejj.52.2019.07.03.02.24.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:24:26 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id s3so1426180wms.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 02:24:26 -0700 (PDT)
X-Received: by 2002:a1c:343:: with SMTP id 64mr7609955wmd.116.1562145865923;
 Wed, 03 Jul 2019 02:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190609143820.4662-1-mjourdan@baylibre.com> <20190609143820.4662-2-mjourdan@baylibre.com>
 <CAAFQd5AR1SXdMp6xiCEksrmpF7qk+Tg2-w7Ogw47GZx1pU6T_Q@mail.gmail.com> <CAMO6nayMpngjM0k5ZQ08WPDhE5z4gCCxjRGnAzUp7fbrJJd45w@mail.gmail.com>
In-Reply-To: <CAMO6nayMpngjM0k5ZQ08WPDhE5z4gCCxjRGnAzUp7fbrJJd45w@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 3 Jul 2019 18:24:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AcLfihfrhhvwDiKLHA4t9L9R1=BPUAQWJ3vSc61LGzgw@mail.gmail.com>
Message-ID: <CAAFQd5AcLfihfrhhvwDiKLHA4t9L9R1=BPUAQWJ3vSc61LGzgw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 12, 2019 at 1:46 AM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>
> Hi Tomasz,
> On Mon, Jun 10, 2019 at 5:48 AM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > Hi Maxime,
> >
> > On Sun, Jun 9, 2019 at 11:38 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
> > >
> > > Add a enum_fmt format flag to specifically tag coded formats where
> > > dynamic resolution switching is supported by the device.
> > >
> > > This is useful for some codec drivers that can't support dynamic
> > > resolution switching for all their listed coded formats. It allows
> > > userspace to know whether it should extract the video parameters itself,
> > > or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE when
> > > such changes are detected.
> > >
> >
> > First of all, thanks for the patch!
> >
> > Given the aspect of compatibility and also the general preference for
> > the drivers to actually handle dynamic resolution changes, I'd suggest
> > inverting the meaning of this flag. With something like
> > "V4L2_FMT_FLAG_STATIC_RESOLUTION" it would be more of an exception
> > rather than the default behavior.
> >
>
> This is actually what I did to begin with [0], with the same
> reasoning: not supporting dynamic resolution for a certain coded
> format is more of an exception than the norm (for decoders).
> The patch was ultimately dropped from the meson vdec series after
> discussing with Hans, see [0] or the lkml link Hans provided in his
> answer.
>
> We have the chance today that stateful decoders in the kernel either
> support V4L2_EVENT_SOURCE_CHANGE and dynamic resolution switching for
> all their formats, or they don't expose V4L2_EVENT_SOURCE_CHANGE at
> all.
> While this flag would change the spec, it wouldn't break existing
> userspace using close-to-spec drivers like s5p-mfc or mtk-vcodec.

Fair enough. Feel free to add my Reviewed-by, after Hans's comments are fixed.

Best regards,
Tomasz

>
> Cheers,
> Maxime
>
> [0] https://patchwork.kernel.org/patch/10969829/
>
> > Best regards,
> > Tomasz
