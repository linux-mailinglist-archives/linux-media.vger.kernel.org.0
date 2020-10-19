Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2CF29267D
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 13:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgJSLjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 07:39:06 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42814 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbgJSLjF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 07:39:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JBd2IO125684;
        Mon, 19 Oct 2020 06:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603107542;
        bh=tLnAVrwBzSHDwE+Vx98TfXWKHmnT0cfBqpiYEbOpkdM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FwdeaF5WS6dIwdim+sB77eqSBvuMLraDRISnL+K6CIs5OPKgsrL04DVZ57QKAZsVN
         QpBGZtMm1wax5d4oGIhUGXKnf6x8nmeUSGJyCNB+7+oWjDY9kTdCDmSLaltN+c9Y/3
         jJ1QL7xuPGnEAOET1U7c/MGbLQRPVONCrhHSrtxA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JBd1b0026745
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Oct 2020 06:39:02 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 06:39:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 06:39:01 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JBcxeC120468;
        Mon, 19 Oct 2020 06:39:00 -0500
Subject: Re: [PATCH] media: platform: ti-vpe: Update the path to firmware
To:     Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Benoit Parrot <bparrot@ti.com>, Sekhar Nori <nsekhar@ti.com>
References: <20201012125200.11643-1-nikhil.nd@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <67d3fae1-5ba6-9f9a-3036-5752e3f6849d@ti.com>
Date:   Mon, 19 Oct 2020 14:38:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012125200.11643-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2020 15:52, Nikhil Devshatwar wrote:
> vpdma firmware is now available in the linux-firmware repo.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity/vpdma-1b8.bin
> 
> Update the firmware path requested by the VPDMA driver so that
> it gets looked up correctly in the filesystem.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
> index 2e5148ae7a0f..5a378449a4ff 100644
> --- a/drivers/media/platform/ti-vpe/vpdma.c
> +++ b/drivers/media/platform/ti-vpe/vpdma.c
> @@ -23,7 +23,7 @@
>  #include "vpdma.h"
>  #include "vpdma_priv.h"
>  
> -#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
> +#define VPDMA_FIRMWARE	"ti-connectivity/vpdma-1b8.bin"

I don't think "ti-connectivity/" makes sense for vpdma fw. I don't know if there are guidelines for
directories in linux-firmware, but "ti/vpdma-1b8.bin" would be better in my opinion.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
