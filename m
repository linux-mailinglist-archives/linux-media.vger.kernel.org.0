Return-Path: <linux-media+bounces-7425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2563881470
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 16:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F3D71F23A29
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 15:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856865026C;
	Wed, 20 Mar 2024 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8tWzBLt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A054FBE
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 15:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710948084; cv=none; b=sNaO8pvB/8+P0aBLbL3jyEdmo5zHulfD3MmVhzUSVf14GAx2YVbNTfguqW0ItBH3mC/lezOXbFSvyFLDLVzWJDH8VghMckJ8brRlXSyTOJChypjvVXHhIAslTnuKLpfKoYhFsDJQO100zci2M9oKURG7NmpG4rQMNH4KPbkzBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710948084; c=relaxed/simple;
	bh=+YjaZo/53e6BuSaJcjrUGQO5J3/Jp7CnpFhKwRQufXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cemaWpSLC2e9+KMx3IWeHaxtLawNUXE6jakzqVpTuvU3JzI/XT9HQHUrsMM+qDA1GhI/sogP7Avx3H61XFNEgPKxCNIrB9KXuBUh09Vevo9P5ctNk32IwA1OoV3rfMBUe+T1RhdGPkgGjlM+2ggrrJYs2BPdxLOsJGmTntuKFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8tWzBLt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4146fe16a1aso1018805e9.1
        for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710948079; x=1711552879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K79Rmkut9qpCXluStnFy1e9/DwvNUnuxwsUoll8/3LQ=;
        b=T8tWzBLtTqw129cwc/pAQEO2FAoOvSZxZaBZdmDCdmMagVQ3MQWuHdyRMFnyxf/o7c
         yLvzrc9ZMctmf7ZOlDBMZTlSdG5vqm3gQFmlf9nbk48S5cseK5ejUubnGcXVyNtKAIIl
         VqTjUWUuMtgpEiiBs1yLDzbBpup28bBbqqa7s/iTp53quPSOKnbY4jJlTuuII/zNAgTb
         wwhfNCCU+CKPzZ/XuOz8gHXKiXVcVK1MkUbbFiUt5iLXEt60DzwhHaITY91nS/UqTH+Q
         Lo9wQbXjkD9ePJlYgi6O07SGXgHmGXKCRB55MaHSixNk5t5WIfPy7wXqvZ8tPU+vgTJL
         t5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710948079; x=1711552879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K79Rmkut9qpCXluStnFy1e9/DwvNUnuxwsUoll8/3LQ=;
        b=ph37K5N7LJMoAFGMsUgBHuyn1jWaPFvYQUgrnGIA1De98k4ar82BeEKuJxFaM7opEB
         71VxH6RQXn5Sh0mwPL6yms8O5L288EtY1Rj45YNMbzWKMmvGx7Rd4NapcqvHAMGfaoZy
         umlRvHVdZHQfqlzd9aNRbVNrKw+Kp0epSoqD4nYcA7JsqWPEysIEEYaef7+alRHhUt/F
         cdEgooK0u8PEUr6KK4iA/Ehkj/Nc+lehhA2zOd+ggm0sOi7r50Y8pE4BrQP6mbdo8eu0
         fhN4yzji1b+Mp5+SYZRdnun72O6LJspYVa9BhR9aOr54M3MbjGIfPgk7N1+HlR2Upt++
         2OAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2yZyPpNDrfujOYfnpkPRWTfuVri4n4CxXYd23TkMUZZ1h03DXmTBQS1lsTSEnU1kMhk6Xw/5Fn7ylnQkjJdAsEznsIR5XVc+bZA8=
X-Gm-Message-State: AOJu0YwNl0lWir/mXhPbgtQBKTqTqXWDKh2EX9favNWVY94yDiEV+N0c
	9rqvS/Bp158U/CM2pgmnugSUsy2n2UAEXrsEEQckmxzSeNK2Y7HFBvuziir2Ab8=
X-Google-Smtp-Source: AGHT+IHwRQ33PtfxlDWm/A/rFIS4AW13AJCss2cnflOWCWZKVAEt28dJPafFxEHvUYhKw17NZ88YyQ==
X-Received: by 2002:a1c:4b17:0:b0:414:3c57:fae5 with SMTP id y23-20020a1c4b17000000b004143c57fae5mr4973532wma.38.1710948079070;
        Wed, 20 Mar 2024 08:21:19 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b004140e701884sm2509609wmq.22.2024.03.20.08.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 08:21:18 -0700 (PDT)
