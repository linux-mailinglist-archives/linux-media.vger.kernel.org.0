Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E6834A27D
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 08:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhCZHYn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 03:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbhCZHYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 03:24:32 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3526CC0613AA;
        Fri, 26 Mar 2021 00:24:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o10so6207893lfb.9;
        Fri, 26 Mar 2021 00:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Q4qrfujUgu1bYCG/FE9Qi+HfM5toXKLob+B2DA/11oQ=;
        b=SufCp5UNEflN6vgmwlh+SO0eiu+eZQ4LPtuv9gR1c/gGbLt9CVgts2sQyH+Mm/6Dik
         PYq7Rx5g9Yjg8fLpGOhwe+mT7i/XB2Emqx33RzvbwdCC9Y9AuKyVWfC9lLlYgVPGAqFs
         o1ioOUGi10yTEkdBltk+MGQjrENup+GowDcKp3W/VaFYZcQCLse/gQfoXq4cerg2Lk9d
         iQGlK81FOvprB1Kwx8V1dc3LwzId6RPMRtUaYcPdAW3KB1v0bM80UShJ0nQ7AHwd3CpV
         X1D93NXsKM5FFE0BxOxephPSIoBQBzV1Yp6ZmMczGjaChDPBhKbYnQYUkwrF8FUgWrK/
         uikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Q4qrfujUgu1bYCG/FE9Qi+HfM5toXKLob+B2DA/11oQ=;
        b=ELUYMnu8dJbzUeYu46PHweUciQ8v9h+PsnQrTy/I/ZGHvJDk0pWY7MFZK8qlWvvA6p
         jdgY9wodn6gOxB7j5wg7k5UsQzs3fmWjipFSaRyChsJb3lk6TwW+RXhyMnXmi3OQSaDM
         wetaF11bVM38kXRoBKvBvT1lg9cP7CH+e8bV0cwRAaivQOt8mDEnCKxPuPxdf6V9QAAq
         crnFmUAsSYWvuno+SU3f5E9j0/5h0SsGABUWGC/7eVpFH7lJVFAq2v50JBejCeQ7VDjL
         lRAvVFCRcOUrZRuJ+su2hp+AEb49Qg5r8YtC2Cv5dcOgDpzNGP0xC+ncE5Nt+KdIeb8q
         8MVg==
X-Gm-Message-State: AOAM533OSuvA6PDw6kZ1oseBKNmOb9EAoZkD3esIi75azwfwlAZI9UjF
        XyLyYamoiQx7dC8W7JdNj7IdmFlNmewe4jY5qVs=
X-Google-Smtp-Source: ABdhPJz3BJyCZDp6gVKGgBIvBe45a13NbjOwrd+LRTnrW3rAwh7+kw8CRyBp+A+iB3J5pQwgC4/JGQ==
X-Received: by 2002:a05:6512:3e28:: with SMTP id i40mr7822659lfv.454.1616743470624;
        Fri, 26 Mar 2021 00:24:30 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.227.42])
        by smtp.gmail.com with ESMTPSA id l12sm774077lfc.248.2021.03.26.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 00:24:30 -0700 (PDT)
Message-ID: <913828319c9e0b6281ad32361e0246fc95d2c138.camel@gmail.com>
Subject: Re: [PATCH] media: sq905.c: fix uninitialized variable
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Alaa Emad <alaaemadhossney.ae@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Date:   Fri, 26 Mar 2021 10:24:29 +0300
In-Reply-To: <CACT4Y+Y8f6-c6zYCN=d0557xEryAzBfS9n2m=vBcdjHSi5gYcw@mail.gmail.com>
References: <20210325212202.142945-1-alaaemadhossney.ae@gmail.com>
         <YF2JF+UMdt/icEMj@kroah.com>
         <CACT4Y+Y8f6-c6zYCN=d0557xEryAzBfS9n2m=vBcdjHSi5gYcw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

On Fri, 2021-03-26 at 08:14 +0100, 'Dmitry Vyukov' via syzkaller wrote:
> On Fri, Mar 26, 2021 at 8:11 AM Greg KH <gregkh@linuxfoundation.org>
> wrote:
> > 
> > On Thu, Mar 25, 2021 at 11:22:02PM +0200, Alaa Emad wrote:
> > > Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
> > > Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
> > > ---
> > 
> > I know I do not take patches with no changelog text, but other
> > maintainers might be more leniant :(
> 
> I wonder if it's the right fix or not.
> Initializing variables will, of course, silence the warning, but it's
> not necessarily the right fix. I suspect there is something wrong in
> how ret/act_len are user/checked.
> 

There is a problem in usb_bulk_msg() call. It could return before
act_len initialization, so i think, act_len should be intialized with
smth wrong like 0 or -1. BTW, I already send patch for that, but it was
marked as obsoleted.

--
With regards,

Pavel Skripkin

