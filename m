Return-Path: <linux-media+bounces-33358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E11AC3B4A
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 10:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF91168AB5
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 08:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8DF1E32D7;
	Mon, 26 May 2025 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sd/xVPxS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F971EB5C2
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247185; cv=none; b=IrfHLPfpgIINhOUrSjfBOFKFO0V4R3UORq6xIfipWoQJs1AwaAK6ftQNwP6sQGdGd+z33yzkTeJ0cojxVojSN8K5Oq5GVfO5vmLm9bXlSFcSrazBfDKEZUwykxaooquLFE5HuiV6SlZ2jsifaHa8PfM7I6JpK5tDTjJcwDnOTz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247185; c=relaxed/simple;
	bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPQdPSXJFpTGf0dq03h0hOil4T+JFnNqnSAZ+Xyx5NCW7FNXtwNBjjzlstygeCS28Sj48+CAv5Et1I9G15TIM4daBZv1koti9a8ahGOkDnXo74LZIDErdtYuINr+Aw7b8DKoVGmnwebJzNVSqBO0qQWPSleZfe0ZqdtV1tC7pOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sd/xVPxS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4dba2c767so261906f8f.1
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748247182; x=1748851982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
        b=sd/xVPxSFGLvyz7LKqDzLZhGNXqoFKu7+ucNEgIKbRH+1hyeArcNCT1OW9VoVAOgBs
         N/xwIHI8Ch9pwVEFXW7ipYS2B6ri0EWCAw4eUNQCZGZQz809wf5ucyl3k0yJPnJ60uFo
         t04t3MssAPXRXu35rdMAM0bEhCNAFcR6UEKyugHhiw1Moj/5ERABN5JpgQ5P/kBoqVje
         kVfyYvo9hg+JBhpNO+WvIx2svOYPVRaVZHRrU2QL+WF3ThXMTxyPep05ZVx2jXT+CTjV
         HwL3+eQ1LDI/KNT+390leRj+lzUY6oj7Q6JTALTzmUvoJAGe3uj1V1OxNq7Mirv0aHCc
         fUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748247182; x=1748851982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
        b=WaYiwGGo44dFnQc04eg4XtuKZBzqIbqLr2/vsTZmc2SxmuGOh/gsglo+fv7C/6Lvbj
         Ow2SYtloZ4onol/hEL+6bH6eiNb5fc26g9VBdlkB4zos1oCxxCSpJe8En+WQw0x/GuZR
         E+QRFyqe4geGORo1z3roD9x/xaeb9iVcl+uk9OhgmcV439htHYWw2WdBrfx4obduwuk0
         6BO/6M48gcJolmxm3uY142CC2iyN9g70BEZym/YUojuz+edbFnuUKxGWwDQUx+kQno0R
         yeX8G8uI/Y6hRPrOSNYdov0HU2qBRbTTKUBl9azaTD0pEY+GUgNYC48iTwWKBpiCX0EY
         YGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5+/b6KvvoL1w6Vtohm2KNsMRj6Xvp7/A/fXs3uZl77Len9l9QIpf9py7hzt9qstAmMS65mXUi8e5YRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytELkXOLY9ahI2u7A20sHsgvNbqHDU2nbp0/ShKOpS27TCMfKX
	iX+FUfawkofSlJqpX+6qKM78gvjW7T14sqwkq1X5kkd9rfc2TUB12stF4aD+KSy5EZs=
X-Gm-Gg: ASbGncuKb6Y6NYJulrg2ZXwIlnvOSzB/RTyy34Ga5mQpxzl6TpUkaEh2QEhlwRVaPsv
	MTFHkF5LCoYs03XwCST3DyqZcq0/Op+z8Qsr4iQA7VXaWsJCXCh2SI/jmFZ0y9TDf7salextzB7
	JgTaxDBX4pvdbIfcEp53Rt7tNqs2G0bT+A2MqvNYjl0fNMSJ3IBRApnZV/LqCjk6h7mxkMlS8g2
	RzTte1LdOETNH0USJsZ+KVxMU3P8BWeyFQUOKfi9rhcGwi/qGckdonPGKQc+GfWNpj8XExNVYO4
	cVkuBL0KYswIAjciG7MpJd7iEiFPKEmPzOa0SRj7n1O5Qv0UOg7+bz4Vm7A+foGcPy892yU69yr
	Xn5bOAg27VR0QEiU/
X-Google-Smtp-Source: AGHT+IHGSsVUmWj3Jah1vKvr6sQDWVSDBSGyOlSKcnIVvmpIKC/Y46McYZjwHULPKpThDtSFgrrx3Q==
X-Received: by 2002:a05:6000:1acb:b0:3a3:6434:5d34 with SMTP id ffacd0b85a97d-3a4ca413eafmr6970418f8f.17.1748247182279;
        Mon, 26 May 2025 01:13:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d8ea9520sm2349448f8f.70.2025.05.26.01.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:13:01 -0700 (PDT)
Message-ID: <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
Date: Mon, 26 May 2025 09:13:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> +void vfe_vbif_reg_write(struct vfe_device *vfe, u32 reg, u32 val);

write_reg() / read_reg()

---
bod

