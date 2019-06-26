Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E53D157069
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 20:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfFZSQK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 14:16:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35099 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfFZSQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 14:16:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id c6so3058317wml.0
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2019 11:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+xm8omJjNN7PCk2pMNKkGxkebRmkM6KPwgFWHV3OHpE=;
        b=kTPj+t4WWywCSbv08OpDD3/yAQnFdJpqIxYpjs+GSl6ZNII3xs3pVkZs+0obPNgfPJ
         XUtb5kEn6ZgSD3XdyzTtcbQOFd5RZdooZXQeq0bBW1sFl8nPLrUtuL4eQvLcuWEYqdw7
         pD2vugCkzQgHjHbEUfZiCWmbSHD1xfkl1ogGVOiLHsbOVrSBIJ0E21oFp3ayL1s2Sfn/
         BC9wx7lJsbfD2HQzyw7HD65QZFH4M+Mk34mye8+hy/sqOF2YRaMr/f1e18WxSZR9+ioA
         n7gc+kHxEnuETacUOsorXqG8IVOQ0/kGw/2kVg21DGN86G+rZtuwdoHAzVOUVi+51xBG
         /eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+xm8omJjNN7PCk2pMNKkGxkebRmkM6KPwgFWHV3OHpE=;
        b=eipS7GX+Ji8xwd4gviPMWHeV/RXUzbg6jwX15tGKYWLfIJq0JjF+354iwqJ3AsOBH4
         mu4uXaaAOsqcLKBPCVRPfFJ6rpmWndXRNvSzeVXY8JBXRgyW0MsGQwgsgjicTb7ljKO5
         83a58iz0HIHM2k5nF9eLblk8qgpCKlSl7gL7wEPuDx+Ff4WNuvb8SuVibkmZsNtZFJUI
         VGuPXA4RxsHNJ3zC9f1qIOWJejTDCj+L/6inRTBjg1o9bSSUoewrEWQK/sQ+k0dJ2MFK
         e0M27NlvitEYK42FTReOX+KYnAyL8zacbqxX+R+dZJ4HS/xWBEltd+BdI3EAoWkxVBzX
         LVVQ==
X-Gm-Message-State: APjAAAUIf5lTvzp+MYCwuPMk5zNXJp4U7lkNsqWNs/6X0Ioeud95+3oK
        8D6xkabSBQDh1zqPCOEk8AQ=
X-Google-Smtp-Source: APXvYqzwGRBJpbdEw+zK0RS7kHfAfANTue+F6iB2V6laZKMfsC4n8TkU/IpRw9qyTNKJzu/sPdmY3A==
X-Received: by 2002:a1c:cb4d:: with SMTP id b74mr223214wmg.43.1561572967170;
        Wed, 26 Jun 2019 11:16:07 -0700 (PDT)
Received: from [172.30.90.108] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id t1sm24562618wra.74.2019.06.26.11.16.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 11:16:06 -0700 (PDT)
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, kernel@collabora.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20190625203945.28081-1-ezequiel@collabora.com>
 <20190626080027.GA4776@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <39e3bea8-7150-33aa-74c1-75b1cf90a136@gmail.com>
Date:   Wed, 26 Jun 2019 11:16:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626080027.GA4776@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 6/26/19 1:00 AM, Laurent Pinchart wrote:
> Hi Ezequiel,
>
> Thank you for the patch.
>
> On Tue, Jun 25, 2019 at 05:39:45PM -0300, Ezequiel Garcia wrote:
>> Not all sensors will be able to guarantee a proper initial state.
>> This may be either because the driver is not properly written,
>> or (probably unlikely) because the hardware won't support it.
>>
>> While the right solution in the former case is to fix the sensor
>> driver, the real world not always allows right solutions, due to lack
>> of available documentation and support on these sensors.
>>
>> Let's relax this requirement, and allow the driver to support stream start,
>> even if the sensor initial sequence wasn't the expected.
>> A warning is still emitted, so users should be hinted that something is off.
> I'm not sure this is a very good idea. Failure to detect the LP-11 state
> may mean that the sensor is completely powered off, but it may also mean
> that it is already streaming data. I don't know how the CSI-2 receiver
> state machine will operate in the first case, but in the second case it
> will not be able to synchronise to the incoming stream, so it won't work
> anyway.

 From my experience, at least with the OV5640 and the DS90Ux940, it can 
be difficult to coax some CSI-2 transmitters into a quiescent LP-11 bus 
state after power on, and yet the CSI-2 receiver state machine, at least 
in the imx6, is able to move forward to stream on anyway. So I think it 
makes sense to at least relax the LP-11 requirement at stream on for the 
imx6 receiver driver, and print a warning. But on second thought I agree 
the active clock lane requirement before stream on needs to remain.

In the second case you point out above (sensor is already actively 
streaming at stream on), why do you think that the receiver will not be 
able to synchronize?


>
> I think you should instead fix the problem in the sensor driver, as you
> hinted. Relaxing the requirement here will only make it more confusing,
> it's a hack, and isn't portable across CSI-2 receivers. The same buggy
> sensor driver won't work with other CSI-2 receivers whose internal state
> machine require starting in the LP-11 state.

Agreed, if it's possible the sensor driver should be fixed to enter 
LP-11 at power on.

Steve

> Which sensor are you using ?
>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> ---
>>   drivers/staging/media/imx/imx6-mipi-csi2.c | 33 ++++++----------------
>>   1 file changed, 9 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
>> index f29e28df36ed..10342434e797 100644
>> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
>> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
>> @@ -243,7 +243,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
>>   }
>>   
>>   /* Waits for low-power LP-11 state on data and clock lanes. */
>> -static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>> +static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>>   {
>>   	u32 mask, reg;
>>   	int ret;
>> @@ -253,29 +253,21 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>>   
>>   	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>>   				 (reg & mask) == mask, 0, 500000);
>> -	if (ret) {
>> -		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
>> -		return ret;
>> -	}
>> -
>> -	return 0;
>> +	if (ret)
>> +		v4l2_warn(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
>>   }
>>   
>>   /* Wait for active clock on the clock lane. */
>> -static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
>> +static void csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
>>   {
>>   	u32 reg;
>>   	int ret;
>>   
>>   	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>>   				 (reg & PHY_RXCLKACTIVEHS), 0, 500000);
>> -	if (ret) {
>> -		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
>> -			 reg);
>> -		return ret;
>> -	}
>> -
>> -	return 0;
>> +	if (ret)
>> +		v4l2_warn(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
>> +			  reg);
>>   }
>>   
>>   /* Setup the i.MX CSI2IPU Gasket */
>> @@ -316,9 +308,7 @@ static int csi2_start(struct csi2_dev *csi2)
>>   	csi2_enable(csi2, true);
>>   
>>   	/* Step 5 */
>> -	ret = csi2_dphy_wait_stopstate(csi2);
>> -	if (ret)
>> -		goto err_assert_reset;
>> +	csi2_dphy_wait_stopstate(csi2);
>>   
>>   	/* Step 6 */
>>   	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
>> @@ -327,14 +317,9 @@ static int csi2_start(struct csi2_dev *csi2)
>>   		goto err_assert_reset;
>>   
>>   	/* Step 7 */
>> -	ret = csi2_dphy_wait_clock_lane(csi2);
>> -	if (ret)
>> -		goto err_stop_upstream;
>> -
>> +	csi2_dphy_wait_clock_lane(csi2);
>>   	return 0;
>>   
>> -err_stop_upstream:
>> -	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
>>   err_assert_reset:
>>   	csi2_enable(csi2, false);
>>   err_disable_clk:

