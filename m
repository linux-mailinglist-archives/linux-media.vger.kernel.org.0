Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA67109E2E
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 13:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbfKZMmj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 07:42:39 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:49195 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfKZMmi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 07:42:38 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M3UdI-1ia8PH1BOE-000ddA; Tue, 26 Nov 2019 13:42:37 +0100
Received: by mail-qk1-f169.google.com with SMTP id m125so15886140qkd.8;
        Tue, 26 Nov 2019 04:42:37 -0800 (PST)
X-Gm-Message-State: APjAAAUFy0bIsTlQDq/iyB2SwG7MWY+Yv3P3amlnyoRMSf+giqzL+Jl3
        0SrWGlL2/r8Z8EKTLgkws0y3X1PFlEZY8lesClI=
X-Google-Smtp-Source: APXvYqxZA8JxXj72K72enm4zIy+Cn5f1BRNgp5iMFZ+rSxRa/4sdIvli2XYjppzW+HXfnQSEcwiC+mIuhrCKB2uIWPg=
X-Received: by 2002:a37:84a:: with SMTP id 71mr14953966qki.138.1574772155977;
 Tue, 26 Nov 2019 04:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20191111203835.2260382-1-arnd@arndb.de> <20191111203835.2260382-3-arnd@arndb.de>
 <00fea162-508a-b6e1-84ba-1472a94f6945@xs4all.nl> <CAK8P3a3dhruU1k9XtVHZsfmTxt+jL5Pf8jhT77+vce5p=h9U8w@mail.gmail.com>
 <efdeef8a-5ce7-bbe5-8def-e4eec31f13ab@xs4all.nl>
In-Reply-To: <efdeef8a-5ce7-bbe5-8def-e4eec31f13ab@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 26 Nov 2019 13:42:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3FjD4wYv4NNQrKaGCEOte6k5gtOghWuAJRhUk5rdDxPw@mail.gmail.com>
Message-ID: <CAK8P3a3FjD4wYv4NNQrKaGCEOte6k5gtOghWuAJRhUk5rdDxPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] media: v4l2: abstract timeval handling in v4l2_buffer
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uYUiTEWZUw9CmbFYbj25ZafrTuN1dcuL19+YAVYMf3WyGb3KVkL
 3PtpXgKk2t/m1L38Zjk813k+tIApGqWxl1co5qWdceK7L+V5s6/uNlP6m04gL1FNVTn7yU/
 D2IzgdiQnvsoX8P91mtwMx8amDf4I5w0gnTpaGvQLJuCiYIOotgohdY20DYESqPRr1tt72h
 rxt1pfKUjvr8CFeqv1RyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xlkJjo8o5jg=:MVjuQ6SGH+XzhRm0hLY48K
 b/I4NyknkaInVtVjm6Vc8CRUCUbxondKEsNRzHFYpZ3360u4X4SHaHHlTO306SThuzgnuxJVI
 GPdqlxG/7ZP6zG5y34slow3LalNj+wBlsQlDPP0TElGYAEjrvasUQhAxuCcG3+XLVJFpePszF
 NOEFapLmu7cVa/QKviRfibwyjqIgAtFcDnH9KGS3rbpN2qggZV1I5uIaGNFJoEqbfpYOY1OcU
 bv2C6XDdbi0ftZkyTTt6FCE/aQ1ftKDQzwrrSSMmEnNP4h2FP64fvw1VI4q4xbDBkIeoLG+oa
 rb44djCLn7dbzexUyaVb6TkaA8mSTcaF8XPkBLnYL+dmzwvfZ6FsZqtZACwm3LQyrCl/OOvqs
 MtVi1XFr9T6s/xlwx94A1oTj7Sh9OIJiuuuEhhjJtNkPWBHM2mhmsFkNHfGIc43o+ibgmlAcm
 9364u0ygFO2AhdULymACk0ovu9W6dNV+ozYVHpPo9I7KQWBS0rUNj6/P+B8Kl9EuK0qUoawsy
 V2Q8QMxYn/1hU+nY/L8UhLrD0NRibZ0EkezgV3JHz5JqjSKW6Gi4yOmYpPJCIdHvgjRI4w3it
 PJiOQFRJTtDCa4fHhYWvgO7CQ+ps6OJbg0C9pW9tLYFJ6DxEWY+bYwcoB9hM1leFouKLaDMdh
 k7Z7Z3CJe6el1RkbAqZTQDcyZQ9EJUxJs+W+YuvyzrZOPr8KPBzZFy25Z7TFP1d8gTkUmddbF
 a1/ufA07IqW44jbsDUR2WFTihSWPd7cBK+lms+l+xxEpqbZsOqHlHlvQ/5XpDlmL/FrBSQPRk
 1ujcA7y1QF2OXcJzA7Q3u7RhxD9W5V8mtUBZmhexZm8Eh5s0pGTe5DIPdyO9vYM5BHcgrPBrL
 OsWQzAF1p4TT2kXMMH2g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 26, 2019 at 12:43 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 11/26/19 12:34 PM, Arnd Bergmann wrote:
