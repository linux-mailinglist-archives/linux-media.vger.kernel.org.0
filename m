Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A27C1EDC2B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 06:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgFDEV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 00:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgFDEV1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 00:21:27 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6A9C03E96D
        for <linux-media@vger.kernel.org>; Wed,  3 Jun 2020 21:21:26 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 9so5504390ljc.8
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2020 21:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ibr/VZbLMyGb+zMg+GN++bmNBEQgeGmT6g5ZXwd388Q=;
        b=Bn2WBvA5Ql6NayGRsHsky2PmoWV+IQEfrXN+hAq6GtSpeTQnBbkK5YEo6Hz8rIFW2K
         8leA8oDfXoNMH7aqRARky+w4XxdyY/I/orySzXcl4QzN8H29WpFFD3TPfEXpAjIdyqIT
         cR/9LY+nQvxxUamLToaC8aWuO4cMoZE6mkOqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ibr/VZbLMyGb+zMg+GN++bmNBEQgeGmT6g5ZXwd388Q=;
        b=DWfxN/seLG0ljEq1MVnZDEq84nMrXjvWq3WJnmT7gYkyLr+w20fayCoqGrt7AuZUek
         eu4IdCNQDqqqzBmf3N1uHKroFogXMTUIufhzwMn3qhLks5OwrPfKkXE8/B7Lvhhx728v
         PJ1mp5AwjaEXzf/QKUHNRksw1d+4pY3VOF+CMqCwvkxXQD3sAbc+ghU+gQF5v02nW+yF
         yHNjLS37bmQ9+u5pdY/aiTnBT9pR6gU1I0b9t7vw86DdcqlQD1fjhf01wmz/oMI4om4w
         vEDcjsXSEFvpxXfIeOWVjGzXdNlH1Ch/CAVm1r1JBQBJedaDqB8H6A/CCywofIJkMuCo
         JidA==
X-Gm-Message-State: AOAM532LUJ/mqYFme9vcdTwGXF2BFRz+VUEzlHJVAob+R/NpRRB+fjtv
        TA8TIPquwaRacpRGGyViCpijknPgDAo=
X-Google-Smtp-Source: ABdhPJzHjlOOG8pEIz93YFow7CtaZbMCZq3QvJEIE2He7V7CzhFkOEXr0ogK+QTR1M/0uqZxj5C2Jg==
X-Received: by 2002:a2e:b5bc:: with SMTP id f28mr1106731ljn.394.1591244484235;
        Wed, 03 Jun 2020 21:21:24 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id s18sm1127805ljj.63.2020.06.03.21.21.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 21:21:23 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id m18so5520635ljo.5
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2020 21:21:23 -0700 (PDT)
X-Received: by 2002:a05:651c:2c6:: with SMTP id f6mr1085967ljo.371.1591244482555;
 Wed, 03 Jun 2020 21:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200603100559.2718efba@coco.lan>
In-Reply-To: <20200603100559.2718efba@coco.lan>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Jun 2020 21:21:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0=J7VXoEL0eCNmguyj-z7G-iByHcUV02nrmw10GCZ3A@mail.gmail.com>
Message-ID: <CAHk-=wg0=J7VXoEL0eCNmguyj-z7G-iByHcUV02nrmw10GCZ3A@mail.gmail.com>
Subject: Re: [GIT PULL for v5.8-rc1] media updates
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 3, 2020 at 1:06 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
>   - The atomisp staging driver was resurrected. It is meant to work with
>     4 generations of cameras on Atom-based laptops, tablets and cell
>     phones. So, it seems worth investing time to cleanup this driver and
>     making it in good shape.

Hmm. It causes a warning for me:

   drivers/staging/media/atomisp/pci/atomisp_v4l2.c:764:12: warning:
=E2=80=98atomisp_mrfld_power=E2=80=99 defined but not used [-Wunused-functi=
on]

which is a bit annoying.

I can see the FIXME's there, but the warning still isn't acceptable.

I'll add a fixup commit. I was going to do it in the merge itself, but
decided that was a bit too subtle.

               Linus
