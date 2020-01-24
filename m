Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 595E4147E82
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 11:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733114AbgAXKKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 05:10:11 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43375 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730743AbgAXKKL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 05:10:11 -0500
Received: from [IPv6:2001:983:e9a7:1:dded:8f92:97b:fe6e]
 ([IPv6:2001:983:e9a7:1:dded:8f92:97b:fe6e])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uvugivC0ErNgyuvuhi4GSd; Fri, 24 Jan 2020 11:10:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579860608; bh=JFKQaIHHAYzJs6oo9YZJcJUTPk6awcdWXVTQ4t7cJ58=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Brd9aJJ53ugsmKfDT0Sn69HdkX9psGCHD2DG1MzEe5cIgUOmenN6YT+cXBMO4yiXO
         UG7DXhDvy2Dysk0O3eKSwaL5xFlC05pjasLELInrTLpwOq2xPp/Ul6MEAHfAC0JVMB
         VLlBVRTEyDhqZPmK/w/tPaF1RbbtYpB8R/Y0Q18g0DOrzvjSSkkFNAJwJIBqagWrs0
         rCSiqMnPNfqOro9UzU97O9czX0XfW2/2QhRz4gs2tjy7KJET0rlTMAVP3h2hXxdvSx
         eRLJry4YXuaONMlpUuM80oNmFFFBqDu52+jEikdojNmwgeWWTHa4f59d5P7BZG/wQd
         hP9nVdbjJqJug==
Subject: Re: [RFC] V4L HDR Architecture Proposal
To:     Vishal Sagar <vsagar@xilinx.com>, Dylan Yip <dylany@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <589f1e75-8925-3482-38d8-e354a067f1db@xs4all.nl>
Date:   Fri, 24 Jan 2020 11:10:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CY4PR02MB314231543765B9CC09C0735BA70E0@CY4PR02MB3142.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKttc3F+ZCycL4RI7nbvXY/fj+Uabi5h2ITaniQ7Sl4knA9atPocdO1Y8tyhGvQvBUBXen3hek1dy0BkYMXeW6BbRusxS5rBBNmdyMOMxYoycs006OIV
 MoIDjfeJ5LN1f2cyLynx9sXlI98qec730uk2aVW57WzGf5SinmhzdgITJZ6pxN1XGvUVrGe27c44gbiuVn/LJLk3OlzZ7K10u0wzScku1C+6gdGrclQ7Yy7B
 XXzeALXNPym+BQa3zaHqAUJzVbXLExhG7KklhBdmPYsTsV6y0wI9fpLnglKpfGI0ptniaQguHzVg5xz9DG/q+JA6KsvJW5Cx4q/6k8o79gQdYqKRDlQCUou8
 ge9J7WI86dOwk59GOYz8ETh1P29EMQJ/e7BAlHkMPpC37IW4kX/9XvXhvPsxa4kXWENVl4zZa6V5IDYtJBChI0WPXtSxUIfBT/o7Svv2/zebhwJGHNp3hbYj
 t5El/cdRsWzqrKSbIVBw3d57KG9KqbXR1wCGGcE29pY3zy2q/u1567rNN8fd5DvGuRgOrcQoCW3NrbaLYASAn4W74lMLIbcFRnTo26fuEv1abR02Jma+SQ+5
 5wm7MC4Dhr1IKWqodAwpkW93
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/24/20 10:04 AM, Vishal Sagar wrote:
> Hi Hans,
> 
> Thanks for your response!
> 
>> -----Original Message-----
>> From: linux-media-owner@vger.kernel.org <linux-media-
>> owner@vger.kernel.org> On Behalf Of Hans Verkuil
>> Sent: Thursday, January 23, 2020 6:36 PM
>> To: Dylan Yip <dylany@xilinx.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; linux-media@vger.kernel.org
>> Cc: Varunkumar Allagadapa <VARUNKUM@xilinx.com>; Madhurkiran
>> Harikrishnan <MADHURKI@xilinx.com>; Jianqiang Chen
>> <jianqian@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>; Cyril Chemparathy
>> <cyrilc@xilinx.com>; Vishal Sagar <vsagar@xilinx.com>; Sandip Kothari
>> <sandipk@xilinx.com>; Subhransu Sekhar Prusty <sprusty@xilinx.com>
>> Subject: Re: [RFC] V4L HDR Architecture Proposal
>>
>> Hi Dylan,
>>
>> On 1/22/20 9:13 PM, Dylan Yip wrote:
>>> Hi All,
>>>
>>> We are planning to add HDR10 and HDR10+ metadata support into the V4L
>> framework and were hoping for some feedback before we started
>> implementation.
>>
>> Nice!
>>
>>>
>>> For context, Xilinx HDMI RX IP currently uses a AXI LITE interface where
>> HDR metadata is obtained from a hardware FIFO. To access these packets a
>> CPU copy is required.
>>> We are in the process of migrating towards a AXI MM interface where the
>> hardware will directly write HDR metadata into memory.
>>> Currently the HDMI RX driver (https://github.com/Xilinx/hdmi-
>> modules/blob/master/hdmi/xilinx-hdmirx.c) is modeled as a v4l subdev. This
>> is linked to a DMA IP which utilizes the DMA engine APIs and registers itself
>> as a video node for video data.
>>>
>>> HDR10 will only consist of static metadata which will come once per stream.
>> However, HDR10+ will have dynamic metadata which can potentially come
>> once per frame and be up to ~4000 bytes. We would like V4L architecture to
>> be flexible to support both.
>>
>> The key here is the difference between Extended InfoFrames that can be
>> long and the others, that have a maximum size. The latter should be handled
>> by controls, the first is more difficult.
>>
> 
> Are you suggesting to handle static HDR via read only v4l controls in a meta video node?

