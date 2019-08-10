Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C6C88CE1
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 21:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfHJT1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Aug 2019 15:27:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46424 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfHJT1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Aug 2019 15:27:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id c3so24626099pfa.13
        for <linux-media@vger.kernel.org>; Sat, 10 Aug 2019 12:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=U74Jp5m0Pj5rP5BQOP1YZZo6Jy6baUXmz3c16bfTitQ=;
        b=EeN6Am7NLQ4rcHtDqEY03hp8aDlTwTSESx+LAmzcDXK/WyGFpAOH6TGfS0dVauFMwN
         hWT0P0XKgOVBclMcwdU/gfF/afCvX2CTNJRJRYQvr7OKks0YwyKJfEHq4JXTOiRtWYII
         yOojY3ItIxhHA39XBpRebRihb2dqtUg3D9s2HgvaaUTV96DxW/o3hDpCnq4+uQRvZdIR
         IlfOUEdPJFjTxYN/Z5o1m/mvt3yxmP8WtM1OVwR/h8ErNBQJn7x9TjjW/SD0g7VYBGN9
         JT20klrHJosFthVmMxmGSUdbu30ZGsWJJvZMVxhENKUpwjCzSCnFwsrrNDDObjOeI+ZU
         P7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=U74Jp5m0Pj5rP5BQOP1YZZo6Jy6baUXmz3c16bfTitQ=;
        b=VNB5/2yx8QGYFbYo54WpEXRfWbAqt/aJXdB6Zaj1Yaei/bLnUre3MPBSzMjVoXAj+C
         PRTE8qR9fPYKZbQ1hPXCrtcaKg5+jrUVQEXdZ70CpYcSsPChz13cTfUY+DkO/KY5xWef
         qtqetqTIYNq4onpyRt9P3Ds/gIbu8bHHhVeZ9uYa0LEhvmFw5hZ1fWyw6LeWohN3wy0g
         /6zfsWlQRx9ifo/uO2M6OA+m9ppLzV0OgIqQ6bTG4OWY6jbxNgVHsJ4R3INzoGrnedP6
         gVFcBHKzGi2CZCIehQ8I0Hv9kw19nptkSoqouMwMqndyIZDbD//SXPuhs/90p3/RCO4F
         ojNw==
X-Gm-Message-State: APjAAAW8Fn0552G5xNetCRIpiQS99X0Td41vDO3LpkMyAiEuW0NCzGd/
        JdWYPphSB+YlD5yezxh55P8=
X-Google-Smtp-Source: APXvYqyOTKmymWQ7Nc7MzJNh38AePEBa/V4l40EedVnEsOK1PQh6KVY8XQz7CqsZ5BLh32wI4vc2yA==
X-Received: by 2002:a62:ae01:: with SMTP id q1mr27636559pff.219.1565465261459;
        Sat, 10 Aug 2019 12:27:41 -0700 (PDT)
Received: from [192.168.1.59] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id a5sm44557pjs.31.2019.08.10.12.27.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2019 12:27:40 -0700 (PDT)
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org, mchehab@kernel.org
References: <20190627222912.25485-1-festevam@gmail.com>
 <1561963729.3753.5.camel@pengutronix.de>
 <8b859fd7758c3f95b45b5b70909be0d2ae2e4f34.camel@collabora.com>
 <20190807120626.GE822@valkosipuli.retiisi.org.uk>
 <73d82df753e0579bd122dfaf9fa12ba8cad95d88.camel@collabora.com>
 <20190808082605.GA917@valkosipuli.retiisi.org.uk>
 <1565254405.3656.1.camel@pengutronix.de>
 <e4b84958-28c7-1141-e34f-e1e3ad5b35db@gmail.com>
