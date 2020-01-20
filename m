Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E37B1142B41
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 13:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgATMsk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 07:48:40 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35746 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATMsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 07:48:40 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KCmZfE074240;
        Mon, 20 Jan 2020 06:48:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579524515;
        bh=4wcdhSfhWRIfKcGWoUQfbdE/ag7R8VxL3fQKB4G2yFg=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=mlzcibfcx5zhfHfKaGMYHI6u2Gnu256hsy2l694Nmj7BQNkueRWZ5kixV1FnzbVCh
         CF12ZFQZ6yB9XInP6ZOwQ2ukEpe49KOZxGiWMpMLJHm/ZpmKDnFqfp2NpHTcGpjGMD
         rVaWByUryW8Ku5sUSMWFd+v8fi68EXcUR49K3d9s=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KCmZdx065725
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jan 2020 06:48:35 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 06:48:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 06:48:34 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KCmWaC042059;
        Mon, 20 Jan 2020 06:48:33 -0600
Subject: Re: [PATCH v2] media: rcar_drif: Use dma_request_chan() instead
 dma_request_slave_channel()
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <mchehab@kernel.org>, <rashanmu@gmail.com>, <geert@linux-m68k.org>
CC:     <vkoul@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20200120124754.26826-1-peter.ujfalusi@ti.com>
Message-ID: <741c34ad-deb4-d4aa-770f-be68ce2cbb0b@ti.com>
Date:   Mon, 20 Jan 2020 14:49:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200120124754.26826-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,


On 20/01/2020 14.47, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
> 
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.

yes, this is suppose to be v3, but missed to change the subject-prefix.

> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi,
> 
> Changes since v2:
> - Use %pe to print error name using the ch->dmach pointer
> - Set ch->dmach to NULL in case of error
> 
> Changes since v1:
> - Do not print error in case of EPROBE_DEFER
> - Added Reviewed-by from Geert
> 
> Regards,
> Peter
> 
>  drivers/media/platform/rcar_drif.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> index 0f267a237b42..3d2451ac347d 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -275,10 +275,14 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
>  	for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
>  		struct rcar_drif *ch = sdr->ch[i];
>  
> -		ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
> -		if (!ch->dmach) {
> -			rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
> -			ret = -ENODEV;
> +		ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
> +		if (IS_ERR(ch->dmach)) {
> +			ret = PTR_ERR(ch->dmach);
> +			if (ret != -EPROBE_DEFER)
> +				rdrif_err(sdr,
> +					  "ch%u: dma channel req failed: %pe\n",
> +					  i, ch->dmach);
> +			ch->dmach = NULL;
>  			goto dmach_error;
>  		}
>  
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
