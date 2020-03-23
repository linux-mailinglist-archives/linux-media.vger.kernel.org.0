Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1AE518F0FC
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 09:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbgCWIit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 04:38:49 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:60571 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWIit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 04:38:49 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MmUDf-1jh4eV2wqn-00iRtl for <linux-media@vger.kernel.org>; Mon, 23 Mar
 2020 09:38:46 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 8369E6503CA
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 08:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9cXK3LZ0Z5wv for <linux-media@vger.kernel.org>;
        Mon, 23 Mar 2020 09:38:46 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 193BC64C789
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 09:38:46 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:38:46 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id C3AA1804FB; Mon, 23 Mar 2020 09:36:10 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:36:10 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 05/11] media: adv748x: add support for HDMI audio
Message-ID: <20200323083610.GB4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Stephen Boyd <sboyd@kernel.org>,
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
        linux-renesas-soc@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
 <82828e89ccf4173de4e5e52dcecacc4d5168315c.1584720678.git.alexander.riesen@cetitec.com>
 <158475297119.125146.8177273856843293558@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <158475297119.125146.8177273856843293558@swboyd.mtv.corp.google.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:ntYbF9+fWn6qkG07HfXxVQ4z6ZVsetZimcBRig+Y1glm682/Rpv
 m8VIK2KyTw/s5sS5rYA7D+nUguSNb5R8SRjAwF6GV1F/aWBFxOWeulgZABsG5gs29sm372l
 qEZnO9mc2Z5JsxG731mzuuaC8E0cU6CtyASA5nThLENB2ywf1OSth5KXiHQIH6+Ck6BVK1J
 TDxMabjzUfv/zPXJw4cXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xWr/f4Ycojk=:zCPO29sHa80utNu88+Gzwn
 uXBjzJsjCgeNfhNGqrI+qQZSR4HXKHSxLSp5JMgLqvTUf8h+aW+YeEcGsn6sFKwWM6XUYLNJP
 fanpydofaku8kjS4RfHTNaBMoShB3pF9FjwyNJsOnVdI5dpF6P4lGzSrDc/Y7EbSJ4rRfEUrh
 md7LDXMOsfzICRF3eTayNnDe1nQYx795zhNHEqhKu+Oc71H1UE8mXTmReafW1ymi8XIEdTsrg
 dG63WUM6ZTqFAohCi+Dafdkro4NjrTrPuSwJ+pdac3FlizJUG3ryq26XtBeDRWMkHwIDDWcfk
 Stb4kAOFU7w9ff49rXgYImUf0fezI3q3r0IyT4jNZr8EdNmrlQ8itSgyaqJN49E7BUoQXhimI
 Mi5HytxOj/jcoM7QaDBlqhT4XX5sXgvY4MERnEd7i4e+7TzvWiLnriFaxAzntG3sUwC4ysmWG
 aqREp7F+WkCABwnFFLbqCmPQaq6jzGPH6z7lBQihMNKO8iHSyKqiP6oPvmVhNRyYj9ZF5o7am
 f3PKIV2VRitPpYa4kBuF2tkX8I/0hsx8/T0l7sLfTCXwwEX0m1yNH6ETzw51B1EIEpnKufj96
 3Yvwz7wGwXZkI/Z30fOJCwczN90zTXHL+1l6UotOJjEslm0DA+8YRP9Z4kqy53ahLPdJZ26ml
 FqucCV3kVvhMMtd8OKuaZeB2NsNh+giadC5Tjt2PObjiYCC1dWWXXgcTeAwVJkY3scRt4gWI2
 7UmrkSVecexEZQSDJLRZrugMHKddtOXUpusrxsfI/7N+59n4JPHn/Z6Uuj2mRA42ChzxPmWzm
 N1eyc4zN4RdWTBirFyVq8MO5TygB/XOKIiLVRDAzV9gCPbeweFPFMIWGLjXFIz46RMpFuMT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stephen Boyd, Sat, Mar 21, 2020 02:09:31 +0100:
> Quoting Alex Riesen (2020-03-20 09:12:00)
> > diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
> > new file mode 100644
> > index 000000000000..6fce7d000423
> > --- /dev/null
> > +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> > @@ -0,0 +1,265 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Driver for Analog Devices ADV748X HDMI receiver with AFE
> > + * The implementation of DAI.
> > + */
> > +
> > +#include "adv748x.h"
> > +
> > +#include <linux/clk.h>
> 
> Is this include used? Please try to make a clk provider or a clk
> consumer and not both unless necessary.

Yes, they're both used: I use clk_get_rate to get the frequency of the clock to validate
the master clock frequency configuration.

> > +int adv748x_dai_init(struct adv748x_dai *dai)
> > +{
> > +       int ret;
> > +       struct adv748x_state *state = adv748x_dai_to_state(dai);
> > +
> > +       dai->mclk_name = kasprintf(GFP_KERNEL, "%s.%s-i2s-mclk",
> > +                                  state->dev->driver->name,
> > +                                  dev_name(state->dev));
> > +       if (!dai->mclk_name) {
> > +               ret = -ENOMEM;
> > +               adv_err(state, "No memory for MCLK\n");
> > +               goto fail;
> > +       }
> > +       dai->mclk = clk_register_fixed_rate(state->dev,
> 
> Please register with clk_hw_register_fixed_rate() instead.

Ok, I see the clk_register_fixed_rate isn't even commented...
I shall change it to used clk_hw_register_fixed_rate.

But could you please point me at some documentation, example, or just add a
few words to explain the preference?

BTW, the clock which the driver attempts to provide can actually be switched
on and off (it output pad can be even tristated). As the device is connected
by I2C to the how, I seems to be unable to use the existing gated clock
implementation because of the mmio register it requires. Or am I wrong?

> > +                                           dai->mclk_name,
> > +                                           NULL /* parent_name */,
> > +                                           0 /* flags */,
> > +                                           12288000 /* rate */);
> 
> Not sure these comments are useful.

You're right. Removed.

> > +       dai->drv.name = ADV748X_DAI_NAME;
> > +       dai->drv.ops = &adv748x_dai_ops;
> > +       dai->drv.capture = (struct snd_soc_pcm_stream){
> 
> Can this be const?

It can. Fixed.

> Please drop extra newline at end of file.

Done.

Thanks a lot for the review and commentary!

Regards,
Alex
