Return-Path: <linux-media+bounces-48873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F060CC3249
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D1D63030266
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C515337833E;
	Tue, 16 Dec 2025 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="in6vURHY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A24B378326;
	Tue, 16 Dec 2025 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888249; cv=none; b=PCUruH0ULbp6DhqiS9DsRBmo1WL6Q48pWZknSt2Lba00WolD3cu6xOcZ011cegHkqVxIuq40SZ/QSWkjf68H4wuUApb0QWkkyQO+XT26JprPYFiDil3TIaXnRxpwDH/wAfuyGyBpd11yigbRanPhjEKAhj4LFgRXhXVeIuwRBjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888249; c=relaxed/simple;
	bh=fCoMjpedMrfDC9IQlvdbW+0yExuP4tB/byVdTq1DGvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ky0Jh8HlXWNWitDOp7VjIZ5tk7jj8NOKkzMSfMO6EqXB0koOiNQi45N8iX8//hg0vmKjYZoeqya0fB8mg3cqBn8yAs+bQJDG8kwhiM3nURYkyOw/29Mh6R52haAruvxXEHyPTYCSzmVlnXT24OVhrUdc72zqUPEnKDBAVSrZ7Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=in6vURHY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85033C4CEF1;
	Tue, 16 Dec 2025 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765888248;
	bh=fCoMjpedMrfDC9IQlvdbW+0yExuP4tB/byVdTq1DGvU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=in6vURHYax1xZr5G74Q+Yng9NhwyBnDctw1rsDd1qx6kjASeRUfE4oA77x+BAB3lt
	 uJCIC2RXGBgXcXTPYZm/K9mo0w06HDXeAtrtsJK1LAXngusOxvIqoiDN6BIKxWMqzu
	 b4QSpCXLF3Rh5wf+ygI4AGADht88y3OtVyorCQp4wsIcd+3lJjTI6H0fjl0t4VEgq5
	 fO/RlKuNSTdggjSJp1V9M9Ap3r2vaxKLsCQ2pj2hABNIrJgbYD8DISeg1ik4c8dQzK
	 yPwXhmw2PpD+lkg/GHsixi5b9l0bgQnQulw2tBPRK9XuB126hGI3DTngBysPa6euHd
	 vsvhDTVztnv4g==
Message-ID: <a150f333-b27b-41f9-a20d-222eca1dd02b@kernel.org>
Date: Tue, 16 Dec 2025 12:30:42 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: dt-bindings: Correct camss VDDA PLL supply
 description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz>
 <rImOik_5YzCj9A9lNSvRoQL35eZQGF4xGV29jIx-oBM7FFRFKZvtjT4ebgWcU9g-CnMJhhctfFSU3EOJaBZ-uw==@protonmail.internalid>
 <20251216-docs-camss-fixes-v3-1-c238b6810771@ixit.cz>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251216-docs-camss-fixes-v3-1-c238b6810771@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2025 12:24, David Heidelberg via B4 Relay wrote:
> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845")

This Fixes tag pertains to just one commit, whereas your patch modifies 
files associated with ~ 6 commits.

Please drop the Fixes:

---
bod

