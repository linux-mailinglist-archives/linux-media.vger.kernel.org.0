Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E537034A2F4
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 09:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCZIHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 04:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhCZIGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 04:06:47 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DDFC0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 01:06:47 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id o19so2548384qvu.0
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 01:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hzAVT09WfhCKkngDprHIA2c8Cg/0PKy+euDvs2tl2jQ=;
        b=pc5BFRIsqvU/6A6fZz5e05qOO9zlx/g35iSBr2r88tcHVkvIEQ1iviNyZNw384ULQd
         jtoxja25rrycgRFjfyvVQT597wBI0T+bIPYSM1G79670s9xT5g9akE5vHf4SpYX08xu1
         UY8M6H8yqtQUNcKh/9yGutP/r+U0b0M1fM7aengLYK6bZa6bDgT7A2QcbgsPXd/qINGy
         prv3dWZrvv0P/yFhTZ6SGIH4oMUqSqEET7vrM1GTE1SoFbnPXlLiO8vcMsIcZkwZD27+
         hvNSqVtNIrG+30ql4sp3V/Rrzjt9i49xcK1wUbDs+0qcJpoTYn7lo40VjP1rxVbtNK7s
         edrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hzAVT09WfhCKkngDprHIA2c8Cg/0PKy+euDvs2tl2jQ=;
        b=oaHP+Oab68SXzUxIPphUr9WRG+0dYASSvOJl9Vyk1gsu6YIugwp1sv3vUUQpeqmQRK
         oUMUQgtfJ4qNjId5smHFwveNFq2ZJcGYlgD4qOVfsBxMz0S3KOnYmINdA5fpXpUX1Yds
         uFqGZgCbyTBM3CK21Z9KkVYIYyE2qJvvuIeV3jVpjrEEvvYfShklJnUxtneIGHcQ1ojv
         MZLp7Rh75EcTjYME9Ox8KdBqYZQbq2CAIzrKUGvppdo7fs7xG9p1QSLMqhpCR7Bu2s35
         DX72BkhQaJjO+qHoqqBTxRBx93PFX+HNWA6tIm3C39977GAYah7gMqdfQLxX14/n7Ehh
         1D4Q==
X-Gm-Message-State: AOAM5326SyYahjW1Ep1TCI52SX60c3yeRNz1zRFqFDChexeBsHNBIpxm
        R59+4Mgf/S2enZUKsnQ9j/0mirxQZ+aXZ2a/Kds5kg==
X-Google-Smtp-Source: ABdhPJyQTRLW1/WPUvL7pmbRqYVUjw+4QmSRbkl4MFgcfr2IpuvxZ/HNHKRa+FU/nUmaf5QsmtETrvs79XOnSMT0ShI=
X-Received: by 2002:ad4:50d0:: with SMTP id e16mr12348421qvq.37.1616746006008;
 Fri, 26 Mar 2021 01:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210325212202.142945-1-alaaemadhossney.ae@gmail.com>
 <YF2JF+UMdt/icEMj@kroah.com> <CACT4Y+Y8f6-c6zYCN=d0557xEryAzBfS9n2m=vBcdjHSi5gYcw@mail.gmail.com>
 <913828319c9e0b6281ad32361e0246fc95d2c138.camel@gmail.com>
 <CACT4Y+ZSLKWJK6yrLG6=ej4-1_uxnqGhS05rBiD=eFX3GETFEw@mail.gmail.com> <f635ac6050755703d7ebc079b188e1c9acb04279.camel@gmail.com>
In-Reply-To: <f635ac6050755703d7ebc079b188e1c9acb04279.camel@gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 26 Mar 2021 09:06:35 +0100
Message-ID: <CACT4Y+bYTRon-NY7DxbU2sZ1_Fk1SYTYF-hMej5WPdQFg+G_oQ@mail.gmail.com>
Subject: Re: [PATCH] media: sq905.c: fix uninitialized variable
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Alaa Emad <alaaemadhossney.ae@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 26, 2021 at 8:53 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> Hi!
>
> On Fri, 2021-03-26 at 08:40 +0100, Dmitry Vyukov wrote:
> > On Fri, Mar 26, 2021 at 8:24 AM Pavel Skripkin <paskripkin@gmail.com>
> > wrote:
> > >
> > > Hi!
> > >
> > > On Fri, 2021-03-26 at 08:14 +0100, 'Dmitry Vyukov' via syzkaller
> > > wrote:
> > > > On Fri, Mar 26, 2021 at 8:11 AM Greg KH
> > > > <gregkh@linuxfoundation.org>
> > > > wrote:
> > > > >
> > > > > On Thu, Mar 25, 2021 at 11:22:02PM +0200, Alaa Emad wrote:
> > > > > > Reported-by:
> > > > > > syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
> > > > > > Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
> > > > > > ---
> > > > >
> > > > > I know I do not take patches with no changelog text, but other
> > > > > maintainers might be more leniant :(
> > > >
> > > > I wonder if it's the right fix or not.
> > > > Initializing variables will, of course, silence the warning, but
> > > > it's
> > > > not necessarily the right fix. I suspect there is something wrong
> > > > in
> > > > how ret/act_len are user/checked.
> > > >
> > >
> > > There is a problem in usb_bulk_msg() call. It could return before
> > > act_len initialization, so i think, act_len should be intialized with
> > > smth wrong like 0 or -1. BTW, I already send patch for that, but it
> > > was
> > > marked as obsoleted.
> >
> > If usb_bulk_msg returns before act_len initialization, it should
> > signify that fact with an error code in return value or something,
> > right? It does not initialize act_len only in case of errors, right?
> > If so, sq905_read_data must check ret and don't use act_for any
> > checks. But it does, and that's I think the bug. Or maybe usb_bulk_msg
> > does not properly signify that it failed (and did not initialize
> > act_len). Either way silencing the warning with pre-initializing
> > act_len looks very fishy.
> > For example, consider, in some contexts it's OK to transmit 0-length
> > packets, I don't know if it's the case for usb_bulk_msg or not, but it
> > does not affect the idea. Now, if we pre-initialize act_len to 0, we
> > can falsely think that such 0-length transfer has succeeded (act_len
> > == size), while it actually failed (I assume so since usb_bulk_msg
> > left act_len unitialized).
>
> You are absolutely rigth, and sq905_read_data doesn't use act_len for
> checks in case of usb_bulk_msg fail. But it uses it for error printing:
>
>         if (ret < 0 || act_len != size) {
>                 pr_err("bulk read fail (%d) len %d/%d\n", ret,
> act_len, size);
>                 return -EIO;
>         }
>
> So, value like -1 can be a flag for smth went wrong internally. Or
> maybe remove this error log and replace it with other, which will rely
> on error code, idk how it will be better

Oh, you are right.
I was thinking it's the "ret < 0 || act_len != size" check where we
use uninit act_len, which would be much worse.
We could preinitialize act_len to, say, -1. But future readers may be
confused as to why we need to init it (as I was confused).
So another option may be to handle it during printing as:

pr_err("bulk read fail (%d) len %d/%d\n", ret, ret < 0 ? -1 : act_len, size);

It makes the intentions very explicit for a future reader.
