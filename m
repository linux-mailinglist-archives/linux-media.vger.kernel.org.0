Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F5F29F8DC
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 00:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgJ2XGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 19:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJ2XGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 19:06:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96372C0613D2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 16:06:47 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id k9so1891739pgt.9
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 16:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=04Ez9wL1n7p17196mcbarSlwF9FBv9ldi8+nKamI8/E=;
        b=B53EURhYdWpKStqCniv1hG2CJAG/n19FOXE5tgAjpQg9KbfWJhDukK/kGC+wWsMFKa
         sl6MEvPUNB6kd7FRGEKvnI15dpTnq1UjAtcTeAV4Imq1kD9zyrURGBh94PZZlqMZtcwv
         UpiNTU2xprO1IftjRrTSGJMgZD0dRAajBZU/OZBGB/SsIQE61PM0q0LY7R3JzIqHEwj6
         oi9k2wGLKILnkH4BV8MK3B6qZjLEWqVnTG/WAP9fmmUr5PBw8mgbc7Hx2ja9YzbkI2zp
         xJGXwG4svtczYlEBIvyCO20DfUOFIeJx9X770hoQA1rDTB/fE1YW1kYMWdQJgpnyZrjN
         eseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=04Ez9wL1n7p17196mcbarSlwF9FBv9ldi8+nKamI8/E=;
        b=q7ovb6o9L3MS+rWGsFRM869K/nrjaqzeFHr1jZ16VKIiPMWuxwfZbXCDdBxRRGG2RA
         HaZECBdMk0dUpMCBWcGPEXNdWdihAAtCs0BHY9bMfrENSMktxyiXDGHffIGFyyrIdDoj
         /6FOoyJtdx7ASNtu8Jx2asbE8pbmXtMpcPdNahIC+OIIZlj4dUxmCewDCxR71WbzEuKU
         l6K3jxBaG4wYQwxMpR9bOO5OPJb3MtQmqee6CqJJqfuz5ICyTlPuU9IFaOEjQ+44rjwg
         kBH/YeIsSxx7BHDD3TtfQCA1DUNL5Of6I7/+izDDMiUy0J+sJUYSUYvMKRg7KWXPplEr
         Vfwg==
X-Gm-Message-State: AOAM533A66kpPgI1eJ4SySnelATVERSGN3cds5jdOZvovPMLFSdMfMKP
        NfjYBC5z6nuOzeQPwHsVRxz4DFXQPMDzmBCo7aY=
X-Google-Smtp-Source: ABdhPJxjK6/JLucyOGwDnUzBZjfIaerM1u/EbgQjSMtyvTOHkwkylppX7+dVdzAcUAfwKqGHPBfhE/z4ZGZWxL7+rbE=
X-Received: by 2002:a65:47c2:: with SMTP id f2mr5975522pgs.4.1604012807191;
 Thu, 29 Oct 2020 16:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201029201657.GE4077@smile.fi.intel.com> <20201029220827.GN26150@paasikivi.fi.intel.com>
In-Reply-To: <20201029220827.GN26150@paasikivi.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Oct 2020 01:06:30 +0200
Message-ID: <CAHp75VfnFQZhZ1nFPNzgu-fn+yzmUNvwEVkoAk-=GXYvkxEy4w@mail.gmail.com>
Subject: Re: [PATCH v1] media: ipu3-cio2: Use macros from mm.h
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 30, 2020 at 12:12 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Thu, Oct 29, 2020 at 10:16:57PM +0200, Andy Shevchenko wrote:
> > On Wed, Oct 28, 2020 at 04:11:05PM +0800, Bingbu Cao wrote:

...

> > I just realized I can rewrite this as:
> >
> >       remaining = offset_in_page(remaining) ?: PAGE_SIZE;
> >       entry[1].second_entry.last_page_available_bytes = remaining - 1;
> >
> > Would it work for you?
>
> Looks good to me.

Have you got v2?

-- 
With Best Regards,
Andy Shevchenko
