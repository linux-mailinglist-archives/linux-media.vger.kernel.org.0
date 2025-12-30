Return-Path: <linux-media+bounces-49692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C16FCE93CD
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EFF13015599
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BD229D277;
	Tue, 30 Dec 2025 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sE7kF5ta"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352325D53B
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087621; cv=none; b=JBs2k9SA2WiMq1CwlzrYCMen7QCz9UorEYEFocW7jG08s93820qEQjv8kMTdUhrQ/7R09ZHyId6XA5xPpxPNPS53c1L0YQfwHU3tenMj459wqcPU2c5JQ1ePe/+19oy3rPkIo706QKKn4Uc08MZqHZ/Y7dqNkMZIdNlFWzBp2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087621; c=relaxed/simple;
	bh=SnDVtQVl8WBWF3R0OmivmMiBUsApQ5x6MGy42kKYg4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BRT0rLSR+HtUudMNWeafUMzUOtHTK7pQ7e32NbuGExu4OHuqXa/KuerMpf5r9bJQsz8xCJXC5or6rvOvMaBT+Lbwxxo03Jxhu50tKh+KQpk7egQNPYTGA45l+/nsk99N1TlM+B2qgrAITlrrRuQ86h2hYEDImyU9WY0Y8VCdCuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sE7kF5ta; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64daeb28c56so7898914a12.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 01:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767087618; x=1767692418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zN/ur9M0KwImi0DBm0/fgIedoRti4CPacoiNg7hhK38=;
        b=sE7kF5tarGehhNxx80TO1z8euVHK2gI1h0xjtbmWrksONGMpk7xA4Cet5uUZ/djeFZ
         5l9TFjWoSGdBhifevZuaocTtIQQKfy+vX3SkQZI67pHmoLpIiOKXtJrc1n4jh80vdJ2s
         MLWYlfVA3dONqcU7wB0YVnIDzcmWL+DYB5jeBH3NpJ3/hJllT2uXSKdFS2mDbh/G+FZX
         uzOgRrlQRp/+48YKmTH6ocd2ndDjsOktYnH0XfiOjYJypUCC0hspZ8ThXTMGMFaH4TRG
         b16bVDTJfR5jbD9oKcKlVWFX/gkr33jT4AT90jmJhdAlJ3Ug7YnpVBwN4wi+nTeexA8P
         C4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767087618; x=1767692418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zN/ur9M0KwImi0DBm0/fgIedoRti4CPacoiNg7hhK38=;
        b=wQUUFZxNRQdL7SLhJd9SZC/ROTvf+5nxxV/VbGIz7Jc9ENGzBJBVb0LP/vgfad0pyX
         +qPuezbw2o3nPaJHd0xRORAeSYwCj2uvOu430t7J6W22OHZToCPNiJCmIaPK7LeWyl3y
         IwoJ2ZTEzqVwYdASe8OLb0zpi1SuuDwXSebcX1KSDakwtFAbp41kZXl7hNRfXqHN7BLw
         Tyv8GAbdDaBhuRV+ZIH18T75PwVBpCNOMOQwHV6Wz77db4iKXrkX/p2xfD/BLcjlLVVs
         cFqB1p9YtKtK3lPecMmpSYoZJmkPJl2EimKvVavkqi9+qTnvMhNFhy7GVVBcmmDYB2p0
         RClA==
X-Forwarded-Encrypted: i=1; AJvYcCVKTcHmQaaBoid+1DRMkyXNZh8J7xuMqvt/eEeVbTEBx2ZJ+o6su1t+YkdglgrG+tYdHI+yDTJW/wFZcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVDWv2mqUW8/5xU+1X8jac/NNOrZ1eiA2JB7PkCffWw8RJIy2d
	zNAWewHJZuWJIDe3wrr/4icNUJgw4QBlHz3OAaxyuUc6ZQ2+Ov8LPKaS2NbZRtN5Elc=
