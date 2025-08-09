Return-Path: <linux-media+bounces-39191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35888B1F473
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 13:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53C1116A745
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 11:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1CA27FB1E;
	Sat,  9 Aug 2025 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lWyP8IBi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20627CB04
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754740294; cv=none; b=Vxc/gXB1N/5xMwsYYSSrnlvumpWufF4CbCV/654zn3Zgcevbl8rRIP8sH7yE3UZW9EV63mzjlOhM3Br8nYr5ugVaxfx0WLs/zGs2Oi8KAYa5cNt0ZtPG6QPgF8UDy5zbnadbPqMuDwrrwIJ8jzof+LX/5C1oLYmO26TQNIeqT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754740294; c=relaxed/simple;
	bh=uJhqt4WZm6zbKgUtI3s+WwMuCbXej23iFVq2PvOrM1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAeRS/EsH2PHxqxKtqnn2up+wmvM4N1zq8aEoAzOA3ZRSCSti0Tdkemo5Ca3o+KS02nwC8Ys1tg50yL0Q2mOUfqMCrx/nPb+EJ9xI/TZbYVgCiTLOa5YFcUL69/eEQhoTO1R+W3tJeah6pq/vFpPUhongA2zcVMdsYNisaP8YPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lWyP8IBi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b8de193b60so1729744f8f.0
        for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754740290; x=1755345090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYbjCB4xV+1M1pw33WasqXN1dpWvlUReQjDjyIDAOO4=;
        b=lWyP8IBiHmaOtA9wzXdEm8Wy6jrTySBKcv2NsojSibdr51UZd7ECwlcMSvYPRlhA+D
         S9/6fazsn5PxeCnRQZ+Bi/9dy4wdrqVkinPNFI/9tqY7m+nD6g1nW169doD2dJbhsQes
         k+dBHrdRrcvaIlN0brRvy2x03HzWd9wY1BO0iopAd7oN/fnbTUCmFv4sz8AwAkPDmRiD
         p1bUj4g/Mt7CKUHO1Pd5iw/TnEf3s2W8F/w2Qo6rWsv/zsjPJJ7SUf7uJYfOYUjdAkap
         Nt/Z1rN2N3zPW6710UAQ1LuVdOR1SNyvYP3AeXFey4wKmuOZ3AaT0cHCUBjDZyf5sk2u
         H1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754740290; x=1755345090;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYbjCB4xV+1M1pw33WasqXN1dpWvlUReQjDjyIDAOO4=;
        b=ifNhMnvKa9dGhUPPJe5k0ocW+4y6HJdxcGYPm3G4cX0MmEZ2VJoZz95Ncrt33dXw2E
         /jnTGRMpUhTVHWTwuT9lJLVsFa2tlGuOqe8wbd31LFgqAP0+UEiaEc3O2ve+SkIBevxD
         PB5eMCl/ExthMTxK4zPaU37JExleSH5BszbRg95pNvoiWmHvh6OzWzLlo82QoWn5+dZW
         BHjLI1StLWuCcEuEWg6ye+JaEDGlZC7JlhfuJtQDxWvYmXZyhRJZezAIR6PbxHU8RpPn
         twCi1hp6meiK3jr3L2qzxN2RLW+MHI0Vn7aGdpX/mNfrxlJGH4OPdNQCh/+Ml/XQrdn4
         V13w==
X-Forwarded-Encrypted: i=1; AJvYcCWPvY8ZvhlHXa9W8uebFZiUOadWdlwMi9vOKFPOuqXLI0fc/FsajkyO2qqghQamAySpGAIcyJr8PL+fUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBtDyGO3B9aeex+zVUhXSRux8jC9r3zGnUiUzpaPA7e7VruUke
	LMG6mWXbsvQpOWIYoOchVPlkuwVA/mQg0q3wzCi1Zkuy9S0K96cjUQRVyk7+XzQQ38I=
X-Gm-Gg: ASbGncsVR0oCmjWi6z/HIi9/PLSuRe8u/ZFiVIIY1pkNQZ3lp6byQituQG5H8kql7xf
	g4B29SMc6rG+9CfVOG1WwmiJwVIlbGJrs7Xmk6DWM/tZaMQ8vb8XrzKnkE/7k/olrJO0kQm2ZGh
	F+CMTt1grj1eau49ho1l7uxTg3CBzlbG3wLeh918NikBT1t6WQcjuPGDzkZhgSbYZa5mRkkchxU
	vh8xQTqZ9CgKfAsQn0drwXzVAePsTIsfgryWOFqCoIg3mx8fnSIUHL+seRiYIqRefft0I95N86N
	92ZNjh3WK1RzY3RALh+wQdln3aZLAmMayjgAWmytWoOLZZxAOHCYxFvyt+muEsusWe16gRz5qMB
	AC0DW0Zy8XjVvwS5yOg5DTbHJpoGXcf0OnHfeQ1eUXQLWFjlc8I2xp8YL2ggRcFBJ
X-Google-Smtp-Source: AGHT+IE0Rtj5L91NaP0jrX0E/ptkxI8Ma3OVqNKK+/Itrgx5VDSb2ifujnM8t600+LIWY6n/PhpZxg==
X-Received: by 2002:a5d:64c7:0:b0:3a8:38b4:1d55 with SMTP id ffacd0b85a97d-3b900b4b71cmr5229667f8f.28.1754740290375;
        Sat, 09 Aug 2025 04:51:30 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bb04c612sm295058305e9.0.2025.08.09.04.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 04:51:29 -0700 (PDT)
Message-ID: <ef236f1f-0b54-4b46-b509-2a4a181100a4@linaro.org>
Date: Sat, 9 Aug 2025 12:51:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
 <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
 <63ce3c8b-51a3-45a7-a40e-330839d7dbf3@linaro.org>
 <upuv35iaf27dbpr7dwxmmw7qd3ykszh62bbwxltwfexpwzgfvm@qpxeeoiv4zsg>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <upuv35iaf27dbpr7dwxmmw7qd3ykszh62bbwxltwfexpwzgfvm@qpxeeoiv4zsg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2025 10:26, Dmitry Baryshkov wrote:
>> Hmm so that would require splitting the CSIPHY between two CSI decoders
>> which I'm not sure would work on our hardware, perhaps yes, perhaps no, or
>> routing both sensors into the one CSI decoder and then separating the
>> data-streams either in the driver or in user-space.
> The RB5 board provides exactly this setup on the CSI0. It can be
> switched between 4 lanes going to CSI0A and 2 (data) lanes going to
> the CSI0A and 1 (data) lane going to the CSI0B connector.

Yes I see that.

I see the CSID can select which lanes it maps. So you could have one 
CSID map lanes 1-2 and another CSID map lane 4.

Still I don't see how you could have two sensors at different data-rates 
in this setup since what type of frame would the PHY present on the 
internal bus..

It doesn't really matter if its a standards compliant setup if the 
hardware supports it either.

Still though there's no reason to have a custom PHY driver continue to 
live in CAMSS.

---
bod

