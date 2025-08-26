Return-Path: <linux-media+bounces-41067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C03B35797
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709803BFC78
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 08:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932092FCBFF;
	Tue, 26 Aug 2025 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VrlNHF/Q"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5129ACCD;
	Tue, 26 Aug 2025 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756198236; cv=none; b=DQyBeA+1nus3+OMjnPDIp3aLsY+zYOYLvwc7HYD+d+MFvOkCdNUECOtpJHGxsOwrDIxPbMZnoLhqSJgjHGUeQD3AUKSqJBS3ZY76uNDXoRB7B/EufjwkvBtuO5jUh/aXUQnTg1m5SPzQqDt1jgnUUZ6qBQBjQmAS7XJuEygdD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756198236; c=relaxed/simple;
	bh=6NCjTTLQ8IS1fnIuWH723X5fwFZYB5chP9QXlwXt50Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W6jDH1e/Buu+tWPDjwyTkoSP9nMAhJXD13QkfQeykEKMLco4zBJYWDN1gPfztmo+cSAhrogJNQ58IlJ5dqHyL3BKZp8hqk/zrMq8QcTQPW48RDLmzijaYQYTdLQm/4wBEnmys/s2aC0udNPvLH/EhxU1xWpfwHPcc9MJhRPUt3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VrlNHF/Q; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57Q8o8xO1495853;
	Tue, 26 Aug 2025 03:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756198208;
	bh=PtlWd1f4QUk/q9tiYzSXCRAuxQq8+9vZ8gqlgXf6znc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VrlNHF/QXyWUAw6cin7+412iuqD//LNrxFYQIaU1U5tq+gc1sJyu/JpqQHVxErlf9
	 evXt5zCBk+izDndKmqr8ROQxXaq8LYGLFvAuw6gM6d4nrundzafzkB0B5fcQ0fYs90
	 2f2pBp+kWoL3o1kwPRe3zYizD+nMkry2MznZC9ek=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57Q8o5mk1556543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 26 Aug 2025 03:50:05 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 26
 Aug 2025 03:50:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 26 Aug 2025 03:50:05 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57Q8nwfm1163034;
	Tue, 26 Aug 2025 03:49:58 -0500
Message-ID: <3bdc9ef0-d5a6-4836-b3b1-c0114aa330f6@ti.com>
Date: Tue, 26 Aug 2025 14:19:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/4] Add support for VIP
To: Hans Verkuil <hverkuil+cisco@kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <ea673976-49a6-44f6-8e6c-8d11abe46620@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <ea673976-49a6-44f6-8e6c-8d11abe46620@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Hans,
Thanks for the review.

On 25/08/25 20:04, Hans Verkuil wrote:
> Hi Yemike,
> 
> On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
>> This patch series add support for the TI VIP video capture engine.
>> VIP stands for Video Input Port, it can be found on devices such as
>> DRA7xx and provides a parallel interface to a video source such as
>> a sensor or TV decoder.
>>
>> Each VIP can support two inputs (slices) and a SoC can be configured
>> with a variable number of VIP's. Each slice can support two ports
>> each connected to its own sub-device.
>>
>> The first patch in this series updates the outdated MAINTAINERS entry
>> for the TI VPE and CAL drivers. The subsequent three patches introduce
>> support for the TI VIP (Video Input Port) driver.
> 
> I'll pick up the MAINTAINERS patch, but the others need more work, so
> v3 is needed for that.
> 

Thanks, I am working on v3. I plan to incorporate the additional
feedback you provided on the driver before submitting the v3.

>>
>> Link for v1: https://lore.kernel.org/all/20200522225412.29440-1-bparrot@ti.com/
>> The v1 patch series was posted in the year 2020. This v2 series resumes the
>> effort to upstream VIP support by addressing all previous review comments
>>
>> Changelog:
>> Changes in v2:
>> - Remove array and just use hsync: true in bindings (Patch 3/5)
>> - Remove array and use enum for bus width in bindings (Patch 3/5)
>> - Use pattern properties since properties across ports are same (Patch 3/5)
>> - Remove vip_dbg, vip_info, vip_err aliases and just use v4l2_dbg, v4l2_info
>>    and v4l2_err instead (Patch 4/5)
>> - Remove color space information from vip_formats struct (Patch 4/5)
>> - Use g_std instead of g_std_output (Patch 4/5)
>> - Do not touch pix.priv (Patch 4/5)
>> - Remove all comments with just register values (Patch 4/5)
>> - Remove support for vidioc_default ioctl (Patch 4/5)
>> - In case of any error while streaming, push all pending buffers to vb2 (Patch 4/5)
>> - Address some minor comments made by Hans throughout the driver (Patch 4/5)
>> - Update copyright year at various places
>>
>> v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/b0791cb465fadc11d4c995197cb22f29
> 
> Also run v4l2-compliance with the -s option to check compliance while streaming.
> 

Thanks for pointing this out. Will run as part of v3.

Thanks and Regards,
Yemike Abhilash Chandra

> Regards,
> 
> 	Hans
> 
>>
>> v4l2-compliance cropping and composing tests are failing likely
>> due to OV10635 sensor supporting several discrete frame sizes,
>> fail: v4l2-test-formats.cpp(1560): node->frmsizes_count[pixfmt] > 1
>>
>> Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/98504ab56416aef38b851036aef5eeb1
>>
>> Dale Farnsworth (2):
>>    dt-bindings: media: ti: vpe: Add bindings for Video Input Port
>>    media: ti-vpe: Add the VIP driver
>>
>> Yemike Abhilash Chandra (2):
>>    MAINTAINERS: Update maintainers of TI VPE and CAL
>>    Revert "media: platform: ti: Remove unused vpdma_update_dma_addr"
>>
>>   .../devicetree/bindings/media/ti,vip.yaml     |  211 +
>>   MAINTAINERS                                   |    3 +-
>>   drivers/media/platform/ti/Kconfig             |   13 +
>>   drivers/media/platform/ti/vpe/Makefile        |    2 +
>>   drivers/media/platform/ti/vpe/vip.c           | 3824 +++++++++++++++++
>>   drivers/media/platform/ti/vpe/vip.h           |  719 ++++
>>   drivers/media/platform/ti/vpe/vpdma.c         |   32 +
>>   drivers/media/platform/ti/vpe/vpdma.h         |    3 +
>>   8 files changed, 4806 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
>>   create mode 100644 drivers/media/platform/ti/vpe/vip.c
>>   create mode 100644 drivers/media/platform/ti/vpe/vip.h
>>
> 


