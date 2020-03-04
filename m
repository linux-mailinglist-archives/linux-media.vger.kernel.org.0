Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 466EB179974
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 21:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729749AbgCDUCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 15:02:50 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35938 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729307AbgCDUCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 15:02:45 -0500
Received: by mail-lf1-f66.google.com with SMTP id s1so2570794lfd.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 12:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gxoQKbsayfVFXHX91j+mdW7L4rcB6FGPFdU2B8ezKfU=;
        b=1Wc4HeZ1edYjK032vrWpL4oW9WRckeZiy+m0GH583jiMluC5EAaNhXgl+e2So4j86S
         wm9SzcVE4YmcPJS/fr0lMIDUtbVqVgxl+yGOM1AWtwuQwjvoHimaGYKpyw985iVFdLWQ
         s7IeHfh2SnFKNR4YNNPVsfdWoFNXXFOzP6I/pwXfygyp6G8gaf9OcuUydPyGVYcFt57M
         qt1Ci2rdEHcK5TTvF/KXm3E7QM/0tGyJ8kIMdbf7TdZr7SbtZEaHzBzR7OTosIk6ri8e
         sb1V3R/bm2CV4L0tYePtYcC2+8IwyPl/43+6vLv8jWp2+J13WEE72RNi3X9aDJG+gMsT
         kh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gxoQKbsayfVFXHX91j+mdW7L4rcB6FGPFdU2B8ezKfU=;
        b=KTXfWoZ+F26rFtU8ZNfI8XHJSBiK3q7oPH3FJCizqV96RD9bzhWUdLPAl6hwe0MGJN
         nw8ahEJdAXLAwM+TgqJ1MDA5fQEZ/y/y3ckLNckccIkJsTYWYCE9yvFnA5UYDSU0H8B9
         b1B/RYa7G8w9SSqu5O97pfbgsDUbWj96frrPqgHHooz/5GeM/Ozp13g/ombE5BS5EeYs
         bqZrGXKaX2LYO8xKptH1ejQ4mJvgI/FOj92eQC8LLARkSrq0R+fgRNrFH5rCoz7qe7hA
         KsaQJEhnCG2oDmLbGGVEPd4PKo3KEB4Bow2w3nPbwOf/NQDa1k/upqbzDoi+U4Tlkiq8
         0W8Q==
X-Gm-Message-State: ANhLgQ02oMIBCMr95kpd/F8WGS0VyluDYYrriPv189DeeLWgsmEmW3CP
        NUvP0yJw7gc0fra5pu6/8zzLHA==
X-Google-Smtp-Source: ADFU+vveswO6fbrv3UXlduVlspna6IVmXsEC4rAfPEDyBucRFuBo4RQV28gRc8M7ecEwsvWlsxBqcw==
X-Received: by 2002:a19:ed08:: with SMTP id y8mr3003287lfy.56.1583352161463;
        Wed, 04 Mar 2020 12:02:41 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id d9sm14115625lfm.16.2020.03.04.12.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 12:02:40 -0800 (PST)
Date:   Wed, 4 Mar 2020 21:02:39 +0100
From:   "niklas.soderlund@ragnatech.se" <niklas.soderlund@ragnatech.se>
To:     "Rodin, Michael (Ferchau; ADITG/ESM1)" <mrodin@de.adit-jv.com>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Friedrich, Eugen (ADITG/ESM1)" <efriedrich@de.adit-jv.com>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        "Udipi, Suresh (Wipro; LEADER ; ADITJ/SWG)" 
        <external.sudipi@jp.adit-jv.com>,
        "akiyama@nds-osk.co.jp" <akiyama@nds-osk.co.jp>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] [RFC] media: rcar-vin: don't wait for stop state on
 clock lane during start of CSI2
