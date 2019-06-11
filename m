Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC9813D2E6
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 18:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405263AbfFKQqn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 12:46:43 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35771 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390050AbfFKQqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 12:46:43 -0400
Received: by mail-wm1-f67.google.com with SMTP id c6so3694587wml.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Oa1a0ha2VFWKL4hOl3AR5/JJhQBtK+rHv8OJZVYJOE=;
        b=zmW43qJ1WbGXv9ft3x7s64Vnm+IeJNhxyK1UNtAGyfDZBlgtmu1Rm0AyqvpY8/TlAY
         /eBz3dhQA3oze1sMtwh2BOoJHKdb0U74VMGDMScKzKramzHZvZs2ZPqLEe+gAXMTIiFp
         8T7n6gd3gRrlnzmAGeEziIbbW36dCxAsrhn+Qc/NTeDt5mWZQpVAUxHI/BbKkautdA6h
         ryIGpqj6qAKSXkg5ZxPLWnkSsCRxefPKB2O4ps8SDUv9JrCzYBoXommeqTGHEgSGsnNW
         OqdIoNXF4KwwcHTB1P0+J+smx0kN1v4aRmZmwwCkwq8UOfgS5T5c8ltXTS98YneFg8WY
         EWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Oa1a0ha2VFWKL4hOl3AR5/JJhQBtK+rHv8OJZVYJOE=;
        b=CAMsekTUCLT73bUmpxUlHTtmmKdlS/hdunNBsDzMqgzC3Tt4QylMgUS090WBRaY9Bh
         HC41/n1vePzgaSwzZz7tGnxHoRgqACO9W015A43sRf5dTjPqFvB801mjLNVdmfHJSvzA
         eXg15Y7nw8aW81yruOyKQki7gh53ITcPk2Q+QwSRkqOyziahOe8LA/jULQt/TaYfzsfg
         SS/W5cgu5W0QbaolgTxvEXLRLIZznq3/OnD0XStYVCgyZX86/In+Z7G0eQVYmAr2KiJw
         oKLfrgnLS4EoL2VaN22DtnG6/eYciM3Txo//SGehHbi8epJEGQ09YSyBCxtpLt97ZrUp
         OzHA==
X-Gm-Message-State: APjAAAWgNSBBcFGNNBqBB5zfRNC9pMTf8+sxm3rP/W+bZ3yO2eLUiwjY
        3AOpkqI9hm+KGka1Y8ywO6av4UMEVcCwF1v6bNWcfA==
X-Google-Smtp-Source: APXvYqwOTBzax/Bo1qTWBfM1CDJxB5KQdXLtYfzeBs/j1zfJNjbpVse7cHa0fYLPcpz8C2kvJMABP1q9b5JMh4sV8Vs=
X-Received: by 2002:a1c:ed07:: with SMTP id l7mr17182843wmh.148.1560271600864;
 Tue, 11 Jun 2019 09:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190609143820.4662-1-mjourdan@baylibre.com> <20190609143820.4662-2-mjourdan@baylibre.com>
 <CAAFQd5AR1SXdMp6xiCEksrmpF7qk+Tg2-w7Ogw47GZx1pU6T_Q@mail.gmail.com>
In-Reply-To: <CAAFQd5AR1SXdMp6xiCEksrmpF7qk+Tg2-w7Ogw47GZx1pU6T_Q@mail.gmail.com>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Tue, 11 Jun 2019 18:46:29 +0200
Message-ID: <CAMO6nayMpngjM0k5ZQ08WPDhE5z4gCCxjRGnAzUp7fbrJJd45w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Tomasz Figa <tfiga@chromium.org>
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

Hi Tomasz,
On Mon, Jun 10, 2019 at 5:48 AM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Maxime,
>
> On Sun, Jun 9, 2019 at 11:38 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
> >
> > Add a enum_fmt format flag to specifically tag coded formats where
> > dynamic resolution switching is supported by the device.
> >
> > This is useful for some codec drivers that can't support dynamic
> > resolution switching for all their listed coded formats. It allows
> > userspace to know whether it should extract the video parameters itself,
> > or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE when
> > such changes are detected.
> >
>
> First of all, thanks for the patch!
>
> Given the aspect of compatibility and also the general preference for
> the drivers to actually handle dynamic resolution changes, I'd suggest
> inverting the meaning of this flag. With something like
> "V4L2_FMT_FLAG_STATIC_RESOLUTION" it would be more of an exception
> rather than the default behavior.
>

This is actually what I did to begin with [0], with the same
reasoning: not supporting dynamic resolution for a certain coded
format is more of an exception than the norm (for decoders).
The patch was ultimately dropped from the meson vdec series after
discussing with Hans, see [0] or the lkml link Hans provided in his
answer.

We have the chance today that stateful decoders in the kernel either
support V4L2_EVENT_SOURCE_CHANGE and dynamic resolution switching for
all their formats, or they don't expose V4L2_EVENT_SOURCE_CHANGE at
all.
While this flag would change the spec, it wouldn't break existing
userspace using close-to-spec drivers like s5p-mfc or mtk-vcodec.

Cheers,
Maxime

[0] https://patchwork.kernel.org/patch/10969829/

> Best regards,
> Tomasz
