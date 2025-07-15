Return-Path: <linux-media+bounces-37740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F157B052C5
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A22507B571E
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19594275B12;
	Tue, 15 Jul 2025 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IL2rJNoA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A66271456
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563960; cv=none; b=sGWEacLjowE79X/susIdVoKIQCU+FzEU0FkkkpqJTPGc7pwiLM9MnAqdsU2SHH/yVk1AhL5dReYp4pvxHV7OOJ+rs1H7lKDjkDlK6Nim9jcXayVJCJuGfCV9sibXn0Ck9NQc3cS/4c/XoC2cUSWC+21I77nIqVT1WzH6gGwqQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563960; c=relaxed/simple;
	bh=dOb9Epf/TTGBkZ5gyzcRhX8nkY6+Xl8serOtV4krvFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ug5xFgEjBSPSZXvSCEb63MrDjzv1gx1yO8ZSiwYPH9ZuiGn0zIbKYQKi23As8Qu6RAMNq58LOsWsGgtxR4km6ozsXEiJpQDHoeSPRCjkbfyC9nELCLd3MB7jYc9028kqCrM2cEweO+rnUPaphoQU5lw9ztVdo99oCwBZF+LvFF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IL2rJNoA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553aba2f99eso701803e87.3
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752563956; x=1753168756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RSJvNlWoWjahN3C/yzd7QKoGlsR79XtnIfFExv1q1o=;
        b=IL2rJNoAuObhJpOEXDT3LhkNDxmMhFUZ7SNrXTUXbt4B9rRH9lFxisWwpr8rdpCiNa
         8Csr/zifh477uqmedPTsrXXIXE7ccOJGq8zKr64UaI+rD7LfXsBKoNTuTq9MWRz8slBa
         wZEWkyetyjLKsMawGfOMjY6mLKtr9Os3f9mbs06g36XiJL5NBiKPwLLkDAD5Xlb2QUyA
         zf0CCiahELywgUIWfzdZ90jX1k8NUAg0SwspWRijGPQomLIxsqwn3wLm8opWpJTkXSIf
         FPi9IKN4yxMCrG/9lCgq1IX4AOkvYr/lRflj4s75DZWgg8JMzctiitEBQDdWX4q19rJ4
         reqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563956; x=1753168756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RSJvNlWoWjahN3C/yzd7QKoGlsR79XtnIfFExv1q1o=;
        b=JN5uhrre4RLCyKTz4XqkoZzThAiCPBtWgKR3yOjsmqpjFydzv/2HW5hSg59NYS8Kkt
         ZH3waSEuo+B2PuUXbjTcy4AoPx7axhCqJ6jBoyq/vKNF1H6toOCRaHjaxbG5KSwa+pX7
         WcSsuf3GafSmO81Ug2DcMCRQ5WE71BINNV57EAwT8DDpcr2ektOoVF5DwCARjICH9C8f
         QmSw58D7LmZb45mt74QjaH3RIxET+f+FgBxDFV4P+fqAFU7Xcpv/wn+BwWmkABY+4Hc5
         euQBNdirkCDsd5hO6y+YeZvvTA5rrkT9fSXehi3U/U5lhZnGdXfstjANvcD7iYOxyPx2
         p22w==
X-Forwarded-Encrypted: i=1; AJvYcCXNHWSNRF0OK+SMo/sUZDFowXQLY30F+z5D21+MfWtmwdYy0Bil46VxldyeKnrMVJjUjsSOCr3JYPnEFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrziyazsH1YS88IiFPWwWGRqoOluQPU7uW0frRngLTwdD1MFfB
	uy0KLc1htE2iPQPs/Z/t7QbFtl3W3I7p8s6d0i+EoZUiqdK+Ry/PkVpt1Fh3yCdJ6lE=
X-Gm-Gg: ASbGnctWIlCOS9WUz7Ny6RBLJwB/sGho3KrmsXE8f4YuQSRy/EP/5nkVTM4y2hfBRIp
	P3wkSltFyIayCkXJdm3yyyc04p54bezivEHob6Xi87jP0w1MAVk4YT3omlOaURu9Z0JT3Ggvm24
	+azO2tA/tBxeAsRR3zVisAf0n+wnn+nCx14wk4zkjDs+VWFbm+Nx+BryfX/Qu4tIp5MvjYEQKvi
	o1CXwZ5mA6zRgU7/oI/MsrpzUMHbJSFC808u1U8bF+sWm4cmh+688qqyBU0EZefCEcKlGZx6Yx9
	ZQuC/i9OD13/fKIRzuY/AMjQ9JdgE5VAivHOqqpWZzwMGEVNmmzAU7BCg5jmhUC0rG04hI8VL1A
	X+9MflYK+iHmfRWaZ064FWfARF47lYYM4Z37i9TXfnN2boZQPx2BKgX7DiDdr8f0lT19QSAjLFj
	bz
X-Google-Smtp-Source: AGHT+IFIHphgOuWL4hHbYQo8BUYKQWMRs2PJ8O0o5nTLr+EyV7m9/xz8o904WRm6rWfLBy+6fENRug==
X-Received: by 2002:a05:6512:4027:b0:556:2764:d207 with SMTP id 2adb3069b0e04-55a1fdce413mr78512e87.11.1752563956166;
        Tue, 15 Jul 2025 00:19:16 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a05daa619sm1688569e87.41.2025.07.15.00.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 00:19:15 -0700 (PDT)
Message-ID: <bd7cab62-f0ba-440d-8dc2-3304afe884df@linaro.org>
Date: Tue, 15 Jul 2025 10:19:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
 <5f3b2bda-92f9-479a-9af7-5d08e420121d@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5f3b2bda-92f9-479a-9af7-5d08e420121d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/25 10:01, Krzysztof Kozlowski wrote:
> On 15/07/2025 08:53, Vladimir Zapolskiy wrote:
>>
>> 2. The whole new changes for legacy/new CSIPHY support is not present
>> in v1-v6 of this changeset, it just appears out of nowhere in the v7,
>> and since it is broken it should be removed from v8 expectedly.
> 
> 
> Why? If it is broken, should be fixed in v8, not dropped from v8.

There is a conflict between these new v7 changes and another old and
still unreviewed/uncommented changeset, which provides quite a similar
functionality, but it has slightly different CSIPHY device tree node
descriptions and their connections to CAMSS.

This technical conflict should be resolved before making a bet which
one of two CHIPHY series is better and should be fixed in the next
version.

-- 
Best wishes,
Vladimir