Message-ID: <20200304200239.GB1791497@oden.dyn.berto.se>
References: <1582026251-21047-1-git-send-email-mrodin@de.adit-jv.com>
 <20200219172456.hyo2aksvubxpoqrn@uno.localdomain>
 <AC35D0CFBC66A84AAA9DF4334B52828D136F94C7@HI2EXCH01.adit-jv.com>
 <20200226164040.rzd3hqqzosqe2sar@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200226164040.rzd3hqqzosqe2sar@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thanks for your patch.

On 2020-02-26 17:40:40 +0100, Jacopo Mondi wrote:
> Hello Michael,
> 
> On Mon, Feb 24, 2020 at 02:13:08PM +0000, Rodin, Michael (Ferchau; ADITG/ESM1) wrote:
> > > On Tue, Feb 18, 2020 at 12:44:11PM +0100, Michael Rodin wrote:
> > > > The chapter 7.1 "D-PHY Physical Layer Option" of the CSI2
> > > > specification states that non-continuous clock behavior is optional,
> > > > i.e. the Clock Lane can remain in high-speed mode between the transmission
> > > of data packets.
> > > > Therefore waiting for the stop state (LP-11) on the Clock Lane is
> > > > wrong and will cause timeouts when a CSI2 transmitter with continuous
> > > > clock behavior is attached to R-Car CSI2 receiver. So wait only for
> > > > the stop state on the Data Lanes.
> > >
> > > Am I wrong or the desired behaviour should depend on the presence of the
> > > clock-noncontinuous property in the CSI-2 input endpoint ?
> > > If clock-noncontinuous is set, then wait for the clock lane to enter stop state
> > > too, if not just wait for the data lanes to stop.
> > >
> > > If this is correct, it will also require a change to the bindings and that's the
> > > tricky part. So far the CSI-2 receiver behaved as the clock-noncontinuous
> > > property was set (wait for both data and clock
> > > lanes) and older dtb should continue to work under this assumption. If you
> > > want to support devices with continuous clock then you have to require the
> > > clock-noncontinuous property to be explicitly set to false, and assume it's true
> > > if not specified. BUT clock-noncontinuous is a boolean property, whose value
> > > depends on it's presence only. So I fear we need to add a 'clock-continuous'
> > > flag to video-interfaces.txt, parse it in the CSI-2 receiver driver, and then ignore
> > > the clock lane stop state if and only if said property is specified.
> > >
> > > Does this make sense ?
> > >
> >
> > Hello Jacopo,
> >
> >  - First of all I am not so sure whether I am interpreting the CSI2 spec correctly,
> >    this is also the reason why I marked my patch as [RFC]. So MAYBE waiting for LP-11
> >    on the clock lane IS correct at this point in rcar-csi2 and the issue is somewhere else
> >    and your suggestion was based on my wrong assumption. Is it possible?
> 
> What I read there confirms what you said
> 
> For continuous clock behavior the Clock Lane remains in high-speed mode generating active clock signals
> between the transmission of data packets.
> For non-continuous clock behavior the Clock Lane enters the LP-11 state between the transmission of data
> packets.
> 
> and indeed non-continuous is optional.
> 
> However, the documented rcar-csi2 PHY start procedure prescribes to
> check for the clock stop state as well, so it is totally plausible the
> receiver requires the clock lane to be in stop state to properly
> intialize. IMX6 does the same, according to imx6-mipi-csi2.c and the
> documentation of the csi2_enable() function there.
> 
> Some sensors force clock lane in stop state at power-up to help
> receivers detect LP-11 state, just as an example...
> 
> But I think we're a bit mixing two issues here though. non-continous clock
> mode allows clock lane to enter low-power state during frame blanking
> (the LPS state in the CSI-2 specs). This feature as said, is optional,
> as during LPS only data lanes are required to transition to LP-11, as
> it is the initial and final phase of the SoT/EoT procedure as defined
> by the DPHY specs, which delimits an high-speed transmission burst.
> 
> What your patch is doing is modifying the condition for the CSI-2 RX
> to properly detect a phy start condition, which I think depends mostly
> on the receiver requirements...
> 
> I have missed one thing: do you have a faulty sensor that with this
> patch applied works as intended ?
> 
> >  - The presence of the "clock-noncontinuous" property is parsed by the V4L2 fwnode library,
> >    which sets either V4L2_MBUS_CSI2_CONTINUOUS_CLOCK or V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK.
> >    I could not find any upstream CSI2 receiver driver, which reads these flags. Would be rcar-csi2
> >    the first driver which reads this property (of a transmitter) at the receiver side?
> 
> non-continous is optional, so it's totally plausible.

