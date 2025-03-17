Return-Path: <linux-media+bounces-28386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C7A65FCD
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 21:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FD9F19A07A7
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 20:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810A61FECAD;
	Mon, 17 Mar 2025 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uzLcOO2P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6D41FA26C
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742245006; cv=none; b=OheE+a3eG9N0fYGfIRQ8qPR51+Ap1r5hqktsmJR1GmycolHt+LPcbj5gMdSavoEqcYyXQXMsDQvABtORddRqrS9iozFBXVWtSGqyEi7Uib/kBVpqKg8MEUe4OF0RZr+sGlS7ygR5D9FWIsg05wmFUYA1iYsYcr5g8kdbkGxcVa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742245006; c=relaxed/simple;
	bh=81zBDcNSTguoXj9MOJ1/PFN5nLQAASCySc3Mh2z+s74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KczFxolW2bz1XdeSFO9VYFBI8u28Am/WktzLHkt3R8QovSVQ33bgvgkfK94OWhDSyENeHbohon29X5BHMVU+LnSdhFA1hsvrcoznS3Lae0AdjUfoU6LlefPx3BsB4tH9zzQcq92y+3r72vmTwa3JxgmJRyV4d6SoTa60esgmn7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uzLcOO2P; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7430e27b2so935870466b.3
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742245003; x=1742849803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BstLVAtzfOCDqp+GhsAWxESvpLO5VswkpR8jzgDHtmM=;
        b=uzLcOO2PWzFpBucLzqkKFaFSshXo8t3b4oo4pRs+AagfY9cs9t7sgthLLbR+9yCyst
         zeG4ffRWifH9sAcg0fPE4pzBTWU/we0J1ss/AztOGCbBec+ERAXX3X2dJcLL/rum3e+h
         EpeuT3eRc5d4bbZGjlTYN/WaYZI/zRn2XTECG4tR7RV7Uvar/dllWtgqRVjT8lJlG3pc
         iERRfUZnlWyA4dAmxC86q+qG10/PJ2K2uFCP/jpzhrPoccDTY9JxUey2FnSDZ2suM04C
         tRHBNW3YeYY3znzBr8LGhHwIKwlv3yqCdbDktaBD6fq1cJ0L/1y+tTzBxkW6cJYySobK
         Qnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742245003; x=1742849803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BstLVAtzfOCDqp+GhsAWxESvpLO5VswkpR8jzgDHtmM=;
        b=akwi1aKC/srqf+PsprQgS83UGzWbYPm72CWukGQJFNxZsbLOIEoTNLv0hDVkmKsebK
         xGhLZo5s/rR12wVxi+8GGcXGQRY8j+9VnrX2F9xQc/6hsSFiVeHpPyhIPfnCfD2o7OCH
         dnkfOQKCjWMww/P5PbHywbbE2KZfPXK/2ztHRvRibtABLYbM8mg4K47gevfLfXO/3fEt
         xRJIxuIPSK3qlfWOenr/YnotFS/dL4VnLpMs+IEcqp0LBqCcNxf07x7KIG8mAApdMJQE
         dg2oEGTndpOkGqOEyeUEigqcH5gz4yPWmjfZKIYKi/7dqo3tTAVYZpZSu4nGmTHhpEkV
         GV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMS1swModX2jlyDZR+Ox4Jwh36U4kl/zFoERiIjfVtpM8bIE6H1bpr6zUq8gWNkI0/1CIzMQIwADM4Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHAmt1pBYN6vrWefz90qxAm4lQg5ufbizipKCkDz/XVqJLmiGU
	5msT8f2btjAncrDn2TL1QYKJpddOvgMEnFxral8Rd2Iiqu2/RzF92EbvEwbpGLM=
X-Gm-Gg: ASbGncvRGuP+wTYcBdUNDlfJ+Q6CFvTc7BON7ANjqnEEI1HQvLQxqGKj28+oo3rwRz+
	CoIrWnU6IlYwVjjYF74lEE+VaNsOCINSYiYTW/0boEsThH3DB3rvZMUXGbzLbnsvLmpEHAY/KF/
	iJ0wIYuSu3tP0xJ1y264j5w99sOlvC+MTNn18Wv/UNAwKvyLAPEcIO4oJsBcR7ugbkcSn1ofs0T
	hUsZJd5Fq11bDTL6kztWWqJyLbOrAKtXCDbMSOSBx/Dpe31JY49eZJVUTFsSDx4qXEkRH6ydvKV
	w1VuF34CNX7VuFDaA6NXyGrU+ghwSNrxCCrKowAWyf/kFwStugKthqiCMdwI5Xfv67KuNpSsSDB
	2ZqjIq6B68jBSn6nVlz+RHbKzSDLEL/28bL4ym4WeQXHwC7fmwarVmVuXQzG1qVU182dYgKLpHx
	UWGDIMaqp5W2MhVpqpD1XfjsVREutA8DM=
X-Google-Smtp-Source: AGHT+IFKWe2DZ5nF9okyCT//0zSoiElFf1qyr0Z5z8k5hDUvEjT4K7BHpoBvcuOjJECmwN34SwR+WQ==
X-Received: by 2002:a17:907:9604:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-ac38d40101cmr109581166b.15.1742245003482;
        Mon, 17 Mar 2025 13:56:43 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cec1esm721968966b.114.2025.03.17.13.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 13:56:42 -0700 (PDT)
Message-ID: <4ac65d97-e494-4047-ab72-e1da09d057ca@linaro.org>
Date: Mon, 17 Mar 2025 20:56:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] RFT/RFC: Import IPU6 ov02e10 sensor driver and enable
 OF usage of it
To: Alan Stern <stern@rowland.harvard.edu>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>,
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
 <89af0891-3bbe-4964-8d19-205cdab79497@redhat.com>
 <685ef286-0694-44c6-85c2-c6c5f51ce6a4@rowland.harvard.edu>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <685ef286-0694-44c6-85c2-c6c5f51ce6a4@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2025 17:33, Alan Stern wrote:
> After installing all the patches except for 3/8 (and adjusting some of
> the later ones to account for its lack), I can confirm that the camera
> on my laptop still works.
> 
> Is there any particular aspect you want me to test or is basic
> functionality good enough?
> 
> Alan

No not really thank you, just a smoke test to make sure nothing broke.

---
bod

