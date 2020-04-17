Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E971B1AD803
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbgDQHwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:52:15 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45511 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbgDQHwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:52:14 -0400
Received: by mail-oi1-f194.google.com with SMTP id k133so1332972oih.12
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 00:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNgbJ+QYBAgrmY9LHV20WrhJTLgcjx0oxTYGoyO/sTE=;
        b=n9k3Z4EK8o9zp5kGP0uRZkU28BkBcaE3esXAFa/sFeIhUjM7pFpCz1JX13bBnO+A40
         6bi1RjXj6Hs+oU0Tx6d5Vw0ZtmQaHVSPYlsWgU0wC4lv6PfFw6cAo5HnNmSXRbDVJ36l
         00LtYQgqXLGAFLpSzLYAn2CG5tFNP6LYSuf7lUfTxtF2MEQDmBudQeQ6XwZUObSzSIqr
         eRldBvS/Vx+Rlxt3HsiIzGWKhoZLlXmTKTlQ0RDOeVpOCkOjy3jd6lq1zSl/++3AGMWQ
         Vc7ftnNV7q3OqSnULdIdRX7jtlXUfu9LxyHEnnWi4l5fl4p8X3TJ5jfJ5IVFhU0f02uN
         4icw==
X-Gm-Message-State: AGi0PuZEiNS9oVKvDiSN3N/1cD8ztnlYdkqr1+x127aJR6HsfCI6BtlK
        6wmhqoZnyytTD3nRlK5FLdwLRMbH5AwDHCYHzuo=
X-Google-Smtp-Source: APiQypJUW9u8k675l2XWxVDLTalv71gVTkdYb+etg7/3H42YAzqqqgEUyG0N50V8UNdnwVWEYUhczT7yitIpfnYZl8w=
X-Received: by 2002:aca:f541:: with SMTP id t62mr1236990oih.148.1587109933608;
 Fri, 17 Apr 2020 00:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
 <CAMuHMdV1DdmrtexvMqEn3SBjgyG8eYbbgLsYV-862mKLt08qdw@mail.gmail.com> <20200417093424.71ae0559@coco.lan>
In-Reply-To: <20200417093424.71ae0559@coco.lan>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Apr 2020 09:52:02 +0200
Message-ID: <CAMuHMdXQ-ahP1MhL-NEHAyoA_CxT2EWfJRF55S7w3uuF8vkvDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: cec: don't select PCI & DMI
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Fri, Apr 17, 2020 at 9:34 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Fri, 17 Apr 2020 09:30:51 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> escreveu:
> > On Fri, Apr 17, 2020 at 9:08 AM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > > While select would be a great idea for most archs, this
> > > causes a breakage with s390:
> > >
> > >         "I don't think that's a good idea, as it suddenly enables selecting all PCI
> > >          drivers on platforms that do not have PCI.
> > >
> > >             WARNING: unmet direct dependencies detected for PCI
> > >               Depends on [n]: HAVE_PCI [=n]
> > >               Selected by [m]:
> > >               - CEC_SECO [=m] && MEDIA_CEC_SUPPORT [=y] && (X86 || IA64 || COMPILE_TEST [=y])
> > >
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >
> > Thanks for your patch!
> >
> > Fixes: 4be5e8648b0c287a ("media: move CEC platform drivers to a
> > separate directory")
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Btw, I almost solved it on a different way, keeping the select and making
> it depends on HAVE_PCI.

Like you did for the similar change to USB?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
