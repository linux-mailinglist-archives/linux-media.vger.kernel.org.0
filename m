Return-Path: <linux-media+bounces-28290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89704A62DB7
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 14:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EECA189E694
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 13:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E522010F2;
	Sat, 15 Mar 2025 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nEP04TiH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3E201027
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742046657; cv=none; b=kkTtsLzZG2I6esyTUsdX+bqr7gnCFKN/eniztXmpyvu6OmTMWYbSUnWUHGtAuxCmv5sWefKymeQbLKq8NXKc0OZ3uiuXRaihgTg2STws603dn8xbX3jsx4kn4yIrGmfAc9BQYrptndJMQCq4uZUP6/AR0kwJJ3uSr8HG5DSJpWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742046657; c=relaxed/simple;
	bh=TjmYeSOlDIrvs8RZ4id9V/eyIb10C2W8DmQqgiguXoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmLaiGU4/lYMs61Bmc2pA0x8ZnSVhw7PuXPesgWfPdUe9P4yQeLVLYR6uGvyHFP/JIDGYU6Xk8/GqgLYSM7ISb/wb5SC6K3QRheca4ya15IRvSVEgXtz/ZD2Hbdjri3YPBrrMiryXoWdvxKG2mASY+ApAYsfmjSgzvsIQctsLbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nEP04TiH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac29af3382dso496006466b.2
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742046654; x=1742651454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjmYeSOlDIrvs8RZ4id9V/eyIb10C2W8DmQqgiguXoE=;
        b=nEP04TiH/p4MHLI/Rn4KGBR4+z6xY1OVYpGGcEcMMUXVyOJ9yMtahPqLywGqMPQ93X
         gvfssHgu5fC1tAhxhyiwsSvKBDyKyU5rsOn9gLSjI+4lza6L0o3LbjIsfo0ZTbm7/nZ1
         SKr+tb56m/ivM885ZRjlGz8xcgtxoHrzm8KH7KRQ7QYhXTVO3BLsB5/t3eUf02W/za2d
         /XaZLT9afXkeVpbj10bR3Nhvy81xqQqnmkGj7kHdOVXJpZekM2BCTK8NjE8wsuerDBq3
         63DrjmqHo8fy9dopqn1vVLkgHEljk3TNGFm2VAMviJB4YyjmUaiQrAh30hPBvz86KpKv
         blgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742046654; x=1742651454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjmYeSOlDIrvs8RZ4id9V/eyIb10C2W8DmQqgiguXoE=;
        b=buUOaLFjX4nk2zp/n/0G+NwC+C4kSsTYWxxvPKsYs5B3W8DzCy3CwchwQBGACJOxpF
         nH/fPp45byTExGpyQk2LdJ6wA8aGmDSJzbVo1CjcNSGMfevAIu42gm1wsffXSZHLtOtQ
         o51q3YtHh8McnBbJGyEOhWUGQCwXChdgtOrEXamdcaGoFNGC2KCj84Mbn3MBKvMvjoxe
         3O4no4o0SJG+CYMRYbBa1yYlHnnlE130K5vK1s7R/Y9GAqEWYmSXNtt5uOYJNfP8pL3q
         0gjlStoyH0jAk1+2f5Tf06qdawmzI8ZbgVy5i1ML3Z/m675zflqaneQCMOW1/BdhXGca
         FucQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTPAZWjMiR2izt7rGOgbWAXoTy9fqyHMGuLYJyGMf0TlVvDRzGKDaJamOG+3YgGg11Ct3rOoiZbr8veg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNlel9N0Ev1UMAD3LrdiLSudBMl4a7RnHkSpTpaygKQz1sioq
	s0djW3JAt9GjUTuT+0REm4Kzb4u8ycFYhuGGiDoSUVspTDRAIl36ji8bo8nhqSc=
X-Gm-Gg: ASbGncuTlusFYbF1qR4zbjvsURP3uB8x+I9UMOUf2zYnz49QpYZdS0NgEVwHkB1QLpZ
	c4uc4V8WUIygPHNioWb/1SQciiLpKjU/zLw7ZWiVNbagm4FV/4+aLllDw6o59WNgH10ADf4i2hx
	dC9FkYstFdS+fhLEkwfk1LFbaMzse9oPMvTI57L+zoFbCohX/WFlYYnX3uF/Uyq4jcVHYOKaSaR
	zJL2LM11d6op9klLzUX3dV5gAqeGxKu1HIupbSMHiJ/oq0/T3yv5aHdqQxSLLll0WA4FLmZiJPB
	tQyZhregurMTEiQaXp2FLrVoo9zXVkLjr8fulUvWKgo7EqU0lPKjWDY7vkMO7hxeaPUVmCbdmMM
	l76lj+ydLGzoOIUFHZ5guEwY7SvYxV2TKwxeSwh3c/KVCGLyCHTc3N3R8S0hstf22AFb8gWp+Bg
	Ewl992QzXGl2bEkEbvus/0tN8KTnDJ+3A=
X-Google-Smtp-Source: AGHT+IHjFW9dIvfxSBURnZrko1HDFWXCLq5JpwAt3DE8JR2upLLc5Lo8EXdtxd0B4Rcnb53UgB37FQ==
X-Received: by 2002:a17:906:c147:b0:ac2:dfcf:3e09 with SMTP id a640c23a62f3a-ac330444c3dmr701735666b.43.1742046654133;
        Sat, 15 Mar 2025 06:50:54 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9d12fsm370554366b.163.2025.03.15.06.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 06:50:53 -0700 (PDT)
Message-ID: <33dd1a2d-53fa-4053-9f6f-410825747335@linaro.org>
Date: Sat, 15 Mar 2025 13:50:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: ov02c10: Implement power-on reset
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-4-bryan.odonoghue@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250315134009.157132-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/2025 13:40, Bryan O'Donoghue wrote:
> The power-on timing tables shows that t5 the time between XSHUTDOWN
> deassert to system ready is a minimum 5 millseconds.

The power-on timing table shows that .... minimum 5 milliseconds.

--
bod

