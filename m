Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A550F1CF33A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 13:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgELLV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 07:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgELLV5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 07:21:57 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DA2C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 04:21:57 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id m7so5246783plt.5
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j583ThMyeSE84mVDbmUtRPkLX57s4VtDHJK0m7LwujY=;
        b=MKcmHKRqyeoJZaM7m+MQQmvD1cWQzfJUc5UDKd6WGV39Pzx2R/S4ko6k42Hv00YJLt
         GVHMULrVqkvJsSopHUBBi6c4T5ny9wZ6LqpG8lHadoyC05FiorLc6qFANvaC7zTyXivB
         Z1VRsVG1LILWQq+WgtNAd3Y7KTZL2uEm+AdFEVvJOFEwzPf8Q70p6G4dKsDwWBPiXoJI
         4v62Tl5JXG96+LRKVKfReLf0WsFMlmTsn778R1Pbb0zwZAhIetWzTQ/AyTKPgA1Edr39
         bSG/vs4jk7M07nDSKwbPPujwXhJs4d1aveYFbMQJuLETYpYm2KtbZseXB+DBndiONTrs
         wtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j583ThMyeSE84mVDbmUtRPkLX57s4VtDHJK0m7LwujY=;
        b=uLoGwJsi6UiFG1kkDHPhnWZJLi+3hUc9rjxogWx+nPbpajib4OUIiZgbJgK62Ofiio
         LKYjCKzmVFJga7XhXA6VrB5+FO6R/XqhX/yAwD/7VDonUR9Ont+HpCbIt+iQYIYDZHzE
         CryOS2JhgkqITeijVy103i5SOIg7EbvUGdZjoGrbDnka27RWc3FJkH+6bxgK5aQLlLZE
         OAPBDm4g+5iMgdlIZLciW1S+XpItJct1L/+d9RF0jh8iJQo1f4/EuGgkwiIBMyEkiOWi
         NN9JBp5NN/2ziVtkG7XxWqYfG4x0UyM9MSaeMpw6JO0cybwBVnNIjyDcubKJmLAK0mVL
         C8vQ==
X-Gm-Message-State: AGi0PuZ8RSi1YYiA9pbmpvkbx6u3uhKlSXjndAXrX5TSajLT0IBMZJmo
        axPBDCGO512tGkAVkQJMlJfFPXxyK8GOl6Ta8ocab2uHo08=
X-Google-Smtp-Source: APiQypLTV4By9Bcw0oBBZYhII5QMlic0tGsdAe1FvV0ny1GuqY09WZ++x3EuEaBJUGCE++GIdw1c9NuCDhTB4l7h2Rk=
X-Received: by 2002:a17:90b:374f:: with SMTP id ne15mr27568564pjb.181.1589282516899;
 Tue, 12 May 2020 04:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
 <20200502190414.7ede79b6@coco.lan> <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
 <20200512122056.6ae3580f@coco.lan> <CAHp75VdjdZCFq=uk0M9QG0tNf+wfD6iFzZvmzBWTWNVpgUpfxQ@mail.gmail.com>
In-Reply-To: <CAHp75VdjdZCFq=uk0M9QG0tNf+wfD6iFzZvmzBWTWNVpgUpfxQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 May 2020 14:21:49 +0300
Message-ID: <CAHp75VdDm+NLVdG7AfwO=FwmA=naqVwAiqbUyyUWc4hwHHSRHg@mail.gmail.com>
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 2:12 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, May 12, 2020 at 1:21 PM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> > Em Sat, 2 May 2020 20:33:14 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > > On Sat, May 2, 2020 at 8:04 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > > > Em Sat, 2 May 2020 19:08:36 +0300
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

...

> Btw, https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=65608aa8d34ea274600ab2cf6f0cf54ee86d8fd1
> is incorrect approach. Look closer what PCI does in case when
> pcim_enable_device() has been called.

This has resource leaks
https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=88b03de5d705f5f46a896dbd21ef9472030bb8d3

Easier just to acpi_handle_info(ACPI_HANDLE(...), ...);

We don't enumerate them w/o ACPI IIRC.

P.S. Yes, I understand that is WIP, but better to get rid  of
unnecessary / incorrect work from the day 1 :-)

-- 
With Best Regards,
Andy Shevchenko