I think that if we are to do anything here we should operate based on 
V4L2_MBUS_CSI2_{NON,}CONTINUOUS_CLOCK in rcar-csi2. What setup do you 
have that require this patch? As pointed out by Jacopo the R-Car CSI-2 
documentation specifically states the LP-11 should be checked for the 
clocklane as well as data lanes.

Another problem already pointed out by Jacopo is that the existing 
behavior needs to stay the same if no property is specified in DT. This 
is because we have a bunch of existing DTS files where no 
clock-noncontinuous is not specified.

> 
> >  - Sorry, but I don't understand your concerns about compatibility to old device trees.
> >    If "clock-noncontinuous" exists at the CSI2 transmitter side, it is assumed to be
> >    true (since as you mentioned, all boolean properties are true if present) and we
> >    would wait for LP-11 on clock lane in rcar-csi2 and older dtbs would continue to
> >    work correctly. If this property is not present in a CSI2 transmitter node of an older
> >    dtb although this transmitter has this property, then this is a wrong device tree
> >    configuration. So the suggested new "clock-continuous" property would be a workaround
> >    for supporting incorrect device trees. Should we maintain backwards compatibility in this case?
> 
> I'm not concerned on the CSI-2 transmitter node, but older DTB
> describing the rcar csi-2 receiver. If one loads a dtb that had no
> noncontinous clock property  as it was'implied' and suddenly the
> driver acts as you have to specify the property to enable that feature
> otherwise it assumes 'continuous', we then have troubles, as dt
> bindings are an ABI and older DTBs should continue to work as they
> used to. That's why, as you cannot set noncontiuous=false, I suggested
> a counterpart with continous, to make that feature enabled optionally.
> 
> Anyway, scratch that, I think we really should decouple the 'phy start
> up procedure' issue from the 'clock continuos/noncontinuos' one.
> 
> Are you having issue detecting a clock stop state on your sensor ?
> Does the sensor have a way to set the clock lane to stop state (eg.
> forcing non-continous mode) at power up ?
> 
> Thanks
>    j
> 
> >  - Even if we should maintain backwards compatibility to incorrectly configured device trees
> >    (i.e. "clock-noncontinuous" is not specified for CSI2 transmitters with non-continuous clock behavior),
> >    it is possibly not an issue in this particular case because we don't have to wait for
> >    LP-11 on clock lanes at all since the non-continuous clock behavior is optional according
> >    to the chapter 7.1 of the CSI2 specification. So from my understanding a CSI2 receiver
> >    which supports only continuous clock behavior would work with both kinds of clock
> >    behavior at the transmitter side. On the other side a CSI2 receiver which supports only
> >    non-continuous clock behavior (which is currently the behavior implemented in rcar-csi2.c)
> >    can not receive anything from a transmitter with continuous clock behavior and would violate CSI2 spec.
> >
> > >
> > > >
> > > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > > > ---
> > > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > index faa9fb2..6d1992a 100644
> > > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > @@ -416,8 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> > > >  	for (timeout = 0; timeout <= 20; timeout++) {
> > > >  		const u32 lane_mask = (1 << priv->lanes) - 1;
> > > >
> > > > -		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)
> > > &&
> > > > -		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > > > +		if ((rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > > >  			return 0;
> > > >
> > > >  		usleep_range(1000, 2000);
> > > > --
> > > > 2.7.4
> > > >



-- 
Regards,
Niklas Söderlund
