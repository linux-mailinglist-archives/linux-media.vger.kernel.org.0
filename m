Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 010691A1279
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 19:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgDGRNq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 13:13:46 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:58659 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGRNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 13:13:46 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvrVJ-1j3vGX0d0h-00svI5; Tue, 07 Apr 2020 19:13:30 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id E3F65650CCC;
        Tue,  7 Apr 2020 17:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XoMYvATrm5I4; Tue,  7 Apr 2020 19:13:28 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (unknown [10.8.5.64])
        by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 6424164BF80;
        Tue,  7 Apr 2020 19:13:28 +0200 (CEST)
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 00FF0804FB; Tue,  7 Apr 2020 19:13:27 +0200 (CEST)
Date:   Tue, 7 Apr 2020 19:13:27 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 4/9] media: adv748x: add definitions for audio output
 related registers
Message-ID: <20200407171327.GA4711@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <26573ecdb48aa816f802b9d8bbe5f74157248021.1585852001.git.alexander.riesen@cetitec.com>
 <a0ff0a59-bd6e-044b-5669-679126c23323@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0ff0a59-bd6e-044b-5669-679126c23323@ideasonboard.com>
X-Provags-ID: V03:K1:x8e6GJuRAsCIcDlsW8+8xeuzyp1305c8gI4J5I70LQ4c7qmbh4z
 3f9kxcALWiE+fJmGXVMak9XQGjXQuzNe28Olx68Qdfpdb4IwibhiSMpt5WCAy14dXhblNw4
 wEraso7CE9tfYHPNZ4Lq/vhYZ45WQTn7wkVVrEAld1tvz3mhcM0LjsU9JHn7txy1lPEKBX2
 admtGpamku3pkQqpdd1Qg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KZGOTbCwqEU=:xku12jUiQXcVq3Ks9N7AJ7
 spLYDrlJT5w/gXp87mtsUcUk/HeExpTsjw7CAva3p4ihJGghVHkCwENQGOFJc75Qifn8jjDHY
 y+RWZ8qgBDieqIpDKaSgYbDNKiSP247fT0j/uflLTIR+CpH6g7UApISjYKVhH2DP/tdcqh3T+
 wFIO5K+qT5qiobkOS8fiphPOFJexrivGm61KSwtctizjcmKeUWsi1/6FFJx/r1gAzDnEEdp8i
 qSqCwR7jOZexGcU6rAkHi8MVlhBBa3BSXrTTnKjemf2TV1S6kZmqPjIhHhvxUrVWVrItnkbf4
 CZYyVjzW0roBJAMWWY/3vT9UlFCS3O9n86Zxy/1yw4FPUNCqUDbkC1KtYws50RDgChy2UQIgR
 aYiHdv4YwXukuf2RdI/8y9XkG3EHdisid0e99SuuiLKzP2I7uDL+2Ed+DP5I/vcwDrcSs00/1
 vnm03Bu1BD8qxvm4Y1aabze4z1Rwns34U/rqIbiuQM6xgY5r3mScvOlxxV7UXp3OQnUOx/zH9
 nE2EUKp9RqkyGWqfo2CNiz375c7JwIbo8JBajeqP0x1Sh1bOVPSrIHVQxqv8+jq+UtccJnqoS
 UdDs9KUh/7E1moPEcDfUoHaCGzQqpOuV40fiTt6Wf0ZbRH0JYWllG7P06S8apZemOTDj+Mpaa
 ojav7brqzk6fSzCnDuOE3q37lu1a1t3ivolCVfmv8qxDqSd3h/ucBxikigB5YMZHDUl3CLN1N
 hLABRvs9T/wddjPX7f97Zt6gKj2SsRey9nYtxnxkHyqUTjMQqzOiNsBcX4iBXclyzxmK1v3fZ
 hH73XL6/fDq2vluQzqmI0LC463UMeGTkyFhQbMTquLrc3mkydh9YtsmjrgTs0DbZAwxdUbT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Kieran Bingham, Tue, Apr 07, 2020 18:21:00 +0200:
> On 02/04/2020 19:34, Alex Riesen wrote:
> > diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> > index 0a9d78c2870b..1a1ea70086c6 100644
> > --- a/drivers/media/i2c/adv748x/adv748x.h
> > +++ b/drivers/media/i2c/adv748x/adv748x.h
> > @@ -226,6 +226,11 @@ struct adv748x_state {
> >  
> >  #define ADV748X_IO_VID_STD		0x05
> >  
> > +#define ADV748X_IO_PAD_CONTROLS		0x0e
> > +#define ADV748X_IO_PAD_CONTROLS_TRI_AUD	BIT(5)
> > +#define ADV748X_IO_PAD_CONTROLS_PDN_AUD	BIT(1)
> > +#define ADV748X_IO_PAD_CONTROLS1	0x1d
> 
> What is CONTROLS1 (1d) referenced from here?

I wish I knew... I afraid this is a left-over from the early development
attempts. It is obviously a mask of some bits. I don't even use the _CONTROLS1
anymore.

Removed the #define.

> There's no 'field' matching for this register, and the 'bits' (0, 2, 3,
> 4) correspond to "pdn_spi, pdn_pix, '-', tri_spi"

