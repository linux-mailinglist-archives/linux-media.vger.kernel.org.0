Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C752935E377
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 18:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346800AbhDMQGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 12:06:50 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:34385 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346801AbhDMQGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 12:06:48 -0400
Received: by mail-lf1-f54.google.com with SMTP id n8so28276377lfh.1;
        Tue, 13 Apr 2021 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UaQ/mAhPBWcVQ4YIzorH159V0qjCsRuD4zR9Ef1vsSA=;
        b=Nhv26FjtTrKx18HWTKMiJfuFCpT2B+O8I/yPgaTyCHFTPcczkm/SCS1gWUXWj08Nsv
         BKOxEJIrDVeMRef8F9lJA0eztz7TjDxZ2PHwiYhOk95VELWzgCZXlCSVQtM7DmARqADE
         Dagx/xR8vGWH3nUBQWJLulDIC4mq+bnO2db/CSYwhNjHDEj28siMVeesLtBNZtcVuHqZ
         AV66BSKIwwbnXfgxFHk+nPgaXq7lPpB8hMXCSz3JcOsbxuXfFVuVr+zsiHwHUgjd5w4o
         AXov4DzX/tquDIoBZl8J4CGb0vwyb8vK6R4Vxp7zr57b6CUU/QCap2Vydu9/lXAjdqBQ
         iS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UaQ/mAhPBWcVQ4YIzorH159V0qjCsRuD4zR9Ef1vsSA=;
        b=pMW83dE+XdxNNj0eWd+le1LBC7zg0Jp8dUkfKwxN3cJgLECAEQLsLySwzu4t089GXb
         VXmE2qD+Vs05pwOHN4jg3W3Qn9e3q1sCSvkNCF/Zyk+erF1kXtBA22+oBLCzpAn93Upq
         YelXduQhNIpNtmtNAbtmDY2qVdf948tIv8QycuzM5P0vXg5H9Xhkx4/h+B7aALsFWySi
         oCWglk7H/eWJhwhiJxi3/PCr3DIfp2tYn3t7xuMAn32lKI9BMPBecCwiG5WaADzqMbr9
         z2a3FvcWOiePGTdNteg+EAM+BH5b5sjStHxD9DRu8WWDE/ut3C//TZcX/UX4hZBdFHuy
         6FYw==
X-Gm-Message-State: AOAM531vxji6jwdiJQ19R51obgeNRTLvTgDQogPqUnB0TGMQ/nbL2Lzr
        fnD0mjjEg6tkmT/WlR6fQf+u9DINFhmEK/DlxbA=
X-Google-Smtp-Source: ABdhPJzG/dzN+9CmZhW9utOA2HH6JnupMHEYNxSG3cFNOVJZutOv1wrhYtTqU5Cu7lt+I3LkgLc5eFsZbFukbLKz86Y=
X-Received: by 2002:ac2:4e43:: with SMTP id f3mr22802574lfr.206.1618329927516;
 Tue, 13 Apr 2021 09:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210412222040.GA13659@focaruja> <YHW5Fwl55c7NJAeo@orome.fritz.box>
In-Reply-To: <YHW5Fwl55c7NJAeo@orome.fritz.box>
From:   Dwaipayan Ray <dwaipayanray1@gmail.com>
Date:   Tue, 13 Apr 2021 21:35:16 +0530
Message-ID: <CABJPP5AEtg+615Q2d-d9aZf=CE7EFPKEbc7tr=gKo_H-XL+M5Q@mail.gmail.com>
Subject: Re: [PATCH] staging: media: tegra-vde: Align line break to match with
 the open parenthesis in file trace.h
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel <linux-kernel@vger.kernel.org>,
        outreachy-kernel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 8:59 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Apr 12, 2021 at 07:20:40PM -0300, Aline Santana Cordeiro wrote:
> > Align line break to match with the open parenthesis.
> > Issue detected by checkpatch.pl.
> > It consequently solved a few end lines with a '(',
> > issue also detected by checkpatch.pl
> >
> > Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/tegra-vde/trace.h | 111 ++++++++++++++------------------
> >  1 file changed, 50 insertions(+), 61 deletions(-)
>
> Ugh... I'd say this is one case where checkpatch.pl really shouldn't be
> complaining since this isn't a function call or declaration. It's more
> like a code snippet written with macros, so I don't think the same rules
> should apply.
>
> Adding checkpatch folks (hence quoting in full): is there anything we
> can do about this without too much effort? Or should we just accept this
> the way it is?
>

While it may be possible to add exceptions for trace headers on the
alignment rules, I don't know how many more such exceptions we will
end up adding. Such fine grained checks might be unnecessarily complex.
So I think we should just accept the way it is for now.

Joe might have a different opinion?

Thanks,
Dwaipayan.

> Thierry
>
> > diff --git a/drivers/staging/media/tegra-vde/trace.h b/drivers/staging/media/tegra-vde/trace.h
> > index e571410..1fcc573 100644
> > --- a/drivers/staging/media/tegra-vde/trace.h
> > +++ b/drivers/staging/media/tegra-vde/trace.h
> > @@ -11,79 +11,68 @@
> >  #include "vde.h"
> >
> >  DECLARE_EVENT_CLASS(register_access,
> > -     TP_PROTO(struct tegra_vde *vde, void __iomem *base,
> > -              u32 offset, u32 value),
> > -     TP_ARGS(vde, base, offset, value),
> > -     TP_STRUCT__entry(
> > -             __string(hw_name, tegra_vde_reg_base_name(vde, base))
> > -             __field(u32, offset)
> > -             __field(u32, value)
> > -     ),
> > -     TP_fast_assign(
> > -             __assign_str(hw_name, tegra_vde_reg_base_name(vde, base));
> > -             __entry->offset = offset;
> > -             __entry->value = value;
> > -     ),
> > -     TP_printk("%s:0x%03x 0x%08x", __get_str(hw_name), __entry->offset,
> > -               __entry->value)
> > +                 TP_PROTO(struct tegra_vde *vde, void __iomem *base,
> > +                          u32 offset, u32 value),
> > +                 TP_ARGS(vde, base, offset, value),
> > +                         TP_STRUCT__entry(__string(hw_name, tegra_vde_reg_base_name(vde, base))
> > +                                          __field(u32, offset)
> > +                                          __field(u32, value)
> > +                         ),
> > +                         TP_fast_assign(__assign_str(hw_name,
> > +                                                     tegra_vde_reg_base_name(vde, base));
> > +                                        __entry->offset = offset;
> > +                                        __entry->value = value;
> > +                         ),
> > +                         TP_printk("%s:0x%03x 0x%08x", __get_str(hw_name), __entry->offset,
> > +                                   __entry->value)
> >  );
> >
