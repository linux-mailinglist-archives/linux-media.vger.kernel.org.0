Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E75A1CBE
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 16:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfH2O3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 10:29:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38012 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfH2O3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 10:29:34 -0400
Received: by mail-lf1-f65.google.com with SMTP id c12so2703969lfh.5
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 07:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mal9ClYt8dBvHQ8L3EA8alTDbI7T20yBkOA4NztQEP8=;
        b=sanPo0xVcA2LyDhDFTGIIkJpHq6ykMhc7DdtpNtlWQ3n1IP+flfHdHFoFaOWJ/6Sb/
         fP5OOZ735jyI/kdCHyd5xVjiNRxXaNs6pL4cnUxPpGpzvaVDMQF0uQnHUWCGzMXDobmo
         8UJCVxCwsC6ry4ZBLljRnQxBuRlMzF7GJlzTasRy3TZsUTk0Hbdz9Z67toB3mhO3WBmR
         t5DwkdZ7hLVKLmB1csRzI5g17vq36P7ByONPwRbBGif5LJ/iQI8OJ6kQAFV6m+rdM9IH
         b+c6JPOIwa8EKW76Uy/NqMucptMiumK6R0QqwCnhUdKn2W6lsLILYN07o7NBeEkeOvFZ
         tThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mal9ClYt8dBvHQ8L3EA8alTDbI7T20yBkOA4NztQEP8=;
        b=ezowuSF/qBaWxOdoIGBi85cQxXqZSv8KqDA5T1vLyI6eLjb/U5L1RTU4qLt7oTtTAq
         rk304/dRlalTMoMbRlbLmn8IxQNyX1FfahY12kl9Lsreti9AUYEH4SykGIIdWg9DO7O5
         FVAth95UUScXogmcV6J7zE/7xaHWDWKW/GyH9md33kTWNuji1SRmLUoDsSaeF2KZpN3l
         6lmXelZq6V41rwVv/6vZTQ1h/VamA/iXs0xwXD9Eq7k1jzJhD/erKILqL4N+Z75wHQua
         YSqjJ0QobyLos/QiLeDTiCFJIH1APcgTEBui+Hhr6ayB7Lapt32rVz5M6PbuOsw1JDGK
         +KNQ==
X-Gm-Message-State: APjAAAU2M6P2DlMsJ/J/aykixYB1PmkjSHToeeDhWkvuxz0gzOnwWDWB
        jwTz79lfLm4vShKpzTsuy2LZuA==
X-Google-Smtp-Source: APXvYqzKWtExzSC9wUiGvIovCZqXxgwDYBNJZOXiqrNB1JPlCbD4e3Skoy3HZWGSyOGxQD50q010Xg==
X-Received: by 2002:ac2:4a69:: with SMTP id q9mr506269lfp.86.1567088972591;
        Thu, 29 Aug 2019 07:29:32 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id s5sm377762lji.104.2019.08.29.07.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:29:32 -0700 (PDT)
Date:   Thu, 29 Aug 2019 16:29:31 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Matthew Michilot <matthew.michilot@gmail.com>, lars@metafoo.de,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
Message-ID: <20190829142931.GZ28351@bigcity.dyn.berto.se>
References: <20190827215539.1286-1-mmichilot@gateworks.com>
 <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2019-08-29 13:43:49 +0200, Hans Verkuil wrote:
> Adding Niklas.
> 
> Niklas, can you take a look at this?

I'm happy to have a look at this. I'm currently moving so all my boards 
are in a box somewhere. I hope to have my lab up and running next week, 
so if this is not urgent I will look at it then.

> 
> Regards,
> 
> 	Hans
> 
> On 8/27/19 11:55 PM, Matthew Michilot wrote:
> > From: Matthew Michilot <matthew.michilot@gmail.com>
> > 
> > Captured video would be out of sync when using the adv7280 with
> > the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) had to
> > be configured properly to ensure BT.656-4 compatibility.
> > 
> > An error in the adv7280 reference manual suggested that EAV/SAV mode
> > was enabled by default, however upon inspecting register 0x31, it was
> > determined to be disabled by default.
> > 
> > Signed-off-by: Matthew Michilot <matthew.michilot@gmail.com>
> > Reviewed-by: Tim Harvey <tharvey@gateworks.com>
> > ---
> >  drivers/media/i2c/adv7180.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > index 99697baad2ea..27da424dce76 100644
> > --- a/drivers/media/i2c/adv7180.c
> > +++ b/drivers/media/i2c/adv7180.c
> > @@ -94,6 +94,7 @@
> >  #define ADV7180_REG_SHAP_FILTER_CTL_1	0x0017
> >  #define ADV7180_REG_CTRL_2		0x001d
> >  #define ADV7180_REG_VSYNC_FIELD_CTL_1	0x0031
> > +#define ADV7180_VSYNC_FIELD_CTL_1_NEWAV 0x12
> >  #define ADV7180_REG_MANUAL_WIN_CTL_1	0x003d
> >  #define ADV7180_REG_MANUAL_WIN_CTL_2	0x003e
> >  #define ADV7180_REG_MANUAL_WIN_CTL_3	0x003f
> > @@ -935,10 +936,20 @@ static int adv7182_init(struct adv7180_state *state)
> >  		adv7180_write(state, ADV7180_REG_EXTENDED_OUTPUT_CONTROL, 0x57);
> >  		adv7180_write(state, ADV7180_REG_CTRL_2, 0xc0);
> >  	} else {
> > -		if (state->chip_info->flags & ADV7180_FLAG_V2)
> > +		if (state->chip_info->flags & ADV7180_FLAG_V2) {
> > +			/* ITU-R BT.656-4 compatible */
> >  			adv7180_write(state,
> >  				      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
> > -				      0x17);
> > +				      ADV7180_EXTENDED_OUTPUT_CONTROL_NTSCDIS);
> > +			/* Manually set NEWAVMODE */
> > +			adv7180_write(state,
> > +				      ADV7180_REG_VSYNC_FIELD_CTL_1,
> > +				      ADV7180_VSYNC_FIELD_CTL_1_NEWAV);
> > +			/* Manually set V bit end position in NTSC mode */
> > +			adv7180_write(state,
> > +				      ADV7180_REG_NTSC_V_BIT_END,
> > +				      ADV7180_NTSC_V_BIT_END_MANUAL_NVEND);
> > +		}
> >  		else
> >  			adv7180_write(state,
> >  				      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
> > 
> 

-- 
Regards,
Niklas Söderlund
