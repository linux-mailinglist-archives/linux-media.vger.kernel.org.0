Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C9263A942
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbiK1NQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbiK1NQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:16:27 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94481F2C0
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:14:29 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so25688945ejc.4
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1WLwtPLVe+kok+GF/9bkopFID8gJSprLPMTL4UtK5Oo=;
        b=ZBc4ZbpFCkjXpEc3iIjaYaONc3dCBbJ6Lby/+XqCCE8ztuNP04NU4ugL6GNOEEYbPk
         AP8WD08RiDp0I2+2S1+Q++9GxZm3Cfb8gDGDmKTBXs/qsqIvhv4M7kGm+L0+xP19dmDq
         137AnM08Tz20F+40PLHvRIEbs/IJWjNCmG+Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WLwtPLVe+kok+GF/9bkopFID8gJSprLPMTL4UtK5Oo=;
        b=02JEfIIDot/id5u68CYHBGFU5C1LDYmuzsSde3FkZPLaBR53RSkaLYDsXY52WpA9tM
         UIgleiZppBznD6+LNFEbclQCeTxvyAkgqb/C2Il9ysQPllJN+9oFzQkCRsfcX7z685lI
         yBONgyxZSLg2VcZ7kUBG1a/AyzugGuXF3SLVFhEZ9xV5sqh77g2BM7goM88JHX59/Vt6
         C4BH57MrfEydmqnf7UtH3sGrqsKpicAgm0rwfU5Tn6l/szNKXj+0UeIGt9mJ+tk6Qfsx
         xncwYRV9dpIbLPDpS7UVMWiMLncvoZiM1L84qII2jBLjHjWRIgk/ynhsoxtOJ+bjwMeH
         fw1w==
X-Gm-Message-State: ANoB5pmiSHIzklrRKSE6q4u7IvI/dzqqSMLCigZfj7xsGfSnztgkFQeQ
        9eEhMRRM/mHsCqWBCYTo8zK0Lw==
X-Google-Smtp-Source: AA0mqf4cqBo1/fepcCplaAk0A1rjj7bMDmJQY2UZXpop/ZjNZbOep5IJOxmchubwJRlz1l8nrsOMtA==
X-Received: by 2002:a17:906:9402:b0:78d:8bb6:ba7f with SMTP id q2-20020a170906940200b0078d8bb6ba7fmr33514976ejx.100.1669641267731;
        Mon, 28 Nov 2022 05:14:27 -0800 (PST)
Received: from bender.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id n17-20020a05640206d100b00459f4974128sm5175482edy.50.2022.11.28.05.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:14:27 -0800 (PST)
Date:   Mon, 28 Nov 2022 15:14:26 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi
Subject: Re: [PATCH v1 2/5] media: i2c: imx492: driver's header
Message-ID: <Y4S0MinGKoYW3Bfq@bender.k.g>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
 <20221125153120.541298-3-petko.manolov@konsulko.com>
 <166963964534.1079859.8944627251139157210@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166963964534.1079859.8944627251139157210@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-11-28 12:47:25, Kieran Bingham wrote:
> Quoting Petko Manolov (2022-11-25 15:31:17)
> > The header.  For the moment only two modes are supported.
> > 
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > ---
> >  drivers/media/i2c/imx492.h | 555 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 555 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx492.h
> > 
> > diff --git a/drivers/media/i2c/imx492.h b/drivers/media/i2c/imx492.h
> > new file mode 100644
> > index 000000000000..301fd66c77d5
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx492.h
> > @@ -0,0 +1,555 @@
> > +#ifndef        __imx492_h__
> > +#define        __imx492_h__
> > +
> > +struct imx492_reg {
> > +       u16 address;
> > +       u8 val;
> > +};
> > +
> > +static const struct imx492_reg mode_17to9_regs[] = {
> 
> Why is this table in the header? Should it be available in multiple locations?

Nope, but there are multiple modes that will eventually be in use and scrolling
down a couple of seconds until one gets to the code started to get a bit boring.

> I think it is likely better in the driver itself.

Will put register definitions in the .c file for the time being.


		Petko
