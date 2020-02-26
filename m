Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 757F416FA9E
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 10:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgBZJW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 04:22:27 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38834 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgBZJW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 04:22:27 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9ML88015721;
        Wed, 26 Feb 2020 03:22:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582708941;
        bh=MuGgeJ3sRoEpmi6I3shwOJzt0XHI9Efz+v7suVqx2tE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=H4WbBTqcW+QRgXYbOD3ZDFTcyvlx9VZxv3UVm7FQNaZTCGseC6X7GDBt5e+xdx17o
         qxB3IjV1ydurkHH7qQt2afobqYF+AUu/EjkyCMnzYKCkZabyqHziQUnkxdehTsRy9d
         7cx7ludKigC8apjpfNUeR+n68OJpSQP1meOz+HK8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9MLBj063929;
        Wed, 26 Feb 2020 03:22:21 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 03:22:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 03:22:19 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9MEYR119350;
        Wed, 26 Feb 2020 03:22:15 -0600
Subject: Re: [PATCH v2] media: rcar_drif: Use dma_request_chan() instead
 dma_request_slave_channel()
To:     Hans Verkuil <hverkuil@xs4all.nl>, <mchehab@kernel.org>,
        <rashanmu@gmail.com>, <geert@linux-m68k.org>
CC:     <vkoul@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20200120124754.26826-1-peter.ujfalusi@ti.com>
 <d1c3aec0-7b8f-5f78-e055-8dd87bee801b@xs4all.nl>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <047fb0e6-9d43-1d9b-0e3a-2da58613c640@ti.com>
Date:   Wed, 26 Feb 2020 11:22:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d1c3aec0-7b8f-5f78-e055-8dd87bee801b@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2/25/20 2:07 PM, Hans Verkuil wrote:
> Hi Peter,
> 
> On 1/20/20 1:47 PM, Peter Ujfalusi wrote:
>> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
>> eating up the error code.
>>
>> By using dma_request_chan() directly the driver can support deferred
>> probing against DMA.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Unfortunately the v1 version of this patch got merged, so can you make a
> new patch against the current media_tree master to bring it up to date
> with this v3?

Sure, I'll send an update patch in couple of minutes.

> My apologies for this.

No issue

Regards,
- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
