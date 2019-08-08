Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E17085D93
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731460AbfHHI60 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 8 Aug 2019 04:58:26 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36368 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731179AbfHHI60 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 04:58:26 -0400
Received: by mail-ot1-f68.google.com with SMTP id r6so115608856oti.3;
        Thu, 08 Aug 2019 01:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ChEnb641kW+LI38eY+67wZc+klPAdw289WaSSpaFM0U=;
        b=ljqBpWxMo5/tc3bFi3RvA8m+HKRY6fXitZ42IIRupN/r5SYA02VcqBqVW0mF3XIB1R
         yYnfNtswWYmMME0mVwxJrN+GPMUxX//1OvMyOK02Ch2V3qbxoj9lYbSP+nBrOwjka+Ow
         02LlC09vEB7ib/OqKdi0W+EnyB2ao0CSgNT+DrDwYP90J8cDHnqNWRq+zAxL59U4ynpz
         wv0VPstVknKyxh1xHEIiY4U0yuguHRauDvCePii5CfPsWxQFJ3/QQplFcV3uNRCPZf8k
         gMRTJcn5UuZddmg63D/q/wRQG160ZhQLtF4vED6QF4GziGDlyvRTNqqPPL4wmEjru9E7
         K8KA==
X-Gm-Message-State: APjAAAW14O2Fnxz6hnDUkzbXcvWMPm20pFmfoxDKPPgdK6AoruKe515y
        Vll/iX0FsvhWLg4Z4cRkziQw57FhZRQrnshD0pU=
X-Google-Smtp-Source: APXvYqx17/zE09hrpbm5SH/fPJ1cQKCq/qZ/9nb4pkM45YX7E/UbvGmN4KCGz5bSFd3Dxl/dStGofOZJWGKAEiP3rzw=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr12375826otc.250.1565254705817;
 Thu, 08 Aug 2019 01:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190729074757.9581-1-horms+renesas@verge.net.au> <CAMuHMdUkogXnd6_H_q=STyVS0zxpKYif_iJH0pw753onCeU3gw@mail.gmail.com>
In-Reply-To: <CAMuHMdUkogXnd6_H_q=STyVS0zxpKYif_iJH0pw753onCeU3gw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Aug 2019 10:58:14 +0200
Message-ID: <CAMuHMdXhcnN2K-5K-fwYNEK6UoBK=Y4gNjF=w7G4HqjMn7pLGQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rcar-imr: Rename bindings documentation file
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 29, 2019 at 10:31 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Jul 29, 2019 at 9:48 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > Renesas media binding documentation files uses a naming schema of
>
> use
>
> > 'renesas,<module>.txt'. Rename IMR file to match this pattern.
>
> the IMR file?
>
> >
> > Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, queued in renesas-devel/renesas-dt-bindings-for-v5.4 with the above
fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
