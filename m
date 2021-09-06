Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41455401B4A
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 14:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242088AbhIFMiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 08:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242065AbhIFMiG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 08:38:06 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01A8C061575
        for <linux-media@vger.kernel.org>; Mon,  6 Sep 2021 05:37:00 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q14so9669346wrp.3
        for <linux-media@vger.kernel.org>; Mon, 06 Sep 2021 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VX21Q1wpGiOpiva+IThVTrifsWOLftr6Zwi9vQzn0VI=;
        b=q/npCZBG5L3lGLbMSdu4NMX3Ctk6Ad7I+cGARbRcucC/TQNttqexAphG2Xr950+CRn
         lQXjILuqgzrdJANuQpKf4iojCSc53auX2OnwPuSi+KqCDYfm8LdaIykVVprQtKXhqkNh
         ltB11KXTVtIzdjqSsrD/mUehKx6+M2HrJn3Ogh9pIdFf5L02P6z2gCBN/5+GxKU2E01V
         j26omRs5aYCxRy8omLxTP7WK93BvTmx+qVk0puabyNlrtFh56vqbB0Ble1+sZ6AqXF2A
         IvWeHtp8sDfCoqSiiE0KfG1Ruecnf+sckUzReZu1jadnU59cKoyKVkvQmhGvZLnKQglf
         QCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VX21Q1wpGiOpiva+IThVTrifsWOLftr6Zwi9vQzn0VI=;
        b=ayvDQh+pQCaYPtALPsoEqub9wqTwcZ88Aiv+Y5/Z0BmM4YFdx1457RpX3gOCBRXs6c
         LmJ7PnxC1t8P6/QGIs+3rEl3ePNPw7ryh7ZN536JhKbWsxoBD/Ti+SPN6f6pigZac0jS
         A1oMnYj3pq5G5TNTn46T2ioln7EOXTunY/yN0hfr8dR7h67tVsumHNDQGCxy0GeIcR4i
         nZyi0YksNM1QfO2UsnGwoF6b9lHUhEsHmbdurDmeoVYGt7l12CldGM3hPMM3lripCGMB
         h9AFyObcMEZw90eCCIaoAw6E9JXZSwc+SIAnj/Dyl8loh+OuXPQp9M8+GZ5yMFZ9+ohT
         vMwQ==
X-Gm-Message-State: AOAM5302IJ5h+Aw3cTrQe09xZ7lAHTA+37OoGuKN2w4MiclbuCcj+dth
        VOw07h+WcFPK/E+Q74WEuKbepg==
X-Google-Smtp-Source: ABdhPJwEMng/N0V1zZ4ZkG+iEuNFlsHHHf1I8nEkBFzbiKlIdgCCQhlygeCfux6P+CO7yWmAtu2tZQ==
X-Received: by 2002:adf:c144:: with SMTP id w4mr13310866wre.398.1630931819430;
        Mon, 06 Sep 2021 05:36:59 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9afb:57ba:5ea:2010? ([2001:861:44c0:66c0:9afb:57ba:5ea:2010])
        by smtp.gmail.com with ESMTPSA id c2sm7744538wrs.60.2021.09.06.05.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 05:36:59 -0700 (PDT)
Subject: Re: [PATCH] Media: meson: vdec: Use
 devm_platform_ioremap_resource_byname()
To:     zhaoxiao <long870912@gmail.com>, mchehab@kernel.org,
        khilman@baylibre.com
Cc:     gregkh@linuxfoundation.org, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210906070013.7362-1-long870912@gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <1b6f9a78-c648-e8b0-2ae6-1922aad89c49@baylibre.com>
Date:   Mon, 6 Sep 2021 14:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906070013.7362-1-long870912@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

In subject Medis should be media

On 06/09/2021 09:00, zhaoxiao wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> Signed-off-by: zhaoxiao <long870912@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/vdec.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index e51d69c4729d..8549d95be0f2 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -994,7 +994,6 @@ static int vdec_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct video_device *vdev;
>  	struct amvdec_core *core;
> -	struct resource *r;
>  	const struct of_device_id *of_id;
>  	int irq;
>  	int ret;
> @@ -1006,13 +1005,11 @@ static int vdec_probe(struct platform_device *pdev)
>  	core->dev = dev;
>  	platform_set_drvdata(pdev, core);
>  
> -	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
> -	core->dos_base = devm_ioremap_resource(dev, r);
> +	core->dos_base = devm_platform_ioremap_resource_byname(pdev, "dos");
>  	if (IS_ERR(core->dos_base))
>  		return PTR_ERR(core->dos_base);
>  
> -	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
> -	core->esparser_base = devm_ioremap_resource(dev, r);
> +	core->esparser_base = devm_platform_ioremap_resource_byname(pdev, "esparser");
>  	if (IS_ERR(core->esparser_base))
>  		return PTR_ERR(core->esparser_base);
>  
> 

With the subject fixed:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
