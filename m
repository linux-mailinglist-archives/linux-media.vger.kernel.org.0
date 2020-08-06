Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7A523DFB9
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbgHFRwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:52:41 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2682 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728399AbgHFRwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:52:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c43000001>; Thu, 06 Aug 2020 10:50:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 10:52:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 10:52:37 -0700
Received: from [10.2.172.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 17:52:36 +0000
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
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
 <6ff57c38-9847-42b0-643b-0d167c13779f@gmail.com>
 <c6ef5e77-2b0a-1712-ca58-dbd8d232e1f1@nvidia.com>
Message-ID: <ed79b201-85ba-f725-c5fa-fcde0761bc3d@nvidia.com>
Date:   Thu, 6 Aug 2020 10:52:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c6ef5e77-2b0a-1712-ca58-dbd8d232e1f1@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596736256; bh=CS+W4xiYVifNlDvQtAoKvNJ1SxgXVP8asa+INgRDbKA=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=K6nhdIPU86mcumxZoU9u24TPt4lhoYatIyHCBBHXSuGOa21WFcwdL8nwnBkAeUxKD
         EW9RTS/+PXiKpJsVBqhs9gy/PEpqXddrFTSpoWE+Ebm9ep5EX86+khaLWRWzfKyrUW
         m1bg3xIVfYXMYGYdILfuS1R03yh2VtHN+AItP1Ddyxxx8+1saSZQuAvNUNJ/jc2PgN
         zSjC/0/czumePpKc1Zm4bZ4/yb1yzXQUlSP8RdbO7z7BCcr6Ed7dW5uaGpb5/5v8hZ
         Jnqg4obHOggVcX5xoFbniTd0I1Mwaf5st48dk3mEk9gITCBObnwkvBtBHo7/s22JBf
         wadD5eQywyG5g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/6/20 10:44 AM, Sowjanya Komatineni wrote:
>
> On 8/6/20 10:27 AM, Dmitry Osipenko wrote:
>> 06.08.2020 20:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 8/6/20 9:41 AM, Sowjanya Komatineni wrote:
>>>> On 8/6/20 9:10 AM, Dmitry Osipenko wrote:
>>>>> 06.08.2020 18:59, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> ...
>>>>>>>> Confirmed from HW designer, calibration FSM to finish takes worst
>>>>>>>> case
>>>>>>>> 72uS so by the time it gets to sensor stream it will be done its
>>>>>>>> sequence and will be waiting for DONE bit.
>>>>>>>>
>>>>>>>> So disabling MIPI CAL clock on sensor stream fails is safe.
>>>>>>> 72us is quite a lot of time, what will happen if LP-11 happens=20
>>>>>>> before
>>>>>>> FSM finished calibration?
>>>>>>>
>>>>>>> Maybe the finish_calibration() needs to split into two parts:
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0 1. wait for CAL_STATUS_ACTIVE before enabling se=
nsor
>>>>>>> =C2=A0=C2=A0=C2=A0 2. wait for CAL_STATUS_DONE after enabling senso=
r
>>>>>> I don't think we need to split for active and done. Active will=20
>>>>>> be 1 as
>>>>>> long as other pads are in calibration as well.
>>>>>>
>>>>>> We cant use active status check for specific pads under calibration.
>>>>>> This is common bit for all pads.
>>>>> Does hardware have a single FSM block shared by all pads or there=20
>>>>> is FSM
>>>>> per group of pads?
>>>> MIPI CAL status register has DONE bits for individual pads status and
>>>> single ACTIVE bit.
>>>>
>>>> ACTIVE bit set to 1 indicates auto calibration is active which is the
>>>> case even when other pads (other CSI pads from other ports streaming
>>>> in case of parallel stream) are under calibration. Also DSI is shared
>>>> as well.
>>>>
>>>> We do calibration for individual pads. So, we should not rely on
>>>> ACTIVE bit.
>>>>
>>>>
>>>> MIPI driver checks for condition ACTIVE =3D=3D 1 && DONE =3D=3D 1 from=
 the
>>>> beginning.
>>>>
>>>> But I think this also should be fixed as in case of parallel streams
>>>> calibration can happen in parallel waiting for ACTIVE to be cleared
>>>> makes all calibration callers to wait for longer than needed as ACTIVE
>>>> is common for all pads.
>>>>
>>>>>> Unfortunately HW don't have separate status indicating when=20
>>>>>> sequence is
>>>>>> done to indicate its waiting for LP11.
>>>>>>
>>>>>>
>>>>>> To avoid all this, will remove cancel_calibration() totally and use
>>>>>> same
>>>>>> finish calibration even in case of stream failure then.
>>>>>>
>>>>> What about to add 72us delay to the end of start_calibration() in=20
>>>>> order
>>>>> to ensure that FSM is finished before LP-11?
>>>> Why we should add 72uS in start_calibration() when can use same
>>>> finish_calibration() for both pass/fail cases?
>>>>
>>>> Only timing loose we see is in case of failure we still wait for 250ms
>>>> and as this is failing case I hope should be ok.
>>>>
>>> Also as we don't need cancel_calibration(), keeping tegra_mipi_wait()
>>> like earlier makes sense I believe as we are letting it finish going
>>> thru sequence.
>>>
>>> So I think below are fixes,
>>>
>>> 1. Existing MIPI driver, tegra_mipi_wait() to not use status ACTIVE bit
>>> to be 0 and use only DONE bit to be 1 for wait condition=C2=A0 as we ar=
e
>>> calibrating separately for individual pads and this ACTIVE bit is=20
>>> common
>>> for all pads where it will not be 0 in case of other parallel streams
>>> which may also be under calibration.
>> Yes, looks like it's a mistake of the current MIPI driver that it polls
>> the ACTIVE bit.
>>
>>> 2. No need for separate cancel_calibration. So, probably earlier names
>>> tegra_mipi_calibrate() and tegra_mipi_wait() hols good as we are=20
>>> waiting
>>> for calibration sequence to finish irrespective of fail/pass.
>> The new names reflect better what those functions actually do, IMO.
> ok Will keep same names.
>>
>> What about to make finish_calibration() to take an additional argument
>> which corresponds to the awaited HW bits? For example if it's CSIA, then
>> it could be:
>>
>> =C2=A0=C2=A0 tegra_mipi_finish_calibration(csi_chan->mipi, MIPI_CAL_CSIA=
);
> MIPI device is separate for each stream so waiting for only those=20
> corresponding DONE bits happen currently and no need to pass argument.
>>
>>
>> Also, is it okay that DSI and CSI could change MIPI_CAL_CTRL after DSI
>> or CSI already started calibration?
>>
>> Looking at the current start_calibration(), I think the mutex should be
>> kept locked and then finish_calibration() should unlock it.

Right mutex_unlock should happen at end of finish_calibration.

With keeping mutex locked in start, we dont have to check for active to=20
be 0 to issue start as mutex will keep it locked and other pads=20
calibration can only go thru when current one is done.

So instead of below sequence, its simpler to do this way?

start_calibration()

- mutex_lock

- wait for 72uS after start

finish_calibration()

- keep check for ACTIVE =3D 0 and DONE =3D 1

- mutex_unlock()

>
> Confirmed with HW designer.
>
> ACTIVE is common bit for all pads where we see it 1 as long as all=20
> pads (DSI + all CSI Pads) are under calibration.
>
> While MIPI CAL is doing calibration for certain pads, before issuing=20
> other start it has to wait for ACTIVE to be 0.
>
>
> Earlier driver (before split) checks for ACTIVE to be 0 along with=20
> DONE bit to be 1 as it does both calibrate and wait in same API.
>
> With the split, looks like we need below sequence to be safe.
>
> 1. tegra_mipi_start_calibration(): wait for ACTIVE to be 0 before=20
> issuing START and after issuing start wait for 72uS to let calibration=20
> code sequence finish so it will be ready to see LP-11 after that.
>
> In case of parallel streams, call to start_calibration can happen when=20
> pads of other stream are under calibration.
>
> 2. tegra_mipi_finish_calibration(): check for DONE bit to be 1
>
>
>
