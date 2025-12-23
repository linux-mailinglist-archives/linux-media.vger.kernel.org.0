Return-Path: <linux-media+bounces-49416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C6CD9763
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB34E30329FC
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 13:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F9934167A;
	Tue, 23 Dec 2025 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erxsN5jM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B42F39A4;
	Tue, 23 Dec 2025 13:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766497101; cv=none; b=gFuf7vRRVhaAdYf3u7uwa8Qvq3pZhFyaa4BXmr06Upi9XVpBHL4/U8d6cn3sQqFgZmfy4fbOzXoFwvOdBqkvyq61sfb6ILlwrclTxNlpBu1BIrZQ2TvtNaRom3kAqQglSuPhWBD9fvF+Ai/45v1mLGQttLEbTF2UO8mlbT0eQMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766497101; c=relaxed/simple;
	bh=qvn/msZkp3ujW79R1BxTVdb4utSIi2OLzEL1KmMUq6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duvDsS3QPvNCLGS7YKnNJz55/Bn7qu1qGSohbuV6RRIPS4IbsvhUitkOFEoEEseiaOZSl4OZEo2niO7jCq+IsXVFFcgcc+qEE4kJcQSR9h1iYa5og6W33rObIN47Az55NENpKJnODI5hNciieQk2e4TxlEelo+Y5iTe8NIqD0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erxsN5jM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDB1C113D0;
	Tue, 23 Dec 2025 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766497101;
	bh=qvn/msZkp3ujW79R1BxTVdb4utSIi2OLzEL1KmMUq6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erxsN5jMcvjvR7dgN5rbGJPnJgFa4A8bzYx6J6zoFnkUrQ3fiGg/jM9UVmNazDYW8
	 d1mTN3S7sT7nM0uxUBTdzaY/PNgQ7m94etusfnL6y4HKTVWcNhkxT7crcXpLq2mK9h
	 WyErjslE5Qt4KtktrBfl86jutkYbsB8UQVMCxXcs+nDq0uO3uSd/0PTyqV9MYDqCup
	 kBig3dtp6tmiW3O44s5SSEepvv6ZARSuyujGkzPpmRMH514nmcfd6beM6147EMUY7A
	 R9EXgzSm3XgjyhuqPOrSWI1ri85yV6+WkqzYMZ3AZtGr6t2Xs/rG/5R1pNLqB62EFx
	 Ed80W4DAek4Tw==
Date: Tue, 23 Dec 2025 14:38:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
Message-ID: <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>

On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf0_mnoc
> +      - const: hf1_mnoc

Same comments as before, do not invent names.

I finish review here and ignore the rest. You did not respond to
previous comments and I do not see any improvements.

Also, way you send patches makes it difficult for us, so I see no reason
why it should be my task to try to decipher all this.

b4 diff '20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com'
Checking for older revisions
Grabbing search results from lore.kernel.org
---
Analyzing 5 messages in the thread
Could not find lower series to compare against.


Best regards,
Krzysztof


