Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C55220FB7
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 22:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfEPUoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 16:44:23 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:43364 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbfEPUoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 16:44:23 -0400
Received: by mail-lj1-f176.google.com with SMTP id z5so4318670lji.10
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 13:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=O4YQlmZ5MIYdnldebqyOQVqr06qrs1qRMTeOLjMVWrs=;
        b=PXFA17v1UFO6E+VdhuOqRYErH8oPXRe6yZhAFz6xU+dvsk37W7zAJAepdhybCiXqg4
         Ac/eWro6GJUUuCjePX4pCeeXuVlAJPT/i+Huitoajymg5PIqTTxhjI8DvM4rk40k6g9j
         ocCoPziobgGcwxDVLMVQsw7n/MFClTxWsZVvo0I6lbSnzcAUXOIEBOzhPedxbaxmyFho
         /gex9coX7lmVF2SfyelL1Ov0fC2x3Dx9deZqxabENXabDjKgA7X18YXUSCoqGdIkgKUc
         K5WKOGJOtXK20BBYB6d2JRIRkkEpzQZrUv4SkKM0Rl7qyb059GRq7VMQszRcRjA/Huk/
         tnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=O4YQlmZ5MIYdnldebqyOQVqr06qrs1qRMTeOLjMVWrs=;
        b=jvNW74jn+Oqp5tBPms1BHg2pO/hvJsssrjNFd+V+plR0pv55Wrrn9FZRq0eU2S2cxV
         rhOz7KBWOZFx9VyGI5OJWEYXnc+nkA3f8ReAD/5rt4c0nVkOmEaRsTORxNo1SxzwGLoy
         /MYXHvDnAuAgDPQOrhVdYbJVtjqkORs6swvAPeHNQMm7KvHOnVE2up2Hwu2TSWUMYm7y
         Ysad7C4bBTNf3dbJmeD0w8QTkkZdLBHaP9wSSBNBM/dW9YETfDowJSoPvTkapcUGeN22
         x0+dtQQuH/aOtmqkNkCOzxq4Y2vuHHAUJb1VrbE87gsTNDNTbbv5nDAqa5hEfyJvHzx4
         vhEw==
X-Gm-Message-State: APjAAAVcJYM1BNOYaDhMXHbmkkosOdspQXBQy8OKcbWE79+DbMIBbVfW
        7hwAA4/R51JNARRocmXh9OemQw==
X-Google-Smtp-Source: APXvYqyVuLVySF5rnrnVsnLgnpGrCTm3hrpsqU2HjHmiL01Cn7/mJY0a3Tzg2KQnuTRCNbgPETjLHQ==
X-Received: by 2002:a2e:8716:: with SMTP id m22mr10015439lji.128.1558039460458;
        Thu, 16 May 2019 13:44:20 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id y25sm1147668lfy.59.2019.05.16.13.44.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 13:44:19 -0700 (PDT)
Date:   Thu, 16 May 2019 22:44:18 +0200
From:   "niklas.soderlund@ragnatech.se" <niklas.soderlund@ragnatech.se>
To:     "Rodin, Michael (Ferchau; ADITG/ESM1)" <mrodin@de.adit-jv.com>
Cc:     "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "michael@rodin.online" <michael@rodin.online>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: adv748x: initialize bit 7 of
 csi_tx_top_reg_1f
Message-ID: <20190516204418.GF31788@bigcity.dyn.berto.se>
References: <1557502240-16274-1-git-send-email-mrodin@de.adit-jv.com>
 <26e001a0-298f-e23b-9e46-98e62a8399c2@ideasonboard.com>
 <20190510190124.GE28561@bigcity.dyn.berto.se>
 <AC35D0CFBC66A84AAA9DF4334B52828D136181C3@HI2EXCH01.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AC35D0CFBC66A84AAA9DF4334B52828D136181C3@HI2EXCH01.adit-jv.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rodin,

