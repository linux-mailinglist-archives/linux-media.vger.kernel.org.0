Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4503F25925B
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 17:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgIAPKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 11:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgIAPJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 11:09:49 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEDBC061244
        for <linux-media@vger.kernel.org>; Tue,  1 Sep 2020 08:09:49 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id nw23so2182867ejb.4
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2020 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BIr3FRHLWeYI5mpm2jHeXhPihRGMNnmHYOmMOMeHpR4=;
        b=lCL5SLaMFPqoPftiV2X8nocTTBdKqARvrqI17ufYPS0DtjiIyaSIs4CniiHZ/VEW8n
         WoqCHbvQzPHbcjvAM7+zD7U98QNr5oxI5U75nYwYeOtUdaj7M9sptx5fdS3otDiC5uUz
         5071XY7IwhHNlm+8JmyRZFrwvyyMI1Xxx/Jf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIr3FRHLWeYI5mpm2jHeXhPihRGMNnmHYOmMOMeHpR4=;
        b=h0KZVcs11c5tjS0VUvvpWr8Q4lTBpaqJ8NTBl7VHoX6WO4EbK5R0bdxkbDBS6m1C4l
         lG5SNPTqypbkngKZD8f8RHMFfGtc+rA6FTffFmB3N/xLrjAlmH4eLAB1RK6GLjvJFzyQ
         I82vjHNxYBSSzMvIl8Sn5ijRXjj8uVZbRovzl4pShOq1LCt7BuvDm7vYCLJDTSxSNIt7
         a5MjGOJ7Ttyhmo+mHMNieglTNDZhgng7tPwf1kqzTs5K9Xla6f1GSlGV9LGT4L6Oyx4H
         l5o9IbtsTHVheiCy5UW9RE+UnQw5cFrTtW/rZ44KiOyMRLrmL1LTY1h0EWJvnWqSCrLw
         VW9Q==
X-Gm-Message-State: AOAM532IL+5561PiW24x7bm2oeuRgp9y1IG0I/Ngl8VgMgOLvAhldhxt
        YJ6pSDUeOHPgpwMPtbpJxOjGDaU6zCjj1g==
X-Google-Smtp-Source: ABdhPJxxkPZMqKhbl7PXPV48RnGKHMqyo29W87m9QzQ90jcp0cDp9o+eiKQOghB5MA80o7ks+wtb1A==
X-Received: by 2002:a17:906:fb84:: with SMTP id lr4mr1965129ejb.282.1598972987453;
        Tue, 01 Sep 2020 08:09:47 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id k14sm1349362edo.89.2020.09.01.08.09.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 08:09:47 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id d11so2129093ejt.13
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2020 08:09:47 -0700 (PDT)
X-Received: by 2002:a5d:5150:: with SMTP id u16mr2332024wrt.197.1598972568491;
 Tue, 01 Sep 2020 08:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de> <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de> <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de>
In-Reply-To: <20200901110617.GA13232@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 1 Sep 2020 17:02:20 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
Message-ID: <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
        linux-mips@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-mm@kvack.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-scsi@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Pawel Osciak <pawel@osciak.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 1, 2020 at 1:06 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 07:33:48PM +0200, Tomasz Figa wrote:
> > > It wasn't meant to be too insulting, but I found this out when trying
> > > to figure out how to just disable it.  But it also ends up using
> > > the actual dma attr flags for it's own consistency checks, so just
> > > not setting the flag did not turn out to work that easily.
> > >
> >
> > Yes, sadly the videobuf2 ended up becoming quite counterintuitive
> > after growing for the long years and that is reflected in the design
> > of this feature as well. I think we need to do something about it.
>
> So I'm about to respin the series and wonder how we should proceed.
> I've failed to come up with a clean patch to keep the flag and make
> it a no-op.  Can you or your team give it a spin?
>

Okay, I'll take a look.

> Also I wonder if the flag should be renamed from NON_CONSISTENT
> to NON_COHERENT - the consistent thing is a weird wart from the times
> the old PCI DMA API that is mostly gone now.

It originated from the DMA_ATTR_NON_CONSISTENT flag, but agreed that
NON_COHERENT would be more consistent (pun not intended) with the rest
of the DMA API given the removal of that flag. Let me see if we can
still change it.

Best regards,
Tomasz
