Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAA2EE649
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 18:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbfKDRk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 12:40:59 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56460 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbfKDRk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 12:40:59 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4HewWp069876;
        Mon, 4 Nov 2019 11:40:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572889258;
        bh=1SdcqkctwVEd8EfJ2TEpdswOCkUOemsqU06jjyeDLfE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Ct8sncutvnPjKevr1gmJXmVRkJy9ZB/6P8vz80IFiK1iYJDz0+NohGACwKxT5Lrcq
         RvEWHTXWP417H7jSspgBoB7+bl2KjaHpiAvOId/utDGyg0lIAvY8kFLe4WtVyyAjUt
         2Mtpn4erNUK1U0oTy5nWJ/MRs5uvoWNb7kUunMms=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4HewTU071508
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 11:40:58 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 11:40:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 11:40:43 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with SMTP id xA4Hev65026463;
        Mon, 4 Nov 2019 11:40:58 -0600
Date:   Mon, 4 Nov 2019 11:40:57 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Subject: Re: [PATCH 6/8] ti-vpe: fix smatch error
Message-ID: <20191104174057.aurtwpyzrgmvegwt@ti.com>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
 <20191103112338.22569-7-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191103112338.22569-7-hverkuil-cisco@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote on Sun [2019-Nov-03 12:23:36 +0100]:
> This patch fixes this error:
> 
> drivers/media/platform/ti-vpe/vpdma.c:767 dump_dtd() error: '%pad' expects argument of type 'dma_addr_t*', argument 2 has type 'uint*'
> 
> dtd->start_addr is a u32, so no need for %pad.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
> index 817d287c8138..2e5148ae7a0f 100644
> --- a/drivers/media/platform/ti-vpe/vpdma.c
> +++ b/drivers/media/platform/ti-vpe/vpdma.c
> @@ -764,7 +764,7 @@ static void dump_dtd(struct vpdma_dtd *dtd)
>  		pr_debug("word1: line_length = %d, xfer_height = %d\n",
>  			dtd_get_line_length(dtd), dtd_get_xfer_height(dtd));
>  
> -	pr_debug("word2: start_addr = %pad\n", &dtd->start_addr);
> +	pr_debug("word2: start_addr = %x\n", dtd->start_addr);

Reviewed-by: Benoit Parrot <bparrot@ti.com>

>  
>  	pr_debug("word3: pkt_type = %d, mode = %d, dir = %d, chan = %d, pri = %d, next_chan = %d\n",
>  		 dtd_get_pkt_type(dtd),
> -- 
> 2.23.0
> 
