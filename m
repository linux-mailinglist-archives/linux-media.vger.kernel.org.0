Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF91E1AD770
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbgDQHbD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:31:03 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42726 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728419AbgDQHbD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:31:03 -0400
Received: by mail-ot1-f65.google.com with SMTP id m18so687980otq.9
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 00:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p0n2/0Se1UgFPAApTRflNIGSMlCM93NKuFmmWzXeY0c=;
        b=mgsaD5D/mgDE0pRP51NiO2xDAyR3RzjG9IVSF/zVhs4MAFMzooLyvim031yZWobjUp
         wXC7qqGWwTpWtOdsrSmIXO7xpAeuMGko8QJ8CS5TlZfyO87KPxpIf3aNEkHYkfOm7Mgc
         r4IfoNTsT/yO6Ff4NfHTQC5sOH3iubTAepPwQFTKi63c30qqCG6CQcv02iXqtl9RRpff
         6S/CNSFkzrR40VlSBWnPYZWrcK2ZUxnppXHsMuAGeMWOCLWLF3ggwwhGzWCe52oMEIXJ
         sE7tcdX7uEpN/STBZiALCFpvFZTDyeRO4HKA1l6rsrDQu0j+g1PVwKZ13w7mPRuXKRxS
         HSuQ==
X-Gm-Message-State: AGi0PuaxkPcqCbtvInKx/LcB7O3n+5ScC2LhVArTCncul17OORsHdTVI
        pC7171bBhgYr8JNusmD+iCrEN5KCkShHaPZHjAz6wSDT
X-Google-Smtp-Source: APiQypJY92jRzuFeNHYcuRYx7CX8rXUsCkf2G6s4LkWD7qCBCfmUIpIxslICYrQ5oAhpry5YQ5uPX6LO/cns2ZZ2++w=
X-Received: by 2002:a9d:6299:: with SMTP id x25mr1453973otk.107.1587108662698;
 Fri, 17 Apr 2020 00:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
In-Reply-To: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Apr 2020 09:30:51 +0200
Message-ID: <CAMuHMdV1DdmrtexvMqEn3SBjgyG8eYbbgLsYV-862mKLt08qdw@mail.gmail.com>
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

On Fri, Apr 17, 2020 at 9:08 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> While select would be a great idea for most archs, this
> causes a breakage with s390:
>
>         "I don't think that's a good idea, as it suddenly enables selecting all PCI
>          drivers on platforms that do not have PCI.
>
>             WARNING: unmet direct dependencies detected for PCI
>               Depends on [n]: HAVE_PCI [=n]
>               Selected by [m]:
>               - CEC_SECO [=m] && MEDIA_CEC_SUPPORT [=y] && (X86 || IA64 || COMPILE_TEST [=y])
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks for your patch!

Fixes: 4be5e8648b0c287a ("media: move CEC platform drivers to a
separate directory")
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
