Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8052E1F5BBC
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 21:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgFJTEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 15:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgFJTD7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 15:03:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C94C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 12:03:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q25so2848505wmj.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 12:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NSUIdscZFTvAj/KAnkXmeLO33H1QImBmP7nNAatzF4E=;
        b=A5UREhW8Zimz/lgVsX6YJceKyEcTDjGffoiiTJOFdDh2MS8Wxd5Ju72jDNEe03+VwF
         mVZ3B2461XaZq/JxobIkPo8zWcoju/Yn/0yxVkOeKJtCgUkiqKoSrFTT2OuKrMCeaeFn
         nXsSEcazn3q3aNRxaP6pf9xhar75XQ1iFYbaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NSUIdscZFTvAj/KAnkXmeLO33H1QImBmP7nNAatzF4E=;
        b=fhOLiT8XTP42xFPweXx1+pwYo8Trvyo/t9gXawxqKvEIIwo/YEU8DGU7xEfZ3O8lmk
         g//TWoCxrpCNyspkxQ+hdNBzq4++Lds+40id/UobaoQwFviNKB/OQ8d3fpyLM7aNYXes
         mkOuStcRluOnNQK/GgHGKypyer06fdta97Vyf3aQUgLalVj2uUW6XOAkPQaFaV+/8sG2
         ldXBG7hel5NonxCgvbFdezUuazhUeQo+lkMFFwBQGgY1JES6Wcio+ffji7f5j8pwMZya
         S9AsyogrT/SDA9V5OexA5lLy8hIGVHJwrzYOw0NH5vjJLTNNUPkAw3+LzEmdC4+pWA91
         EWHw==
X-Gm-Message-State: AOAM532LU1AzYIbdkHiSHr5J+9QkmNtjJZoAMZnxFqX5ZIKZB4uaeD60
        XXf8g47Jr90arb87Nr9Fjnag5g==
X-Google-Smtp-Source: ABdhPJzTRfYPcTj3IRS5BINNXpxwdDXmbXJOisFqkC0CCPcDchPYcvzcaAwcf6hmVi/W346PEWyYcw==
X-Received: by 2002:a1c:f301:: with SMTP id q1mr4562383wmq.110.1591815838119;
        Wed, 10 Jun 2020 12:03:58 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d2sm1039640wrs.95.2020.06.10.12.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 12:03:57 -0700 (PDT)
Date:   Wed, 10 Jun 2020 19:03:56 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, yuzhao@chromium.org,
        zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?utf-8?B?KOmEreaYh+W8mCk=?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        Christie Yu =?utf-8?B?KOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?utf-8?B?KOmZs+S/iuWFgyk=?= 
        <frederic.chen@mediatek.com>,
        Jungo Lin =?utf-8?B?KOael+aYjuS/iik=?= <jungo.lin@mediatek.com>,
        Rynn Wu =?utf-8?B?KOWQs+iCsuaBqSk=?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
Message-ID: <20200610190356.GJ201868@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
 <20200521171101.GA243874@chromium.org>
 <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl>
 <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
 <CAAEAJfDboyra5XcEiviJP_3Kk-mDNZH5nstDa_7P7XCV7bu7Pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfDboyra5XcEiviJP_3Kk-mDNZH5nstDa_7P7XCV7bu7Pg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 10, 2020 at 03:52:39PM -0300, Ezequiel Garcia wrote:
> Hi everyone,
> 
> Thanks for the patch.
> 
> On Wed, 10 Jun 2020 at 07:33, Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Wed, Jun 10, 2020 at 12:29 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > >
> > > On 21/05/2020 19:11, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> > > >> From: Pi-Hsun Shih <pihsun@chromium.org>
> > > >>
> > > >> Add two functions that can be used to stop new jobs from being queued /
> > > >> continue running queued job. This can be used while a driver using m2m
> > > >> helper is going to suspend / wake up from resume, and can ensure that
> > > >> there's no job running in suspend process.
[snip]
> > >
> > > I assume this will be part of a future patch series that calls these new functions?
> >
> > The mtk-jpeg encoder series depends on this patch as well, so I guess
> > it would go together with whichever is ready first.
> >
> > I would also envision someone changing the other existing drivers to
> > use the helpers, as I'm pretty much sure some of them don't handle
> > suspend/resume correctly.
> >
> 
> This indeed looks very good. If I understood the issue properly,
> the change would be useful for both stateless (e.g. hantro, et al)
> and stateful (e.g. coda) codecs.
> 
> Hantro uses pm_runtime_force_suspend, and I believe that
> could is enough for proper suspend/resume operation.

Unfortunately, no. :(

If the decoder is already decoding a frame, that would forcefully power
off the hardware and possibly even cause a system lockup if we are
unlucky to gate a clock in the middle of a bus transaction.

I just inspected the code now and actually found one more bug in its
power management handling. device_run() calls clk_bulk_enable() before
pm_runtime_get_sync(), but only the latter is guaranteed to actually
power on the relevant power domains, so we end up clocking unpowered
hardware.

> 
> I'm not seeing any code in CODA to handle this, so not sure
> how it's handling suspend/resume.
> 
> Maybe we can have CODA as the first user, given it's a well-maintained
> driver and should be fairly easy to test.

I remember checking a number of drivers using the m2m helpers randomly
and none of them implemented suspend/resume correctly. I suppose that
was not discovered because normally the userspace itself would stop the
operation before the system is suspended, although it's not an API
guarantee.

Best regards,
Tomasz
