Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E21D1F1456
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 10:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbgFHIQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 04:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgFHIQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 04:16:54 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8EBC08C5C4
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 01:16:53 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x6so16285530wrm.13
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xP8ohZJIJJODX0PNVOXybCDo5zaVA9xLYTtN+2fsBsA=;
        b=natsedB8TmJICRSwfkUYmUQlJub7O6Vv7AjqsuJ8sc9Xty0c9hyV2PO+kDhejPBmal
         pJSivMZUVvktcA0JtTYlATFUvO2bvaUmxahbeSp6qQ+t6KtnCKVHVXdMAu/5KXDVRctB
         fy4I3lL1lrjJQd38xUJLkHGo8tN9hGRYhyZzqZHP0uvTCSLPyzxqHHFDtZoPatrtIoXU
         jAdTL8UhgTcTj+6pgswZjqeDb96rNImLmwKLsKSrrf9uDb+NtNMY2qEhnk0zuIEtJfPf
         P+ENewOJmVpo0d3vp1Ik2LCDSvKemnpimlEnxpskek7ao3QCkl3R6qwfDSLwiOQSMHaQ
         ul4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xP8ohZJIJJODX0PNVOXybCDo5zaVA9xLYTtN+2fsBsA=;
        b=oBxNsRgukdPy3I9ls9BYUDpO5x6iEtAboyMZV92K6ZnTxwACKuNkuE6UsuYyXYXIa0
         2yb2sprQ9UoDlw8UbwbmOVvf6Ohx0M4wPbnlL23HNP01bXDB8v0/1wv6t143hiTk4B7j
         T9pmAGycGNSWB5aCdQU8NhrqDw5HUO2a3oIr5IUYdLpjSI/5ur8l9JoEtHaQRSwkw1ky
         +cWI6rSGKWnW1cwOfQH/cZHAEN5tMumc+jaomuUuoK6PVqtg0zStVcKRC1cUNQenwZuW
         1JyqKAR4o67PKkk1F3AYoJj6ozd+r5Wrr2l6NbCXZsxvSQOBfqX2sjqbEvgiuvGExDgL
         /R1Q==
X-Gm-Message-State: AOAM530dBZzlxaY+CA1w6GkYbrO4KK51ostD5/SS6B0eCdUa9ffQrOD8
        iXsK2UaB4SmMQ5NxbAuO8+CB/g==
X-Google-Smtp-Source: ABdhPJwZbg24bpAhxeH05cOQo/g23RvY+2cu7M5VitUHGobaXc4k4WcBsbGJ/JEvP2bJtCYtUSWylg==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr21885256wrv.321.1591604212319;
        Mon, 08 Jun 2020 01:16:52 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:22:5867:d2c6:75f4? ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
        by smtp.gmail.com with ESMTPSA id y66sm22010078wmy.24.2020.06.08.01.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 01:16:51 -0700 (PDT)
Subject: Re: [PATCH 1/5] media: videodev2: add Compressed Framebuffer pixel
 formats
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Jourdan <mjourdan@baylibre.com>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
 <20200604135317.9235-2-narmstrong@baylibre.com>
 <02aa06fd8397b77c9a75d3a8399cb55d3b4d39c1.camel@ndufresne.ca>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <4d22ff40-11ac-c77a-564d-af9a678f23af@baylibre.com>
Date:   Mon, 8 Jun 2020 10:16:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <02aa06fd8397b77c9a75d3a8399cb55d3b4d39c1.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 05/06/2020 17:35, Nicolas Dufresne wrote:
> Le jeudi 04 juin 2020 à 15:53 +0200, Neil Armstrong a écrit :
>> From: Maxime Jourdan <mjourdan@baylibre.com>
>>
>> Add two generic Compressed Framebuffer pixel formats to be used
>> with a modifier when imported back in another subsystem like DRM/KMS.
>>
>> These pixel formats represents generic 8bits and 10bits compressed buffers
>> with a vendor specific layout.
>>
>> These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
>> used to describe the underlying compressed buffers used for ARM Framebuffer
>> Compression. In the Amlogic case, the compression is different but the
>> underlying buffer components is the same.
>>
>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>>  include/uapi/linux/videodev2.h       | 9 +++++++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 2322f08a98be..8f14adfd5bc5 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1447,6 +1447,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>>  		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
>> +		case V4L2_PIX_FMT_YUV420_8BIT:	descr = "Compressed YUV 4:2:0 8-bit Format"; break;
>> +		case V4L2_PIX_FMT_YUV420_10BIT:	descr = "Compressed YUV 4:2:0 10-bit Format"; break;