X-Gm-Gg: AY/fxX7awI7lpDqoLfJwOj4MU30porLS4gthdsJih1rb3Bp/o0qwyz66BJvff8JZN2G
	fdDfoolL6rVEwEt9Nt12wapRCXoF5fUkjxIleMDGnM9yee5x1em2IAHEq6ClHNif9TYo8IxhZSn
	JjkmHzLJ2Manq+HGzciMt0u29mj8rdIbIOcowAjytr06S8fvEKQLkA3tY4k484NCbTFvtzrdnGC
	8KzW4BosmDEdfQ/jifv895dxKMdy1LrX2bITNaifrXFVzwiONfXVS2oUUD4d84kY+FM/44wD7sH
	w6bN/VmotsfVggNnQmhCHHoh05vWTE+C/0zt7LAREioYSKZcEx+yVInRy2S7IcaS/XIxYgC9ca/
	M0l6LBLWnWZKhqw6SaEYiEQAAKHrHkJSYRmGFk6pq8wVqQZ530+RXQXEnrgVvmD1yn3YQnHpzNe
	7bhxuyyVQOl5FgagmtFxMuojuQNJGNKkuonZcxfBnkQZpU5ggbb5vGHWIz3zobuU9XvKA9WbXjv
	yXCXqQYj1cdGHN00XoAG1iYRlIwiZeRAmz149gnwOqsAMTvpsktZLSCDHFgKRFoPxiW/s2wsjnM
	TQ==
X-Google-Smtp-Source: AGHT+IE8Q46S3n9z98hBCK7b3FNRHPYazHdbcsKH8q0ouiyW6bKhI/VDEMVG/7P+rDWf5zjXZV3M/g==
X-Received: by 2002:a17:907:962a:b0:b83:2af7:372a with SMTP id a640c23a62f3a-b832af73869mr1449856066b.41.1767087617722;
        Tue, 30 Dec 2025 01:40:17 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b910601c7sm34033399a12.14.2025.12.30.01.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 01:40:17 -0800 (PST)
Message-ID: <7b1b0259-90d4-4e7c-8bc5-01e22c371e24@linaro.org>
Date: Tue, 30 Dec 2025 09:40:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Richard Acayan <mailingradian@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251230022759.9449-1-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/12/2025 02:27, Richard Acayan wrote:
> This series adds support for empty endpoint nodes. It is currently RFC
> because it continues an ongoing discussion on how to selectively connect
> some CAMSS ports to cameras and leave others disconnected.
> 
> The SDM670 patches are for a full example. If agreed on, this should
> expand to SoCs that have CAMSS.
> 
> Example SoC dtsi:
> 
> 	camss: isp@00000000 {
> 		...
> 
> 		status = "disabled";
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 
> 				camss_endpoint0: endpoint {
> 				};
> 			};
> 
> 			port@1 {
> 				reg = <1>;
> 
> 				camss_endpoint1: endpoint {
> 				};
> 			};
> 
> 			port@2 {
> 				reg = <2>;
> 
> 				camss_endpoint2: endpoint {
> 				};
> 			};
> 		};
> 	};
> 
> Example device dts:
> 
> 	&camss {
> 		status = "okay";
> 	};
> 
> 	&camss_endpoint1 {
> 		clock-lanes = <7>;
> 		data-lanes = <0 1 2 3>;
> 		remote-endpoint = <&cam_front_endpoint>;
> 	};
> 
> 	&cci_i2c1 {
> 		camera@1a {
> 			...
> 
> 			port {
> 				cam_front_endpoint: endpoint {
> 					data-lanes = <1 2 3 4>;
> 					link-frequencies = /bits/ 64 <360000000>;
> 					remote-endpoint = <&camss_endpoint1>;
> 				};
> 			};
> 		};
> 	};
> 
> Richard Acayan (3):
>    dt-bindings: media: camss: sdm670: Make endpoint properties optional
>    media: qcom: camss: allow endpoints with no remote
>    arm64: dts: qcom: sdm670: remove status properties of camss endpoints
> 
>   .../devicetree/bindings/media/qcom,sdm670-camss.yaml | 12 ------------
>   arch/arm64/boot/dts/qcom/sdm670.dtsi                 |  3 ---
>   drivers/media/platform/qcom/camss/camss.c            |  5 ++---
>   3 files changed, 2 insertions(+), 18 deletions(-)
> 

I don't think I am 100% understanding what the intent of this series is, 
i.e. at a high level the problem you're aiming to solve.

Can you elaborate a bit ?

---
bod