Message-ID: <d5db5727-92c4-44e9-b5d0-d734d6940369@linaro.org>
Date: Wed, 20 Mar 2024 15:21:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: qcom: camss: Add new csiphy driver 2-1-2
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-4-quic_depengs@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240320141136.26827-4-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 14:11, Depeng Shao wrote:
> From: Yongsheng Li <quic_yon@quicinc.com>
> 
> The CSIPHY register offset of SM8550 is different with
> SM8250, so add a new driver for the SM8550 platform.
> 
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Co-developed-by: Depeng Shao <depengs@qti.qualcomm.com>

You're listing yourself ? Twice with a different CD and SOB.
Shouldn't this be
Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>

?

> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../platform/qcom/camss/camss-csiphy-2-1-2.c  | 343 ++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>   3 files changed, 345 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csiphy-2-1-2.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 0d4389ab312d..28eba4bf3e38 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -9,6 +9,7 @@ qcom-camss-objs += \
>   		camss-csid-gen2.o \
>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
> +		camss-csiphy-2-1-2.o \

File name here is incorrect camss-csiphy-3ph-1-2.o this is a 3 phase 
capable PHY right ? So both the filename and the commit title need to 
reflect that.

I thought we had discussed offline using an offset instead of a new file ?

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/6dc8f49ef7c6ca69783aa02bdca81c77e66ecc0d

Then just set the offset

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/022a837257d9e1fa8070f0dfa2f683e903111aa0


