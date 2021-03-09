Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091833327E0
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 14:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhCIN44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 08:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhCIN4f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Mar 2021 08:56:35 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC320C06175F
        for <linux-media@vger.kernel.org>; Tue,  9 Mar 2021 05:56:34 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h4so20761413ljl.0
        for <linux-media@vger.kernel.org>; Tue, 09 Mar 2021 05:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o0i3jTGJa4u9CMcR9i+YO5JrVEW+lDjWwY+bLaJZEas=;
        b=H8C+IHam0T1659elztELFUMBjKc2bjIAQS8Zbp12F/CkJblv7Qlkv7cSXAjxXdqPhj
         8BQjQOeHlSsZoikX1ouP3PWTFDTL4YoKgUldDXbP74h4y7J8Aai/vNNVDnxlI59spK+0
         VKrbcrcZlbd4R8XDSke6RI4/vnyoJnnk+doBBAtwxribDLV8zAvT9hK+NbU3VrtjZEak
         njLu6nGKVPO6CQ7zvQFRLKIXY0SDv9Du2xr+hWXGKnScl30Hd9sc2ENUlx/Id7tCOYNb
         cGR8z845WwN98WKEN+EZxQXQ4NQaaSbQWRUxlD6Hstl6GH0ZBuBXvbL6ECT70OI016hS
         Svig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o0i3jTGJa4u9CMcR9i+YO5JrVEW+lDjWwY+bLaJZEas=;
        b=OOr7pue/KI9INm0cXGZ32PMZUwPE9PQJCTs1touPR5lM6TCKdVl0YqgfKC+7zI5xvT
         6d81P6BMo0vQftC/7YcQOBAt6s0XjCUEOnRD5MDdDfYplBuI+zZjmlCDNRUGpplCpyyA
         72nlC+WuIvbm9jY6ZB4OSbkVER//KzLvmuFPk1t3XrLWnyYrf7BoWrS6bkTkihqKzvU/
         sBFcq0zSkOn6m1KnWBxB9I3kxTOTmpG3RAG21HiUHgSDHiKAbAs213t68muxA4VlKpvh
         41db7wC+w+mIE0K74mYwwuDiYzG7sHlLnetxgj55hQGnxNroLZkYE/P/FbwpUaqUYJMc
         fUtA==
X-Gm-Message-State: AOAM531e8HHtvHf6uK6vZdWdI1Fdsgcy9JR0j0tDNgih+o0AYrj+tvk/
        AP6ceboDusARLqUDeWvnPEnCiQ==
X-Google-Smtp-Source: ABdhPJxoCLa1Jv0fwddILa+kxRzffL1fJIB4bmpoHIelxJCUPJLNX6Ch7DK7alBQ2J0MaBJFrOO0RQ==
X-Received: by 2002:a2e:a58f:: with SMTP id m15mr16510137ljp.400.1615298193297;
        Tue, 09 Mar 2021 05:56:33 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id f10sm1808622lfm.194.2021.03.09.05.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 05:56:32 -0800 (PST)
Subject: Re: [PATCH v6 08/22] media: camss: Add missing format identifiers
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210304120326.153966-1-robert.foss@linaro.org>
 <20210304120326.153966-9-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <879d57a4-1187-a32c-7902-9ca7e9910c44@linaro.org>
Date:   Tue, 9 Mar 2021 16:56:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304120326.153966-9-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thank you for your patch!

On 04.03.2021 15:03, Robert Foss wrote:
> The CSI-2 spec defines format identifier for Data Type (DT),
> and how the Decode Format (DF) & Encode Format (EF) are implemented.
> The spec does however not define the DF, EF or Plain Format (PF)
> identifiers, as those are vendor specific.
> 
> Plain formats describe the size of the pixels written by the RDI
> units to memory. PLAIN8 for example has the size 8 bits, and
> PLAIN32 32 bits. The appropriate Plain Format is determined by
> the Decode Format used. The smallest Plain Format that is able
> to contain a pixel of the used Decode Format is the appropriate
> one to use.
> 
> As the vendor specific identifiers differ between hardware
> generations, split them out into separate headers.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

