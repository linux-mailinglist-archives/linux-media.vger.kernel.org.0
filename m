Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E695288693
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 12:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387505AbgJIKLE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 06:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgJIKLE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 06:11:04 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCBBC0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 03:11:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k8so6463206pfk.2
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aFqhfHah1U4rC9Pp6iE88Smqcg7KSYKglut8QfDEHzo=;
        b=WeHlKTleujY4mocNNoAzfOHsnKHEbbNcdj55HP2jitQ3guf5Y8eXZzWUwDzJnrSP2R
         ptiImgVjPfkZNNlNLMmKzaxY9n9HckbQ+xTT/JBErk7O5ig0FHNNZlqx0oDzUZbsJR7d
         sbj160aETx8Z9Q1SYyRAhCe/Xysb6tx8Rd8ijQmH8i2r8s972XYC5OgaVzLF2Druiog6
         D2Fy1DXK2RX8PBw9fNkZ/dkq7aLEcxHS15LSWTEiTGK9ZIlNZ+D1yu0kcXF78ikX1UDx
         iP27pUJVQD4Zk97p/Bj6hfaJ21tsZQ3TjmUaBio5YwriACeSiTJdvtJCWMKR0Kart8Fl
         VrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFqhfHah1U4rC9Pp6iE88Smqcg7KSYKglut8QfDEHzo=;
        b=A956e+/ejashbou+JsrpnWim8oCkWiTKEB6Dw/QnEf7CWG9J8wy2xepjn6eF1YnEJF
         sjVG784HRl5B0GtYUvTuw2dvhmqu9ZIAMJ7n+VyMwsLn7pOty0v1tX1sN2VvDiN8GgqY
         4mTqH043gh7qIGzd93Acnf91BB8uxQ0xCuKjX0QWhdi8Ia4G2Kv7KJR+jDdrNc3Rcz56
         XE1w6G0YXoD1BKuyOtpJiyzC9Zdeg1rRvJIGdNwb7qZBhTJW1NAcwR2hNCN/ZJdds93/
         gHY05xUxnk27qWxnSMdyj5/lKF7K5uIGCOUGnS/FbHtLwkpfwCmyPV6ajP3zx2QCc6Sb
         vOXQ==
X-Gm-Message-State: AOAM533Wr/dw4BNEuDk8xZvAl+uOIASZcNJeYBNroKAhk3nbSITgALBs
        OXHREROwq8d6g2ObFqHIBU90ZJ/Y/WtIK4xWlIg=
X-Google-Smtp-Source: ABdhPJzI2RpE33pCq9TI2N2/CL00lyzSa2rZVDy63n5yX8lA6TQZd8dt7O2icol9iIFDvqB0E05s99KDYigapmJYwvc=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr3541381pjb.129.1602238263384;
 Fri, 09 Oct 2020 03:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-2-andriy.shevchenko@linux.intel.com> <20201009010042.GE12857@pendragon.ideasonboard.com>
In-Reply-To: <20201009010042.GE12857@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Oct 2020 13:11:53 +0300
Message-ID: <CAHp75VcF53SDrHgD++q-tRCaUyw5ofsNk12Quz7Zqt9_D6n5Aw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] media: ipu3-cio2: Introduce CIO2_LOP_ENTRIES constant
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 4:10 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Aug 17, 2020 at 07:07:25PM +0300, Andy Shevchenko wrote:
> > This constant is used in several places in the code, define it
> > for better maintenance.


> >  #define CIO2_MAX_BUFFERS                     (PAGE_SIZE / 16 / CIO2_MAX_LOPS)
> > +#define CIO2_LOP_ENTRIES                     (PAGE_SIZE / sizeof(u32))
>
> Shouldn't this be CIO2_PAGE_SIZE instead of PAGE_SIZE ?

I don't think it makes sense to define this. Then you need to define
all others as well and they will be the same as for the CPU/MMU. As I
explained in another patch it's quite unlikely that these two will be
different.

-- 
With Best Regards,
Andy Shevchenko
