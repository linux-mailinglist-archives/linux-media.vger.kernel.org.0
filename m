Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F015520587C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 19:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733151AbgFWRYn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 13:24:43 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4170 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733097AbgFWRYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 13:24:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef23acc0000>; Tue, 23 Jun 2020 10:24:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 23 Jun 2020 10:24:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 23 Jun 2020 10:24:40 -0700
Received: from [10.2.172.15] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jun
 2020 17:24:39 +0000
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
 <47d93f37-e44d-39da-53cb-eb69843b3a12@nvidia.com>
 <1dd4f2a0-7087-6776-fb92-7eb0882cade0@nvidia.com>
 <637dd1d4-5473-4327-11fc-14b3723ce7b2@lucaceresoli.net>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <920bd2d6-d84f-d5d5-f8c7-caf5c777d937@nvidia.com>
Date:   Tue, 23 Jun 2020 10:25:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <637dd1d4-5473-4327-11fc-14b3723ce7b2@lucaceresoli.net>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592933068; bh=sTnRlNd/lLeFRMT1qWac0kB8Zhh5dyAH77mz1DqIEvE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=YE+7jba9tyEPajikLlCPq/YL4AF0VoxLcZhpfZEl/E1tC9yDDSzGfD2jUZnaxRlDn
         tnOIXMKgXHsfjP+WuFOcsSxd5OUZJyaOMPm8cmliutsaM3Al2tr6apWx3qYwEiwj/U
         wsC9nCMV+cW6sHaRXpi0rnegV98G6X03XyZUO77yjPS4Rtc64+gBRQHi6swMjtf8DW
         4h3EljrjNLhwvjF9hkW6Pi3iLTB7ZNosflUwK0i7TpzksmBqCEyafwOjuoACVSz3Zc
         w9xBmzcq/HgYFva4duCHExqVz0ZnDIH3DJlRliU01Z9n+kD7mqemFqLT9Ju+TqjRJT
         idxC4zUWN+Lmw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 6/2/20 1:08 PM, Luca Ceresoli wrote:
> Hi,
>
> On 02/06/20 18:16, Sowjanya Komatineni wrote:
>> On 6/2/20 7:17 AM, Sowjanya Komatineni wrote:
>>> On 6/2/20 1:51 AM, Luca Ceresoli wrote:
>>>> Hi,
>>>>
>>>> [adding Leon Luo in Cc:, the maintainer and original driver author]
>>>>
>>>> On 01/06/20 10:47, Hans Verkuil wrote:
>>>>> On 01/06/2020 10:31, Hans Verkuil wrote:
>>>>>> Hi Luca,
>>>>>>
>>>>>> On 31/05/2020 23:56, Luca Ceresoli wrote:
>>>>>>> Hi Sowjanya,
>>>>>>>
>>>>>>> On 29/05/20 04:07, Sowjanya Komatineni wrote:
>>>>>>>> Hi Luca,
>>>>>>>>
>>>>>>>> Quick question regarding IMX274 driver that was up streamed by you=
.
>>>>>>> Well, to be fair I only added cropping and made some improvements.
>>>>>>>
>>>>>>>> Upstream IMX274 driver programs Y_OUT_SIZE correctly based on IMX2=
74
>>>>>>>> datasheet and register mode table for Y_OUT_SIZE where it includes=
 6
