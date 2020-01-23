Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61EF71468A9
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 14:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgAWNGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 08:06:14 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:41345 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726170AbgAWNGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 08:06:14 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ucBWiMNNOpLtbucBXiQVCI; Thu, 23 Jan 2020 14:06:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579784772; bh=su7DqFQhNPX7Y6l06govR8qC56VQ1s8opEZPbx/RHZs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Kpp4Irtrb1g61eIlzRiGthSG9Al6MqtVFH9Vludyz+vX9TJymBH6wDUVIipMw6OBS
         ba5yQHC5yDZTwl5xF9R+FNUApWurxSYKQB5j28VfbOrA6JN4OJVZaUHQQfmoJeDptP
         KuZxpyE4XoiUvO9tD3jXKkhd7nPlyM41eUCychJWex6I//XUsNbplALIQBMQPkucts
         NBYkeAxdDp9qsDZmExnUcFYP7DiUAuw97aGdtbr/RmbVWlRNV8KSD3/kkKwOUxWIV1
         GT/em44lxioD8UTmRj3sSobRKhevWc0Yyq1eP5L9Bcs0GLfXRTAKVWOGbb7wE7dNH4
         uBtNHrQ0VfgkQ==
Subject: Re: [RFC] V4L HDR Architecture Proposal
To:     Dylan Yip <dylany@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
        Madhurkiran Harikrishnan <MADHURKI@xilinx.com>,
        Jianqiang Chen <jianqian@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        Cyril Chemparathy <cyrilc@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Subhransu Sekhar Prusty <sprusty@xilinx.com>
References: <BYAPR02MB57027075B640D2F530E890E8B00C0@BYAPR02MB5702.namprd02.prod.outlook.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <825d563b-7cb7-5055-d1af-b9b8eba1deb9@xs4all.nl>
Date:   Thu, 23 Jan 2020 14:06:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB57027075B640D2F530E890E8B00C0@BYAPR02MB5702.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI5xOFeFpkHYW3zGtu8fiGXfXjNYhXDdzR3pGiHha3ZUWtRDh4foD7u6sA49/PJSB8KI/c0ddYOb396NoQWYjPmekL0N2vSIr1O+QrwfvRGc/35DidIL
 7aiI65OqmiJC9lL7srGR1MLgEFSWpxdhp8xAVDx48pyx8UpmPeUztKBlPew/FgMV4RVUbGYVCDv8T020L4IflxPdG9qucuMjgjBLSG4gR3ucx+P422a5IgLN
 k9CuvAedBeFUBfirkVGSBO2CkiIE4ECDnVaq1ZPEYgsJR3Pd8yZnRmscj3moWhm/zE9/Jl8PjJPvFk2XRNDZz+1jjsMFvSTPzo+VaxwITVwwiK71/ry9ZYus
 P5D2viYZ5/95lLTfp+eTiJw9312IJERmAna3rji0/Zom6J/EOghhgVCSqgydYYvs0LM8butTZifRy+zxzyGftlRAO5F4grPkr40ToVe0dhBD2EsrL861SRIl
 9rzsAdrTC2Hkx4iS9PayByW4bNLNVn8WmmRYgh2KpKv1gkJ3JVuWjQvkFqAyJt1x+IhVvizQ3Xb1Pm+Y3AJJQ8pBg93wen2jz9I+GR+F+zVlM72DjA3ISVfn
 Xz0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dylan,

On 1/22/20 9:13 PM, Dylan Yip wrote:
> Hi All,
> 
> We are planning to add HDR10 and HDR10+ metadata support into the V4L framework and were hoping for some feedback before we started implementation.

Nice!

> 
> For context, Xilinx HDMI RX IP currently uses a AXI LITE interface where HDR metadata is obtained from a hardware FIFO. To access these packets a CPU copy is required. 
> We are in the process of migrating towards a AXI MM interface where the hardware will directly write HDR metadata into memory. 
> Currently the HDMI RX driver (https://github.com/Xilinx/hdmi-modules/blob/master/hdmi/xilinx-hdmirx.c) is modeled as a v4l subdev. This is linked to a DMA IP which utilizes the DMA engine APIs and registers itself as a video node for video data. 
> 
> HDR10 will only consist of static metadata which will come once per stream. However, HDR10+ will have dynamic metadata which can potentially come once per frame and be up to ~4000 bytes. We would like V4L architecture to be flexible to support both. 

The key here is the difference between Extended InfoFrames that can be long and the others, that
have a maximum size. The latter should be handled by controls, the first is more difficult.

Can you tell a bit more about how the hardware operates? Are all InfoFrames obtained through the hw
fifo, or are some stored in registers and some go through the fifo?

Does the hardware set maximum sizes for specific InfoFrames or the total size of all InfoFrames
combined? Or can it be any size?

Does it accept any InfoFrame or only specific InfoFrame types? Or is this programmable?

Regards,

	Hans

> 
> We have 2 different proposals that we believe will work:
> 
> A. 2 video node approach (1 for video, 1 for metadata) - This will align with current v4l metadata structure (i.e. uvc) but will require our HDMI RX driver to register a subdev and device node
> 	a. Our HDMI RX driver will register a v4l subdev (for video data) and a metadata node
> 		i. Is this acceptable?
> 	b. Applications will qbuf/dqbuf to both video and metadata nodes for each frame
> 
> B. 1 video node approach - This will avoid mixing v4l subdev and v4l device node functionality inside HDMI RX driver but it strays from current v4l metadata architecture and also changes v4l subdev functionality
> 	a. We would add a "read" function to v4l subdev's
> 		i. This will also require us to add some "capabilities" field to subdev or be able to query for the "read" function
> 	b. HDMI Rx driver will register a v4l subdev with "read" function/capability
> 	c. Application can directly pass a buffer in the "read" function to HDMI RX subdev to obtain HDR metadata
> 		i. We will need to pass subdev name from application or be able to query all subdevs for this "read" capability, is this acceptable?
> 
> Please let me know your opinions on which approach is best or propose another approach if these 2 are unfit. Thanks
> 
> Best,
> Dylan Yip
> 

