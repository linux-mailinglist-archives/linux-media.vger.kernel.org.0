Return-Path: <linux-media+bounces-49225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD6CD2C39
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D203D3014DB1
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B179301010;
	Sat, 20 Dec 2025 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT08D7lq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8933B3002A6;
	Sat, 20 Dec 2025 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766222827; cv=none; b=R2EvOvfyt6kI9ZLAxj9Z2NiJxe10ZbsyPfQKsv9m9d9u5MVmmwF9/fAskmFEwfBPYTM8ZJ541rE1ThEa/X3PasrN2L8RfbSH0g8Y2ZORjBL14HSXPcHLQTvU/LgAK5XARjJI6ke7fqS8aKN0zlWikxHnilqXaLpz9CNvRKSW218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766222827; c=relaxed/simple;
	bh=9F4vNpz8QF6B9155Cl+o04y6MMtbYNo5s3R/QFrFxhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPhG8St8VEXrkb+ub8c+YbBHMKPSjfOAzOgev3Glmx8JnXqOm2spunoiLJ4Ep6/NIwa6YV129IQ7UFgKeVec/kLbl7Ryx6573Sz59L8dm7z+M15vl19apjui+1OzMGm7ZaoR+SPZ0iv27bhAkZKc1EHehruSl6AJ+Q9o8a5WqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT08D7lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE08C4CEF5;
	Sat, 20 Dec 2025 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766222827;
	bh=9F4vNpz8QF6B9155Cl+o04y6MMtbYNo5s3R/QFrFxhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TT08D7lqfPv7Y1C3ZRe1m/jF5GZsivrY0CuWGAROs7tRhKtL90El/DlnVYuqEgzel
	 Wfu/h5HhMVYJNM2fH0jNNllZByXSfNlvF0XlqMqqLjfl72EbtDX1rzFU6K+qY2wJzQ
	 KNIaq3WXm8KF6RA80XtoI4vf5TBBvTqPn64EuRfChBwPY2ijIP5qMXiBusXIi1yinb
	 5ObCCPSlzyv8pINU8SJVl36On3RHylgYZREnrLHpWs+49HkHlyQldRdmRpLH5pgkgS
	 0GHowk+QXi6VIs3RlkUp6I6gk0CxOlzHwlfzpyHr8uiUlV51Y+wGKqgMd/FV2//dTH
	 FlB6mlNS9hcDQ==
Date: Sat, 20 Dec 2025 10:27:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: media: st: csi: add 'power-domains'
 property
Message-ID: <20251220-impartial-stereotyped-horse-70999f@quoll>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
 <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-1-a6edb2aa8154@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-1-a6edb2aa8154@foss.st.com>

On Fri, Dec 19, 2025 at 04:58:03PM +0100, Alain Volmat wrote:
> STM32 CSI may be in a power domain which is the case for the STM32MP2x
> based boards. Allow a single 'power-domains' entry for STM32 CSI.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


