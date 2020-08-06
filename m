Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1BB23DFF5
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgHFQSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:18:43 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18452 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgHFQRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:17:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c28c90000>; Thu, 06 Aug 2020 08:59:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 08:59:55 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 08:59:55 -0700
Received: from [10.2.172.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 15:59:54 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
Date:   Thu, 6 Aug 2020 08:59:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596729545; bh=BmP7tNOgCgboFqvS8lSz48oQDm4QwQamCVy+CrncH7k=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=hPfwC07LV+YrR7dnigHuF0tUwgIgPps+81M9GhtJxH8WlghHga5Ip43DtfXVjdEsD
         KMZch65jTrOCyTidWLf3/qfMCuGuPFobjYrTkqv6m5kY1DqmNLLWuSrsgjkIKvu4zn
         2CFhjK0VJJRvGTRVCw8vga5wkYG3ikBI5Oo7BaDw7QsYyOGBqvIv+pRJl5JV2Yv76Z
         P8Nd7TogwVBLaSpDCLtmJqJnVyN3n9JPqaOg89O0i6rsgfTRjfxipnOObcshlI58M7
         PxgovQ7gWocIEfCe8Aul5zvlYspj3W146SaFtTWmJ0v3ER5HcrNmSXDe6KgIXvxCSG
         AbrdX6IXw+OUw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/6/20 6:32 AM, Dmitry Osipenko wrote:
> 06.08.2020 03:47, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 8/5/20 11:06 AM, Sowjanya Komatineni wrote:
>>> On 8/5/20 10:46 AM, Sowjanya Komatineni wrote:
>>>> On 8/5/20 10:34 AM, Dmitry Osipenko wrote:
>>>>> 05.08.2020 20:29, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> ...
>>>>>> UART_FST_MIPI_CAL is the clock used for calibration logic which is F=
SM
>>>>>> that goes thru sequence codes and when done waits for pads to be in
>>>>>> LP-11 to apply results.
>>>>>>
>>>>>> MIPI_CLK is controller gate clock which is also need to be kept
>>>>>> enabled
>>>>>> as incase if it sees LP-11 it updates registers so its recommended t=
o
>>>>>> have this clock enabled.
>>>>>>
>>>>>> We can cancel_calibration() in CSI only when csi/sensor stream on
>>>>>> fails
>>>>>> and in which case there will be no LP-11 so we can unconditionally
>>>>>> disable MIPI_CLK.
>>>>>>
>>>>> There is no guarantee that the fail comes before the LP-11. For
>>>>> example,
>>>>> some odd camera driver may have a complicated enable sequence which m=
ay
>>>>> fail after enabling the hardware streaming.
>>>> MIPI_CLK to keep enable is for calibration logic to update results,
>>>> but like I said calibration logic uses UART_FST_MIPI_CAL clock. So
>>>> even in case if fail happens from sensor after having pads in LP-11
>>>> then, calibration logic will still be running but result update will
>>>> not happen with clock disabled. But HW will not stuck as this is
>>>> confirmed from HW designer.
>>> If LP-11 happens from sensor stream (followed by fail) and by that
>>> time if calibration FSM is done and if calibration logic sees LP-11
>>> then results will be applied to pads.
>>>
>>> We did start of calibration before CSI stream so by the time we do
>>> sensor stream enable, calibration logic might have done with FSM and
>>> waiting for LP-11
>>>
>>> Also if we see any special case, we always can use
>>> finish_calibration() instead of cancel_calibration() as well.
> Why not to do it right now?

> Then the code could look like this:
>
> src_subdev =3D tegra_channel_get_remote_source_subdev(chan);
> ret =3D v4l2_subdev_call(src_subdev, video, s_stream, true);
> err =3D tegra_mipi_finish_calibration(csi_chan->mipi);
>
> if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> 	goto err_disable_csi_stream;
>
> if (err < 0)
> 	dev_warn(csi_chan->csi->dev,
> 		 "MIPI calibration failed: %d\n", err);
>
>>> finish_calibration() has extra 250ms wait time polling done bit and we
>>> can ignore its return code during fail pathway.
>>>
>> Confirmed from HW designer, calibration FSM to finish takes worst case
>> 72uS so by the time it gets to sensor stream it will be done its
>> sequence and will be waiting for DONE bit.
>>
>> So disabling MIPI CAL clock on sensor stream fails is safe.
>
> 72us is quite a lot of time, what will happen if LP-11 happens before
> FSM finished calibration?
>
> Maybe the finish_calibration() needs to split into two parts:
>
>   1. wait for CAL_STATUS_ACTIVE before enabling sensor
>   2. wait for CAL_STATUS_DONE after enabling sensor

I don't think we need to split for active and done. Active will be 1 as=20
long as other pads are in calibration as well.

We cant use active status check for specific pads under calibration.=20
This is common bit for all pads.

Unfortunately HW don't have separate status indicating when sequence is=20
done to indicate its waiting for LP11.


To avoid all this, will remove cancel_calibration() totally and use same=20
finish calibration even in case of stream failure then.

