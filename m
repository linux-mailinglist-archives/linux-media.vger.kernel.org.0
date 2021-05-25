Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907983908AA
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 20:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbhEYSQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 14:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231556AbhEYSQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 14:16:47 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B05DC061756
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 11:15:16 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b12so32161617ljp.1
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JDvTiCSdSa6DaxtIYC1tMowbiLo2hs8x4utC1OfqK2o=;
        b=Y0cT5eNGrR2XbykQQJwT1wOeAUQMHH6SYgDmM+mMFkMkayQ6xD5PUGDOGr3F32/fBk
         pkNc+6EdG/uSZSm6eLl6qiZD/OKRmROd7jYkTXTN6ouPouIRxsmPSHcvmpdQ4+peCzub
         huZocnWTLrHULYRTEn0klXNgWfoIQ2ns1VhthONqcOnXNUJdrdbGwDMn9jsSSKBlxigu
         MZLW27hw6rDXtSoH4SSl0gXNgIt0i3ecQ6w98XGRkEjhvPrZNI/Djihh3ZRjvR+kCpk6
         pRQIAoD+OXiNKeGF2dVGnKpXsJB9q4Y3guE/VoNosiSTyKkdrxjtkDHkHT/Wm/DtMkxD
         r3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JDvTiCSdSa6DaxtIYC1tMowbiLo2hs8x4utC1OfqK2o=;
        b=VetuonSa/un1kzma/lnXUnbNfvLztuEZ9X8jg6Uk1bUSNOI0l7S9XM+dEBdDU3gwfi
         aV0nbbCK6yjf/jZ11TLIfbpQBKi3WsyVTqqxVD/tkHxf+rBlrBK2rsl2WVhAuCYg4TS4
         gIf/5r/2Wz5C8XX/OFK5AOU2tAkTxQtS5CzVbfPnwvMEEW4xLFhixmDGNw6sS4vN3WU6
         ayJyCzsLZoihmW+XIf/Ht9vCnHBcF3LzRr3rFBWIUrQcqj8Voq4ubl/F3nxwh5u/hG+D
         fNcuqw9bx3I/OGp76lkOsOZofvuHlPHeI+OQUsFElCTNUYcT360ySw5Gv9gfZ1TN5C2/
         V0iA==
X-Gm-Message-State: AOAM5330obHXS+DzeIzlFGDKOHFgNADjDgHBeOKCEtujpSZsapUTH07o
        uL26jyuygv4T6MaTR+0mzd5HZg==
X-Google-Smtp-Source: ABdhPJxK4MtgBJuOAVSzxlU1r+29hap5/+nJwVLbu8fMwzhn270NTK8HImjvnRIAlbRf3BG5N52VSA==
X-Received: by 2002:a2e:7a02:: with SMTP id v2mr21900894ljc.271.1621966514644;
        Tue, 25 May 2021 11:15:14 -0700 (PDT)
Received: from [192.168.88.254] ([85.249.41.56])
        by smtp.gmail.com with ESMTPSA id m9sm2175810ljh.6.2021.05.25.11.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 11:15:13 -0700 (PDT)
Subject: Re: [PATCH 04/17] media: camss: csid-170: fix non-10bit formats
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210511180728.23781-1-jonathan@marek.ca>
 <20210511180728.23781-5-jonathan@marek.ca>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <fd72befe-f39c-ecb0-1130-50aa8452a90e@linaro.org>
Date:   Tue, 25 May 2021 21:15:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511180728.23781-5-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

Thank you for your patch!

On 11.05.2021 21:07, Jonathan Marek wrote:
> Use the decode_format/data_type from the "format" struct instead of a
> hardcoded 10-bit format.
> 
> Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-170.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> index ac22ff29d2a9..a81cc94c075f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
>   			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
>   
> -			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
> +			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
>   			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
>   
>   			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
> @@ -382,8 +382,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
>   		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
>   		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
> -		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> -		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
> +		val |= format->decode_format << RDI_CFG0_DECODE_FORMAT;
> +		val |= format->data_type << RDI_CFG0_DATA_TYPE;

I've given it a try on RB3 board (aka db845c plus the navigation mezzanine), which uses ov8856 camera
sensor (its output format is SGRBG10_1X10).

The above change doesn't work for me because format->decode_format has the value of 0x02 (which is
DECODE_FORMAT_UNCOMPRESSED_10_BIT). format->data_type has the expected value of 0x2b (DATA_TYPE_RAW_10BIT).

Thanks,
Andrey

>   		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>   		val |= dt_id << RDI_CFG0_DT_ID;
>   		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
> 
