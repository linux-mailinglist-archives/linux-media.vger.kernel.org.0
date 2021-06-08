Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229F839EFFA
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 09:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhFHH4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 03:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhFHH4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 03:56:46 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F8FC061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 00:54:53 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id s70-20020a1ca9490000b02901a589651424so1102385wme.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 00:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F/7L4LjTeTH0Ua34h8n3ICV1Je6H5seJYc0cDfDKGLc=;
        b=CktvRc3ve8OnQbrgWNKi8Mhq3pBRncgVxgSCrowjIbpMDpBxLlOs1xpmixPrgTHFxP
         no5/JK82MWDAM9YerH4gd79B/HHQZxmvh2dPoQLP//1YNqJPEVZ/GUcUIoGdbB4kbj96
         z25+KnxLPrrVt8ki7uGJV9IvrOHvEdSDGf3mZcLgw9SLpVfxxfZiNjpIeWVUP1I9hhTL
         oxBQ9zHtqoeG97jPoaRyFWaO7gW5cl3JLYYtjCt0apiIZ7vIioHLCo3SbnIdeEtgkfSw
         iPLvYgXj1RpSaW2Zefx60fFB02b/pU00DMo7HjG1MFh+LRh8aRLEtQm3VnHlKIjeAKUb
         1aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F/7L4LjTeTH0Ua34h8n3ICV1Je6H5seJYc0cDfDKGLc=;
        b=k+Glh6vPKh9eXNkm0tn9WLUSEtQGK2JCpag05IkEkedE+blbtnCwefw0OGId9e7pT8
         x9vn7Kxaw+wpYpzapMbZvZ0IyVFmL9LoCWNNI0tHaoQPF9S/IGgi4UKPuIlOM813OHKu
         SFklLSsJMZutdzFla/hH4EYYeVYKS1u3Vop+dRTddEKNUDpA3B22sHic92BoCarYHkHv
         nwin85WgKcRQB4lhG/0SuKrddWrl+LZJAvSsKfn6gBJ35nPu4sCaRTLYZv1rR9HgMwDl
         oSi280f/jMf1fDeqBIlz7FUJCO2JnOZpBNKJ2mKAFOvbzpjZ3Zv31/d0xRqoaWqsMqBn
         V47g==
X-Gm-Message-State: AOAM533pHiHPWqQBdr6tb8KermgFvskU7+jqkwsTBSch2kuL9X3YMg3a
        YD3i/Y9ds+oXhRxfWKpA2W18IvKkhsM=
X-Google-Smtp-Source: ABdhPJywRKSyfcw8hi6be3PaZEzpWYdbId6Kkk3RHFYGOX1Zm7VVl3tdtUDKEs7r0P5ytciVk4XAXg==
X-Received: by 2002:a05:600c:2194:: with SMTP id e20mr2727293wme.138.1623138891919;
        Tue, 08 Jun 2021 00:54:51 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:1c07:9700:6acb:61b6:ae46:2431? ([2a00:23c4:1c07:9700:6acb:61b6:ae46:2431])
        by smtp.googlemail.com with ESMTPSA id j18sm18780727wrw.30.2021.06.08.00.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 00:54:51 -0700 (PDT)
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
 <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <768ccb5c-a02f-576a-29ab-57e3c6d46d26@gmail.com>
Date:   Tue, 8 Jun 2021 08:54:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 08/06/2021 08:09, Philipp Zabel wrote:
> Hi Fabio,
> 
> On Tue, 2021-06-08 at 00:13 -0300, Fabio Estevam wrote:
>> On Mon, May 17, 2021 at 8:48 PM Fabio Estevam <festevam@gmail.com> wrote:
>>
>>> Setting pipeline to PAUSED ...
>>> Pipeline is live and does not need PREROLL ...
>>> Pipeline is PREROLLED ...
>>> Setting pipeline to PLAYING ...
>>> New clock: GstSystemClock
>>> [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
>>> driver bug, expect capture failures.
>>> [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
>>> [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
>>> [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
>>> [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
>>> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
>>> to allocate required memory.
>>> Additional debug info:
>>> ../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
>>> Buffer pool activation failed
>>> Execution ended after 0:00:01.072478334
>>> Setting pipeline to NULL ...
>>> Freeing pipeline ...
>>>
>>> Not sure why I am getting LP-11 and clock lane timeouts though.
>>
>> I saw this post:
>> https://ez.analog.com/linux-software-drivers/f/q-a/535279/adv7282-m-dts-how-to-connect-adv-to-ipu1_csi0
>>
>> and Frieder's patch:
>> https://git.kontron-electronics.de/linux/linux/-/commit/0d90331a44d0f718b7327a94fc72612ddcb4ac0f.patch

Frieder's moved adv writes should maybe be inside if (enable) though, 
with the else write-to-clear as well. Maybe gst sends a stream off?

Regards,
Ian

>>
>> I applied Frieder's patch, but still getting the same errors below
>> upon launching Gstreamer.:
>>
>>   New clock: GstSystemClock
>>   [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
>>   driver bug, expect capture failures.
>>   [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
>>   [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
>>   [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
>>   [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
>>
>> Does anyone know what needs to be done to avoid the LP-11 timeout error?
> 
> The i.MX6 CSI-2 RX needs to see the LP-11 low power state on the lanes
> during streamon (before it calls the ADV7280-M s_stream(1)). That's
> where the LP-11 timeout error occurs.
> 
> According to the ADV7280(-M) datasheet, "after the ADV7280-M is
> programmed, the clock lanes exit low power mode and remain in high speed
> mode until the part is reset or powered down."
> So it appears the ADV7280-M has to be freshly powered on in s_power(1)
> for this to work. Is the ADV7280-M powerdown GPIO connected properly on
> your board? Moving the CSI-2 configuration from s_power to s_stream was
> exactly the right thing to do in my mind.
> 
> Just as a test, if you remove the CSI-2 register writes from either
> s_power and s_stream from the adv7180 driver completely, do you still
> run into the LP-11 timeout? If the CSI-2 TX never leaves the low power
> state, I would expect seeing the clock lane timeout instead
> 
> regards
> Philipp
> 
