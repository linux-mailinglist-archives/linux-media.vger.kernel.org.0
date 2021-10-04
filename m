Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B5A420879
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 11:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbhJDJjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 05:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbhJDJjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 05:39:24 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0A2C061745;
        Mon,  4 Oct 2021 02:37:31 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id XKPVmnnng3tiGXKPZmgzkA; Mon, 04 Oct 2021 11:37:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633340249; bh=5Ci8s2DazLaZ9bxmkGNuyIZQ7JnbHSU01SAmc2+SYf8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hxnXeA36b/YS5wIwszTrjo0on9Mh/kY18flFMAroeH0pWIBptM2ZuAHrMfh/ukWvo
         ZAuepwZGCPD0GZ5jmc1jTokS4lUgWIOlG4rqvYcStPV5L6Qr2021UwcphluhCJ4dUI
         q5kHY4JhWG3Sb2EUwqxFO2FXKqrFcntkA5ntHjhzzT5s7brFeb1WAiMQVS8PpR2+XH
         d+Nkt1UY14H9Dp2ufZoKEj0TO3CzxfGzFTiqVys5lPv9oA3AsKqfSeAs4r4dXF6CAy
         j1Ucao+6x302d0QoZ2hFNdMoPRnYUBWtOjFpYCaLHk1d/UmlBsRMbgB/iO7DNK8wFL
         rIvqnefJtY3Wg==
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Courbot <acourbot@chromium.org>, kernel@collabora.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        dafna3@gmail.com, tiffany.lin@mediatek.com,
        andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com,
        houlong.wei@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
Date:   Mon, 4 Oct 2021 11:37:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBcoqINj/QBOZ/cBR0T0r4mV2UCZeOAv+LCbTi5subfRNdA0TIAV5vIjv8LEPzZsM7FJ2HPeqXl8QUUHI2fYAjML5dhqX0Zl29qOe6C1CVPgRSBqJr8Q
 t9E5Nit1WcGBgxnv+FVRiWysil7iyaSHSmIR+QlmErwseMha6D7Z6pHVzAwjBsbqICzsKlUiurPIXW/Y5QV21Uir0IVucKS//1W95OxRiplt2NmMEDRV2ROi
 x5YSk7d66zaqovSFB+FqC8kh8RX5siBP+Vv2wJ2dex/wb2TIx/EtsZjdPVlGImmb1p+FQOUtAci0ryGujSnCvkTxDz6lYLQjgYr5sWjW9WQP1p221jDkBATe
 J551v1a6DqFucU5c7w3gd+F+AlliJs71K04GO5AkqKMg77MV+S3TcFI//5cYKOBRQAeTEaiS6IjNCdC+0wwEpseNkT9XRbop7b/72wEunMkGGwEgY/ZIXe9j
 yniV/33nB/CdACdZEPcIWHdE04HqXqtLAFXfhxX0/NkNJgB006kA+K6WHcYQt+lIlRSWziUDoXRMQjh6pxx0zM2m8w9d44l2HD+1FfCk/cpt076m1IIaSpvU
 /jK8cP/lkXsNYCXAAct5XYR+F37O8WCUgym82j+rC9BYoX5ntp0DxNA5qRMZbD4Hs4b3ZWQzdQJlfk/LcNPDXyfSTIV0a2+7z+JJxVcsaAbvBw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/09/2021 19:04, Dafna Hirschfeld wrote:
> From: Alexandre Courbot <acourbot@chromium.org>
> 
> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
> 
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22

Why do errors appear? Is that due to a HW bug? Some other reason?

> 
> This patch ensures the copy of a multiple of 8 size by calling
> round_up(len, 8) when copying
> 
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> ---
> changes since v3:
> 1. multile -> multiple
> 2. add inline doc
> 
> changes since v2:
> 1. do the extra copy only if len is not multiple of 8
> 
> changes since v1:
> 1. change sign-off-by tags
> 2. change values to memset
> 
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..1df031716c8f 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -349,7 +349,20 @@ int vpu_ipi_send(struct platform_device *pdev,
>  		}
>  	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>  
> -	memcpy_toio(send_obj->share_buf, buf, len);
> +	/*
> +	 * when copying data to the vpu hardware, the memcpy_toio operation must copy
> +	 * a multiple of 8. Otherwise the processing fails

Same here: it needs to explain why the processing fails.

> +	 */
> +	if (len % 8 != 0) {
> +		unsigned char data[SHARE_BUF_SIZE];

Wouldn't it be more robust if you say:

		unsigned char data[sizeof(send_obj->share_buf)];

I also think that the SHARE_BUF_SIZE define needs a comment stating that it must be a
multiple of 8, otherwise unexpected things can happen.

You also noticed that the current SHARE_BUF_SIZE define is too low, but I saw
no patch correcting this. Shouldn't that be fixed as well?

Regards,

	Hans

> +
> +		memset(data + len, 0, sizeof(data) - len);
> +		memcpy(data, buf, len);
> +		memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
> +	} else {
> +		memcpy_toio(send_obj->share_buf, buf, len);
> +	}
> +
>  	writel(len, &send_obj->len);
>  	writel(id, &send_obj->id);
>  
> 

