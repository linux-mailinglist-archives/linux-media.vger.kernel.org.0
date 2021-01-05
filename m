Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF252EA834
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 11:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbhAEKHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 05:07:25 -0500
Received: from 2.mo7.mail-out.ovh.net ([87.98.143.68]:60654 "EHLO
        2.mo7.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbhAEKHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 05:07:25 -0500
X-Greylist: delayed 1007 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Jan 2021 05:07:23 EST
Received: from player795.ha.ovh.net (unknown [10.108.57.153])
        by mo7.mail-out.ovh.net (Postfix) with ESMTP id 0D3C318B179
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 10:49:54 +0100 (CET)
Received: from armadeus.com (lfbn-str-1-77-132.w92-140.abo.wanadoo.fr [92.140.204.132])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player795.ha.ovh.net (Postfix) with ESMTPSA id D116819835778;
        Tue,  5 Jan 2021 09:49:45 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-98R002ead48691-cac1-4d8c-bfce-ab47e901812a,
                    85B3575ABCBC7C1193A4E82C4493561B47B7877E) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.140.204.132
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
 <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
From:   =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com>
Date:   Tue, 5 Jan 2021 10:49:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3909687428350628894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdefhedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepuforsggrshhtihgvnhgpufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepkeejveeiffelfeegleetleevgeeifeeugedugeejgfehjeetkeetjeegieeugeejnecuffhomhgrihhnpehprghsthgvsghinhdrtghomhenucfkpheptddrtddrtddrtddpledvrddugedtrddvtdegrddufedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 1/5/21 12:56 AM, Fabio Estevam wrote:
> Hi Sébastien,
> 
> On Mon, Jan 4, 2021 at 8:15 PM Fabio Estevam <festevam@gmail.com> wrote:
> 
>> Could you please share your imx6ul board dts file that you used to
>> test camera capture?
> 
> This dts allows csi to probe fine now:
> https://pastebin.com/raw/7GK5dAWD
> 
>> Were you able to capture via Gstreamer? If so, please also share the
>> media-ctl and gst pipelines that you used.
> 
> I am trying to capture via Gstreamer now. If you managed to get it
> working, please share your media-ctl setup and Gst pipeline.

I just tried it with kernel 5.4.84 with the following device tree (from
mainline kernel):
https://pastebin.com/w00EWZa5

I configured the pipelines with:
media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
media-ctl -l "'csi':1 -> 'csi capture':0[1]"
media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_2X8/640x480 field:none]"

The topology is then:

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range]
                <- "ov5640 1-003c":0 [ENABLED]
        pad1: Source
                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range]
                -> "csi capture":0 [ENABLED]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
        pad0: Sink
                <- "csi":1 [ENABLED]

- entity 10: ov5640 1-003c (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev1
        pad0: Source
                [fmt:UYVY8_2X8/640x480@1/30 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range]
                -> "csi":0 [ENABLED]

I used the following gstreamer pipeline to stream on the framebuffer:

gst-launch-1.0 v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink

Regards,

> 
> Thanks for your help!
> 


-- 
Sébastien Szymanski, Armadeus Systems
Software engineer
