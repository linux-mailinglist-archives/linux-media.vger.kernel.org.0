Return-Path: <linux-media+bounces-30924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47992A9A7B4
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 11:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C2F175E5A
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18385213240;
	Thu, 24 Apr 2025 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ORt1/2mw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A10215160
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486957; cv=none; b=EtfJUoe6C7gJlHBgyrUc0hCmZzUT6k0hLhyKPUrQV9FX1N8JtIETGKy5dP6CSwnafB1d35duPBeqO7xYUzQVmXPtJNDu1PJigKRWlaLEh8lllvDBaMBVacXk8oqsyTfsIvD8lPLBib0JBbLAdXOZBMyLAf2lldO9PowEEq8s+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486957; c=relaxed/simple;
	bh=PF/UWW2uUVyw8xGcq2UEHLKYu1KZRgIItHi9K2i2g5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWSaZk4hRy5FP3m0I3uD/0jRX9mwdT3sO4mVsM6Py7762CWqX/3bf3I8oQAywqxQveVWgn7Arzx4wjBzu+bgJrm+52N8f7V13tqU4s1iPx5JbVNgrom1nT1PVNU6+Kak8Y66erAo4yibo3BZCGzwuFiW10dicmlBm+FhQe0mz6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ORt1/2mw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c30d9085aso563773f8f.1
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745486954; x=1746091754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lzkfj9tORf1TBk28L71qgbOav9EcH+Cz1FAU0RuQVXY=;
        b=ORt1/2mw7DkOCsD/N0LyXwFixB98r6UMEJT9yl7KFmbOrdNcvsuemUbeFKr/xS77ub
         BCatYcX+e85CaAOyDjG+UOQ33aoJZIcz9IUYetx3UNag8sU1qfToAr2pbrXKXFQq3rdR
         7GvBWPTe60f92ASWq/9dsoz6MpfmGD1NNgn4Kg7zEJb/Ai4UOx6jm12Jozf8sgVmIona
         zSyuhhSxoMSLKooRsue1Manng42pTSQDk1K4tXqHJVGW7u6QUkXAXRfHPMPjfh7yp/D0
         B5ZfXKYcbpJgXD1ksLGCYnlRG3jvmb4j2d4+W+hZMnU3J22lSmIcoUz2LrqEQD880EML
         9x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486954; x=1746091754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzkfj9tORf1TBk28L71qgbOav9EcH+Cz1FAU0RuQVXY=;
        b=qqo/zPU8AOQAfi5WWgWqtEoIWnitxiHDAjwKbpDmowKUmA4sE5rPM7pldVkoM6Id1O
         Ar9MdrhwpQzvZoQRRPoQq+A6/e1vIxN/5R8vNMlxXOjCSnoTmliD2ZBGhvJKmPwvZDnt
         dd1d9LLhB4dHrbR59ATyuPTVPm4eC48UDD1JYoOENWPxL+dHDjI1KRLoSX7dhYFktVww
         QLE5VlUvs0lC8of3TAfImmVo6vpFApKBVYL63QaNLsURGbbuP/H3Fpdb4gzgtWJ9huOE
         2LJzJq8DFbNDd42Z2x/PHkeSsGOlVkiHqbRdYACRrTgmCTKDb2a0Ny7KURUMHGKjj6h+
         v5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVUiZwxtzwSA6nfiHcUg7HaqbNWORd71EzmLAL4twV9pZUaYjs7274OeJk8YlkEIkW+gf+UTabdC/V5Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88prqeec4ef/uudvBhiQ/YovgyPDgMCH4yQND+VoMWR7WNFTj
	40j4dx/cFCGBOoIpiBWaNphE7xscJljloTXfCdz6EAv/Srq61X/nozxuNwaOAr4=
X-Gm-Gg: ASbGncuiUvZLXH77g4gTSCMbvl91pjrDaz52uZjff8Hvzw3K4cnqecOuJ4PEw1TqvfR
	qDDz9WZr7zWJgGZh2K7xqRVH3KS+HLqP8ZMkFwYW22IsMuOXHMf3yxWBPTTQFPeMdHObXYiKHSl
	Vz/o4/W7Ok4Rsdfl/A9XsR0aABdNB8c05+CRaKNVtdE8zJKsy4UijQmYRSAeaOZ8EtyRSxFL+ka
	3LfbdQhZ1l1rEEu1JAJkSVB3ymU4rTEf2jg8CwqVLDVgNUPAHkVMeJLz1NW31sCQgMogHu3xy+x
	YsCq5GLuZ/c2t3en9WNryjNEY0fm+wA8r1ps2Py7AJ0VB80+jfRDD9sAfgrIpabB22VXHB8bPra
	g+2vVfA==
X-Google-Smtp-Source: AGHT+IGhnkr3KW4RftvKxdsGWQRW/KLMOcTha5l/1iWouBwfDEZ1GK5p/94QmqMjz30g2n2A6o4e1Q==
X-Received: by 2002:a5d:6da9:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a06cfab8bfmr1459262f8f.52.1745486953974;
        Thu, 24 Apr 2025 02:29:13 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d06e172sm1489274f8f.0.2025.04.24.02.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:29:13 -0700 (PDT)
Message-ID: <2ab8e807-6fe0-4f59-8bcb-0870124021df@linaro.org>
Date: Thu, 24 Apr 2025 10:29:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>
 <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
 <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
 <hjaep4muhpl2t5hfajnmvaueq2m24rwbjkfggvhk7otl6naeoi@hqs5ejhp4sef>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <hjaep4muhpl2t5hfajnmvaueq2m24rwbjkfggvhk7otl6naeoi@hqs5ejhp4sef>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 10:22, Dmitry Baryshkov wrote:
>> Pins are called:
>> - VDD_A_CSI_0_1P2 (for csiphy 0)
>> - VDD_A_CSI_1_1P2 (for csiphy 1)
>> (both of the above are supplied together without individual control)
> Is this a requirement of the SoC or just a typical implementation?

Its usual for each PHY to have its own external power rail/rails.

In this case the PLL power rail is shared but, that is not guaranteed as 
a feature of these PHYs.

1p2 - digital logic is individual on this SoC.

---
bod

