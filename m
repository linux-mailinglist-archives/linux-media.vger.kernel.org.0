Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A807153F8A
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 08:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgBFH7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 02:59:34 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44298 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728075AbgBFH7d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 02:59:33 -0500
Received: by mail-wr1-f65.google.com with SMTP id m16so5897734wrx.11
        for <linux-media@vger.kernel.org>; Wed, 05 Feb 2020 23:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4T6JHJ65S3gXlsUQCQJOHLGtGG3rfW0klSWmfZGHV6Q=;
        b=hXQcGxFvwgqmKUVJXTK5dRsdGmXT443hFPx7aWanGILU7aaEo8Ixui1iQimx94k9fg
         YcUkCzGkWSmptK0vz47v4dKQGkfdqkc6aCUtottdOAtVQAEkoAxR/QtmUZFJgLiaqvmt
         eokVIu3bGf/viZ3txj0qeoZ6xi7gQe9kAh4BEfSXOhVKRa1ckb7I/7uXHJFCey+U1eJd
         gN8ZsvtG+K9PB3agSS2OwsqqqiFmWFewuyEHbEPFmAzJ7aC27RE4GzJHIoSmExhp6Zsa
         aWvWTaqBsI/zLWRY1G72Sh1694tP6QN+3+lBXg3eJu8mWn6WWIcmVX9wBJr/mGSTUmZV
         izvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4T6JHJ65S3gXlsUQCQJOHLGtGG3rfW0klSWmfZGHV6Q=;
        b=WAN9NzLguQXMqcSwL84fEHKCRoF0cAniXL2Ja8AQGE8VTL0BWGNUOeT4HH3vEk6FCg
         JufnYw+LHkuS/Ph2VxVXR4NnN80i5lFs8ciwuRORRiLSSjpkguPy4hI4bcW+SXyuV4UG
         YjmpNSjRGBoC15Kjt/We5F7oQ7meQjn+ZfFqG4793U4Jqz+3G8BC+/t85Gjmx6KA8jph
         gBaKKIEle6Qrv0FZmhwMC0ftQnkEN4pJQB+hofKYSvZgCjmubAcktWDz+oYzcd611ut8
         +teU8xepF7GbRtEYRaD7RheTS7LdtqZEujPFf+yisECQszuUenmFJbxWxbg+TFPsqOkD
         hGTw==
X-Gm-Message-State: APjAAAX9d2JxwuK8ZFN+oj9d3/pu+5+klRkHHss7K9B/r0RQ0sTf6hbl
        tFX26PZMTPV8yeEkbiFX5cCfzw==
X-Google-Smtp-Source: APXvYqzx41NwzMCoqYIOAllKMOLxPou7/sAGiCzfWqTv6wy/CaL2N5bZLO3CjxwgWAUV7du5c4X1Zg==
X-Received: by 2002:adf:fc4b:: with SMTP id e11mr2405074wrs.326.1580975971911;
        Wed, 05 Feb 2020 23:59:31 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7? ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
        by smtp.gmail.com with ESMTPSA id p5sm3096757wrt.79.2020.02.05.23.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 23:59:31 -0800 (PST)
Subject: Re: [PATCH] media: meson: vdec: fix OUTPUT buffer size configuration
To:     Maxime Jourdan <mjourdan@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200127151953.10592-1-mjourdan@baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <d6f50786-16d9-8933-30ff-418b47089149@baylibre.com>
Date:   Thu, 6 Feb 2020 08:59:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200127151953.10592-1-mjourdan@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/01/2020 16:19, Maxime Jourdan wrote:
> There's a bug currently where we always override the OUTPUT buffer size
> in try_fmt to the default value (1M), preventing userspace from setting
> a higher or lower size.
> 
> Now, only update the size in try_fmt if userspace passed 0.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
> 
> Note: this patch depends on Neil's series:
> media: meson: vdec: Add compliant H264 support
> https://patchwork.kernel.org/cover/11336953/
> 
>  drivers/staging/media/meson/vdec/vdec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 1be67b122546..2f30945ce916 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -519,7 +519,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
>  	output_size = get_output_size(pixmp->width, pixmp->height);
>  
>  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> -		pfmt[0].sizeimage = sess->src_buffer_size;
> +		if (!pfmt[0].sizeimage)
> +			pfmt[0].sizeimage = sess->src_buffer_size;
>  		pfmt[0].bytesperline = 0;
>  		pixmp->num_planes = 1;
>  	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> 


Will squash into v5 of "media: meson: vdec: Add compliant H264 support"

Thanks,
Neil
