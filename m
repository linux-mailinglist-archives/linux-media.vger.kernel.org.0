Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB8C29E70E
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 10:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgJ2JPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 05:15:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59436 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgJ2JPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 05:15:52 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09T77hAa033099;
        Thu, 29 Oct 2020 02:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603955263;
        bh=xMeGsfNYGAllDn2PyydKL8FowmhOxde2xLuq+IAIcW8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ois2CnsMuVJSULfNIC23UjZhCkO/WXW78eCX0TOtmY0nwLWkPKcW55y+OSjgvl8bp
         sKAG2vVZDKpLbwvccU06yKFG77wh+ux80sJMAFrmrIxAi/m6u9vq/mD1K1baMmZqlQ
         hVJb8VQY4vrCEmwBn2DFo51HssNwOFOIyy/EfdGE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09T77hst052645
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Oct 2020 02:07:43 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 02:07:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 02:07:43 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09T77f9t104429;
        Thu, 29 Oct 2020 02:07:42 -0500
Subject: Re: [PATCH v2] vpdma: Move firmware to ti directory
To:     Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-firmware@kernel.org>,
        <linux-media@vger.kernel.org>
CC:     Dan Murphy <dmurphy@ti.com>, Benoit Parrot <bparrot@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201028184249.11293-1-nikhil.nd@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6b7cb928-909f-36fd-3949-ba9fb32f7cfd@ti.com>
Date:   Thu, 29 Oct 2020 09:07:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028184249.11293-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/10/2020 20:42, Nikhil Devshatwar wrote:
> Current ti-connectivity location for the firmware is not the
> correct place. It has all the wireless connectivity related firmwares.
> Move the vpdma firmware to the ti specific directory.
> 
> Fixes: 5b30b383ce ("linux-firmware: Add new VPDMA firmware 1b8.bin")
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  WHENCE                                |   2 +-
>  {ti-connectivity => ti}/vpdma-1b8.bin | Bin
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename {ti-connectivity => ti}/vpdma-1b8.bin (100%)
> 
> diff --git a/WHENCE b/WHENCE
> index 473f6fb..d4efee2 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2705,7 +2705,7 @@ Licence: Redistributable. See LICENCE.tda7706-firmware.txt for details.
>  
>  Driver: ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
>  
> -File: ti-connectivity/vpdma-1b8.bin
> +File: ti/vpdma-1b8.bin
>  
>  Licence: Redistributable. See LICENCE.ti-tspa for details.
>  
> diff --git a/ti-connectivity/vpdma-1b8.bin b/ti/vpdma-1b8.bin
> similarity index 100%
> rename from ti-connectivity/vpdma-1b8.bin
> rename to ti/vpdma-1b8.bin

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
