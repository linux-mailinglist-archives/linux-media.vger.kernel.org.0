Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C533393329
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 18:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbhE0QIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 12:08:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39528 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbhE0QIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 12:08:01 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RG6P1S077901;
        Thu, 27 May 2021 11:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622131585;
        bh=YeoTFdKp6IxUVyN2wmRPBI7eBnP9g3G0klGNiDtHzGc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Wu64+3LhSyqsw8cpub4RbwjKFpq31yE4Am/pGUF/ZKgEb7aYxGvW5ctHiQijlH/MN
         MsAG612tncWMb2ajwX6BIrbAzyfd5Hl16IKl4cI0JQTGWNfhiFbRMInxo4VgUA65DS
         A5oX22gUWEia8Xpf2iAlTPLyPTTKAzwjHJFxMqpY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RG6Pu2087476
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 May 2021 11:06:25 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 11:06:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 11:06:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RG6OjN077494;
        Thu, 27 May 2021 11:06:25 -0500
Date:   Thu, 27 May 2021 21:36:24 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 38/38] media: ti-vpe: cal: add multiplexed streams
 support
Message-ID: <20210527160622.c4tumqkld2rrwbva@ti.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-39-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-39-tomi.valkeinen@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 24/05/21 02:09PM, Tomi Valkeinen wrote:
> Add routing and stream_config support to CAL driver.
> 
> Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
> separate streams at the same time.
> 
> Add 8 video device nodes, each representing a single dma-engine, and set
> the number of source pads on camerarx to 8. Each video node can be
> connected to any of the source pads on either of the camerarx instances
> using media links. Camerarx internal routing is used to route the
> incoming CSI-2 streams to one of the 8 source pads.
> 
> CAL doesn't support transcoding, so the driver currently allows changes
> only on the camerarx sink side, and then copies the sink pad config to
> the source pad. This becomes slighly more complex with 8 source pads and
> multiple streams on the sink pad. A helper,
> cal_camerarx_get_opposite_stream_format(), is added, which uses the
> routing table to get the format from the "opposite" side.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 303 ++++++++++++++++---
>  drivers/media/platform/ti-vpe/cal-video.c    | 103 ++++++-
>  drivers/media/platform/ti-vpe/cal.c          |  34 ++-
>  drivers/media/platform/ti-vpe/cal.h          |  12 +-
>  4 files changed, 385 insertions(+), 67 deletions(-)
> 
[...]
> @@ -1178,18 +1177,33 @@ static int cal_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Create contexts. */
> -	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
> -		if (!cal->phy[i]->source_node)
> -			continue;
> +	if (!cal_mc_api) {
> +		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
> +			if (!cal->phy[i]->source_node)
> +				continue;
> +
> +			cal->ctx[i] = cal_ctx_create(cal, i);
> +			if (!cal->ctx[i]) {
> +				cal_err(cal, "Failed to create context %u\n", i);
> +				ret = -ENODEV;
> +				goto error_context;
> +			}
>  
> -		cal->ctx[i] = cal_ctx_create(cal, i);
> -		if (!cal->ctx[i]) {
> -			cal_err(cal, "Failed to create context %u\n", i);
> -			ret = -ENODEV;
> -			goto error_context;
> +			cal->ctx[i]->phy = cal->phy[i];
> +
> +			cal->num_contexts++;
>  		}
> +	} else {
> +		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> +			cal->ctx[i] = cal_ctx_create(cal, i);
> +			if (!cal->ctx[i]) {
> +				cal_err(cal, "Failed to create context %u\n", i);
> +				ret = -ENODEV;
> +				goto error_context;
> +			}
>  
> -		cal->num_contexts++;
> +			cal->num_contexts++;

In cal_async_notifier_complete() I see:

  for (i = 0; i < cal->num_contexts; i++)
    ret = cal_ctx_v4l2_register();

This means that if the CAL device has 8 DMA contexts it will create 8 
/dev/videoX nodes, even if the hardware setup is only capable of 1 
stream.

Would it make more sense to populate /dev/videoX nodes based on the 
configured routing? So for example, if only one pad is being used to 
output, only create one node corresponding to that pad. If there are 3 
pads being populated then create 3 nodes and so on.

> +		}
>  	}
>  
>  	/* Register the media device. */

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
