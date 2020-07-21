Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB4A227AFB
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 10:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgGUIqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 04:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUIqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 04:46:51 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090ADC061794
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 01:46:51 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q6so2177765ljp.4
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65aNYDMHso00QBpYKlJQ2NuOwOKHTaALj+/FvCeLQ34=;
        b=sBtQrgeXFs7uHWLQjkXwaQ7oDfcP1FZFjsYMa38Qs2uhbqiamAw1iqSfqzPx14VrAI
         86pWqy6lzMbQND7IYV/tI9v9ZW89XxUUP5DggUW/08WWmsjtCPy0kEp/kZYgv+i1Cyhe
         gjYf40x6nMJWbuovtRzC3AvnUhTy3fAHiDmrS6Q18UyI6jt5myIOmf5EXl3PirrqUkmX
         NjysXiBQ86kZ00cKiVRoPQFzDUxQx+OHJ/SgGfUzCbd/TKdbbNhqTgIEq08QwqHzgxay
         3jQnOQwOzPL+9q5DAYfKGqp/XpiH9CeuaBj1BGYIPZL9/pyYsDMrQ9SzgbFeM5TkQR9S
         cfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65aNYDMHso00QBpYKlJQ2NuOwOKHTaALj+/FvCeLQ34=;
        b=EU63QnpyRhIY/RjIGXUFuQ1Azk7tAnH7V5+X/N9jHe3F8y1EGgpLE+I7jzNRFgJh1X
         naYl6wziJ8fB2CSdzWB2zstQw0eYn3Es6Uf4R0wiQDobamuc4uPEHMndDFt0Yh1+hF0Y
         IlIQXaAHntyzP2E6NsMloRcQYiY3ii59F+qU2CbncYDloiZjMvpDwMacofVbIFAPxZfU
         468MXdeCgoEzBL8TjFM4c29ZSztewZ/837LQO9qEHZxGVM1za9oVAJzIV7OP4Gtmf+N3
         HiaZJvV/XhpUGbHbIZkC/UrWwELvVCpj3qDs6gRCKdrzHiBHfhtY4SaI88+IpkaF6h0l
         2+Dg==
X-Gm-Message-State: AOAM533rMiyo1E/k2xUThmgKNBo8DlfMwKmhLYqtm2zwyGfim7knHskc
        1mggMJ9eslfhEJNZh3U7B21/5v2Xfp+rHcN4JbvOug==
X-Google-Smtp-Source: ABdhPJxGXm2fBsKUpZKPxL7HWctJNjr7DBqn3XFbOZNZvaqD4loXHv8b2yCGJDCLqp6h9GETa0Hhz6bps6x6UFVYuIo=
X-Received: by 2002:a2e:b4ed:: with SMTP id s13mr12396288ljm.296.1595321208788;
 Tue, 21 Jul 2020 01:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200721075642.4cdlzbewml5jwbwm@pesu.pes.edu> <20200721083539.GJ2549@kadam>
In-Reply-To: <20200721083539.GJ2549@kadam>
From:   B K Karthik <bkkarthik@pesu.pes.edu>
Date:   Tue, 21 Jul 2020 14:16:37 +0530
Message-ID: <CAAhDqq0SR2cKhetYTrHB2b2OMgEOi4JHgA1Syg1Lc0+umD=p2Q@mail.gmail.com>
Subject: Re: [PATCH] fix WARNING in pvr2_i2c_core_done
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 21, 2020 at 2:05 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The subject isn't right.  Cc the correct people from get_maintainer.pl

I'm sorry, but I just wanted syzbot to test this because I was unable
to test it myself for some reason
>
> On Tue, Jul 21, 2020 at 01:26:42PM +0530, B K Karthik wrote:
> > i2c_acpi_remove_space_handler makes a call to
> > kmem_cache_free() through acpi_ut_delete_generic_state
> > in drivers/acpi/osl.c. since this removes the kobject,
> > there is a warning thrown in i2c_del_adapter. The group
> > can not be found because it has already been removed.
>
> The commit message needs to have a cut and paste of the warning.
> I don't think you can't ask syzbot to test linux-next when the patch is
> not in linux-next.
>
> https://lkml.org/lkml/2019/9/25/302
>
> There was some discussion about this bug in Sept and it looked like the
> correct fix was to unregister in the release handler instead of the
> disconnect handler.  I'm not sure if the pvr2 maintainers were ever
> CC'd about this or if anyone wrote a patch.
>
Yes, I'm aware of that discussion. I am not sure what exactly you mean
by release and disconnect handlers though.
And yes, I did not find a patch that makes the change you said.

Forgive me, but i noticed this:

in i2c_del_adapter+0x373/0x660 drivers/i2c/i2c-core-base.c:1516
(quoted from crash log)
i2c_acpi_remove_space_handler(adap); that takes us to
drivers/i2c/i2c-core-acpi.c:753
acpi_remove_address_space_handler() that takes us to
drivers/acpi/acpica/evxfregn.c:205
acpi_ut_remove_reference() that takes us to drivers/acpi/acpica/utdelete.c:736
acpi_ut_update_object_reference() that takes us to
drivers/acpi/acpica/utdelete.c:654
acpi_ut_delete_generic_state() that takes us to drivers/acpi/osl.c:1708

where a call to kmem_cache_free() is made.
Hence, the object does not exist anymore. (am i right?)

now that i know the object does exist, was it meant to be '0-0011' ?

later in the same function
in i2c_del_adapter+0x373/0x660 drivers/i2c/i2c-core-base.c:1532
(function name quoted from crash log)
a call to i2c_unregister_device() is made, where it tries to
unregister the device and it is a 2 pass process.

it tries to unregister the client device first, and then the dummy
device since we can not remove
the dummy devices during the first pass. (comment in
drivers/i2c/i2c-core-base.c:1540)

hence, the problem is not with the sysfs group, but with the invalid kobject.
that is why in the bug reported, it says kobject '0-0011' (am i right?)

if this is what you meant, sorry for wasting your time.

I thought since a call to kmem_cache_free() is being made, the kobject
was removed.
thus, i sent a patch with the if() statement. If i am thinking the
wrong way, please let me know.

thanks,

karthik
