Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39AC2C40FB
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 14:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbgKYNRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 08:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbgKYNRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 08:17:03 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6656FC061A4D
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 05:17:03 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id r24so3060717lfm.8
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 05:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HkRtjRKM05bLlO/XYCtld1KcwloYyZOvT1GTARJX0yY=;
        b=vaBWkenHZuKdNuLrjwQ+qVd0vmJfHlagTcPl7VfHzH9dYF+QU+lKnOvLz1K4anA7Sd
         It0KGyCImOzbwsqEX02YzyfjerAcKh05xGUJ68ytQ0FeU4DE/MAAD4Km2ezQck9R8myB
         Eohe5MRCGd5zM6oBfk27x2NLd6hj855vVOwz2wk+xvm1pLFlfx22fimJDBV5RQdY9/IZ
         ViOJIf0aBebN2jWVY6JZbcyWmP9h2h8Tj9RGRrohBeyJwQ9wIdIfNoYYqQpJ020JnUdk
         5DOqgXt1fznstbiB7d8BD7wikrY8p517nwIKVuM/JxRxT+XHq/2c3fj6XoWPd2e4osUe
         P9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HkRtjRKM05bLlO/XYCtld1KcwloYyZOvT1GTARJX0yY=;
        b=dJBT7bpaAMSRbOwt46BdET1XAQoTEhDOTGWKVLUrR6VBFsEKgehtf9SN+IG4meR46u
         suX6L0W1Jq6FPuF/cCcduckn0SqjGZ3P9q0oo//Gp3MkZAhJsPEkoVkl7P2iyxzVY3MZ
         BHGLj4n9CYXI8CKzgB+dEoSkPwIlHQDQ6wKbnjawSbW2MjasUMDVIRkDKyujw//d0cIB
         3LzTaXqAmUfMfI+etrHjy8Lmp5BVml+Kq0EnOQjy6yWA0q8Ayfr8TXxehJvuCQFOzTO4
         MAesKgXDjAtMrJ4havThg17qvaRVE7h0lP3r/+R7CqyfQZz2eQ14FKMhSHDIh09h/bPu
         /EmA==
X-Gm-Message-State: AOAM533Sb1jdhuzsyXOdNPLNAq+AGzyIFLgZnfPvmp+6A6JhVF20MZGr
        p/vovZyrmS4hbc7BHrMXAoTMFg==
X-Google-Smtp-Source: ABdhPJyqugkD6SrIzoTySqMszYOMe+UphjPSmeHMpbHK0agxohO8OXonD7v0by/QHWa5KCf4FvfWrQ==
X-Received: by 2002:a19:ec1:: with SMTP id 184mr1336365lfo.319.1606310221742;
        Wed, 25 Nov 2020 05:17:01 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j69sm257650lfj.49.2020.11.25.05.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 05:17:00 -0800 (PST)
Date:   Wed, 25 Nov 2020 14:16:59 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] adv748x: afe: Select input port when device is reset
Message-ID: <20201125131659.GB2162566@oden.dyn.berto.se>
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
 <20201122163637.3590465-2-niklas.soderlund+renesas@ragnatech.se>
 <99e2a13b-fc63-4ead-77e4-878574a5cbe0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99e2a13b-fc63-4ead-77e4-878574a5cbe0@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On 2020-11-25 12:10:08 +0000, Kieran Bingham wrote:
> Hi Niklas,
> 
> On 22/11/2020 16:36, Niklas Söderlund wrote:
> > It's not enough to select the AFE input port during probe it also needs
> > to be set when the device is reset. Move the port selection to
> > adv748x_reset() that is called during probe and when the device needs to
> > be reset.
> > 
> 
> Should we instead have an adv748x_afe_reset(), rather than expose the
> AFE internals to the top level core?

We could, I have no real preference. But in this case all 
adv748x_afe_reset() would do is call adv748x_afe_s_input() so unless we 
foresee more work to be done at reset time my preference would be like 
this but it's your call.

> 
> That said, shouldn't we be able to take advantage of regmap to restore
> registers in this instance?

I'm no regmap expert so I don't know. But if so we need to be sure the 
order of registers match what is needed as we need to restore the i2c 
addresses for all none core "pages".

> 
> --
> Kieran
> 
> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-afe.c  | 6 +-----
> >  drivers/media/i2c/adv748x/adv748x-core.c | 4 ++++
> >  drivers/media/i2c/adv748x/adv748x.h      | 1 +
> >  3 files changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> > index dbbb1e4d63637a33..4052cf67bf16c7fb 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> > @@ -154,7 +154,7 @@ static void adv748x_afe_set_video_standard(struct adv748x_state *state,
> >  		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT);
> >  }
> >  
> > -static int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
> > +int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
> >  {
> >  	struct adv748x_state *state = adv748x_afe_to_state(afe);
> >  
> > @@ -520,10 +520,6 @@ int adv748x_afe_init(struct adv748x_afe *afe)
> >  		}
> >  	}
> >  
> > -	adv748x_afe_s_input(afe, afe->input);
> > -
> > -	adv_dbg(state, "AFE Default input set to %d\n", afe->input);
> > -
> >  	/* Entity pads and sinks are 0-indexed to match the pads */
> >  	for (i = ADV748X_AFE_SINK_AIN0; i <= ADV748X_AFE_SINK_AIN7; i++)
> >  		afe->pads[i].flags = MEDIA_PAD_FL_SINK;
> > diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> > index 00966fe104881a14..8676ad2428856dd3 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-core.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> > @@ -516,6 +516,10 @@ static int adv748x_reset(struct adv748x_state *state)
> >  	if (ret)
> >  		return ret;
> >  
> > +	adv748x_afe_s_input(&state->afe, state->afe.input);
> > +
> > +	adv_dbg(state, "AFE Default input set to %d\n", state->afe.input);
> > +
> >  	/* Reset TXA and TXB */
> >  	adv748x_tx_power(&state->txa, 1);
> >  	adv748x_tx_power(&state->txa, 0);
> > diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> > index 1061f425ece5989e..747947ea3e316451 100644
> > --- a/drivers/media/i2c/adv748x/adv748x.h
> > +++ b/drivers/media/i2c/adv748x/adv748x.h
> > @@ -435,6 +435,7 @@ int adv748x_tx_power(struct adv748x_csi2 *tx, bool on);
> >  
> >  int adv748x_afe_init(struct adv748x_afe *afe);
> >  void adv748x_afe_cleanup(struct adv748x_afe *afe);
> > +int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input);
> >  
> >  int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx);
> >  void adv748x_csi2_cleanup(struct adv748x_csi2 *tx);
> > 
> 

-- 
Regards,
Niklas Söderlund
