Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA12B2C5BC5
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 19:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404994AbgKZSNP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 13:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404714AbgKZSNP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 13:13:15 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312B5C0613D4
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 10:13:15 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id u19so1859464edx.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 10:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=abgmav3T1EPQRXxQHK/WkBwRdax89pz8hIJRAurhhbY=;
        b=gWRu3LZnxBKBCafvnjMeAA1l40nQshdFQvpqlySf30NP+2LbhCi6gqibY0LAmMmwLJ
         64vBRm0Rbg7C4TnRkjwoYaZ2h+FFEVZjz0lOBkuIdZXba6EvyPwz5zoXmYWKvz70URdE
         KQXh5iLIq627KwBelDDVwRbPy1bX1eHo2FPhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=abgmav3T1EPQRXxQHK/WkBwRdax89pz8hIJRAurhhbY=;
        b=Yczy8ICte+pO3GOuruAha3rKkNiT7tOorV62CfrzMCXGspNR3Ppb09VGd5PUySTU3A
         ryu4VWwxDRBgeUBYzT+vNCTGoTpuApBxPSh2viWA5ywPty8zFHr9QF7bWiTfY1E3ZrLV
         9oJPy1RTRrCsJYBbHdTUqlDfr20Vw4B42zXzUI4cgSxUNwacCqg56qDq65469W3fAeD9
         xwyH8Lqn4pymEi3tT22IS2QiN5BQoxqfdHw7gBKE/XjXsHGGMgDQm62KDZZPz/GNRfqL
         4XW+GQGkj44XiNJ7lMFmJ+epoRaUMxw7wOtnHCUoDjGirsYFu7L65NHxhw/gH+ZbPK5t
         9Avw==
X-Gm-Message-State: AOAM533Bv2+04v9L/TJ60uUX+t2JocN15GD7btPkq57M4qiJ2SDQJlNP
        jCHP045MiMo8EH5e9F4g3amW8G6JFITjdqHP7eRwEA==
X-Google-Smtp-Source: ABdhPJzjqDe9Oq7UmilKmYj9KicCZjbxV6wjgmKXu3nu6t9wZgV9Lu2Uv1OWu7SUWeFpWtO9frEoQM5xlNU1S2150LA=
X-Received: by 2002:aa7:c61a:: with SMTP id h26mr3805213edq.327.1606414393930;
 Thu, 26 Nov 2020 10:13:13 -0800 (PST)
MIME-Version: 1.0
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
 <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
In-Reply-To: <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
From:   Hirokazu Honda <hiroh@chromium.org>
Date:   Fri, 27 Nov 2020 03:13:03 +0900
Message-ID: <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com>
Subject: Re: How to get last frames in encode sequence returned by v4l2
 encoder driver without V4L2_ENC_CMD_STOP
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        J Kardatzke <jkardatzke@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Alexandre,

On Tue, Nov 24, 2020 at 7:17 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Hi Hiro,
>
> On Fri, Nov 13, 2020 at 6:04 PM Hirokazu Honda <hiroh@chromium.org> wrote:
> >
> > Hi,
> >
> > According to the official v4l2 encoder driver usage description [1],
> > v4l2 steatful encoder driver doesn't have a guarantee when frames fed
> > to a driver will be returned.
> > To make sure all pending frames are output by the driver, an app must
> > call VIDIOC_ENCODER_CMD with cmd=V4L2_ENC_CMD_STOP.
> > However, it is not mandatory to support the command in the current
> > v4l2 stateful encoder API specification.
> > An app can check it by VIDIOC_TRY_ENCODER_CMD beforehand.
> > My question is when an app has to get all the frames of an encoder
> > sequence, how we can achieve this without V4L2_ENC_CMD_STOP support.
> > This demand is natural and in fact WebCodecs [2] requires this.
> >
> > I think there are two options,
> > 1.) Ensure that a driver will eventually output frames if it doesn't
> > support V4L2_ENC_CMD_STOP.
> > 2.) Change V4L2_ENC_CMD_STOP support to be mandatory
>
> Unless I am missing the part of the spec that says the contrary,
> V4L2_ENC_CMD_STOP is part of the encoder specification, and thus is
> mandatory. Some older drivers might not have support for it, in such
> cases the correct course of action would be to fix them.
>

I researched the API documents.
The statement that the support is mandatory to stateful encoders is
added from the latest document v5.9 [1],
It states optional in the API document of v4.19 and v5.8.
Hence my question is obsolete.

[1] https://www.kernel.org/doc/html/v5.9/userspace-api/media/v4l/vidioc-encoder-cmd.html
[2] https://www.kernel.org/doc/html/v4.19/media/uapi/v4l/vidioc-encoder-cmd.html
[3] https://www.kernel.org/doc/html/v5.8/userspace-api/media/v4l/vidioc-encoder-cmd.html?highlight=v4l2_enc_cmd_stop

Best Regards,
-Hiro
> >
> > Any comments are appreciated.
> > Thanks so much in advance.
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#drain
> > [2] https://web.dev/webcodecs/
> >
> > Sincerely,
> > -Hiro
