Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD7D1312B9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 14:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgAFNSi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 08:18:38 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37769 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgAFNSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 08:18:38 -0500
Received: by mail-wm1-f66.google.com with SMTP id f129so15225161wmf.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Oj6DE+UWrfJvuWrYjDwvCpFcDLZuqe7GXZNQiTzaLaw=;
        b=aun6zMfkngUCm8q1j3L/FCCeFH/G62kxZAJgrAULi+m01IIghOdkITcCwd/bq6j1hT
         x+fJJmnfsA6+ZQRKKLkEFiZIFVZGc2BLg643q6Rqr1H17kgUpwe4HRy9P6E9GgRS1Bgp
         6yvipb/q+LVGTjs957er6lw3MNEs0foB1oRF6G6f1C9rl6+ccKSnOGX5k2OjcPb8nfLj
         4bn5cSvlTXhwsxfSp+kljkYhbAerB7D3DNjDNnIgB5zHqjlXipeI02XRf/nb54kTyewA
         uPMgshsRoFgS4g4EYEXdoG5OPYLnxc3jCt2AqHa0lKUl97RbH4CrrAcEIlgGAyTu4ci3
         QXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Oj6DE+UWrfJvuWrYjDwvCpFcDLZuqe7GXZNQiTzaLaw=;
        b=AVhccCsxgz04SzcEn+yipS8iggxO7csA2QzC9D1nWcCD0G8PU26JqTkeOqik4Z/K90
         jVRtG94upHlqcaR7inyMNVynP5JNNl6X6WYM1Ft+wSdko4rx8q9tRWxgnc2qVM+fNAbb
         CU/PuKn/wSVpMT2YOl8B4X/MvPNwv9Fvy83dx3zmCD5eWh4Otga3w/6NYdyVLM/hz6ea
         dCP2VAIO04b2BhGqLP0muBZ9ZtGjnzHUm9K+n4SyRFxqeoxjs3x1o7VKkWLfNMqeuocx
         +C9pOnT36rNswGbI/L9OBoVDSAeTkaL/uMBOdHGMbgjfNyBvsuWsN3Jr07pq1u/ifgd/
         4t/Q==
X-Gm-Message-State: APjAAAWOYiGn4MJV8AZpatrbugKeIGeJ0NYxHbJc8fOuYaPBcqh7MgC8
        aY9Ss3HhLnDi3eWYZNFXbm7mpg0k+ViN5Q==
X-Google-Smtp-Source: APXvYqzNaEx2amPvkXDkUF/tnMFhXSEKVF40bsi/aHbH29tOanKEEtCuLhmas9ThlALWvzbKvv1cAA==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr34799548wmd.96.1578316715035;
        Mon, 06 Jan 2020 05:18:35 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 16sm22611331wmi.0.2020.01.06.05.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2020 05:18:34 -0800 (PST)
Subject: Re: [PATCH v2 3/3] media: platform: meson-ao-cec-g12a: add wakeup
 support
To:     Guillaume La Roque <glaroque@baylibre.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191213132956.11074-1-glaroque@baylibre.com>
 <20191213132956.11074-4-glaroque@baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <d86fe5f8-31c8-d600-8be7-75dfeb0bb45a@baylibre.com>
Date:   Mon, 6 Jan 2020 14:18:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213132956.11074-4-glaroque@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/12/2019 14:29, Guillaume La Roque wrote:
> add register configuration to activate wakeup feature in bl301
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  drivers/media/platform/meson/ao-cec-g12a.c | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
> index 891533060d49..85850b974126 100644
> --- a/drivers/media/platform/meson/ao-cec-g12a.c
> +++ b/drivers/media/platform/meson/ao-cec-g12a.c
> @@ -25,6 +25,7 @@
>  #include <media/cec.h>
>  #include <media/cec-notifier.h>
>  #include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
>  
>  /* CEC Registers */
>  
> @@ -168,6 +169,18 @@
>  
>  #define CECB_WAKEUPCTRL		0x31
>  
> +#define CECB_FUNC_CFG_REG		0xA0
> +#define CECB_FUNC_CFG_MASK		GENMASK(6, 0)
> +#define CECB_FUNC_CFG_CEC_ON		0x01
> +#define CECB_FUNC_CFG_OTP_ON		0x02
> +#define CECB_FUNC_CFG_AUTO_STANDBY	0x04
> +#define CECB_FUNC_CFG_AUTO_POWER_ON	0x08
> +#define CECB_FUNC_CFG_ALL		0x2f
> +#define CECB_FUNC_CFG_NONE		0x0
> +
> +#define CECB_LOG_ADDR_REG	0xA4
> +#define CECB_LOG_ADDR_MASK	GENMASK(22, 16)
> +
>  struct meson_ao_cec_g12a_data {
>  	/* Setup the internal CECB_CTRL2 register */
>  	bool				ctrl2_setup;
> @@ -177,6 +190,7 @@ struct meson_ao_cec_g12a_device {
>  	struct platform_device		*pdev;
>  	struct regmap			*regmap;
>  	struct regmap			*regmap_cec;
> +	struct regmap			*regmap_ao_sysctrl;
>  	spinlock_t			cec_reg_lock;
>  	struct cec_notifier		*notify;
>  	struct cec_adapter		*adap;
> @@ -518,6 +532,13 @@ meson_ao_cec_g12a_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
>  					 BIT(logical_addr - 8));
>  	}
>  
> +	if (ao_cec->regmap_ao_sysctrl)
> +		ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
> +					 CECB_LOG_ADDR_REG,
> +					 CECB_LOG_ADDR_MASK,
> +					 FIELD_PREP(CECB_LOG_ADDR_MASK,
> +						    logical_addr));
> +
>  	/* Always set Broadcast/Unregistered 15 address */
>  	ret |= regmap_update_bits(ao_cec->regmap_cec, CECB_LADD_HIGH,
>  				  BIT(CEC_LOG_ADDR_UNREGISTERED - 8),
> @@ -618,6 +639,13 @@ static int meson_ao_cec_g12a_adap_enable(struct cec_adapter *adap, bool enable)
>  		regmap_write(ao_cec->regmap_cec, CECB_CTRL2,
>  			     FIELD_PREP(CECB_CTRL2_RISE_DEL_MAX, 2));
>  
> +	if (ao_cec->regmap_ao_sysctrl) {
> +		regmap_update_bits(ao_cec->regmap_ao_sysctrl,
> +				   CECB_FUNC_CFG_REG,
> +				   CECB_FUNC_CFG_MASK,
> +				   CECB_FUNC_CFG_ALL);
> +	}
> +
>  	meson_ao_cec_g12a_irq_setup(ao_cec, true);
>  
>  	return 0;
> @@ -685,6 +713,11 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>  		goto out_probe_adapter;
>  	}
>  
> +	ao_cec->regmap_ao_sysctrl = syscon_regmap_lookup_by_phandle
> +		(pdev->dev.of_node, "amlogic,ao-sysctrl");
> +	if (IS_ERR(ao_cec->regmap_ao_sysctrl))
> +		dev_warn(&pdev->dev, "ao-sysctrl syscon regmap lookup failed.\n");
> +
>  	irq = platform_get_irq(pdev, 0);
>  	ret = devm_request_threaded_irq(&pdev->dev, irq,
>  					meson_ao_cec_g12a_irq,
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
