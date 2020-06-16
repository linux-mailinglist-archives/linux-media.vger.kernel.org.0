Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372731FAE08
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 12:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbgFPKcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 06:32:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48320 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgFPKcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 06:32:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05GAWJHj053420;
        Tue, 16 Jun 2020 05:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592303539;
        bh=SjbEJ0uMOUsxmHp20KO3Q3rmDXwuYttwb0SuIxJhXms=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AEbkHm5T3GtxFF9vrlDOVFp/xkJGN1sYyqKELvcUllz/8//PWRBVHmhSaBo/JBCAM
         KCpA3HlvBkevoHsNkJjk50n7Vf17jIS4nfMSXgcsAK3RDoQKUleOHo6a4229wDctYX
         adP5pJ//esMM/dH/JbKYC4HKbmDY7En74gshI+0k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05GAWJfj073559
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 16 Jun 2020 05:32:19 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Jun 2020 05:32:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Jun 2020 05:32:19 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GAWIH3129308;
        Tue, 16 Jun 2020 05:32:18 -0500
Subject: Re: [PATCH v1 006/107] media: ti-vpe: cal: Merge all status variables
 in IRQ handler
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
CC:     Benoit Parrot <bparrot@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-7-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7f6d0a6e-de9f-53c0-9aa3-9be8dc9b3240@ti.com>
Date:   Tue, 16 Jun 2020 13:32:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614235944.17716-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 15/06/2020 02:58, Laurent Pinchart wrote:
> The cal_irq() function reads three IRQ status registers and stores their
> values in three different variables. As each value is processed right
> after reading the corresponding register, a single variable is enough.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/ti-vpe/cal.c | 35 +++++++++++++----------------
>   1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index b04d8cb86977..0a5fb81223da 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -1206,19 +1206,18 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>   	struct cal_dev *dev = (struct cal_dev *)data;
>   	struct cal_ctx *ctx;
>   	struct cal_dmaqueue *dma_q;
> -	u32 irqst0, irqst1, irqst2;
> +	unsigned int i;
> +	u32 status;
>   
> -	irqst0 = reg_read(dev, CAL_HL_IRQSTATUS(0));
> -	if (irqst0) {
> -		int i;

I do like to keep local variables inside smaller scopes when possible, as it reduces chances for 
bugs. Any reason you moved i to the whole function scope?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
