Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056C01CD41D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 10:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgEKIh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 04:37:58 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33531 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728562AbgEKIh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 04:37:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Y3wcj9SbXhEkrY3wdjFaWQ; Mon, 11 May 2020 10:37:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589186274; bh=ZJdufNdhciwh1k1owFxPLJAjjfhKcGHDCjZ8YaoNOfw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=J53Pnaa2C8Qc8PqGr2lJIqcjRUegc4X5XjVtX0pQYKK+ujkQrn6MkrUo7Q79W7o3e
         /dCKquZ3agsORd8OgWVsh77n8+PuFWzKcyTUMCjXrDrfOKCIslAqZ3KGwLu4WF7Wbw
         kxpZkeZsmiSW9y+6G310V48QdNWOWrnNzTC42o7cj3k/Dxq40If6XKuqrIKW8pY0g7
         pYVe39htQ539V3bJscO2vlxLYL1LBmF3mZNNgkezuyCr/IjcquapXPCqy077KMuuAZ
         5CH+1WCNQYndhkWR9QoGylPlqngLG95+jZHkyYMk4mvGjCEon47JDF8tb0JJfpbjPp
         n8txd/MZy0crA==
Subject: Re: [PATCH v8 08/14] media: platform: Change case for improving code
 quality
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        senozhatsky@chromium.org, mojahsu@chromium.org,
        drinkcat@chromium.org, maoguang.meng@mediatek.com,
        sj.huang@mediatek.com
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-9-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4b8cc41e-5171-0d48-f588-96e4212ab22c@xs4all.nl>
Date:   Mon, 11 May 2020 10:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200403094033.8288-9-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCniNJXgaQ7H+AmqfcLoiP98kKWKQEaV/jbXSnIYOkR8vskmncR5OJ/uqGJ3HFjrkBEbl7ZZZOPsIsa5suNEXos4M10ba5UpXYLPr8P+CkcQcEuy2y1m
 O+AvikV2+3xBYvhQua4+dkBeI75eMwjaIXK3+ySsRCjmhbM0PEFbaHdnsNNAm6N1DngHm3Y8D0yi/2jKVBxa1RBhNXSAyRxj5S0JWpnXQIMYaYovnMkQZo5p
 HjwrSsdHzQsJsGJs2ct4gUDz7AhGpZieipIY9Ra+r89dhM9WWcrPRlP78eBobWM/wGo7cZhfhESAs6iSZCdon/1rR5O0Oy5xH3cOD7EpcvAcbw58Lp5D9BGo
 KwSyinqY58RPVe43j1J4NMyTm+uSfbKEJtEa2TBUFArOr/EUlBRSdkSqlFFEuRP2ZY5Wc7U/PulCR4dN0Ok0ZInEL+Sv7wNbnBucivKqn2yw2n1FcvlKa7Hs
 Nipdkr/GjraGZyDNL+y/wKctU2O3LBIqYQ0alxEJf9IEShRsV5Glt4FiToHtJzqwqpXf9JaeKv/mSO7a9A9WMzevv3hX1YI4/K6gyUoTwnsKrzctoUTmTRjn
 1VbnjBLODYGklJILTxmex44HqD14pQzLjKSEAr3nADpBRxGqUZYSgnMzH6CwJAKiZ4Kv76xzM18uHWF4Uy6ouZPFfFc6B+tc94MG+j92nJEmZrsTQx6KiFWW
 yaHhqFn+Gl3/5tRvOJbS6lulowOGjwhbUsgeB2mCs2RlOpME1a8KYbj2vorhcTpcezzjiqwRYDvHFQURYUFUH06XXpRil5P0FJPIEgbKk6PMryWPNRgrduMC
 m1XwA76LVljvrt8C3l+E+WNIBRi1kcXshN+lBL4yi2RTS32T5e2jelQekik9fcqxrSztskycMooBAxTwfwDm5ErvLyLLd//tajrB0AJF
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/04/2020 11:40, Xia Jiang wrote:
> Change register offset hex numberals from upercase to lowercase.

Typos:

numberals -> numerals

upercase -> uppercase

Regards,

	Hans

> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
> index 94db04e9cdb6..2945da842dfa 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
> @@ -20,29 +20,29 @@
>  #define BIT_INQST_MASK_ALLIRQ		0x37
>  
>  #define JPGDEC_REG_RESET		0x0090
> -#define JPGDEC_REG_BRZ_FACTOR		0x00F8
> -#define JPGDEC_REG_DU_NUM		0x00FC
> +#define JPGDEC_REG_BRZ_FACTOR		0x00f8
> +#define JPGDEC_REG_DU_NUM		0x00fc
>  #define JPGDEC_REG_DEST_ADDR0_Y		0x0140
>  #define JPGDEC_REG_DEST_ADDR0_U		0x0144
>  #define JPGDEC_REG_DEST_ADDR0_V		0x0148
> -#define JPGDEC_REG_DEST_ADDR1_Y		0x014C
> +#define JPGDEC_REG_DEST_ADDR1_Y		0x014c
>  #define JPGDEC_REG_DEST_ADDR1_U		0x0150
>  #define JPGDEC_REG_DEST_ADDR1_V		0x0154
>  #define JPGDEC_REG_STRIDE_Y		0x0158
> -#define JPGDEC_REG_STRIDE_UV		0x015C
> +#define JPGDEC_REG_STRIDE_UV		0x015c
>  #define JPGDEC_REG_IMG_STRIDE_Y		0x0160
>  #define JPGDEC_REG_IMG_STRIDE_UV	0x0164
> -#define JPGDEC_REG_WDMA_CTRL		0x016C
> +#define JPGDEC_REG_WDMA_CTRL		0x016c
>  #define JPGDEC_REG_PAUSE_MCU_NUM	0x0170
> -#define JPGDEC_REG_OPERATION_MODE	0x017C
> +#define JPGDEC_REG_OPERATION_MODE	0x017c
>  #define JPGDEC_REG_FILE_ADDR		0x0200
> -#define JPGDEC_REG_COMP_ID		0x020C
> +#define JPGDEC_REG_COMP_ID		0x020c
>  #define JPGDEC_REG_TOTAL_MCU_NUM	0x0210
>  #define JPGDEC_REG_COMP0_DATA_UNIT_NUM	0x0224
> -#define JPGDEC_REG_DU_CTRL		0x023C
> +#define JPGDEC_REG_DU_CTRL		0x023c
>  #define JPGDEC_REG_TRIG			0x0240
>  #define JPGDEC_REG_FILE_BRP		0x0248
> -#define JPGDEC_REG_FILE_TOTAL_SIZE	0x024C
> +#define JPGDEC_REG_FILE_TOTAL_SIZE	0x024c
>  #define JPGDEC_REG_QT_ID		0x0270
>  #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
>  #define JPGDEC_REG_STATUS		0x0278
> 

