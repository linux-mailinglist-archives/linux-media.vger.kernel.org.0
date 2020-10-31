Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C878B2A1503
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 10:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgJaJ57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 05:57:59 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46565 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726580AbgJaJ57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 05:57:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YndwktnDVWvjMYne0kJWJ5; Sat, 31 Oct 2020 10:57:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604138276; bh=ppzM36EWvZxzr9SQsgshcXj9K5eECWb+y061duIGk3Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X3m2Pjo5tA4mlKK/Hd/8XHdiitch4uuxC0AZNgUSMYFyU+Pji8Xzl6JLT1IEedqbC
         3uBTIKZ7MxnzWxKFqqtSOfxjDIK6pp/9zi5FkItprQaF9bwscbdPfNRaIdRPpco+N/
         EEaF76gLN3lXe9qhGL3vWTkAZcJfKHnUMuJpBV+gieaJUBgifHZ36R339nOVYoOWsy
         UBJqTODfrzK+7Dx/82P8eKX0V91CXcSYRsaGZieK0m1CW+JvJtidIeOJ9pp/u9K5cA
         JBzLG6GcV1Gz/+N22XOEvTKYN73vQfivgVLGNTQAlZpAjp0weNYAcpzS6QST2EBpW1
         56w1fYsJvhAYg==
Subject: Re: Suggestion regarding x8 gang mode device tree changes
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-media@vger.kernel.org
References: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
 <20201029145013.GA6899@valkosipuli.retiisi.org.uk>
 <59f91ac7-84fc-a9fd-e331-35adf4e5f5b9@nvidia.com>
 <2ac2eb3d-32df-a352-3ce5-918ddbf718af@nvidia.com>
 <20201029165245.GB6899@valkosipuli.retiisi.org.uk>
 <542bbb61-049e-85d8-c2d7-9f38e6625b3d@nvidia.com>
 <7f64c771-a4ff-8909-4679-1cec58947e94@xs4all.nl>
 <20201030095642.GC6899@valkosipuli.retiisi.org.uk>
 <73cce478-c7b0-43b5-9c87-211b4a7c5b6b@xs4all.nl>
 <20201030223124.GE6899@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5246283a-6cec-cb47-9715-a461fa5961f8@xs4all.nl>
