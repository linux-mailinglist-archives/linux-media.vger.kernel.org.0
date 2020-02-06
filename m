Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2352153FC2
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 09:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgBFIIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 03:08:10 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44478 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgBFIIK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 03:08:10 -0500
Received: by mail-wr1-f68.google.com with SMTP id m16so5926707wrx.11
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 00:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TG5tj3645N85QhmNWU8D99xKObIizGYbAhAWICc+ygs=;
        b=e6y6Xc0CKTFK7D8lnZI+oqP6txhyrqcYHKag2cJFvZTCEIr3SECDvQXDx3itQzDjB5
         VcImhKBHPPvajvrhMq019JiXtDYI7rPkHENrWf+RlWoff8hhxIoqXAAGG539WvLMo9Wn
         4D71P/luHvNXtl8DTwCvA3ORNz+HUOP5ZxL1UO5APiCaTC8/ZPNQzeTJ6hTbYrnu0n3f
         ZaxlWdiXnlcIYCRRWCP4VcRWCxRH2Ckcf4JgKak0CIzSdjzVGZ18XYVyTCcb2Rg8OQIw
         y+eDECeAol8gs70LYTttGQEDtfFZ6a61YDj707iOvZFeg4203wX2gX3bv4I2qHAf9rfB
         JnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TG5tj3645N85QhmNWU8D99xKObIizGYbAhAWICc+ygs=;
        b=G3/T++oNo/pLJzNij0cx5HXz0p4LBgwGqQLajByxbTiU2MoFfQwOsfPNFDPfpAKXeo
         93LmTMFb3BdnOjDOjVFqbwlbWB4oZtR0yMC2wIfLTBxSc8K8b/19NCUkWBYXbjOXE5aU
         b+t/yhuzbS0ajCz1FZyVbbPjpDmeGihC+0OkjFK1U46ZZ/ST1cbfPzg87VKAdzMhH6Ll
         uLb+/Gu4IVytmB962zLdC2Hyhm/Ir/VQZvToh/3g4GkSGASvxwf2q90N+jc329fQNP5U
         jL28B1cL8XKblA9DNpWuLHw9iOzicCKSAVzqWebmcXL8ixFW/2lcL398MQTro6p+6KYl
         z6Ng==
X-Gm-Message-State: APjAAAVH+0CVSul1ra/cV+73BJr9q2MBpFciUrt8KxqBjQn3uwKpealO
        N03J6YLR/u+mheMAxwslECB/Vw==
X-Google-Smtp-Source: APXvYqz9axYJCUH9PKldohM4SKpY8oaob9MbNHZHJR5bIvM99Z2dv6KBImKigANHI+cIqIl6FqvNTg==
X-Received: by 2002:adf:c145:: with SMTP id w5mr2426249wre.205.1580976486971;
        Thu, 06 Feb 2020 00:08:06 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7? ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
        by smtp.gmail.com with ESMTPSA id o4sm3096110wrx.25.2020.02.06.00.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 00:08:06 -0800 (PST)
Subject: Re: [PATCH v3 5/5] media: meson: vdec: add VP9 decoder support
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200116133437.2443-1-narmstrong@baylibre.com>
 <20200116133437.2443-6-narmstrong@baylibre.com>
 <a4efcb4e1591ac9cf305742d34337335b6ff7f29.camel@ndufresne.ca>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <49e6168b-ffed-6011-3b1f-455224d3130b@baylibre.com>
Date:   Thu, 6 Feb 2020 09:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a4efcb4e1591ac9cf305742d34337335b6ff7f29.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/02/2020 04:11, Nicolas Dufresne wrote:
> Hi Neil,
> 
> Le jeudi 16 janvier 2020 à 14:34 +0100, Neil Armstrong a écrit :
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
>>  drivers/staging/media/meson/vdec/codec_vp9.c  | 2139 +++++++++++++++++
>>  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
>>  drivers/staging/media/meson/vdec/hevc_regs.h  |    7 +
>>  drivers/staging/media/meson/vdec/vdec.c       |    5 +
>>  .../staging/media/meson/vdec/vdec_helpers.c   |    4 +
>>  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
>>  7 files changed, 2207 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
>>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
>>

[...]

>> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
>> index e9356a46828f..72a833b1cebd 100644
>> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
>> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
>> @@ -8,8 +8,10 @@
>>  #include "vdec.h"
>>  
>>  #include "vdec_1.h"
>> +#include "vdec_hevc.h"
>>  #include "codec_mpeg12.h"
>>  #include "codec_h264.h"
>> +#include "codec_vp9.h"
>>  
>>  static const struct amvdec_format vdec_formats_gxbb[] = {
>>  	{
>> @@ -51,6 +53,18 @@ static const struct amvdec_format vdec_formats_gxbb[] = {
>>  
>>  static const struct amvdec_format vdec_formats_gxl[] = {
>>  	{
>> +		.pixfmt = V4L2_PIX_FMT_VP9,
>> +		.min_buffers = 16,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_hevc_ops,
>> +		.codec_ops = &codec_vp9_ops,
>> +		.firmware_path = "meson/vdec/gxl_vp9.bin",
> 
> Is there a pull request pending for this firmware ? I could not test as
> this firmware was missing. Note that it could be nice to remove the
> format from the enumeration in that case, as it's very confusing
> initially.

It has been merged yesterday, sorry for the delay.

With maxime's patch, we tested it using ffmpeg master, mpv master with drm-prime
rendering. We have a buildroot repo with the changed needed :

https://gitlab.com/baylibre/amlogic/atv/buildroot-yukawa

I will respin a v4 with the small fix from maxime.

Neil


> 
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>>  		.pixfmt = V4L2_PIX_FMT_H264,
>>  		.min_buffers = 2,
>>  		.max_buffers = 24,
>> @@ -127,6 +141,18 @@ static const struct amvdec_format vdec_formats_gxm[] = {
>>  
>>  static const struct amvdec_format vdec_formats_g12a[] = {
>>  	{
>> +		.pixfmt = V4L2_PIX_FMT_VP9,
>> +		.min_buffers = 16,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_hevc_ops,
>> +		.codec_ops = &codec_vp9_ops,
>> +		.firmware_path = "meson/vdec/g12a_vp9.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>>  		.pixfmt = V4L2_PIX_FMT_H264,
>>  		.min_buffers = 2,
>>  		.max_buffers = 24,
>> @@ -165,6 +191,18 @@ static const struct amvdec_format vdec_formats_g12a[] = {
>>  
>>  static const struct amvdec_format vdec_formats_sm1[] = {
>>  	{
>> +		.pixfmt = V4L2_PIX_FMT_VP9,
>> +		.min_buffers = 16,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_hevc_ops,
>> +		.codec_ops = &codec_vp9_ops,
>> +		.firmware_path = "meson/vdec/g12a_vp9.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>>  		.pixfmt = V4L2_PIX_FMT_H264,
>>  		.min_buffers = 2,
>>  		.max_buffers = 24,
> 

