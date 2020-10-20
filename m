Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D14D293618
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 09:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405422AbgJTHwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 03:52:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41810 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgJTHwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 03:52:09 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09K7q8kg043450;
        Tue, 20 Oct 2020 02:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603180328;
        bh=YW375cyXqjBjObk70PPGE2Tvr83jE7iA2SbBqjiD94Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=W/1pj8yowJHZAw7i0TZjbILZE2Nm2Qtj1Gj/EYSFlcWI8Vx1FYJ/Cu+An3A40JITT
         huPsFK+TTfZb4GsFtRK6EdFZv7h2kR0g0zUiuDSNfon8rb6o5YKmRbIzHjQfMN3xz5
         b49+Z4J9VTKrC5z/wSbxnxmNfBhRJLt8osA22u+M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09K7q8LP058983
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Oct 2020 02:52:08 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 20
 Oct 2020 02:52:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 20 Oct 2020 02:52:07 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09K7q6w2067690;
        Tue, 20 Oct 2020 02:52:06 -0500
Subject: Re: [PATCH] media: platform: ti-vpe: Update the path to firmware
To:     Nikhil Devshatwar <nikhil.nd@ti.com>
CC:     <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Benoit Parrot <bparrot@ti.com>, Sekhar Nori <nsekhar@ti.com>
References: <20201012125200.11643-1-nikhil.nd@ti.com>
 <67d3fae1-5ba6-9f9a-3036-5752e3f6849d@ti.com>
 <20201020073817.3cug7vgaezf3vj67@NiksLab>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <72b65370-095e-9875-e5d4-096256b77ced@ti.com>
Date:   Tue, 20 Oct 2020 10:52:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020073817.3cug7vgaezf3vj67@NiksLab>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/10/2020 10:38, Nikhil Devshatwar wrote:
> On 14:38-20201019, Tomi Valkeinen wrote:
>> On 12/10/2020 15:52, Nikhil Devshatwar wrote:
>>> vpdma firmware is now available in the linux-firmware repo.
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity/vpdma-1b8.bin
>>>
>>> Update the firmware path requested by the VPDMA driver so that
>>> it gets looked up correctly in the filesystem.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>>  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
>>> index 2e5148ae7a0f..5a378449a4ff 100644
>>> --- a/drivers/media/platform/ti-vpe/vpdma.c
>>> +++ b/drivers/media/platform/ti-vpe/vpdma.c
>>> @@ -23,7 +23,7 @@
>>>  #include "vpdma.h"
>>>  #include "vpdma_priv.h"
>>>  
>>> -#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
>>> +#define VPDMA_FIRMWARE	"ti-connectivity/vpdma-1b8.bin"
>>
>> I don't think "ti-connectivity/" makes sense for vpdma fw. I don't know if there are guidelines for
>> directories in linux-firmware, but "ti/vpdma-1b8.bin" would be better in my opinion.
> 
> The firmware is already merged at ti-connectivity/
> I didn't create a new folder because I felt the exising ti-connectivity
> is good enough.

ti-connectivity is for TI wlan, no? I think the fw should either be in the root dir, as that's where
the driver has been loading it from for a long time, or if we're going to change the path in the
driver, put it into a proper directory.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
