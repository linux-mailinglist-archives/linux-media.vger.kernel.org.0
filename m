Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7E634A2A2
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 08:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhCZHkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 03:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhCZHkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 03:40:25 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007EAC0613B0
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 00:40:13 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id i9so4383818qka.2
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 00:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OWJ6BfIQvkV0v3+UUKsijqYsx8uXSSsTRfmaCZgNo6o=;
        b=fMtdhtiivHvye2yYz5hTfGycUKB7juCA9V2qZo4wX9KXmiFdqbZrF6fhQZPAVYlOZT
         jBtnls2MZdgGh/eYNva3VcI889PeBOcLeh+HpHgOtZFfE+knyuD9lt9LGwa+HFRsvbo8
         xqTADkTUaYUtQw/zpTTAFWnwpGLWiWf7y99EgMsewM2mIt4yjyPZ+SsFWgMtG2oo4bfp
         LQq+sVmpBgUEnbtZqEOvQB+V1epA7oQttVm04S5s42p0Mt7uvm05qFRikD4xFemYMNax
         103m9TsZdxUs0E7HGxC7kfrQnvVH64YNLiErwCOQEC2kN76wHw+WUfNbyHua+Dd1fRwr
         /RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OWJ6BfIQvkV0v3+UUKsijqYsx8uXSSsTRfmaCZgNo6o=;
        b=DBbkeeAIlfLGe//CuMvXvZkckj8Vmv/72nJLK+BJ4lrr90BYuxxr3mfzNRqqeGvkUb
         Mk7lTandO8uK5CkYrNlSMh38/QhFU4spRLu0R5Yc67+GL7qRhMFeGRnnR5PAFer89EZ9
         1UbtG42OmKdLaN3F0iC+ejmMrjXONMREs8H2MyzK1bxcfiR+R9+WCM8XdBfaypNrLY6p
         ic97j52GdOmfARDQIqmx1H0cJtSmxodvNPT1AKXcbk6QXVfMv8IXviW4cpKM6leKgUbX
         QRNAo1JmkgzEulEGF2Gn7IOnmg5W8wOycHk6Up7RyD0dSszCZ5fsRq+a3mJ5bFAqHI5J
         fSNA==
X-Gm-Message-State: AOAM531n8al65tE7JBaVynKhGxoks1GmD8eGopNwyio+CjlHRYm0Cpyd
        xAMo+CB0Be46Gm1xTIp3PkstEbeCI98CZ2e+FVkeNw==
X-Google-Smtp-Source: ABdhPJwzFj0L8j4HM7g8kCsyzNDZ4q3S1Isl4+Kv2Ipx3Mxgc5XOGpLcrYdwDvHOLDTAhx5ZhKNtA75eAjNwTIZJGoM=
X-Received: by 2002:a05:620a:2095:: with SMTP id e21mr11610717qka.265.1616744412460;
 Fri, 26 Mar 2021 00:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210325212202.142945-1-alaaemadhossney.ae@gmail.com>
 <YF2JF+UMdt/icEMj@kroah.com> <CACT4Y+Y8f6-c6zYCN=d0557xEryAzBfS9n2m=vBcdjHSi5gYcw@mail.gmail.com>
 <913828319c9e0b6281ad32361e0246fc95d2c138.camel@gmail.com>
In-Reply-To: <913828319c9e0b6281ad32361e0246fc95d2c138.camel@gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 26 Mar 2021 08:40:00 +0100
Message-ID: <CACT4Y+ZSLKWJK6yrLG6=ej4-1_uxnqGhS05rBiD=eFX3GETFEw@mail.gmail.com>
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

On Fri, Mar 26, 2021 at 8:24 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> Hi!
>
> On Fri, 2021-03-26 at 08:14 +0100, 'Dmitry Vyukov' via syzkaller wrote:
> > On Fri, Mar 26, 2021 at 8:11 AM Greg KH <gregkh@linuxfoundation.org>
> > wrote:
> > >
> > > On Thu, Mar 25, 2021 at 11:22:02PM +0200, Alaa Emad wrote:
> > > > Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
> > > > Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
> > > > ---
> > >
> > > I know I do not take patches with no changelog text, but other
> > > maintainers might be more leniant :(
> >
> > I wonder if it's the right fix or not.
> > Initializing variables will, of course, silence the warning, but it's
> > not necessarily the right fix. I suspect there is something wrong in
> > how ret/act_len are user/checked.
> >
>
> There is a problem in usb_bulk_msg() call. It could return before
> act_len initialization, so i think, act_len should be intialized with
> smth wrong like 0 or -1. BTW, I already send patch for that, but it was
> marked as obsoleted.

If usb_bulk_msg returns before act_len initialization, it should
signify that fact with an error code in return value or something,
right? It does not initialize act_len only in case of errors, right?
If so, sq905_read_data must check ret and don't use act_for any
checks. But it does, and that's I think the bug. Or maybe usb_bulk_msg
does not properly signify that it failed (and did not initialize
act_len). Either way silencing the warning with pre-initializing
act_len looks very fishy.
For example, consider, in some contexts it's OK to transmit 0-length
packets, I don't know if it's the case for usb_bulk_msg or not, but it
does not affect the idea. Now, if we pre-initialize act_len to 0, we
can falsely think that such 0-length transfer has succeeded (act_len
== size), while it actually failed (I assume so since usb_bulk_msg
left act_len unitialized).
