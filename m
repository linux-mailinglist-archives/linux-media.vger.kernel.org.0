Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362D81DAE36
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 11:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgETJBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 05:01:09 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52030 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgETJBI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 05:01:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04K914TP015260;
        Wed, 20 May 2020 04:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589965264;
        bh=b6H804B8RuHsNLb8km9T/gbWP07ThkPpda0h3OTyzoI=;
        h=To:From:Subject:Date;
        b=UsNiCfJx9jxEloq1ipY1C1pu6wXYHddi64OvWR3WAcrvcXcXFnkFu9GTtC/Kzpa6K
         qkYk/tUy33g81V97gqPUs0js5XTUkkhz1makmv+CVtZxhwVttx04iEUwhdiqyPVK+r
         aN4xHHCiX556f4fWLCopTGT/j1wg+d4Zm7NE6OdM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04K9147c085736
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 04:01:04 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 04:00:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 04:00:15 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04K90EGS035997;
        Wed, 20 May 2020 04:00:14 -0500
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        LKML <linux-kernel@vger.kernel.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Bad kfree of dma_parms in v5.7-rc5
Message-ID: <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com>
Date:   Wed, 20 May 2020 12:00:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core: platform: Initialize dma_parms for 
platform devices") v5.7-rc5 causes at least some v4l2 platform drivers to break when freeing resources.

E.g. drivers/media/platform/ti-vpe/cal.c uses vb2_dma_contig_set_max_seg_size() and 
vb2_dma_contig_clear_max_seg_size() to manage the dma_params, and similar pattern is seen in other 
drivers too.

After 9495b7e92f716ab2, vb2_dma_contig_set_max_seg_size() will not allocate anything, but 
vb2_dma_contig_clear_max_seg_size() will still kfree the dma_params.

I'm not sure what's the proper fix here. A flag somewhere to indicate that 
vb2_dma_contig_set_max_seg_size() did allocate, and thus vb2_dma_contig_clear_max_seg_size() must free?

Or drop the kzalloc and kfree totally, if dma_params is now supposed to always be there?

Or revert 9495b7e92f716ab2, as it was added so late?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
