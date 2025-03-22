Return-Path: <linux-media+bounces-28593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DBEA6C780
	for <lists+linux-media@lfdr.de>; Sat, 22 Mar 2025 04:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663B13B5DE6
	for <lists+linux-media@lfdr.de>; Sat, 22 Mar 2025 03:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8D813B5A0;
	Sat, 22 Mar 2025 03:41:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31E924B26;
	Sat, 22 Mar 2025 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742614860; cv=none; b=U9cipD2KPlM64UPmqX8/kbI0za+SLzoCcye3x6TzXD924B4C7NaVkbQTxyNglWPdtdh1WGud3N0oOXWMZ/K4YC9gH05b+2wHOjtwOrjvmTiILHursqVmdFPdH2A/G6Bc6vlLuw0lfR2lQVQmUK8l63IKpVweeUykIlStUB7zMk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742614860; c=relaxed/simple;
	bh=s2mYVp9KlK43n2Utkh6uU+9HVJvyD9Wpt2iUDU1HX6Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=pgGN2orHOZ5cCaJWgeuUq138I1MkhONqvwEMu1+XwVRfE+/DgMHWsn+bLYeleqC9VMlXO+Ru8DA9wcdHfo9bjXf/OmorInrCUh4JtSOxnWBnMeNxldhG0iyw27byRjFd3e/qg0wpOTUCJC6vDcpVyAFk02RCY1b0YcJJ0GlQtMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZKQ8j1bZPz27h8t;
	Sat, 22 Mar 2025 11:41:25 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 568FF18005F;
	Sat, 22 Mar 2025 11:40:48 +0800 (CST)
Received: from [10.174.179.113] (10.174.179.113) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 22 Mar 2025 11:40:47 +0800
Message-ID: <f3b1d3c9-d959-4096-8ee6-fd08a088d602@huawei.com>
Date: Sat, 22 Mar 2025 11:40:47 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yue Haibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v2 -next] media: cec: tda9950: Add missing I2C dependency
To: <hverkuil@xs4all.nl>, <mchehab@kernel.org>, <lumag@kernel.org>,
	<dmitry.baryshkov@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	<airlied@gmail.com>
References: <20250322024914.3622546-1-yuehaibing@huawei.com>
Content-Language: en-US
In-Reply-To: <20250322024914.3622546-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf500002.china.huawei.com (7.185.36.57)

On 2025/3/22 10:49, Yue Haibing wrote:
> If CONFIG_I2C is not set, build fails:
> 
> drivers/media/cec/i2c/tda9950.c: In function ‘tda9950_probe’:
> drivers/media/cec/i2c/tda9950.c:391:14: error: implicit declaration of function ‘i2c_check_functionality’ [-Werror=implicit-function-declaration]
> 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>       |              ^~~~~~~~~~~~~~~~~~~~~~~
>   CC      crypto/aes_generic.o
> drivers/media/cec/i2c/tda9950.c: At top level:
> drivers/media/cec/i2c/tda9950.c:503:1: warning: data definition has no type or storage class
>   503 | module_i2c_driver(tda9950_driver);
>       | ^~~~~~~~~~~~~~~~~
> drivers/media/cec/i2c/tda9950.c:503:1: error: type defaults to ‘int’ in declaration of ‘module_i2c_driver’ [-Werror=implicit-int]
> drivers/media/cec/i2c/tda9950.c:503:1: warning: parameter names (without types) in function declaration
> 
> Add missing I2C dependency to fix this.
> 
> Fixes: caa6f4a75e9f ("media: cec: move driver for TDA9950 from drm/i2c")

Just FYI,
commit caa6f4a75e9f has only applied to drm-misc-next, so also cc drm drivers maintainer

> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
> v2: Fix patch title, also cc dri-devel list
> ---
>  drivers/media/cec/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
> index b9d21643eef1..c31abc26f602 100644
> --- a/drivers/media/cec/i2c/Kconfig
> +++ b/drivers/media/cec/i2c/Kconfig
> @@ -16,6 +16,7 @@ config CEC_CH7322
>  
>  config CEC_NXP_TDA9950
>  	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
> +	depends on I2C
>  	select CEC_NOTIFIER
>  	select CEC_CORE
>  	default DRM_I2C_NXP_TDA998X

