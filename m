Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527C92812D9
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 14:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbgJBMg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 08:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgJBMg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 08:36:26 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4621C0613D0;
        Fri,  2 Oct 2020 05:36:26 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x22so1112884pfo.12;
        Fri, 02 Oct 2020 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UCR+QZlbJRR7G6SqK3i7yMDxf3forYLQPEv586WcD34=;
        b=cvMQXLgIfIQVKKbm7XpVZ20pUznSPsFY1u5hfnIY4gZu0vPQGGzUh87ZCX1c+73fDf
         ixu3YQ8A9F+GAIjQk5VMZRA4F9ii6uuiOnASzXQMHy44JidvXABapcbY6YPItZQ+xR+w
         WEO+mWbLNTsPdES3eYPrrWaKZNfH33l1YMhnX6w/jpwnCkgc/ESN5tV59vBTBLnhutTi
         chvLpNAJmLbKI/gh36HGacsXt3jtTclwj0ldwfOyzDyUKD2c8/UrM7J3r35Ds86xp7GX
         vas+CLv1jsVEgeADXyQjSjg0J8kU7VvQKFggiKvQyYA08FNGY76k5jMV0TBE6MN8sU0D
         Wylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UCR+QZlbJRR7G6SqK3i7yMDxf3forYLQPEv586WcD34=;
        b=ArM0QTTuTEwYM7FNd9abfDvUaObM+5kQ/3vwKV06XgE3l3rK7sy/14VWddGJSxynZE
         nZFykJFQEX8YN+Hz5tDyA0BjcUEaezZSeDHYONC4JnLnu0UaXJrP1wjXZngUBtWMs4tU
         st/ZvxNYV2kWH5utZ0WZ5zPxv/JW98IpcLJeuN4pOq/ZWb605qVap+DnkxRrrbjn5Z6+
         pffq4ak9mUdHJcKI+rkjo1ZhVsSZ82ebWLnsSoUIijDia1MMm2wDiFZPkUz+5R/+D3vs
         36v9kQXnGRlfoI1CR6MD4rJSrN1+Ywza1nspg/ceuUeeXPhHbjEhPQpEVu8+XSUaHR1B
         7hgA==
X-Gm-Message-State: AOAM533Ij1I5MuxdKEXaDh02tJpTbqoowjSHIAPtCxbEshrkbFzkgnd7
        Z8X1z2LT6XeTa8+MQApAV1xhqBzsM1qYpVZxzYGyF1uMn5Zxug==
X-Google-Smtp-Source: ABdhPJyU2SrYzqo6IL3nYImabX9nkk+Vdcl0PQbg0Hjn5KOazafdI7H8nftfjdcV2pFFBWXT2ugIBIWLr5n2uPTUoAA=
X-Received: by 2002:a63:4c1d:: with SMTP id z29mr2020084pga.203.1601642186341;
 Fri, 02 Oct 2020 05:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <490e5002c3fea266524c31e1a94853dca9c3286c.1601551027.git.mchehab+huawei@kernel.org>
 <CAHp75Ve3B_YzC3JpswDv_8sYoMmvh58q4iWxfx2090Nfk3+_Fw@mail.gmail.com> <20201001175547.1eb58b26@coco.lan>
In-Reply-To: <20201001175547.1eb58b26@coco.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Oct 2020 15:36:07 +0300
Message-ID: <CAHp75VdYWguPgpp2qgKG9=1Bt5gTZER_nuhBsXgy8yApo4RQug@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: fixes build breakage for ISP2400 due
 to a cleanup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 1, 2020 at 6:55 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Thu, 1 Oct 2020 18:50:12 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>
> > On Thu, Oct 1, 2020 at 2:17 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > A temporary var needed for building with ISP2400 was removed
> > > by accident on a cleanup patch.
> > >
> > > Fix the breakage.
> >
> > Is this in any of your branches?
>
> I added v3 of the fixes today at the media tree master branch.
>
> If no merge issues happen, it should be at tomorrow's linux-next.

Fixes the issue to me, thanks!
Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