Seems we are totally on-par with the following :-)

> 
> When I read the DRM documentation [0], I'm reading that YUV420_8BIT
> definition matches V4L2_PIX_FMT_YVU420 and V4L2_PIX_FMT_YVU420M fully.
> In fact, on DRM side, to represent that format you want to expose here,
> they will strictly combine this generic format (documented un-
> compressed) with a modifier generated with the macro
> DRM_FORMAT_MOD_ARM_AFBC(*). And only the combination represent a unique
> and share-able format.

Yes, and this is exactly my goal here, and matches the Amlogic Framebuffer as
described in patch 4. The modifier patchset is at [1].

> 
> In absence of modifier in V4L2 API, this compressed format should be
> named accordingly to the compressed algorithm used (something like
> FMT_YUV420_8BIT_AML_FBC). 

It's even more complex, the modifier depends on the SoC revision, so we can
have up to6 different unique pixel format instead of 2 with a variable
modifier.

> So I believe these format name cannot be
> copied as-is like this, as they can only introduce more ambiguity in
> the already quite hard to follow naming of pixel formats. In fact, it
> is very common to see multiple different vendor compressions on the
> same SoC, so I don't really believe a "generic" compressed format make
> sense. To site one, the IMX8M, which got Verrisillicon/Vivante DEC400
> on the GPU, and the Hantro G2 compression format. Both will apply to
> NV12 class of format so in DRM they would be NV12 + modifier, and the
> combination forms the unique format. Now, in term of sharing, they must
> be differiented by userspace, as support for compression/decompression
> is heterogeneous (in that case the GPU does not support Hantro G2
> decompression or compression, and the VPU does not support DEC400).
> 
> I'll remind that the modifier implementation has great value and is
> much more scalable then the current V4L2 approach. There has been some
> early proposal for this, maybe it's time to prioritize because this
> list will starts growing with hundred or even thousands or format,
> which is clearly indicated by the increase of modifier generator macro
> on the DRM side.

Yes, but until the migration of drm_fourcc and v4l2 fourcc into a common one
is decided, I'm stuck and this is the only intermediate solution I found.

We have a working solution with Boris's patchset with ext_fmt passing the
modifier to user-space.

but anyway, since the goal is to merge the fourcc between DRM & V4L2, these YUV420_*BIT
will still be needed if we pass the modifier with an extended format struct.

> 
>>  		default:
>>  			if (fmt->description[0])
>>  				return;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index c3a1cf1c507f..90b9949acb8a 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -705,6 +705,15 @@ struct v4l2_pix_format {
>>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
>>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
>>  
>> +/*
>> + * Compressed Luminance+Chrominance meta-formats
>> + * In these formats, the component ordering is specified (Y, followed by U
>> + * then V), but the exact Linear layout is undefined.
>> + * These formats can only be used with a non-Linear modifier.
>> + */
>> +#define V4L2_PIX_FMT_YUV420_8BIT	v4l2_fourcc('Y', 'U', '0', '8') /* 1-plane YUV 4:2:0 8-bit */
>> +#define V4L2_PIX_FMT_YUV420_10BIT	v4l2_fourcc('Y', 'U', '1', '0') /* 1-plane YUV 4:2:0 10-bit */
>> +
>>  /*  Vendor-specific formats   */
>>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
>>  #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov hw compress */
> 

[1] https://patchwork.freedesktop.org/series/73722/#rev7