> > On Mon, Nov 25, 2019 at 4:52 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>>
> >>> +static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
> >>> +{
> >>> +     return buf->timestamp.tv_sec * NSEC_PER_SEC +
> >>> +            (u32)buf->timestamp.tv_usec * NSEC_PER_USEC;
> >>
> >> Why the (u32) cast?
> >
> > Simple question, long answer:
> >
> > on 32-bit architectures, the tv_usec member may be 32-bit wide plus
> > padding in user space when interpreted as a regular 'struct timeval',
> > but the kernel implementation now sees it as a 64-bit member,
> > with half of it being possibly uninitialized user space data.
> >
> > The 32-bit cast avoids that uninitialized data and ensures user space
> > passing garbage in the upper half gets ignored, as it has to be on 32-bit
> > user space.
>
> But that's only valid for little endian 32 bit systems, right?
> Is this only an issue for x86 platforms?

Uninitialized data is an issue on all 32-bit architectures. The layout
of the new timeval is such that the low 32 bits of tv_sec are in the
same place on both 32-bit and 64-bit architectures of the same
endianess, but if an application initializes the fields individually
without a memset before it, it may still pass invalid data.

> > On 64-bit native user space, the tv_usec field is always 64 bit wide,
> > so this is a change in behavior for denormalized timeval data
> > with tv_usec > U32_MAX, but the current behavior does not appear
> > worth preserving either.
> >
> > The correct way would probably be to return an error for
> >  tv_usec >USEC_PER_SEC, but as the code never did that, this
> > would risk a regression for user space that relies on passing
> > invalid timestamps without getting an error.
>
> This long answer needs to be added to a comment to that function.
> Because otherwise someone will come along later and remove that
> seemingly unnecessary cast.
>
> It's OK if it is a long comment, it's a non-trivial reason.

Added this comment now:

        /*
         * When the timestamp comes from 32-bit user space, there may be
         * uninitialized data in tv_usec, so cast it to u32.
         * Otherwise allow invalid input for backwards compatibility.
         */

Let me know if you prefer a more elaborate version.

> >> so media/v4l2-common.h would be a good place.
> >
> > Ok, sounds good. I wasn't sure where to put it, and ended up
> > with include/linux/videodev2.h as the best replacement for
> > include/uapi/linux/videodev2.h, changed it to
> > include/media/v4l2-common.h now.
>
> Never use include/linux/videodev2.h. It's just a wrapper around
> the uapi header and should not contain any 'real' code.
>
> It's also why I missed that you modified that header since we never
> touch it.

Ok, got it. I now tried to remove this file completely, hoping that the
include <linux/time.h> is no longer needed after my series, but
it seems we still need it.

       Arnd