>>>>>>>> ignored area of effective pixels + 8 effective margin for color
>>>>>>>> processing pixels.
>>>>>>>>
>>>>>>>> So, Y_OUT_SIZE register value =3D height + 14
>>>>>>>>
>>>>>>>> But somehow with this we are not seeing full frame on CSI.
>>>>>>>>
>>>>>>>> In our internal NVIDIA IMX274 driver, we are programming
>>>>>>>> Y_OUT_SIZE to
>>>>>>>> exact height=C2=A0 Y_OUT_SIZE =3D height
>>>>>>>>
>>>>>>>> So for debug, followed the same and updated upstream IMX274
>>>>>>>> driver to
>>>>>>>> program Y_OUT_SIZE =3D crop.height locally and I see all resolutio=
ns
>>>>>>>> working fine with this.
>>>>>>>>
>>>>>>>> Checking with Sony on whats causing sensor not to send full frame
>>>>>>>> when
>>>>>>>> Y_OUT_SIZE is set to height + 14.
>>>>>>>>
>>>>>>>> But thought to check with you in parallel if there are any known
>>>>>>>> issues
>>>>>>> That's strange. Unfortunately I'm not using imx274 anymore since a
>>>>>>> long
>>>>>>> time and don't remember the details, but definitely I did test it
>>>>>>> and if
>>>>>>> there had been 14 missing lines I'm pretty sure I would have notice=
d.
>>>>>>>
>>>>>>> I'll see if I can remember anything useful, and in case I'll
>>>>>>> update you.
>>>>>>> I would be glad if you can update me on any findings too, maybe the=
y
>>>>>>> will help in understanding the problem better.
>>>>>> The '+ 14' makes no sense. I wonder if this was perhaps to
>>>>>> compensate for
>>>>>> some problem in the bridge driver that this sensor was connected to.
>>>>>> Which bridge driver did you use for testing? Do you remember where
>>>>>> you got
>>>>>> the '+ 14' from?
>>>>> Hmm, this comes from the first version of this driver where Y_OUT_SIZ=
E
>>>>> was set to 0x87e (2160 + 14). This in turn comes from the datasheet
>>>>> ('Register
>>>>> Setting for Each Readout Drive Mode').
>>>>>
>>>>> Looking at the "Detailed Specification of Each Mode" (page 63 in my
>>>>> copy of
>>>>> the datasheet) I see three additional parameters: "Front ignore area =
of
>>>>> effective pixel", "Front effective margin for color processing" and
>>>>> "Rear
>>>>> effective margin for color processing", these are 6, 4 and 4, which
>>>>> is a
>>>>> total of 14.
>>>>>
>>>>> So I guess that's where the 14 comes from.
>>>> Double-checked, and I agree.
>>>>
>>>>> Knowing with which bridge driver this was tested will definitely be
>>>>> helpful.
>>>> The design was based on a Xilinx zcu106 and the sensor output went int=
o
>>>> the Xilinx MIPI CSI-2 RX subsystem IP (currently being mainlined), an
>>>> ISP IP and a Xilinx video DMA IP block, I think it was the "Video Fram=
e
>>>> Buffer Writer" IP. I did several experiments with similar setups, even
>>>> with basic a Xilinx debayer+CCM in place of the ISP, and don't remembe=
r
>>>> any problems with wrong lines.
>>>>
>>>> Wild guess: Sowjanya, are you using VFLIP? I never used that, but it
>>>> might influence the order of lines processing somehow.
>>> No I am not using VFLIP.
>>>
>>> Did quick experiment of keeping buffer as valid even in case of frame
>>> buffer write timeout to see so far captured image and I see full
>>> 3840x2160 image capture with both cases where Y_OUT_SIZE =3D height and
>>> also with Y_OUT_SIZE =3D height + 14
>>>
>>> Could be something during end of frame when using Y_OUT_SIZE =3D height
>>> + 14
>>>
>>> Provided all register settings being used to Sony and explained this
>>> observation. Will update when I hear from them.
>>>
>>> Also will check how these 14 lines (ignore + color processing
>>> effective margin) translates to CSI frame sent out..
>>>
>> Hi Luca,
>>
>> Can you please provide exact set-fmt and crop settings you used for
>> imx274 pipeline for 3840X2160 mode1 testing?
> I don't remember much anymore. But I forgot to mention I [almost] always
> worked with 1920x1080 capture, either with binning or with cropping. I
> don't think the will change much, as the '+14' is equal in readout modes
> 1 and 3 (1920p and 3840p modes at 10 bits). Can you try that nevertheless=
?

Just to update, discussed on this issue with Sony.

Sony confirmed Y_OUT_SIZE should be the height of effective image output=20
from sensor which are actually the total lines sent over CSI to receiver.

Receiver expected height should match this. So, Y_OUT_SIZE =3D crop height.

Regarding WRITE_VSIZE Sony mentioned, it includes Vertical OB where OB=20
is a shaded pixel for black level adjustment. When using this, it is=20
highly recommended that ISP use the OB value to make black level=20
adjustments.

WRITE_VSIZE should be set to height + 8.

Using height + 22 will not have any impact if we dont use ISP and this=20
VOB is shaded pixel for black level adjustment where ISP need to use to=20
make black level adjustment.

I tried by changing driver to set WRITE_VSIZE =3D crop.height + 8 and=20
Y_OUT_SIZE =3D crop.height for all supported resolutions and capture works=
=20
fine without any issues.

Thanks

Sowjanya


