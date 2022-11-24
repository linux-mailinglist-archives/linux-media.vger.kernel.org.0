Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC326380DB
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 23:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiKXWTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 17:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiKXWTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 17:19:48 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997004EC28;
        Thu, 24 Nov 2022 14:19:47 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id d7so1675712qkk.3;
        Thu, 24 Nov 2022 14:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KbCGMNNqpFrPkTMKq+/YTKVUVh717cxsdv12SaO2YPk=;
        b=go/AXR4dyEKduPBH6rb98qkBeaIcz8hj/2a4dC54EM3yg+hHdj34bpKUyPAdqhOEvM
         R0KG4wtsaGn9TWze9yKCOCiPYZoKFK8utjjIUL6oiKMgis+Y2Be65Dv6dbxj2W2B3Sm7
         8unPLF4nJd+sJRgYPK4E9CAzdeqzO9H8GXbwK0Kn3nbzhWnfKm9kFEgaXSAPtzsfO3ul
         Q5ms+YhH+1X1fyBH+a8mfGSG/4GigD7TZytDVQkKJo9a2wwFBDV041YrWQWJiZZffRDS
         VNHx9Qh0y8rEWSGMDmhM5trBC61nL/wt5r7gCbIu188FLpVRtFjIJTnKoV8WjtjWMWMz
         8DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbCGMNNqpFrPkTMKq+/YTKVUVh717cxsdv12SaO2YPk=;
        b=PAGe33Sid+5OgvoyWT6P357p/nULN3teCRWlK8aEm5N8d4BlT8ouiMCzXKbFN7jkSh
         jFTXp1Csgd2CTyeoAkn9fJ/C+QLFAI+j9iPot3aZuaUbdvzOGbtVfuLd1VrIxYAHzhFO
         TytnVUie3a+lBxte9C9YHQa+XsLa3tAHKBSEuAlPRp3bCt5y/lKfUFWTIt8zvXgmjrh3
         Vi2FeNiNEbOZ6QNwRXlUqixVZ5JoiWgx/JJY86Qt9HxBA99l22g4u4k+HhvemdkB/jGu
         Mn+BscpkKCK2rpPz0wZLV8xKCByLxgxkdrDFMhwLueUd0U8GSTOwUsJSC5JVuIqFVUa+
         WVxA==
X-Gm-Message-State: ANoB5pkKRJU4WjR3Yk7jQqqB1iCZ65W7N6EvoYy29ai+3dqaHeAo3hKl
        G/xUt9zRfj+XTup5yMnPDBSpfTt8yJ4NuzLdxiM=
X-Google-Smtp-Source: AA0mqf50TPZ4HoTzd1iZ46fYGRC7zD1bDJcgVEGGLVk+sH8QCpp5ayepufYG3ruP0DlcZVu5eDgFvaPKLxTqxgTN1hs=
X-Received: by 2002:a37:b404:0:b0:6fa:4a82:1152 with SMTP id
 d4-20020a37b404000000b006fa4a821152mr32072603qkf.504.1669328386656; Thu, 24
 Nov 2022 14:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20221124200007.390901-1-hdegoede@redhat.com> <20221124200007.390901-2-hdegoede@redhat.com>
 <CAHp75VdWWXCvHnVaE3pYuntXyeP7zPOc6PpcQaXWFkEEPf+QxA@mail.gmail.com> <e82b11bf-a872-a83e-6b02-7acfedcaf24b@redhat.com>
In-Reply-To: <e82b11bf-a872-a83e-6b02-7acfedcaf24b@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Nov 2022 00:19:10 +0200
Message-ID: <CAHp75VfoPtFZVCZyMtOpnOxq-7HDb7aQ5iEXenkbB1082OxTtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
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

On Thu, Nov 24, 2022 at 10:20 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/24/22 21:09, Andy Shevchenko wrote:
> > On Thu, Nov 24, 2022 at 10:00 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +static const char *int3472_dsm_type_to_func(u8 type)
> >> +{
> >> +       switch (type) {
> >> +       case INT3472_GPIO_TYPE_RESET:
> >> +               return "reset";
> >> +       case INT3472_GPIO_TYPE_POWERDOWN:
> >> +               return "powerdown";
> >> +       case INT3472_GPIO_TYPE_CLK_ENABLE:
> >> +               return "clken";
> >> +       case INT3472_GPIO_TYPE_PRIVACY_LED:
> >> +               return "pled";
> >> +       case INT3472_GPIO_TYPE_POWER_ENABLE:
> >> +               return "power-enable";
> >
> > default:
> >   return "unknown";
> >
> > ?
> >
> >> +       }
> >> +
> >> +       return "unknown";
> >> +}
> >
>
> In the passed some compiler versions complained about the non-void
> function not ending with a return statement.
>
> I guess I can give your variant a try (I agree it is more readable)
> and of we get compiler warnings we can switch back.
>
> I'll fix this up in the next version or when merging this,
> depending on further feedback on the series.

I believe it's not the case for a long time. (Esp. when the kernel
requires GCC 5.1 as bare minimum). We have a lot of (relatively) new
code that uses switch-cases like I suggested and I have heard none of
the complains from anybody, including all CIs crawling through the
kernel code.


-- 
With Best Regards,
Andy Shevchenko
