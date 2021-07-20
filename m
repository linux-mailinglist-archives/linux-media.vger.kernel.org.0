Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0873CF9A9
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 14:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238119AbhGTLxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 07:53:31 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44225 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237862AbhGTLxZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 07:53:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 5owamtGFUhqx95owbmvnD5; Tue, 20 Jul 2021 14:33:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626784435; bh=SgVs08xYrU8M4EGDyVeDdbrqJ8SP9V6wFirHCrmdvWk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j30/Z68GcwkfvDIwKIcHD5UZBtjxUBp0URCumfhfHzfYH3AG5MBQcXHSi4JHq6ygN
         eWA0U/Uu6DjAsKNajekPkLUr+UylB29/u3Kd9mst0zRE7qK7xBCJOpxXMwmFb3cxmM
         o+y4P+Ubghsu1TYyFs6NdiWMGlzCzgTb+f+gQy6jhrer/m6VV7zKO21asbPyXttFRe
         KoW8gUUTl2o0WzESLARGmQyDe/SucQrwnlTdDbp+JJKd1uuqKlcstsTJySFCYmNjm6
         Qeo/UJyX8WRZKEGaEgiTUB2YxQM3NIwQE3Cs/6Mr2bwFEsZkHzxYxp3IMQwl+nwZdV
         U8V0X0T4+TRlw==
Subject: Re: [PATCH] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, dafna3@gmail.com, mchehab@kernel.org,
        tfiga@chromium.org, enric.balletbo@collabora.com,
        minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
        andrew-ct.chen@mediatek.com, tiffany.lin@mediatek.com,
        matthias.bgg@gmail.com, acourbot@chromium.org, hsinyi@chromium.org,
        eizan@chromium.org
References: <20210714134850.402-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <119da2d7-9e7b-10e0-a948-877b494dbeac@xs4all.nl>
Date:   Tue, 20 Jul 2021 14:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714134850.402-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLM2pz3o+9rE3y62LVO6TGFlEtP4S7gknqM2eaFM5q6vjbkp8Sqi2EyWzp+kbLGnnL+G9psB7Hzo5UMpOsA7EH9YE73dm6nkY4pgsZICrF1ZMlYaCy5u
 Wh65vqdKsnNNU5pJD5WT91CiOg0KaaCjruu+V6E95UkQ3Fi2DjfVIwe49shErDgYN14PPdGTx2jfvkLayIsnjUpMjnb+6Vpt7i6DfmC10c1aKeHnp4DIHrjp
 Xo6M2gHdT8ZbnHVLn0M+KeHAFAlxR11hEklhzNvIRfNKAb0tsNpzP0AaDoOrdJ4wwFgvCGzCrVTovnSI1AJY04S9n9gZ+4cq2ToavVNdUdJl/KyIhnjMdxYU
 Z2kyqGq+K+9OZbaPB2MChUuSLJYPAb6mXlQfqvNqFyb0YAco3f+7+yD4K7rF6xc5jfuLXKqLrhbEpoMdkyG+XfD4cKtOFtScbQZ53mIwo/MAfBTliYdOoJCz
 FejzeFD5JRHRFfdfFJpnEjZgdasUAyi/3VP3W5r8BSmqnzNJjOl0wY0MRn00KbxGFjWnGYikIWCBLI+vtR1zOcGlDS6BDXpI2upRnsaNWLkp+h00pky+TQYH
 HUw9OWJgd7YYl2xar0m6oXuw2OhvwyqaHcQ/CRO7k/uuz+B9B5XxpBLy5HgEcgTiG8D4iYxt+rf9/eR+xXB+6oXilTzzzIM5CstLCLry3gEskonXELf4E5l4
 vhVCH7qLgBqVFFSeOp1rtAL+kXzxvBh+mnC23It/7m6MyOLcOQmeMz54kmh2paT35QXIN+Hj7agzqeC9QqViNNGLxGoeDeirLKHdGA6J5YtzgcDH7prFSTMt
 Ka9M07tjtCN+hr+oEKgYPsuVdZ744qP7gMLcmHUhWG1X8MCOFx5nw0MwvcXvXw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2021 15:48, Dafna Hirschfeld wrote:
> From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
> 
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> 
> This patch ensure copy of a multile of 8 size by calling
> round_up(len, 8) when copying
> 
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Reported-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..b464d8192119 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -316,6 +316,7 @@ int vpu_ipi_send(struct platform_device *pdev,
>  {
>  	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
>  	struct share_obj __iomem *send_obj = vpu->send_buf;
> +	unsigned char data[SHARE_BUF_SIZE];
>  	unsigned long timeout;
>  	int ret = 0;
>  
> @@ -349,7 +350,9 @@ int vpu_ipi_send(struct platform_device *pdev,
>  		}
>  	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>  
> -	memcpy_toio(send_obj->share_buf, buf, len);
> +	memset(data, 0, sizeof(data));

Hmm, how about:

	memset(data + len, 0, sizeof(data) - len);

> +	memcpy(data, buf, len);
> +	memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
>  	writel(len, &send_obj->len);
>  	writel(id, &send_obj->id);
>  
> 

Also note Enric's reply.

Regards,

	Hans
