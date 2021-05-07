Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D018376560
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237037AbhEGMn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237030AbhEGMn0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:43:26 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF0AC061574;
        Fri,  7 May 2021 05:42:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id f24so13375894ejc.6;
        Fri, 07 May 2021 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0R0NE03VSFB7HX1ygMNh9PKJJ5aeG+pro1kBGtfO3Vg=;
        b=oUUN0s6uGwRXDsVKCcnyFTES/GSwTC4RI5d2soZfOlbDxh4o1UqebSB958UxlKtfBv
         X7M6V5ZaND0OcqD2fOiWfeT/mTuH1gQZeopG2969Eza2hNyS71r1DfYo+50wh70EM76V
         El8g2whwGfp+HnV5LtisbwPzKGHHFqaVqF0H+7BBrIkt1gMBoMu8pwmurnwgp6dNidpS
         Khu3R2EyW0+NXSZmp1S9eWSO/nqrG6yWcaprJsm+oaEU/NNA/tRrmLatcyt+V8eEpVYq
         2FYLMHYoceVt+Sqmr1tbXxj6sNwOjIJa+8dR0H7DbxogebZNZj8cmFrgkJOMoNDVvaSR
         pHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0R0NE03VSFB7HX1ygMNh9PKJJ5aeG+pro1kBGtfO3Vg=;
        b=YxvPslydoRdKiaHt5XM51WpasHMfuF8sY0ZuBQv5ama6VE5gwY2GFqDTfP1a4mAQCy
         kOnMU5nqm6oCa0c+p+fz47TSY64qmLH0cpAPbQpykkSD59aE2Yi2OpTguGIeXLvUkW/9
         +cEnaFcXyHxBPvC1e2Y86iqYdsD7pI4neVgqz93oGZHvoARKx8T+rOl2pmE/BpGepmg+
         gVLLsygD4/094sVNPy0Re7w2WRbMcERSBHBAOXQUnIvZ2bWCB8YQPyNSPH/pBCcYK+nw
         GOvyikXTbaiPqDc2roAfJCzxaG1EyOqfylgVuTy0fsmf7ZyLTtqEwn8i+KaUIwfRof7x
         sv5A==
X-Gm-Message-State: AOAM5304tyKsRXqMZT4ka1l/cvaQVKexjzmi5uXle2fIc62Q5QNapxIg
        cMg3PeXr3zq2QPSwpLIWAlkG8ElhZdsXKxTZx6B7NV1p5NjxBy8l
X-Google-Smtp-Source: ABdhPJxeHUUpsTyMp6KSLIely965QHdDUcWj5edfhK8VzZYU6CHJEP5ZjrJ3904hGpuZIganO/ao2vdkla5WC7/z644=
X-Received: by 2002:a17:906:7fd2:: with SMTP id r18mr5965382ejs.78.1620391345382;
 Fri, 07 May 2021 05:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000fdc0be05c1a6d68f@google.com> <20210506142210.GA37570@pc638.lan>
 <20210506145722.GC1955@kadam> <20210506180053.4770f495@gmail.com>
 <20210507080435.GF1922@kadam> <20210507152954.5773592a@gmail.com>
In-Reply-To: <20210507152954.5773592a@gmail.com>
From:   Uladzislau Rezki <urezki@gmail.com>
Date:   Fri, 7 May 2021 14:42:14 +0200
Message-ID: <CA+KHdyWuf8iDvrmGfapVy3pRie4FOwdasbtRij39MmXr0Wpzuw@mail.gmail.com>
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, mchehab@kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, Pavel.

Also in the commit message i see a type.

<snip>
syzbot reported WARNING in vmalloc. The problem
was in sizo size passed to vmalloc.
<snip>

Should it be "...zero size passed to vmalloc"?

--
Vlad Rezki


On Fri, May 7, 2021 at 2:29 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On Fri, 7 May 2021 11:04:36 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> > On Thu, May 06, 2021 at 06:00:53PM +0300, Pavel Skripkin wrote:
> > >
> > > Hi!
> > >
> > > I've already sent the patch:
> > > https://patchwork.linuxtv.org/project/linux-media/patch/20210506121211.8556-1-paskripkin@gmail.com/
> > >
> >
> > Please, always add a Fixes tag.
> >
> > Fixes: 4d43e13f723e ("V4L/DVB (4643): Multi-input patch for DVB-USB
> > device")
> >
> > regards,
> > dan carpenter
> >
>
> oh..., that's one thing I always forget about. Thanks for pointing it
> out, I'll send v2 soon
>
>
> With regards,
> Pavel Skripkin



-- 
Uladzislau Rezki
