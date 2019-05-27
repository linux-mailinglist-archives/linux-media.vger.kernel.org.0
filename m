Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1B942B87C
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 17:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfE0Pl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 11:41:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39328 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfE0Pl1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 11:41:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so12105517wma.4
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tdsw2aGiBLowdBKompMuLQW0FpeZcju49WmFG8bHyOw=;
        b=ybdiq5GDzdAVwWuupgM0Vyj2TRBmG9n1bTEgd7DCD5KhZsLgMyduZvYjiBX98fmitU
         bjqoEaotnbM2XtAXoWExidPPwYhpO+3qfQF0pgQ1E2bMOeUheDJayDWzbf6I8bm8z2dW
         74NeFGQkTxKdwyV1QbqvLb5z4ykIgEmVs1qc/fNn+PKZUmrenAu+zBO7ZHsRBmPprdFr
         Fk9aXYknb8WelAnOFM9JRIrQOtNVHqjdZitx6wkYHLlMny5I/OULokvXyJzg25c2TTLF
         xJ5HeJcWPT37ChPr5pr2Tr3JBPb46yU0f4aojrereBVSGoH1x+ezLFvTY2aYnkZzwecr
         hoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tdsw2aGiBLowdBKompMuLQW0FpeZcju49WmFG8bHyOw=;
        b=Z3NWVpMGdPw0AsZ/kaTn7cICfzevnSCMR0EFQ+rrpGE4UiUGnH1a0cPaTckRssqbib
         TvIJ6k//gv/1P6uM5h22LOULj94q0iyLM0s9ByvfzBlov3iBgeZRcYDy9+36VcOVFamW
         r8drCfCF6as2DakCq1vcjAFw/Pjco3pO4GWFZRaFh3tLGTTkP+2K3L7gigrhqZNHIGIN
         d5LtyqnE32//5lOlAqRzDIOTXOwBoqutG8eEs7vmYvYh5pvG3Cnl34EIKklCAWn0TIkZ
         KBKGRdwxnUGWuJaUs7Y3JopKnrfF1C+18VM58NBIfoaRDbjdTiHpECELnwcNsBrntd1b
         SZzQ==
X-Gm-Message-State: APjAAAVXrBQgCwUydz5QeAvb6U9xOACX2+1rchY9eTP0+cRW92fV9Y0b
        ZBli5l2mF9jXeOnqG+FgezQhyn52jfXsKmYsKjdHag==
X-Google-Smtp-Source: APXvYqy609IJf/GhOKyCiAwxR8WSs6/tX1M/ieVpzUVpTTjy82ChyMKy4v5VAw0i+AX1iLX+Rwq4+F1lz7sR5gM8dzg=
X-Received: by 2002:a05:600c:2306:: with SMTP id 6mr10042110wmo.162.1558971685659;
 Mon, 27 May 2019 08:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190514135612.30822-1-mjourdan@baylibre.com> <20190514135612.30822-4-mjourdan@baylibre.com>
 <07af1a22-d57c-aff6-b476-98fbf72135c1@xs4all.nl> <CAMO6naz-cG3F_h70Chjt+GprGWe2EShsMjrietu_JBAdLrPbpQ@mail.gmail.com>
 <0821bfd9-58e4-5df3-4528-189476d35d89@xs4all.nl>
In-Reply-To: <0821bfd9-58e4-5df3-4528-189476d35d89@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Mon, 27 May 2019 17:41:14 +0200
Message-ID: <CAMO6nayi+wWU5jqtWkY0riJc6emHiPh7eqpvdzP=U7NgewfwqA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] media: meson: add v4l2 m2m video decoder driver
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 27, 2019 at 4:54 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/27/19 4:44 PM, Maxime Jourdan wrote:
> > Hi Hans,
> > On Mon, May 27, 2019 at 12:04 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> Hi Maxime,
> >>
> >> First a high-level comment: I think this driver should go to staging.
> >> Once we finalize the stateful decoder spec, and we've updated the
> >> v4l2-compliance test, then this needs to be tested against that and
> >> only if it passes can it be moved out of staging.
> >>
> >
> > I chose to send the driver supporting only MPEG2 for now as it keeps
> > it "to the point", but as it turns out it's one of the few formats on
> > Amlogic that can't fully respect the spec at the moment because of the
> > lack of support for V4L2_EVENT_SOURCE_CHANGE, thus the patch in the
> > series that adds a new flag V4L2_FMT_FLAG_FIXED_RESOLUTION. It
> > basically requires userspace to set the format (i.e coded resolution)
> > since the driver/fw can't probe it.
> > At the moment, this is described in the v3 spec like this:
> >
> >>
> >> 1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
> >>
> >>   * **Required fields:**
> >>
> >>     ``type``
> >>         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``
> >>
> >>     ``pixelformat``
> >>         a coded pixel format
> >>
> >>     ``width``, ``height``
> >>         required only if cannot be parsed from the stream for the given
> >>         coded format; optional otherwise - set to zero to ignore
> >>
> >
> > But MPEG2 being a format where the coded resolution is inside the
> > bitstream, this is purely an Amlogic issue where the firmware doesn't
> > extend the capability to do this.
> >
> > Here's a proposal: if I were to resend the driver supporting only H264
> > and conforming to the spec, would you be considering it for inclusion
> > in the main tree ? Does your current iteration of v4l2-compliance
> > support testing stateful decoders with H264 bitstreams ?
>
> The core problem is that the spec isn't finalized yet. The v3 spec you
> refer to above is old already since there are various changes planned.
>
> If you want to test your driver with a v4l2-compliance that is likely
> to be close to the final version of the spec, then you can use this
> branch:
>
> https://git.linuxtv.org/hverkuil/v4l-utils.git/log/?h=vicodec
>
> You can test with:
>
> v4l2-compliance -s --stream-from <file>
>
> I wouldn't be too worried about keeping it in staging. Having it there
> will already be very nice indeed. Just add a TODO file that states that
> you are waiting for the final version of the stateful decoder spec and
> the corresponding compliance tests.
>
> The V4L2_FMT_FLAG_FIXED_RESOLUTION isn't a blocker. That flag makes sense,
> and so it has nothing to do with keeping this driver in staging.
>

Okay, I understand. I will send a v7 with the driver in
staging+TODO+MAINTAINERS update.

Regards,
Maxime

> Regards,
>
>         Hans
>
<snip>
