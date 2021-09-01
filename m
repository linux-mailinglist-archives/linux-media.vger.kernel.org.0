Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E143FD5E7
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242125AbhIAIvP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241376AbhIAIvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:51:14 -0400
X-Greylist: delayed 1834 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Sep 2021 01:50:17 PDT
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC364C061575;
        Wed,  1 Sep 2021 01:50:17 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LLwjmc8LmlQKhLLwlmI1c6; Wed, 01 Sep 2021 10:50:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630486216; bh=L1Hm2aLkf3i/IjC5xIVHFEMl/4mMjYqCoTuVtImCZAk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qiqTv2u71ZnOwm2+AZqXSAbwl7OBbXyPotNF9UtraXTcDMSN2hlmT/yVajlvedDiJ
         3se9xFDNM/gATH+g2nlSrrZz08iWvLFI6XF57oA9spHF5vUv6PmHiiIMIgMmAaqFkh
         87A6fZ4t9T9vNAGRwlPAMwD/GIJimd4GlRFm9ML1nRX9OA7uvpWUAeEz8cway9KjPM
         5FkxNCZMNvr13xbKWkaSTF5BVaAhQg8cmWfVSe7gs9HGXSMEJnKEQKA2zuR8aDzU/9
         qp8WtFpCxwIb7WJRnh6ssTzOEvxJ437NIWqg1+BDl77gUsi+1bbaBdM/HvGXq3u4uP
         pvF7xygjFGrow==
Subject: Re: [PATCH v3] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Courbot <acourbot@chromium.org>, kernel@collabora.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        dafna3@gmail.com, mchehab@kernel.org, tfiga@chromium.org,
        minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
        andrew-ct.chen@mediatek.com, tiffany.lin@mediatek.com,
        matthias.bgg@gmail.com, courbot@chromium.org, hsinyi@chromium.org,
        eizan@chromium.org
References: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c1712278-8d18-2958-853b-09e5097ddce7@xs4all.nl>
Date:   Wed, 1 Sep 2021 10:50:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBTca500Lj6dw3wajxUQ5QRMAYqdwKA6ftnq1Y+n5E26TXacpH65KTGTNvyD+k09c/0JrPoIr71SZRlxb6lZxZGra1qADtYH1MCdnguL4xIPl8BO+QGA
 heq0ktLKmXuHsQ96m8ve5lrTG/7hnYIaH1l88rTKHxfbp3SdJ0RyB4zmNKoe7h3kFmAze0WB4T+lH52YsaOCkUp41mVq+ObemqYRpDX6lNo8hF0PUfxRRkAq
 SUC1oExH+1x84kzsw8AZuOV/Mlm99S7sO1d6ZedS/CKXzovEJASyTz4heQ64NlNiXt1u5OG1ybBNLsUzEZJH5yyl/T0aZMqtVqU9KJPtvagHfkxRCP/C9IAD
 dpjZv0Fqulz52N7TVe3ChRp7NZD2llLX9XbZtzwQrdpSeQOYt+ZLkTzNEF2sjk6w2nSkZaPE0wPSh+H1L8zB72cXS411WQH/kxEu5EZC6ExCHlSJdB1B6Nu0
 r+ReHqh6t7BBemDHGC5ZrJhPzKUfcvJX3AS1k1yrXgDIqzWc/3gSH3qPHLwtSpZ5d0xg3LK28So575fx17bCHqGSx4O22Z8Hd2KTBcgMEtiMfgDWLzPJ4v7Y
 7nKaCOBya9GeNJbEqqsFqsHRO+xpWFCMQSLfJMiwjSS31w7Lj70CR1VbNEeH/+DdjmbwrKVmzWaSCs7+WJXpeHchN4m/7MxvA7XKLf9XOtu3+s0yZVTUT6YV
 M03P2r8t0HNVBIvBuild8iO14JFR01471w+4jMTHsj8F/JZFuhDO6lCBubrS/O4gUz7+p/ObDbjbg8qgmEjxgo85H+IlT712MCM7luX5NPZ6EWFIFdSQS952
 Lg6Ox2Ta8+0cyL8WLYjexcdeEobC+gh8pabD1Ef9wvFZtfmxgmg2yKC4K4A+ik1H0thUZHL+2/G7xbwOTPY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2021 12:17, Dafna Hirschfeld wrote:
> From: Alexandre Courbot <acourbot@chromium.org>
> 
> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
> 
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> 
> This patch ensures the copy of a multile of 8 size by calling

multile -> multiple

> round_up(len, 8) when copying
> 
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> changes since v2:
> 1. do the extra copy only if len is not multiple of 8
> 
> changes since v1:
> 1. change sign-off-by tags
> 2. change values to memset
> 
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..658161ee3e4e 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -349,7 +349,16 @@ int vpu_ipi_send(struct platform_device *pdev,
>  		}
>  	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>  
> -	memcpy_toio(send_obj->share_buf, buf, len);
> +	if (len % 8 != 0) {

You need to add a comment here explaining why this is done (basically what
you also say in the commit log).

Otherwise people would have to dig into the git log to figure out why this
code is the way it is.

Is len often not a multiple of 8? If that's the case, then it might be easier
to just always do the memset/memcpy.

Regards,

	Hans

> +		unsigned char data[SHARE_BUF_SIZE];
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

