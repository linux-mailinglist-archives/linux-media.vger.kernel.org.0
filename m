Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238F5139F31
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 02:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgANBxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 20:53:14 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:48664 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728838AbgANBxO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 20:53:14 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 84756C953A2E322BA0AF;
        Tue, 14 Jan 2020 09:53:12 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.145) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Tue, 14 Jan 2020
 09:53:11 +0800
Subject: Re: [PATCH] media: staging: rkisp1: Fix undefined reference to
 `phy_mipi_dphy_get_default_config' in rkisp1_mipi_csi2_start
To:     Helen Koike <helen.koike@collabora.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-media@vger.kernel.org>, <devel@driverdev.osuosl.org>
References: <20200113034804.24732-1-zhangxiaoxu5@huawei.com>
 <af2cccbf-56e4-2963-cd38-36fa13f3c571@collabora.com>
From:   "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Message-ID: <9013da2d-f50f-112b-77a1-92123ae25fcd@huawei.com>
Date:   Tue, 14 Jan 2020 09:53:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <af2cccbf-56e4-2963-cd38-36fa13f3c571@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.220.145]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



在 2020/1/14 1:34, Helen Koike 写道:
> Hi Zhang,
> 
> Thank you for the patch.
> 
> On 1/13/20 1:48 AM, Zhang Xiaoxu wrote:
>> If 'GENERIC_PHY_MIPI_DPHY' not configured, there is an error:
>>
>> drivers/staging/media/rkisp1/rkisp1-isp.o:
>> 	In function `rkisp1_mipi_csi2_start.isra.5':
>> rkisp1-isp.c:(.text+0x1238):
>> 	undefined reference to `phy_mipi_dphy_get_default_config'
>> make: *** [vmlinux] Error 1
>>
>> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
>> ---
>>   drivers/staging/media/rkisp1/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
>> index b859a493caba..788bcb703376 100644
>> --- a/drivers/staging/media/rkisp1/Kconfig
>> +++ b/drivers/staging/media/rkisp1/Kconfig
>> @@ -8,6 +8,7 @@ config VIDEO_ROCKCHIP_ISP1
>>   	select VIDEOBUF2_VMALLOC
>>   	select V4L2_FWNODE
>>   	select PHY_ROCKCHIP_DPHY_RX0
>> +	select GENERIC_PHY_MIPI_DPHY
>>   	default n
>>   	help
>>   	  Enable this to support the Image Signal Processing (ISP) module
>>
> 
> How are you reproducing this?
> 
> VIDEO_ROCKCHIP_ISP1 selects PHY_ROCKCHIP_DPHY_RX0
> 
> and
> 
> PHY_ROCKCHIP_DPHY_RX0 already selects GENERIC_PHY_MIPI_DPHY,
> 
> So it shouldn't be a problem (unless I misunderstood something, which is probably the case).
Yes, you are right.

This can be reproduce with the following config:
# CONFIG_OF is not set
#
# soc_camera sensor drivers
#
CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
CONFIG_VIDEO_ROCKCHIP_ISP1=y

I think the cause of the problem is:
'CONFIG_PHY_ROCKCHIP_DPHY_RX0' should also be depended on 'CONFIG_OF'.

> 
> Thanks
> Helen
> 

