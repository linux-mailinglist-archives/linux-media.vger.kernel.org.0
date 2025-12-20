Return-Path: <linux-media+bounces-49223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8773DCD2A2A
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C848E30019D6
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 08:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC782F691F;
	Sat, 20 Dec 2025 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFEdnhH7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC872D9499;
	Sat, 20 Dec 2025 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766218909; cv=none; b=ra4w3mvi1ANbmXYDIwbzDnFtEOfworHNZHsOc1/w6wFsmzSTxCwjBZceKm2sDpFtxnM2vL/GEqN+JFtm0/u3+stBkhIEjVfL3ReFPer/x4gYSmdE83U5K+wwAQrq1KRp3yCLrY90ax3zOce/Lo0CeBmnfs/Vyj684RVvzaH/XHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766218909; c=relaxed/simple;
	bh=yrugSePDwpe4Ssgzv/R5w8uZRznKl7iqkGx4mh7kJno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofSPSYhBul8+ckEf7y5Mc6r6hKxYvEYKyqdsA2npMh8jMOzhnZ1F/XXvg+bxFqotl6WKVlLeG3FsQP0VvgBalzFBSCMDXQC3RQ92ie+CMlYhXkdRPEqMPEEqAeDSzo/gxw0JGeeWEiRxCzyxEGnazrBI9IJduLmhFk8pg/4DnVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFEdnhH7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5360DC4CEF5;
	Sat, 20 Dec 2025 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766218908;
	bh=yrugSePDwpe4Ssgzv/R5w8uZRznKl7iqkGx4mh7kJno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iFEdnhH7J3HIdCJn0BJVFAVk2oxnHGqaznhtB8E/mYat0CpNiGqjMhBTh8Bx26Qha
	 4hJ9N34aPd/BgITuAM5R4TxNZ0s6i/CHVZMHQAjGAN+KrESnNnns4ocl5VMTbLE9OU
	 +wsWAD4FS6gD1rgHstqrBq+mvjirL8iyJpJyt/1PqF9wzEIIYEVC1y9tsfLCjXCsBk
	 2SnRG/HRGujso/6rKze/7iy2YD6q8K1dJaO5Wndh/KLwVVM9ZcbfqQfoM0DQJO0ZWV
	 V2AC3W+xnep68cERCKxYURJ7D/cIutTnDEgc7ZfasM8QwPd/o8bDFW+U8E4DEDW9dk
	 Qt6URvz3UocOQ==
Message-ID: <7fc87b59-0a34-42a6-8012-7dc59223f0ce@kernel.org>
Date: Sat, 20 Dec 2025 09:21:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add os05b10 sensor
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, robh@kernel.org,
 krzk+dt@kernel.org, sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
 <20251219084526.22841-2-himanshu.bhavani@siliconsignals.io>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251219084526.22841-2-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2025 09:45, Himanshu Bhavani wrote:
> From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> 
> Add bindings for Omnivision OS05B10 sensor.
> 
> Add MAINTAINERS entry for Omnivision OS05B10 binding documentation
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

