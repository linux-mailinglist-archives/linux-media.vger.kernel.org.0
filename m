Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63C4718C2F7
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgCSW0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:26:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51322 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCSW0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:26:47 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMQirD110932;
        Thu, 19 Mar 2020 17:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584656804;
        bh=eeY/SyQyTy3OzdKVMt0vxZj1AqSkZQ/0bm8g5vFozgo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PF0SK3LauXmoM5l9aN1OPZBGAm7OEzOgwymv1HIlnq/z3ZqjUANcMHsrlBG+TJnIP
         Qc9dtKXKPU9swSYl3cNaZkyuZDejxiFUheMdVp4aVOhQGlKgA04rRvE4RrxgAidvwQ
         g1bmfbcidsFH3gM2mbWcBwL2AzqwMylE3A2lV6uU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMQiU5099157
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:26:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:26:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:26:44 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMQhlU084187;
        Thu, 19 Mar 2020 17:26:43 -0500
Subject: Re: [PATCH v2 02/19] media: ti-vpe: cal: improve enable_irqs
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-3-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <e9b97db4-46b2-c2f2-8115-9202ea2c61b1@ti.com>
Date:   Thu, 19 Mar 2020 17:26:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-3-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi,

Thanks for the patch.

On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
> IRQENABLE_SET registers are (usually) not meant to be read, only written
> to. The current driver needlessly uses read-modify-write cycle to enable
> IRQ bits.
> 
> The read-modify-write has no bad side effects here, but it's still
> better to clean this up by only using write.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 9dd6de14189b..76d55c76d938 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -706,16 +706,16 @@ static void cal_quickdump_regs(struct cal_dev *dev)
>   */
>  static void enable_irqs(struct cal_ctx *ctx)
>  {
> +	u32 val;
> +
>  	/* Enable IRQ_WDMA_END 0/1 */
> -	reg_write_field(ctx->dev,
> -			CAL_HL_IRQENABLE_SET(2),
> -			CAL_HL_IRQ_ENABLE,
> -			CAL_HL_IRQ_MASK(ctx->csi2_port));
> +	val = 0;
> +	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), val);
>  	/* Enable IRQ_WDMA_START 0/1 */
> -	reg_write_field(ctx->dev,
> -			CAL_HL_IRQENABLE_SET(3),
> -			CAL_HL_IRQ_ENABLE,
> -			CAL_HL_IRQ_MASK(ctx->csi2_port));
> +	val = 0;
> +	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(3), val);
>  	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
>  	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0xFF000000);
>  }
> 
