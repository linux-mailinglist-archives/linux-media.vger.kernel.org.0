Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487BC29F295
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 18:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgJ2RHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 13:07:46 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5549 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgJ2RHp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 13:07:45 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9af6e40003>; Thu, 29 Oct 2020 10:07:48 -0700
Received: from [10.2.62.160] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 17:07:45 +0000
Subject: Re: Suggestion regarding x8 gang mode device tree changes
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <treding@nvidia.com>,
        <linux-media@vger.kernel.org>
References: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
 <20201029145013.GA6899@valkosipuli.retiisi.org.uk>
 <59f91ac7-84fc-a9fd-e331-35adf4e5f5b9@nvidia.com>
 <2ac2eb3d-32df-a352-3ce5-918ddbf718af@nvidia.com>
 <20201029165245.GB6899@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <542bbb61-049e-85d8-c2d7-9f38e6625b3d@nvidia.com>
Date:   Thu, 29 Oct 2020 10:07:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029165245.GB6899@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603991268; bh=RzTHfeolkDhQAv2m3eIq4C/ogbzNHSQr0qYAD1rZDEM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=IGlbJMVNduZMXzSV1kYUyVlfkfqaPMjIe+duna4KTMro5jNoJTYIvcOYybNqliMc4
         9mTvrIYmDBIdQ9uYpoY8J7OzIsagvgoZ0pQlXtmjudL26zEvT9nSVY4Q93tkxosxx/
         UhllQ1A0C4DPkK+nNzLDzs49D81MJEXk1BQvPsOgt34Uhk+dlbeOojr57orew/dCCq
         /bG3REATWBww11tAAyvxIXo95fOpdw1I2xHOhxPH8XWnxESVxn166CWMOJKJpi5JT1
         MU7RjPPulWmbMP9pZT4pa13tEWPy7bflY++PP7s/OCU63qxvcrVOhu3AuWvDldqaSB
         RNBtMUtC2JZCQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 10/29/20 9:52 AM, Sakari Ailus wrote:
> On Thu, Oct 29, 2020 at 09:49:57AM -0700, Sowjanya Komatineni wrote:
>> On 10/29/20 8:36 AM, Sowjanya Komatineni wrote:
>>> On 10/29/20 7:50 AM, Sakari Ailus wrote:
>>>> Hi Sowjanya,
>>>>
>>>> On Wed, Oct 28, 2020 at 06:48:59PM -0700, Sowjanya Komatineni wrote:
>>>>> Hi Sakari,
>>>>>
>>>>> Missed to add you to below patch series for HDMI2CSI bridge support
>>>>>
>>>>> https://patchwork.kernel.org/project/linux-media/cover/1603768763-25590-1-git-send-email-skomatineni@nvidia.com/
>>>>>
>>>>>
>>>>> Patch-10 of this series is for x8 capture from HDMI2CSI bridge.
>>>>>
>>>>> Would like to get your suggestion on x8 gang/combined ports capture
>>>>> implementation.
>>>> The majority of CSI-2 receiver devices support partitioning the
>>>> lanes among
>>>> different PHYs in various ways. They do support usually up to four
>>>> lanes,
>>>> but adding four more lanes is not a reason for making the API different.
>>>>
>>>> So instead, you should implement this as a single port that simply has 8
>>>> lanes.
>>>>
>>> Thanks Sakari for your reply.
>>>
>>> current v2 series treats as 8 lanes. You mean to not expose 2nd port in
>>> device tree as VI/CSI side takes care of 2nd port as combined to treat
>>> as 8 lane?
> Correct.
>
> Although you can have the second port connected if fewer lanes are assigned
> to the first one.
>
> How does it work for this device, are the lanes statically allocated to
> ports, apart from the special 8 lane mode?

Tegra CSI each port supports max 4 lanes. For x8, 2 x4 ports together 
are programmed for simultaneous streaming during the same video/subdev 
stream ops.

Physically, CSI RX side 4 lanes goes to x4 port and other 4 lanes goes 
to another x4 port.

HDMI Bridge TX0 -> CSI RX0 (x4 port)

HDMI Bridge TX1 -> CSI RX1 (x4 port)

HDMI bridge side single image is split into 2 x4 ports and on RX side 
image from both ports are captured simultaneously with buffer offsets 
adjusted side-by-side to get combined image for same video buf of video 
device.

Both these 2 x4 ports together are used for streaming by Tegra VI and 
buffer offsets are adjusted side by side for these ports and for video 
device node stream, its single buffer which contains combined image from 
capture.

>> AS csi2 bus type supports max 4 data lanes with endpoint parse API.
>>
>> Currently with x8 as single port, I am using bus-width with bus type as
>> parallel in device tree and when using x4 using data-lanes with csi2 bus
>> type and driver gets lanes based on either of this from DT.
>>
>> Instead should we update endpoint parse API for max up to 8 lanes for
>> data-lanes?
> Yes, please. Could you send a patch?
>
> The standard AFAIK supports up to four lanes but as we know, hardware
> sometimes has more than that.

Sure once Hans also agrees with this to have it as single x8 port (just 
like I have now in v2), will send v3 to update endpoint parse to allow 
upto max 8 data-lanes and will also update Tegra CSI driver accordingly 
to retrieve lanes using csi2 bus type.

Hans, Please confirm if you agree with this.

