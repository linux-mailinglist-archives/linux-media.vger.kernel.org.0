Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5647C345E3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfFDLt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:49:28 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:31437 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbfFDLt2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 07:49:28 -0400
X-Greylist: delayed 2084 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Jun 2019 07:49:27 EDT
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x54Bn6uR024495;
        Tue, 4 Jun 2019 20:49:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x54Bn6uR024495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559648947;
        bh=9N5NeHfx2fU/+GKUsh6zL9XmwhyuyoSht+iOnW6e544=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=auj+58e0LnOwMh/t/3iy+Lmc463u1vG77LBGoy955VbsiujWXVGzTmd7RJ//Ulb+N
         jtI17TLQkeFmJEr7WWEK0TwJHB9MUjOaRyBt73ddXbbqd8dt/R8Q3I0qQ5q1tAaq49
         VMAej+PNkxN5JfK+wKUM0qaI6M9hValbzIauHeP7UHPcPdxt4XQrSy0nF4Tn/YDx4C
         plTHlMx+0Jo9ge+iN51/xEUwsOxbzV2E4zqLT3mNlBnBqGQ+Wy0ZLwPMDv4c7/Fegh
         m6yHHInRE87ZHotA59f4AOM1arzgddZsaEsKFl9J5Nnygl9nQUl5GHp4cDF0l62bDW
         Ls3EPKl9Vi1ag==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id e9so7662802uar.9;
        Tue, 04 Jun 2019 04:49:06 -0700 (PDT)
X-Gm-Message-State: APjAAAW9Hnv70lomERxe/edXq6JvbSuhyE6AySi+rFlGkVy2+SbtyOTN
        80VyjEsW9K0tToeHiATMY39piDnXNsQmisDNagQ=
X-Google-Smtp-Source: APXvYqyBuNwYhSBlOhBtt2J0eGochK7GFtRchNYSGgkNWS8Izf41KiE9qlzTzNov/VM4fBzNtDlUxSk4TxSv8TfXOcY=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr330459uaf.95.1559648945837;
 Tue, 04 Jun 2019 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111334.22182-1-yamada.masahiro@socionext.com> <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
In-Reply-To: <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 4 Jun 2019 20:48:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9iz8_wvybmrVFqDaiP3bzxjQ18EUwkvC1LMjR96WWag@mail.gmail.com>
Message-ID: <CAK7LNAR9iz8_wvybmrVFqDaiP3bzxjQ18EUwkvC1LMjR96WWag@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Joe Perches <joe@perches.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 4, 2019 at 8:24 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2019-06-04 at 20:13 +0900, Masahiro Yamada wrote:
> > On the other hand, uapi headers are written in more strict C, where
> > the C++ comment style is forbidden.
>
> Is this a real problem for any toolchain?


I was waiting for this comment!

Which standard should UAPI headers follow?
Is it defined somewhere?

If there is no rule, is it up to subsystem maintainers?

We have a certain of unknowledge in user-space,
I do not know it it is a real problem.


Actually, this patch is related to this thread:
https://lkml.org/lkml/2019/5/22/1441

Thomas and you agreed
// should be avoided for SPDX tags in UAPI headers.

So, I just thought C99 was forbidden for user-space.


If C89/C90 is already fantasy,
let's clearly say "Kernel requires C99 for user-space",
and use // everywhere for SPDX tags?


-- 
Best Regards
Masahiro Yamada
