Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62C026226D
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 00:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgIHWJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 18:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgIHWJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 18:09:24 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED97FC061573
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 15:09:23 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w1so645810edr.3
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 15:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aCABmvNiwq5ZzfEtzfLCEjA/nFkGi01QovzZcJzwaW4=;
        b=A+mn5tT0iNNPItEfp6i6CyIrTFkG0NTDtOtusAoO6RvzmJ6S7GwZ3JTNz/XEbKNCy8
         R3IdrVuR0TLbgToZtxM9QBvlDNtS/V5zHhf63UnS30JQ1fnWNEr/52hRzIpxztKcs7Gx
         kdUdVheSz3d8PH6bPF1U7x7gh5HRx4MHu2JFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aCABmvNiwq5ZzfEtzfLCEjA/nFkGi01QovzZcJzwaW4=;
        b=dPd8YxFPbp8QAXhD8osuyMaDBYF45vbcwEGwSNIcFtGZwhQy9w6nWQOFEDd23aaDNC
         HhDBXPuXn5jT3jyglWUkvJfFT7nQP0HnztkS3oLMfN9EivFOnTg6lVwuL1UUSoiNc+rB
         EBd1TG1RQGarN7yj0gxwvrLefWOuhdlkuy0XugLh0L28a+3qbxSHhb5slyldNPQfY6LF
         r8lW87G15tG1b7hyIXWRKJwL+79ZMVc430C+7kueoCff6ANroj2wpbO3GcKlYgnmaSjM
         ZnGhkibL7ebwVWQuOCOUaNa3pQ7oa3lakcSHtdM6tf9kwOmsls/hubPnBYLMRt9YyQSe
         wQHQ==
X-Gm-Message-State: AOAM532HcisyaPpJhtZX/2AY2525YLqycDx1cZIj46f7sTtpzh1SNAKA
        aITAwQBEdV5DaBTplgO/C8dkMIe6PyqwrhTs
X-Google-Smtp-Source: ABdhPJxc2sXXto7iwRL2u87LmzgttA5gxKmpQVVn8KxLwHONPBLgt/98MAWhLZNAxduRl06WW9bsxQ==
X-Received: by 2002:a05:6402:1451:: with SMTP id d17mr1182319edx.48.1599602961656;
        Tue, 08 Sep 2020 15:09:21 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id dt15sm343186ejb.80.2020.09.08.15.09.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 15:09:20 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id z1so802396wrt.3
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 15:09:20 -0700 (PDT)
X-Received: by 2002:adf:ff90:: with SMTP id j16mr611132wrr.105.1599602960207;
 Tue, 08 Sep 2020 15:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de> <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de> <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de> <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
 <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
In-Reply-To: <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 9 Sep 2020 00:09:09 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BiHa2ziZuJPwbzKzqaziJfmNDo6YL1NviuppVSQ6YbVQ@mail.gmail.com>
Message-ID: <CAAFQd5BiHa2ziZuJPwbzKzqaziJfmNDo6YL1NviuppVSQ6YbVQ@mail.gmail.com>
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

On Tue, Sep 8, 2020 at 11:58 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Hans, Mauro,
>
> On Tue, Sep 1, 2020 at 5:02 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Tue, Sep 1, 2020 at 1:06 PM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > On Thu, Aug 20, 2020 at 07:33:48PM +0200, Tomasz Figa wrote:
> > > > > It wasn't meant to be too insulting, but I found this out when trying
> > > > > to figure out how to just disable it.  But it also ends up using
> > > > > the actual dma attr flags for it's own consistency checks, so just
> > > > > not setting the flag did not turn out to work that easily.
> > > > >
> > > >
> > > > Yes, sadly the videobuf2 ended up becoming quite counterintuitive
> > > > after growing for the long years and that is reflected in the design
> > > > of this feature as well. I think we need to do something about it.
> > >
> > > So I'm about to respin the series and wonder how we should proceed.
> > > I've failed to come up with a clean patch to keep the flag and make
> > > it a no-op.  Can you or your team give it a spin?
> > >
> >
> > Okay, I'll take a look.
> >
> > > Also I wonder if the flag should be renamed from NON_CONSISTENT
> > > to NON_COHERENT - the consistent thing is a weird wart from the times
> > > the old PCI DMA API that is mostly gone now.
> >
> > It originated from the DMA_ATTR_NON_CONSISTENT flag, but agreed that
> > NON_COHERENT would be more consistent (pun not intended) with the rest
> > of the DMA API given the removal of that flag. Let me see if we can
> > still change it.
>
> Given the above, we would like to make changes that affect the UAPI.
> Would you still be able to revert this series?

Sorry, I just realized that this isn't the original series that
introduced the thing, but rather a patch that does a partial revert. I
think it could be also applied as an alternative for the revert, but
perhaps a full series revert is just safer at this point?

For reference, the series in question is:
https://patchwork.linuxtv.org/project/linux-media/cover/20200514160153.3646-1-sergey.senozhatsky@gmail.com/

Best regards,
tomasz
