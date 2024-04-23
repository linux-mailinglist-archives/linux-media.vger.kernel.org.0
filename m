Return-Path: <linux-media+bounces-9886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729A8AD869
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 01:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F081C211F3
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 23:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77694181BA9;
	Mon, 22 Apr 2024 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDLHP7bL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8FA181B96
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713826501; cv=none; b=WpKYRJNhM3DTWjfOdZfTRQAhMsokfck1taMRF9uG4huAo1rfiJGQ0vxE7Pg0cH947bxrkhIN3BUDbAtk+9Hmzeyk6gPWJZ7VG2hYZQpR0qqLBqGtbP1OduyF6rEPjBs4ioZe5+7fSG4BZRCa2IkGgIBp4hr1wMKDxXfJILsdNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713826501; c=relaxed/simple;
	bh=6HogZA72dEjIUD+2dcxM4x6w3f26UzuKuHmtXyQJhYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nD1GToHYeJ6K8LISOg2S83yxZVJAZglGPEsRDwvjVV1Z8SsJCC2Of+nF9pxLn2qCKp/T5VAeeBePJnpkBj/ot+UcW3EliMyLzCq3sC5Fg2SlJTmWgT/PqhNALyC+cybnAHIAqNmV3f6yoHeaNvciuGLtQb1Ig2AQdKlblSoRcUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDLHP7bL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so6049064e87.2
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 15:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713826498; x=1714431298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZZenxLxXRLNUaVa8fsakmHFgHCabBfzf+FG1fzHvGg=;
        b=dDLHP7bLr8iaFxrFy9eROta/6il280DnVVjQLUgnoFYEjjB4y9CqDrlXN6ALhi+6Bb
         p0SVa1RNvUPd1SFplgXyaqbEd4cS9pzTAxM13e0sfvUUcqeWunsGEhXhr5bFPgB8fNRJ
         8gzbUkTkED77qm+bfgyCWQSF+i2wGvvdxldZq3qmCOP5ijoXPfehI0znimaNzMXh2Qz8
         wB7j8OcD5F8PGic3l6SUooGJ6zr2eveUDBY8hV+j3U12SP5Zz1nHpyvd9Qzn/0cPXtK5
         EkmveKG1xkiblTLpebpVc8Wwb30kXR5b57kCR1o52gsIMVjWJ3vuEIM/pJl3R1yK84ky
         TiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713826498; x=1714431298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZZenxLxXRLNUaVa8fsakmHFgHCabBfzf+FG1fzHvGg=;
        b=hv7euI4Fkpqbg7GUHezr42jTSUPyRswwSKcvd4ZKoa0C5cptI3FE8A0fWO/akDUz9n
         RM9nH1EmLlKcJoVfYmH+rTqeAqIsynuknUfjJo6EAlmu5XiZeoPchpkupk398sUt/HlL
         i1H9RuuaK1mu+KVkXt1Erxf197zEzrny9aDuEOahYCqZhKgaK4qTdtcMwaigZryOnUZY
         Ss2jk6NtInq6IvMi1RatIBtG8/pp8XJ7jF1PsQ7RUHVYMqCRvyRHXCCjpaveC+NZc3T8
         vVnjUSTHsDnncnZNxzLLOzws9qiUUiDKKlXSkDFPpERC2+tnUUgKV1O55PkMYqk1+0G4
         oppg==
X-Forwarded-Encrypted: i=1; AJvYcCWuDyAvTCGKWKIfvvnAbsUBmlP3dRDwp864VMuO7KdBf4TOAIjHuX56OHMlv2Lhp/q6hMRab1QEy7DlNkmrzQGfmunqmOsrD7lRcv0=
X-Gm-Message-State: AOJu0Yw4PJPpkcFywGhtJuLXOsnmONKmkd80YFL/qvZzVs0FUrkMpO/+
	7ihzvKo9SThPgCW1OrIveH6DZDgxjdfV7Oc/KCiTQ1Pokr6527Ui5LiWxpqMWig=
X-Google-Smtp-Source: AGHT+IELvYr9TnwH1ZhKLd/4NPGBCKp/hD2+vGQEykAEl5SbO2M55duobRfLF8evMAaGAmUz4pqtMg==
X-Received: by 2002:ac2:4294:0:b0:51a:fe04:13e3 with SMTP id m20-20020ac24294000000b0051afe0413e3mr4109059lfh.8.1713826498423;
        Mon, 22 Apr 2024 15:54:58 -0700 (PDT)
Received: from [172.30.204.103] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u18-20020ac24c32000000b0051b5e710366sm266474lfq.129.2024.04.22.15.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 15:54:58 -0700 (PDT)
Message-ID: <3592cea4-7e5c-448a-83c0-562b4ef4e7a1@linaro.org>
Date: Tue, 23 Apr 2024 00:54:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 4/5] clk: qcom: Use HW_CTRL_TRIGGER flag to
 switch video GDSC to HW mode
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240413152013.22307-1-quic_jkona@quicinc.com>
 <20240413152013.22307-5-quic_jkona@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240413152013.22307-5-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/13/24 17:20, Jagadeesh Kona wrote:
> The HW_CTRL_TRIGGER flag provides flexibility to switch the GDSC
> mode as per the consumers requirement compared to HW_CTRL flag which
> directly switches the GDSC mode as part of gdsc enable/disable.
> Hence use HW_CTRL_TRIGGER flag for vcodec GDSC's to allow venus driver
> to switch the vcodec GDSC to HW/SW control modes at runtime using
> dev_pm_genpd_set_hwmode() API.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

The commit title states clk: qcom: yet the only files changed are:

>   drivers/clk/qcom/videocc-sc7280.c | 2 +-
>   drivers/clk/qcom/videocc-sm8250.c | 4 ++--

With no explanation as to why anywhere

Konrad

