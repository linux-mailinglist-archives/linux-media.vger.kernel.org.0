Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEEB23D1ED
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 22:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729778AbgHEUHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 16:07:23 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15177 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgHEQeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:34:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2adf640000>; Wed, 05 Aug 2020 09:33:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 09:33:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 09:33:53 -0700
Received: from [10.2.172.190] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 16:33:53 +0000
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
Date:   Wed, 5 Aug 2020 09:33:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596645220; bh=X5zEu6vUXobqBcWHY7aaMnj5mp+hKk0lRFA0MhBpjdw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=nPuQK4eaWgFlwk7/vscxJYA0OVSW7M2yfsfpDKz7kRU5zT0VexC2rUVHuBsKNMUsV
         kjRTmX9Qh/kiRlOZ0BFAmPOLDLrYCPZK8oPzS+uiksdWR36LN9Wd7EgzEuWzSKJ58y
         lFIJOCz/EU1/0T3fhP1kX497iXKKEmizr/muMZa9Xky0yeRfrXrCKv/+IBPAMLfm67
         qCssOIui/sHjGkL3CY/l3u/IgMsuEXPWzNT5N/6BUcN1IHykJLQkmMMQMtHw9pWTmj
         6bzvNXbPqFmNi82DOfZ1znh0cR0C/PABI4AoX+w7KgGXK3FeidCnRFxfMSqK4qn9pD
         eofJXi6fZl8Xw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/5/20 7:19 AM, Dmitry Osipenko wrote:
> 05.08.2020 17:05, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 05.08.2020 16:46, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Mon, Aug 03, 2020 at 08:42:24AM -0700, Sowjanya Komatineni wrote:
>>>> With the split of MIPI calibration into tegra_mipi_calibrate() and
>>>> tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
>>>> is done.
>>>>
>>>> So, this patch skips disabling MIPI clock after triggering start of
>>>> calibration and disables it only after waiting for done status from
>>>> the calibration logic.
>>>>
>>>> This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibrat=
ion()
>>>> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
>>>> with their usage.
>>>>
>>>> As MIPI clock is left enabled and in case of any failures with CSI inp=
ut
>>>> streaming tegra_mipi_finish_calibration() will not get invoked.
>>>> So added new API tegra_mipi_cancel_calibration() which disables MIPI c=
lock
>>>> and consumer drivers can call this in such cases.
>>>>
>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>   drivers/gpu/drm/tegra/dsi.c |  4 ++--
>>>>   drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
>>>>   include/linux/host1x.h      |  5 +++--
>>>>   3 files changed, 15 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
>>>> index 3820e8d..a7864e9 100644
>>>> --- a/drivers/gpu/drm/tegra/dsi.c
>>>> +++ b/drivers/gpu/drm/tegra/dsi.c
>>>> @@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_=
dsi *dsi)
>>>>   		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
>>>>   	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
>>>>  =20
>>>> -	err =3D tegra_mipi_calibrate(dsi->mipi);
>>>> +	err =3D tegra_mipi_start_calibration(dsi->mipi);
>>>>   	if (err < 0)
>>>>   		return err;
>>>>  =20
>>>> -	return tegra_mipi_wait(dsi->mipi);
>>>> +	return tegra_mipi_finish_calibration(dsi->mipi);
>>>>   }
>>>>  =20
>>>>   static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned lo=
ng bclk,
>>>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>>>> index e606464..b15ab6e 100644
>>>> --- a/drivers/gpu/host1x/mipi.c
>>>> +++ b/drivers/gpu/host1x/mipi.c
>>>> @@ -293,17 +293,19 @@ int tegra_mipi_disable(struct tegra_mipi_device =
*dev)
>>>>   }
>>>>   EXPORT_SYMBOL(tegra_mipi_disable);
>>>>  =20
>>>> -int tegra_mipi_wait(struct tegra_mipi_device *device)
>>>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
>>>> +{
>>>> +	clk_disable(device->mipi->clk);
>>> Do we need to do anything with the MIPI_CAL_CTRL and MIPI_CAL_STATUS
>>> registers here? We don't clear the START bit in the former when the
>>> calibration has successfully finished, but I suspect that's because
>>> the bit is self-clearing. But I wonder if we still need to clear it
>>> upon cancellation to make sure the calibration does indeed stop.
>> Apparently there is no way to explicitly stop calibration other than to
>> reset MIPI calibration block, but Sowjanya says this is unnecessary.
>>
>> Perhaps having a fixed delay before disabling clock could be enough to
>> ensure that calibration is stopped before the clock is disabled?
>>
> Actually, there is a MIPI_CAL_ACTIVE bit in the status register. Maybe
> it needs to be polled until it's unset?

Confirmed with HW design team during this patch update.

SW does not need to clear START bit and only write 1 takes effect to=20
that bit.

Also, no need to have delay or do any other register settings unclear as=20
its FSM and there's nothing to get stuck.

Also it goes thru small finite set of codes and by the time sensor=20
programming happens for enabling streaming FSM will finish its=20
calibration sequence much early and it will only wait for pads LP-11.

So, during cancel we only need disable MIPI clock.