>   		camss-csiphy.o \
>   		camss-ispif.o \
>   		camss-vfe-4-1.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2-1-2.c b/drivers/media/platform/qcom/camss/camss-csiphy-2-1-2.c
> new file mode 100644
> index 000000000000..df7860d7a4f4
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2-1-2.c
> @@ -0,0 +1,343 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csiphy-2-1-2.c
> + *
> + * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v2.0
> + *
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "camss.h"
> +#include "camss-csiphy.h"
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +
> +
> +#define CSIPHY_CMN_CSI_COMMON_CTRLn(n)	(0x1000 + 0x4 * (n))
> +#define CSIPHY_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
> +#define CSIPHY_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
> +#define CSIPHY_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> +#define CSIPHY_CMN_CSI_COMMON_CTRL7_CONTROL	0x7A
> +#define CSIPHY_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET	BIT(0)
> +#define CSIPHY_CMN_CSI_COMMON_CTRL0_SWI_ENABLE_LANESYNC	BIT(1)
> +#define CSIPHY_CMN_CSI_COMMON_STATUSn(n)	(0x10B0 + 0x4 * (n))
> +
> +#define CSIPHY_DEFAULT_PARAMS            0
> +#define CSIPHY_LANE_ENABLE               1
> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE     2
> +#define CSIPHY_SETTLE_CNT_HIGHER_BYTE    3
> +#define CSIPHY_DNP_PARAMS                4
> +#define CSIPHY_2PH_REGS                  5
> +#define CSIPHY_3PH_REGS                  6
> +
> +struct csiphy_reg_t {
> +	s32 reg_addr;
> +	s32 reg_data;
> +	s32 delay;
> +	u32 csiphy_param_type;
> +};
> +
> +/* 2.1.2 2PH */
> +static const struct
> +csiphy_reg_t lane_regs_sm8550[5][20] = {

So per the tree I shared with you..

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/fa666c241eb530a08aa6b391e15b018296e93f66

We don't need to break this up into a multi-dimensional array

its just a straight write of values
> +	{
> +		{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +		{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +		{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +		{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0094, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x005C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0060, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0494, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x045C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0460, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0894, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x085C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0860, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0864, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C94, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C5C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C60, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	}
> +};
> +
> +static void csiphy_hw_version_read(struct csiphy_device *csiphy,
> +				   struct device *dev)
> +{
> +	u32 hw_version;
> +
> +	writel(CSIPHY_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID,
> +	       csiphy->base + CSIPHY_CMN_CSI_COMMON_CTRLn(6));
> +
> +	hw_version = readl_relaxed(csiphy->base +
> +				   CSIPHY_CMN_CSI_COMMON_STATUSn(12));
> +	hw_version |= readl_relaxed(csiphy->base +
> +				   CSIPHY_CMN_CSI_COMMON_STATUSn(13)) << 8;
> +	hw_version |= readl_relaxed(csiphy->base +
> +				   CSIPHY_CMN_CSI_COMMON_STATUSn(14)) << 16;
> +	hw_version |= readl_relaxed(csiphy->base +
> +				   CSIPHY_CMN_CSI_COMMON_STATUSn(15)) << 24;
> +
> +	dev_info(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
> +}
> +
> +/*
> + * csiphy_reset - Perform software reset on CSIPHY module
> + * @csiphy: CSIPHY device
> + */
> +static void csiphy_reset(struct csiphy_device *csiphy)
> +{
> +	writel_relaxed(0x1, csiphy->base + CSIPHY_CMN_CSI_COMMON_CTRLn(0));
> +	usleep_range(5000, 8000);
> +	writel_relaxed(0x0, csiphy->base + CSIPHY_CMN_CSI_COMMON_CTRLn(0));
> +}
> +
> +static irqreturn_t csiphy_isr(int irq, void *dev)
> +{
> +	struct csiphy_device *csiphy = dev;
> +	int i;
> +
> +	for (i = 0; i < 11; i++) {
> +		int c = i + 22;
> +		u8 val = readl_relaxed(csiphy->base +
> +				       CSIPHY_CMN_CSI_COMMON_STATUSn(i));
> +
> +		writel_relaxed(val, csiphy->base +
> +				    CSIPHY_CMN_CSI_COMMON_CTRLn(c));
> +	}
> +
> +	writel_relaxed(0x1, csiphy->base + CSIPHY_CMN_CSI_COMMON_CTRLn(10));
> +	writel_relaxed(0x0, csiphy->base + CSIPHY_CMN_CSI_COMMON_CTRLn(10));
> +
> +	for (i = 22; i < 33; i++)
> +		writel_relaxed(0x0, csiphy->base +
> +				    CSIPHY_CMN_CSI_COMMON_CTRLn(i));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * csiphy_settle_cnt_calc - Calculate settle count value
> + *
> + * Helper function to calculate settle count value. This is
> + * based on the CSI2 T_hs_settle parameter which in turn
> + * is calculated based on the CSI2 transmitter link frequency.
> + *
> + * Return settle count value or 0 if the CSI2 link frequency
> + * is not available
> + */
> +static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
> +{
> +	u32 ui; /* ps */
> +	u32 timer_period; /* ps */
> +	u32 t_hs_prepare_max; /* ps */
> +	u32 t_hs_settle; /* ps */
> +	u8 settle_cnt;
> +
> +	if (link_freq <= 0)
> +		return 0;
> +
> +	ui = div_u64(1000000000000LL, link_freq);
> +	ui /= 2;
> +	t_hs_prepare_max = 85000 + 6 * ui;
> +	t_hs_settle = t_hs_prepare_max;
> +
> +	timer_period = div_u64(1000000000000LL, timer_clk_rate);
> +	settle_cnt = t_hs_settle / timer_period - 6;
> +
> +	return settle_cnt;
> +}

Yep this is all literal copy/paste of existing code.

Please try taking

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/aa27ac8e1ffedd48c5ef6ac0f75f1f15716fe296

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/fa666c241eb530a08aa6b391e15b018296e93f66

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/e9e99dee4e723755274e6430bb43adfbf77d2a1a

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/5dc53c39b96eb22bdfe47554f047e6b63ddb25c0

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/36655b353fa71269812cff0e695341ff12042546

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/6dc8f49ef7c6ca69783aa02bdca81c77e66ecc0d

and

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/042ec64867d43e014c2b369db3b92b4f5432497f

into your tree

it works for me on sm8250 and is WIP for x1e80100

Point being we need to make an effort to unify/reuse/fix init sequences 
upstream not to copy/paste from one file to another.

> +
> +static void csiphy_config_lanes(struct csiphy_device *csiphy,
> +				     u8 settle_cnt)
> +{
> +	const struct csiphy_reg_t *r;
> +	int i, l, array_size;
> +	u32 val;
> +
> +	switch (csiphy->camss->res->version) {
> +	case CAMSS_8550:
> +		r = &lane_regs_sm8550[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sm8550[0]);
> +		break;
> +	default:
> +		WARN(1, "unknown csi version\n");
> +		return;
> +	}
> +
> +	for (l = 0; l < 5; l++) {

These hard-coded values in control loops must be done away with upstream.

---
bod

