Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713E32A7087
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 23:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732361AbgKDWcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 17:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728565AbgKDWcD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 17:32:03 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E51C0613CF
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 14:32:02 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id y22so261840oti.10
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 14:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyCrLipxpUSH3s5JKD4KJs2gnedOuRhvcE+wVQyXqrw=;
        b=je27MR45BEcR4fBsFJd9VVbBkBmDzxyQJ14acFX/tbYK8BSPmUiBZzCDSH1cCyYUYd
         Mq2zmZvncoR8YMCpEN1vnIPif+/Ms5eunHoR+N1CLIjtr8ibOszSS4FZHvys6LuSydAI
         /Igsszp6lvAgmrPviL5OeauaTwA+I90ldrFAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyCrLipxpUSH3s5JKD4KJs2gnedOuRhvcE+wVQyXqrw=;
        b=uV1zLWbkVIhfxZWNZLYnHVhA+pNPFFRxzkHvv2qVOZioI63l4oxXfHYQ9dt/goOm1s
         /g3pJdgW8BvlKxzsjQ8ulvulPhViX0fzSxmzErTDkCWV0qp60Ma6EbQqQFUY9xlKDYAf
         ls01/gXBu86ejrw9SoBvsfX0PdQbYnwGiiB0Mp0A0ttT9VVXBxfAK/Yxu8BpkbmbLjEl
         VKRhCvJqN3vzhatTlcnmfyDAjqAK8Ntce3gG9gzCNfHjs6A0tCYj1G7vNb77eBWCRiZn
         0im1fQjyqA5oU6e5ImMsM+vYP9x+6Z8Z3Uoma92p3OEOmElVcvPjTraz1gzMYu1lgtvV
         SJnA==
X-Gm-Message-State: AOAM532/SSjbtwmbNIaNhFhMAlA0kj02QpxttFPZI3JGpOo9MTmjmlPr
        2HhuJ9RRrbIUMlc5A6kzRXDNnFZ7I4eCNjtr
X-Google-Smtp-Source: ABdhPJyQ5ceeZZqBvssB29Q6ZC4KTRSsRAV9vZjFQE6PzKtqixx/C25PM5jMocr9G5TRK7Tsl17d/Q==
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr19513238oth.215.1604529121959;
        Wed, 04 Nov 2020 14:32:01 -0800 (PST)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id c21sm566816oos.30.2020.11.04.14.32.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 14:32:01 -0800 (PST)
Received: by mail-oi1-f176.google.com with SMTP id c80so12430935oib.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 14:32:01 -0800 (PST)
X-Received: by 2002:aca:d07:: with SMTP id 7mr1874oin.15.1604529120516; Wed,
 04 Nov 2020 14:32:00 -0800 (PST)
MIME-Version: 1.0
References: <20201104180734.286789-1-ribalda@chromium.org> <20201104180734.286789-2-ribalda@chromium.org>
 <87769d554b4575bf9371380b013e66d70f1b21c4.camel@perches.com>
 <20201104214201.GH29958@pendragon.ideasonboard.com> <9d439214e8c83ebf7b93dccca2f848fbaf75b9d4.camel@perches.com>
In-Reply-To: <9d439214e8c83ebf7b93dccca2f848fbaf75b9d4.camel@perches.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Nov 2020 23:31:49 +0100
X-Gmail-Original-Message-ID: <CANiDSCvwvQUTt1QMQGGyZPag9VeHj4Ugmj8QJdBNtw00UNt6Pg@mail.gmail.com>
Message-ID: <CANiDSCvwvQUTt1QMQGGyZPag9VeHj4Ugmj8QJdBNtw00UNt6Pg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: uvcvideo: Use pr_cont() macro
To:     Joe Perches <joe@perches.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Wed, Nov 4, 2020 at 10:51 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-11-04 at 23:42 +0200, Laurent Pinchart wrote:
> > Hi Joe,
>
> Hi Laurent.
>
> > On Wed, Nov 04, 2020 at 11:29:30AM -0800, Joe Perches wrote:
> > > On Wed, 2020-11-04 at 19:07 +0100, Ricardo Ribalda wrote:
> > > > Replace all the uses of printk(KERN_CONT ... with pr_cont().
> > >
> > > Perhaps remove the uvc_printk macro and uses and use the more
> > > common pr_fmt and pr_<level> mechanisms.
> >
> > I'd actually go for dev_* instead, to give some context. It's fairly
> > common to have multiple UVC devices connected to a system, so printing
> > the device name would be useful. It can still be wrapped with
> > uvc_printk() if we want to wrap the cast from uvc_device to a struct
> > device (we should actually try to get the device corresponding to the
> > USB interface where available, so we should use uvc_streaming->intf->dev
> > where possible, and fallback to uvc_device->udev->dev otherwise), or
> > drop the wrapper completely.
>
> Of course yes.  I was not going to look around and update the existing
> call sites to find whatever controlling uvc_device * or other struct *
> to a real device that exists though.
>
> It's not even clear from the changes that an appropriate pointer to
> some struct exists in all the functions.
>
> That's work for someone that knows the actual subsystem and I do not.

I have updated my tree with the dev_ variants

https://github.com/ribalda/linux/commit/b8785fd8efb4f2e5bbf5d0f2df3e0d69a5439015

will send it to the tree when I get more feedback from the other patches.

Thanks!

>
> cheers, Joe
>


-- 
Ricardo Ribalda
