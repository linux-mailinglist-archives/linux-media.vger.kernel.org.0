Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7437A10F853
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 08:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfLCHIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 02:08:16 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37169 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbfLCHIQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 02:08:16 -0500
Received: by mail-ed1-f68.google.com with SMTP id cy15so2224155edb.4
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2019 23:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iC5Txu63NFJSNzW1dzNBV6asBjJFXTsR/efl5mF2r9g=;
        b=ci/W/zWRcnpEWVi0mvZa343pzOvuEJ4ofZUTMxPyCxX6jySwL43+hEgAh8wrlotEo6
         EQYpN6EF90Jj5Bd0Adl4GgMm9oNf7eRqgINawZW2MIDtxdHurmmlcC7pN1QgkcYwYG12
         wsv7gjekg9UrVWiv1QquSXdmWFk3HkPwPUHxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iC5Txu63NFJSNzW1dzNBV6asBjJFXTsR/efl5mF2r9g=;
        b=esRNJFoqu/fVVOebTb2gpAW8KA5AGYfaSAFVwUjor3gG3P1wkZ8A1mxijYanF0fkjA
         SERDzTuYml07Fmf4lXY+3QCsJIbgKii+b0xa4HB1TzPIGK8UJdM7ag+B+V0NNcAW5bjl
         R1HNWgJASrwd5oWgar+MpPgn7jmVJyjul3n4Zmyyvxm9ULvoYNKZ9J3gs45w0oG9j5VX
         8Ozr9f2fW5Y79JXuCRoMZP4+cYo1R9B8B3XuS2fMHI0HSeuWtTJTGfjWjzYR0Kb3FPId
         Wmt09QOMIWCT5rG3AmQt0ykoHxPILaonN4+a9nIMTZEuq+U0yqBJ2MJewKqL3d5+ZiVr
         0ICw==
X-Gm-Message-State: APjAAAWGoMA4hxurUHgOyXNiXSv9cba5d4jK71ajrT6o6qutbxCefQuB
        zG+w49IKNhPldh51luGkx1Pf8TheAQg=
X-Google-Smtp-Source: APXvYqwGK4lH9sBCY/u/cOTMwrCKqyr7HWZf96EnhAI+8ZTzs2hg177YbSy2k5hxdj/k8SLWTzt6wQ==
X-Received: by 2002:a17:906:19d8:: with SMTP id h24mr4347004ejd.166.1575356893846;
        Mon, 02 Dec 2019 23:08:13 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id br7sm26507ejb.13.2019.12.02.23.08.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2019 23:08:13 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id p17so2176422wmi.3
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2019 23:08:12 -0800 (PST)
X-Received: by 2002:a1c:984d:: with SMTP id a74mr1761230wme.90.1575356892251;
 Mon, 02 Dec 2019 23:08:12 -0800 (PST)
MIME-Version: 1.0
References: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl> <b0ddcd59-cd54-67b8-af63-e7749403f868@xs4all.nl>
In-Reply-To: <b0ddcd59-cd54-67b8-af63-e7749403f868@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 3 Dec 2019 16:08:00 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CQ_TArwzBJ-X+aWNQpYaEO07_5DY_miZGyvXKoyG_jsA@mail.gmail.com>
Message-ID: <CAAFQd5CQ_TArwzBJ-X+aWNQpYaEO07_5DY_miZGyvXKoyG_jsA@mail.gmail.com>
Subject: Re: [ANN] Report of Media Summit: Codecs
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jan Schmidt <jan@centricular.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Matthew Waters <matthew@centricular.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 19, 2019 at 11:18 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/2/19 1:50 PM, Hans Verkuil wrote:
>
> <snip>
>
> > Action Items
> > ------------
> >
> > Hans Verkuil:
> >
> > - Ask Cisco colleagues which bitrate-related parameters have to be per-frame for
> >   an encoder
> > - make stateful encoder infrastructure + documentation for the missing bits
> > - investigate using different sizes for metadata controls in the control framework:
> >   is this possible?
>
> The problem is with compound arrays. struct v4l2_ext_control just provides a size field
> for the total size and so for an array there is no way to discover the actual element
> size.
>
> That said, to my knowledge there are currently no compound arrays defined in the mainline
> kernel.

V4L2_CTRL_TYPE_H264_SLICE_PARAMS is a compound array, with one element
of the array for each slice in the bitstream buffer.

> So one option is to take the last reserved __u32 field and split it in a
> __u16 elem_size and a __u16 reserved2 field, or just use the full __u32 for the elem size
> and drop the reserved2 field.

__u16 would limit the element size to 64k. While I don't see any
controls bigger than that on the horizon (and with the current design
handling such big controls would add a lot of memcpy overhead anyway),
I wonder if that's a good assumption. I'd probably just go with __u32.

>
> Alternatively, we prohibit compound arrays for now and postpone making any changes to
> struct v4l2_ext_control until we actually need this.
>
> As long as it is not an array, then we can safely extend these compound control structs
> later. It requires some work in the control framework, but it isn't too bad.
>
> I'm in favor of implementing this, and for now prohibiting the use of compound arrays.
>
> It is really helpful making these codec state controls at least somewhat future-proof.
>
> Comments?
>
>         Hans
>
> >
> > Michael Tretter:
> >
> > - Support the new encoder stateful controls in the driver
> >
> > Tomasz Figa:
> >
> > - look up AMD encoder support
> >
> > Boris Brezillon:
> >
> > - send v3 of hantro g1 fixes
> >
> > Nicolas Dufresne:
> >
> > - look into multiview and sublayers support
> >
> > Paul Kocialkowski:
> >
> > - check metadata controls against the standards and update the docs if needed
> >
> > Ezequiel Garcia and Boris Brezillon:
> >
> > - add VP9 support
> >
>
