Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7726A15DACA
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 16:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbgBNPYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 10:24:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35675 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729398AbgBNPYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 10:24:35 -0500
Received: by mail-wm1-f68.google.com with SMTP id b17so11049494wmb.0
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2020 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pc8f+vLtv9M0sMUpKfDxvsddTp0IXZMAVf5VnsFQIv8=;
        b=XMMsAiC7jrxanlkIGP6LcoWdmShSgQncHf2G9fR7MyLeJ43YJE70sG49XMdKlf6JuC
         wHhodAEteGWfKwPp0y2GFnqhjlKztqJOUGWTC/si2g7YgI+hmiCzqcO2/FAoBMWmkSvG
         J2+9OsZ0eg6+O7ik9vz/zhirFAWc1bAoWooMvZpseqSOnGVlQ9X85ErydBbIzKqUrJde
         Vz3gMU7DqvsHhQ+9vv6lCbuO+a6reWKtnln/rZ29jcbDIKSrd7pjpJVP859KcozUoWY2
         q1GnWRYOI+G/eZQtAB2Qw3Z9uEzSl/WpVM2F5hyou+U8Lo4rtPmADgd1l9jj0ZX6iy0H
         s0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Pc8f+vLtv9M0sMUpKfDxvsddTp0IXZMAVf5VnsFQIv8=;
        b=q3Aj7tVm1EXjgBQlZ6BeZrcuLcFGNyn80qju94/01UEJEH2sFL4DXRXub04Y0+I5QY
         GUZXBqU81mdeDXzpM+srI4QcADgdCuC81mbLc3UGu3Mzy2dEEs4syUCGZt5EPBO5kaSo
         PHUoUInhYb8jgX6Kw5pD2MOlnEVhHOUEm0aafjCLljvFu1bIm8yuWWoNrsbJO/+89NZR
         8eMWwMVBu0NnJQGJuY7MU4VG/pv2iJdRcT4rsGr4I+mKKytuaH/xUtmKVs8ySscuFRqP
         SdFygWo0NQPFPvjw6IDhCNO4wtzq2p6CA5fKezkS6dN0rqTYVUoh3+uCNWXLMw90FV/b
         lYCw==
X-Gm-Message-State: APjAAAV7lpz+lD3fOxT5GbPsI0kd8KYRbF6kaaxTrg91JIyWBX5akITq
        lpqhijtpsyNKMvtbIMbPMqejHQ==
X-Google-Smtp-Source: APXvYqz6ReimWoO3p17kKazTFoVtQh84Ez05nTZ11f75+GHYgrw5BPphcxY0UrCLSFUeJqqg1BjNQA==
X-Received: by 2002:a05:600c:218a:: with SMTP id e10mr5137625wme.6.1581693872774;
        Fri, 14 Feb 2020 07:24:32 -0800 (PST)
Received: from [10.1.3.173] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w1sm7935798wro.72.2020.02.14.07.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 07:24:32 -0800 (PST)
Subject: Re: [PATCH v4 5/5] media: meson: vdec: add VP9 decoder support
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200206084152.7070-1-narmstrong@baylibre.com>
 <20200206084152.7070-6-narmstrong@baylibre.com>
 <444673d2-f1f0-bfe8-1aa2-b37cbdec6231@xs4all.nl>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <fed44541-8237-5910-3a69-c6e92e739607@baylibre.com>
Date:   Fri, 14 Feb 2020 16:24:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <444673d2-f1f0-bfe8-1aa2-b37cbdec6231@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/02/2020 16:04, Hans Verkuil wrote:
> On 2/6/20 9:41 AM, Neil Armstrong wrote:
>> From: Maxime Jourdan <mjourdan@baylibre.com>
>>
>> This adds VP9 decoding for the Amlogic GXL, G12A & SM1 SoCs, using
>> the commong "HEVC" HW decoder.
>>
>> For G12A & SM1, it uses the IOMMU support from the firmware.
>>
>> For 10bit decoding, the firmware can only decode in the proprietary
>> Amlogic Framebuffer Compression format, but can output in 8bit NV12
>> buffer while writing the decoded frame.
>>
>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/staging/media/meson/vdec/Makefile     |    2 +-
>>  drivers/staging/media/meson/vdec/codec_vp9.c  | 2138 +++++++++++++++++
>>  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
>>  drivers/staging/media/meson/vdec/hevc_regs.h  |    7 +
>>  drivers/staging/media/meson/vdec/vdec.c       |    5 +
>>  .../staging/media/meson/vdec/vdec_helpers.c   |    4 +
>>  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
>>  7 files changed, 2206 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
>>
>> diff --git a/drivers/staging/media/meson/vdec/Makefile b/drivers/staging/media/meson/vdec/Makefile
>> index f55b6e625034..6e726af84ac9 100644
>> --- a/drivers/staging/media/meson/vdec/Makefile
>> +++ b/drivers/staging/media/meson/vdec/Makefile
>> @@ -3,6 +3,6 @@
>>  
>>  meson-vdec-objs = esparser.o vdec.o vdec_helpers.o vdec_platform.o
>>  meson-vdec-objs += vdec_1.o vdec_hevc.o
>> -meson-vdec-objs += codec_mpeg12.o codec_h264.o codec_hevc_common.o
>> +meson-vdec-objs += codec_mpeg12.o codec_h264.o codec_hevc_common.o codec_vp9.o
>>  
>>  obj-$(CONFIG_VIDEO_MESON_VDEC) += meson-vdec.o
>> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
>> new file mode 100644
>> index 000000000000..e7ffbc6dd892
>> --- /dev/null
>> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
>> @@ -0,0 +1,2138 @@
> 
> ...
> 
>> +#define ROUND_POWER_OF_TWO(value, num) (((value) + (1 << ((num) - 1))) >> (num))
> 
> Checkpatch says:
> 
> CHECK: Macro argument reuse 'num' - possible side-effects?
> #377: FILE: drivers/staging/media/meson/vdec/codec_vp9.c:330:
> +#define ROUND_POWER_OF_TWO(value, num) (((value) + (1 << ((num) - 1))) >> (num))
> 
> While num is const in this source, I do prefer if this is turned into a static inline.
> 
> It's just safer.

Ok

> 
> Regards,
> 
> 	Hans
> 

