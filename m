Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60234234CA7
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 23:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgGaVDZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 17:03:25 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19295 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgGaVDY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 17:03:24 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2486ee0000>; Fri, 31 Jul 2020 14:02:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 14:03:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 14:03:24 -0700
Received: from [10.2.167.221] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 21:03:23 +0000
Subject: Re: [RFC PATCH v6 09/10] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
 <1596186169-18729-10-git-send-email-skomatineni@nvidia.com>
 <3ac158c4-7df7-e3c1-f0e1-33e7ef017762@gmail.com>
 <f483329d-b5fe-fda5-e235-b8edb5fce440@nvidia.com>
 <a08af0e8-80d8-0bd0-87a3-adfc8e70a92a@gmail.com>
 <ace047fe-8a1a-666a-b91b-9d63b1d68567@nvidia.com>
 <7d904a86-3189-7ef8-a7b9-1a84564f9278@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <27ba10cc-21b2-845d-2ed1-a10e89f85d19@nvidia.com>
Date:   Fri, 31 Jul 2020 14:03:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7d904a86-3189-7ef8-a7b9-1a84564f9278@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596229358; bh=5aPbPjsq95AnXhQs1uUqFuw/monhKE3gItF0OQ7Y35E=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=rNN1Jk8kM1ApXoaG4+klggIBMz+ICGfGoYGNvKabA9ciJZvo9U6Z3zIpjzU4sOE/Q
         2BmVUZaQAU6EMB5b+EIznrk9gVuolLSCPQ7ae4d3Blz1/slXH4I5ND0JlIVDu6Hy+m
         Cw9Iha/iqSPGH1HvSEcLqJm1HuINM+zKga4wxlSE8NxYR5pe4LIeB1pIAbdb6fLJH1
         a3xI3GVhuhIDnIKJolf74tYIfIX9uza+tFF2PNVtKHBc+YRrtv9ZN/oSR4GmYLVEJi
         vilxt7p68RkVi59086qSrTClGaKY3E01k5LmYfLmLCZ3VFdzMJnHQwVXdh5oodlHpd
         rW7gteynSYBug==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/31/20 1:42 PM, Dmitry Osipenko wrote:
> 31.07.2020 19:29, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/31/20 9:14 AM, Dmitry Osipenko wrote:
>>> 31.07.2020 18:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 7/31/20 4:39 AM, Dmitry Osipenko wrote:
>>>>> 31.07.2020 12:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> ...
>>>>>> @@ -249,13 +249,47 @@ static int tegra_csi_enable_stream(struct
>>>>>> v4l2_subdev *subdev)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 ret;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>  =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 if (csi_chan->mipi) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_mipi_enabl=
e(csi_chan->mipi);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
dev_err(csi->dev,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "failed to enable MIPI pads: %d\n", ret);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
goto rpm_put;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * CSI MIPI pads PU=
LLUP, PULLDN and TERM impedances need to
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * be calibrated af=
ter power on.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * So, trigger the =
calibration start here and results will
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * be latched and a=
pplied to the pads when link is in LP11
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * state during sta=
rt of sensor streaming.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_mipi_start=
_calibration(csi_chan->mipi);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
dev_err(csi->dev,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "failed to start MIPI calibration: %d\n", ret);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
goto disable_mipi;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> What would happen if CSI stream is enabled and then immediately
>>>>> disabled
>>>>> without enabling camera sensor?
>>>> Nothing will happen as during stream enable csi receiver is kept ready=
.
>>>>
>>>> But actual capture will not happen during that point.
>>> Could you please show how the full call chain looks like? It's not clea=
r
>>> to me what keeps CSI stream "ready".
>> VI is the main video input (video device) and on streaming it starts
>> stream of CSI subdev prior to stream of Sensor.
>>
>> HW path, sensor stream (CSI TX) -> CSI stream (RX)
>>
>> During CSI stream on, CSI PHY receiver is enabled to start receiving the
>> data but internally capture assembled to active state will happen only
>> when Tegra VI single shot is issues where VI thru pixel parser gets
>> captures data into the memory
> Alright, I see now.
>
> Will be great if you could change this hunk:
>
> {
>    ret =3D v4l2_subdev_call(src_subdev, video, s_stream, true);
>    if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
>      tegra_mipi_cancel_calibration(csi_chan->mipi);
>      v4l2_subdev_call(csi_subdev, video, s_stream, false);
>      return ret;
>    }
> }
>
> to look like this:
>
> {
>    err =3D v4l2_subdev_call(src_subdev, video, s_stream, true);
>    if (err < 0 && err !=3D -ENOIOCTLCMD)
>      goto err_disable_csi_stream;
> ...
>    return 0;
>
> err_disable_csi_stream:
>    tegra_mipi_cancel_calibration(csi_chan->mipi);
>
>    v4l2_subdev_call(csi_subdev, video, s_stream, false);
>
>    return err;
> }
>
>
> It should make code a bit easier to read and follow.
>
> Otherwise this patch looks good to me, thanks.

Thanks Dmitry. Will send v7 now with this minor fix and would like to=20
close on this soon.

Sowjanya

