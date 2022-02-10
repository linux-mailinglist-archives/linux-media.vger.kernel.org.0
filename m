Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA2F4B09A0
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 10:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238775AbiBJJe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 04:34:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238778AbiBJJez (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 04:34:55 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1E410B5
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 01:34:56 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id s18so8409712wrv.7
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 01:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=G+YDDnr2slUFHsUM/IlbFGkS85HzAaIxJtVEmZjhqMI=;
        b=fFvqalnJA8sWVtzDVywLCenoPVSbM4BhkZK9XFrkh6Uhpi+h4y/LKiKPi0+ZpMMW/Z
         8oUWKgTy+/vB6iqVkziuScLT+kEEaPx4cW97cxs178WEC9/LpV1PbchEV0yhArLeUKei
         Mlqk8nmMSwVxPZPMdo7PhJzx9J9flAKp6V/antjKCI6D9JvcSZIa993aC67gdMa40vNi
         iKaOYZWoizEF4zUNkT7BdkzPJ0w9QQSZNiE4Tkh/yi1bZG8tc6HGVwyxPS8oH35Nuysb
         fBd++IIZ5lX81lBwDZ4ywBPbYiCD3/fndjabl0NGgG41OW1NKXnrFD1wVZveXOfhwjmg
         bMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=G+YDDnr2slUFHsUM/IlbFGkS85HzAaIxJtVEmZjhqMI=;
        b=xvrO00IIkA+NnSiWLCBWwHh0EDwNq6ZASXOqkKqG10CW1Km/jv+3nI1vdhmKQmpKV9
         tSyj9WEU4v/6395QOxicj/MpHfqRcnWO3IFcrENrO72QaU3aSCQkHKaEtNGoBXYYFLke
         IlLRta9nqjojmvsiwfVJghVHn5Uhx7VKdrGa97MlkclfB+qZdjKeRzKc5401HaTNLS4C
         1zYHsWsrt6s2d5tUlYu0Y4DwH8oGHlZAbgeauZ+WVlYJLzhI56O7+zPoej7Nc/omLb1K
         Cw9DV7Hx0rCC4KYovGQ0JYlwIn+aNcaBQkZmnpK8pzM0tEkxphW2xvMXKgnllkjtRK5m
         696A==
X-Gm-Message-State: AOAM5331Glm7oREsOcAV+D+sRH1jI5oIi/1KQMtMhLyjqwABf4tY82Uu
        jSM0tEBfvarZI+BNREFxpbo+Hw==
X-Google-Smtp-Source: ABdhPJxBmsNmtY10oYaIzh1QwOHqjXPf7ItHPImfVqE1FxspgN0H8jxhkM1pdM6mESt6dmgnlo306g==
X-Received: by 2002:a5d:4c85:: with SMTP id z5mr5695114wrs.225.1644485695484;
        Thu, 10 Feb 2022 01:34:55 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:76d9:bf0e:e516:58a9? ([2001:861:44c0:66c0:76d9:bf0e:e516:58a9])
        by smtp.gmail.com with ESMTPSA id x5sm9483363wrv.63.2022.02.10.01.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 01:34:54 -0800 (PST)
Message-ID: <640ef0b2-fcba-50a6-71c2-8156181682b0@baylibre.com>
Date:   Thu, 10 Feb 2022 10:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drivers: meson: vdec: add VP9 support to GXM
Content-Language: en-US
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220209153150.30688-1-christianshewitt@gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220209153150.30688-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/02/2022 16:31, Christian Hewitt wrote:
> VP9 support for GXM appears to have been missed from the original
> codec submission [0] but it works well, so let's add support.
> 
> [0] https://github.com/torvalds/linux/commit/00c43088aa680989407b6afbda295f67b3f123f1
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Tested with LibreELEC 11 nightly 'AMLGX' dev images for Khadas VIM2
> and WeTek Core2 GXM devices which can be found here [1]. The images
> combine Linux 5.16.y [2] with Kodi v20 [3] and FFmpeg 4.4 [4] which
> notably includes many V4L2 refinements for stability and usability.
> 
> [1] https://test.libreelec.tv/
> [2] https://github.com/chewitt/linux/commits/amlogic-5.16.y
> [3] https://github.com/xbmc/xbmc/
> [4] https://github.com/jc-kynesim/rpi-ffmpeg/commits/dev/4.4/rpi_import_1
> 
>   drivers/staging/media/meson/vdec/vdec_platform.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> index eabbebab2da2..88c9d72e1c83 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -103,6 +103,18 @@ static const struct amvdec_format vdec_formats_gxl[] = {
>   
>   static const struct amvdec_format vdec_formats_gxm[] = {
>   	{
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.min_buffers = 16,
> +		.max_buffers = 24,
> +		.max_width = 3840,
> +		.max_height = 2160,
> +		.vdec_ops = &vdec_hevc_ops,
> +		.codec_ops = &codec_vp9_ops,
> +		.firmware_path = "meson/vdec/gxl_vp9.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> +	}, {
>   		.pixfmt = V4L2_PIX_FMT_H264,
>   		.min_buffers = 2,
>   		.max_buffers = 24,


Acked-by: Neil Armstrong <narmstrong@baylibre.com>
