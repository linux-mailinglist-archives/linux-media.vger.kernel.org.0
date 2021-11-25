Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D52D45D671
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 09:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350047AbhKYIvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 03:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353505AbhKYItS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 03:49:18 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E48C0613B3
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 00:41:37 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id t26so14389831lfk.9
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 00:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nx9yMihjJrikirX7YSEZYnRgpYjCEvWkb1r0ARpegII=;
        b=xGhEioLOdHXFg9tmf5qJORJtCyUerzIwdqhprNRThmcsfsA2Exo2375kdTL9bvFFSa
         UppGg1ymwKUeC3gGjwbwrNf3nlYsgoMpqDPIsMXsPj2qoynGcBlp0rMJTN4HjIvKfeRu
         CMxb5OoOpfBR9fMzEX0t717Ln+XidnJ5eGsUPPgw1ZZkjVCENkjZ1KxI5Sc+frjLEWLq
         KNLxQuo1R2e0ZqLzKumXx3MZ36omnJMD3m+Sq4WowY8hm9d54u3nMhGLcz4PYDXEvV9g
         exNh0WEP3IvcNWNtGNvqAtOEsa8L7mKHIPdV4uExhCGHRbS3C20KJbD/Q2B/YExQX2it
         hLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nx9yMihjJrikirX7YSEZYnRgpYjCEvWkb1r0ARpegII=;
        b=B8oE1r7n+4BJQQOGfTB1Bo6kWYIEMTL/xJfmwKFvU0QIzxuCG7JLPDH8qLbafgNCw4
         gIN8Lg1uycIi1HCE0bSnt09I46BSe0n4NUhP7Utq71f4CXDxTvgZ00TFAzDq1/8HcXG4
         P0M0sMtIYvTIxi2kWwFOL4pcwhbrFc/+7qz/PKsgS0nWDBRejpRykUIqzsI+MM5AkIM/
         P8QPLVuCD6sEQQ45ZvLhqLgb3A/V8AwiqbAkK2NMlthAc0ngkepOGLCv3f6q4iFHSorF
         iHz7991BkdTQ+Rc5XDbBOpr/ZyTyCuWKJyqsKieaYjqbQ0o2+PFGrq0R6pckG6YgVl7/
         ehMA==
X-Gm-Message-State: AOAM533Lbnv233+rs7HbUP4o1rcOI4m1veONGdyOxgLRh3gqhQXdma+k
        3JVf8pe1rk6uIbzCPIuiq9LlPA==
X-Google-Smtp-Source: ABdhPJwu+NLnzXYnIQCTu89xhzRZFCha7V/gCxcDXBhGTqQStg3aZ6VssNX/+/xIhPdatcGpDeWoRg==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr21391766lfm.631.1637829695936;
        Thu, 25 Nov 2021 00:41:35 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id e14sm246249lfs.150.2021.11.25.00.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 00:41:35 -0800 (PST)
Date:   Thu, 25 Nov 2021 09:41:34 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-vin: Add check for completed capture before
 completing buffer
Message-ID: <YZ9MPu1WIJk0MtLr@oden.dyn.berto.se>
References: <20211123155443.3705143-1-niklas.soderlund+renesas@ragnatech.se>
 <163779391741.3153335.8189408341245810954@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163779391741.3153335.8189408341245810954@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thanks for your feedback.

On 2021-11-24 22:45:17 +0000, Kieran Bingham wrote:
> Quoting Niklas Söderlund (2021-11-23 15:54:43)
> > Before reading which slot was captured to by examining the module status
> > (VnMS) register, make sure something was captured at all by examining
> > the interrupt status register (VnINTS).
> > 
> > Failing this a buffer maybe completed before it was captured too.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index 25ead9333d0046e7..87ccbdc3d11a0f2d 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -111,6 +111,9 @@
> >  #define VNIE_FIE               (1 << 4)
> >  #define VNIE_EFE               (1 << 1)
> >  
> > +/* Video n Interrupt Status Register bits */
> > +#define VNINTS_FIS             (1 << 4)
> > +
> >  /* Video n Data Mode Register bits */
> >  #define VNDMR_A8BIT(n)         (((n) & 0xff) << 24)
> >  #define VNDMR_A8BIT_MASK       (0xff << 24)
> > @@ -1005,6 +1008,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
> >         rvin_ack_interrupt(vin);
> >         handled = 1;
> >  
> > +       /* Nothing to do if nothing was captured. */
> > +       if (!(int_status & VNINTS_FIS))
> 
> Does this deserve a warning or debug print? It sounds like it may be
> somewhat spurious or unexpected if it occurs?

I don't think so. One can enable more interrupts then the ones we do 
today, for example during debugging capture issues. This check just make 
sure we don't try to process a capture if the interrupt is not related 
to capture ;-)

> 
> --
> Kieran
> 
> 
> > +               goto done;
> > +
> >         /* Nothing to do if capture status is 'STOPPED' */
> >         if (vin->state == STOPPED) {
> >                 vin_dbg(vin, "IRQ while state stopped\n");
> > -- 
> > 2.34.0
> >

-- 
Kind Regards,
Niklas Söderlund