> ---
> 
> Changes since v5
>   - Andrey: Gen 1 & Gen2 devices have different decode/encode/plain
>             format definitions, list in separate headers
>   - Andrey: Make commit msg more clear about what is in MIPI spec or not
> 
> 
>   .../platform/qcom/camss/camss-csid-gen1.h     | 27 +++++++++++++
>   .../platform/qcom/camss/camss-csid-gen2.h     | 39 +++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csid.c    | 20 ++--------
>   .../media/platform/qcom/camss/camss-csid.h    | 24 ++++++++++++
>   4 files changed, 94 insertions(+), 16 deletions(-)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen1.h
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen2.h
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen1.h b/drivers/media/platform/qcom/camss/camss-csid-gen1.h
> new file mode 100644
> index 000000000000..80a2bc6efff6
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen1.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * camss-csid-gen1.h
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 1
> + *
> + * Copyright (C) 2021 Linaro Ltd.
> + */
> +#ifndef QC_MSM_CAMSS_CSID_GEN1_H
> +#define QC_MSM_CAMSS_CSID_GEN1_H
> +
> +#define DECODE_FORMAT_UNCOMPRESSED_6_BIT	0x0
> +#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
> +#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> +#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
> +#define DECODE_FORMAT_DPCM_10_6_10		0x4
> +#define DECODE_FORMAT_DPCM_10_8_10		0x5
> +#define DECODE_FORMAT_DPCM_12_6_12		0x6
> +#define DECODE_FORMAT_DPCM_12_8_12		0x7
> +#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x8
> +#define DECODE_FORMAT_DPCM_14_8_14		0x9
> +#define DECODE_FORMAT_DPCM_14_10_14		0xa
> +
> +#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
> +#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
> +
> +#endif /* QC_MSM_CAMSS_CSID_GEN1_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.h b/drivers/media/platform/qcom/camss/camss-csid-gen2.h
> new file mode 100644
> index 000000000000..3a8ad001b3e8
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * camss-csid-gen1.h
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 1
> + *
> + * Copyright (C) 2021 Linaro Ltd.
> + */
> +#ifndef QC_MSM_CAMSS_CSID_GEN2_H
> +#define QC_MSM_CAMSS_CSID_GEN2_H
> +
> +#define DECODE_FORMAT_UNCOMPRESSED_6_BIT	0x0
> +#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
> +#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> +#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
> +#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
> +#define DECODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
> +#define DECODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
> +#define DECODE_FORMAT_DPCM_10_6_10		0x7
> +#define DECODE_FORMAT_DPCM_10_8_10		0x8
> +#define DECODE_FORMAT_DPCM_12_6_12		0x9
> +#define DECODE_FORMAT_DPCM_12_8_12		0xa
> +#define DECODE_FORMAT_DPCM_14_8_14		0xb
> +#define DECODE_FORMAT_DPCM_14_10_14		0xc
> +#define DECODE_FORMAT_DPCM_12_10_12		0xd
> +#define DECODE_FORMAT_USER_DEFINED		0xe
> +#define DECODE_FORMAT_PAYLOAD_ONLY		0xf
> +
> +#define ENCODE_FORMAT_RAW_8_BIT		0x1
> +#define ENCODE_FORMAT_RAW_10_BIT	0x2
> +#define ENCODE_FORMAT_RAW_12_BIT	0x3
> +#define ENCODE_FORMAT_RAW_14_BIT	0x4
> +#define ENCODE_FORMAT_RAW_16_BIT	0x5
> +
> +#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
> +#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
> +#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
> +
> +#endif /* QC_MSM_CAMSS_CSID_GEN2_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index be3fe76f3dc3..697b51d6ad38 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -22,6 +22,7 @@
>   #include <media/v4l2-subdev.h>
>   
>   #include "camss-csid.h"
> +#include "camss-csid-gen1.h"
>   #include "camss.h"
>   
>   #define MSM_CSID_NAME "msm_csid"
> @@ -37,8 +38,8 @@
>   #define CAMSS_CSID_CID_n_CFG_ISPIF_EN	BIT(0)
>   #define CAMSS_CSID_CID_n_CFG_RDI_EN	BIT(1)
>   #define CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT	4
> -#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(0 << 8)
> -#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(1 << 8)
> +#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(PLAIN_FORMAT_PLAIN8 << 8)
> +#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(PLAIN_FORMAT_PLAIN16 << 8)
>   #define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_LSB	(0 << 9)
>   #define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_MSB	(1 << 9)
>   #define CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP		(0 << 10)
> @@ -59,22 +60,9 @@
>   #define CAMSS_CSID_TG_DT_n_CGG_2(v, n)	\
>   			(((v) == CAMSS_8x16 ? 0x0b4 : 0x0bc) + 0xc * (n))
>   
> -#define DATA_TYPE_EMBEDDED_DATA_8BIT	0x12
> -#define DATA_TYPE_YUV422_8BIT		0x1e
> -#define DATA_TYPE_RAW_6BIT		0x28
> -#define DATA_TYPE_RAW_8BIT		0x2a
> -#define DATA_TYPE_RAW_10BIT		0x2b
> -#define DATA_TYPE_RAW_12BIT		0x2c
> -#define DATA_TYPE_RAW_14BIT		0x2d
> -
> -#define DECODE_FORMAT_UNCOMPRESSED_6_BIT	0x0
> -#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
> -#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> -#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
> -#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x8
> -
>   #define CSID_RESET_TIMEOUT_MS 500
>   
> +
>   struct csid_format {
>   	u32 code;
>   	u8 data_type;
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 1824b3745e10..318c19bb26c9 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -21,6 +21,30 @@
>   #define MSM_CSID_PAD_SRC 1
>   #define MSM_CSID_PADS_NUM 2
>   
> +#define DATA_TYPE_EMBEDDED_DATA_8BIT	0x12
> +#define DATA_TYPE_YUV420_8BIT		0x18
> +#define DATA_TYPE_YUV420_10BIT		0x19
> +#define DATA_TYPE_YUV420_8BIT_LEGACY	0x1a
> +#define DATA_TYPE_YUV420_8BIT_SHIFTED	0x1c /* Chroma Shifted Pixel Sampling */
> +#define DATA_TYPE_YUV420_10BIT_SHIFTED	0x1d /* Chroma Shifted Pixel Sampling */
> +#define DATA_TYPE_YUV422_8BIT		0x1e
> +#define DATA_TYPE_YUV422_10BIT		0x1f
> +#define DATA_TYPE_RGB444		0x20
> +#define DATA_TYPE_RGB555		0x21
> +#define DATA_TYPE_RGB565		0x22
> +#define DATA_TYPE_RGB666		0x23
> +#define DATA_TYPE_RGB888		0x24
> +#define DATA_TYPE_RAW_24BIT		0x27
> +#define DATA_TYPE_RAW_6BIT		0x28
> +#define DATA_TYPE_RAW_7BIT		0x29
> +#define DATA_TYPE_RAW_8BIT		0x2a
> +#define DATA_TYPE_RAW_10BIT		0x2b
> +#define DATA_TYPE_RAW_12BIT		0x2c
> +#define DATA_TYPE_RAW_14BIT		0x2d
> +#define DATA_TYPE_RAW_16BIT		0x2e
> +#define DATA_TYPE_RAW_20BIT		0x2f
> +
> +
>   enum csid_payload_mode {
>   	CSID_PAYLOAD_MODE_INCREMENTING = 0,
>   	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
> 
