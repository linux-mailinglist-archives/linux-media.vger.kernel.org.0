Return-Path: <linux-media+bounces-5407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5F859CF3
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 08:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ACC9281006
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 07:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCD520B11;
	Mon, 19 Feb 2024 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="agmGWt0G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1822323
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328040; cv=none; b=Mfbeu2ouFIMr3vE3a4yj9GEVUD5mR5DFH8Dm8X00+gCp8htmnP6/n9cIhcg0AcjyEJL0ei9Re+sictIlTQZcDW6AEYyw737kfW3kbnpALfux1blw4yoFsymBemoxmlegcjdzQc6laweifhYAbqhwsMjmNQzXKcpeZuxS8/zDIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328040; c=relaxed/simple;
	bh=pSGqYWEkgA5r9fvAZaRNq9VpI+rNE64hzozwKd0Iv60=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P/lvpKrKMeBx4rAQ83zv9GNGu9jJ6Q+O02YHpU5nBgUV5YL5c9dFrrrzYbgqGCcjblg5LjgPO47jU7JQWm8eYvX6d1OQx85c5/AvTv4zF1AJhBnWOIvAgodMyNqiIfMFmA7dhYQlEcA9uJLhfi6llgt4X5OKMd9PAyZ9+j3z57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=agmGWt0G; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512b25893c9so664015e87.3
        for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 23:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328037; x=1708932837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ng3gW4V3o0lgSkXW6LbE2EKjcIRK6fb4LZxE38g6CE=;
        b=agmGWt0GYXvSMZ5nFELoKzr7zFdgt7JzmtUYPeiiRxQlJxcBoGgOylwgHzarSE/PTY
         tMd1EuXOdLZH4pZ8dLddHn4tpz7r87EivJpJpv7W8qXRIGa+l+1YC4QUnpmh/0NFxJ93
         Z509cUXTYLax9/aNTu/CbDLPUv3IJWLNWt4qGTK0MrcK4Vhge74X77GVWFKZtZ8IiB7R
         N3lR7s/ZNj27Ps77ra8wHKaAswIaatdghJZ3rdc7diLlfN+MT16abFK4lnB4flsJ+bbe
         JZuGw2fYSioAVUQtJihYeokp3zbnUK3y5CHrMKBVALcXAWqrNyuQIKui8Jn1Vr1jOkKR
         hCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328037; x=1708932837;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ng3gW4V3o0lgSkXW6LbE2EKjcIRK6fb4LZxE38g6CE=;
        b=ku2d23dzwonS0V4DECuFG5iW3TO2by6xlIcTzOAwQCy/JXOFg26IHSsv6hyvpodm9E
         7fv9vyG2C2ODulNYzGiFdqtPrVATA05+4dXcI7NOPSzHqFwg56ZaT6Uar4wkS8FD9Gf4
         37vgRgLZpUFsoZ77Lfa/7Y2eriMPAhJWXeSv0Qk9F5yCcrOv8Ugx+fGDvl34fOBTpD/C
         7nRMndmwUtcKTdzvs4l+wM9i4/VVceWxkVrmWRuTRHx54pMGbMHVBWfRzM1CiyAZ9T/g
         LspoyiQNRM84qAtWd4hPkCWOClucu/lCzZ2WVgWWwh9Xh9l1Coj0RuX2p6zv2/RVMgpO
         Ovcw==
X-Forwarded-Encrypted: i=1; AJvYcCXKtjBgedhVeAZBpRHisv6euG5IBNu7zrp29Fiy6kvxXGFvHdzjOLQOprXQH3P/UNxa91H7/DWrgf5ykJgQsB8cKKsadwa6pAvD6tQ=
X-Gm-Message-State: AOJu0YyP7G3Zpjt9Rs4wx+eSWcKZNgbSV8Oc19x6Dr0o+Rnfq1MI6v0p
	tV/dWbAMs8Wg3r6sNUmbp+amS7JPFgDuFOfohF63L3AA1G0sg+dVwFjAm2jwxic=
X-Google-Smtp-Source: AGHT+IH7t2S3UJLlE+g5RosWguA6ACJo1jYaUo0HRFcgzCtXQeK6rSIGLys7KhAWV1PTPsrhu0txhw==
X-Received: by 2002:a05:6512:3144:b0:511:84fe:8dcd with SMTP id s4-20020a056512314400b0051184fe8dcdmr7786108lfi.1.1708328036943;
        Sun, 18 Feb 2024 23:33:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0041256ab5becsm7611582wms.26.2024.02.18.23.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:33:56 -0800 (PST)
Message-ID: <e6c6e825-42dd-4f2d-8329-f7b3e09bb8a9@tuxon.dev>
Date: Mon, 19 Feb 2024 09:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Nishanth Menon <nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
 <e43727bd-d83d-4271-9871-ff995c8e7d03@tuxon.dev>
 <88de75cd-4069-4be6-9c4e-f32befa46d58@linaro.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <88de75cd-4069-4be6-9c4e-f32befa46d58@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19.02.2024 08:59, Krzysztof Kozlowski wrote:
> On 19/02/2024 07:25, claudiu beznea wrote:
>>
>>
>> On 08.02.2024 18:37, Krzysztof Kozlowski wrote:
>>> None of the implementations of the get() and get_hw() callbacks of
>>> "struct of_clk_provider" modify the contents of received of_phandle_args
>>> pointer.  They treat it as read-only variable used to find the clock to
>>> return.  Make obvious that implementations are not supposed to modify
>>> the of_phandle_args, by making it a pointer to const.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  drivers/clk/at91/pmc.c                        |  3 +-
>>>  drivers/clk/at91/pmc.h                        |  3 +-
>>
>> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> You understand there is no review for "part of patch"? You probably
> meant Acked-by.

Sure... Here it is:
Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> 
> https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/process/submitting-patches.rst#L544
> 
> Best regards,
> Krzysztof
> 

