Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575BF445085
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 09:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhKDIpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 04:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbhKDIpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 04:45:39 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94620C06127A
        for <linux-media@vger.kernel.org>; Thu,  4 Nov 2021 01:43:01 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id d23so8225408ljj.10
        for <linux-media@vger.kernel.org>; Thu, 04 Nov 2021 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CXyeI3xMiJTAG82WekB5o4eFt7jqdPlFmHQ6u0DLw3U=;
        b=GAxabbjYucF7lO42n0hrOrxvLqUXXI10iB1xc3+BssZPkjLuhKc6ymz86tTlHNFVsi
         ujhKgwRKFjwvHS7jDn5+BqYVz30pvD833ATiQlE+PX3QPrCGrnJDkoaWMyTuFxAVsN7r
         nkkkrhMWaXoeKtSTe9tOOzrs8mroIb1B5tSV6kj50RKlnbFFlpu1OmF5+EWq/f0MIJsB
         vtI3BypRIrgwBQRE7pbF5YkIR159yqRh06xPOuzpvCwXrZcP8hZrkrsxjq3wWixSf1Qu
         /Ykdpq+Rco38/Lpl3iRIqlN84MxZufmENoubmvwwdZ0PM4GBcZEB5OXj96+vFZfJ35i/
         Wtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CXyeI3xMiJTAG82WekB5o4eFt7jqdPlFmHQ6u0DLw3U=;
        b=RQb4husd5Jv2DbNqnL/Pv6lrtM3ZmckLhjJKAcBVv10fMZGVkK3317RXEPaLgr6mto
         4urfVInEGE6pCrNDANM8tSBbkoVsQqMtWsi1fn3HCplIqqd1OiPdcWnUnFFk20kbdPgF
         aZMsNGl6z2dtHHFcfbWnVqJwEYoYsOTHms1OtyxKdPaZYJD1atk6tMU6Zcqxa26x0w4n
         oSVwOPt9I5140DoO/JcfFFiYZT/mswVkQZ2J90xpZtm+dA5zza3BrNPaO2Q4jrs+3z/k
         q+UnZ2nHnO4y0ZwIsTBzew8vTJBLjLUlWORM/q2+pejwtQKm0iqXHtac0MrnKS3K/hCw
         yjVg==
X-Gm-Message-State: AOAM530Ta9jDXA6gaXwOSTg7jZysJygjOsjWA1Vqzpn4yNS6YcpB/YVq
        TQELhwUkkZ1Coz/+NkrT41l4gA==
X-Google-Smtp-Source: ABdhPJxRyQZdlSyzNH2UbM1s2Nhd1LLD6TwMRhaqCSpFhkfDlmZafuB7xY5oVrjmghW4yu8TKxz9Ig==
X-Received: by 2002:a05:651c:1ac:: with SMTP id c12mr18587917ljn.205.1636015379791;
        Thu, 04 Nov 2021 01:42:59 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id m9sm87336lfu.202.2021.11.04.01.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 01:42:59 -0700 (PDT)
Date:   Thu, 4 Nov 2021 09:42:58 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] media: max9271: Fail loudly on bus read errors
Message-ID: <YYOdEl7t3U5I7epn@oden.dyn.berto.se>
References: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
 <20211103204654.223699-2-jacopo+renesas@jmondi.org>
 <YYMI2K2VrHAmSRfk@oden.dyn.berto.se>
 <20211104083058.km27mmkjltygftvg@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211104083058.km27mmkjltygftvg@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 2021-11-04 09:30:58 +0100, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Wed, Nov 03, 2021 at 11:10:32PM +0100, Niklas Söderlund wrote:
> > Hi Jacopo,
> >
> > Thanks for your work.
> >
> > On 2021-11-03 21:46:53 +0100, Jacopo Mondi wrote:
> > > Read errors were silently going ignored. Fail louder to make sure such
> > > errors are visible.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/max9271.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> > > index ff86c8c4ea61..aa9ab6831574 100644
> > > --- a/drivers/media/i2c/max9271.c
> > > +++ b/drivers/media/i2c/max9271.c
> > > @@ -30,7 +30,7 @@ static int max9271_read(struct max9271_device *dev, u8 reg)
> > >
> > >  	ret = i2c_smbus_read_byte_data(dev->client, reg);
> > >  	if (ret < 0)
> > > -		dev_dbg(&dev->client->dev,
> > > +		dev_err(&dev->client->dev,
> >
> > This feels a bit illogical as all call sites handles the return code and
> > acts accordingly. For some it's OK to fail and for others where it's not
> > a dev_err() is reported, for example in max9271_verify_id().
> >
> > Will this not log error messages in situations where there really is no
> 
> Yes, that's the case now with my 2/2 applied.
> 
> Basically I started this as pclk_detect was silently failing due to a
> sporadic read error, and I was not able to start the camera stream. I
> went all the way down from VIN to the very end of the pipeline
> increasing log verbosity and then I stumbled on this one.
> 
> So yes, call sites handles the error code, but most of them also fail
> silently making debug even more painful than usual.

Is that not a verbose issue that should be addressed at the call sites 
and not the read wrapper?

> 
> > error? Maybe dev_info() is a better choice if you want to increase
> > verbosity?
> 
> Yes, we could consider this. However, one could argue that errors in
> accessing the bus are anyway errors which is worth reporting, then the
> caller might decide if they're fatal or not...

I would argue, either any register read failures are fatal or non of 
them are and each call site needs to decide how to deal with it.

> 
> Thanks
>    j
> >
> > >  			"%s: register 0x%02x read failed (%d)\n",
> > >  			__func__, reg, ret);
> > >
> > > --
> > > 2.33.1
> > >
> >
> > --
> > Regards,
> > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund
