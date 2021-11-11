Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BD944DC8E
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 21:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbhKKUnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 15:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbhKKUnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 15:43:09 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB250C061766;
        Thu, 11 Nov 2021 12:40:19 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id f8so29149830edy.4;
        Thu, 11 Nov 2021 12:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHiOh5VflVJlewhwxndCJDln8UkcHoMZN9XPghDq7D4=;
        b=I4UbRBtt0cBjzwu4Bn/HDqvsbMNEHt1Pw/NNHD6myvj3v5WZRMKGb4dr+Z1DeV1H2D
         vklfvCJq3zph0TmHJCmiit64psuWEfdV1+m0vHzAGLBiD1mRyl6Z2/mHJJgqmQuH6YuC
         I+MVnh3NHDOszExYn8dVoDfpWjvFKIMcFIs4tJpNlPbZrQzBNlq7auqMvi+t3Yf3pZGC
         HFrI6YlwvT/Zu6peEP1a02rJImUizrdus7q/X8/6nCbzNcTb7u542ChvaExPSWGjFNdc
         YX6xeN4muzTD1oLl4aAi3rsstXF7teLH8RgUf71bxRHb8Avf5TXmYXPYAow2sQWILsWY
         LQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHiOh5VflVJlewhwxndCJDln8UkcHoMZN9XPghDq7D4=;
        b=XyCwXye0VDZYjSlUoIe1CXsi/9A7vt5gsmQ6aXx9kzYDv85h069+GKI9jX/0xYlnys
         8TJS5Y+9fbbwmZFmxwH0D5/FMQOBFuiBAOFxqS35aQtE/LFdS/MJilU7qoAoIzLLNATi
         v78AgfU6ZBxBTJ1qrCy7btNuCDLQcVz0jU8LcvYmE647bRernZbRyoRVhe4gbODHKeph
         L87rLSXJN7J98TjkYRdGJhkIZk67/uXjlmSKZGFbnFipQ/+TuoZsBFjfsOMnAeIxN0ap
         RWRyBEy2Y/3JOvDYLcMoT30R4DIS3NnNvUyhDz0WKPvTYr1qvN1kCGi882HxoCD+CUqZ
         txeA==
X-Gm-Message-State: AOAM531HdnoCIbxlVmxPacHVT8PbxhvAjJsrY2W1XhUUK8fBtO1Paxtn
        u80oQmQNnJzVhF/zi/u6Lj3OSn7YQlK0RTZ9CPA=
X-Google-Smtp-Source: ABdhPJzLVpIUZ/n4T+ZkvgG7T7voRmVdPypl7OvLEUnWiUC8iD7a8c95VhPA9yxkjeifTIsCkgFdsEhzozGDdDV3K38=
X-Received: by 2002:a05:6402:1801:: with SMTP id g1mr13510467edy.107.1636663218553;
 Thu, 11 Nov 2021 12:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20211017161958.44351-1-kitakar@gmail.com> <20211017161958.44351-5-kitakar@gmail.com>
 <20211026092637.196447aa@sal.lan> <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
 <20211028123944.66c212c1@sal.lan> <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
 <20211101141058.36ea2c8e@sal.lan> <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
 <YY1ATbqn2fAg8Oct@smile.fi.intel.com> <20211111193742.174f0b26@sal.lan>
In-Reply-To: <20211111193742.174f0b26@sal.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Nov 2021 22:39:34 +0200
Message-ID: <CAHp75VfLPcKimwMD6-QwL9aQ5EFJke1Bkzfq+-e=aZMk6JzH_A@mail.gmail.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nable <nable.maininbox@googlemail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 9:41 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
> Em Thu, 11 Nov 2021 18:09:49 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> > On Thu, Nov 11, 2021 at 11:34:23PM +0900, Tsuchiya Yuto wrote:

...

> > I just realize that we may do at some point
> >
> > cflags-y += -Werror
> >
> > to avoid changes that breaks build (with warnings).
>
> No need. Upstream already added Werror. It is just a matter of
> adding:
>
>         CONFIG_WERROR=y
>
> to .config.

Unfortunately this is not gonna work with `make W=1`.
https://lore.kernel.org/lkml/CAHp75Vef8QW3Y0yA702KUqPDHNRLN0kCv06=cgPpgPbUeAb-dw@mail.gmail.com/T/#u

> > And also I would suggest
> > to run build with `make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...`
>
> Yeah, that's good. On media, we also require no (unjustified) sparse
> and smatch warnings.

-- 
With Best Regards,
Andy Shevchenko
