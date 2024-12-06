Return-Path: <linux-media+bounces-22797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A812C9E6B48
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 11:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69005283EFB
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 10:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278531F6691;
	Fri,  6 Dec 2024 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ovbQ6e1x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089821DFDAE
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733479590; cv=none; b=Wq8DwOfAD5NZfyiw7HFovAefDgobcVGilqGRqL7ynS3EK1/N+497D+czdKUv373lVEGTaSFnHEvpwIfNc4v4/1N9SEYtsshb29dRVVL/RfwbsguccOig9LBsbPjnTgTlK4IS/Uc41Y9uhc4M5NN9dln/ZqG/kqSP7pBETcVaPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733479590; c=relaxed/simple;
	bh=gr0wVuYzqbScFxXpZ52+ApK6ae+ON1Z8MAshwsB0Z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaEYm01x3Jz8wqk48/RA0K8amt8z7p7Czwzp3ITYkiXcCgNG0tst0ggJSLAnnrUwvDwcXvL4ACaWZ0nKx4sWutFEMib0IWk1n4qXrRktg1l6GDOPRYitLy8S5h9W9HkTu+VX2ngzRgCVFPp/zi3WRbBcIvpTJUXe8kGluFHW6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ovbQ6e1x; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3003943288bso1638211fa.0
        for <linux-media@vger.kernel.org>; Fri, 06 Dec 2024 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733479587; x=1734084387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kq5iLCatZqMNd1JIiH/Yx41KIxb4a7s0lro7kXyn4Y=;
        b=ovbQ6e1xHMUfZ/yLCzDdtPXrQFQLPHEgon+O1P3uGNkton6ekWi/ee/ALbUahAqzKv
         kJrtaZ9u8yd3BcqbPBsPdggm/U1aMkLm3Yzkg4By4vtMwN8T4KP7g0nteEDUMks/WJZN
         HmEtXsOQEQKLHdD2VQj9ah6IHx1Y+Pta1mdvzNhOjWaOSBJzhQdMriIHUHhsPWQaSl0L
         AjxLzKWy1YXiEo8wJMPAOtvjfLY0mxmmyJVMJ8grsGyykFFb0aVa8ZYDOl0vbaOynMPr
         23rW/bDHm0LT0blbR0DS4+J9+NYmqC+e461AO8PC32JuWvYg/4n93fZck/hXTgmtG7td
         cKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479587; x=1734084387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kq5iLCatZqMNd1JIiH/Yx41KIxb4a7s0lro7kXyn4Y=;
        b=iA+qhp/Lt2vcLZ/OEN2ZnsOzMPOi2NgMeo4gx/+c2H34xDH5KjZ9oShYVewcMZVb62
         IOnmIw1xbNetzeeQE9Z726Wlpp1eaiOPbfYWxxO0ptfdgmbKlZHc1EYbdpIzO0Zl0mFH
         /mIjlKLtB5bYY0JMg14G3zKHqH2ELyJJ0eoxdkIO2nzpRCuLAPf/c+JmRgfrziHB+2k8
         2wNTt84j1K+c2DWB8XNoPhg7oiaXUBUzkrVu3kczjfXBZ0QhbztsSbHM7VwfQtFXzDk9
         bbebBFM7b3TjXF0+lzarAsxWdnTiU+jqQZnGNFIiU9vybZBNTV64LEEyRjgsxLhX+ziO
         EXeA==
X-Forwarded-Encrypted: i=1; AJvYcCU0ERY5EUjilHpKFIh9Gc63B4jiKsHOztlpu6iZqAgbdgIW9ovZo7MzaqqsoCccRBOyWnR6FhEK8ZWm8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKLTbgV0Z8cgiqwZWcCZfCvfqna1LZtd5/6iRlyaf/ODljRMfi
	DAADyJjuPtD+MRZ9EwiVZdbfq3vDNJIuWCUHf9v0aB6NyUj1Hl3JMtaf9Mje2PM=
X-Gm-Gg: ASbGncv/aKJooMH1Bittkj1Fx6I5dJB76t+cUNvOkFziNds34XTXA6HevQMXtBQo4Ku
	zGn8Gv64etTLoeFa2UihTNxoZukSGtzvE9bt/3bCIskDQatwyXWU2nycABhLZbvirX+oCC2W/Ia
	gDZUeTrlEPXmrulymeSOJFZHO9Nd6DGxDq+WU7tSeTv+ZOcGk4DhWhR521q+KXDI9EmWO1ia7pD
	K9n+hMqbFUD+UmsNSZWjeJFiEmcT2zwV7i26dNS33aL7pX5k/wAZnCxqV17VcY=
X-Google-Smtp-Source: AGHT+IGGeMStTSdxcTd5bpMThyqNxEJJDfbzMe1IIVhlqf6bA9rVonkja56z4SWniuJeI0/SbZItnQ==
X-Received: by 2002:a2e:be11:0:b0:300:17a3:7af3 with SMTP id 38308e7fff4ca-3002f9140d2mr10549571fa.17.1733479587170;
        Fri, 06 Dec 2024 02:06:27 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a48ab4sm1949019a12.27.2024.12.06.02.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 02:06:26 -0800 (PST)
Message-ID: <e5f89ace-3a22-41a7-aafe-1365f2fd9bcd@linaro.org>
Date: Fri, 6 Dec 2024 10:06:24 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-12-quic_depengs@quicinc.com>
 <0909a2b2-089d-41f3-82e6-f0e05682ce27@linaro.org>
 <2515c9d8-0e9d-4e1e-b8ff-764b53ea3edb@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2515c9d8-0e9d-4e1e-b8ff-764b53ea3edb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/12/2024 02:18, Depeng Shao wrote:
> 
> Since the camss driver just support ife, so I think only ife related 
> iommus are needed, just like we don't add ipe,bps,jpeg related clk and 
> register in the dt-binding.
> 
>      msm_cam_smmu_ife {
> 
>          compatible = "qcom,msm-cam-smmu-cb";
> 
>          iommus = <&apps_smmu 0x800 0x20>;
>          ......
>      };

Upstream camss entries provide a long list of iommu entries, please 
provide as complete a table as you can here.

---
bod

