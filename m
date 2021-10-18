Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6554311ED
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 10:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhJRINB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 04:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbhJRINA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 04:13:00 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2E7C06161C;
        Mon, 18 Oct 2021 01:10:49 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w14so67321271edv.11;
        Mon, 18 Oct 2021 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ler5K+pi/RWyNTk3cRDoyW3msmkIcvt+niCNYs4vhI4=;
        b=j25VgagUB0XYzVEYEMPeJiO/TxQgx4vUjZ1vJzNTVYzzFxwNpZiHYbYIZcYCiKmY86
         dw4KLo07GDBDzw9E0ktxZ0tNoL4N/SX4LmArkhZRBhleZMXKofuyAoZrzrDV3xQhEUVV
         9Zt99t4HAWrrY5Goet+JLrN8RbxgU/S4Ch86gZT6lhTr65lyuTcHFZt5TdOPxUhGqs2f
         umFOeDIraJH9RwWWWPXJKpNdidiaP6tQ3FV9S4RpXwPpqTCYNyaD+mgun9Xe/K9U4xz3
         9UElWEdASnaELeZdpJ79gH4gFChkkRBSDsPF6QbnBe5VRbPK42v36XCgQcz8iJhWbT3Q
         x4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ler5K+pi/RWyNTk3cRDoyW3msmkIcvt+niCNYs4vhI4=;
        b=a2Mikyf/1fSNTsw3pOvcagxNIG2vRjvSj/0QuWX/Z6iTYVo8qZA3LsbYvRXT43gv8C
         cuCPlvjaKuAjk25X1pCDkJA/XD8Tcf9C01xdtaqLKFGVOEY8Sdchbc0DmJaROnOS4c5e
         8y4a9OFIAl4QGjZvrUumPOKW8rN2NY7HFPQamV/cQ7pRbdxh6nisZatZC1uOsenOYwXO
         rk5RB6EFh4qE1tfBaDbN35R5BDUih6vg8I8Opl9P+GzcFfoos3zzslJ3biooN98ZRhcx
         l3ICC1spYweiOPypK0OadwBCULbG7qe1NUh2WvkR2gP8QC9QPPSoIgHdsQgZJDlNG+aS
         lRjg==
X-Gm-Message-State: AOAM533HPNyVQKaKDnK+ln0VSPXdiF1IAHo3K7wjR58rA+PMX1Bl0HQy
        CnHH7irO4SLzrazVvAvyO+Cp1itDpIMLUA6w63o=
X-Google-Smtp-Source: ABdhPJy98YOgiwxqoJsGmmJSOytB8DDjqipDtrX/LGPiIMliZzf5JlHUV9Y9vtMJzLjKrx3epk62PT68fO06WMeJ7k4=
X-Received: by 2002:a05:6402:2787:: with SMTP id b7mr41868843ede.238.1634544648018;
 Mon, 18 Oct 2021 01:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211017162337.44860-1-kitakar@gmail.com> <2170cfdf-767f-969c-f241-4e61bfafd1f5@redhat.com>
In-Reply-To: <2170cfdf-767f-969c-f241-4e61bfafd1f5@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 11:10:11 +0300
Message-ID: <CAHp75VcuP4NTYYL6FreW-bdB549T1WNwty74PUFm+LYLeLkdhA@mail.gmail.com>
Subject: Re: [BUG 0/5] bug reports for atomisp to make it work
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 10:51 AM Hans de Goede <hdegoede@redhat.com> wrote:

> Just adding some folks to the Cc.

A hint to the newly added folks, there is an archive of the Linux
kernel related emails located on lore.kernel.org. The quite famous
distros already have in their repositories the `b4` tool that helps to
access that archive. So, after installing that tool you may download
the whole thread as a mailbox or as a bundle ready for `git am` just
using the Message-ID value.

-- 
With Best Regards,
Andy Shevchenko