Yes. It's very suitable for that purpose.

> 
>> Can you tell a bit more about how the hardware operates? Are all InfoFrames
>> obtained through the hw fifo, or are some stored in registers and some go
>> through the fifo?
>>
> 
> In the current implementation of the HDMI Rx IP, all InfoFrames are read from a register byte by byte which has FIFO at the back.
> The register is accessible by an AXI Lite interface.
> The FIFO can store maximum 8 packets. Each packet is 36 bytes in size (31 bytes data and 5 bytes ECC calculated by IP). 
> InfoFrames are one type of packets. 

Does one packet correspond to one InfoFrame? Or are they all concatenated and hacked up
into packets for the FIFO?

This probably won't work well for large Extended InfoFrames of 4kB or more: the driver
would have to be able to read from the FIFO very quickly in order to prevent data from
being lost, right? Hence the development of the AXIMM interface referred to below.

> There are other types like General Control Packet, Audio Clock Regeneration Packet, etc. referred in Table 5-8 packet types in HDMI specification v1.4b)
> 
> In future we plan on adding an AXIMM interface in the IP to handle Dynamic HDR. The tentative behavior will be as below -
> The driver will provide a buffer pointer to the IP via a register. The IP will dump the infoframes's extracted data into this buffer. 
> With Frame sync, IP will return the length of the buffer in the provided buffer.
> 
>> Does the hardware set maximum sizes for specific InfoFrames or the total
>> size of all InfoFrames combined? Or can it be any size?
>>
> Hope the above info about FIFO depth for current HDMI Rx IP answers this.

Right, so the driver will provide the maximum size for all InfoFrames that can occur
between two video frames.

And the driver will parse the received InfoFrames.

I am strongly leaning towards using a control for the HDR10+ InfoFrame as well: it fits
well with the Request API where controls can be cleanly associated with a specific video
frame, and the amount of data isn't that large.

That said, some work in the control framework is probably needed to streamline things a
bit:

1) it should be possible to increase the size of compound controls later if new fields are
   added. This is on the TODO list already since it is desired functionality for codecs.

2) tentative, needs research first: add some sort of mechanism to mmap the control
   payload to avoid mem copies. That would make controls much more useful for large metadata.

I'm not sure when I will have time to work on that, though.

Regards,

	Hans

>  
>> Does it accept any InfoFrame or only specific InfoFrame types? Or is this
>> programmable?
>>
> 
> HDMI Rx IP accepts all types of InfoFrames.
> 
> Regards
> Vishal Sagar
> 
>> Regards,
>>
>> 	Hans
>>
>>>
>>> We have 2 different proposals that we believe will work:
>>>
>>> A. 2 video node approach (1 for video, 1 for metadata) - This will align with
>> current v4l metadata structure (i.e. uvc) but will require our HDMI RX driver
>> to register a subdev and device node
>>> 	a. Our HDMI RX driver will register a v4l subdev (for video data) and a
>> metadata node
>>> 		i. Is this acceptable?
>>> 	b. Applications will qbuf/dqbuf to both video and metadata nodes for
>>> each frame
>>>
>>> B. 1 video node approach - This will avoid mixing v4l subdev and v4l device
>> node functionality inside HDMI RX driver but it strays from current v4l
>> metadata architecture and also changes v4l subdev functionality
>>> 	a. We would add a "read" function to v4l subdev's
>>> 		i. This will also require us to add some "capabilities" field to
>> subdev or be able to query for the "read" function
>>> 	b. HDMI Rx driver will register a v4l subdev with "read"
>> function/capability
>>> 	c. Application can directly pass a buffer in the "read" function to
>> HDMI RX subdev to obtain HDR metadata
>>> 		i. We will need to pass subdev name from application or be
>> able to query all subdevs for this "read" capability, is this acceptable?
>>>
>>> Please let me know your opinions on which approach is best or propose
>>> another approach if these 2 are unfit. Thanks
>>>
>>> Best,
>>> Dylan Yip
>>>
> 

