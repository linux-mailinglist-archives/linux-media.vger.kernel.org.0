Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC641EBDE1
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 16:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgFBORR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 10:17:17 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4016 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbgFBORQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 10:17:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed65f150003>; Tue, 02 Jun 2020 07:15:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 02 Jun 2020 07:17:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 02 Jun 2020 07:17:16 -0700
Received: from [10.2.162.42] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jun
 2020 14:17:15 +0000
Subject: Re: IMX274 driver
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Frank Chen <frankc@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        <linux-media@vger.kernel.org>
CC:     Leon Luo <leonl@leopardimaging.com>
References: <4184f80b-eab3-c512-dd99-d24c7af4b45c@nvidia.com>
 <afd8fdb8-e359-5aee-ba3e-54a5217b2aee@lucaceresoli.net>
 <d81c6fec-e7de-1282-9e17-1fc0f5dea9eb@xs4all.nl>
 <cb3a6636-5d7d-c7b4-b0ad-f77444117efe@xs4all.nl>
 <83e56659-0a4f-40e1-1dc4-02ac1cabbd3f@lucaceresoli.net>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <47d93f37-e44d-39da-53cb-eb69843b3a12@nvidia.com>
Date:   Tue, 2 Jun 2020 07:17:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <83e56659-0a4f-40e1-1dc4-02ac1cabbd3f@lucaceresoli.net>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591107349; bh=2iR1evDOMZcXDgYipaLsUSuMZgUtt85/IrClPeUB1wg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WQtE/lqnN++vAFGAs9/Pymr0s6Au45AEtkRPpbX55kBjGO/g7HR0Uq7ihVehsP0y1
         SJ8sd8RPh4pZyW6hHbVjQJ6+JWcdkoLbAE4+W3G0wmThOjEbLkSwqZV+oUfw0LWB0X
         nZ39QuqahfbtOAJV5B1tnVKofVDx+U4NYgdWRzxtNBzD5Hbd8y5jt+Sd0AAdVeaGng
         vx/K4RKGghkMkOkHZwHwXgU9C8OUyJJA/mdmnwcJ5tuAuJsBt7cr4/hb7RGbqDYYGJ
         Bb5B9QEQGpJPTwjqJtpOBT5s3KtgWSUekiiU32tLT/YReJ6EcwqFka29gEIAoi3cSh
         InOw2cAVQaUYg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 6/2/20 1:51 AM, Luca Ceresoli wrote:
> Hi,
>
> [adding Leon Luo in Cc:, the maintainer and original driver author]
>
> On 01/06/20 10:47, Hans Verkuil wrote:
>> On 01/06/2020 10:31, Hans Verkuil wrote:
>>> Hi Luca,
>>>
>>> On 31/05/2020 23:56, Luca Ceresoli wrote:
>>>> Hi Sowjanya,
>>>>
>>>> On 29/05/20 04:07, Sowjanya Komatineni wrote:
>>>>> Hi Luca,
>>>>>
>>>>> Quick question regarding IMX274 driver that was up streamed by you.
>>>> Well, to be fair I only added cropping and made some improvements.
>>>>
>>>>> Upstream IMX274 driver programs Y_OUT_SIZE correctly based on IMX274
>>>>> datasheet and register mode table for Y_OUT_SIZE where it includes 6
>>>>> ignored area of effective pixels + 8 effective margin for color
>>>>> processing pixels.
>>>>>
>>>>> So, Y_OUT_SIZE register value =3D height + 14
>>>>>
>>>>> But somehow with this we are not seeing full frame on CSI.
>>>>>
>>>>> In our internal NVIDIA IMX274 driver, we are programming Y_OUT_SIZE t=
o
>>>>> exact height=C2=A0 Y_OUT_SIZE =3D height
>>>>>
>>>>> So for debug, followed the same and updated upstream IMX274 driver to
>>>>> program Y_OUT_SIZE =3D crop.height locally and I see all resolutions
>>>>> working fine with this.
>>>>>
>>>>> Checking with Sony on whats causing sensor not to send full frame whe=
n
>>>>> Y_OUT_SIZE is set to height + 14.
>>>>>
>>>>> But thought to check with you in parallel if there are any known issu=
es
>>>> That's strange. Unfortunately I'm not using imx274 anymore since a lon=
g
>>>> time and don't remember the details, but definitely I did test it and =
if
>>>> there had been 14 missing lines I'm pretty sure I would have noticed.
>>>>
>>>> I'll see if I can remember anything useful, and in case I'll update yo=
u.
>>>> I would be glad if you can update me on any findings too, maybe they
>>>> will help in understanding the problem better.
>>> The '+ 14' makes no sense. I wonder if this was perhaps to compensate f=
or
>>> some problem in the bridge driver that this sensor was connected to.
>>> Which bridge driver did you use for testing? Do you remember where you =
got
>>> the '+ 14' from?
>> Hmm, this comes from the first version of this driver where Y_OUT_SIZE
>> was set to 0x87e (2160 + 14). This in turn comes from the datasheet ('Re=
gister
>> Setting for Each Readout Drive Mode').
>>
>> Looking at the "Detailed Specification of Each Mode" (page 63 in my copy=
 of
>> the datasheet) I see three additional parameters: "Front ignore area of
>> effective pixel", "Front effective margin for color processing" and "Rea=
r
>> effective margin for color processing", these are 6, 4 and 4, which is a
>> total of 14.
>>
>> So I guess that's where the 14 comes from.
> Double-checked, and I agree.
>
>> Knowing with which bridge driver this was tested will definitely be help=
ful.
> The design was based on a Xilinx zcu106 and the sensor output went into
> the Xilinx MIPI CSI-2 RX subsystem IP (currently being mainlined), an
> ISP IP and a Xilinx video DMA IP block, I think it was the "Video Frame
> Buffer Writer" IP. I did several experiments with similar setups, even
> with basic a Xilinx debayer+CCM in place of the ISP, and don't remember
> any problems with wrong lines.
>
> Wild guess: Sowjanya, are you using VFLIP? I never used that, but it
> might influence the order of lines processing somehow.

No I am not using VFLIP.

Did quick experiment of keeping buffer as valid even in case of frame=20
buffer write timeout to see so far captured image and I see full=20
3840x2160 image capture with both cases where Y_OUT_SIZE =3D height and=20
also with Y_OUT_SIZE =3D height + 14

Could be something during end of frame when using Y_OUT_SIZE =3D height + 1=
4

Provided all register settings being used to Sony and explained this=20
observation. Will update when I hear from them.

Also will check how these 14 lines (ignore + color processing effective=20
margin) translates to CSI frame sent out..

