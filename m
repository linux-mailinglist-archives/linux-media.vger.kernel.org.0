Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D57D1EBFC2
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 18:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgFBQQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 12:16:36 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9468 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgFBQQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 12:16:35 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed67b030000>; Tue, 02 Jun 2020 09:14:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 02 Jun 2020 09:16:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 02 Jun 2020 09:16:35 -0700
Received: from [10.2.162.42] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jun
 2020 16:16:34 +0000
Subject: Re: IMX274 driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
Message-ID: <1dd4f2a0-7087-6776-fb92-7eb0882cade0@nvidia.com>
Date:   Tue, 2 Jun 2020 09:16:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <47d93f37-e44d-39da-53cb-eb69843b3a12@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591114499; bh=q0tiVlvPoCfUGGf4clZeRZyEzZCliQx5lhMlBshjCCQ=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=UB79X59zJIO4aFVJ+P6C6uOuf4QHuCnZTg19eJlzndfRUKcPY9lfdHaFdWGfmeEfs
         lv9UHV2p7jlr/C+30gzVn9s72yImGDiMEghgAspq4catUcVyPXImK2Y4cHDP8Um6pg
         eOosPTgmSGNL860bgdxT9l+dtQdM0HQSBSFryPNy8udHKFFpOV0ZCuL+iaBZnXkOZy
         YXZUPfEaGtU6xuIxRYD9NVXC70luuAXmIQmICgwjE2P1MnDpFr9gxM3maUbsf3V98B
         sF8cUHf69JJjngDqymkUF8ZLwDNK/YlJKcCYdabRcOG9BoWU8RPvfENNygykZjTAKX
         fE2h2JcBkpFeg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 6/2/20 7:17 AM, Sowjanya Komatineni wrote:
>
> On 6/2/20 1:51 AM, Luca Ceresoli wrote:
>> Hi,
>>
>> [adding Leon Luo in Cc:, the maintainer and original driver author]
>>
>> On 01/06/20 10:47, Hans Verkuil wrote:
>>> On 01/06/2020 10:31, Hans Verkuil wrote:
>>>> Hi Luca,
>>>>
>>>> On 31/05/2020 23:56, Luca Ceresoli wrote:
>>>>> Hi Sowjanya,
>>>>>
>>>>> On 29/05/20 04:07, Sowjanya Komatineni wrote:
>>>>>> Hi Luca,
>>>>>>
>>>>>> Quick question regarding IMX274 driver that was up streamed by you.
>>>>> Well, to be fair I only added cropping and made some improvements.
>>>>>
>>>>>> Upstream IMX274 driver programs Y_OUT_SIZE correctly based on IMX274
>>>>>> datasheet and register mode table for Y_OUT_SIZE where it includes 6
>>>>>> ignored area of effective pixels + 8 effective margin for color
>>>>>> processing pixels.
>>>>>>
>>>>>> So, Y_OUT_SIZE register value =3D height + 14
>>>>>>
>>>>>> But somehow with this we are not seeing full frame on CSI.
>>>>>>
>>>>>> In our internal NVIDIA IMX274 driver, we are programming=20
>>>>>> Y_OUT_SIZE to
>>>>>> exact height=C2=A0 Y_OUT_SIZE =3D height
>>>>>>
>>>>>> So for debug, followed the same and updated upstream IMX274=20
>>>>>> driver to
>>>>>> program Y_OUT_SIZE =3D crop.height locally and I see all resolutions
>>>>>> working fine with this.
>>>>>>
>>>>>> Checking with Sony on whats causing sensor not to send full frame=20
>>>>>> when
>>>>>> Y_OUT_SIZE is set to height + 14.
>>>>>>
>>>>>> But thought to check with you in parallel if there are any known=20
>>>>>> issues
>>>>> That's strange. Unfortunately I'm not using imx274 anymore since a=20
>>>>> long
>>>>> time and don't remember the details, but definitely I did test it=20
>>>>> and if
>>>>> there had been 14 missing lines I'm pretty sure I would have noticed.
>>>>>
>>>>> I'll see if I can remember anything useful, and in case I'll=20
>>>>> update you.
>>>>> I would be glad if you can update me on any findings too, maybe they
>>>>> will help in understanding the problem better.
>>>> The '+ 14' makes no sense. I wonder if this was perhaps to=20
>>>> compensate for
>>>> some problem in the bridge driver that this sensor was connected to.
>>>> Which bridge driver did you use for testing? Do you remember where=20
>>>> you got
>>>> the '+ 14' from?
>>> Hmm, this comes from the first version of this driver where Y_OUT_SIZE
>>> was set to 0x87e (2160 + 14). This in turn comes from the datasheet=20
>>> ('Register
>>> Setting for Each Readout Drive Mode').
>>>
>>> Looking at the "Detailed Specification of Each Mode" (page 63 in my=20
>>> copy of
>>> the datasheet) I see three additional parameters: "Front ignore area of
>>> effective pixel", "Front effective margin for color processing" and=20
>>> "Rear
>>> effective margin for color processing", these are 6, 4 and 4, which=20
>>> is a
>>> total of 14.
>>>
>>> So I guess that's where the 14 comes from.
>> Double-checked, and I agree.
>>
>>> Knowing with which bridge driver this was tested will definitely be=20
>>> helpful.
>> The design was based on a Xilinx zcu106 and the sensor output went into
>> the Xilinx MIPI CSI-2 RX subsystem IP (currently being mainlined), an
>> ISP IP and a Xilinx video DMA IP block, I think it was the "Video Frame
>> Buffer Writer" IP. I did several experiments with similar setups, even
>> with basic a Xilinx debayer+CCM in place of the ISP, and don't remember
>> any problems with wrong lines.
>>
>> Wild guess: Sowjanya, are you using VFLIP? I never used that, but it
>> might influence the order of lines processing somehow.
>
> No I am not using VFLIP.
>
> Did quick experiment of keeping buffer as valid even in case of frame=20
> buffer write timeout to see so far captured image and I see full=20
> 3840x2160 image capture with both cases where Y_OUT_SIZE =3D height and=20
> also with Y_OUT_SIZE =3D height + 14
>
> Could be something during end of frame when using Y_OUT_SIZE =3D height=20
> + 14
>
> Provided all register settings being used to Sony and explained this=20
> observation. Will update when I hear from them.
>
> Also will check how these 14 lines (ignore + color processing=20
> effective margin) translates to CSI frame sent out..
>
Hi Luca,

Can you please provide exact set-fmt and crop settings you used for=20
imx274 pipeline for 3840X2160 mode1 testing?

Would like to try same just in case..

Thanks

Sowjanya

