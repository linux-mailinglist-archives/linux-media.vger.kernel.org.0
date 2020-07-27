Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A931122F310
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 16:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729216AbgG0OxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 10:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728399AbgG0OxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 10:53:05 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A581C061794
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 07:53:05 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id o10so2681632edh.6
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DMgN5tZMxqYrW7jQ12rF21saA28TBC0yxDThKi4Y2Xk=;
        b=hxLR76E4N9viPtHqqQtAE8b60wZVrZdsC9t3ff7Tm0CZxzG/syJaZW3kduG89h50wS
         tq6gKpMa4gYp4isW/rKyf+FqFfB0lxcdUASPxgL2r4qRijur9HU0j4xNot3v0YkOX+Pf
         JVNFga9Tzr/K51kVqTwHwtFqZLJDFRnbhVWN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DMgN5tZMxqYrW7jQ12rF21saA28TBC0yxDThKi4Y2Xk=;
        b=O0VKLjczjYI++IiR0P0BIHDO37YJernbTxCdrK+gWVsiO7f/XKxb9Ln/FoG4RWchn7
         Fj0bK4i+/TVwGax6thBrIgiZhNM1bC27wfq+2uxZZqeep/D3QqR+aX0SoX26eMAMHd8e
         yD8y5BBma1/dZ6EOAw0+PB/dE+TQ9SKxsU4i1nxlqbtKFckQf9Z4gHuaN1iSw/03AEnm
         XggCxO2lsuTeuHoxUlqNOf9N41/HE/A989DLy578BlpJ2WOoVl/9yCWgGINGNFmn1tIN
         x4Xh02TSLygTHkppEHw6/Yo3UtagsesbINh8f3jfeug5h8Ie/H0P80QlsQpIOrYjKJ8y
         JXxA==
X-Gm-Message-State: AOAM532cATVA1PW1T5V7PY5iiK+avodx3nq9nvixkqDJaJS6/uwFmSYJ
        JJxWQJoCF7HMBDalvrR0Lt5cLD7xBGJhaw==
X-Google-Smtp-Source: ABdhPJzB229Bg0LN3GdtaaO1bZYSpMecu6SGnzXiNHxHsf78u0fbaS/5rLUokoRLEjFjWI8H4Ja73A==
X-Received: by 2002:a50:9987:: with SMTP id m7mr19596764edb.176.1595861583571;
        Mon, 27 Jul 2020 07:53:03 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id g6sm7219150ejz.19.2020.07.27.07.53.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 07:53:02 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id y3so15191990wrl.4
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 07:53:02 -0700 (PDT)
X-Received: by 2002:adf:fe12:: with SMTP id n18mr20714835wrr.295.1595861581935;
 Mon, 27 Jul 2020 07:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200715202233.185680-1-ezequiel@collabora.com>
 <20200715202233.185680-9-ezequiel@collabora.com> <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
 <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
In-Reply-To: <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 27 Jul 2020 16:52:50 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DVfroAXRw+OT=EktDtVzRjPZYxnUS8daWQ5=3LLwn=SA@mail.gmail.com>
Message-ID: <CAAFQd5DVfroAXRw+OT=EktDtVzRjPZYxnUS8daWQ5=3LLwn=SA@mail.gmail.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax elements
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 4:39 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Hi Alexandre,
>
> Thanks a lot for the review.
>
> On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> > On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > The H.264 specification requires in its "Slice header semantics"
> > > section that the following values shall be the same in all slice headers:
> > >
> > >   pic_parameter_set_id
> > >   frame_num
> > >   field_pic_flag
> > >   bottom_field_flag
> > >   idr_pic_id
> > >   pic_order_cnt_lsb
> > >   delta_pic_order_cnt_bottom
> > >   delta_pic_order_cnt[ 0 ]
> > >   delta_pic_order_cnt[ 1 ]
> > >   sp_for_switch_flag
> > >   slice_group_change_cycle
> > >
> > > and can therefore be moved to the per-frame decode parameters control.
> >
> > I am really not a H.264 expert, so this question may not be relevant,
>
> All questions are welcome. I'm more than happy to discuss this patchset.
>
> > but are these values specified for every slice header in the
> > bitstream, or are they specified only once per frame?
> >
> > I am asking this because it would certainly make user-space code
> > simpler if we could remain as close to the bitstream as possible. If
> > these values are specified once per slice, then factorizing them would
> > leave user-space with the burden of deciding what to do if they change
> > across slices.
> >
> > Note that this is a double-edged sword, because it is not necessarily
> > better to leave the firmware in charge of deciding what to do in such
> > a case. :) So hopefully these are only specified once per frame in the
> > bitstream, in which case your proposal makes complete sense.
>
> Frame-based hardwares accelerators such as Hantro and Rockchip VDEC
> are doing the slice header parsing themselves. Therefore, the
> driver is not really parsing these fields on each slice header.
>
> Currently, we are already using only the first slice in a frame,
> as you can see from:
>
>         if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
>                 reg |= G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
>
> Even if these fields are transported in the slice header,
> I think it makes sense for us to split them into the decode params
> (per-frame) control.
>
> They are really specified to be the same across all slices,
> so even I'd say if a bitstream violates this, it's likely
> either a corrupted bitstream or an encoder bug.
>
> OTOH, one thing this makes me realize is that the slice params control
> is wrongly specified as an array.

It is _not_.

> Namely, this text
> should be removed:
>
>        This structure is expected to be passed as an array, with one
>        entry for each slice included in the bitstream buffer.
>
> As the API is really not defined that way.
>
> I'll remove that on next iteration.

The v4l2_ctrl_h264_slice_params struct has more data than those that
are deemed to be the same across all the slices. A remarkable example
are the size and start_byte_offset fields.
