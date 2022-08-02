Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B359258793E
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 10:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236351AbiHBInW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 04:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236249AbiHBInN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 04:43:13 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D774F186
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 01:43:04 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id rq15so18683372ejc.10
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 01:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=JZPMHhrvqo4RY10VTRyFNvSXEjATgHbutvSi6eIuCl0=;
        b=cG2CabO4/O+JEZUFDYt2xNf97FoPjQ7RxWhsp+aUi1FJ+JmlvhKwTqC21vgBGp+5cY
         coIWKhoSUYTfgG0SOucVjG+wPs3fUIHaq/kPTrG1QIEoWtOTxAt4/7gjDQXxYVDarFyP
         GOavWJCmc/HWphs8i3rB7QaAC4DVl73vYHPKofMQiOIgCKPYw3Hc0KloFYx1mTNzTa6D
         OGF/T7BLPCQGYP9lCP1vZO/d0d02nnd9jOoeBkVHcV8skvAOKpb4rJXUZotvPArMB+bv
         yljxouLLmrAaZHBgO9/Iwo65hGguKeTyweuYU2irYIC2prLpCt1A7RZoY/RUZ9tij/kr
         kaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JZPMHhrvqo4RY10VTRyFNvSXEjATgHbutvSi6eIuCl0=;
        b=FXemOQQXfsBzNa26fG0J94u60UmrvyXRAj2A+saCKom58bBA3ZHJT8jP6n3u3hZ8j0
         T9FSEleH83gYWJgH0LiGeiA7zbbzHEIylkqcUQOvBB1fhyD0t37l+4s8LBF+R02iLl/y
         k8XA0vm86zlrkFXNyxEvo+f4CBiHi4l+lnGBgMdAMzMc1bwm0VEVRM8l9kXEMSzW4iPK
         H3BTyLr/XXfL+K1hS7hyOay7Sz9BYHbZ+MZnLAa/8l2ueEDZsvyjPvW4dKnVlABO01zD
         B5Gd4XvZxPOdPSE38qVD81aAkHELgXniDsUK3Nlb5YcIJRuNtYxqfpvE+V+fi5+kFwT3
         dG9w==
X-Gm-Message-State: AJIora//j1q/Nt2l2WwD5Le9WWtMhEAnYZ5SHEobeqDoA5ge6IuAaQM1
        uC+yQB2O7adtH829/Eew4fKxluLQUpJF/2NxR44trzl6ZBA=
X-Google-Smtp-Source: AGRyM1up1mLY12qU6ARBav5PbuS8nLHfrOi67/sLDgvPYaPO2bucC/J00zWE+kkgSZzPVhWu+Lf7bR+Qq3Tlfnh6lUU=
X-Received: by 2002:a17:907:2dab:b0:72f:f7:bdd6 with SMTP id
 gt43-20020a1709072dab00b0072f00f7bdd6mr16198187ejc.330.1659429783107; Tue, 02
 Aug 2022 01:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com> <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl>
In-Reply-To: <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Aug 2022 10:42:26 +0200
Message-ID: <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "jonathansb1@gmail.com" <jonathansb1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 1, 2022 at 8:35 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 01/08/2022 16:57, Andy Shevchenko wrote:
> > On Mon, Aug 1, 2022 at 3:07 PM Erling Ljunggren (hljunggr)
> > <hljunggr@cisco.com> wrote:
> >> On Fri, 2022-07-29 at 17:51 +0200, Andy Shevchenko wrote:
> >>> On Thu, Jul 28, 2022 at 1:53 PM Erling Ljunggren <hljunggr@cisco.com>
> >>> wrote:

...

> >>>> +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> >>>> +       if (!state)
> >>>> +               return -ENOMEM;
> >>>
> >>> devm_kzalloc() ?
> >>
> >> This will fail if the device is forcibly unloaded while some
> >> application has the device node open.
> >
> > I'm not sure how it's related. Can you elaborate a bit, please?
> >
> > If you try to forcibly unload the device (driver) when it's open and
> > it somehow succeeds, that will be a sign of lifetime issues in the
> > code.
>
> Not with rmmod but using the unbind facility.

And what is the difference? The device driver core calls the same, no?

> For new media drivers we generally
> want to avoid using devm_*alloc, it causes more problems than it solves.

I think it's because people don't think much about the lifetime of
objects. I don't think devm is an issue here.

> It's unlikely to be an issue here, but I'd rather keep it as-is.

OK.

-- 
With Best Regards,
Andy Shevchenko
