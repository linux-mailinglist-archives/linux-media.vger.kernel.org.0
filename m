Return-Path: <linux-media+bounces-31373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B56AA4533
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1723D1BA2E4E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5AF218EBF;
	Wed, 30 Apr 2025 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MT6BVCvi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8E208AD
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001459; cv=none; b=hCzl/x95NMNLVzgoBYpMP78mhP4eCufkQVh0rJlfb8WXI5b3gZ3BsCHmuXhCoU8aEApmNjh4xiggVEV70XwbzAjh4LRS3K9ywuWj1PLSRqnWzM3L+yFk9gUv/Mnr9CO19Z4Ry7ZGSd6GnAtYDdbF2Ib23vxn/JqarImT0DRu2+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001459; c=relaxed/simple;
	bh=jE4PEp33a5PU1lnBYNlqWTkmTy/oubM5i2hDNHSJbAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1s6uMXjGR8ZQXUUYi7J2fvg0poLVy1KDSm1WmztL1vpPAkZY+u9D1Dora4vu7aEJJny9dHVB3eaVL71obLVQjOZleGkvtK72y9wo5CYo4K8uWBo00Nv1ws1He7FzCvraTpJ//WntedX9QKVjJTyj22QY9QoAPCWSQ8o5qpXU84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MT6BVCvi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf848528aso49687635e9.2
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001454; x=1746606254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufqPEbOwWYWB18ZCf6Yh3nDmouH/kkXVRtJyRpSOlpU=;
        b=MT6BVCvi4SjxHWopj6rBSu7AnH/4VuaLDr2PkcC/8L6gpfME+CZDsRgjnx/MDxpX1f
         p97tH65b5RveQsOu48w1vURisczLNAotr/jt/Q9SfEWk9mgFTORUfzz+MLUa6B9nPkoX
         ZsrdCC5gPY7/FhCRgZax709889dSGfCo9H+gvyG9z3nr3jwTJgEjJYYHuEAnoYDDTXvu
         jwDX+832UnaLyL44zHbV6nhpGSfiG7bY5RTCcKCa+mZkr4X60w7F3j5+W9SIn4EzQTdd
         T606BMMmZc8vcT9+/FoF1Y/1gIcVMsqwotdI2Y3tKrC03I44+/QIzLclNONGF72mKdwF
         AMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001454; x=1746606254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufqPEbOwWYWB18ZCf6Yh3nDmouH/kkXVRtJyRpSOlpU=;
        b=At4mArNwStcvXF1E9UIhqWiyHwaeD04WJM0DVn2n/Mh6KZWV6LZaqanz5DGzotQ4+O
         fQreeNVUqKZ+zzsyq6ElKakmLVLV8VrHLYEtC2OhaFgqZOmdXAviAzEfM0fexP8fa5nS
         LESlxhYH6gt7hLm9VpUA/QSQ+vMvWq6rs4w+75rD9nHfSw1RMnD+SOu5Purc352qCVxc
         7J8U7m77tEZgnUeHLQIJQHy2pCkrV4HvKwz9gqCmC5vdrwF3dBv5hpA/OUrU/MzDNgda
         JVyqQJh/8yAIwC1A2aFkvJ4eZ/3D+SYr7nZHFfEmREsc+XYCvTFogz0MshdBDVqVGQDu
         4EKw==
X-Forwarded-Encrypted: i=1; AJvYcCUkgvvHnZwrd1qouOylnlkVUElHRSzsSlh+kLros2JO8UPqhTQj1D23heJuLC24HDVEDMZr772JxmZHJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpmABArIh4bIhF9iAdLxnsLSxowg+Xh03MrwbVazVIjdnAZ5PG
	Wv6JgYUWJF5O2fhER41Eh/LUQZ8wBCYY52v0ytTyYHkEyngstuld3mntTQ5lvKc=
X-Gm-Gg: ASbGncuRE7BPN6PFOxIWif1+ZlI6Xqr1QOC+4FjjeSlrcTt1FKxk4rHwnk6UIrWGJem
	r5EutfKbENPmUhUXVPOp1XIsjeNMtr8UPC5Q7E5j6viD1DkfEgF+hlYxqip4et9mqU5Dffi8RVB
	NmgmFPC6QpUkuZJTihrDKs+LYXKOGSceLP9sX0w+qhcKaVp2J4b6SHcCTkSl/j71HkiGloY3gvW
	c7D+uTPxqvpEGcNuGAvXI6EFuLUA+xvzD/K0bpB7iMi2g1VWfX8d/9FEl26DwtsDIxs3GTzktM7
	nXCn2LrL62LXtccafFfY1TJXhtNWF/JlsmF9jngFi8xQ8fBm+WfSOpSZ+3vwvSAGxNF3/rPZnQQ
	sI1S4Ag==
X-Google-Smtp-Source: AGHT+IEC343GJFUazvyxQ/kBdVhvDtloUR9+rS6OZvl6aiNt5CYM4RgWteI3bMKGtRqRGwvmyMmn9A==
X-Received: by 2002:a05:600c:3153:b0:440:6a37:be09 with SMTP id 5b1f17b1804b1-441b1f3865fmr19065115e9.16.1746001454638;
        Wed, 30 Apr 2025 01:24:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bbf046sm15474325e9.35.2025.04.30.01.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:24:14 -0700 (PDT)
Message-ID: <c2ba9738-a383-4a53-a7ad-fc65a97d1c4a@linaro.org>
Date: Wed, 30 Apr 2025 09:24:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Johan Hovold <johan@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aBHQejn_ksLyyUm1@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 08:25, Johan Hovold wrote:
> Unfortunately, it seems Bryan missed that this was a regression that
> should be fixed in 6.15 and only included them in a pull request for 6.16:
> 
> 	https://lore.kernel.org/all/20250410233039.77093-1-bod@kernel.org/
> 
> Bryan, has your PR been merged? Can you try to get my fixes into 6.15
> since this is a regression in 6.15-rc1?

Let me see.. there's a -fixes branch, I think I should be able to PR 
anything with a Fixes: tag there.

---
bod