Message-ID: <7ab6280c-9d23-d2d0-bd11-ff5f53785356@gmail.com>
Date:   Sat, 10 Aug 2019 12:27:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e4b84958-28c7-1141-e34f-e1e3ad5b35db@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/8/19 11:02 AM, Steve Longerbeam wrote:
>
>
> On 8/8/19 1:53 AM, Philipp Zabel wrote:
>> Hi Sakari,
>>
>> On Thu, 2019-08-08 at 11:26 +0300, Sakari Ailus wrote:
>> [...]
>>>>> Have you checked how it works if you simply leave out this test?
>> Whether this works or not depends on the sensor used, and for some
>> sensor/drivers may depend on timing (or random factors influencing it).
>> See below.
>>
>> [...]
>>> Some devices can be commanded to enter LP-11 state but some will just
>>> briefly visit that state. The LP-11 state is mandatory but software 
>>> should
>>> not be involved in detecting it if at all possible.
>> This is a good point. Devices that can be set to LP-11 state
>> immediately, but that don't stay there long enough (either because they
>> wait for less than the required by spec 100µs, or because system load
>> causes this check to be executed too late) may end up working reliably
>> even though the warning fires.
>
>>> So if the hardware does not require further initialisation to be 
>>> done in
>>> LP-11 state, you should remove the check.
>>>
>>>> We had to fix at least OV5645 and OV5640 recently because of this,
>>>> and I can imagine more drivers will have the same issue.
>>> This is actually an issue in the IMX driver (or hardware), not in the
>>> sensor driver. It may be that sometimes it's easier to work around 
>>> it in
>>> the sensor driver.
>>>
>>> So, I'd like to know whether the check itself is a driver bug, or 
>>> something
>>> that the hardware requires. The fact that you're sending this patch
>>> suggests the former.
>> This is something that the hardware requires, according to the reference
>> manual. See the comment in drivers/staging/media/imx/imx6-mipi-csi2.c,
>> especially step 5.:
>>
>> /*
>>   * The required sequence of MIPI CSI-2 startup as specified in the 
>> i.MX6
>>   * reference manual is as follows:
>>   *
>>   * 1. Deassert presetn signal (global reset).
>>   *        It's not clear what this "global reset" signal is (maybe APB
>>   *        global reset), but in any case this step would be probably
>>   *        be carried out during driver load in csi2_probe().
>>   *
>>   * 2. Configure MIPI Camera Sensor to put all Tx lanes in LP-11 state.
>>   *        This must be carried out by the MIPI sensor's s_power(ON) 
>> subdev
>>   *        op.
>>   *
>>   * 3. D-PHY initialization.
>>   * 4. CSI2 Controller programming (Set N_LANES, deassert PHY_SHUTDOWNZ,
>>   *    deassert PHY_RSTZ, deassert CSI2_RESETN).
>>   * 5. Read the PHY status register (PHY_STATE) to confirm that all 
>> data and
>>   *    clock lanes of the D-PHY are in LP-11 state.
>>   * 6. Configure the MIPI Camera Sensor to start transmitting a clock 
>> on the
>>   *    D-PHY clock lane.
>>   * 7. CSI2 Controller programming - Read the PHY status register 
>> (PHY_STATE)
>>   *    to confirm that the D-PHY is receiving a clock on the D-PHY 
>> clock lane.
>>   */
>>
>> I read this as the hardware needing to see the LP-11 -> HS transition
>> after the DPHY reset has been released, and before the CSI2 RX
>> controller is programmed.
>
> I think that's a fair assumption, and there's another paragraph at the 
> end of that comment above that adds more evidence to that:
>
> ...
> * All steps 3 through 7 are carried out by csi2_s_stream(ON) here. Step
> * 6 is accomplished by calling the source subdev's s_stream(ON) between
> * steps 5 and 7.
> */
>
>
> So the driver is expecting that the LP-11 state persists until step 6, 
> at which the LP-11 -> HS transition occurs when streaming is started 
> at the transmitter.
>
> But if the transmitter only stays in LP-11 state for the minimum 100 
> usec after it is powered on, and then _automatically_ transitions to 
> HS, it's quite possible the LP-11 -> HS transition will happen long 
> before the DPHY is taken out of reset. That's because the 
> transmitter's s_power(ON) is called when the capture device is opened 
> (via v4l2_pipeline_pm_use()), but the steps above are carried out when 
> streaming starts, so userland would have to issue VIDIOC_STREAMON well 
> within the 100 usec expires after open()'ing the device, for the 
> receiver hardware to see the transition.
>
> Perhaps that would be an argument for moving steps 1 - 5 into the 
> driver's s_power(ON) call, which would first call s_power(ON) to the 
> transmitter and then immediately go through steps 1 - 5. Steps 6,7 
> would then remain in s_stream(ON).

Well, after more testing on the i.MX6q SabreSD with the MIPI CSI-2 
OV5640, this looks like an advisable thing to do. I will submit a patch.

Steve

