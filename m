Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332C51E2613
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 17:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730532AbgEZPx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 11:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727862AbgEZPx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 11:53:27 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56D9C03E96D
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 08:53:26 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id i16so18079992edv.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2+YCVxXRzSpuqAVQmezkaPdjvZxG3n6eGNczGrFBVKQ=;
        b=RaDRF2N6fT6tTHJfeP1bcxjK/BixXWLRPquOH0J+N2D5a8wfpYm53MMdfurtuH/LPS
         xN2Mlf5Dv3BMNTvYfjXAIxKlUbfygV7/DVUjRhwrUQXwiq/8dW+Bvp9IKvY1FBbEUcLQ
         eiutx4G20PAIp7NsOza0LphP4SF/tvb9OzBHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2+YCVxXRzSpuqAVQmezkaPdjvZxG3n6eGNczGrFBVKQ=;
        b=DPHlvjPd01UIWxRAM47ZcDi6ofsVtk5EU4CQE22ZKTFoFpoq7ihcngHYKVxjZ8Dpl0
         AE2LZoypcEyzvLrIO4bGzRVfmcmv2U1Ys4GbRNU1dZ85MaKzVYxPtS0NtAviaYuB9On9
         xuZ9Ksdtye3LixFtw0qyqXCDIQnOaQMUwFJnaGpjQkHsqgLQerAeLxVUU1BtBWjkKwod
         cLByE0YstvF7rOAvEM/v/jWYM5Ya/5FkxY/xDmPo+hwPmDuthSGSnfm4++YIoAeXedfU
         XEnoTknQRvUATiQUt8uXDRPp3RdZs/WeiLf//j/DG3jdMOMN4btY4Jvj6NNJBwMsi8ef
         FmpQ==
X-Gm-Message-State: AOAM531jNYVWxSpi5TH6xSQNZ+ymCRaUKqfTKWSOclLoXw9m5+ZClxj8
        9ymlK8OPp6qqJAgXXLaCMunhq9TDkN4=
X-Google-Smtp-Source: ABdhPJyN9nSBm7eJnv2wdP5XDu6dC+33Bx3ZyxShQf3muAeP155//bjUA+PDna7CA2/Cf+mDFIIIcQ==
X-Received: by 2002:a05:6402:177c:: with SMTP id da28mr20266220edb.378.1590508405424;
        Tue, 26 May 2020 08:53:25 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id r1sm241896eja.57.2020.05.26.08.53.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 08:53:24 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id y17so12495546wrn.11
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 08:53:24 -0700 (PDT)
X-Received: by 2002:a5d:6750:: with SMTP id l16mr20701906wrw.295.1590508403671;
 Tue, 26 May 2020 08:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org> <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
In-Reply-To: <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 26 May 2020 17:53:11 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BwCZm3SDE4DdntrzTAyeshWxsAmFh011tAjiWXrh8wug@mail.gmail.com>
Message-ID: <CAAFQd5BwCZm3SDE4DdntrzTAyeshWxsAmFh011tAjiWXrh8wug@mail.gmail.com>
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 26, 2020 at 12:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 30/04/2020 13:38, Stanimir Varbanov wrote:
> > Here we add two more reasons for dynamic-resolution-change state
> > (I think the name is misleading espesially "resolution" word, maybe
>
> espesially -> especially
>
> > dynamic-bitstream-change is better to describe).
> >
> > The first one which could change in the middle of the stream is the
> > bit-depth. For worst example the stream is 8bit at the begging but
> > later in the bitstream it changes to 10bit. That change should be
> > propagated to the client so that it can take appropriate  action. In
> > this case most probably it has to stop the streaming on the capture
> > queue and re-negotiate the pixel format and start the streaming
> > again.
> >
> > The second new reason is colorspace change. I'm not sure what action
> > client should take but at least it should be notified for such change.
> > One possible action is to notify the display entity that the colorspace
> > and its parameters (y'cbcr encoding and so on) has been changed.
> >
> > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > ---
> >  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > index 606b54947e10..bf10eda6125c 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > @@ -906,7 +906,11 @@ reflected by corresponding queries):
> >
> >  * visible resolution (selection rectangles),
> >
> > -* the minimum number of buffers needed for decoding.
> > +* the minimum number of buffers needed for decoding,
> > +
> > +* bit-depth of the bitstream has been changed,
> > +
> > +* colorspace (and its properties) has been changed.
>
> For this I want to have a new source change flag:
>
> V4L2_EVENT_SRC_CH_COLORIMETRY
>
> Changing colorimetry without changing resolution/bit depth does not
> require buffers to be re-allocated, it just changes how the pixel
> data is interpreted w.r.t. color. And that is important to know.

FWIW, the visible resolution (i.e. compose rectangle) change that is
already defined doesn't require buffers to be re-allocated either.
Backwards compatibility requires V4L2_EVENT_SRC_CH_RESOLUTION to be
set, but perhaps we could have further flags introduced, which would
mean visible resolution and stream format (pixelformat, resolution)
exclusively?

Best regards,
Tomasz
