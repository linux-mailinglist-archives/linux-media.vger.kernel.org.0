Return-Path: <linux-media+bounces-19593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63599C6BB
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 12:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB1ACB23381
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 10:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1320F15B13D;
	Mon, 14 Oct 2024 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBV9IsKr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56D3158D6A
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728900529; cv=none; b=UDKi+uy7y854lFdvGuotXN60++OOhaQwr3rg+onR+aDz5y5pei7/VFM/OQQznLzNGmF1C/SqNcPfNh2f13Y1cFDS/fknw9v4gwJJXhgn4maVblj6zQ2e7K9cbIjqOtwAZOOIY5QzuUuvLFayeDugjmy/Wcda0D25NV+m0Gn7cUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728900529; c=relaxed/simple;
	bh=/sWlEGgfHHX9djG/FSb50XLkDF+y1KqaTESwoXdZHSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6WcJFTcJJHl0tO23MdfnRaSiDujw2nBnbuwSWcU+9dTvPWI2fp3JnAoKfqE8bXIubmjpS8oaDYh0u3CiZv8jYp4/dyyGct4tgTNo4lz7k9BVCi1vhIRD7j8qEj41Ewx5Qfd1GYHsWYC6PIAwU5dGUMqk7Pav1HmdLmIpDEG6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bBV9IsKr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so1194067a12.1
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 03:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728900526; x=1729505326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWUSe6Dna6tclDo/Nzgx/0TudE4bBGcoklr8vby/lzw=;
        b=bBV9IsKr8UqJv708BP/R7LOJWTtRDlsUMKQ+SNWIjeqa78UzM5Rwvtax9xpXkLHSXj
         j+CKXgNFIQWtD7afS6hsH+gB6FUGl1PI5QsWjjrw0jcYf/zPcdkJIna1YnL6KO3mDu4G
         aaCw7rpzsxpnB43RgzBIflrrofve/WhD4rKkV1ES7vQYb+wZrxqH+e/hx2tyYhMKae1T
         48gAjORiNJusW9oc0woSiwIz3dN8gcKJh0Z2Xfz9yNhLQDOyamse8pLLt1xFuP8S9mSw
         I86JxGG5KNcAkwDLSaTSIPo3nWdc01a2aJOxzwYgTaKWnE8tuKtV0AOAZFDFD+4q8Cfz
         RntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728900526; x=1729505326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWUSe6Dna6tclDo/Nzgx/0TudE4bBGcoklr8vby/lzw=;
        b=iMUxDa0lkKeKYz+l6GGphsDkgNoxtmKuoQ00suG8d+juRhjvH9DpzamkgjwQrlu6NN
         qZ0xeoHCTtORywHngZW1aZyLogidgK9yzCFH1zhDRLL5ZWWWjzRESvPR7gML6nOeclxE
         zAJSa1/VzXHt9pMPcCSB4aguOumHQgOFKRicm3prlj/uN3nmWD83KaFukWqpvnnT1nY/
         v1av22Pf6xTUOt+F2OyzpRmZ5OgYcJezHdPgpQqn5KmIeAtO4ehtQE40ol+jQ+17CkoH
         53mH1ryS5K3NfnJJkYF7oseIi63qbjzVORO/a6qKWW8fetmE3DfqMRcOGaADRri0FCmk
         2tzA==
X-Forwarded-Encrypted: i=1; AJvYcCX7ojW2uA8OGnIogpB3oBgxAm2yd4rCW7i+1g8hINW75eBjJseh89NWEiC75Cpe/EQmwgjR3o8MAwMgIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOHg7IpBeOrrKn4W0JwfNZrPOM4jUrVYMcL0Ej/8YV4QDEtUU
	wiTO3nAOuzOHMdTi5L075HD0LItEQuox3smoTih3h7mRSNmbL/7BpBhLmWRvAVI=
X-Google-Smtp-Source: AGHT+IESQDbU2/QoUk/jd6BnyeOUUPQzo77RwiIkyssfzTbI61MYXbPAfDvLUJDHZOc5ItYRiz14Fw==
X-Received: by 2002:a05:6402:5191:b0:5c9:5e43:9480 with SMTP id 4fb4d7f45d1cf-5c95e43f157mr4714225a12.7.1728900526354;
        Mon, 14 Oct 2024 03:08:46 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937152f12sm4802674a12.44.2024.10.14.03.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 03:08:45 -0700 (PDT)
Message-ID: <0240feca-541d-4aa9-abde-c0b0b0b477e5@linaro.org>
Date: Mon, 14 Oct 2024 11:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: Remove assigned-clock-* from
 various schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>
 <w4ta26svh34gojqpakrgp5cpsempedkewkmbllyvs5z5fm274z@jqs3tvunxq2s>
 <ca48de1b-b45e-4b27-a186-3bb7eb5859fa@linaro.org>
 <9e3d86b4-fad7-4467-af7c-9195855cd318@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9e3d86b4-fad7-4467-af7c-9195855cd318@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 09:44, Krzysztof Kozlowski wrote:
> On 14/10/2024 10:29, Bryan O'Donoghue wrote:
>> On 14/10/2024 08:43, Krzysztof Kozlowski wrote:
>>>> -  - assigned-clocks
>>>> -  - assigned-clock-rates
>>> That's not extraneous, but has a meaning that without assigned-clocks
>>> this device or driver will not operate.
>>>
>>> File should rather stay as is.
>>
>> Hmm, I've obviously missed a trick here.
>>
>> I'll check it out.
> 
> My response was probably not complete: this still might be extraneous,
> because maybe the driver/device do not care. But in general requiring
> assigned-clocks could have a meaning.

No I see what you mean

Even though assigned-clock* is a property of the SoC this driver..

drivers/media/i2c/hi846.c
         mclk_freq = clk_get_rate(hi846->clock);
         if (mclk_freq != 25000000)
                 dev_warn(&client->dev,
                          "External clock freq should be 25000000, not 
%u.\n",
                          mclk_freq);

doesn't support setting the clock.

So it actually is a requirement, yes.

---
bod

