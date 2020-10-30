Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F762A0BAE
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgJ3Qum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:50:42 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7815 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJ3Qum (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:50:42 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9c446c0000>; Fri, 30 Oct 2020 09:50:52 -0700
Received: from [10.2.62.160] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 16:50:41 +0000
Subject: Re: Suggestion regarding x8 gang mode device tree changes
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>
CC:     Thierry Reding <treding@nvidia.com>, <linux-media@vger.kernel.org>
References: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
 <20201029145013.GA6899@valkosipuli.retiisi.org.uk>
 <59f91ac7-84fc-a9fd-e331-35adf4e5f5b9@nvidia.com>
 <2ac2eb3d-32df-a352-3ce5-918ddbf718af@nvidia.com>
 <20201029165245.GB6899@valkosipuli.retiisi.org.uk>
 <542bbb61-049e-85d8-c2d7-9f38e6625b3d@nvidia.com>
 <7f64c771-a4ff-8909-4679-1cec58947e94@xs4all.nl>
 <20201030095642.GC6899@valkosipuli.retiisi.org.uk>
 <73cce478-c7b0-43b5-9c87-211b4a7c5b6b@xs4all.nl>
 <890937db-9012-6e13-5666-70598f3ff902@nvidia.com>
Message-ID: <f230c117-8420-c4ae-9ebd-aa4b2ef42444@nvidia.com>
Date:   Fri, 30 Oct 2020 09:50:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <890937db-9012-6e13-5666-70598f3ff902@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604076652; bh=ZeokeDmgmzvulce5BmzQjqEpRrwkGs8zbgp1yukJiSw=;
        h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=NZOy1rZBmcfRsY4NhwQPzI3TvGZUqARzqcA3cXcz8HeNB4PbG6p5ZcMpI0qlf2/6C
         q2VG+bTpiMgc9qWnb6/6Cs4FVBCv+T89EhABYf9MRDDEn2m/hTLQPJuRttlgfyr6ac
         IjBHZH5Ac2APnEhsTFfBEYwzErYc1ESRq3nUX7m6j9iTdDWq43pSZnNRxo12VoKFNZ
         eVp5cs8Sjv4usfpu2kjOse8s67fWCUMzxvpHJKu/6kaDRGt2fR4ypHJAAgomdtpxpb
         83ckPjqyysmkHEl+XD3PG7fpRncmrRn+1SBfb7yC+M8JU2MeRfQdj4XvS5kEJc4uJ0
         el2zeAhx735EA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 10/30/20 8:26 AM, Sowjanya Komatineni wrote:
>
> On 10/30/20 3:06 AM, Hans Verkuil wrote:
>> On 30/10/2020 10:56, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Fri, Oct 30, 2020 at 10:31:06AM +0100, Hans Verkuil wrote:
>>>> On 29/10/2020 18:07, Sowjanya Komatineni wrote:
>>>>> On 10/29/20 9:52 AM, Sakari Ailus wrote:
>>>>>> On Thu, Oct 29, 2020 at 09:49:57AM -0700, Sowjanya Komatineni wrote:
>>>>>>> On 10/29/20 8:36 AM, Sowjanya Komatineni wrote:
>>>>>>>> On 10/29/20 7:50 AM, Sakari Ailus wrote:
>>>>>>>>> Hi Sowjanya,
>>>>>>>>>
>>>>>>>>> On Wed, Oct 28, 2020 at 06:48:59PM -0700, Sowjanya Komatineni=20
>>>>>>>>> wrote:
>>>>>>>>>> Hi Sakari,
>>>>>>>>>>
>>>>>>>>>> Missed to add you to below patch series for HDMI2CSI bridge=20
>>>>>>>>>> support
>>>>>>>>>>
>>>>>>>>>> https://patchwork.kernel.org/project/linux-media/cover/160376876=
3-25590-1-git-send-email-skomatineni@nvidia.com/=20
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Patch-10 of this series is for x8 capture from HDMI2CSI bridge.
>>>>>>>>>>
>>>>>>>>>> Would like to get your suggestion on x8 gang/combined ports=20
>>>>>>>>>> capture
>>>>>>>>>> implementation.
>>>>>>>>> The majority of CSI-2 receiver devices support partitioning the
>>>>>>>>> lanes among
>>>>>>>>> different PHYs in various ways. They do support usually up to=20
>>>>>>>>> four
>>>>>>>>> lanes,
>>>>>>>>> but adding four more lanes is not a reason for making the API=20
>>>>>>>>> different.
>>>>>>>>>
>>>>>>>>> So instead, you should implement this as a single port that=20
>>>>>>>>> simply has 8
>>>>>>>>> lanes.
>>>>>>>>>
>>>>>>>> Thanks Sakari for your reply.
>>>>>>>>
>>>>>>>> current v2 series treats as 8 lanes. You mean to not expose 2nd=20
>>>>>>>> port in
>>>>>>>> device tree as VI/CSI side takes care of 2nd port as combined=20
>>>>>>>> to treat
>>>>>>>> as 8 lane?
>>>>>> Correct.
>>>>>>
>>>>>> Although you can have the second port connected if fewer lanes=20
>>>>>> are assigned
>>>>>> to the first one.
>>>>>>
>>>>>> How does it work for this device, are the lanes statically=20
>>>>>> allocated to
>>>>>> ports, apart from the special 8 lane mode?
>>>>> Tegra CSI each port supports max 4 lanes. For x8, 2 x4 ports together
>>>>> are programmed for simultaneous streaming during the same=20
>>>>> video/subdev
>>>>> stream ops.
>>>>>
>>>>> Physically, CSI RX side 4 lanes goes to x4 port and other 4 lanes=20
>>>>> goes
>>>>> to another x4 port.
>>>>>
>>>>> HDMI Bridge TX0 -> CSI RX0 (x4 port)
>>>>>
>>>>> HDMI Bridge TX1 -> CSI RX1 (x4 port)
>>>>>
>>>>> HDMI bridge side single image is split into 2 x4 ports and on RX side
>>>>> image from both ports are captured simultaneously with buffer offsets
>>>>> adjusted side-by-side to get combined image for same video buf of=20
>>>>> video
>>>>> device.
>>>>>
>>>>> Both these 2 x4 ports together are used for streaming by Tegra VI and
>>>>> buffer offsets are adjusted side by side for these ports and for=20
>>>>> video
>>>>> device node stream, its single buffer which contains combined=20
>>>>> image from
>>>>> capture.
>>>>>
>>>>>>> AS csi2 bus type supports max 4 data lanes with endpoint parse API.
>>>>>>>
>>>>>>> Currently with x8 as single port, I am using bus-width with bus=20
>>>>>>> type as
>>>>>>> parallel in device tree and when using x4 using data-lanes with=20
>>>>>>> csi2 bus
>>>>>>> type and driver gets lanes based on either of this from DT.
>>>>>>>
>>>>>>> Instead should we update endpoint parse API for max up to 8=20
>>>>>>> lanes for
>>>>>>> data-lanes?
>>>>>> Yes, please. Could you send a patch?
>>>>>>
>>>>>> The standard AFAIK supports up to four lanes but as we know,=20
>>>>>> hardware
>>>>>> sometimes has more than that.
>>>>> Sure once Hans also agrees with this to have it as single x8 port=20
>>>>> (just
>>>>> like I have now in v2), will send v3 to update endpoint parse to=20
>>>>> allow
>>>>> upto max 8 data-lanes and will also update Tegra CSI driver=20
>>>>> accordingly
>>>>> to retrieve lanes using csi2 bus type.
>>>>>
>>>>> Hans, Please confirm if you agree with this.
>>>>>
>>>> I'm not sure if I agree with this. Shouldn't a device tree reflect the
>>>> hardware? And how would you represent the use case where the ganging
>>>> mode stitches together two synced sensors (left and right) into a=20
>>>> single
>>>> 3D side-by-side image? Then you would have:
>>>>
>>>> =C2=A0 Left Sensor TX -> CSI RX0 (x4 port)
>>>> Right Sensor TX -> CSI RX1 (x4 port)
>>>>
>>>> And for the tc358840 something similar might be true: in the case=20
>>>> of the
>>>> Tegra you have this nice ganging mode available, but for other SoCs=20
>>>> each
>>>> half would have to go to a separate CSI port and captured via a=20
>>>> separate
>>>> video DMA channel, and software or a GPU is needed to combine the two
>>>> halves.
>>>>
>>>> In both these examples it is my understanding that you have to=20
>>>> model this
>>>> in the DT as separate x4 ports.
>>> Do note that a "port" as such is a logical concept. On modern=20
>>> hardware, a
>>> port consists of two or more lanes --- one clock, plus at least one=20
>>> data
>>> lane. Perhaps an example could be useful. For instance, if you have ten
>>> lanes on a device, this could be split into following=20
>>> configurations, based
>>> on the board design:
>>>
>>> configuration \=C2=A0data lanes=C2=A0=C2=A0=C2=A0 port 0=C2=A0=C2=A0=C2=
=A0 port 1=C2=A0=C2=A0=C2=A0 port 2 port 3
>>>
>>> 1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 4=C2=A0=C2=A0=C2=A0 4
>>> 2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 4=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 1
>>> 3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 2
>>> 4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=
=C2=A0 1
>>>
>>> So if you add one more, say:
>>>
>>> 5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 8
>>>
>>> So what we're discussing is just how the lanes are distributed=20
>>> across the
>>> ports.
>>>
>>> There are usually hardware specific limitations how the lanes can be
>>> distributed. The interface we have in DT (data-lanes + clock-lanes
>>> properties) allows describing the hardware in general case, so what the
>>> interface allows may not be possible in hardware, but what hardware
>>> implements is supported by the interface.
>>>
>> So for this particular instance using a single logical 8-lane port would
>> make sense, but in the two other scenarios (left/right sensor or=20
>> supporting
>> tc358840 in a SoC that doesn't support ganging) I described you would=20
>> still
>> have to model it as two 4-lane ports.
>>
>> Is that correct?
>>
>> Regards,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0Hans
>
> Hi Hans,
>
> As its a single image split here, even it comes from 2 TX ports it=20
> goes through same video channel where we adjust video buffer offset to=20
> align side-by-side for combined image.
>
> So if any SoC does not support multiple independent ports (by HW or=20
> logically), then like Sakari mentioned we expose both x4 ports but in=20
> that case they both should be exposed to different video channel (DMA=20
> Buffer allocations).
To be clear, I meant SoC that does not support multiple ports like gang=20
or HW native x8 port in the above point.
>
> With this SW should manage to combine captures from these 2=20
> independent ports and I am not sure if this is feasible or if we ever=20
> had this case implemented by any SoC SW so far as SW overhead will=20
> impact as well but this is different issue.
>
> But isn't most SoC, CSI RX ports are similar instances allowing=20
> parallel captures as any Receiver supporting multiple ports allows=20
> multiple streaming right?
>
Cases we are discussing here are

1. SoC supporting Native x8 or gang ports=C2=A0 on CSI RX: as its single=20
image they go thru same video channel

2. SoC does not support gang ports on CSI RX: In this case, different=20
video channel should be used

So probably, to cope this with both cases, such sensor/bridge drivers=20
should allow creating on CSI TX side both ports as separate (case-2) and=20
also as single port (case-1).


