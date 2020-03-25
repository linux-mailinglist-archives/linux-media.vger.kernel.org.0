Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B196E192B54
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 15:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbgCYOk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 10:40:56 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58948 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbgCYOk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 10:40:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PEer7m003522;
        Wed, 25 Mar 2020 09:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585147253;
        bh=2rGGx1S2Z9zdeGvCQ89hssxhVGMfBOlirWRVAy5VwLk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Z+6p5PY4O3Y7t2bSbnhUjtRuYn5NTOwFFLnSHYG0VKBZD0yqWa4PdDWzL6oqBW9N/
         hSEa5Am1yV5NQDIfLgZNymd08SZpTcDOCgCRNgUauSZwXzaAY2MMzpYYFWUMT5Iyq+
         OK81dwEtXgZuf7NIyaPiCbkfbZ3AqisR/LyofdCA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PEermf061411
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 09:40:53 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 09:40:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 09:40:52 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PEep40000990;
        Wed, 25 Mar 2020 09:40:52 -0500
Subject: Re: [GIT PULL FOR v5.7] ti-vpe/cal and imx7-mipi-csis cleanups/fixes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <64c740ae-3ebd-cec3-14f4-e65f2cb53af3@xs4all.nl>
 <20200325142733.GG19171@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f31a478a-8975-e507-6b56-3d07a0d1c814@ti.com>
Date:   Wed, 25 Mar 2020 16:40:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325142733.GG19171@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/03/2020 16:27, Laurent Pinchart wrote:

>> Tomi Valkeinen (19):
>>        media: ti-vpe: cal: fix DMA memory corruption
>>        media: ti-vpe: cal: improve enable_irqs
>>        media: ti-vpe: cal: fix use of wrong macro
>>        media: ti-vpe: cal: use runtime_resume for errata handling
>>        media: ti-vpe: cal: drop cal_runtime_get/put
>>        media: ti-vpe: cal: catch error irqs and print errors
>>        media: ti-vpe: cal: print errors on timeouts
>>        media: ti-vpe: cal: simplify irq handling
>>        media: ti-vpe: cal: remove useless CAL_GEN_* macros
>>        media: ti-vpe: cal: remove useless IRQ defines
>>        media: ti-vpe: cal: use reg_write_field
>>        media: ti-vpe: cal: cleanup CIO power enable/disable
>>        media: ti-vpe: cal: fix dummy read to phy
>>        media: ti-vpe: cal: program number of lines properly
>>        media: ti-vpe: cal: set DMA max seg size
>>        media: ti-vpe: cal: move code to separate functions
>>        media: ti-vpe: cal: improve wait for CIO resetdone
>>        media: ti-vpe: cal: improve wait for stop-state
>>        media: ti-vpe: cal: fix stop state timeout
> 
> Tomi has posted v3, is that what the pull request contains ?

Yes, looks like v3.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
