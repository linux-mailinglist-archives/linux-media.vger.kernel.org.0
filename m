Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B3E327B03
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbhCAJld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:41:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:49010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234063AbhCAJkr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 04:40:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6E4664E31;
        Mon,  1 Mar 2021 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614591607;
        bh=3tztoTCb+b95VNg7IMvmpTWHzf6yn7XQ3CCFrSyCzHA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Gq1tj+xyFXj92o+A9pjFJQfu3gE76hfV5BQCk3qXpjXxokKTkKcBi3FhAqxv7QQEL
         rS0TFGLcEtr7CMaU8Qz6KMCuwFLmCb4eELZYRiNKcpRnxaQqAeqig0p1nQ/1LVuJN/
         a/nIqLpETOWx1sLOdWfs5kZ+PqwdsTeIz0O80mT1RC1czx0NoBLUxpdStP9btDFY+9
         Vzcai7W/tC/m2qjOKhNo+AJf8IwzfHWozQEU7SDJhHlZ1b7EkO2ZDHy8CEL/kmAHC8
         zdnURzuQPr9r4iCknaet6XAgJPpC8BL2owB5kVv0lHt/aXIXbbsTAoPMqX2YNoS5h3
         azsoP/NCGFIdg==
Date:   Mon, 1 Mar 2021 10:40:01 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] media: add a subsystem profile documentation
Message-ID: <20210301104001.4689ee2f@coco.lan>
In-Reply-To: <CAKXUXMwviRBB_xnuBLRFRhg6eBXKjMakQLaAfqQiQEsACJjfRw@mail.gmail.com>
References: <67c1aa1e5f29ef0cb4127e6303a5ffa1a391afc2.1614260439.git.mchehab+huawei@kernel.org>
        <CAKXUXMwviRBB_xnuBLRFRhg6eBXKjMakQLaAfqQiQEsACJjfRw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 27 Feb 2021 12:13:28 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> escreveu:

> On Thu, Feb 25, 2021 at 2:41 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Document the basic policies of the media subsystem profile.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >

> > +
> > +Media development uses checkpatch on strict mode to verify the code style,
> > +e. g.::
> > +
> > +       $ ./script/checkpatch.pl --strict  
> 
> Just a typo: script -> scripts
> 

Fixed in v3, thanks for reviewing it!


Thanks,
Mauro
