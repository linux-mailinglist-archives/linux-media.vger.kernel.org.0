Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4586B39F4D2
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 13:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhFHLWx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 07:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbhFHLWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 07:22:52 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663C6C061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 04:20:49 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso1596884wmj.2
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nK0NPl/cEBvh3ANh/azDxs6td9GYF9OB8UaoZWE0NYc=;
        b=fOFotI7iEYTN1QxW3S5swvDnQGmJHEqUNOPnH7lCIJPDars7vwApcMplI6Qiv+Z3XK
         XaS0m733oJSNW0qAP1+KlBM459NZIUi61noUcF0fbkyEWAJ7fUR6LNkVE0Tiy6R6zjND
         3w2lP33hkBeZFTGw6WO30G8XCBc6zgbUjrY71qegBzjBDjtBLqjFH2cTWNeThrinofz7
         vqrIi3GoIg21HskVdF7Hby0ovOxukWQen8d9zsSfPSnQ5rMjWH8qRI8rUBh6YhHUBNLc
         mnbxkLJxAmRvZb4w1zyKow05XoGmsbX6riZAwKaTDD6KYdsDXiXqeqzaD3lPao8F7RlG
         v7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nK0NPl/cEBvh3ANh/azDxs6td9GYF9OB8UaoZWE0NYc=;
        b=Oc4CDGTUfSZL+wrWyWBhuSzzfy0yGtTdZ9wid19/EMSmQTcFbw6Lc/Y1bkO9QrlSlJ
         aLVNsqPyutr5194DOzvXdSzHdpkNJZe/6Cs25vAPyeArlEtM3GmFeKWpPsvtN7zFRYnM
         lcd1/D9Z8RDflf27Cv68Vo+rTGl8DR4tRRqcUXiQW7G+7L6mKaeJyzhw49zQtbNZ4l4i
         w5Ng+oILh6crra7knwcVoO4VuMpJ3E6GXW/la8m3lbBUCLvLzTfkYA9bu6as/C79VRTA
         Z0EOjkefdWPfcjFJk6TfxJ5nBx7I58vcUmVee3prAXfwuInfRyid82znLC7kLO00+5UH
         qPkg==
X-Gm-Message-State: AOAM531nrT+hqOv9EESw1R86k5MLUwoYECYDnXAIb34lEnOM7ztytm7y
        5xWDXTWvFtAA98iIqzACQ2A=
X-Google-Smtp-Source: ABdhPJwdHA3RDzC1vMVuGjRF+2a3+S7HF8AN+pqxyBNUO3cqPf3d+1JcKQYhtxkvjyNpKZ0R2YLpPg==
X-Received: by 2002:a05:600c:19d3:: with SMTP id u19mr21456024wmq.100.1623151248019;
        Tue, 08 Jun 2021 04:20:48 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:1c07:9700:6acb:61b6:ae46:2431? ([2a00:23c4:1c07:9700:6acb:61b6:ae46:2431])
        by smtp.googlemail.com with ESMTPSA id l9sm17047241wme.21.2021.06.08.04.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 04:20:47 -0700 (PDT)
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Frieder Schrempf <frieder.schrempf@kontron.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
 <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
 <768ccb5c-a02f-576a-29ab-57e3c6d46d26@gmail.com>
 <dfc1ab86-ac5a-4b4e-4cb6-6b99679aaf1e@kontron.de>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <8559c202-6b34-b62a-16c2-de1d355b5437@gmail.com>
Date:   Tue, 8 Jun 2021 12:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dfc1ab86-ac5a-4b4e-4cb6-6b99679aaf1e@kontron.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/06/2021 11:55, Frieder Schrempf wrote:
> On 08.06.21 09:54, Ian Arkver wrote:
>> Hi,
>>
>> On 08/06/2021 08:09, Philipp Zabel wrote:
>>> Hi Fabio,
>>>
>>> On Tue, 2021-06-08 at 00:13 -0300, Fabio Estevam wrote:
>>>> On Mon, May 17, 2021 at 8:48 PM Fabio Estevam <festevam@gmail.com> wrote:
>>>>
>>>>> Setting pipeline to PAUSED ...
>>>>> Pipeline is live and does not need PREROLL ...
>>>>> Pipeline is PREROLLED ...
>>>>> Setting pipeline to PLAYING ...
>>>>> New clock: GstSystemClock
>>>>> [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
>>>>> driver bug, expect capture failures.
>>>>> [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
>>>>> [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
>>>>> [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
>>>>> [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
>>>>> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
>>>>> to allocate required memory.
>>>>> Additional debug info:
>>>>> ../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
>>>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
>>>>> Buffer pool activation failed
>>>>> Execution ended after 0:00:01.072478334
>>>>> Setting pipeline to NULL ...
>>>>> Freeing pipeline ...
>>>>>
>>>>> Not sure why I am getting LP-11 and clock lane timeouts though.
>>>>
>>>> I saw this post:
>>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fez.analog.com%2Flinux-software-drivers%2Ff%2Fq-a%2F535279%2Fadv7282-m-dts-how-to-connect-adv-to-ipu1_csi0&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7C81057e8e187d4f2bf61908d92a52b30a%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637587357508272332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=tb3C%2FU20jo5tp58olvCo%2BRWREFNZEJaZop1hHGMksBE%3D&amp;reserved=0
>>>>
>>>> and Frieder's patch:
>>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kontron-electronics.de%2Flinux%2Flinux%2F-%2Fcommit%2F0d90331a44d0f718b7327a94fc72612ddcb4ac0f.patch&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7C81057e8e187d4f2bf61908d92a52b30a%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637587357508272332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=hsuRqyEYAh1PtGiwZRKcmENkVbJuRN85DBmuXHOZhBs%3D&amp;reserved=0
>>
>> Frieder's moved adv writes should maybe be inside if (enable) though, with the else write-to-clear as well. Maybe gst sends a stream off?
> 
> There's an "if(!enable)" before that and it has "return 0". So it should be fine without "if(enable)".

Doh, so there is. I really should read the whole patch before posting. 
Sorry.

> 
>>
>>>>
>>>> I applied Frieder's patch, but still getting the same errors below
>>>> upon launching Gstreamer.:
>>>>
>>>>    New clock: GstSystemClock
>>>>    [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
>>>>    driver bug, expect capture failures.
>>>>    [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
>>>>    [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
>>>>    [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
>>>>    [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
>>>>
>>>> Does anyone know what needs to be done to avoid the LP-11 timeout error?
>>>
>>> The i.MX6 CSI-2 RX needs to see the LP-11 low power state on the lanes
>>> during streamon (before it calls the ADV7280-M s_stream(1)). That's
>>> where the LP-11 timeout error occurs.
>>>
>>> According to the ADV7280(-M) datasheet, "after the ADV7280-M is
>>> programmed, the clock lanes exit low power mode and remain in high speed
>>> mode until the part is reset or powered down."
>>> So it appears the ADV7280-M has to be freshly powered on in s_power(1)
>>> for this to work. Is the ADV7280-M powerdown GPIO connected properly on
>>> your board? Moving the CSI-2 configuration from s_power to s_stream was
>>> exactly the right thing to do in my mind.
>>>
>>> Just as a test, if you remove the CSI-2 register writes from either
>>> s_power and s_stream from the adv7180 driver completely, do you still
>>> run into the LP-11 timeout? If the CSI-2 TX never leaves the low power
>>> state, I would expect seeing the clock lane timeout instead
>>>
>>> regards
>>> Philipp
>>>
