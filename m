Return-Path: <linux-media+bounces-42140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AC9B50982
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 02:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E930F7A87A3
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 00:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7B1BA3D;
	Wed, 10 Sep 2025 00:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwOlaM6G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D7210F2
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 00:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757462640; cv=none; b=diFD4DLfx3HgvVYUb1Inuj29cOOfgvp7h2PmSswbHUMMwe1Pri/Fx6E4b4xQMbHU6b7ECL5COvz6AmtXSlMdiL3+ugz5oBih5HY7YlBXbbUwmcRn3BrCVZAFYwWupdjiGtJx1+L7K5sYA3VrB7h4Rsq+KHBadXQ9oLiot1XOt38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757462640; c=relaxed/simple;
	bh=aM0f+GLpVC3RdUBNG53qY+EWXbzr1kR/wdH90UTSUcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upCIqfMSExCMUNiDRkRWWL1k8AALWQGrOcwB7BD3+dE7ePSiBeJyMN2uboYLzHrvYjBfpQtoUkrA03AENWrk2/1RJwvIk6sMkyHSys2u1E6yrFuhCutGwq5iPKt1myNcpu4keQQPU4aCmFmzMlN79QX2uMBW7+8Qmsjp4Mivjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwOlaM6G; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55fc2236ce0so1163763e87.0
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 17:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757462636; x=1758067436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOWfAUqBearDduvZwNuqD1QST50/2mEcaT/mHs7RZ7s=;
        b=zwOlaM6G+mUAMDW8T2C9inM30YLkRJxUUiMA6zThfH0g1GWjGkeUuflT6k6dwZIvQ/
         iQGks6h29lPSKL8LtHGxIcCo43Iyz/13wVSmN9EE4bbHAbJDwP4yuMxTknUnFT+ZsNg/
         dFMyl8Oss91Chj91hM1LBNW9qaKKQ+z76RUcUFQk+EO+iaO9nFv8qWe6YsFX7P/oDf2r
         HyzTXa33L6+IoImVqA7nD3+iY26NEIIuvSDU6Dy5UYFF4R02nWeRDDSkq9VYarfkTU73
         qNJ+uIEHYYdLs/HMi795C305Wbw20Z5ClbMCtVBduatxyOpOD1FXNw9yt/kGJeIktPFv
         QL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757462636; x=1758067436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dOWfAUqBearDduvZwNuqD1QST50/2mEcaT/mHs7RZ7s=;
        b=a26rvwSJgyouTGVQ1fokQtNeaPDLRausW1aerSBv0sKPbysJWkI9s4IoMCpYTQvfqV
         vOtbu2yhlZGkFacMvBYEXZMQlhPMU9SoMSY8AI60gNOjBWVdfXvMsM3ePebmK2jAOmI6
         ++CHm2DU8QvmSiBQtaRzpneVTodKclhTEjxehMA9xHBJU/Ngjsy+aSGTnWMv6gzCGP5s
         +s1qrRofon0hnxzGp3B0HNJesk9DU2GJ7Xd5dKij8j6eHpOO313gegH6FSD1KHInz6oT
         wIA/CKd1xqxMN9dvvyJ+s2o/37fbsM6ZAiH8excy9dWuzpS+4EIwo09c89H6mLdN/pZu
         1jTQ==
X-Gm-Message-State: AOJu0YyLDo/6FW/uRicxkttJpBpJNtmZPcuZx+u/EVvfYkoyITPEcLD+
	TU1R6t1cnz6dXiCmIFMcZWY3KdcUDVL3MME5b6Ez6Gwc9//2QNHDHr7jM5Yo3vcIQKk=
X-Gm-Gg: ASbGncvqVwX6VUlA5FwCK/QTyZmw3lHYnkobeFI1kyEXiEmCpYOXb3DLkJenHtaCiGN
	CzW4Q2cDuMKa7gg+CeUTdsZVVRDoOufeFZ5xxXMeg8iFAsz6AHVEpWB7Cwweip6Rz4gt8WfZ6DY
	WtX34zItT1nAkzOqBtOBO40K1F3VkgKTAnnWn767aMvmII0krnvNYxZdI2TeZPIBSdIBDXZXc73
	NygW5DIuzuFpscwj7bwNQaad1gkLH62wCkgyivh2O+c5DRARKP53zke1gkhao+qC+fyRthcO6X4
	KJs4kv/gcyFgTm2omN8PZF6PMCLVgfuPuBhpMe6wpQ9p/knKIyCtWORuWcWjxuV8qWTb0d31Lts
	PHjsz7qoqcvaaUw7gm6ZP2qmcO86xOaOsmLVlUd8VOWQCiazT1d3j3gDJfpt/KojTytrBCN2ipE
	Ur
X-Google-Smtp-Source: AGHT+IGi4WCm9ZDYvvM0pG7h9K4bW/FAXAlAlGeXUYm8D3ijw8/ibjgsoLmCo1Mv6kNjk+5aQ+ldew==
X-Received: by 2002:a19:6417:0:b0:564:7824:7771 with SMTP id 2adb3069b0e04-56478247976mr1245873e87.11.1757462636067;
        Tue, 09 Sep 2025 17:03:56 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56817f72e64sm836274e87.104.2025.09.09.17.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 17:03:54 -0700 (PDT)
Message-ID: <22e585f9-fdf4-49b0-8d08-37c3dad94551@linaro.org>
Date: Wed, 10 Sep 2025 03:03:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Add missing header bitfield.h
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hans@jjverkuil.nl, kernel test robot <lkp@intel.com>
References: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/25 22:46, Loic Poulain wrote:
> Add the <linux/bitfield.h> header to prevent erros:
>>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
>        36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
>           |                                                 ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
>        38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
>           |                                                 ^
>     2 errors generated.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