Date:   Sat, 31 Oct 2020 10:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030223124.GE6899@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfA3GBvJ/jw6QgjO+XvUf/tTfO6rHVyW+R9h329epKVZexwxmDp5lC6U/oNOi1S+nBBHdov4btdTmo50ldEdRMcjUUtBsToEO3YqpA2ATx84Z3MuAsq+Q
 nNk9WViWGKQW6z1DWMpGTEH4nGRFCeMzx3a7tHQhdZO6Y3kPmcs1b2M1RhFMednDgEGBYyttmKg79Ni83K4nV/RSKe4Xsg9A4dpY9czasOnmBhQG/wCjm1bu
 B6wQpWeOJTH/Edjtx/2wX84JK6sRH+UpluaTOfKdhGM7VvaKTX6A7SKoy44WHeLn
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/10/2020 23:31, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Oct 30, 2020 at 11:06:18AM +0100, Hans Verkuil wrote:
>> On 30/10/2020 10:56, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Fri, Oct 30, 2020 at 10:31:06AM +0100, Hans Verkuil wrote:
>>>> On 29/10/2020 18:07, Sowjanya Komatineni wrote:
>>>>>
>>>>> On 10/29/20 9:52 AM, Sakari Ailus wrote:
>>>>>> On Thu, Oct 29, 2020 at 09:49:57AM -0700, Sowjanya Komatineni wrote:
>>>>>>> On 10/29/20 8:36 AM, Sowjanya Komatineni wrote:
>>>>>>>> On 10/29/20 7:50 AM, Sakari Ailus wrote:
>>>>>>>>> Hi Sowjanya,
>>>>>>>>>
>>>>>>>>> On Wed, Oct 28, 2020 at 06:48:59PM -0700, Sowjanya Komatineni wrote:
>>>>>>>>>> Hi Sakari,
>>>>>>>>>>
>>>>>>>>>> Missed to add you to below patch series for HDMI2CSI bridge support
>>>>>>>>>>
>>>>>>>>>> https://patchwork.kernel.org/project/linux-media/cover/1603768763-25590-1-git-send-email-skomatineni@nvidia.com/
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Patch-10 of this series is for x8 capture from HDMI2CSI bridge.
>>>>>>>>>>
>>>>>>>>>> Would like to get your suggestion on x8 gang/combined ports capture
>>>>>>>>>> implementation.
>>>>>>>>> The majority of CSI-2 receiver devices support partitioning the
>>>>>>>>> lanes among
>>>>>>>>> different PHYs in various ways. They do support usually up to four
>>>>>>>>> lanes,
>>>>>>>>> but adding four more lanes is not a reason for making the API different.
>>>>>>>>>
>>>>>>>>> So instead, you should implement this as a single port that simply has 8
>>>>>>>>> lanes.
>>>>>>>>>
>>>>>>>> Thanks Sakari for your reply.
>>>>>>>>
>>>>>>>> current v2 series treats as 8 lanes. You mean to not expose 2nd port in
>>>>>>>> device tree as VI/CSI side takes care of 2nd port as combined to treat
>>>>>>>> as 8 lane?
>>>>>> Correct.
>>>>>>
>>>>>> Although you can have the second port connected if fewer lanes are assigned
>>>>>> to the first one.
>>>>>>
>>>>>> How does it work for this device, are the lanes statically allocated to
>>>>>> ports, apart from the special 8 lane mode?
>>>>>
>>>>> Tegra CSI each port supports max 4 lanes. For x8, 2 x4 ports together 
>>>>> are programmed for simultaneous streaming during the same video/subdev 
>>>>> stream ops.
>>>>>
>>>>> Physically, CSI RX side 4 lanes goes to x4 port and other 4 lanes goes 
>>>>> to another x4 port.
>>>>>
>>>>> HDMI Bridge TX0 -> CSI RX0 (x4 port)
>>>>>
>>>>> HDMI Bridge TX1 -> CSI RX1 (x4 port)
>>>>>
>>>>> HDMI bridge side single image is split into 2 x4 ports and on RX side 
>>>>> image from both ports are captured simultaneously with buffer offsets 
>>>>> adjusted side-by-side to get combined image for same video buf of video 
>>>>> device.
>>>>>
>>>>> Both these 2 x4 ports together are used for streaming by Tegra VI and 
>>>>> buffer offsets are adjusted side by side for these ports and for video 
>>>>> device node stream, its single buffer which contains combined image from 
>>>>> capture.
>>>>>
>>>>>>> AS csi2 bus type supports max 4 data lanes with endpoint parse API.
>>>>>>>
>>>>>>> Currently with x8 as single port, I am using bus-width with bus type as
>>>>>>> parallel in device tree and when using x4 using data-lanes with csi2 bus
>>>>>>> type and driver gets lanes based on either of this from DT.
>>>>>>>
>>>>>>> Instead should we update endpoint parse API for max up to 8 lanes for
>>>>>>> data-lanes?
>>>>>> Yes, please. Could you send a patch?
>>>>>>
>>>>>> The standard AFAIK supports up to four lanes but as we know, hardware
>>>>>> sometimes has more than that.
>>>>>
>>>>> Sure once Hans also agrees with this to have it as single x8 port (just 
>>>>> like I have now in v2), will send v3 to update endpoint parse to allow 
>>>>> upto max 8 data-lanes and will also update Tegra CSI driver accordingly 
>>>>> to retrieve lanes using csi2 bus type.
>>>>>
>>>>> Hans, Please confirm if you agree with this.
>>>>>
>>>>
>>>> I'm not sure if I agree with this. Shouldn't a device tree reflect the
>>>> hardware? And how would you represent the use case where the ganging
>>>> mode stitches together two synced sensors (left and right) into a single
>>>> 3D side-by-side image? Then you would have:
>>>>
>>>>  Left Sensor TX -> CSI RX0 (x4 port)
>>>> Right Sensor TX -> CSI RX1 (x4 port)
>>>>
>>>> And for the tc358840 something similar might be true: in the case of the
>>>> Tegra you have this nice ganging mode available, but for other SoCs each
>>>> half would have to go to a separate CSI port and captured via a separate
>>>> video DMA channel, and software or a GPU is needed to combine the two
>>>> halves.
>>>>
>>>> In both these examples it is my understanding that you have to model this
>>>> in the DT as separate x4 ports.
>>>
>>> Do note that a "port" as such is a logical concept. On modern hardware, a
>>> port consists of two or more lanes --- one clock, plus at least one data
>>> lane. Perhaps an example could be useful. For instance, if you have ten
>>> lanes on a device, this could be split into following configurations, based
>>> on the board design:
>>>
>>> configuration \ data lanes	port 0	port 1	port 2	port 3
>>>
>>> 1:				4	4
>>> 2:				4	2	1
>>> 3:				2	2	2
>>> 4:				2	2	1	1
>>>
>>> So if you add one more, say:
>>>
>>> 5:				8
>>>
>>> So what we're discussing is just how the lanes are distributed across the
>>> ports.
>>>
>>> There are usually hardware specific limitations how the lanes can be
>>> distributed. The interface we have in DT (data-lanes + clock-lanes
>>> properties) allows describing the hardware in general case, so what the
>>> interface allows may not be possible in hardware, but what hardware
>>> implements is supported by the interface.
>>>
>>
>> So for this particular instance using a single logical 8-lane port would
>> make sense, but in the two other scenarios (left/right sensor or supporting
>> tc358840 in a SoC that doesn't support ganging) I described you would still
>> have to model it as two 4-lane ports.
> 
> If you have two sensors, yes, then it'll be two separate ports; one sensor
> connected to each of them. The streams are usually separate, but other
> kinds of implementations exist. Still, they generally have no effect on
> CSI-2 bus configuration.
> 

OK, then we go with increasing the number of data lanes to 8.

Regards,

	Hans
