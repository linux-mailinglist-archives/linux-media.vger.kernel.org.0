Return-Path: <linux-media+bounces-31503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9DEAA5FA4
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 16:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A9C3B279B
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 14:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AA61DC9A3;
	Thu,  1 May 2025 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cE+3jtUK"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DECD1ACECE
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108544; cv=none; b=EPkuvP40Z8nfjsVNK4GrvPFMoQKM9tSpd/WZbiqOOAokGQg+CaWV3UpS2KLvnwd/Syz0B8lYHPxQGU8mjSOfEGpCUo3FxeYnYjjGla8kXdW9M+jKyWfFaOSCqhwxZK7VSvFuvjTOkoky+yvWKBhtHzw//GeMFuZJ7b30XNCMTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108544; c=relaxed/simple;
	bh=2bmPCW89rdzOGsDm72m7yTGa8DocL/QHm7jaXbJsMD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptGMousEF65qc7rvAWUzefOXJFpCZZEeZ1HCYXfruLwDlug6AtW/7jNu8UVqQ7cvYuUd8bOUESWYMvoK/yYftRTUZz1ma70DBmnCY51x+nW63Q/6B0II05UfMx7VSMBHjF/oEj2skYTEM+zjbF4aHhCtdYtK1/+wrqy4shm/Amk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cE+3jtUK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746108541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKAZMdqz4k8C7gJy26linTtjioeiTxT5WSsWc9mj6gw=;
	b=cE+3jtUKSX6v3x7VkKKqnGANyyirSbvO3UvLWwFL6qUAWB9ymFIlFsSMYRH756XJxmVCbV
	GTSFqU/XiSLJ+Zuozft4hseKD2Y/FA8udsJtwDmOBV7qoG2Nv+3vVzMCXVJ5DQE8MPRha3
	msLLNLEds/wmRgKlRa+CW1d50bqKHew=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-qIwR8lVGN1-U7MLxITaJRQ-1; Thu, 01 May 2025 10:08:59 -0400
X-MC-Unique: qIwR8lVGN1-U7MLxITaJRQ-1
X-Mimecast-MFC-AGG-ID: qIwR8lVGN1-U7MLxITaJRQ_1746108538
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acbbb000796so75673166b.2
        for <linux-media@vger.kernel.org>; Thu, 01 May 2025 07:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108538; x=1746713338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKAZMdqz4k8C7gJy26linTtjioeiTxT5WSsWc9mj6gw=;
        b=ENVqUBcyJmqmi7R5hp4dgsa4Idtxcdve/F2yoDYmm2quZFN1L8YRKwDHkADuLchOUP
         fnZOjXijq+FO68q++qNihw+EdpxWOU2GSku7Zoh2ThKHpM0y9G4uO2nUlWAa4qYLqTjU
         OhBl17ihrwR1lT17SqzPQ6iHhaM6Z70qkHagehI/iVbi/aaK6PLQKJ5Qifl7xthkfECr
         yuPUzppYcrhUdGLPYyI8+xHUZadkKeU6jO0CPJ/pAuSPfV7tHfSxzNFrOdla8D/cREjS
         ipUAnSoEkAg5BJQWJsYKEz8h89kLkwlFSjYq5BJe+RmT6xUnte9wclkAFtu4/FSvkg6P
         0Tog==
X-Gm-Message-State: AOJu0YwVN3YYuu4AY5idyv0yWbB/dLxM8NGPr/tl51pdccNY/VJSgyO2
	cfLcRD/JIzCYrhaQzoMnDxmhnfhorMbkZ0nxPIveeqQbO2OkpdJ8KGheEZci/BdGOt7omqrR0dz
	KermApz7TjkspzdogSMIzajMo6+CwoxVI8Dlannxh1cGQ2edYtoTkWjxIj3HU
X-Gm-Gg: ASbGncswpoEjOD/V/YzkFoF95qy1xLZSy3JsbatK7OsqRu4dc4LlowoqtRYSr9hI/ZS
	Wwr32FrShQwpSEg8rLdfWA9AC85guebchpA9hCvLLy9owevlEC8nvDHsIMZQNmFpP2ksehReXw/
	YrSKVBuWIrayz4ufHRAQMvPKW7azkHnql714kJjXyuHeOhaeOnfS6ujqWu0/sfkqnW2S9Big5XO
	ryjd7fAbUTVQG3QHFWpRCLkNJtkYRXDsIrr99AI4sKmv09TvcX1qVq8buJyjhFHhb4YQsipLjmY
	bYg7JAAR7lnYnkzMHfOhEV6aVoGoyw91k9Hu0JCt67kCDmvQAnt8dAPPS1o6dWieD8s+PC3krQO
	LgVJ/jBhhEt658GHOLbGRLwSuQac9Fq6HGmcyt5idut446imEqw7rhJ+lSHmZsw==
