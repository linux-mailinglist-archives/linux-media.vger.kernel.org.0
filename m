Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8924823CFB4
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 21:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgHETYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 15:24:14 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7887 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbgHER30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 13:29:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2aec0a0000>; Wed, 05 Aug 2020 10:27:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 10:29:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 10:29:17 -0700
Received: from [10.2.172.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 17:29:16 +0000
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
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
Message-ID: <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
Date:   Wed, 5 Aug 2020 10:29:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596648458; bh=QAIj5bzl4Avs4KvoHHn+vuoiKrqAhIr+EfycWcA2t5U=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WDpeP0DHVknDbGWKsv2XzEZeWmOcDilmKFZVmOArKnDx6jf0fr++xlgtswsaF2oVd
         d1bDJSH3Ynzu2F7s15tvS466YO8g2IglD+LcyAGZ1wORw2Qq/M/NDFhQuQnRL67FVa
         pIY6KJrQoaMbIsD5Wnci4+iHwJ9t5jgx4u1iOrkORh19JbtI2CeOvzBPd/SL8JZV2q
         IoO7cdG8ymSPHyx/3ChVTcC6mBufG+kOHDa9EQxvw5jy4QoWxpacUp3wrL1e+mNwK1
         BJBfY6hSh9gNTCzXoB8kYOtb558gAQbqY7KFoP4ja1WDIe3KVq+BpjVOeHlQesnoCi
         gxNWIohO3/OgA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/5/20 10:04 AM, Sowjanya Komatineni wrote:
>
> On 8/5/20 9:57 AM, Dmitry Osipenko wrote:
>> 05.08.2020 19:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 8/5/20 9:47 AM, Dmitry Osipenko wrote:
>>>> 05.08.2020 19:33, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 8/5/20 7:19 AM, Dmitry Osipenko wrote:
>>>>>> 05.08.2020 17:05, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> 05.08.2020 16:46, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>> On Mon, Aug 03, 2020 at 08:42:24AM -0700, Sowjanya Komatineni=20
>>>>>>>> wrote:
>>>>>>>>> With the split of MIPI calibration into tegra_mipi_calibrate()=20
>>>>>>>>> and
>>>>>>>>> tegra_mipi_wait(), MIPI clock is not kept enabled till the
>>>>>>>>> calibration
>>>>>>>>> is done.
>>>>>>>>>
>>>>>>>>> So, this patch skips disabling MIPI clock after triggering=20
>>>>>>>>> start of
>>>>>>>>> calibration and disables it only after waiting for done status=20
>>>>>>>>> from
>>>>>>>>> the calibration logic.
>>>>>>>>>
>>>>>>>>> This patch renames tegra_mipi_calibrate() as
>>>>>>>>> tegra_mipi_start_calibration()
>>>>>>>>> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be
>>>>>>>>> inline
>>>>>>>>> with their usage.
>>>>>>>>>
>>>>>>>>> As MIPI clock is left enabled and in case of any failures with=20
>>>>>>>>> CSI
>>>>>>>>> input
>>>>>>>>> streaming tegra_mipi_finish_calibration() will not get invoked.
>>>>>>>>> So added new API tegra_mipi_cancel_calibration() which disables
>>>>>>>>> MIPI clock
>>>>>>>>> and consumer drivers can call this in such cases.
>>>>>>>>>
>>>>>>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>> ---
>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/tegra/dsi.c |=C2=A0 4 ++--
>>>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/gpu/host1x/mipi.c=C2=A0=C2=A0 | 19 +++=
+++++++---------
>>>>>>>>> =C2=A0=C2=A0=C2=A0 include/linux/host1x.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 +++--
>>>>>>>>> =C2=A0=C2=A0=C2=A0 3 files changed, 15 insertions(+), 13 deletion=
s(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/tegra/dsi.c
>>>>>>>>> b/drivers/gpu/drm/tegra/dsi.c
>>>>>>>>> index 3820e8d..a7864e9 100644
>>>>>>>>> --- a/drivers/gpu/drm/tegra/dsi.c
>>>>>>>>> +++ b/drivers/gpu/drm/tegra/dsi.c
>>>>>>>>> @@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct
>>>>>>>>> tegra_dsi *dsi)
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_dsi_writel(dsi, =
value, DSI_PAD_CONTROL_3);
>>>>>>>>> =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D tegra_mipi_calibra=
te(dsi->mipi);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 err =3D tegra_mipi_start_calibration(dsi->mip=
i);
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0)
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return err;
>>>>>>>>> =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 return tegra_mipi_wait(dsi=
->mipi);
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return tegra_mipi_finish_calibration(dsi->mip=
i);
>>>>>>>>> =C2=A0=C2=A0=C2=A0 }
>>>>>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0 static void tegra_dsi_set_timeout(struc=
t tegra_dsi *dsi,
>>>>>>>>> unsigned long bclk,
>>>>>>>>> diff --git a/drivers/gpu/host1x/mipi.c=20
>>>>>>>>> b/drivers/gpu/host1x/mipi.c
>>>>>>>>> index e606464..b15ab6e 100644
>>>>>>>>> --- a/drivers/gpu/host1x/mipi.c
>>>>>>>>> +++ b/drivers/gpu/host1x/mipi.c
>>>>>>>>> @@ -293,17 +293,19 @@ int tegra_mipi_disable(struct
>>>>>>>>> tegra_mipi_device *dev)
>>>>>>>>> =C2=A0=C2=A0=C2=A0 }
>>>>>>>>> =C2=A0=C2=A0=C2=A0 EXPORT_SYMBOL(tegra_mipi_disable);
>>>>>>>>> =C2=A0=C2=A0=C2=A0 -int tegra_mipi_wait(struct tegra_mipi_device =
*device)
>>>>>>>>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device
>>>>>>>>> *device)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 clk_disable(device->mipi->clk);
>>>>>>>> Do we need to do anything with the MIPI_CAL_CTRL and=20
>>>>>>>> MIPI_CAL_STATUS
>>>>>>>> registers here? We don't clear the START bit in the former when=20
>>>>>>>> the
>>>>>>>> calibration has successfully finished, but I suspect that's=20
>>>>>>>> because
>>>>>>>> the bit is self-clearing. But I wonder if we still need to=20
>>>>>>>> clear it
>>>>>>>> upon cancellation to make sure the calibration does indeed stop.
>>>>>>> Apparently there is no way to explicitly stop calibration other
>>>>>>> than to
>>>>>>> reset MIPI calibration block, but Sowjanya says this is=20
>>>>>>> unnecessary.
>>>>>>>
>>>>>>> Perhaps having a fixed delay before disabling clock could be=20
>>>>>>> enough to
>>>>>>> ensure that calibration is stopped before the clock is disabled?
>>>>>>>
>>>>>> Actually, there is a MIPI_CAL_ACTIVE bit in the status register.=20
>>>>>> Maybe
>>>>>> it needs to be polled until it's unset?
>>>>> Confirmed with HW design team during this patch update.
>>>>>
>>>>> SW does not need to clear START bit and only write 1 takes effect to
>>>>> that bit.
>>>>>
>>>>> Also, no need to have delay or do any other register settings=20
>>>>> unclear as
>>>>> its FSM and there's nothing to get stuck.
>>>>>
>>>>> Also it goes thru small finite set of codes and by the time sensor
>>>>> programming happens for enabling streaming FSM will finish its
>>>>> calibration sequence much early and it will only wait for pads LP-11.
>>>>>
>>>>> So, during cancel we only need disable MIPI clock.
>>>>>
>>>> But there is no guarantee that cancel_calibration() couldn't be=20
>>>> invoked
>>>> in the middle of the calibration process, hence FSM could freeze in an
>>>> intermediate state if it's running on the disabled MIPI clock, this
>>>> doesn't sound good.
>>> Actual calibration logic uses UART_FST_CAL clock which is always=20
>>> enabled
>> What enables the UART_FST_CAL clock? I don't see this clock used=20
>> anywhere.
>
> UART_FST_MIPI_CAL is shared with uart and is always enabled all the time.
>
> I don't see mipi driver handling this and I think that's because this=20
> clock is enabled all the time as its used for UART as well. Probably=20
> thierry can comment on this clock.
>
> Also regarding cancel calibration, as FSM goes thru only finite=20
> sequence codes by the time csi stream and sensor stream happens which=20
> is where we check for calibration to complete for sure calibration=20
> will be finished and calibration logic will only wait for pads to be=20
> in LP-11 to apply results. So nothing special needed during cancel=20
> except to turn clock off to balance its usage count.
>
>
UART_FST_MIPI_CAL is the clock used for calibration logic which is FSM=20
that goes thru sequence codes and when done waits for pads to be in=20
LP-11 to apply results.

MIPI_CLK is controller gate clock which is also need to be kept enabled=20
as incase if it sees LP-11 it updates registers so its recommended to=20
have this clock enabled.

We can cancel_calibration() in CSI only when csi/sensor stream on fails=20
and in which case there will be no LP-11 so we can unconditionally=20
disable MIPI_CLK.

