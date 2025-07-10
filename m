Return-Path: <linux-media+bounces-37273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41711AFFDA8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A98C5A5ABE
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F77D22330F;
	Thu, 10 Jul 2025 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KF7aiPDf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D9214210
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138927; cv=none; b=Kxiv4o2W6X2iKkUsdk4KktPLu6WGB7FETe7fm2h3Su0wQl6dRVScWZxKD+5Vg/NOqHn8xEce4nLHuH75A3iISadaqKDgt95lUWsmqcj3o6MTyav5SMWILPD6m/DdYOy36CEGz9P5k5FlyaXQP85Vnd+/jOkCjivAjnt86cZ+Hgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138927; c=relaxed/simple;
	bh=iiLjM+aUgsYzHC/WPwWLV5opBtyLVc4FDeCI5k5C/gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlVyma8fxiKgl8Qg1IpEg1SaUYl/sYKXRWlZeJiF/I/tNcuh2yXxbPXomcFVp7eyP+EYGSYfBdfLN2NKs28ogLxbl7GBrTYSKD2b/6E0Zf1AgFnKPFGOWH9Z5q4425KLLdE3lYbqQwMgjVV09N93fN9m7RS04HSNfWlpD0eBZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KF7aiPDf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45363645a8eso5093915e9.1
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752138924; x=1752743724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6q/9SW9W8dxQjuQZq+qCAODMrqQtpqZyWtMbjNSA18=;
        b=KF7aiPDfpqpR3fe7cobvW5bhi7ALwgm5qkdHnV6P3P36cmPxo2zhBN/82RsXy+UtTB
         TmgGry5fYF00eygna8l/Hs+UrJt/zb+jcr/CTc3w4eTZgvnpM1oei+Kf2MuJGQN2Sr+D
         xpash2zB+Ddv4OfQd01+M6n0Ioah/mklYNc54VE/UXcvL3wN8EwC2UblHFzQC/AqUM9g
         nfQ19T4ORPx52x4ndx4jYzFa7mOPxh+O8dJ+GTdRVDRW+cBlGu/tnjOjJPgFRHcYyMhB
         p03VgBIy+fruZGWBZnoxeZNGsUvuc+FAQi4h5NFvQTW/yRQvJAkFPAK/jBWcx/iBiYTd
         oYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752138924; x=1752743724;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6q/9SW9W8dxQjuQZq+qCAODMrqQtpqZyWtMbjNSA18=;
        b=k6iBeBegoLTN89RPol9rpL0XEjlOGpARDwY3Kni2nRqoqYrQz/VbXcMh6YNDxVVjYt
         X7AuWISRCdb8ygwe/11sA+6gq4fyHut5lixEB9UDzgd5Q5IYwATEkIIWxA6+GNhoA3od
         7MwJgVuUJ8jFhdpF39WxM0mXwc0ufAMKJhUs3KHlBxetOddkZjD8ao9YqbEvFNBQ9p+6
         qK8kJQ/7dwDognC6UI0YsfJ97EdvjE82yvm13Tu5bFYFy5oA1DrLqpAGX/p4Mb9azzXx
         4nxu8zpFLqRGNTigjne/UJxz9hLk1ohbUYYnm7mkCAGEtcMvAC2Ur6Q9M7lLngTqHqZr
         ek9g==
X-Gm-Message-State: AOJu0YwH0zQuhMpxWq+LQtoJlva8T6zh/8uUFz6EPu8MfVg52gowZt5c
	thou1R1s1RUDcI/xh80nirZVMl2F+0JPyEc6dl0y9FvEC8TCZUqfoiROUR1gZUpbL58=
X-Gm-Gg: ASbGncs0Z1iahFQAAvHA1JTcG0rHXlPloEcXlIek+t22bUM0+oP/BqCSKb+nwt/Wo3s
	5xGIMJQbgAZ6nVGwZPdI6SC1jnnRrAOI81I75AQ8rJESPoabxshn3ukHI4n20HyBkEnjqdt7EES
	3vNJleZeS/j9qFUoqnwFN7vEJuCtYPru1IebZRn2KpYG5QoEvvu0qp7MywT8JhLxiF2ZXNBmbdZ
	hT+YkZAuW0nbuz7GaRdDVr6wyviXQPZrZpLCmjYJsL67ylyGuQXCJ+/PhIOQJc4TmEb2mMZfmgX
	++g5luVRSf9wprksNIzcTeBO07u4NHv0SLZQ1e0SQINISuiSKWlT0S8pb5fDXvQSkPTC0F6EX+s
	l4My7trY8aOQE2JWge92oHdCggMc=
X-Google-Smtp-Source: AGHT+IFiUkvfNJiRLRUs8fa6XAAhAZRAnt+u186odn28Di4bfezkL7HU3hExac8w06CkJd8HzwOdhA==
X-Received: by 2002:a05:600c:8717:b0:442:dc6f:7a21 with SMTP id 5b1f17b1804b1-454db7e87c2mr31122345e9.3.1752138924220;
        Thu, 10 Jul 2025 02:15:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd4b32d8sm13751625e9.17.2025.07.10.02.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 02:15:23 -0700 (PDT)
Message-ID: <c3803de2-56f3-4346-9490-67cd63abb287@linaro.org>
Date: Thu, 10 Jul 2025 10:15:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] arm64: dts: qcom: qcm2290: Add Venus video node
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
 mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
 <20250708180530.1384330-7-jorge.ramirez@oss.qualcomm.com>
 <8f30092c-0e17-6f4d-f3f1-769508d2f58e@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8f30092c-0e17-6f4d-f3f1-769508d2f58e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/07/2025 09:57, Dikshita Agarwal wrote:
>> +			iommus = <&apps_smmu 0x860 0x0>,
>> +				 <&apps_smmu 0x880 0x0>,
>> +				 <&apps_smmu 0x861 0x04>,
>> +				 <&apps_smmu 0x863 0x0>,
>> +				 <&apps_smmu 0x804 0xe0>;
> What’s the rationale behind having five entries here?
> could you share the use-cases that justify this configuration?

Already getting in trouble with non-pixel/secure # of iommus.

Why not specify the maximum expected number hardware supports, 
specifically so we don't end up buried under incomplete schema again ?

---
bod