> Perhaps we need to define those bit fields accordingly and reference
> them where they get used directly?
> 
> Perhaps calling bit 3 as:
>  #define ADV748X_IO_PAD_CONTROLS_BIT_3	BIT(3)
> 
> Or
>  #define ADV748X_IO_PAD_CONTROLS_RESVD	BIT(3)

I would prefer _BIT_3, if only to stay as opaque as the documentation.

> (Unless you have documentation that better describes it?)

Mine matches what you described above.

Do you mind if I describe the other bits of the register even though the
driver does not use them? Just for completeness sake (and while I still have
access to the documentation).

> > @@ -248,7 +253,21 @@ struct adv748x_state {
> >  #define ADV748X_IO_REG_FF		0xff
> >  #define ADV748X_IO_REG_FF_MAIN_RESET	0xff
> >  
> > +/* DPLL Map */
> > +#define ADV748X_DPLL_MCLK_FS		0xb5
> > +#define ADV748X_DPLL_MCLK_FS_N_MASK	GENMASK(2, 0)
> > +
> >  /* HDMI RX Map */
> > +#define ADV748X_HDMI_I2S		0x03	/* I2S mode and width */
> 
> Looks like a more appropriate name than the datasheets
> "hdmi_register_03h" :-D

It was derived from the map and prefix of its bit-fields: i2soutmode and
i2sbitwidth. I too felt the name hdmi_register_03h lacking of depth.

> > +#define ADV748X_HDMI_I2SBITWIDTH_MASK	GENMASK(4, 0)
> > +#define ADV748X_HDMI_I2SOUTMODE_SHIFT	5
> > +#define ADV748X_HDMI_I2SOUTMODE_MASK	\
> > +	GENMASK(6, ADV748X_HDMI_I2SOUTMODE_SHIFT)
> 
> I'd be very tempted to ignore the 80char limit here and put that on the
> line above ... or find a way to remove the 1 character...
> 
> In fact, given the entry there - how about just leaving this as:
> 
> #define ADV748X_HDMI_I2SOUTMODE_MASK	GENMASK(6, 5)

No problem. Reformatted with two spaces.

> > +#define ADV748X_I2SOUTMODE_I2S 0
> > +#define ADV748X_I2SOUTMODE_RIGHT_J 1
> > +#define ADV748X_I2SOUTMODE_LEFT_J 2
> > +#define ADV748X_I2SOUTMODE_SPDIF 3
> 
> Can we align these value in the column with the other values?

Alignment corrected.

> And as much as I hate long define names, it seems a bit odd that these
> suddenly lack the HDMI_ part of the define prefix...
> 
> Should we either remove the HDMI_ from
>  ADV748X_HDMI_I2SBITWIDTH_MASK
>  ADV748X_HDMI_I2SOUTMODE_SHIFT
>  ADV748X_HDMI_I2SOUTMODE_MASK
> 
> or add it to
>  ADV748X_I2SOUTMODE_I2S
>  ADV748X_I2SOUTMODE_RIGHT_J
>  ADV748X_I2SOUTMODE_LEFT_J
>  ADV748X_I2SOUTMODE_SPDIF

Well, I see no reason for them to stand out like this, so perhaps I better add
the prefix. I didn't add the prefix initially because they weren't names of
fields or registers, but names of values of a field (i2soutmode of that
hdmi_register_03h).
But I see there is a precedent for such already:
ADV748X_CP_{CON,SAT,BRI}_{MIN,DEF,MAX}, so prefix is okay.

> > @@ -260,6 +279,16 @@ struct adv748x_state {
> >  #define ADV748X_HDMI_F1H1		0x0b	/* field1 height_1 */
> >  #define ADV748X_HDMI_F1H1_INTERLACED	BIT(5)
> >  
> > +#define ADV748X_HDMI_MUTE_CTRL		0x1a
> > +#define ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO BIT(4)
> > +#define ADV748X_HDMI_MUTE_CTRL_WAIT_UNMUTE_MASK	GENMASK(3, 1)
> > +#define ADV748X_HDMI_MUTE_CTRL_NOT_AUTO_UNMUTE	BIT(0)
> > +
> > +#define ADV748X_HDMI_AUDIO_MUTE_SPEED	0x0f
> 
> Can we keep the register definitions in address order please?

Done.

> > +#define ADV748X_HDMI_AUDIO_MUTE_SPEED_MASK	GENMASK(4, 0)
> > +#define ADV748X_MAN_AUDIO_DL_BYPASS BIT(7)
> > +#define ADV748X_AUDIO_DELAY_LINE_BYPASS BIT(6)
> 
> Those bits do not describe the register they are in, not sure how to
> address that without exceptionally long names though.. :-(
> 
> So perhaps how you've got them might be the best option...

Yes, please. Besides, they aren't even obviously related to the audio mute
speed.

And I corrected the alignment.

> > +#define ADV748X_HDMI_REG_6D		0x6d	/* hdmi_reg_6d */
> > +#define ADV748X_I2S_TDM_MODE_ENABLE BIT(7)

Alignment corrected.

Regards,
Alex

