Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4505B1AD308
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 01:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgDPXFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 19:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgDPXFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 19:05:51 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456FDC061A0C
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2020 16:05:51 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id z17so32844oto.4
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2020 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U3ZnegWnBQgeGyAX98Odei8ZfSWGBtxmuDZHYKMS1kM=;
        b=qQsZIeBOicir+sliqJuCy2zLWUzOIDomDyZejgz/1y35+GPmdSnnYYMqIrhUId2W/D
         y18fgacphsXVgfMjLO3nTpX03MDEpHrvvCWzeDxcaVSNSH1MIN7vpsR6E/IUICkei2os
         rppAsafO6ISlcfFrQSkV5BHeES/Cea/+4nyZoGJBAzyCYL6kfca28TqfcaXfL45OnN16
         DrBHd7NI+o6ni9MovpnovuYVTY+D0wx+iy1No2M3mxeLozoxHQROrK99W87yK2wXQHge
         q7ENMZ+GbbWS/Ofr1z4AIVnXsLeD96D4aCtysgV+z4pAG3Hu6Ri6zFYa9Go6CelWm1Xe
         RgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U3ZnegWnBQgeGyAX98Odei8ZfSWGBtxmuDZHYKMS1kM=;
        b=nArYMdOTXgFdp/Nst4kw0vw4uwB8BKZSeC6h/dkofd6+SMZQ1Bf2oY9xpzFNGLE/V1
         2eLI+n3oXMl0ab05Yu/NGOep93Jg8dqcVIujK9xvxp/LOdMSr84P5jikQvkxsNcJwR63
         s8fGqfxmumzwbrOUQkBe6YOqGo7/Nuu4AsRTLG6yTKQu3bXaV8/29DqbFfvW/nUOMJ/D
         AsRreCQBn9tTuI9cFvww6tkYPsEcxYe9ltx8UP9ILbSty0ODsLegfIrzlXU1E+uT6P8R
         eX64js9B0AVnxlsImtrPsrc/Go7UdEwIdP8ktZle5BQh5XM7oVd/zjuynN0hrlNWUB7e
         GeXw==
X-Gm-Message-State: AGi0PuY5YY1LSoz7jsJ62M1R0q1heMYPv+D9omko43h0sRlspPdHsmZK
        9gjUwlPu83Hwu31lbEf3Q6GvHWGvrXO1D7+1V91TeUQUoZI=
X-Google-Smtp-Source: APiQypJCN7l/gnslr7hU8pFaOdDDqqsEX2+KjYxk9hsrvxovDt6qsujZoru1kNyCK/fBoM5slapLWrfadzRUu501Xhc=
X-Received: by 2002:a05:6830:14:: with SMTP id c20mr364497otp.279.1587078350569;
 Thu, 16 Apr 2020 16:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195611.55421-1-ariel@vanguardiasur.com.ar>
 <20200408195611.55421-2-ariel@vanguardiasur.com.ar> <CAKxU2N9CN6N3p5kfpzhkpX0PWD=5ogr14qcPQ_p5qprm0z98=A@mail.gmail.com>
 <CAKxU2N_fTJ7gzLov3AsTPrCVB3xbXoJa6fuSqRvPxVa60V_+zQ@mail.gmail.com> <20200416080152.GA12736@gofer.mess.org>
In-Reply-To: <20200416080152.GA12736@gofer.mess.org>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Thu, 16 Apr 2020 16:05:37 -0700
Message-ID: <CAKxU2N_xiQbRdx+=pJur9O1s8AZog637sejHE5X1Rrd-npE=Dw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] Add support for meson building
To:     Sean Young <sean@mess.org>
Cc:     "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 16, 2020 at 1:01 AM Sean Young <sean@mess.org> wrote:
>
> On Wed, Apr 15, 2020 at 04:34:08PM -0700, Rosen Penev wrote:
> > On Fri, Apr 10, 2020 at 5:28 PM Rosen Penev <rosenp@gmail.com> wrote:
> > >
> > > On Wed, Apr 8, 2020 at 1:42 PM Ariel D'Alessandro
> > > <ariel@vanguardiasur.com.ar> wrote:
> > > >
> > > > Currently supports building libraries and tools found in lib/ and
> > > > utils/ directories.
> > > Excellent. This will make it easier to run the code against static
> > > code analyzers.
> > This is worse than I thought. v4l-utils fails to compile with clang
> > (and by extension clang-tidy as it uses nested functions.
>
> That's down to some code I wrote. I was hoping clang was going to add
> nested function support at some point, but they haven't.
>
> I've just sent a patch to the list removing the nested functions from
> v4l-utils. I don't think the code is improved by this, but I think being
> able to build with clang takes precendence.
I agree. Doesn't seem even C++ allows them (lambdas are different).
>
>
> Sean
