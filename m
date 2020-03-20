Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2BD18CA70
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 10:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgCTJdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 05:33:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43222 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgCTJdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 05:33:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02K9XTAh065495;
        Fri, 20 Mar 2020 04:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584696809;
        bh=NFNPfVsNGhbY1XKK9siiKrObWgVYsmgGydK9oUCswEQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EVEE5Cp/wuI3LP4dQ00/RArTMM+9ERToyJWtqp7EtC4B1ihF3Xnjg4cX6PP61a+DO
         ICIwoPCWyuGpX3s7DVOcsZO/5F/HeUDKsYsU65zuZwGu1v/Hb7vHFH80BtmwsXsnME
         FX959RfoZIk/o425PEySVW4TaW1yfjiRH2u9Xl4Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02K9XSAX018167
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Mar 2020 04:33:29 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Mar 2020 04:33:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Mar 2020 04:33:28 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02K9XQ6W022018;
        Fri, 20 Mar 2020 04:33:27 -0500
Subject: Re: [PATCH v2 19/19] media: ti-vpe: cal: fix stop state timeout
To:     Benoit Parrot <bparrot@ti.com>, <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-20-tomi.valkeinen@ti.com>
 <cf253130-7e3b-7f19-0001-08d27d25dcc1@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e11c6b7a-c8c0-2b9e-e59d-9c26cf69c7c9@ti.com>
Date:   Fri, 20 Mar 2020 11:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cf253130-7e3b-7f19-0001-08d27d25dcc1@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/03/2020 00:53, Benoit Parrot wrote:
> Tomi,
> 
> Thanks for the patch.
> 
> On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
>> The stop-state timeout needs to be over 100us as per CSI spec. With the
>> CAL fclk of 266 MHZ on DRA76, with the current value the driver uses,
>> the timeout is 24us. Too small timeout will cause failure to enable the
>> streaming.
>>
>> Also, the fclk can be different on other SoCs, as is the case with AM65x
>> where the fclk is 250 MHz.
>>
>> This patch fixes the timeout by calculating it correctly based on the
>> fclk rate.
>>
> 
> Isn't this in relation to the clock sourcing the PHY module which is fixed
> at 96Mhz (LVDSRX_96M_GFCLK)?

It's not clearly said in the docs. In register descs, it's "L3 cycles", in the content it's 
"functional clock cycles" (without specifying which func clock).

As far as I see, this timeout is part of the CAL, not the PHY, so I think it's the CAL functional clock.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
