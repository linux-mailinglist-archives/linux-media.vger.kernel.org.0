Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D452D33E2
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 21:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbgLHU13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 15:27:29 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11790 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgLHU11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 15:27:27 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fcfe1860001>; Tue, 08 Dec 2020 12:26:46 -0800
Received: from [10.2.90.244] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 20:26:43 +0000
Subject: Re: [PATCH v3 10/13] media: v4l2-fwnode: Update
 V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <robh+dt@kernel.org>, <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
 <1607022002-26575-11-git-send-email-skomatineni@nvidia.com>
 <845dfd4a-fa11-625c-78a3-cc8adc68bfc7@xs4all.nl>
 <20201208195949.GB1167@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <23de1994-0a3e-179b-2c2f-b41917d02585@nvidia.com>
Date:   Tue, 8 Dec 2020 12:27:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208195949.GB1167@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607459206; bh=V/0+9h7ehwpCJcCPaTuvyhF/G9hja/cZk0UPNoDHO74=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=S0ie0J1A5wC4XOAnEIdC/0Wl9YyUACghu0oMAax8zmeSgIDXjz049Fe24Bfch1hNF
         orRW/tsyQvlYk0IzXdsuQRtEWLwCrwyrNc/8MiCjcuomKAC0O+RfQZ/vHvvrswkM8n
         r2dngjrq9/oRiPcWa/maCNq6AFLwiVI9ImxSITsX75TYYuC95rw0PKjuWDF1OI9gIx
         Rri4K+0EqF2oFfCkBp4Bzv+TZmLagA8jZ9b2kuCcMIB5u6kXT+JD53ApZew5T5m98A
         ov3WjKl0tXYJVT/u4koi74kO8Qyzt8qRl3MagBR12ga5Fjyh3qP44PRoURp9pkTMWM
         5PmCqZt6t+n+A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 12/8/20 11:59 AM, Sakari Ailus wrote:
> Hi Hans,
>
> On Mon, Dec 07, 2020 at 11:47:38AM +0100, Hans Verkuil wrote:
>> On 03/12/2020 19:59, Sowjanya Komatineni wrote:
>>> Some CSI2 receivers support 8 data lanes.
>>>
>>> So, this patch updates CSI2 maximum data lanes to be 8.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/media/platform/ti-vpe/cal-camerarx.c | 2 +-
>>>   include/media/v4l2-fwnode.h                  | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
>>> index 806cbf1..47e2143 100644
>>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
>>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
>>> @@ -534,7 +534,7 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>>>   {
>>>   	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
>>>   	struct device_node *ep_node;
>>> -	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
>>> +	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES];
>>>   	unsigned int i;
>>>   	int ret;
>>>   
>> I'm not so sure about this change: it relies on the implicit knowledge that
>> this cal driver can handle only 4 lanes max, so that doubling
>> V4L2_FWNODE_CSI2_MAX_DATA_LANES is the same as the old 'V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2'.
>>
>> I think we should either keep the existing code (which means data_lanes
>> is now larger than needed, so stack usage increases by 8 bytes), or perhaps
>> create a new define for this driver like CAL_MAX_DATA_LANES and use that.
>>
>> In my opinion the original code should just be kept, but I've CC-ed Laurent
>> on this to hear what he thinks.
> I further looked at the code there and it does *depend* on a particular
> value of V4L2_FWNODE_CSI2_MAX_DATA_LANES. That needs to be fixed. This part
> can (or should) be dropped from the patch though.
>
Thanks Sakari and Hans.

OK. Will drop updating cal-camerarx.c from this patch in next version.