X-Received: by 2002:a17:907:1b11:b0:acb:8492:fe with SMTP id a640c23a62f3a-acee25ff191mr654028666b.52.1746108538363;
        Thu, 01 May 2025 07:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGReZdqnjWQp8R6Eug67um016BAdvbQ+pNPuexOt79SVpL7qqesrqW9/D//xMT6llQVb+QjXw==
X-Received: by 2002:a17:907:1b11:b0:acb:8492:fe with SMTP id a640c23a62f3a-acee25ff191mr654022266b.52.1746108537846;
        Thu, 01 May 2025 07:08:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da516a01sm44965966b.104.2025.05.01.07.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:08:57 -0700 (PDT)
Message-ID: <55cd679a-1ade-4fe3-88f5-13772b7d068c@redhat.com>
Date: Thu, 1 May 2025 16:08:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: i2c: Remove unused macro definitions
To: WangYuli <wangyuli@uniontech.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, zhanjun@uniontech.com,
 guanwentao@uniontech.com, chenlinxuan@uniontech.com
References: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi WangYuli,

On 24-Jan-25 4:44 AM, WangYuli wrote:
> Delete obsolete macro definitions that are no longer in use in
> mt9m114.h to improve code readability and maintainability.
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Thank you for your patch, but this entire driver is being
removed, so I'm not going to apply this patch. See:

