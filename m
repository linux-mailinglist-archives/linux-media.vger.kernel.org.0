Return-Path: <linux-media+bounces-49218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F4CD2847
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 06:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D096F301D5A5
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 05:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28E92F5461;
	Sat, 20 Dec 2025 05:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/ZOCOoy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551A1339A4;
	Sat, 20 Dec 2025 05:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766209990; cv=none; b=CR7DFp+NRwLbzc1LaUHMASYyxoeZrS7x5lzqBMxIf4blX5e5SPjlSSy72JzEcckobk9BeisQT1bbUHMKh1SqO4TTNLHZ0qUhrqHKV8n6TbfTX7iysbolvgWpUfdAgYJnopSwT5b1c/IvdqbBMquG1k3ey5hwmJ5tmVgyp5TZ9do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766209990; c=relaxed/simple;
	bh=yzcnx8V5iL0PoVqDyA0xiWyoLqVGZT95qqXiDASFiCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMOvh3QDYhynaB6Y3Og3rAgU9unds/AlMhjV3BiUUSqG3ra/mXTjvqXRQNCBIq2xT5pGn1k8d1r4WcqEhSk1F4QHxy8YTksbH7rcai50qFortfnAF+hIl5/bkBAjHib1FP4zSy21+jy/of6I9FfPN/o8ZD+dUeWZ4sZ1XpsjItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/ZOCOoy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0D9C4CEF5;
	Sat, 20 Dec 2025 05:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766209989;
	bh=yzcnx8V5iL0PoVqDyA0xiWyoLqVGZT95qqXiDASFiCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i/ZOCOoyQR7Wq6Tft4CKtU2ceU2InluE0kD6Xefj/hzDNJedwSgWfBVnt+nY2Kbdv
	 d3Hflg4atRLo3a5M6Ddmv+7tk6cutpBLQYlIUQp1GQW9EmqwQePOdPWyGMItqQtQfx
	 iCa45bG3kRNjTSngXrdAHR9XM9v1M0GE66c1HeLXxca28woybj5iPhMrjCvB0RwsQp
	 pEqQJZh0nnUDZFz2FPDIw+lX7IMJ+269+snkjzl5kjDHvPsF1jbwjSLg3zg6CIvwTi
	 ZdbqguiQggoBxhSukX7XnVENyarFzoEC6tOwGEH3NITi0RDvqtL2G1DLk46SLfGWZY
	 Zkd8mEwQdPv7A==
Message-ID: <0337e0dd-d25c-4f22-968b-f1a3c364d025@kernel.org>
Date: Sat, 20 Dec 2025 05:53:03 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
 <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>
 <r6EgtiSu8pqs2ouFERTw7fx8kYZ3RcSbGklwd17UPxNGGd3sbRDl2BPyplkABZVu3qyfrIzRMisa0qTSrm89BA==@protonmail.internalid>
 <DE8FV81S45S5.CH6K1QAX940D@fairphone.com>
 <a428f8b9-c338-4404-8dc1-da6daae37d5c@kernel.org>
 <d7dfeb7e-c0b2-426e-8572-023715c33674@linaro.org>
 <272d039c-25a0-4db5-96a3-c28907882cd2@linaro.org>
 <BBiBFB2AXdUoKHu6w0f7yyiLvTOr8mHRahPT-C1AYGm7_MaZ8yoyxdj6blE8utr5s4UtgEDJYkBckzM7Rvl8KA==@protonmail.internalid>
 <2ae1a0a3-b105-4c0d-abbc-4b9d708b0272@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <2ae1a0a3-b105-4c0d-abbc-4b9d708b0272@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2025 16:18, Vladimir Zapolskiy wrote:
> FreeBSD or CamX are software, and they shall be excluded from consideration.
> 
> There shall be no guesses about software usage, the only concern is if
> the hardware desription in the shape of device tree nodes is proper or not.
> 
> Partial verifiable description is a proper description, and adding unknowns
> of "future goodness" does not serve any reasonable technical purpose, it
> adds an illusion of a proper description only, and it was proven that this
> illision shatters even for CAMSS, see CAMSS CSIPHY case, when a wrong DT
> choice can not be undone anymore for legacy platforms. It is good to acquire
> an ability to learn from the past.
> 
> Everything can be added ad-hoc while keeping the hardware description in
> a proper and correct state.

Are all of the VFE Lite's verified ?

Even some of them ? I think not.

We are seeing in multiple places how failure to properly articulate SIDs 
results in mess.

So full description of the hardware > partial.

BTW your statement about not being able to change DT bindings is wrong. 
You just need a good argument and to make that case successfully upstream.

---
bod

