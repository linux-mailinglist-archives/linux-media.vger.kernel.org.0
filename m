Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2DA63AA21
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbiK1Nx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:53:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbiK1Nx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:53:56 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A9ADCF
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:53:55 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id td2so11859441ejc.5
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uNC+2y6pG+AeC5TJ+4q2YN4sYi3ODVilmriK0Rl8Gss=;
        b=g+68G66TcqaBnbKJau175AsG26SRk7PYzfbhR4tg6DozlysVxvx0SJig53ovER7yFj
         6j7N+7SC8yg6e702dQW3hbupUtydigW66KNg1UQLANBDCYYFAI3u0cEWDXYhtb74jtzL
         RdNlFlpNT8dM9gK2Vv/e027uj3OVXSfsoalGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNC+2y6pG+AeC5TJ+4q2YN4sYi3ODVilmriK0Rl8Gss=;
        b=jF+EHZtnHidrzaQiHGH4bA1IOavr1msi+O4XQD8QxfoJO2U6nU1pfPCjxFRpaGhzs9
         AbPB27ChO4VpPvc15Br0KFt0oCVSF/wGhbajSVZQcweIEyaEYkDGbAv/oZWg0wZr58ds
         pw76J09XOAJkfruXU0YosOL3w+n3eHYOUamUGnC7XVOAdef+et0GcIANPbHql+5PNrWF
         dfpYwwbvhqKvu6rmX2SH8r7xdLK+Ql1LpIt4WIj4Fb7aFHHxM4/qkoN61PWDLKX+6zQr
         wetzSpnAiaZ5E+SncmPGa4lJbV0lD8/Ia/PPpC4LUWXuBIUduJ9IyNGGSXWZrQTYNg2y
         /qEw==
X-Gm-Message-State: ANoB5pmhpquGDAOgl09QxUxcrzOeUtuJL2NExG4wmDVOpT6TQt8p8oMT
        RAWWqtM0KWB/jZvaEAiX8tdIjg==
X-Google-Smtp-Source: AA0mqf6ezq9FMRf64M4B9It/okYP3mwcIMlMjJTasO9iN1eqgdY4W/VUq9CQk7KJvKH+iUVY8ydsww==
X-Received: by 2002:a17:906:4486:b0:7bd:daa1:7001 with SMTP id y6-20020a170906448600b007bddaa17001mr9097989ejo.133.1669643633910;
        Mon, 28 Nov 2022 05:53:53 -0800 (PST)
Received: from bender.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id j18-20020a17090623f200b007adbd01c566sm5004453ejg.146.2022.11.28.05.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:53:53 -0800 (PST)
Date:   Mon, 28 Nov 2022 15:53:52 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v1 2/5] media: i2c: imx492: driver's header
Message-ID: <Y4S9cHwMlEJ74tTs@bender.k.g>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
 <20221125153120.541298-3-petko.manolov@konsulko.com>
 <166963964534.1079859.8944627251139157210@Monstersaurus>
 <Y4S0MinGKoYW3Bfq@bender.k.g>
 <Y4S3/UVEPZscrbag@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4S3/UVEPZscrbag@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-11-28 15:30:37, Laurent Pinchart wrote:
> On Mon, Nov 28, 2022 at 03:14:26PM +0200, Petko Manolov wrote:
> > On 22-11-28 12:47:25, Kieran Bingham wrote:
> > > Quoting Petko Manolov (2022-11-25 15:31:17)
> > > > The header.  For the moment only two modes are supported.
> > > > 
> > > > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > > > ---
> > > >  drivers/media/i2c/imx492.h | 555 +++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 555 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/imx492.h
> > > > 
> > > > diff --git a/drivers/media/i2c/imx492.h b/drivers/media/i2c/imx492.h
> > > > new file mode 100644
> > > > index 000000000000..301fd66c77d5
> > > > --- /dev/null
> > > > +++ b/drivers/media/i2c/imx492.h
> > > > @@ -0,0 +1,555 @@
> > > > +#ifndef        __imx492_h__
> > > > +#define        __imx492_h__
> > > > +
> > > > +struct imx492_reg {
> > > > +       u16 address;
> > > > +       u8 val;
> > > > +};
> > > > +
> > > > +static const struct imx492_reg mode_17to9_regs[] = {
> > > 
> > > Why is this table in the header? Should it be available in multiple locations?
> > 
> > Nope, but there are multiple modes that will eventually be in use and scrolling
> > down a couple of seconds until one gets to the code started to get a bit boring.
> 
> Ideally we should get rid of those tables and use logic to compute register
> values :-) That's a dream only at this point though.

I don't see this happening anytime soon with this particular sensor. :)

> I agree with Kieran that everything could be in the same file, and I also
> agree with you that it's not nice to have a large list of registers at the
> beginning of the driver. I'm thus fine with either option.

I use one register/value pair in a row while the driver is in development,
because it is easy to modify some of them and put a comment at the back.  Once
done with it multiple entries per line will reduce the pain.

At that point most registers that are common for all modes could be put in a
separate array and modify only those that are relevant for a particular
mode/format.  Not quite there yet...

> > > I think it is likely better in the driver itself.
> > 
> > Will put register definitions in the .c file for the time being.
> 
> -- 
> Regards,
> 
> Laurent Pinchart


		Petko
