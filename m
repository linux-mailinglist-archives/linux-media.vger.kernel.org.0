Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9492075FE
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 16:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391263AbgFXOqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 10:46:13 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40491 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389253AbgFXOqM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 10:46:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o6f6jhpLANb6lo6fAjtkqH; Wed, 24 Jun 2020 16:46:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593009970; bh=m0tTR37wqpuWPIr/PsvMjkPZZL8C1ewWgQX8LOQTc/4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r+XVcpBXRLLRHlCyyMEM536/BPKRicjjO1R8F1mbebmIx8Ms6+BHM4sDQ+xUsfDWy
         DVAUNz1t/vVe/FbQS+gLTKMVLbXTvirC6RmpVVydw92nfDbYiK10b6v+bJ80OnnHeP
         QRPguT0MMW1uWYuZdMEvzcq+w7aYvqT8ALuE/w4lW63xBj70E9xL3m3Ml+Hjxx5VQ3
         g21InAduTHCn/HHa4bb65Z2jlkHizghRiiuXu7eyeRc9r0LxueyOBOa5/Y4Az6jo1P
         13rwaxicVjWJLhoOMLu4jsbtWJuYu9vooL8r8Vb5jriOCGwbaZBwrtcYImZ3DyiTC7
         SRhVRJn4FzUbQ==
Subject: Re: [PATCH] media: s5p-g2d: Fix a memory leak in an error handling
 path in 'g2d_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kyungmin.park@samsung.com, kamil@wypas.org, a.hajda@samsung.com,
        mchehab@kernel.org, s.nawrocki@samsung.com, sachin.kamat@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200426200631.42497-1-christophe.jaillet@wanadoo.fr>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6a59180f-b216-b2f5-0524-17eca8f53992@xs4all.nl>
Date:   Wed, 24 Jun 2020 16:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200426200631.42497-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDMLtlXSNg2KyezTbxr+sSjISqSOmfrwcdLLuKvgkRQ7SZUHJBiJvrrxv/rbxG9O+j3sWUguywINSLSu5aV8UiSDu+vV7MUFygoZZlnvSj2VqZfZBJr4
 DHZd+YMyz1WiuP4T1TZCWm6JTBYH2HdxxLtIn2fVhZ9gsEZ8RUEWBUTyQO762cx7kYibt7BWfN7aMgU4eD/uTw0MHnilbPQNqGpZVE3SjCF0ViQTWwook3iw
 qzFCbXT5d4CI4/vxkZ0BFAISOxk58UvxB07FxwipiX8nyRoTug1lPR0rgO1a+9fwck/Ny1U3yhbMnqmItRWLk7FBZzBA9hSHyd4C4rEPy72QjICduQlIsJ0a
 ihD719PcK6Ybnp4OEUJD+v3qMbW116wXqNmBrci0Vdo9m/CJWhn2+b51DMktWRKIGK+hGDJEAgHyYYkWdj1S/qn3vZnocuv82Fzf92m7sAb0eHygK4kBTxfu
 KYbJ5GwNpTMk8hgB/GPTIib8qCcKjcmxuGSMe1nltt1lzzMKhdn6OgUGJYWNDrxAU4j7kd4dGP4t0MsIUwJcWuAwOWu9eFqGq0NRCA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/04/2020 22:06, Christophe JAILLET wrote:
> Memory allocated with 'v4l2_m2m_init()' must be freed by a corresponding
> call to 'v4l2_m2m_release()'
> 
> Fixes: 5ce60d790a24 ("[media] s5p-g2d: Add DT based discovery support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/platform/s5p-g2d/g2d.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
> index 6932fd47071b..ded6fa24677c 100644
> --- a/drivers/media/platform/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/s5p-g2d/g2d.c
> @@ -717,12 +717,14 @@ static int g2d_probe(struct platform_device *pdev)
>  	of_id = of_match_node(exynos_g2d_match, pdev->dev.of_node);
>  	if (!of_id) {
>  		ret = -ENODEV;
> -		goto unreg_video_dev;
> +		goto free_m2m;
>  	}
>  	dev->variant = (struct g2d_variant *)of_id->data;
>  
>  	return 0;
>  
> +free_m2m:
> +	v4l2_m2m_release(dev->m2m_dev);
>  unreg_video_dev:
>  	video_unregister_device(dev->vfd);
>  rel_vdev:
> 

This isn't right. The real problem here is that video_register_device() is
called before several other initialisations as done, such as v4l2_m2m_init and
the of_match_node check.

To do this properly video_register_device() should be called last in the probe()
function.

Regards,

	Hans
