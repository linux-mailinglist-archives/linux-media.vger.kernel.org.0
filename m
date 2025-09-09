Return-Path: <linux-media+bounces-42118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F9B4FEAB
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DF86360861
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081853451D5;
	Tue,  9 Sep 2025 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIX29CZO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6558235046
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426635; cv=none; b=NQGE943PwhsmbfCGDrOB6dL9Ndk11rDsLcKkm3YGBFl4nUnvXt+gDzEuaOdOSKEe/ZoJDeI+2nu+eEOgodhfCYqrdXCZCNi/PD8Bh8E93btuMXViqLcduRzwvXrHKWvkpTiF4vZGQf6uRYELNJaop1wRG+nujUXuHXaLzChem80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426635; c=relaxed/simple;
	bh=J1iHTeiWgzsI9TOKXMSPaiARrb+BL0MsqyKSqGCw3KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lO0uDx7bbRjXZoN6kkhdYGwe7gs0oGrpm4bcHAFm+m+cTO+S+euj1VWSPJUr99VWTRrk108E7z0+VLW6l1PtYU8TM0LReLocYqw/+5n5mGlxzWYriMZ0BJrd9gFSMEI1VQ82yOTskH2CEwTQL33ZG/iOiKIIMZJFPg0wIzy9FaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VIX29CZO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso34043865e9.2
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757426632; x=1758031432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7czbVid6QRsjlwt+fbJOY83TMvm3D218edlo4P0mSo4=;
        b=VIX29CZOHX6QxDwCK4rR3x2VG+wKMskd+pE/0xRq4AsQcPZvM0ceskwVJhaen90Tj/
         xrFxolmgya2ZSY8l2ogSMjPJLw0zQIHUWXoAUS87MHq679mknScJoWPphOZEt9s3TfXh
         MGsFeS4dF7g7NBISoYPKABGARcZ2JXjHlV2d1+iUjbCpW/Oamg4hclQqxvpJePztdgBi
         Ho45LwOy9erQuSxJiGwZuchEJ8BcTwLG7NLshNZ2vSb7W/Vl2LHkVgSu1C5+UrdtTGR/
         BQJqQ+mFGS2Il+z045A/lVK3iU9QZQpuuEIcdNqsE75H4PqJUfE5OFx6wrwkHuixxr0M
         EyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426632; x=1758031432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7czbVid6QRsjlwt+fbJOY83TMvm3D218edlo4P0mSo4=;
        b=aZRezreRm2BU36KM7zeFsmjCsnglkZDIs3sLR2YLLIj1ueGV+thplkbcBJU8JhJmzB
         h5QhspvqUfAWep+9xD9yuEKr/Zz35N7SLpQ9k36XhfnbDP2slG1BhqNRBxQJDvGeMSe8
         /VUFgrcRBkl432apuRod+jexIE+K1RnF1VVLx2GQowN0uFakjBB1EnE+5+s1QU/M6uSw
         T6tLCcj8VLAdmWiAosXATXy7IFJlozoNZGh4sJ3NwbHCHlQrcB6tG5mj2UUcE5LoLGI3
         I2Ek6n4//cTBnnFZlT26slwiKo+34wHscQwaVNF4QjMDPcbK+nkC3g32JlYs1uaIoUY1
         sjTw==
X-Forwarded-Encrypted: i=1; AJvYcCWU/1oc06s8nYFLnFJOOfEiEEFpYdmlTFtbkPzhQRAL3zQOacBg3Kq/gTbzNP+NDzQA00kwWsjGOvxhYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo9tgJF83Q6Im+FCPFV4V3Cp0C9x4ZFjaon8jyqDpx8feMH3yf
	JfkVHUG1jagGxjgQaoXtgzF0VxIxHFWzNE+8tcXwwqd0HTipcy47oZt/6dyz5fOge9Y=
X-Gm-Gg: ASbGncuXVO4i8UmfwppVgZPs+l7z5sgK4mzXFi3Znpyjp0Ed9xbA98TyHgyaSX5FBt9
	nYCsZLdqHI3aSBa1oKyEfU7mTF56U3SoAFYC47NTwQTd+okt/wAasu/zPg1xbRTdzwU1qDKQB3C
	S+fwPP/JY+wZ9Cm7ueJIG/pmrYwzbhtMNXaBRRyDLejnCevUVhARErnaFzeDENlPPk+DjZkCXuo
	7hdyjk4DkpUgPy4r2zK2zhs86V4MeuxTRE41CBT9WSqKFD6RfwQmEFk6tQYhxqAQkfLA1oJ/VbL
	yytid4azKVNXqw0Cgsq4ivtzggC/vwwilz5K+tPrJQtBhFcGGWkbRkNDNVFfu1FtZ7m1QzceI5p
	MkVQiAhaygfXvsLjI9XIJs5nUcKEwv13bhxla165fAa2uMXOKhSiYr80nd31T28C+FIjnX3EdrI
	S1MMTLxkRGLJBqoDZ1PzE=
X-Google-Smtp-Source: AGHT+IFzn0c/ZENYPqzsIDea2ndHdK4KGIQ+jsE0Z5szl/BL4biM07CIyHZ1+ufaLZRPjZ/hkQF40A==
X-Received: by 2002:a05:600c:4711:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45dddecd454mr96743385e9.21.1757426630421;
        Tue, 09 Sep 2025 07:03:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9ab7c7dbsm309084955e9.11.2025.09.09.07.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 07:03:49 -0700 (PDT)
Message-ID: <ad5a58a6-2545-4429-9388-e8ad84319570@linaro.org>
Date: Tue, 9 Sep 2025 15:03:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
 <aKooCFoV3ZYwOMRx@linaro.org>
 <20250825111956.5x4dn3uguo4xmtss@hu-mojha-hyd.qualcomm.com>
 <aL6Sg9dExKfepRKM@linaro.org>
 <20250909121956.rjbysoylwybgsago@hu-mojha-hyd.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250909121956.rjbysoylwybgsago@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 13:19, Mukesh Ojha wrote:
>> Have you continued working on this to unblock adding the IOMMU needed
>> for the IRIS firmware?
> We are discussing on this internally and if this can be taken along with
> non-pixel case or not, will come back on this.
> 
> If it takes too much, will drop video support for now in next version.

For preference I'd rather get something that can be applied to -next so 
that we can enable PIL loading on current kernels instead of waiting an 
indeterminate time for an iommu non-pixel resolution.

i.e. we are better of with stuff that works now instead of gating 
ourselves forever on a fix that may be months or years off.

---
bod
the optimist

