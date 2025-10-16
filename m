Return-Path: <linux-media+bounces-44739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197CBE3B77
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 15:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C0FA135932A
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C62339B3B;
	Thu, 16 Oct 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lznjt33l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BCA198A11
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760621519; cv=none; b=p80J87LqdFeXAW7MeraNpdwR71g7n5tED7l7hdAcLdtKUvRGYt/drBH2E5TpO0h3m6PDcwlbd+nneRZvUxQcn0KOAT7or4trre7usIDQ7sv9iZBYRNV03saLPXezpYrOuvFGpHRzEn0AU7MPvWVtml7WRQq8wE8tt9ahpdLTTR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760621519; c=relaxed/simple;
	bh=RFh/gqvFYe3mrthIbrCFXM9FsiCYqUCmiQDRUcSGYj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAOpRJkl5+xCAuVrO3FvoMFFnwq7MKzyMMrSRUcPuP3Cs2jP+oqIMlLr4jLGgV/vVrpyZrxuCi+1ettXpcFna2BI+71Pyw9+sFqEkBWVoiV87OLFXUkrhVAu+ACCEKsne9f0EZFd80GiYBJuo0UUKUqu2eSYJp3qSW6Fic2jZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lznjt33l; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-58af7f8b8b3so87445e87.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760621516; x=1761226316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVVxXst564TPeNRQIV0Zrdb17qt+RXom9Ra+osC/9Kg=;
        b=Lznjt33lDzi8vg9xW3aQmvZ5FOGRz0ZA0fkxtRfF6xXDtriiqL6widdjmiFIH85+lz
         +2VSOO2vt50e2hhDmYGvaJmqElcspSdumVCf9uN/kUgK3tqXDxTnR4Hf1CUyXq9ucngB
         RXhu4oDSaZE2CQ0Ynxk5KdcNX32LI5CWRCr/iXD07xi55j9/ntVZuy0OSYTJwnSq8FV7
         KwsEOTcWmyMVv216hXzxKhamoR8210lKSnECqmDCNGNB0mWhvVG3n7ICrxOyGu1h0ryC
         Y8tP1ckgthMv0ZIzSiz7XCgDTj+rsVMjg0HnNdbgJ0dPROIpFKXA1r7uitDJt2hIXDmc
         Wlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760621516; x=1761226316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVVxXst564TPeNRQIV0Zrdb17qt+RXom9Ra+osC/9Kg=;
        b=YYzbxqGYfRNRA8COrID25LkEHq1cwDdUw1SsT1T/3WH/vmzKZO1ZQlzJvDQg2gsRM6
         KzP4W1FZo5GDDxEn8HPmumGjdu7mYdunofQWLDpLzt3Ghp5dF1EiWeWCI1MB9lN5JrBp
         +ElBoL3ElKLTjgGlCYIi616otLMTZn9zFPYb8nimKZEp8m/mypqVUWpg1GYDT1F9MqAo
         AE02a+FeZtqnF4zwbUnF6Wzo4qHX8lPvYO+WgvK7kFAR919ODLKZP9Td0yxCyS8gKXc6
         KzJGyp1Ob1yktKN+HYAFbVqqpsiAG+d4ryqHS525v7ZN2gUgdjoCQjvkIPbrcfkPQtjv
         p5Yw==
X-Gm-Message-State: AOJu0YwtNGXsUnoGFS+w4tlFJU1sb3zbXxSGLqULbBkyvPp2Pkc1ZYte
	BG/+qwUocT6hgWJyxojGC/lIuqgFIg+cK8rCkEFfrfmZpi/7yOv9C6KJQ8BYFDjHtyg=
X-Gm-Gg: ASbGncvKSye6jRg4JgOdfzegohClFR9+d2nkb2Xg306N+ySMmp1yRjBWNHMKl3PCFkF
	osGUYFWH/5Lk3cdHwCwV9+5ugGpyw9wMzi61gtZi+hnxhxHVPczPmZU25IoasK7eVXicHahxIDk
	4EfSeI1O27AE8MRKRTktkHnRZHvxZCgjFG+PyZZ43NWHVJ4PjOPkZ7ZEOP/dFjgRMLEJhtnoWdT
	81uy6qUlf7W+puzq54CwBmPShZYR5CH6ShPNn3QbarTfaxeD0aYtPh8SUY2FNcDhKUu/ZSO5tUa
	KZTO8DLfARyO89rW0VTe/ZHboQHPgBm/SnT3HsyGut6JA/vnP+QnDUiPO+5Lnph6lBkIXSYAFEN
	zeHMpC7LlSLl2gyEJaIMqKR9cae3AbFI7bXbS1FQ+mVPPWQj8X6mbKh/KDngKYoSt9lPvOEQI46
	cBdTcBeunwHyMEkxEDlrwEltdM0OGu4o5q9TAbbFq2iBYA5ra8Kn/hT6ZVVu4R/NZB/Q0v6g==
X-Google-Smtp-Source: AGHT+IE1afceVs8PBuaZj9exPtYlK0QfXyVjdYDJJxq6s9C8bQx673U2F0e4V3yJkwmn8me+a4KtbA==
X-Received: by 2002:a05:6512:2393:b0:55f:5965:e4e5 with SMTP id 2adb3069b0e04-591d85703bemr10189e87.6.1760621515969;
        Thu, 16 Oct 2025 06:31:55 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f91c0sm7100030e87.41.2025.10.16.06.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:31:55 -0700 (PDT)
Message-ID: <fb491c3a-6786-4daa-b3ee-53756b3d9b44@linaro.org>
Date: Thu, 16 Oct 2025 16:31:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: Add qcom,sm6150-camss
Content-Language: ru-RU
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-1-e7f64ac32370@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251016-sm6150-camss-v1-1-e7f64ac32370@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 13:22, Wenmeng Liu wrote:
> Add bindings for qcom,sm6150-camss in order to support the camera
> subsystem found in Qualcomm Talos EVK board.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Looks good, please add my RB to the next version.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

