Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC5818C322
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgCSWoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:44:14 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48856 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCSWoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:44:13 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMiAqE046922;
        Thu, 19 Mar 2020 17:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657850;
        bh=Si3aM70De/I+lxZrag3o6eFo531e54DnZtgE5yWExGE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=M8gW8M6rOfJKoTpvnrQ4+N9o37y3TqjB1hw0JXEDe8QnKY69JZI5Ax05U6/1E59sU
         PqGk8BXkEWCeNe6jQi8THSXKVcCLRt+m7KSpg9ckUWawBJVkr83SItNOtgkoSqSU6V
         QmOmbn6WqiyU/zcKH7ZcRLaBJilKLmKtBuxdi6cs=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMiAOG030704
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:44:10 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:44:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:44:10 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMi9dc058397;
        Thu, 19 Mar 2020 17:44:09 -0500
Subject: Re: [PATCH v2 14/19] media: ti-vpe: cal: program number of lines
 properly
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-15-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <77e59aed-5e5d-0d6c-d830-731c37350f26@ti.com>
Date:   Thu, 19 Mar 2020 17:44:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-15-tomi.valkeinen@ti.com>
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
> CAL_CSI2_CTX register has LINES field, which, according to the
> documentation, should be programmed to the number of lines transmitted
> by the camera. If the number of lines is unknown, it can be set to 0.
> The driver sets the field to 0 for some reason, even if we know the
> number of lines.
> 
> This patch sets the number of lines properly, which will allow the HW to
> discard extra lines (if the sensor would send such for some reason),
> and, according to documentation: "This leads to regular video timings
> and avoids potential artifacts".
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index e6f766ba3079..a59931ba3ed7 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -962,8 +962,7 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
>  	set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
>  	/* Virtual Channel from the CSI2 sensor usually 0! */
>  	set_field(&val, ctx->virtual_channel, CAL_CSI2_CTX_VC_MASK);
> -	/* NUM_LINES_PER_FRAME => 0 means auto detect */
> -	set_field(&val, 0, CAL_CSI2_CTX_LINES_MASK);
> +	set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
>  	set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
>  	set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
>  		  CAL_CSI2_CTX_PACK_MODE_MASK);
> 
