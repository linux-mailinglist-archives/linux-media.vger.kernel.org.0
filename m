Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880C3321CF5
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhBVQ2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbhBVQ1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:27:44 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED46C06178C
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:26:59 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id a17so59650453ljq.2
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mp2QQ7MvrV5zUofeFKg73RhwyazD5hfojtJwL2lbSOo=;
        b=CQ5BSYE17bAMylBR6D/q2/HIcfSBxLJksn3AmOzI1DfO+18D98Ie5GrJoA5Gk4DGp1
         kMW0MOxFH8THlXa0hbZqRbS7iAD4SShoL+OWC89YNpbuFje1X8hsrnvdUqz+vq1Qizfj
         22ukhqqfzvcTWqdLsG0xzJdj5tbX1PVM77aDzCpQQ3v6HC8OCEr68vIlwTVXvFS76flt
         /Aj4M34J6IJdI2rEvhixZEbR9f9U+WwBucJLpx8VEIMqorvIyY+yx2U8J/7MRbQaGjow
         l82Jn0VaVyEew4UcIE2y9D6pGcgYkWY5wQT0vqFgMt5m/O5oetsf/PIX97iNZT1m7Hi8
         repw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mp2QQ7MvrV5zUofeFKg73RhwyazD5hfojtJwL2lbSOo=;
        b=cPAgyPPPU//putQ2PyZBCVtye9UduHWoJYxdGdu870kVhavTw6CY2Ov1QqnG/x2StM
         eaBoMFztGDn7Cs+bRoJVv32b1nW9C/7naUWZaAI+bPde2g2YL1Us7R3AJjG4FkNzxVBO
         oBRpRitVH3nntSq1jZRuXsHrKhGu9HEvS7dOXVpVKa9HIan945Ak0Xpxk0hw1VskAenW
         mTRuNNc+mIUnQNcG086STbR+B5s2c8x09VvvDoHm3n2Mns0t4D5TLnvWzqeNTN0sSCUJ
         F3Nwp7MWYU39Y0QXSA3rGqM4BJPCYXYKNBxpJ/fqqN8hbBJCfFtWL7/R8K1KjzQ2RQRH
         y0IA==
X-Gm-Message-State: AOAM533yENwBayoBNKYWDPix3MKos1SpZDUDdW3YM9rpx3xuaqwndvae
        4+xwYr7p8ofBbOEgTCYnurL0tg==
X-Google-Smtp-Source: ABdhPJxGwceBPuVjmyf18Mdqo1hgQf9u3FDMoPxiBpD6nJuwxSs7K8ql3RXClACX9VwKUk2lVHWFyQ==
X-Received: by 2002:a2e:9cc2:: with SMTP id g2mr14144873ljj.348.1614011217845;
        Mon, 22 Feb 2021 08:26:57 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id a6sm1087926ljp.135.2021.02.22.08.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 08:26:57 -0800 (PST)
Subject: Re: [PATCH v5 08/22] media: camss: Add missing format identifiers
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-9-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <3e8eced2-de18-5def-c25e-b819e17b9c22@linaro.org>
Date:   Mon, 22 Feb 2021 19:26:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217112122.424236-9-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thank you for your patch!

On 17.02.2021 14:21, Robert Foss wrote:
> The CSI-2 spec defines the following types:
>   - Data Type - Often abbreviated DT
>   - Decode Format - Often abbreviated as DF
>   - Encode Format
> 
> These definitions are as far as I can tell complete for CSI-2.
> 
> Additionally the Qualcomm internal type describing Plain Formats
> has been added. Plain formats describe the size of the pixels
> written by the RDI units to memory. PLAIN8 for example has the size
> 8 bits, and PLAIN32 32 bits. The appropriate Plain Format is
> determined by the Decode Format used. The smallest Plain Format
> that is able to contain a pixel of the used Decode Format is the
> appropriate one to use.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   .../media/platform/qcom/camss/camss-csid.h    | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 1824b3745e10..02fc34ee8a41 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -21,6 +21,56 @@
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

- these look OK for me (the old MIPI spec draft I have doesn't have
   some of the data types listed above).

   As these are generic values from the MIPI standard, it could probably make
   sense to create a common header file for that someday.
   E.g. the very similar defines (same values, different names) are present in
   drivers/staging/media/atomisp/pci/isp_capture_defs.h
   But it looks like most of the current drivers don't need the MIPI data type
   defines, so not a problem at the moment.

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
> +#define DECODE_FORMAT_DPCM_12_8_12		0xA
> +#define DECODE_FORMAT_DPCM_14_8_14		0xB
> +#define DECODE_FORMAT_DPCM_14_10_14		0xC
> +#define DECODE_FORMAT_USER_DEFINED		0xE
> +#define DECODE_FORMAT_PAYLOAD_ONLY		0xF

- interesting that the subset of the DECODE_FORMAT's used in
   camss-csid-4-1.c (the first four formats above - UNCOMPRESSED_6_BIT
   to UNCOMPRESSED_12_BIT ones) has the same values as the corresponding
   field in the CSID_CID_n_CFG registers - according to the public
   "APQ8016E Technical Reference Manual" [1]. So these exact DECODE_FORMAT_*
   values are written into the bits 7:4 of the hw register.
   But in [1] the values of DPCM_10_6_10 to DPCM_12_8_12 are 0x4 to 0x7
   (as the camss-csid-4-1.c doesn't support DPCM this is not an issue).
   Are the DECODE_FORMAT_* values above defined in the MIPI standard, or did
   they come from the datasheet for a particular SOC?

[1] https://developer.qualcomm.com/download/sd410/snapdragon-410e-technical-reference-manual.pdf
     page 990
> +
> +#define ENCODE_FORMAT_RAW_8_BIT		0x1
> +#define ENCODE_FORMAT_RAW_10_BIT	0x2
> +#define ENCODE_FORMAT_RAW_12_BIT	0x3
> +#define ENCODE_FORMAT_RAW_14_BIT	0x4
> +#define ENCODE_FORMAT_RAW_16_BIT	0x5

- the ENCODE_FORMAT_* defines are not used in the driver.

> +
> +#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
> +#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
> +#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */

- the PLAIN_FORMAT_* defines are not used in the driver, but
   camss-csid-4-1.c and camss-csid-4-7.c do define there own
   CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8 and CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16
   (without relying on PLAIN_FORMAT_PLAIN8 or PLAIN_FORMAT_PLAIN16).

Thanks,
Andrey

> +
> +
>   enum csid_payload_mode {
>   	CSID_PAYLOAD_MODE_INCREMENTING = 0,
>   	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
> 
