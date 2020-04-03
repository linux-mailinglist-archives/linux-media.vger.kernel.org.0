Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6921719D151
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 09:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389588AbgDCHgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 03:36:15 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5388 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730759AbgDCHgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 03:36:15 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e86e73c0000>; Fri, 03 Apr 2020 00:35:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 03 Apr 2020 00:36:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 03 Apr 2020 00:36:14 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 3 Apr
 2020 07:36:14 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 3 Apr 2020
 07:36:13 +0000
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>, <digetx@gmail.com>,
        <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
 <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
 <ba37eb84-392c-3767-57f6-d297b0ab79a3@xs4all.nl>
 <20200331111018.GJ2394@valkosipuli.retiisi.org.uk>
 <a1145ee4-2991-a958-1225-090c57fec533@xs4all.nl>
 <20200331115221.GA4767@pendragon.ideasonboard.com>
 <6aa7d86c-3943-d508-ccf6-5ac46546abe9@nvidia.com>
 <3b00a559-992a-2da9-92b1-bee44e137ba2@nvidia.com>
 <1c60491b-1bb2-6291-80a6-c0fa14094077@nvidia.com>
 <20200401165805.GE4876@pendragon.ideasonboard.com>
 <e3b437c6-76e1-d407-e81d-c05912ffcd0b@nvidia.com>
Message-ID: <f80dfa8f-0188-a733-bde6-e3210977d910@nvidia.com>
Date:   Fri, 3 Apr 2020 00:36:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e3b437c6-76e1-d407-e81d-c05912ffcd0b@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585899324; bh=lH8VCoTnCQfzYg8lxheGj9jbRYQX28Pk6wDY+1bd1Lc=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=aCJmbHtsc4d/J4y6wxxvtxPdp8AB1QyHvod3IkYmiYOFmNqRKzkoO4l4xehzZLMNN
         HciKMWr46UM+naKvToV2stzzX9PdWPMx4AIVUrBCxI/BDYPaGEEB9iyN1aT+d0iHP6
         lWU4h7sEP2wi0FLerEJpqXt1cnt5khCLapxZ/1tXVzyNkfEJCppASvxjcID5mzAauM
         FNMkg3nG2Jdvl9gTDoveadA1PqSeMIPxzu+owU/zY+fOkicByGSu6uTgeeOskEALIn
         bmNFWfEDYEYKPWlfkD9L9vnpfAltTR75ArZq8+fZ6XqcBr6p5Ly4MBXQL9GiEU2c6E
         ewNJyE76dqBUg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we don't need have MC based for tegra internal TPG, will continue 
with video node based for CSI sub-device in this series.

Next series will include sensor support, will discuss internally by then 
and will implement accordingly.

Thanks

Sowjanya


On 4/1/20 11:24 AM, Sowjanya Komatineni wrote:
>
> On 4/1/20 9:58 AM, Laurent Pinchart wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Sowjanya,
>>
>> On Wed, Apr 01, 2020 at 09:36:03AM -0700, Sowjanya Komatineni wrote:
>>> Hi Sakari/Laurent,
>>>
>>> Few questions to confirm my understanding on below discussion.
>>>
>>> 1. Some sensors that you are referring as don't work with single 
>>> devnode
>>> controlling pipeline devices are ISP built-in sensors where setup of
>>> pipeline and subdevices happen separately?
>> Sensors that include ISPs could indeed require to be exposed as multiple
>> subdevs, but I was mostly referring to raw Bayer sensors with hardware
>> architectures similar to the SMIA++ and MIPI CCS specifications. Those
>> sensors can perform cropping in up to three different locations (analog
>> crop, digital crop, output crop), and can also scale in up to three
>> different locations (binning, skipping and filter-based scaling).
>>
>> Furthermore, with the V4L2 support for multiplexed streams that we are
>> working on, a sensor that can produce both image data and embedded data
>> would also need to be split in multiple subdevs.
>
> Thanks Laurent.
>
> For sensors with meta/embedded data along with image in same frame, 
> Tegra VI HW extracts based on programmed embedded data size info.
>
> So in our driver we capture this as separate buffer as embedded data 
> is part of frame.
>
> You above comment on multiplexed streams is for sensors using 
> different virutal channels for diff streams?
>
>
>>> 2. With driver supporting single device node control of entire pipeline
>>> devices compared to MC-based, limitation is with userspace apps for 
>>> only
>>> these complex camera sensors?
>> In those cases, several policy decisions on how to configure the sensor
>> (whether to use binning, skipping and/or filter-based scaling for
>> instance, or how much cropping and scaling to apply to achieve a certain
>> output resolution) will need to be implemented in the kernel, and
>> userspace will not have any control on them.
>>
>>> 3. Does all upstream video capture drivers eventually will be moved to
>>> support MC-based?
>> I think we'll see a decrease of the video-node-centric drivers in the
>> future for embedded systems, especially the ones that include an ISP.
>> When a system has an ISP, even if the ISP is implemented as a
>> memory-to-memory device separate from the CSI-2 capture side, userspace
>> will likely have a need for fine-grained control of the camera sensor.
>>
>>> 4. Based on libcamera doc looks like it will work with both types of
>>> MC-based and single devnode based pipeline setup drivers for normal
>>> sensors and limitation is when we use ISP built-in sensor or ISP HW
>>> block. Is my understanding correct?
>> libcamera supports both, it doesn't put any restriction in that area.
>> The pipeline handler (the device-specific code in libcamera that
>> configures and control the hardware pipeline) is responsible for
>> interfacing with the kernel drivers, and is free to use an MC-centric or
>> video-node-centric API depending on what the kernel drivers offer.
>>
>> The IPA (image processing algorithms) module is also vendor-specific.
>> Although it will not interface directly with kernel drivers, it will
>> have requirements on how fine-grained control of the sensor is required.
>> For systems that have an ISP in the SoC, reaching a high image quality
>> level requires fine-grained control of the sensor, or at the very least
>> being able to retrieve fine-grained sensor configuration information
>> from the kernel. For systems using a camera sensor with an integrated
>> ISP and a CSI-2 receiver without any further processing on the SoC side,
>> there will be no such fine-grained control of the sensor by the IPA (and
>> there could even be no IPA module at all).
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
