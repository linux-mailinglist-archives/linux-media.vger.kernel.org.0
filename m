Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F33C7153F88
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 08:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgBFH71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 02:59:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40489 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728226AbgBFH70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 02:59:26 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so5763626wmi.5
        for <linux-media@vger.kernel.org>; Wed, 05 Feb 2020 23:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eoegjXhvNrzq/yPyDDY1fsYH13mDAjgXSwvtXb8bIp0=;
        b=k+qdiP8SXubzdN35uHnwmScHPsqUObqr9t7ajuc4nzrMPqUgHIu5GUCp/jIH8vLWtb
         D0iZfBQ6gzthNokG+tF+TwHsuCi7BOOnC/J1a2hLvOQmtOEP+hMOu3pi3fKk2b58KKGu
         CSPAahFuMjGuJdJZaUnnwzaiuDVYd+p9v0OGOMmHTHDR3fa6PhNwNfCj+nnCCio905bL
         lCSd2E1FYDqDsmBRM4rIEofPZ+rp9anRZeQBLNKTzigXwR7ouV+Fd/f/alLu+h74+vvI
         V4O+/DndT3wC9/0ZWxuY1w3IF/2ZTcXTpuJK/28l1X8DiApd72z6jXa+HcIIq8OdcKq1
         u2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eoegjXhvNrzq/yPyDDY1fsYH13mDAjgXSwvtXb8bIp0=;
        b=f/U34L8/3kntuNgczzf40mUcDa/ZlbNG0l1SzZftdLUeEPoZ8mSOY178YiflHAFToV
         pbBKho5T0Rwk06QYDZkRxiT1iNUz1nws/5Tn3AL1sZMg5Zaqd5zsoBcSUDAlF1srEQLf
         N5QgmGJm0rLON+GBmt3ZR8lY8NWWVnxrF2TeNjbFSB1f6i6VSgmSo3rnS3mFc7O0o1GF
         IVZc6DJSUGW3HbM9MVsmrntPplNcRcw4VwnPC3qvbS3wtmosTfkxGPaziAe6CXmEPI7L
         B6C/YnnU5O/nqeFVdnj4zpAzQTQX3Baiu9289JtU+Sw0vCavLsgWyTmWhAORztoBD0iN
         eaOg==
X-Gm-Message-State: APjAAAX/JjsVCXHtKQpiMu4e8GT1Vnz29OIfrs4RfnQiECAZkdCx6jr0
        XyAs4Tq5h27/KIAD2eTPxnMtEg==
X-Google-Smtp-Source: APXvYqwCSdXddW98myM3fnl5L7QuVyagLqkVr9JPqdGl0MA51WmppRzXvShIjTHAUFVFJeLVJigrmQ==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr2935471wml.180.1580975962206;
        Wed, 05 Feb 2020 23:59:22 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7? ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
        by smtp.gmail.com with ESMTPSA id t1sm2744394wma.43.2020.02.05.23.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 23:59:21 -0800 (PST)
Subject: Re: [PATCH] media: meson: vdec: don't resume instantly if not
 streaming capture
To:     Maxime Jourdan <mjourdan@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200124155631.7063-1-mjourdan@baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <2d432fe2-b476-df53-4509-4bffe26e8b8a@baylibre.com>
Date:   Thu, 6 Feb 2020 08:59:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200124155631.7063-1-mjourdan@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/01/2020 16:56, Maxime Jourdan wrote:
> In case userspace configured the capture queue before the source change
> event, do not resume decoding instantly if it wasn't streamed on yet.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
> 
> Note: this patch is based off Neil's series:
> [v4,0/4] media: meson: vdec: Add compliant H264 support
> 
>  drivers/staging/media/meson/vdec/vdec_helpers.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index ff4333074197..a4970ec1bf2e 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -417,7 +417,8 @@ void amvdec_src_change(struct amvdec_session *sess, u32 width,
>  	 * Check if the capture queue is already configured well for our
>  	 * usecase. If so, keep decoding with it and do not send the event
>  	 */
> -	if (sess->width == width &&
> +	if (sess->streamon_cap &&
> +	    sess->width == width &&
>  	    sess->height == height &&
>  	    dpb_size <= sess->num_dst_bufs) {
>  		sess->fmt_out->codec_ops->resume(sess);
> --
> 2.20.1
> 

Will squash into v5 of "media: meson: vdec: Add compliant H264 support"

Thanks,
Neil
