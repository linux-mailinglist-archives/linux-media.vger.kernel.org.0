Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D592A3ED4
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 09:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgKCIZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 03:25:13 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39398 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgKCIZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 03:25:13 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A38P6hV121830;
        Tue, 3 Nov 2020 02:25:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604391906;
        bh=xQ5/ORj12pu/eoFPBbHPJp8RyCIe3m2yqp36c2cD+rk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KAOsOyPZ1yCw6Yc16fgpGlx+lYvkR/rrWsxHVZWP2+0tD/YK9e0owfHF5t5h9ulfL
         n8S59hKALGNK+CMUHHJ73GBYZ2ZM18F26uRjfoOUB9D1Drec8JJG7NjZrVkKpcfYs5
         z/PJTKLJbfMTTW7to+1hG2LK42IhxWiMu+aFSx/Q=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A38P6up011644
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Nov 2020 02:25:06 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 02:24:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 02:24:40 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A38OdB6092604;
        Tue, 3 Nov 2020 02:24:39 -0600
Subject: Re: [RFC 0/3] media: ov5640: Adjust htot, rework clock tree, add
 LINK_FREQ
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Jacopo Mondi <jacopo+renesas@jmondi.org>, <hugues.fruchet@st.com>,
        <sam@elite-embedded.com>, <slongerbeam@gmail.com>,
        <linux-media@vger.kernel.org>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
 <1bc29f6f-20b1-245e-c346-9c57058b9a24@ti.com>
 <20201103081945.pihysjlqha2noz2m@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1123502e-f82f-182d-cf44-899fe54392f8@ti.com>
Date:   Tue, 3 Nov 2020 10:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103081945.pihysjlqha2noz2m@uno.localdomain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/11/2020 10:19, Jacopo Mondi wrote:
> Hi Tomi,
>     thanks for testing
> 
> On Tue, Nov 03, 2020 at 09:19:17AM +0200, Tomi Valkeinen wrote:
>> Hi Jacopo,
>>
>> On 29/10/2020 00:57, Jacopo Mondi wrote:
>>> Hi Hugues Tomi and Sam
>>>
>>>    this small series collects Tomi's patch on adjusting htot which has been
>>> floating around for some time with a rework of the clock tree based on
>>> Hugues' and Sam's work on setting pclk_period. It also address the need to
>>> suppport LINK_FREQUENCY control as pointed out by Hugues.
>>>
>>> I'm sort of happy with the result as I've removed quite some chrun and the clock
>>> tree calculation is more linear. All modes work except full-resolution which a
>>> bit annoys me, as I can't select it through s_fmt (to be honest I have not
>>> investigated that in detail, that's why an RFC).
>>>
>>> Framerate is better than before, but still off for some combinations:
>>> 640x480@30 gives me ~40 FPS, 1920x1080@15 gives me ~7.
>>> The other combinations I've tested looks good.
>>>
>>> Can I have your opinion on these changes and if they help you with your
>>> platforms?
>>>
>>> I've only been able to test YUYV, support for formats with != bpp will need
>>> some work most probably, but that was like this before (although iirc Hugues
>>> has captured JPEG, right ?)
>>>
>>> There's a bit more cleanup on top to be done (I've left TODOs around) and
>>> probably the HBLANK calculation should be checked to see if it works with the
>>> new htot values.
>>
>> Unfortunately the second patch seems to break capture on AM6 EVM + OV5640. The effect is pretty odd.
>> The picture is very dark, with odd vertical lines, but it's still capturing something as I can see a
>> correctly shaped shadow of my hand if I wave my hand over the sensor.
> 
> This saddens me quite a lot :( The current clock tree programming
> procedure is horrid and it has been bugging me for 2 years now :(
> 
> Is capture broken in all modes, or have you tested a single one ?

I tested 640x480, 720x480, 720x576.

I have only this sensor to test the CSI RX on AM6 EVM, so I would not be surprised if there are
issues in the CSI RX driver (too). But this is super frustrating to debug, as the sensor is a badly
documented black box, and I don't have means to probe the CSI lines...

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