On 2019-05-16 14:24:13 +0000, Rodin, Michael (Ferchau; ADITG/ESM1) wrote:
> Hi Kieran and Niklas,
> 
> thank you for your responses!
> 
> > Hi Kieran and Michael,
> >
> > On 2019-05-10 17:25:24 +0100, Kieran Bingham wrote:
> > <snip>
> >
> > >
> > > Niklas, how does RCar-CSI determine the top/bottom sequence?
> >
> > That patch just got merged in the media tree a few days ago,
> >
> >     9f7983bdc4925ae2 ("media: rcar-csi2: Propagate the FLD signal for NTSC
> > and PAL")
> >
> > >
> > > Do we have field inversion currently? (or one which is perhaps swapped
> > > somewhere along the pipeline in rcar-vin?)
> > >
> >
> > I'm not sure which tree this patch is developed on but Steve Longerbeam
> > posted a RFC which IMHO had the fields inverted, there was a discussion in
> his
> > thread [1] where I tried to get to the bottom of the issue. My conclusions
> > there might be wrong due to the issues addressed in this patch.
> >
> > Michael: Did you have Steve's patch in your tree when testing this?
> >
> > 1. https://patchwork.kernel.org/patch/10904263/
> >
> > --
> > Regards,
> > Niklas Söderlund
> 
> I had another version of Steve's patch when testing, but the FLD_NUM
> setting was still the opposite compared to 9f7983bdc4925ae2
> ("media: rcar-csi2: Propagate the FLD signal for NTSC and PAL").
> I could send all patches from the private pull request which Steve Longerbeam
> has created for ADIT if you want to better understand my test results,
> but probably they can not be applied to the current mainline development tree.
> The patch for adv748x I used for testing looks a bit different as well,
> so it can be applied to the tree used by ADIT. But the functionality
> is the same (I can provide the patch as well if it is required.).
> There are also concerns regarding VnMC.FOC bit (I tested V4L2_FIELD_INTERLACED mode 
> and in my tests I figured out, that this bit does not exactly do
> what the Renesas Hardware Manual describes and should be always set to 0
> regardless whether NTSC or PAL are used. But I had only Raspberry Pi as
> NTSC test source and no additional NTSC camera for verification,
> so the results may be not reliable.).

Interesting, I will add VnMC.FOC to my list of things to look into.

> 
> 
> Niklas, in [1] you mentioned that you could read the WC counter (which is in
> fact the frame number in case of frame start packets) in the interrupt
> INT_FSFE and it would start at 0. Could you please share the patch you used
> for reading?

I'm sorry I no longer have that code. It was a small hack thrown 
together quickly. Idea was to read the register from the interrupt 
handler and printk() it. Not the best of methods but at the time it 
confirmed my theory of how it should work. It might be that I have drawn 
some premature conclusions.

> As Steve Longerbeam mentioned in [2], this would be a CSI spec 
>violation, which he has cited in the commit message of his RFC 
>patch[3]. It's important to mention that the violation would be on the 
>side of the adv748x chip (adv7482 on my Salvator-X board), because it 
>creates the Frame Start packets. And according to the description of 
>the FRAMENUMBER_INTERLACED bit in [4] (page 193), adv7481 should always 
>send the
> "1,2,1,2..." CSI frame number sequence (I could  not find a generic document
> valid for all adv748x but I doubt that it would be  different there.).
> So starting with CSI frame number 0 would even violate specification in it's 
> own data sheet. Another possibility could also be a silicon bug in rcar CSI interface,
> which would decrement the WC value by one. 

A more likely cause is that my way of testing was flawed ;-)

I will add this to my growing pile of things to look into. I don't know 
when I will find the time. If you got time and figure out a method to 
verify the settings in rcar-csi2 together with a good video source 
please post patches ;-) It would be great if this could be figured out 
together with the VnMC.FOC issue mentioned above. If you should happen 
to work on it you might be interested in the patches recently merged in 
the media-tree which adds the interrupt handler to rcar-csi2 making 
inspection hacks easier to add on top.

One idea I have is to use a programmable video source and "display" 
frames for capture where one can distinguish top/bottom (different 
colors for each line for example) fields on the capture side and somehow 
automate regression testing. I have had this plan for some years now and 
I still use a old video game system as my test rig so don't hold your 
breath ;-)

> 
> 
> [1] https://patchwork.kernel.org/patch/10904263/#22594157
> [2] https://patchwork.kernel.org/patch/10904263/#22594563
> [3] https://patchwork.kernel.org/patch/10904263
> [4] https://www.analog.com/media/en/technical-documentation/user-guides/ADV7481_UG-747.pdf
> 
> Regards,
> Michael

-- 
Regards,
Niklas Söderlund
