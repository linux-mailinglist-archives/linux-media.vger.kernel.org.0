Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBF42097B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 16:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfEPOYY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 16 May 2019 10:24:24 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56171 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfEPOYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 10:24:24 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 8F4D83C00D1;
        Thu, 16 May 2019 16:24:20 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xQ_izkE3SYU0; Thu, 16 May 2019 16:24:14 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 063A83C00BF;
        Thu, 16 May 2019 16:24:14 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0439.000; Thu, 16 May 2019 16:24:13 +0200
From:   "Rodin, Michael (Ferchau; ADITG/ESM1)" <mrodin@de.adit-jv.com>
To:     "niklas.soderlund@ragnatech.se" <niklas.soderlund@ragnatech.se>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "michael@rodin.online" <michael@rodin.online>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: i2c: adv748x: initialize bit 7 of
 csi_tx_top_reg_1f
Thread-Topic: [PATCH] media: i2c: adv748x: initialize bit 7 of
 csi_tx_top_reg_1f
Thread-Index: AQHVB0VXB5oc3wwrP0W/4fjakuFQ46Zkad4AgAArlgCACR5OYA==
Date:   Thu, 16 May 2019 14:24:13 +0000
Message-ID: <AC35D0CFBC66A84AAA9DF4334B52828D136181C3@HI2EXCH01.adit-jv.com>
References: <1557502240-16274-1-git-send-email-mrodin@de.adit-jv.com>
 <26e001a0-298f-e23b-9e46-98e62a8399c2@ideasonboard.com>
 <20190510190124.GE28561@bigcity.dyn.berto.se>
In-Reply-To: <20190510190124.GE28561@bigcity.dyn.berto.se>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.112]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran and Niklas,

thank you for your responses!

> Hi Kieran and Michael,
>
> On 2019-05-10 17:25:24 +0100, Kieran Bingham wrote:
> <snip>
>
> >
> > Niklas, how does RCar-CSI determine the top/bottom sequence?
>
> That patch just got merged in the media tree a few days ago,
>
>     9f7983bdc4925ae2 ("media: rcar-csi2: Propagate the FLD signal for NTSC
> and PAL")
>
> >
> > Do we have field inversion currently? (or one which is perhaps swapped
> > somewhere along the pipeline in rcar-vin?)
> >
>
> I'm not sure which tree this patch is developed on but Steve Longerbeam
> posted a RFC which IMHO had the fields inverted, there was a discussion in
his
> thread [1] where I tried to get to the bottom of the issue. My conclusions
> there might be wrong due to the issues addressed in this patch.
>
> Michael: Did you have Steve's patch in your tree when testing this?
>
> 1. https://patchwork.kernel.org/patch/10904263/
>
> --
> Regards,
> Niklas Söderlund

I had another version of Steve's patch when testing, but the FLD_NUM
setting was still the opposite compared to 9f7983bdc4925ae2
("media: rcar-csi2: Propagate the FLD signal for NTSC and PAL").
I could send all patches from the private pull request which Steve Longerbeam
has created for ADIT if you want to better understand my test results,
but probably they can not be applied to the current mainline development tree.
The patch for adv748x I used for testing looks a bit different as well,
so it can be applied to the tree used by ADIT. But the functionality
is the same (I can provide the patch as well if it is required.).
There are also concerns regarding VnMC.FOC bit (I tested V4L2_FIELD_INTERLACED mode 
and in my tests I figured out, that this bit does not exactly do
what the Renesas Hardware Manual describes and should be always set to 0
regardless whether NTSC or PAL are used. But I had only Raspberry Pi as
NTSC test source and no additional NTSC camera for verification,
so the results may be not reliable.).


Niklas, in [1] you mentioned that you could read the WC counter (which is in
fact the frame number in case of frame start packets) in the interrupt
INT_FSFE and it would start at 0. Could you please share the patch you used
for reading? As Steve Longerbeam mentioned in [2], this would be a CSI spec 
violation, which he has cited in the commit message of his RFC patch[3]. It's important 
to mention that the violation would be on the side of the adv748x chip (adv7482 on my 
Salvator-X board), because it creates the Frame Start packets. And according to the description 
of the FRAMENUMBER_INTERLACED bit in [4] (page 193), adv7481 should always send the
"1,2,1,2..." CSI frame number sequence (I could  not find a generic document
valid for all adv748x but I doubt that it would be  different there.).
So starting with CSI frame number 0 would even violate specification in it's 
own data sheet. Another possibility could also be a silicon bug in rcar CSI interface,
which would decrement the WC value by one. 


[1] https://patchwork.kernel.org/patch/10904263/#22594157
[2] https://patchwork.kernel.org/patch/10904263/#22594563
[3] https://patchwork.kernel.org/patch/10904263
[4] https://www.analog.com/media/en/technical-documentation/user-guides/ADV7481_UG-747.pdf

Regards,
Michael
