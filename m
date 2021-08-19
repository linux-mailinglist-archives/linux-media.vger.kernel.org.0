Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040D83F1F02
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 19:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbhHSRZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 13:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhHSRZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 13:25:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E754C061575;
        Thu, 19 Aug 2021 10:24:51 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id e7so6519240pgk.2;
        Thu, 19 Aug 2021 10:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UYd2dapw2LMwvOwjrvllB89XLpc87giCIS2NMpFO4KE=;
        b=c60+UAjN01E/MyS6qz7JtawFf1HTe4XNk03E930VEgOBPRVjBDqBVsklwYJuniYGs1
         LGe9Fo/Kv+y7utUO1bkuePODvr28k5c0B7ThjmTWITZ0yjKvazUzVvjc63g8y7PO0KJX
         z2Q6s9b91XIlSkvT4TFBoV4hCfk7XQNOyCyDoOjMeOgJFoSXToxHGl2zf3ZglwXNHILA
         5nBX9cKXyOadqOmLtqSJwqYV05VbMa04EIULWevIDHDlifn5mbnvs1dWl40gadZ4xbM2
         6a7eoSJwbBNdl0qdG8FUhC1/pAIuyY1GF34qEcVjx1qmi6IJ7IuG+LTd+ftkXYv/zakr
         fe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYd2dapw2LMwvOwjrvllB89XLpc87giCIS2NMpFO4KE=;
        b=OERfVJjzZbz7nEwDyGnUWjpWPCL6hAl3GPYewqBfQh9gpXwXOyXQdrdz7w4Awq9GaF
         dWdvzyiT+8rswZ7WQ5LtaiS01eRGIAOTtHopiZ5pWLKNgdkXsApjWmF8t5/VmRrO3/df
         qIymz+FdC5QsZPpzFuPtsUkXbdjqXLIuRloXXwsmHFeV5G1pmLbAEXZrXsxqIVV+jLKy
         vbpWftyeilQqQs82WuNm0Sjw3+xNFBVLYCHz6TZNgVutHEOoDkyi0VE9tmWphMXGtSEL
         GvLGPsHXzpZyXKAWlaX9TzLaM62lqLZtUXBO0WB+lvnaOgVNcHXy87+FQxxmxTf2m0vT
         tNVg==
X-Gm-Message-State: AOAM530jbqSrI1E7ZfOw82GXoZ03p/HURuY+PcHoz7sClVe+MS9B7pzH
        Hqk1zVd5E99rBxE+q8Lp4UCJa7jHlf/0iojyCY8=
X-Google-Smtp-Source: ABdhPJysYPrZmoa4UFLdVe+0TKMVAoZZGvmIcU6EffmYwkLJhVyd3WbKXreA9JSgPXu/YBIo/JraQJfnWgEJoSnO5CY=
X-Received: by 2002:aa7:9618:0:b0:3e2:1bc3:aa93 with SMTP id
 q24-20020aa79618000000b003e21bc3aa93mr15746883pfg.73.1629393890934; Thu, 19
 Aug 2021 10:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210802143820.1150099-1-arnd@kernel.org> <202108130937.7848F6B318@keescook>
In-Reply-To: <202108130937.7848F6B318@keescook>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Aug 2021 20:24:11 +0300
Message-ID: <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
To:     Kees Cook <keescook@chromium.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 13, 2021 at 7:39 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The input_system_configure_channel_sensor() function lost its final
> > return code in a previous patch:
> >
> > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
> > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
> >
> > Restore what was there originally.
> >
> > Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I hit this too. Thanks!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Me too,
Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Pavel, how have you tested it?

-- 
With Best Regards,
Andy Shevchenko
