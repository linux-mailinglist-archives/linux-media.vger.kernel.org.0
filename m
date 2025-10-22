Return-Path: <linux-media+bounces-45187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A2BFA4C3
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002923ABF7C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 06:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D788D2F25FA;
	Wed, 22 Oct 2025 06:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0TMMRN8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32220221F26;
	Wed, 22 Oct 2025 06:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115591; cv=none; b=L0N5MttFFvh6vN7teJyeD+qlpRrgSSvIZ/3Yj20VoGkLFKYth4lsT6BRiZSfdzPHA1IJf8S0JGZgfVogMw0qEwJbRDvYZgYSXi2apbGITn4ZNyG98qjeRacd6tMA245lDMJf4HKtkOMybq+3v/CJ4PsAkbNQLXp83jdrgrBgXq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115591; c=relaxed/simple;
	bh=UH8g76ts48iHHrFuYqJ7LNpkZq9WepyPORfH7uXpbO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sg6Jtny3UmuA9Lwg5qTxYAtmgQy35b8OK7rQKP+3QCZxjayOGzcY1RklmVamSBQICQvMNz/wdYWBR3xDUqaDx5XxGcjzqRHiqPlhhAQ1KY8v1ssxuHb8uiNAE6DoFDU2PLJArLUN994H1cT+J2Gpqvkzd0guUDwscVzHY6ky2+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0TMMRN8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27337C4CEE7;
	Wed, 22 Oct 2025 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761115590;
	bh=UH8g76ts48iHHrFuYqJ7LNpkZq9WepyPORfH7uXpbO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0TMMRN8dslaJY4JPUKTEzUBmm4y46R5UM1urc359vyy7KU0QIoE53CqtBKxcmhlU
	 OISOC4VvnihHYfWrjnYL5WOOmCci6D2Te+7PyO2wqSTGBqfUHPYUO6emld5CYapKDr
	 U+0D2xKbdksQ0oFCrv1Mtpn2R8mZl7ZYkaV+fzcJA3aRyhVXD6tS1/DiznQDArs7R2
	 RrJ35/79BKWtqhJ/JGuUEBAOXLyckYPjM4UeL+ivxKzyzcCzOpfVSzKQwRuDsNXJTq
	 f1cYOWSoNC41OK2AnKUjFY5u5a4YQIC2BslMBTyDDmut0YKb4Lbrfxfur8J9Hg2iEz
	 GEspjYxn/MLLg==
Date: Wed, 22 Oct 2025 08:46:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: media: Describe Qualcomm SM8650
 CAMSS IP
Message-ID: <20251022-esoteric-lemon-quail-ffffea@kuoka>
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
 <20251017031131.2232687-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017031131.2232687-2-vladimir.zapolskiy@linaro.org>

On Fri, Oct 17, 2025 at 06:11:28AM +0300, Vladimir Zapolskiy wrote:
> Add device tree bindings for Qualcomm SM8650 camera subsystem.
> 
> Qualcomm SM8650 CAMSS IP contains the next subdevices:
> * 6 x CSIPHY,
> * 3 x CSID, 2 x CSID Lite,
> * 3 x IFE, 2 x IFE Lite.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/qcom,sm8650-camss.yaml     | 375 ++++++++++++++++++
>  1 file changed, 375 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


