Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70BEE5E072
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 11:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfGCJEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 05:04:38 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45751 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbfGCJEi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 05:04:38 -0400
Received: by mail-ed1-f67.google.com with SMTP id a14so1281157edv.12
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q/EYz2rSpQqq5aTgZ1tZo0aZ4bOY/6+aI3OLsg1wExc=;
        b=nncV+N97AgUiMkEcr3PyqwUVCi/flMy0shrmwVJcLqyjTsaytge8nr7U2CuCK2JDKG
         dFZoJZ/ShU43HlX6Af1U/VfEr6YA0ExzbHURymZaLEVNkQ/1bpgsJirnRaFGE6M+eaSb
         dmuxzpxzeN0PyN2G/AQG0qWQUYmTJ0Ormdd88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q/EYz2rSpQqq5aTgZ1tZo0aZ4bOY/6+aI3OLsg1wExc=;
        b=QZqI9qk/1khFbDDo88w/svgR9lb4xsO52kdNnSuaHe81vWt+rNXxFaASPoyiyi2gbz
         CYMsArSd2MrNeJe6vhhxVO9mg2GRHbZJhIeQM0GG1TifMVD3PUTUAt74Rrzw7gcW1aSM
         NlDKphWv2KcmdLqmUe5TFUo8hQjK8sxROw1JiAChmN++pgLha+dIyJab4quZyrjk700E
         g3x9ocHl+w7RJKYr4hoHggjtOnVXj11Db0YTFDhoVnrqhK9pluhd9dYdTuK0lgROMvEQ
         ZYiMCgSh23KlEocgxgALI/yqTUDml5f6rRpqqOQHT4BoacKxu/AC5SlXRIwPJZcX2IvZ
         /2Qg==
X-Gm-Message-State: APjAAAUhcKdqCDTMOvF3bL805sfjG3tklBtVU0zLOhQSJ71ult1GxjBx
        FrbJGgtXTozA+Iv+QxAvG6Xzhvq9G9EHsg==
X-Google-Smtp-Source: APXvYqywOpiQgbPmtQn+VZ+UUhh+UJNNtPlWw5PUtuPE70p8in1L0lGuA1s9SALvC/sXbs0Uq701pQ==
X-Received: by 2002:aa7:ccd6:: with SMTP id y22mr41263192edt.274.1562144675373;
        Wed, 03 Jul 2019 02:04:35 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id f36sm496891ede.47.2019.07.03.02.04.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:04:34 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id a10so746108wrp.9
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 02:04:34 -0700 (PDT)
X-Received: by 2002:adf:f246:: with SMTP id b6mr29292267wrp.92.1562144674125;
 Wed, 03 Jul 2019 02:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl> <1cb8cc0c89f0017962226fdb84ae11e763fdd233.camel@ndufresne.ca>
In-Reply-To: <1cb8cc0c89f0017962226fdb84ae11e763fdd233.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 3 Jul 2019 18:04:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A0gg4RCKkPd-m2_5=ZyDzZ7hnH9AnTrt7ciXQPPHZU2Q@mail.gmail.com>
Message-ID: <CAAFQd5A0gg4RCKkPd-m2_5=ZyDzZ7hnH9AnTrt7ciXQPPHZU2Q@mail.gmail.com>
Subject: Re: [PATCHv4 0/2] Document memory-to-memory video codec interfaces
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 5, 2019 at 12:19 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le lundi 03 juin 2019 =C3=A0 13:28 +0200, Hans Verkuil a =C3=A9crit :
> > Since Thomasz was very busy with other things, I've taken over this
> > patch series. This v4 includes his draft changes and additional changes
> > from me.
> >
> > This series attempts to add the documentation of what was discussed
> > during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
> > later Embedded Linux Conference Europe 2014 in D=C3=BCsseldorf and then
> > eventually written down by Pawel Osciak and tweaked a bit by Chrome OS
> > video team (but mostly in a cosmetic way or making the document more
> > precise), during the several years of Chrome OS using the APIs in
> > production.
> >
> > Note that most, if not all, of the API is already implemented in
> > existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention of
> > this series is just to formalize what we already have.
> >
> > Thanks everyone for the huge amount of useful comments to previous
> > versions of this series. Much of the credits should go to Pawel Osciak
> > too, for writing most of the original text of the initial RFC.
> >
> > This v4 incorporates all known comments (let me know if I missed
> > something!) and should be complete for the decoder.
> >
> > For the encoder there are two remaining TODOs for the API:
> >
> > 1) Setting the frame rate so bitrate control can make sense, since
> >    they need to know this information.
> >
> >    Suggested solution: require support for ENUM_FRAMEINTERVALS for the
> >    coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
> >    (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow bot=
h
> >    S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both sinc=
e
> >    this is not a CAPTURE vs OUTPUT thing, it is global to both queues.
>
> I agree, as long as it's documented. I can imagine how this could be
> confusing for new users.
>
> >
> > 2) Interactions between OUTPUT and CAPTURE formats.
> >
> >    The main problem is what to do if the capture sizeimage is too small
> >    for the OUTPUT resolution when streaming starts.
> >
> >    Proposal: width and height of S_FMT(OUTPUT) are used to
> >    calculate a minimum sizeimage (app may request more). This is
> >    driver-specific.
> >
> >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> >    for the encoder (i.e. we don't support mid-stream resolution
> >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> >    the patch adding this flag.
> >
> >    Of course, if we start to support mid-stream resolution
> >    changes (or other changes that require a source change event),
> >    then this flag should be dropped by the encoder driver and
> >    documentation on how to handle the source change event should
> >    be documented in the encoder spec. I prefer to postpone this
> >    until we have an encoder than can actually do mid-stream
> >    resolution changes.
> >
> >    If sizeimage of the OUTPUT is too small for the CAPTURE
> >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> >    then the second STREAMON (either CAPTURE or OUTPUT) will
> >    return -ENOMEM since there is not enough memory to do the
> >    encode.
>
> You seem confident that we will know immediately if it's too small. But
> what I remember is that HW has an interrupt for this, allowing
> userspace to allocate a larger buffer and resume.
>
> Should we make the capture queue independent of the streaming state, so
> that we can streamoff/reqbufs/.../streamon to resume from an ENOMEM
> error ? And shouldn't ENOMEM be returned by the following capture DQBUF
> when such an interrupt is raised ?
>

The idea was that stopping the CAPTURE queue would reset the encoder,
i.e. start encoding a new, independent stream after the streaming
starts again. Still, given that one would normally need to reallocate
the buffers on some significant stream parameter change, that would
normally require emitting all the relevant headers anyway, so it
probably doesn't break anything?

Best regards,
Tomasz
