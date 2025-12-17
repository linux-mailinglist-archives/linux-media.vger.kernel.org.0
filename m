Return-Path: <linux-media+bounces-48943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB43CC5A78
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 01:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 356C930305BB
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 00:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C9A2309AA;
	Wed, 17 Dec 2025 00:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFt/DX9T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB541C3BFC;
	Wed, 17 Dec 2025 00:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765933149; cv=none; b=h4fdsgCxUlPQxckhC4YBQtHdCRPiMWCkzhzt73ug51zMONtQZTgXVa4pG5ea+UYSqJSYXULefbiKZF83TRG+DPlq2dqlLWDYGd0BeZQ0i0YLTNdG0R41VIlnW/WFRfQxCy/GsfDdJmIjjIkDhH6gFC0bNivx1S7ud2TMHhCheOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765933149; c=relaxed/simple;
	bh=y5XEBEIWWUyh9WzcFuiZ67dQvSpLSbsih6QYJAlLzNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZW81mnBlf1Qd1y8AHMDeOaeFjhZH7y0qDIPTPkG6UQtlZ1mF6xHMfX9VDypoG0YQBG2hu1wmhnxGL5o8VpFakYt5wMI3hpRgHK3IUnye155hE52zUXl+cvhA85iA6tYNwJZU5JEEc75KJPVGHev+BeZCERMVZLP7quO5+UC8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFt/DX9T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F311BC4CEF1;
	Wed, 17 Dec 2025 00:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765933149;
	bh=y5XEBEIWWUyh9WzcFuiZ67dQvSpLSbsih6QYJAlLzNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fFt/DX9TopVxQer2We3yj8k7eBy2Y0JnIFbxed4PSUd+rmMYZ+vm7NmpHjeK//hWd
	 LXoaToRfWad3r0u7V+f0O+Ve4K7jkNQA9NIeyPgVuAGZ0mAohfr19m62T7wVGbnrgh
	 IyxZbC3gf7rRKsB/PYQ7L58x+WKcN40JoEfXGM224M94uAXakq9XkkXb4yUJriABER
	 I8rP3dVqtwMVpJROCYLNjWZ368Q2i9NJbaQuXYbGOI+rvDXH5oAYyPXnaF1DQupi07
	 m7J/u6O9dMQyBLuOIsyiyrt3+E0TCtkYAmSbi9KQgCWfxH4Xnqmd28zJekYel0jfEv
	 x5Sp881d2Cd6A==
Date: Tue, 16 Dec 2025 18:59:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Kapatrala Syed <akapatra@quicinc.com>, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hariram Purushothaman <hariramp@quicinc.com>,
	Vikram Sharma <quic_vikramsa@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2] media: dt-bindings: Correct camss VDDA PLL supply
 description
Message-ID: <176593314599.3464227.16503792061137156291.robh@kernel.org>
References: <20251213-docs-camss-fixes-v2-1-a8a4d4d51c6c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-docs-camss-fixes-v2-1-a8a4d4d51c6c@ixit.cz>


On Sat, 13 Dec 2025 10:19:31 +0100, David Heidelberg wrote:
> Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
> voltage from the description.
> 
> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Added only Fixes tag for the initial commit, not all the copy-paste
> propagated ones.
> ---
> Changes in v2:
> - Applied suggestion to clarify the description. (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz
> ---
>  Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


