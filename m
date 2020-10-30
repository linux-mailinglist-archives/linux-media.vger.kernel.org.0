Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9532A2A0761
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 15:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgJ3OED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 10:04:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44620 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgJ3OED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 10:04:03 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09UE3xH1101871;
        Fri, 30 Oct 2020 09:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604066639;
        bh=LJwkXXQ5RVpM34J6H9QijL5fs3JYCS/zxD8llRsNdIg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HiW60wDOu2IvxVT5RFT42rerEOoLDQedMuM7bjDMy+Ye2CAQiXnhx0pHnu43nG3NZ
         ZxcpX3gug4SgLdDiLWkP+yj/o9UAMccN1cbaOQFrEtMdiy6ohymsI5fV2Z7Y/U+yKi
         iUfxyd8IqjyGzcvgZaPrGBiB59ysLpIA6m/ihJ/4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09UE3xWF124739
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Oct 2020 09:03:59 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 09:03:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 09:03:59 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09UE3vaL112994;
        Fri, 30 Oct 2020 09:03:57 -0500
Subject: Re: [PATCH] media: platform: ti-vpe: Update the path to firmware
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Benoit Parrot <bparrot@ti.com>, Sekhar Nori <nsekhar@ti.com>
References: <20201012125200.11643-1-nikhil.nd@ti.com>
 <14827fb7-4c2d-426d-cfde-221fd8c39c20@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <b785b507-fad4-34db-c7d1-e5ce190f6c41@ti.com>
Date:   Fri, 30 Oct 2020 16:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14827fb7-4c2d-426d-cfde-221fd8c39c20@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/10/2020 11:57, Hans Verkuil wrote:
> Hi Nikhil,
> 
> On 12/10/2020 14:52, Nikhil Devshatwar wrote:
>> vpdma firmware is now available in the linux-firmware repo.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity/vpdma-1b8.bin
>>
>> Update the firmware path requested by the VPDMA driver so that
>> it gets looked up correctly in the filesystem.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
>> index 2e5148ae7a0f..5a378449a4ff 100644
>> --- a/drivers/media/platform/ti-vpe/vpdma.c
>> +++ b/drivers/media/platform/ti-vpe/vpdma.c
>> @@ -23,7 +23,7 @@
>>  #include "vpdma.h"
>>  #include "vpdma_priv.h"
>>  
>> -#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
>> +#define VPDMA_FIRMWARE	"ti-connectivity/vpdma-1b8.bin"
> 
> Based on the discussion, this will change to ti/vpdma-1b8.bin, right?
> At least once linux-firmware has been updated.
> 
> I'll wait for a v2.

Yes, please wait for v2. I think it'll be ti/vpdma-1b8.bin, or alternatively keep it as it is now
(in the root).

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
