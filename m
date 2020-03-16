Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE25186A79
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730892AbgCPMAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:00:42 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46094 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730845AbgCPMAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:00:42 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GC0c1n037398;
        Mon, 16 Mar 2020 07:00:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584360038;
        bh=GL0jS/e3uptTKRc8vT+NnRTEc/dcLr+4rcO407PL0TM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dX2M1B1E2c9c0+xWPKfsxH8KDpA66oj/EXwS40ZmqFylXKVj2WNAuF4SZxs6v2Ual
         HseKkY5MZ1wbmYelJCCHC4qRPX3jj3R0tFFB5F86tE8G4RpD26zXHFQu/CmS68f6BO
         8Qqylig2fgCGTpmVA5VKEK0GCbS4PnzWg+RWnw2k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GC0c8Z073251
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 07:00:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 07:00:37 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 07:00:37 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 02GC0aK5016850;
        Mon, 16 Mar 2020 07:00:36 -0500
Subject: Re: [PATCH 03/16] media: ti-vpe: cal: catch error irqs and print
 errors
To:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-3-tomi.valkeinen@ti.com>
 <dd31db33-c73b-cb05-ac18-90643a2a0074@xs4all.nl>
 <9af07911-54e7-fb04-1e34-26f306299e6e@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <77ef2fbd-486e-c564-806c-48686472295f@ti.com>
Date:   Mon, 16 Mar 2020 14:00:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9af07911-54e7-fb04-1e34-26f306299e6e@xs4all.nl>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2020 12:51, Hans Verkuil wrote:
> On 3/16/20 11:06 AM, Hans Verkuil wrote:
>> Hi Tomi,
>>
>> On 3/13/20 12:41 PM, Tomi Valkeinen wrote:
>>> CAL reports various errors via IRQs, which are not handled at all by the
>>> current driver. Add code to enable and catch those IRQs and print
>>> errors. This will make it much easier to notice and debug issues with
>>> sensors.
>>
>> Can you rebase your series to the media_tree master branch? Other recently
>> merged patches from Benoit now conflict with at least this patch.
>>
>> I reviewed this series and it looks good otherwise (just one other small comment
>> about a confusing log message), so once I have a rebased version I can make
>> a PR for it.
> 
> Just to confirm: this series has been tested with a real sensor, right? If so,
> please add a Tested-by line as well.

Yes, I'm using OV5640.

I thought tested-by by the author is implicit, unless otherwise clearly noted. But if it's the 
custom with linux-media, I can add those.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
