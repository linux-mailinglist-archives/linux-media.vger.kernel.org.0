Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C476D223C
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 16:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbjCaOTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 10:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbjCaOTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 10:19:40 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217F31EA32
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 07:19:37 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e9so7910866ljq.4
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680272375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUJ+qBKLuK4cF452Tfh7+WuuAXX5liwUqTQK4K/M/v0=;
        b=KxPkG18XtFbNmbT2++GXdS6DzkgHOSxryh2eTV0wZBDjYHiSedL6kKzt8zmeJzR2z2
         AX9XPUaG6ZVeZKVAe6qZLkwimMDBY64s+tPrGLxeYPri6r/ZP3iRynCDVilvRNbJhc4I
         XjLWyxG5JS/wlYYEzEdKyS3m7HgbO08R8aWvdcncpai6R6+SQb3JJWPbTBz8rKKDB+JU
         nr9OMmue4nLNDTRSNtG+BUE18aT0+hLy0UsUOdWRqtytdbi1BeDyLqm2doI2s6q2DsyA
         Xrpfqh/ngsQgu52JFh9edWbe1I4+cuQ18erKgXbsBq3xtsH7qITVdtMJPOgPPealR3Bi
         6YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUJ+qBKLuK4cF452Tfh7+WuuAXX5liwUqTQK4K/M/v0=;
        b=ugkDidVtp4RiA3m6bblYxtopUEe0xzNZCMVqPonfBRC8jOqGhb1YcfJbgLkyMyXtYp
         eITo6Cgj3ge/fMJ5RG4S7jBIFusWZ8RYtGSpEfljB5deGmLmcg1HTwiprTYphnEAna99
         T5yQW+9rLb6Go3XcTYwBoG7TL7rA9U7aMb9nryWQP/EsD8LXqhhgsiV5ORpKHuPVfRd8
         RFHNGQ3sTco89/i8+4eI+Ul9kggGz7LobduJiMwFdwT/6q0RyXGpZcviOGYfj+Kz+gFI
         V4bwYCi3nxz2RoFdaNXdElndUXGyfZITDUGIiddNez6XZ8qnBeuVzMiXqujgMzJa+tBY
         Z4Og==
X-Gm-Message-State: AAQBX9cshGWpU5YzsEG8OGFcllc7/LgrxOPjyNAHLNB9ctZ29po/Bz/S
        D32LSCv3xA0tZeZOvljueYPQOw==
X-Google-Smtp-Source: AKy350aq5IJ5JJhxZGhH+hsLXdHv8Jt7aKKbYEq2q08y4H+HLM0pvrn8MmLz1+H4RVwEp+U17WUxng==
X-Received: by 2002:a2e:730b:0:b0:2a6:16b5:2fc0 with SMTP id o11-20020a2e730b000000b002a616b52fc0mr1998504ljc.16.1680272375330;
        Fri, 31 Mar 2023 07:19:35 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e990e000000b00295b59fba40sm376118lji.25.2023.03.31.07.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 07:19:34 -0700 (PDT)
Date:   Fri, 31 Mar 2023 16:19:34 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add support for 3-lane C-PHY
Message-ID: <ZCbr9n4pT6ycYXpC@oden.dyn.berto.se>
References: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>
 <ZCbQTjL+Gy+Poeu/@valkosipuli.retiisi.eu>
 <ZCbe9D+LxbWveekE@oden.dyn.berto.se>
 <ZCbpdboZZop7pJXn@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCbpdboZZop7pJXn@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hej Sakari,

On 2023-03-31 17:08:53 +0300, Sakari Ailus wrote:
> Hejssan, Niklas!
> 
> On Fri, Mar 31, 2023 at 03:24:04PM +0200, Niklas Söderlund wrote:
> > Hej Sakari,
> > 
> > Tack för din feedback.
> > 
> > On 2023-03-31 15:21:34 +0300, Sakari Ailus wrote:
> > 
> > ...
> > 
> > > > @@ -332,8 +341,9 @@ static int max96712_parse_dt(struct 
> > > > max96712_priv *priv)
> > > >  {
> > > >  	struct fwnode_handle *ep;
> > > >  	struct v4l2_fwnode_endpoint v4l2_ep = {
> > > > -		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > > +		.bus_type = V4L2_MBUS_UNKNOWN,
> > > 
> > > The bindings don't require setting bus-type. Please change the bindings as
> > > well. And assume D-PHY in the driver if bus-type isn't set.
> > 
> > Thanks for spotting this, I will send out an update to update the 
> > binding to require setting bus-type.
> > 
> > About updating the driver to assume D-PHY if bus-type is not set. I 
> > wonder if we can avoid that and keep the driver change as is? The only 
> > in-tree user of this binding is in r8a779a0-falcon-csi-dsi.dtsi, and I 
> > intend to send out a patch to set the bus-type for that together with 
> > the updated bindings.
> > 
> > I have tested this driver change on the Falcon board and if bus-type is 
> > not explicitly set in the DTS it is reported as D-PHY and everything 
> > works as expected. So if I
> > 
> > - Send out a patch to update the bindings to require bus-type being set.
> > - Send out patch to update the only in-tree use of the driver to set 
> >   bus-type.
> > 
> > Can't we avoid issues in the future by not assuming no bus-type is D-PHY 
> > in the driver while still being backward compatible with the old DTS?
> 
> If you want to keep supporting D-PHY as a default, you should instead try
> parsing with V4L2_MBUS_CSI2_DPHY as bus_type. Then CPHY if that fails.
> 
> Although if bus_type is mandatory, then this patch is fine.

Thanks. I prefers to make bus-type a mandatory property, it feels like 
being explicit in the bindings is the best way going forward. I have 
posted the patches to make this change and to update the only user.

There is only one user in-tree, and making the change now would still be 
backward compatible with it. So better bite the bullet now before the 
binding spreads.

Trevlig helg!

> 
> -- 
> Trevliga hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund
