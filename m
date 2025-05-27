Return-Path: <linux-media+bounces-33453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65376AC4E1C
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 217D217E678
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 12:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5BE1F8747;
	Tue, 27 May 2025 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un+xyXFD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5A26A0D0
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347313; cv=none; b=uDJB90ND2YT61x1GrY120T1GPjQgNNBNypTDlUsaCudz+rgJo5+nTEdwNZ27aV3hoD5n4T1mPKBi9P3GAtXZJg3PvfyUbotTSszYQcakRCQdHEyWOxBo0Ux/aFL+f1lLyRwF+0HjboNSfJ56wbp0MvO5mBaNjJOyMql7+oEW3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347313; c=relaxed/simple;
	bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j38Osfz41r64Wq1Q8lET9iBftM/LdCqEPvGkgRNA72VdHyy7+X53DUAifHgCzqxRoH3OHposqAabJhsrs7z2Cg9I9VPuFNnPNkBWTHK9BAnLrwmc2a9VQVkejGYArg3T2scLh3E5paWbSH+7/CETnSUdJ6Zo2/eNK1DifVbckhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un+xyXFD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso20270445e9.1
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748347309; x=1748952109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
        b=Un+xyXFDaiawZehn1l936YdhODefb0bEKjOKQgo6l02ERO5BMS6RwWHTnSrJYl1fF1
         AY9OJRUimOg0G6WA/Fl81ImZSo+kDXmWGQSqJ78gdW+cSjO/IZWtdfOUToxCa1giZjsJ
         I1Rmdw/yuZcM87GR6hZZZE/8JE1WwiQ9tcgMqoVxxaJvWBiB050MWwNFpod/zzWyowEZ
         z0FyoIxeXSsPB2cU8R7Pc/j+Gywt5XJVNZ8KAM5J9J6VVOc++s3ULjeysjy2dm3rZ5Up
         2DB7nAyXw/kw2eJVoORq8LSkE81lkCa0ZZh1Z+Cx4tAuujjCUIhmcl5Z0XPGL9GHDX/N
         /D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347309; x=1748952109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
        b=uPS/L3uF1upIKi+99/D7KsZnO3ONI1bpb2ToCiu0mzk6gBkzHbnb0r7c39e52RSLZw
         VsdnWU4T80aSh1tcKppJYGfUNuUWAd6L5eWTYlHFmdEKg5BP395/Ur+gQhL7vyUMq69d
         No+eoMFebL7zvMqIniaJYf2RdcVLRv8xs4v4+zv+K46gKc53w/CyBywEHeuz9uiCWSAy
         uEBpm/aPdtUlSbeeqppdRRn6kZkhD+5398Ye5TOgXMUsglOipsAIUPrZFaFMVKMGgLxW
         +8/S8SUu7ukPJI8O6r/xW8vmsQDQzEL7tjyYd9BG72Voi/q4tBQw6hBjoH7PESi7dTIr
         4FiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsizRG6MqiFVWDaHqjSDmod61FeYy1yLEuiegtfcL91TBudwhNjD2wYmK0oqxcqy0kGC+067ayJJGbOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOscuGlA7y1cdbwzyxEFHX3n7K8S+yJxRsmEXiwwrUW42D4xKF
	e5ozm6anGih5FTCZ/nnnqTbWw+kvpMMkcARlpdiLsdpCEPBYvnA2bFHUiIAq0ejj/ik=
X-Gm-Gg: ASbGncsVSdU0FyR+YPevfTCSJrxKAat5YsVL+86Nuj2JbAWT664ZIKkWHAL+rj/5AAO
	94KAIa6ujlOneF6ghl6mlNyixwmWVmfalQwhOjAc7c7/hdZFE1AEMPMk5ZtPAueQI45jVkmHJT5
	x0yECaGh5L0SaC90d71tUWXwehsjN7X/06A/F3kEXQusypJ5cnBD3EZLg5012934itheJqOYmwX
	it7WRyAKu8jRHTSWCJP7iU3Dc4o+wjUFCO3oVACwJICIyaP9Xu/S//1p2TAAa368TAxzqdwxerG
	9gvLq5DbQBzpj02N0HkvrBEceePjJpPjnk8GBvMgqEoCJy2S+vLvszwmzBlzHsTAnVyvptvsRP1
	jk9f0Pid/UXImOYWtxcF3slJJ1t4=
X-Google-Smtp-Source: AGHT+IFWtDLH1zwZOq+Rw9/Jw8vNdc0tJOd1ARYqcoxhkpz9AqYUyEe5yiEWhYdxUf/zfsOc82GHeQ==
X-Received: by 2002:a5d:5f8a:0:b0:3a4:d9fa:f1ea with SMTP id ffacd0b85a97d-3a4d9faf3c3mr6111892f8f.7.1748347309236;
        Tue, 27 May 2025 05:01:49 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d437f961sm7631925f8f.17.2025.05.27.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:01:48 -0700 (PDT)
Message-ID: <308a2447-5fd5-41f6-bef2-b96d3aef4de8@linaro.org>
Date: Tue, 27 May 2025 13:01:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: Vincent Knecht <vincent.knecht@mailoo.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
 <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
 <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2025 17:23, Vincent Knecht wrote:
> Do you mean to just rename to vfe_vbif_write_reg()

Yep, its more natural language.

---
bod

