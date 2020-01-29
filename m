Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3FC314C6E0
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 08:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgA2Har (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 02:30:47 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:46351 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726037AbgA2Har (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 02:30:47 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id who8i06PTn7E5whoCiYCnM; Wed, 29 Jan 2020 08:30:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580283045; bh=Ymu2tkA+YymQp9ttXNnB+FI3y0iQZ0izZlx6CqX4FnE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oVRkpjFBdAIbxDjXsSWQLNBxARYFdENcqI8TsqqEmwy24HbZSx4osSVtorv0a3qcV
         IDmKpk5gFczItVF756ihoRPXaXqdYBKV8qTvVPNmaKrXzV9Mf0vX2czN161PKMZeUN
         Yynq+UPJpSBhcBY9kcd1Aec1qvEBYycM++LKxqdgwMrnnVGheNynSgNbHRfieCEtFs
         iqzpNx7ShSwSxeFwjOcln0WD92ZbvAm3N6ahnDrZBpKucRCE6NWf+8/qoLv215HS16
         dnUzLAj9oLfS3slEOlfpgKjcpybbhLwkcgq6+9/x7zvQGv+qYuVsfJ9njV5lG8ix1a
         +K0C4Atll0agg==
Subject: Re: [RFC] V4L HDR Architecture Proposal
To:     Dylan Yip <dylany@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Vishal Sagar <vsagar@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
        Madhurkiran Harikrishnan <MADHURKI@xilinx.com>,
        Jianqiang Chen <jianqian@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        Cyril Chemparathy <cyrilc@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Subhransu Sekhar Prusty <sprusty@xilinx.com>,
        Anil Kumar Chimbeti <anilchc@xilinx.com>
References: <BYAPR02MB57027075B640D2F530E890E8B00C0@BYAPR02MB5702.namprd02.prod.outlook.com>
 <825d563b-7cb7-5055-d1af-b9b8eba1deb9@xs4all.nl>
 <CY4PR02MB314231543765B9CC09C0735BA70E0@CY4PR02MB3142.namprd02.prod.outlook.com>
 <589f1e75-8925-3482-38d8-e354a067f1db@xs4all.nl>
 <20200124120844.GA4996@pendragon.ideasonboard.com>
 <BYAPR02MB57020B91E827ACC33B50B8AFB0050@BYAPR02MB5702.namprd02.prod.outlook.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <57be8b72-c60b-cb65-7fe0-cb82ab49b0d5@xs4all.nl>
Date:   Wed, 29 Jan 2020 08:30:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB57020B91E827ACC33B50B8AFB0050@BYAPR02MB5702.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGBOeLUZLs8H7RCvPX4zprIipTTbc9iczwE26T+zukTYgdc1Hbg47v6zyo0aj36IEqVXVNeWVWNx2f3GD7WczccS8RQJKwSusXLNm5N/BPS00YqOgqec
 fdCAv471+UOVHyjcW5H4UXXSpJTjAjiym/M7KaevcDna3JtKmgkVzpt4R0lRLHE4jatKXk346bd5UdJiS8nUTJmf/XD90M8J7xjNZ09xWcvruepjo5v1SIje
 ugQjaXfYgmtS2ZL64HwvE95+9oEy3rBpC1mjpeZwT9/ul5lhAmlVUib3mGOkRNIckJWEqLvog0cQe0jkKIh4vL7sSstTZDefn3/i4IrOc206+hnhJgB9DhZc
 pRh7C6VY51GmU5fgN1aId1KSdGFWJoRMli3+7jaXvxrBaxrEsKW17KaObvgE8PzgwTMZMJ+qV7r58tD7BIdDItukHm6F4tKDoiBC39h7BT5kupgV5lPvb4Vs
 rVDHsZVwTxNWXuwN1cm9H4u9xPUd0xU+XWH5H37uh4goCU+CYLV6aCSJEx0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/29/20 7:14 AM, Dylan Yip wrote:
> Hi Laurent, Hans, 
> 
> Thanks for the insights!
> 
>> -----Original Message-----
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Sent: Friday, January 24, 2020 4:09 AM
>> To: Hans Verkuil <hverkuil@xs4all.nl>
>> Cc: Vishal Sagar <vsagar@xilinx.com>; Dylan Yip <dylany@xilinx.com>; linux-
>> media@vger.kernel.org; Varunkumar Allagadapa
>> <VARUNKUM@xilinx.com>; Madhurkiran Harikrishnan
>> <MADHURKI@xilinx.com>; Jianqiang Chen <jianqian@xilinx.com>; Hyun
>> Kwon <hyunk@xilinx.com>; Cyril Chemparathy <cyrilc@xilinx.com>; Sandip
>> Kothari <sandipk@xilinx.com>; Subhransu Sekhar Prusty
>> <sprusty@xilinx.com>; Anil Kumar Chimbeti <anilchc@xilinx.com>
>> Subject: Re: [RFC] V4L HDR Architecture Proposal
>>
>> Hi Hans,
>>
>> On Fri, Jan 24, 2020 at 11:10:06AM +0100, Hans Verkuil wrote:
>>> On 1/24/20 10:04 AM, Vishal Sagar wrote:
>>>> On Thursday, January 23, 2020 6:36 PM, Hans Verkuil wrote:
>>>>> On 1/22/20 9:13 PM, Dylan Yip wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> We are planning to add HDR10 and HDR10+ metadata support into the
>>>>>> V4L
>>>>> framework and were hoping for some feedback before we started
>>>>> implementation.
>>>>>
>>>>> Nice!
>>>>>
>>>>>>
>>>>>> For context, Xilinx HDMI RX IP currently uses a AXI LITE interface
>>>>>> where HDR metadata is obtained from a hardware FIFO. To access
>>>>>> these packets a CPU copy is required.
>>>>>> We are in the process of migrating towards a AXI MM interface
>>>>>> where the hardware will directly write HDR metadata into memory.
>>>>>> Currently the HDMI RX driver (https://github.com/Xilinx/hdmi-
>>>>>> modules/blob/master/hdmi/xilinx-hdmirx.c) is modeled as a v4l
>>>>>> subdev. This is linked to a DMA IP which utilizes the DMA engine
>>>>>> APIs and registers itself as a video node for video data.
>>>>>>
>>>>>> HDR10 will only consist of static metadata which will come once per
>> stream.
>>>>>> However, HDR10+ will have dynamic metadata which can potentially
>>>>>> come once per frame and be up to ~4000 bytes. We would like V4L
>>>>>> architecture to be flexible to support both.
>>>>>
>>>>> The key here is the difference between Extended InfoFrames that can
>>>>> be long and the others, that have a maximum size. The latter should
>>>>> be handled by controls, the first is more difficult.
>>>>
>>>> Are you suggesting to handle static HDR via read only v4l controls in a
>> meta video node?
>>>
>>> Yes. It's very suitable for that purpose.
> 
> So are you saying we should create a separate metadata node and add the v4l control there or would we add the v4l control to the existing video data node? If it is the former, what's the point of creating the metadata node since we won't qbuf/dqbuf to it? 

I'm sorry, I misread your original question. Static HDR should be handled via read only
v4l controls in the existing video node, not in a meta video node.

Regards,

	Hans

> 
> Best,
> Dylan Yip
> 
>>>
>>>>> Can you tell a bit more about how the hardware operates? Are all
>>>>> InfoFrames obtained through the hw fifo, or are some stored in
>>>>> registers and some go through the fifo?
>>>>
>>>> In the current implementation of the HDMI Rx IP, all InfoFrames are read
>> from a register byte by byte which has FIFO at the back.
>>>> The register is accessible by an AXI Lite interface.
>>>> The FIFO can store maximum 8 packets. Each packet is 36 bytes in size (31
>> bytes data and 5 bytes ECC calculated by IP).
>>>> InfoFrames are one type of packets.
>>>
>>> Does one packet correspond to one InfoFrame? Or are they all
>>> concatenated and hacked up into packets for the FIFO?
>>>
>>> This probably won't work well for large Extended InfoFrames of 4kB or
>>> more: the driver would have to be able to read from the FIFO very
>>> quickly in order to prevent data from being lost, right? Hence the
>> development of the AXIMM interface referred to below.
>>>
>>>> There are other types like General Control Packet, Audio Clock
>>>> Regeneration Packet, etc. referred in Table 5-8 packet types in HDMI
>>>> specification v1.4b)
>>>>
>>>> In future we plan on adding an AXIMM interface in the IP to handle
>>>> Dynamic HDR. The tentative behavior will be as below - The driver will
>> provide a buffer pointer to the IP via a register. The IP will dump the
>> infoframes's extracted data into this buffer.
>>>> With Frame sync, IP will return the length of the buffer in the provided
>> buffer.
>>>>
>>>>> Does the hardware set maximum sizes for specific InfoFrames or the
>>>>> total size of all InfoFrames combined? Or can it be any size?
>>>>>
>>>> Hope the above info about FIFO depth for current HDMI Rx IP answers
>> this.
>>>
>>> Right, so the driver will provide the maximum size for all InfoFrames
>>> that can occur between two video frames.
>>>
>>> And the driver will parse the received InfoFrames.
>>>
>>> I am strongly leaning towards using a control for the HDR10+ InfoFrame
>>> as well: it fits well with the Request API where controls can be
>>> cleanly associated with a specific video frame, and the amount of data isn't
>> that large.
>>
>> This however leads me to a simple question: why do we have a metadata API
>> in the first place if everything should go through controls ?
>>
>>> That said, some work in the control framework is probably needed to
>>> streamline things a
>>> bit:
>>>
>>> 1) it should be possible to increase the size of compound controls later if
>> new fields are
>>>    added. This is on the TODO list already since it is desired functionality for
>> codecs.
>>>
>>> 2) tentative, needs research first: add some sort of mechanism to mmap
>> the control
>>>    payload to avoid mem copies. That would make controls much more
>> useful for large metadata.
>>
>> Let's not forget that we would then also need to mmap the control per
>> request, which will become challenging if we want to be able to pre-map
>> everything like we do for buffers instead of mapping and unmapping for
>> every request.
>>
>>> I'm not sure when I will have time to work on that, though.
>>>
>>>>> Does it accept any InfoFrame or only specific InfoFrame types? Or
>>>>> is this programmable?
>>>>
>>>> HDMI Rx IP accepts all types of InfoFrames.
>>>>
>>>>>> We have 2 different proposals that we believe will work:
>>>>>>
>>>>>> A. 2 video node approach (1 for video, 1 for metadata) - This will
>>>>>> align with current v4l metadata structure (i.e. uvc) but will
>>>>>> require our HDMI RX driver to register a subdev and device node
>>>>>> 	a. Our HDMI RX driver will register a v4l subdev (for video data)
>>>>>> and a metadata node
>>>>>> 		i. Is this acceptable?
>>>>>> 	b. Applications will qbuf/dqbuf to both video and metadata nodes
>>>>>> for each frame
>>>>>>
>>>>>> B. 1 video node approach - This will avoid mixing v4l subdev and
>>>>>> v4l device node functionality inside HDMI RX driver but it strays
>>>>>> from current v4l metadata architecture and also changes v4l subdev
>> functionality
>>>>>> 	a. We would add a "read" function to v4l subdev's
>>>>>> 		i. This will also require us to add some "capabilities" field to
>>>>>> subdev or be able to query for the "read" function
>>>>>> 	b. HDMI Rx driver will register a v4l subdev with "read"
>>>>>> function/capability
>>>>>> 	c. Application can directly pass a buffer in the "read" function
>>>>>> to HDMI RX subdev to obtain HDR metadata
>>>>>> 		i. We will need to pass subdev name from application or be
>> able
>>>>>> to query all subdevs for this "read" capability, is this acceptable?
>>>>>>
>>>>>> Please let me know your opinions on which approach is best or
>>>>>> propose another approach if these 2 are unfit. Thanks
>>
>> --
>> Regards,
>>
>> Laurent Pinchart

