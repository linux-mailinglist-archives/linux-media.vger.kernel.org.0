Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041602A70E9
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 00:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732494AbgKDXCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 18:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbgKDXCH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 18:02:07 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09538C0613D2
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 15:02:07 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id g19so309150otp.13
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 15:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tvsqTI8LLfKPMqaeYKfvkogFyb/YUHI+2NJoDSLrrAg=;
        b=PyCmWLY6pOrELY4dufEwPYraML4MruAtA1MDYWM8bVceme+2vJWmfZZAxXashzsMdK
         WxJ/+MNjBrb1kjcJ4CVxVQYgK/4qvB1IqArv1LmTNFMr8mqo2CCDcDkyC3QqTJ/yq07T
         EA87te7OBfRDwPdwMdJRIADasNkaeMLEgvC3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tvsqTI8LLfKPMqaeYKfvkogFyb/YUHI+2NJoDSLrrAg=;
        b=bJj8m+h10jm2WS2Lsv17zzPaQrh9ULVlzxkQ26iW402Gf2d+rkQulCSDGj+DUrdbke
         y7alH/5QFRmSITyBH0FRLh/fFX9WXW6XoDXyPnrXOVVzqpY2perQLan/moTkKUm+LRCe
         VjbqTDRTthravmBhfDO457LuFVwKorfc+Tfi0gQCN+n45N8Vt1plAYkretnbXlvP2eiu
         Ny5dfzeBQ5zCePP5uXQA6RsB9CjtpKzBN8IpBhChC1/wOx0NKtSZcouV/11F4492Emkz
         I4d3gOjaE9aiMFREKleI12BaJ4dpd1E47RXGTKkc1Oxc6Qw9/h6RQHdCdl5TVQUZCwWr
         vawg==
X-Gm-Message-State: AOAM532ikpF0F6xD/bHs+66dwJziD3dLDCwWG9niWI9Jiv0gZ4uGN1KP
        Ka1kKSZV74aLsEVLSTezK9RvE+62BQauUBOh
X-Google-Smtp-Source: ABdhPJzyp8V5IRdUfNUWX6CgfDwwEZf8fm2B7WbipIrFWGPPzWcrh4ylT2A2htvo3QlwSssYm8l1yA==
X-Received: by 2002:a05:6830:2085:: with SMTP id y5mr20296otq.37.1604530926227;
        Wed, 04 Nov 2020 15:02:06 -0800 (PST)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com. [209.85.167.180])
        by smtp.gmail.com with ESMTPSA id r184sm807332oie.20.2020.11.04.15.02.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 15:02:05 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id x1so23973094oic.13
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 15:02:05 -0800 (PST)
X-Received: by 2002:a05:6808:602:: with SMTP id y2mr61526oih.11.1604530924987;
 Wed, 04 Nov 2020 15:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20201104180734.286789-1-ribalda@chromium.org> <20201104180734.286789-2-ribalda@chromium.org>
 <87769d554b4575bf9371380b013e66d70f1b21c4.camel@perches.com>
 <20201104214201.GH29958@pendragon.ideasonboard.com> <9d439214e8c83ebf7b93dccca2f848fbaf75b9d4.camel@perches.com>
 <CANiDSCvwvQUTt1QMQGGyZPag9VeHj4Ugmj8QJdBNtw00UNt6Pg@mail.gmail.com> <a00078e1311c09361e9e3357ba5dca037d7a8bff.camel@perches.com>
In-Reply-To: <a00078e1311c09361e9e3357ba5dca037d7a8bff.camel@perches.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 5 Nov 2020 00:01:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCteVWin-Yy2ZVSMUJBPvJ-F0Ti+fEpi26apsDW0XXrpwg@mail.gmail.com>
Message-ID: <CANiDSCteVWin-Yy2ZVSMUJBPvJ-F0Ti+fEpi26apsDW0XXrpwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: uvcvideo: Use pr_cont() macro
To:     Joe Perches <joe@perches.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe

On Thu, Nov 5, 2020 at 12:00 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-11-04 at 23:31 +0100, Ricardo Ribalda wrote:
>
> > I have updated my tree with the dev_ variants
> >
> > https://github.com/ribalda/linux/commit/b8785fd8efb4f2e5bbf5d0f2df3e0d69a5439015
>
> I looked at this link and was confused so you made me look.
> I think you meant:
>
> https://github.com/ribalda/linux/commit/83cb6eb3a9f7bd1954acbfb4fb3d56ddf54bce73

Yes, thanks :) Sorry about that

This is why I should be away from a keyboard after 23:00 :)
>
>


-- 
Ricardo Ribalda
