Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C277827EB72
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 16:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbgI3OxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 10:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730247AbgI3OxP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 10:53:15 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF65C061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 07:53:14 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x123so1330095pfc.7
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H+0+pPKTxSyLMMQDuo2bqaKRd08VUpUKCrl0nImm1PE=;
        b=BDb1WtLckQYes85zlC1vW/qxfMKeU7EOnx9Tqpl1wpyvZ8AcUrIQJ6AVyEeNSVDCLP
         bZDM8KpiAhx+5san/DE+Hrs6q40MZbzt7uku84cdLVOwo+NzkwWMrhdUQcmxx/1qUove
         VLfbDDNIe9WsqfevV0gf0V/O8tHF5i+7wGRnCuGesnzJviKp+8ysJUW7z0jcezIg/Kku
         p4+tNJ3JRXm+BAMw6sj2Bvpb9jt5PpcaX9bVe2waNVkb+NqYkVcyDyqF3lf4Qq8YwZAZ
         aUcccqMCZGC/56vcgobsMAgmI+QnNxXoYbFkgpuF4SGSFfXv2DCgv0Bqrsq9F7xvgASM
         N74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H+0+pPKTxSyLMMQDuo2bqaKRd08VUpUKCrl0nImm1PE=;
        b=pyrHl8paMFUUpS9eMRE7A9sFBucxkRNSbdmVS61Yo9fH+Jn5F5mEmD6VkDe/nN9cOD
         ebk7djbkFvO/rrS4A0PpjnX1lzjFF9/wtCNrHkYPrpsUew+X7Xskv5gmPeX4wfv/E0Le
         2vUvjjZMqUoONc/7iLH3CljqjntMKhiOqOAfh8DpgsEd8/lPougnm81Li0djntQ1qmVk
         yGsO0N7jf2VlVTGNgt79nyeBkwHrPffe2tN7lQpAKOE1xnadSlbOL5H/Nu+dkwCczZyT
         8wU6Ooe3TqYjGU5fUmO9nZM/jk1WhslaqQ4w8DLWqCYiwZXAgkK+uyMCErG/KPYJEUMZ
         v+4g==
X-Gm-Message-State: AOAM5300gjCK3ZgAEY2JqnHLwQRQ1jluHybTQTV+0ryZ9pILNRcgo4Ai
        nAnS2X9eD8tdUlr5FmoM1NM48aWCrRib4T5xlGsvKxdtwF/Qhg==
X-Google-Smtp-Source: ABdhPJysa/fakPEA7kn1W14DCUIqPtE8aDNrWSX93trcBKxOcNqFiFg+WSs2kxEeplYqcFCfCUVIyYD2nibSRhq3I4Q=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr2377598pgj.74.1601477594291;
 Wed, 30 Sep 2020 07:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vfx+GUkSmCFD5BRLThkWwLcZDx=9p4yody29p+kqd525g@mail.gmail.com>
In-Reply-To: <CAHp75Vfx+GUkSmCFD5BRLThkWwLcZDx=9p4yody29p+kqd525g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Sep 2020 17:52:55 +0300
Message-ID: <CAHp75VdxYsSBFwSXnjCLW924-X-JKF=7=5uv9J0A3xjAd=_RXg@mail.gmail.com>
Subject: Re: atomisp doesn't compile
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 30, 2020 at 4:51 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Hi, Mauro.
>
> What is the status of AtomISP? It's already been a few days that it
> doesn't compile in Linux Next.
>
>
>   CC [M]  drivers/staging/media/atomisp/pci/sh_css.o
> .../drivers/staging/media/atomisp/pci/sh_css.c: In function =E2=80=98star=
t_binary=E2=80=99:
> .../drivers/staging/media/atomisp/pci/sh_css.c:1384:6: error: =E2=80=98st=
ream=E2=80=99
> undeclared (first use in this function); did you mean =E2=80=98strim=E2=
=80=99?
> 1384 |  if (stream->reconfigure_css_rx) {
>      |      ^~~~~~
>      |      strim
> .../drivers/staging/media/atomisp/pci/sh_css.c:1384:6: note: each
> undeclared identifier is reported only once for each function it
> appears in
> .../drivers/staging/media/atomisp/pci/sh_css.c: In function
> =E2=80=98load_preview_binaries=E2=80=99:
> .../drivers/staging/media/atomisp/pci/sh_css.c:2967:38: error:
> =E2=80=98continuous=E2=80=99 undeclared (first use in this function)
> 2967 |   need_isp_copy_binary =3D !online && !continuous;
>      |                                      ^~~~~~~~~~

I have to perform one test, it seems my branch is not clean.

--=20
With Best Regards,
Andy Shevchenko
