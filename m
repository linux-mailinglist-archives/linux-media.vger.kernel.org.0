Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6A41405A0
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 09:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgAQItZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 03:49:25 -0500
Received: from retiisi.org.uk ([95.216.213.190]:60856 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729121AbgAQItZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 03:49:25 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 46630634C8A;
        Fri, 17 Jan 2020 10:49:15 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1isNJc-0000QH-1R; Fri, 17 Jan 2020 10:49:16 +0200
Date:   Fri, 17 Jan 2020 10:49:16 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>, mchehab@kernel.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Peter Griffin <peter.griffin@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for Sony IMX219 sensor
Message-ID: <20200117084915.GG793@valkosipuli.retiisi.org.uk>
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-3-andrey.konovalov@linaro.org>
 <20191227145547.GE861@valkosipuli.retiisi.org.uk>
 <d3f1591b-1a98-e876-b977-96e1210e9c49@linaro.org>
 <CAPY8ntCwh6KXpx-tMhjVwF97hqayLRKVC8BC6DCZ0hqvkU-boA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntCwh6KXpx-tMhjVwF97hqayLRKVC8BC6DCZ0hqvkU-boA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Jan 14, 2020 at 11:34:46AM +0000, Dave Stevenson wrote:

...

> > >> +    msleep(IMX219_XCLR_DELAY_MS);
> > >
> > > I guess 10 ms is ok albeit it'd be nicer if you calculated the required
> > > delay instead.
> >
> > I think this 10 ms delay actually serves two purposes here. It is
> > not only the delay after XCLR pin is set high (reset de-asserted),
> > but it also lets the camera power supplies voltages to settle after
> > regulator_bulk_enable() called few lines above.
> >
> > So I would make the delay a sum of 1) the value which depends on
> > input clock frequency (the driver currently supports 24MHz only)
> > and 2) a fixed value of 8 ms or so to account for the power supplies
> > settle time. So that the sum would be the same 10 ms for 24MHz input
> > clock.
> > Does it makes sense?
> 
> Regulator settling times shouldn't really be included here - that
> should be taken care of via the regulator framework (in the case of DT
> for regulator-fixed you define the startup-delay-us property).
> 
> What level do you end up computing it to?
> 
> This delay covers t4, t5 and t6 from figure 38 on page 77 of the datasheet[1]
> t4 is max 200usecs.
> t5 is 6ms.
> t6 is 32000 cycles of INCK. As you say INCK=24MHz is the only
> supported clock frequency at present, so 1.3ms. Minimum clock is 6MHz
> which will make this 5.3ms.

It's nicer to calculate that still. Someone may well add support for other
frequencies and it's easy to miss changing this.

> 
> t6 is in parallel with t5, but it is smaller than t5 even at the
> minimum clock frequency.
> Yes we can be programming the sensor over I2C after t5 but before t6,
> but you'd now want to be computing the number of I2C writes required,
> the speed of the I2C bus, and probably a few other parameters to
> ensure you don't violate t5. The sensor supports 1MHz CCI if INCK is
> >11.4MHz. A quick check says we have around 60 register writes to
> initialise the sensor. 38 clocks (4 * (8 data bits + ACK) + start +
> end) to write each register, which I make 2.4ms. It is therefore
> possible to violate t5.
> 
> Is it worth that level of computation, or do you just take t4+t5 at 6.2ms?

I'd just ignore the I²C part and wait for long enough. This is not *that*
much time after all. Of course, if someone feels like optimising this, why
not, but it looks like something that doesn't really pay off.

> 
> I have been a bit naughty up until now in not setting startup-delay-us
> on the regulator definition and relying on this delay instead. The
> driver ought to do the right thing though and I'll fix my
> configuration.

Agreed.

-- 
Sakari Ailus
