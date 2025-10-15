Return-Path: <linux-media+bounces-44590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4EABDECA7
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E5F64E7A85
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982C8233704;
	Wed, 15 Oct 2025 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eas/vt6K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37872223DEF
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535742; cv=none; b=TYKM56N0jmWYgiWlHF37FemEFeeqpznVmwGcNnGFlPYPHhDVkoftpULArxR4gnJNn+k47BDCI8i5OYW7Y6ACDAqvs5TNubqB7htw9TQiJRPR23oqi9QHMI2QdxM5oTbmA58K/xb4Bb5jt6BpXf8LtNjU4pIawdoc4dvJZJn7jNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535742; c=relaxed/simple;
	bh=8ZEjVMazAtWAvqIzRKTRefBLcLx91zYhhGw4XMuX0xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu+/VYPO1RoLz6MDb/pOoIn1vG/RKOjR1c77Kx53lRIgdu3CXYP2FPnRD5fRAIWQdCNWpEX0k8lieCN0w7X0XpPTcDdv/5M0S/RxXBmqEEZO5P3y/dcZsQYQ6g1MSrhQYKYI5hzseRogwmuYPkTSC2HLJIXMlYr+eRr+DhhZPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eas/vt6K; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e5980471eso36322635e9.2
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760535738; x=1761140538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hy7Sxq2jeauDwIsq3RFiUz3/9uTUpwLAUFOHgM+Hwug=;
        b=Eas/vt6K5AVEUAc8QjbYHcLtShNnek0UkPwINwdPX3okqHlzvyTuFgq6Mz5eYVIXZ2
         qhf9Dj5UoeUqcRo/foGQ9iFXkhVNjOXvu93tjZXWTgOlCJkECsJIdWHoKdNkz/bA4F4G
         kVVxw1HaXB9qjrWzJb7LyH0lKNw1QxIw1A71R4JmXcBkym/ZQlU3cdB/S5jb1zIgNXcC
         GgXYFjZ5NRp/EFhFID+ApfdduF9MLcxW5xeHoXFjJyqPbVyPu9K7iHKLt66pIeFk4/xD
         ghNyp0T1aVJhlf6BBDL2fwuIrRycYGM159km9+fFjbaeoNmXvRdf17iEorGMlfjXdUnE
         UBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535738; x=1761140538;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy7Sxq2jeauDwIsq3RFiUz3/9uTUpwLAUFOHgM+Hwug=;
        b=ILGytVe3tTsNiWOdHfd+WhuWH2K67V36YhL4fml1XZl+K3j8QDIo3fAsibo3OYnWRq
         gjGwPvMbwIh70tErbaNDI5IPe8UkFq4QZFwcHoURD9aOfoCkM547lAcjYfPUPHgPp6BZ
         URwOz7gHQpK1pb21qvYElGctC2fgMzs/Cc84gaIAfSUa/wn3fdZnEgSl8EEGC9qwHgmU
         FfFxYdyq9wxFMf/ZDMCKLEI2CJwxrncNhEu9rx1Nv2JIxBoJDUOgkJu91J2rA7Gdv6gg
         4mrlHYVnmLZl9qJ2ilAbIn0/4zw2aSbmBQ02BfmylBIvB4nmYCKqd3UYnsiIwKV0ZGTE
         8YWg==
X-Forwarded-Encrypted: i=1; AJvYcCXRa79HBuV8GQACG8yog2rnq3svFOQBN4U354vC2texRriynYZWhx/9vJ4EE2ZChQkblCBd3Oe0n4bzHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMmK3iIzxhEzcea74Z1HjfHBYOAyDlLWFpulw+GwloCKHucLgJ
	15aXCYwfMCAqBwXWbI/R0E7Wc1EokHDLa+Y+HZ81ts0WwBIeH+sX0QR82ztoCOKs068=
X-Gm-Gg: ASbGncss9p3zsHG2r8AVxgmlkXttkRwJ2TsYL0Ns1eiqtdvQ8wz0UcsP2S88rNmwiE4
	/1TbVBjQQuDbQo/k2DuWdo59FzlxvjrOAKvTwADMDOLpSnl5RIE6Xzpmqaxma35CPNmxu8krUjg
	tg5Anm2NjqAAhEsFvdWUO94zFyembCUcqYxIiGtVGOKIyOXr1B3uY61i6AjM0z9z7Wocc7DiD7C
	7XC1Mx3zUcvpvjP4cIN3kIXmjFxKA2iVhMbxwsm/lY2qgkqO62LL/AFv+vnpUJVlqqeDIg8P6jR
	+3NrmFoKjjbnMplnYZVAKH5YVUh7BHThbDJ6bnKo3kOmw5W+ERpE+uQcuFN/oGp9dqrxLKFmnF+
	ZFAwraFjbkx4/HE9B6OKRfH3R5gRvs3yxsUVwCWsUdfLkSU4k3QTyfkhmPGe1xYZbKlOaku8JFg
	xoTJakw5+b0/g=
X-Google-Smtp-Source: AGHT+IGNyrbP28TPNxoPwZO9FwODuDXd4rA8MhI1zvCQw4TzwS02DCNbsFRGuJzAypYvXf9n3XAkEA==
X-Received: by 2002:a05:600c:34c2:b0:46e:21c8:ad37 with SMTP id 5b1f17b1804b1-46fa9b06d3dmr193578825e9.25.1760535738467;
        Wed, 15 Oct 2025 06:42:18 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583335sm28846561f8f.18.2025.10.15.06.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 06:42:18 -0700 (PDT)
Message-ID: <84f17b74-a3ea-46bd-a6d4-efa79c1cb43a@linaro.org>
Date: Wed, 15 Oct 2025 14:42:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 14:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains 3 Camera Control Interface (CCI). Compared
> to lemans, the key difference is in SDA/SCL GPIO assignments and number
> of CCIs.

Codename should be "Lemans" and since you need to update the commit log 
for this it should be "three Camera Control .."

Assuming thats fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

