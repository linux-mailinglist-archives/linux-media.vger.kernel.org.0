Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C80225190F
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 14:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHYMwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 08:52:21 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40242 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgHYMwS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 08:52:18 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PCpsuD130164;
        Tue, 25 Aug 2020 07:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598359914;
        bh=38PvUM3+W0U3gtkODOVgcK7SXN8Y7n9D66JwWuG1Y50=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vhwxj8hOg8pt5lEFGpv3o4ye7hsLHT0DpkjkcN2+2MfUQNQI2iX0LoZ9SA8ljowPT
         dHleyOfuPJ9KUmIXXdnfwCHaj43MQF/UhQCkhqDODbzsjGv6+aFdFJIrYzOCIEcVBC
         z8Sf5CVnKapt9sWECW1gNByIIhA1ZtruGblpepfA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PCps9j068452
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 07:51:54 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 07:51:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 07:51:53 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PCpqi9113824;
        Tue, 25 Aug 2020 07:51:52 -0500
Subject: Re: [PATCH] media: ti-vpe: cal: Fix compilation on 32-bit ARM
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Sakari Ailus <sakari.ailus@iki.fi>, <linux-media@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
References: <20200823050257.564-1-laurent.pinchart@ideasonboard.com>
 <20200824092303.GP7145@valkosipuli.retiisi.org.uk>
 <20200824105422.GB6002@pendragon.ideasonboard.com>
 <0f697317-bbe3-9632-0e56-eb1d0458f43e@ti.com>
 <20200825121916.GD6767@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <36f1f9d1-4817-a5f8-e3c8-5eb01a384dea@ti.com>
Date:   Tue, 25 Aug 2020 15:51:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825121916.GD6767@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2020 15:19, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Tue, Aug 25, 2020 at 03:11:24PM +0300, Tomi Valkeinen wrote:
>> On 24/08/2020 13:54, Laurent Pinchart wrote:
>>> On Mon, Aug 24, 2020 at 12:23:04PM +0300, Sakari Ailus wrote:
>>>> On Sun, Aug 23, 2020 at 08:02:57AM +0300, Laurent Pinchart wrote:
>>>>> When compiled on 32-bit ARM, the CAL driver fails with the FIELD_PREP()
>>>>> macro complaining that the mask is not constant. While all callers of
>>>>> the inline cal_write_field() function pass a constant mask, the mask
>>>>> parameter itself is a variable, which likely doesn't please the
>>>>> compiler.
>>>>>
>>>>> Fix it by replacing FIELD_PREP() with a manual implementation.
>>>>>
>>>>> Fixes: 50797fb30b95 ("media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functions")
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>
>>>> Thanks!
>>>>
>>>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>
>>> And I forgot to add
>>>
>>> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>
>>> Tomi, will you handle this patch ? Could you add the tags ?
>>
>> I don't see this when compiling. Which compiler version is it?
> 
> arm-buildroot-linux-uclibcgnueabihf-gcc.br_real (Buildroot 2020.05.1) 9.3.0


> Kernel defconfig attached, for v5.9-rc1.

Ok. It's something in the defconfig. And identical cal_write_field() call in another function works.
I guess it depends on whether the compiler happens to inline or not inline cal_write_field().

I don't see much harm in changing this, so looks good to me. Although I believe cal_read_field() may
also start failing at some point, but we can fix it then.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Hans or Mauro, can you pick up this fix for 5.9-rc?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
