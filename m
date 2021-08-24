Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCF13F6A2E
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 22:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbhHXUCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 16:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhHXUCe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 16:02:34 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64044C061757;
        Tue, 24 Aug 2021 13:01:50 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id r6so21678868ilt.13;
        Tue, 24 Aug 2021 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TAm+kCGk2GDukdxIOx+gJZPQO1zRHnOa2C9dkm0C/Sw=;
        b=XS9CGrf8lwAwRkmeCiekQ4GfiOllpzqVqrpHcQ6sTCirBxTIHWznHDJt2Mt4udWFBQ
         onukfP4cg7B3bebifop9iCqyxzwPhz74Tjzp93b5WORSgoZBIwD+Wup0cm3XuEviWuXV
         f9ToQKmh3X7X4UEMH3ix2ABJffYNxHg9z6eFEBVpCS8bFOx05EW/6o4/vvIhnFDn2xvF
         8r0n4bgrsIhQVSWAtwx/HnrCzPg0KFJkRRz/lMwqYtSY//V0QvRm/A82aqW7+SC8K12Q
         xWFSq2KsOsCK26aCBmEGWzl2yT6C++K5Jq/rbjmZ6Rd6ygkdCG8XmRH+jy/keia9Mmh3
         chKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TAm+kCGk2GDukdxIOx+gJZPQO1zRHnOa2C9dkm0C/Sw=;
        b=UnHehuBjrQlPl1am+wUYhpdtjFQIlyo8NALYqZoKKdFTFV02tK2ETH936UkHFtpwEU
         zyoqqGjhmAAWRHDdEaBe42eYjou+w9PG92essWwDyV1xKpbOpg2QjXCiWuUJBlWQO/1S
         DKDQ8rLLRGX14zjP3ax3RFSvyZHTmx369QCakYTG70UZ1fJmsD62psl1L9ikjGUubpRG
         M0XJb/FWQ5DAPWJrlkYYpujou/EvhSZfbpKL+urUek7QgsoAloYE0NbUZZhNBjvWAolP
         LBGmsUrVZ8Ddcc3Qx7vxMcCsbV2FPjTliRvk4hA8NNVboK1+c6CUzz4mdSI2nOrt01D5
         xIcw==
X-Gm-Message-State: AOAM533ziQveSgjxxvRDYHPTSRaOd+SQhgmkSGo9YwbQvQPjnTcZj86c
        agK8mHuODOPzS8UuV0Wtnob7Bfli5mfyTH/OEuw=
X-Google-Smtp-Source: ABdhPJziAangFYiwbr1BIr/qJWI/E6oorUE4/NXB4uJF8zpR9x/etkhIau5oAHk6NxR+v22ExDnfJCkZGOpYUzaNm5M=
X-Received: by 2002:a05:6e02:1107:: with SMTP id u7mr26249109ilk.39.1629835309840;
 Tue, 24 Aug 2021 13:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de> <20210819133128.45ef4353@coco.lan>
 <c56ec571-2278-95e9-2028-990e03159c3f@web.de> <20210822194709.4b9d33d4@coco.lan>
 <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de> <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
 <20210824094754.32ad5eab@coco.lan>
In-Reply-To: <20210824094754.32ad5eab@coco.lan>
From:   Honza P <jpetrous@gmail.com>
Date:   Tue, 24 Aug 2021 22:01:38 +0200
Message-ID: <CAJbz7-2WOXWF=Xt7UUoN=65z5veZSPSSjOyWiE1-3jBeR1AyCA@mail.gmail.com>
Subject: Re: [Regression 5.14] media: dvb userspace api
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Soeren Moch <smoch@web.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

=C3=BAt 24. 8. 2021 v 9:50 odes=C3=ADlatel Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> napsal:
>
> Em Mon, 23 Aug 2021 09:58:00 -0700
> Linus Torvalds <torvalds@linux-foundation.org> escreveu:
>
> > On Mon, Aug 23, 2021 at 7:59 AM Soeren Moch <smoch@web.de> wrote:
> > >
> > > Linus,
> > >
> > > Is what I described directly above the new linux maintenance policy? =
 Or
> > > is linux media a private kingdom where the community should keep away=
?
> > > Is this a place where the subsystem maintainer is on a mission to
> > > destroy everything instead of maintaining and improving it? Please te=
ll
> > > me what I understood wrong here.
> >
> > So technically, the regression policy for the kernel is purely about
> > the ABI - the _binary_ interface. That seems to not have broken - old
> > programs continue to work.
> >
> > We very much try to discourage user space applications from using the
> > kernel header files directly - even projects like glibc etc are
> > supposed to _copy_ them, not include the kernel headers.
>
> Unfortunately, media APIs aren't part of projects like glibc. Almost all
> open source media apps keep their own copies of the uAPI header files.
>
> As far as I'm aware, the "full-feat" API is implemented only by some
> modules of VDR. I don't know any other open source application using
> such headers.
>

You definitely missed tons of users of linux based set-top-boxes,
powered by open-source DVB frondend Enigma2 (and also
still big enough older devices based on Enigma 1 project).
For ex here: https://github.com/OpenPLi/enigma2

/Honza (also retired dvb developer, disgusted the way how
media subsystem was driven)
