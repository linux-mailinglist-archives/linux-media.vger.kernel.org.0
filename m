Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F18E3430428
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 20:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244534AbhJPSYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Oct 2021 14:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234320AbhJPSYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Oct 2021 14:24:50 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB5AC061765;
        Sat, 16 Oct 2021 11:22:42 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u18so32551092wrg.5;
        Sat, 16 Oct 2021 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9QMXwjRgg9WKiMDTO1eOxoPnW7Wq3XEzG3PPmnYHIS8=;
        b=IE99jWeZ2Ane8r/NbgALzv9jHGLpvydfeWW5He4+a9izIi2gMqmTKpzyuMXyc3f/vN
         kMvruXZZEls4HS5scTAYBSA3kfqVUMh4/jPNlsZOiRby0yPu6kc7rW4ux7VFKOw0Y4fD
         vxwaMjYudNL5wsRMJEED/340gsMmCXbI8leWhq5buFuKxKN9NQSz5tnrlS9WOWakIqH/
         pkmpYq11/OrGZUJeDO4I/ljoofu9RY1RpyALWi3cPhsHuLb6QeF2rGacygqkLmhI+bY/
         q0gF1qz1WjeRR+N5A6+tp18uSP4jjs19nAguaP8vip37Crdrtgc//HOA0OD+Hpi6ZI9a
         XSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9QMXwjRgg9WKiMDTO1eOxoPnW7Wq3XEzG3PPmnYHIS8=;
        b=6T8ok3RzrrMX1DaetCvQc9StUbATf5eukDqB9fkw+WTZT0ibnjSfrpCazLUniCPctN
         ckd5vRR1Me5W6MnSrfSnq8L7fxFwA8OHheQAxgIcyy+noPGNep3RpMKStbUqgtqc+nE3
         696/QSctQDsk0hugr7Fl0nXhWumrjDWj1VhZ0Rv1aRdXlxNbb+UOkyRJhb5Qqhn1Soin
         NdLAYiDQsoMAt8kpt+98KGKLSmkB5IKPXZtubqXGiSwiJeVNU0iz9jEIu4B8tXn0zhQa
         4VpYGjwNhhM08EXG2DvqpGl+ca6hCeBETptdJJU53Ks0XB72iqpClPrAXNMkyzpTCmSk
         6QPg==
X-Gm-Message-State: AOAM533/EV3tTmHYcY0AOAk8vbdfeThqRfk6xGNWH/3eBfIGGV9T/9yg
        pdcZ1vMACcMJa1SwLRUs3A==
X-Google-Smtp-Source: ABdhPJxqqODGb43ZkTiCJFtTiVtsKgqpfPCC4neudp0/50KJQHLV7bavPG2WoqS3N7CpHLh7ZuJ3BQ==
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr23138685wrs.365.1634408560677;
        Sat, 16 Oct 2021 11:22:40 -0700 (PDT)
Received: from [192.168.200.23] (ip5b435a69.dynamic.kabel-deutschland.de. [91.67.90.105])
        by smtp.gmail.com with ESMTPSA id y8sm7913848wrr.21.2021.10.16.11.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Oct 2021 11:22:40 -0700 (PDT)
Subject: Re: [BUG] Re: [PATCH v3 07/10] media: hantro: Enable H.264 on
 Rockchip VDPU2
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kever Yang <kever.yang@rock-chips.com>, kernel@collabora.com
References: <20210719205242.18807-1-ezequiel@collabora.com>
 <20210719205242.18807-8-ezequiel@collabora.com>
 <2fe158874e627d2aab97901916a63d884826b6ec.camel@ndufresne.ca>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <bee0202c-ad4e-52de-7244-28249a05c63d@gmail.com>
Date:   Sat, 16 Oct 2021 20:22:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2fe158874e627d2aab97901916a63d884826b6ec.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

Am 14.10.21 um 20:17 schrieb Nicolas Dufresne:
> Le lundi 19 juillet 2021 à 17:52 -0300, Ezequiel Garcia a écrit :
>> Given H.264 support for VDPU2 was just added, let's enable it.
>> For now, this is only enabled on platform that don't have
>> an RKVDEC core, such as RK3328.
> There is a small oops, the decoder is now visible on RK3399. At least for
> GStreamer, it got tricked in picking it by default, which regress decoding
> performance. I still think we should wait before enabling it until we know that
> userspace have infrastructure to rank them properly.

I guess having the decoder available is expected, since it is used for 
MPEG2 and VP8 - it was already before this patch.

It just shoudn't have the H.264 capabilities exposed on RK3399 yet - 
that seems OK here.

Alex
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Tested-by: Alex Bee <knaerzche@gmail.com>
>> ---
>>   .../staging/media/hantro/rockchip_vpu_hw.c    | 26 ++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
>> index 3ccc16413f42..e4e3b5e7689b 100644
>> --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
>> @@ -162,6 +162,19 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
>>   		.fourcc = V4L2_PIX_FMT_NV12,
>>   		.codec_mode = HANTRO_MODE_NONE,
>>   	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
>> +		.codec_mode = HANTRO_MODE_H264_DEC,
>> +		.max_depth = 2,
>> +		.frmsize = {
>> +			.min_width = 48,
>> +			.max_width = 1920,
>> +			.step_width = MB_DIM,
>> +			.min_height = 48,
>> +			.max_height = 1088,
>> +			.step_height = MB_DIM,
>> +		},
>> +	},
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
>>   		.codec_mode = HANTRO_MODE_MPEG2_DEC,
>> @@ -388,6 +401,12 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
>>   		.init = hantro_jpeg_enc_init,
>>   		.exit = hantro_jpeg_enc_exit,
>>   	},
>> +	[HANTRO_MODE_H264_DEC] = {
>> +		.run = rockchip_vpu2_h264_dec_run,
>> +		.reset = rockchip_vpu2_dec_reset,
>> +		.init = hantro_h264_dec_init,
>> +		.exit = hantro_h264_dec_exit,
>> +	},
>>   	[HANTRO_MODE_MPEG2_DEC] = {
>>   		.run = rockchip_vpu2_mpeg2_dec_run,
>>   		.reset = rockchip_vpu2_dec_reset,
>> @@ -433,6 +452,8 @@ static const char * const rockchip_vpu_clk_names[] = {
>>   	"aclk", "hclk"
>>   };
>>   
>> +/* VDPU1/VEPU1 */
>> +
>>   const struct hantro_variant rk3036_vpu_variant = {
>>   	.dec_offset = 0x400,
>>   	.dec_fmts = rk3066_vpu_dec_fmts,
>> @@ -495,11 +516,14 @@ const struct hantro_variant rk3288_vpu_variant = {
>>   	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
>>   };
>>   
>> +/* VDPU2/VEPU2 */
>> +
>>   const struct hantro_variant rk3328_vpu_variant = {
>>   	.dec_offset = 0x400,
>>   	.dec_fmts = rk3399_vpu_dec_fmts,
>>   	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
>> -	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER,
>> +	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
>> +		 HANTRO_H264_DECODER,
>>   	.codec_ops = rk3399_vpu_codec_ops,
>>   	.irqs = rockchip_vdpu2_irqs,
>>   	.num_irqs = ARRAY_SIZE(rockchip_vdpu2_irqs),
>
