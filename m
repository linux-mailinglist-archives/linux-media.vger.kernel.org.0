Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD00262238
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 23:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgIHV6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 17:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgIHV6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 17:58:37 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E657C061573
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 14:58:36 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id i22so584462eja.5
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 14:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jS8sUgXZwYogdhE8faZPSTSu9lavhbYazTXnxbo7L0Y=;
        b=lfCJDFSH4WNRTmbAcJYjRD+buzZb/gDYcKGttjCwJY3pdH2uFHyyQPqQxoVS8Kuh7/
         jkwWA1Xsn4mL6jHX5FZ7TdoDtYqIk8aG99uJdx93Wwtkq1DUZVoNyodIQuqU1CKwDBkM
         Lgy6IydpZ+3XwxYW6e2HTHgSR6cnKySHDqsVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jS8sUgXZwYogdhE8faZPSTSu9lavhbYazTXnxbo7L0Y=;
        b=IQOLs08B24ndaXSYCVyqfSjwi5Y2fABAo7RC6N2XHo1hRhoAU6A6Txe/YYFuPo3cBw
         uDRdaPDTclphE7XFNbX6jy+7P2M1PdlHYwBGm1mzba4RGpx4bRJWzoRekFWMjl+j4V5Y
         n73Pss6GS9Cv19wI4R0ducNr3w0qSXEPr1bCh4Xt98bOwc2NMJ9FsvCG9A9xKH+a1F+C
         ysZaCwGewOSKtAYSORh2u2SThC2oZrfymKMpsHprStVIf+8QfwsNSqy+hweWLb8UbmHe
         9ypgqYBWZoGo6/6EXNInZgUE0/LdPqEcSqtg/3P8mt/k4V8cx3CAHcvNLN8QZVPfrb54
         7pzg==
X-Gm-Message-State: AOAM530qR8FshFqiUW1I4sb1R56YqJPn6y+RCTtDjBhyeSm16jOIDwav
        cepQyEIV5IQGNfejzlIDy7tpa+akA4nlBw==
X-Google-Smtp-Source: ABdhPJzIEz2UIsbJ7e2XDvDH6hW8GREiHTAWxwEpshQ2SDIKxSwhoD9AeBvh+1HHhTeynjmMJnVBUw==
X-Received: by 2002:a17:906:2a04:: with SMTP id j4mr585288eje.440.1599602315002;
        Tue, 08 Sep 2020 14:58:35 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id k8sm317514ejz.60.2020.09.08.14.58.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 14:58:33 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id b79so432347wmb.4
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 14:58:33 -0700 (PDT)
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr433507wmf.55.1599602313215;
 Tue, 08 Sep 2020 14:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de> <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de> <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de> <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
In-Reply-To: <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Sep 2020 23:58:22 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
Message-ID: <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Mauro,

On Tue, Sep 1, 2020 at 5:02 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Tue, Sep 1, 2020 at 1:06 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Thu, Aug 20, 2020 at 07:33:48PM +0200, Tomasz Figa wrote:
> > > > It wasn't meant to be too insulting, but I found this out when trying
> > > > to figure out how to just disable it.  But it also ends up using
> > > > the actual dma attr flags for it's own consistency checks, so just
> > > > not setting the flag did not turn out to work that easily.
> > > >
> > >
> > > Yes, sadly the videobuf2 ended up becoming quite counterintuitive
> > > after growing for the long years and that is reflected in the design
> > > of this feature as well. I think we need to do something about it.
> >
> > So I'm about to respin the series and wonder how we should proceed.
> > I've failed to come up with a clean patch to keep the flag and make
> > it a no-op.  Can you or your team give it a spin?
> >
>
> Okay, I'll take a look.
>
> > Also I wonder if the flag should be renamed from NON_CONSISTENT
> > to NON_COHERENT - the consistent thing is a weird wart from the times
> > the old PCI DMA API that is mostly gone now.
>
> It originated from the DMA_ATTR_NON_CONSISTENT flag, but agreed that
> NON_COHERENT would be more consistent (pun not intended) with the rest
> of the DMA API given the removal of that flag. Let me see if we can
> still change it.

Given the above, we would like to make changes that affect the UAPI.
Would you still be able to revert this series?

Best regards,
Tomasz
