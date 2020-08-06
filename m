Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7478223DE9B
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgHFR1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgHFR1U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:27:20 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D470CC061574;
        Thu,  6 Aug 2020 10:27:18 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i10so17919639ljn.2;
        Thu, 06 Aug 2020 10:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aV1obyLP1kSAuWoOSd1TJKMwTZ27aQ8wVfEpw+0wGBU=;
        b=a9WJfCrpB0mlGFNpjp3IMfO8eESkaYVXerUr07b3nryvHt7lbOBlM6Ty3pQW2Q544O
         uUTqXruVltYm4Xm/9+qUMi8tpCWA/dePs4LvfKbLdpYyscOAy70TzTqm+ezEu8bsb/BF
         c5I3sLn+QKgstFfFONCvce0M4QYvl8bofh0CsIl7Io8GCP0KMzaUk/uRXs6+tDT9ufm1
         7EviczQgNP7fD0T30hHs6/6YLgLWnhHPk9J+xAK4GJbNxyCeRHPgo9B7ln9sJlL/6r88
         F/Gf0r+jAUN9aunIRSR+SVbJQlWyHBbNynqgnOM3DI2RNT2KWf75FuJSEVdSoWs4MoAJ
         3H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aV1obyLP1kSAuWoOSd1TJKMwTZ27aQ8wVfEpw+0wGBU=;
        b=jWfmdvpRKtHfvME27eeiVVdgejwUCu1576N44sd6lUKCFGik305IGfzQOmiEWeNoYL
         fMI7Z65ftnBiu/VjLioupFI6eCakvQLKq/95hXTEhbfVlcmLQte3vq6Jn2D462w7JU7X
         KSH6NFFw83afqfgJ4rSifIIHMRFQTP1ngGJs2ACszrx5Q8A1/IB/mtiNT9bUsoHzOwXn
         qN2ImEY52KcpnY2qjSXzSLFclAk0WoanbPVCsTjyXc9awx4B9VKJwS7kB246dx20pTwn
         lvJOlRcq7IuuFdWlola2SH6I2NjKyb5s5bmV2oKTsCivKTr9tTcMkWLf07i4GtI4QC6V
         T97A==
X-Gm-Message-State: AOAM533QiENBK8PcbuB4vm2+zHRpuPSHkguBq7SmwZjRP8Zr7/cYwU1K
        jkol+OkNROXLyDRuBNCdCAGIQeN2
X-Google-Smtp-Source: ABdhPJwUrsHV/vYp5HAg8LZBKkEWEoGc94/DcNh333osFJkTDq+NVE9tPWlFcJqOShjfbHUUSP/66w==
X-Received: by 2002:a2e:b0d2:: with SMTP id g18mr4011627ljl.136.1596734836681;
        Thu, 06 Aug 2020 10:27:16 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id g4sm2974058lfh.13.2020.08.06.10.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 10:27:15 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
 <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
 <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
 <b5612e93-f1c4-4762-baa1-5d85eb1edbe1@gmail.com>
 <412f8c53-1aca-db31-99a1-a0ecb2081ca5@nvidia.com>
 <61275bd6-58e7-887f-aa7d-8e60895e7b2b@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6ff57c38-9847-42b0-643b-0d167c13779f@gmail.com>
Date:   Thu, 6 Aug 2020 20:27:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61275bd6-58e7-887f-aa7d-8e60895e7b2b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 20:12, Sowjanya Komatineni пишет:
> 
> On 8/6/20 9:41 AM, Sowjanya Komatineni wrote:
>>
>> On 8/6/20 9:10 AM, Dmitry Osipenko wrote:
>>> 06.08.2020 18:59, Sowjanya Komatineni пишет:
>>> ...
>>>>>> Confirmed from HW designer, calibration FSM to finish takes worst
>>>>>> case
>>>>>> 72uS so by the time it gets to sensor stream it will be done its
>>>>>> sequence and will be waiting for DONE bit.
>>>>>>
>>>>>> So disabling MIPI CAL clock on sensor stream fails is safe.
>>>>> 72us is quite a lot of time, what will happen if LP-11 happens before
>>>>> FSM finished calibration?
>>>>>
>>>>> Maybe the finish_calibration() needs to split into two parts:
>>>>>
>>>>>    1. wait for CAL_STATUS_ACTIVE before enabling sensor
>>>>>    2. wait for CAL_STATUS_DONE after enabling sensor
>>>> I don't think we need to split for active and done. Active will be 1 as
>>>> long as other pads are in calibration as well.
>>>>
>>>> We cant use active status check for specific pads under calibration.
>>>> This is common bit for all pads.
>>> Does hardware have a single FSM block shared by all pads or there is FSM
>>> per group of pads?
>>
>> MIPI CAL status register has DONE bits for individual pads status and
>> single ACTIVE bit.
>>
>> ACTIVE bit set to 1 indicates auto calibration is active which is the
>> case even when other pads (other CSI pads from other ports streaming
>> in case of parallel stream) are under calibration. Also DSI is shared
>> as well.
>>
>> We do calibration for individual pads. So, we should not rely on
>> ACTIVE bit.
>>
>>
>> MIPI driver checks for condition ACTIVE == 1 && DONE == 1 from the
>> beginning.
>>
>> But I think this also should be fixed as in case of parallel streams
>> calibration can happen in parallel waiting for ACTIVE to be cleared
>> makes all calibration callers to wait for longer than needed as ACTIVE
>> is common for all pads.
>>
>>>
>>>> Unfortunately HW don't have separate status indicating when sequence is
>>>> done to indicate its waiting for LP11.
>>>>
>>>>
>>>> To avoid all this, will remove cancel_calibration() totally and use
>>>> same
>>>> finish calibration even in case of stream failure then.
>>>>
>>> What about to add 72us delay to the end of start_calibration() in order
>>> to ensure that FSM is finished before LP-11?
>>
>> Why we should add 72uS in start_calibration() when can use same
>> finish_calibration() for both pass/fail cases?
>>
>> Only timing loose we see is in case of failure we still wait for 250ms
>> and as this is failing case I hope should be ok.
>>
> Also as we don't need cancel_calibration(), keeping tegra_mipi_wait()
> like earlier makes sense I believe as we are letting it finish going
> thru sequence.
> 
> So I think below are fixes,
> 
> 1. Existing MIPI driver, tegra_mipi_wait() to not use status ACTIVE bit
> to be 0 and use only DONE bit to be 1 for wait condition  as we are
> calibrating separately for individual pads and this ACTIVE bit is common
> for all pads where it will not be 0 in case of other parallel streams
> which may also be under calibration.

Yes, looks like it's a mistake of the current MIPI driver that it polls
the ACTIVE bit.

> 2. No need for separate cancel_calibration. So, probably earlier names
> tegra_mipi_calibrate() and tegra_mipi_wait() hols good as we are waiting
> for calibration sequence to finish irrespective of fail/pass.

The new names reflect better what those functions actually do, IMO.

What about to make finish_calibration() to take an additional argument
which corresponds to the awaited HW bits? For example if it's CSIA, then
it could be:

  tegra_mipi_finish_calibration(csi_chan->mipi, MIPI_CAL_CSIA);


Also, is it okay that DSI and CSI could change MIPI_CAL_CTRL after DSI
or CSI already started calibration?

Looking at the current start_calibration(), I think the mutex should be
kept locked and then finish_calibration() should unlock it.
