Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D9A252C85
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 13:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgHZLeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 07:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728946AbgHZL0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 07:26:33 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EECC061574;
        Wed, 26 Aug 2020 04:25:52 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w14so1923164ljj.4;
        Wed, 26 Aug 2020 04:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BwPP+Wy6wA+3eWc/onU66ibaN4gluQuh0nP0l3YOUgY=;
        b=E7VxO8g4aPMfq4QDhK8BsuM/jTaOOwMzE+iUebvg+1KPXgHLZ/uheF+srixOBQG7Pw
         mLT7kFfr9VzTvSHgpAYSYS7u9G88jbHWq6gmLad6k+pHRahNDthV0vEzV6IaS4pfcq4n
         kjQoVV+4Fu1N8eW2tX21cbqFOBCfg+4cZQ2eKCH9863QtfIlYDwhQg7fl8+mo1nXwFga
         t04AS7oMBGiNPQUFds5R425WHFGNzo8sktu/aAwLxsDkLJGJU46IhGZ/82XC53oRzL9b
         yzxBJPtoIWzKEXDoSWgBA7pLE6yDyFjunnZWtjoGLwIiFoIuzG4x/rfy/upwZ/PNOerC
         7ozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwPP+Wy6wA+3eWc/onU66ibaN4gluQuh0nP0l3YOUgY=;
        b=c9Z0dF+HrTEFzkgArBpE9UB9aWLRD/k/Gn1sXpglnliApxb15xWkbzxWabv/pTjW2H
         KHZEnD4rrvuKOxNcSi+KIxTpNlXnya1s86oBzzXsi0Hj4oPWjKO1c9R5RZC8FWwkB8Tu
         KUMb7ziWW28tRR0jnlWUztgqqh8B2DqSAi1Z/Nx4fKeR3BRERizNdhhcWRnpT+80eQs6
         QMACT3wzl1ud8Bb/lOpRLO6dEGPRqKkg0uMNACxRIEasXt1xpNpHu31SOPbErzVBMSfH
         EIkPsDQAEMp9cHOFXrL9gxOo0nlmOct0711reyK5s1t7GRqs5Dd/3yTNUMi9vgtrXpFe
         R0Rw==
X-Gm-Message-State: AOAM5302LD5l3hG4Cbpt33YkytOaaEvVNdeg/gAJ3WeCzF9f5LgCVblW
        EL1yQuPqTn9rf2HhBDD7PPdh0/6heIx2fdpm8hLyjZso
X-Google-Smtp-Source: ABdhPJyf3RocfiFYJoOXhENx1YiwGXmbCnofX5NfPHEkKZ/YZSvrN2VK++bIgmUgSR+KxwDjqy0ss+1Z2wzh5TICNTA=
X-Received: by 2002:a2e:9904:: with SMTP id v4mr6738335lji.321.1598441149742;
 Wed, 26 Aug 2020 04:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200825145556.637323-1-gnurou@gmail.com> <CAAEAJfBbxExQP7cAQnsAE1_Zh-onBKPt8is3S9qBEpx6MAywRg@mail.gmail.com>
In-Reply-To: <CAAEAJfBbxExQP7cAQnsAE1_Zh-onBKPt8is3S9qBEpx6MAywRg@mail.gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Wed, 26 Aug 2020 20:25:38 +0900
Message-ID: <CAAVeFu+0UqVwoUmOXm38E-vikaQZ4Graaz_9ERWozNAeTFkrPQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: v4l2-mem2mem: fix poll() bug
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 26, 2020 at 7:10 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hello Alex,
>
> Thanks for the patch.
>
> On Tue, Aug 25, 2020, 11:56 AM Alexandre Courbot <gnurou@gmail.com> wrote:
> >
> > This addresses a very corner case that probably nobody ever encounters,
> > but I have hit it when playing with vicoded so here is a tentative fix.
> >
>
> I'll try to make a more complete review soon, but meanwhile
> I was thinking if it was possible to include a little kselftest program
> for this issue, something CIs can pick-up and test corner cases like this,
> making sure we don't regress on the issue.
>
> (Or alternatively, v4l2-compliance?)

I am not very familiar with kselftest, but IIUC the conditions that
lead to this issue are easier to reproduce using v4l2-compliance,
where we can have a user-space driving the queues. It would also have
the benefit to exercise all drivers. I'll think about adding such a
test, thanks for the suggestion!

>
> Thanks!
> Ezequiel
>
> > Patch 1/2 addresses the issue that when the last buffer of a m2m device
> > has been dequeued, any attempt to poll with EPOLLOUT will result in only
> > EPOLLIN being returned, even if OUTPUT buffers are still pending. The
> > issue stems from the fact that the last buffer check if done first, and
> > returns immediately if true.
> >
> > Patch 2/2 builds on the first one to (hopefully) clean up the code a bit
> > and make the function flow easier to follow. Functionally speaking it is
> > supposed to be a no-op and it can safely be dropped if the former code
> > is preferred - the actual fix is in 1/2.
> >
> > Alexandre Courbot (2):
> >   media: v4l2-mem2mem: consider OUTPUT queue first when polling
> >   media: v4l2-mem2mem: simplify poll logic a bit
> >
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 42 +++++++++++---------------
> >  1 file changed, 18 insertions(+), 24 deletions(-)
> >
> > --
> > 2.28.0
> >