https://lore.kernel.org/linux-media/20250501134312.104711-5-hdegoede@redhat.com/

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/i2c/mt9m114.h | 105 +-------------------
>  1 file changed, 3 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
> index 97820db90827..9c4b85bea765 100644
> --- a/drivers/staging/media/atomisp/i2c/mt9m114.h
> +++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
> @@ -22,29 +22,15 @@
>  #include "../include/linux/atomisp_platform.h"
>  #include "../include/linux/atomisp.h"
>  
> -#define V4L2_IDENT_MT9M114 8245
> -
> -#define MT9P111_REV3
> -#define FULLINISUPPORT
> -
>  /* #defines for register writes and register array processing */
>  #define MISENSOR_8BIT		1
>  #define MISENSOR_16BIT		2
>  #define MISENSOR_32BIT		4
>  
> -#define MISENSOR_FWBURST0	0x80
> -#define MISENSOR_FWBURST1	0x81
> -#define MISENSOR_FWBURST4	0x84
> -#define MISENSOR_FWBURST	0x88
> -
>  #define MISENSOR_TOK_TERM	0xf000	/* terminating token for reg list */
>  #define MISENSOR_TOK_DELAY	0xfe00	/* delay token for reg list */
> -#define MISENSOR_TOK_FWLOAD	0xfd00	/* token indicating load FW */
> -#define MISENSOR_TOK_POLL	0xfc00	/* token indicating poll instruction */
>  #define MISENSOR_TOK_RMW	0x0010  /* RMW operation */
>  #define MISENSOR_TOK_MASK	0xfff0
> -#define MISENSOR_AWB_STEADY	BIT(0)	/* awb steady */
> -#define MISENSOR_AE_READY	BIT(3)	/* ae status ready */
>  
>  /* mask to set sensor read_mode via misensor_rmw_reg */
>  #define MISENSOR_R_MODE_MASK	0x0330
> @@ -55,99 +41,32 @@
>  #define MISENSOR_FLIP_DIS	0
>  
>  /* bits set to set sensor read_mode via misensor_rmw_reg */
> -#define MISENSOR_SKIPPING_SET	0x0011
> -#define MISENSOR_SUMMING_SET	0x0033
>  #define MISENSOR_NORMAL_SET	0x0000
>  
>  /* sensor register that control sensor read-mode and mirror */
>  #define MISENSOR_READ_MODE	0xC834
> -/* sensor ae-track status register */
> -#define MISENSOR_AE_TRACK_STATUS	0xA800
> -/* sensor awb status register */
> -#define MISENSOR_AWB_STATUS	0xAC00
> -/* sensor coarse integration time register */
> -#define MISENSOR_COARSE_INTEGRATION_TIME 0xC83C
>  
>  /* registers */
> -#define REG_SW_RESET                    0x301A
> -#define REG_SW_STREAM                   0xDC00
> -#define REG_SCCB_CTRL                   0x3100
> -#define REG_SC_CMMN_CHIP_ID             0x0000
> -#define REG_V_START                     0xc800 /* 16bits */
> -#define REG_H_START                     0xc802 /* 16bits */
> -#define REG_V_END                       0xc804 /* 16bits */
> -#define REG_H_END                       0xc806 /* 16bits */
> -#define REG_PIXEL_CLK                   0xc808 /* 32bits */
> -#define REG_TIMING_VTS                  0xc812 /* 16bits */
>  #define REG_TIMING_HTS                  0xc814 /* 16bits */
>  #define REG_WIDTH                       0xC868 /* 16bits */
> -#define REG_HEIGHT                      0xC86A /* 16bits */
>  #define REG_EXPO_COARSE                 0x3012 /* 16bits */
> -#define REG_EXPO_FINE                   0x3014 /* 16bits */
>  #define REG_GAIN                        0x305E
> -#define REG_ANALOGGAIN                  0x305F
> -#define REG_ADDR_ACESSS                 0x098E /* logical_address_access */
> -#define REG_COMM_Register               0x0080 /* command_register */
> -
> -#define SENSOR_DETECTED		1
> -#define SENSOR_NOT_DETECTED	0
>  
>  #define I2C_RETRY_COUNT		5
>  #define MSG_LEN_OFFSET		2
>  
> -#ifndef MIPI_CONTROL
> -#define MIPI_CONTROL		0x3400	/* MIPI_Control */
> -#endif
> -
> -/* GPIO pin on Moorestown */
> -#define GPIO_SCLK_25		44
> -#define GPIO_STB_PIN		47
> -
> -#define GPIO_STDBY_PIN		49   /* ab:new */
> -#define GPIO_RESET_PIN		50
> -
>  /* System control register for Aptina A-1040SOC*/
>  #define MT9M114_PID		0x0
>  
>  /* MT9P111_DEVICE_ID */
>  #define MT9M114_MOD_ID		0x2481
>  
> -#define MT9M114_FINE_INTG_TIME_MIN 0
> -#define MT9M114_FINE_INTG_TIME_MAX_MARGIN 0
> -#define MT9M114_COARSE_INTG_TIME_MIN 1
> -#define MT9M114_COARSE_INTG_TIME_MAX_MARGIN 6
> -
>  /* ulBPat; */
>  
> -#define MT9M114_BPAT_RGRGGBGB	BIT(0)
> -#define MT9M114_BPAT_GRGRBGBG	BIT(1)
> -#define MT9M114_BPAT_GBGBRGRG	BIT(2)
> -#define MT9M114_BPAT_BGBGGRGR	BIT(3)
> +#define MT9M114_BPAT_GRGRBGBG	BIT(0)
> +#define MT9M114_BPAT_BGBGGRGR	BIT(1)
>  
> -#define MT9M114_FOCAL_LENGTH_NUM	208	/*2.08mm*/
>  #define MT9M114_WAIT_STAT_TIMEOUT	100
> -#define MT9M114_FLICKER_MODE_50HZ	1
> -#define MT9M114_FLICKER_MODE_60HZ	2
> -/*
> - * focal length bits definition:
> - * bits 31-16: numerator, bits 15-0: denominator
> - */
> -#define MT9M114_FOCAL_LENGTH_DEFAULT 0xD00064
> -
> -/*
> - * current f-number bits definition:
> - * bits 31-16: numerator, bits 15-0: denominator
> - */
> -#define MT9M114_F_NUMBER_DEFAULT 0x18000a
> -
> -/*
> - * f-number range bits definition:
> - * bits 31-24: max f-number numerator
> - * bits 23-16: max f-number denominator
> - * bits 15-8: min f-number numerator
> - * bits 7-0: min f-number denominator
> - */
> -#define MT9M114_F_NUMBER_RANGE 0x180a180a
>  
>  /* Supported resolutions */
>  enum {
> @@ -158,29 +77,11 @@ enum {
>  
>  #define MT9M114_RES_960P_SIZE_H		1296
>  #define MT9M114_RES_960P_SIZE_V		976
> -#define MT9M114_RES_720P_SIZE_H		1280
> -#define MT9M114_RES_720P_SIZE_V		720
> -#define MT9M114_RES_576P_SIZE_H		1024
> -#define MT9M114_RES_576P_SIZE_V		576
> -#define MT9M114_RES_480P_SIZE_H		768
> -#define MT9M114_RES_480P_SIZE_V		480
> -#define MT9M114_RES_VGA_SIZE_H		640
> -#define MT9M114_RES_VGA_SIZE_V		480
> -#define MT9M114_RES_QVGA_SIZE_H		320
> -#define MT9M114_RES_QVGA_SIZE_V		240
> -#define MT9M114_RES_QCIF_SIZE_H		176
> -#define MT9M114_RES_QCIF_SIZE_V		144
> -
> -#define MT9M114_RES_720_480p_768_SIZE_H 736
> -#define MT9M114_RES_720_480p_768_SIZE_V 496
> +
>  #define MT9M114_RES_736P_SIZE_H 1296
>  #define MT9M114_RES_736P_SIZE_V 736
>  #define MT9M114_RES_864P_SIZE_H 1296
>  #define MT9M114_RES_864P_SIZE_V 864
> -#define MT9M114_RES_976P_SIZE_H 1296
> -#define MT9M114_RES_976P_SIZE_V 976
> -
> -#define MT9M114_BIN_FACTOR_MAX			3
>  
>  #define MT9M114_DEFAULT_FIRST_EXP 0x10
>  #define MT9M114_MAX_FIRST_EXP 0x302


