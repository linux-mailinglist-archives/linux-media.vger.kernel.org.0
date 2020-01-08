Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB4E11345E5
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 16:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgAHPPb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 10:15:31 -0500
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:43505 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbgAHPPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 10:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=FNzFi/EcyGrtsyvw5xdP4nm1o8qsGg4d42d45TMi1zc=;
        b=JoZuPIXfmVMHmYBpgmG/X6eYGTg2lx8vIVnAZw2dcJ9rEOyo0UFUwPQmmGTGSizcnqJD
        tupfhhweZHayNJAWCAcLHQBJTs5gIteDGEJdIH0Y4yzXG6l/Ili0cNOAn7EnZiHKYlR/Fh
        xQaOrYTt/jL0LnX4ynVcgPqFJnSGds1J4=
Received: by filterdrecv-p3mdw1-56c97568b5-f2xng with SMTP id filterdrecv-p3mdw1-56c97568b5-f2xng-18-5E15F0E3-59
        2020-01-08 15:10:27.466849442 +0000 UTC m=+1952840.551967702
Received: from [80.251.203.67] (unknown [80.251.203.67])
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP id LdEapv0HQIiUSkUxFUDRww
        Wed, 08 Jan 2020 15:10:27.165 +0000 (UTC)
Subject: Re: [PATCH v3 2/5] media: hantro: Reduce H264 extra space for motion
 vectors
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191106223408.2176-1-jonas@kwiboo.se>
 <HE1PR06MB4011FF930111A869E4645C8CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5CSWea=DNjySJxZmVi+2c5U4EKVPa1mf3vHh70+YrAQCA@mail.gmail.com>
 <7b92111b0c6443653de45f1eeec867645c127f32.camel@collabora.com>
 <CAAFQd5CZo5g2gtuvU+OuoRj18ZcCH8XEinGyAjRxqUXRfSQhgg@mail.gmail.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <9606106c-5c49-cbc1-cb8f-0389ff8281bd@kwiboo.se>
Date:   Wed, 08 Jan 2020 15:10:27 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CZo5g2gtuvU+OuoRj18ZcCH8XEinGyAjRxqUXRfSQhgg@mail.gmail.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hw4wwBUrflS0pBfMy?=
 =?us-ascii?Q?kCNRb7VG1Hvipht9ko5YRiRt2MGcELKDFGENYUR?=
 =?us-ascii?Q?mSBZLGqIZZIsFu0QQJoCC=2F5A8McuNFFYNNty8TN?=
 =?us-ascii?Q?582di=2Fhx8F5aoarFMrmb+bCfFwrQCtsVohPbuTD?=
 =?us-ascii?Q?XE35V521Q8f3yUMP3uAXB6hvLEjI2kwbZVE8ndU?=
 =?us-ascii?Q?mPG8agcN=2FVIFTzrcFoI=2FA=3D=3D?=
To:     Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-01-08 13:59, Tomasz Figa wrote:
> On Tue, Dec 10, 2019 at 3:11 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>>
>> On Wed, 2019-11-20 at 21:44 +0900, Tomasz Figa wrote:
>>> Hi Jonas,
>>>
>>> On Thu, Nov 7, 2019 at 7:34 AM Jonas Karlman <jonas@kwiboo.se> wrote:
>>>> A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
>>>> macroblock with additional 32 bytes on multi-core variants.
>>>>
>>>> Memory layout is as follow:
>>>>
>>>> +---------------------------+
>>>>> Y-plane   256 bytes x MBs |
>>>> +---------------------------+
>>>>> UV-plane  128 bytes x MBs |
>>>> +---------------------------+
>>>>> MV buffer  64 bytes x MBs |
>>>> +---------------------------+
>>>>> MC sync          32 bytes |
>>>> +---------------------------+
>>>>
>>>> Reduce the extra space allocated now that motion vector buffer offset no
>>>> longer is based on the extra space.
>>>>
>>>> Only allocate extra space for 64 bytes x MBs of motion vector buffer
>>>> and 32 bytes for multi-core sync.
>>>>
>>>> Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>> ---
>>>> Changes in v3:
>>>>   - add memory layout to code comment (Boris)
>>>> Changes in v2:
>>>>   - updated commit message
>>>> ---
>>>>  drivers/staging/media/hantro/hantro_v4l2.c | 20 ++++++++++++++++++--
>>>>  1 file changed, 18 insertions(+), 2 deletions(-)
>>>>
>>>
>>> Thanks for the patch!
>>>
>>> What platform did you test it on and how? Was it tested with IOMMU enabled?
>>
>> Hello Tomasz,
>>
>> Please note that this series has been picked-up and is merged
>> in v5.5-rc1.
>>
>> IIRC, we tested these patches on RK3399 and RK3288 (that means
>> with an IOMMU). I've just ran some more extensive tests on RK3288,
>> on media/master; and I plan to test some more on RK3399 later this week.
>>
>> Do you have any specific concern in mind?
> 
> I specifically want to know whether we're 100% sure that those sizes
> are correct. The IOMMU still works on page granularity so it's
> possible that the allocation could be just big enough by luck.

One of my RK3288 TRM [1] contains the following:

Direct mode motion vector write:
  Its base addr is right after decode output picture data
  Its length is mbwidth*mbheight*64

Also both the mpp library and imx-vpu-hantro code both use mbwidth*mbheight*64.
So I feel confident that the buffer size is correct.

[1] Rockchip RK3288TRM V1.1 Part3-Graphic and multi-media.pdf

Regards,
Jonas

> 
> Best regards,
> Tomasz
> 
