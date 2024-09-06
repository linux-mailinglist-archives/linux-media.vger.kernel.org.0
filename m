Return-Path: <linux-media+bounces-17757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F055096F18E
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272DF1C21441
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B96C1C9EC5;
	Fri,  6 Sep 2024 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbrzkNo1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F356D13AD2F;
	Fri,  6 Sep 2024 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725618746; cv=none; b=J9CqI18/YR0qivJ2RtS1X3MWBPJjpeMjyJyBtZjYZSNOEKCdADUdxnjtTj/0jvV3Wcob9ufRC4FFV3hjzzPHe5ghXVGAjj7bCj0/K+G6fjd880cTCeewGAdD8YbCnVXCy3f18DzqWjKFp9QRQmaPir2x4J+DjnFFnkRA+WH6MdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725618746; c=relaxed/simple;
	bh=bizvIhSeAyzfO4lD+XWX21/Zqs23bS2hRyHKfLLdRDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYqqtnQCYtJoS7/t1WBOaqBbn7jXPLwt8PK/RopaPozmc2dhkXz17kXmeiXR/wAXi8DDX0CSvm8D3V0N9MDY/yi8koSOUcCv7aV/d0TziJ7TyNIQesac8lhrent/12IwYKlgMbGm344gGVR8CYE8piVPu/W9Kb4GqYC/IF7OAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbrzkNo1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F78C4CEC4;
	Fri,  6 Sep 2024 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618745;
	bh=bizvIhSeAyzfO4lD+XWX21/Zqs23bS2hRyHKfLLdRDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbrzkNo1QBmntu1QkmKPYKtcy9LWW4Fk4seZ5Tgn1HwH0Xv5HQlK6p9KS82AVISsr
	 Cx9TLycf5XM+eHMCg9/meJWiVYtafYsizVe3NpWR/hMveOong94RXxUhKWkZQ3c0Wi
	 nvTeMlzEwsYcnkT6OoROwDpXUDI6PlxmowjMCv9SZEAOUHEa1yc9WC0/r5w312D6Ez
	 UroyuoK4lVZbVk1eIHighVnMVY/T7jxiADq3k8nrGRMmD4m7IRimoxVIaMq+22Y34a
	 DMcsicBvF5puphaLfBHJq8GkYysW3AIHBS0px1HCodY0f9mm2WQ8wmF5ICVhATTgA/
	 0M4KrOfd/lFlw==
Date: Fri, 6 Sep 2024 12:32:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] media: dt-bindings: media: qcom,sdm845-camss: Fix
 interrupt types
Message-ID: <duhhfglxtrouphuvv6emvtqgvrj5sfqwzd37r5skxdsbdbtbbo@daijselrkosf>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905164142.3475873-3-vladimir.zapolskiy@linaro.org>

On Thu, Sep 05, 2024 at 07:41:38PM +0300, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the documented example from CAMSS device tree bindings for sdm845.
> 
> Fixes: d1d5ce260165 ("media: dt-bindings: media: camss: Add qcom,sdm845-camss binding")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/qcom,sdm845-camss.yaml     | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Same issues with subject.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


