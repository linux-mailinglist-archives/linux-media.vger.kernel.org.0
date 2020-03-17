Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B9C18846A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 13:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgCQMks (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 08:40:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52032 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgCQMks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 08:40:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02HCecCM011056;
        Tue, 17 Mar 2020 07:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584448838;
        bh=Y12vBHiSmtg4JMP4AYAFDNxXyed6YQeAsAbAO68GYZs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=w1edVx14OINA2poxnNSVgPdkMK9A+9r/sGZkDIUkBERafRBo8f0gAS4MlksHHiqLe
         r3v6Rz/2WUAyAeySTPfCxkU200DRHHlzNVkHlyDMovWlf6Xow/8y1ZEOFDtZMAjioJ
         hGkY6EcJb0PTperetTSmgEQ9tPKjP7s3aEHjDX80=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02HCec45010455
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Mar 2020 07:40:38 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 07:40:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 07:40:37 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HCeZXQ079307;
        Tue, 17 Mar 2020 07:40:35 -0500
Subject: Re: OV5640 CSI2 problemsg
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Benoit Parrot <bparrot@ti.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        <linux-media@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
References: <d0510b81-9ae1-9b6f-02c5-f4eb08e67bfa@ti.com>
 <20200317102214.kc2rh7s67ycl4req@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1496451e-b3ba-efbb-1836-6eb321993b11@ti.com>
Date:   Tue, 17 Mar 2020 14:40:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317102214.kc2rh7s67ycl4req@uno.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2020 12:22, Jacopo Mondi wrote:
> Hi Tomi,
>     welcome to the ov5640 bandwagon
> 
> This driver received lot of attention and reworking, but there are
> indeed several issues at the moment :(
> 
> On Fri, Mar 13, 2020 at 01:15:33PM +0200, Tomi Valkeinen wrote:
>> Hi all,
>>
>> I've been testing and debugging OV5640 with TI's DRA76 and AM65 platforms,
>> which have the CAL IP for MIPI CSI2 RX.
>>
>> The most clear problem is that 1280x720@30 doesn't work at all, but with all
>> resolutions I can see occasional PHY errors reported when starting the
>> streaming.
> 
> I've been testing a CSI-2 setup with 2 data lanes on an IMX6 platform,
> just for the record

Two lanes here too.

>> The OV5640 spec lists the video timings, but I haven't been able to figure
>> out what exactly they mean, as e.g. the vsync time doesn't seem to match the
>> other times according to my calculations.
>>
> 
> Are you referring to the ov5640_mode_info structures ?

Yes.

Looking at the git log, these values seem to have been there from the start. Initially in the raw 
register sequences, then moved from there to ov5640_mode_info. But the numbers have been the same.

I wonder where they came originally, and whether they have ever been correct.

Perhaps I'll cook up a patch where I'll update the values to what the sensor sheet suggests, and 
other people can try and see if the driver still works for them.

>> In any case, I was poking here and there, and noticed that if I use the htot
>> value from the spec (2844), instead of the current value (1896 for most
>> resolutions), 1280x720 works, and the PHY errors are gone.
>>
>> Testing more, I found out that the smaller the htot, the more unreliable the
>> RX becomes, and going down from 2844, somewhere around 2400 I start to see
>> errors.
>>
> 
> That's a good finding!
> 
> I recall I had issues as well with that mode, and fixed them by
> doubling the MIPI bus clock speed You might have noticed these lines
> in the CSI-2 clock tree calculation function ov5640_set_mipi_pclk()
> 
> 	/*
> 	 * 1280x720 is reported to use 'SUBSAMPLING' only,
> 	 * but according to the sensor manual it goes through the
> 	 * scaler before subsampling.
> 	 */
> 	if (mode->dn_mode == SCALING ||
> 	   (mode->id == OV5640_MODE_720P_1280_720))
> 		mipi_div = OV5640_MIPI_DIV_SCLK; // THIS is 1
> 	else
> 		mipi_div = OV5640_MIPI_DIV_PCLK; // THIS is 2: halve the MIPI clock speed
> 
> I had that mode working, but after a good year or so trying to decode
> the clock tree of the sensor with only partially satisfactory results,
> I can't tell if that was by accident or not :)

The comment says that the above is according to the sensor manual, but I couldn't find mention of 
that. Do you recall where you found that information?

>> I'm not that much familiar with CSI-2, and very little with OV5640. Does
>> anyone have a clue about what I'm observing here? Does 1280x720@30 work on
> 
> Hugues made a great effort by sampling the actual frequencies on the
> bus, and he found out the actual frequencies are off compared to my
> theoretical calculations. After that I've actually dropped the ball and
> moved on, but maybe throwing your htot findings in the mix could help?
> 
> Here you have the thread with more information and Hugues measurement
> results:
> https://patchwork.kernel.org/patch/11019673/
> 
>> other platforms with CSI2? Where do the current OV5640 video timings come
>> from?
>>
> 
> I suggest you have a look at
> dfbfb7aa832c ("media: ov5640: Compute the clock rate at runtime")
> 
> htot is used to calculate the desired pixel clock, so it could indeed
> be one of the reasons why the above clock tree calculations are off.
> 
> Hope it helps a bit.

Thanks! Seems that this is all a bit of a detective work =). I have no means to measure the CSI 
clock/data lanes, so debugging this is obviously rather frustrating.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
