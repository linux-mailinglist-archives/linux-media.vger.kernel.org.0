Return-Path: <linux-media+bounces-47142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11249C5E1F5
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 17:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68BC0421A68
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501D7329E51;
	Fri, 14 Nov 2025 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqaXmnod"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97864328B70;
	Fri, 14 Nov 2025 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135522; cv=none; b=kYJPpyLSs6QQbiytKOHQPJHqEfyrTDe6nqjnF3KbtZS7iJHtyfkcQVvQKuD/EXlAkyZhiMZAIuqpHZxi7+22zk4qd2zEwJ7SpVHn2csm+wjUaiR7dPzT7KKT6Xi3I9cjarOvplc2qFsHzV2dbuwjNvFTMGzaJ/dXfHFdpkfiMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135522; c=relaxed/simple;
	bh=J5HNRa0SJNKyFSPAm69QFFJazSb2EUQ9r0pDyINyuRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1f2GMP85JqOCeSVmp0jdwvkRjJO8X6EZaZoCGPPlSBMpkCRy/XOEhyHctdzV6ujGulOVp3uGB4h8dIGIdY+0lBjCTnAgdqQe28zrVnGfjzI82VU4cVI5IKeolA2F5c8eGSFExtMFJN+l2uTPG6rXTmHfa4HRXTMcwXvF6UDYwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqaXmnod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DFEC4CEFB;
	Fri, 14 Nov 2025 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135522;
	bh=J5HNRa0SJNKyFSPAm69QFFJazSb2EUQ9r0pDyINyuRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aqaXmnod3GHdHYBuMDtrz/Jw7aiTVvSW6Xvqg3Q4iqOtf8eyb/8id/sIWMaxXKo6t
	 Igva6rfKus6TDOcDIwr0HKsf4D9H8Ec1RxeK7TXCsjPaTvOLiBfO8abvH4d5vH+Uvh
	 yd6mh4xZbmTG6hxZVgfFEJTo++rBPY84yeQ1nquIDBbApW0SLW60oFFaMxwcOZQfy8
	 ez4Yhx/h3EJDcxVJyPYFYlst1Lg/gg98Cftc8x9H2xP5z/Yoq5SQz7IascpRfn+m+s
	 xrI1b5nanA80boVvm5/MEA12WhSatyijM0maxqdwblPFQ6mPyi4jZpN5EgEzVIsznT
	 w4MBGKEfuevbg==
Message-ID: <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>
Date: Fri, 14 Nov 2025 15:51:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid>
 <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 11:15, Luca Weiss wrote:
> Add bindings, driver and dts to support the Camera Subsystem on the
> SM6350 SoC.
> 
> These patches were tested on a Fairphone 4 smartphone with WIP sensor
> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
> far as I can tell.
> 
> Though when stopping the camera stream, the following clock warning
> appears in dmesg. But it does not interfere with any functionality,
> starting and stopping the stream works and debugcc is showing 426.4 MHz
> while the clock is on, and 'off' while it's off.
> 
> Any suggestion how to fix this, is appreciated.
> 
> [ 5738.590980] ------------[ cut here ]------------
> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190

Do you have a full and complete kernel tree we could look at here ?

---
bod

