Return-Path: <linux-media+bounces-49597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E0CDFB1F
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 13:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 287883008D51
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935093314D3;
	Sat, 27 Dec 2025 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/XDgj5W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1232FA1E;
	Sat, 27 Dec 2025 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838781; cv=none; b=KsP0BIV3e5Zl1qJT8GrXSyR36xcckNwQclTpj4Mc+o7bn6nQUdZ5v/C/Qb/lMRZnBhrbYqMvZVn9W4LfaaJ4sQfoFGxpBr0hBcnC9xcbjPC9tcAkLkk5CmSy/twXJgIwxx1Y3lyfgSy3tCqvEXK+yk0+ifrUltCEycguDYRkZzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838781; c=relaxed/simple;
	bh=8ehUF8iI3V2JVPJRE2KySeqarSaCv7UrkDB5YzapNqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVC7Ix1OXubM0491cMQJy6N5aTfGOiqwZfaAhfMZFmbTFBdY2BSv+aXAYa+1mENTwCmXXj0q3xut+Tzv6+O5146Y8ksGXUQ7Tf3nhDScq9hyC4fz5TaomNdFwOPhp+G81XgBgUsEEK14IlwZlpf1YqDN1zre3CSwDYbaEWw/VZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/XDgj5W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0737C4CEF1;
	Sat, 27 Dec 2025 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766838779;
	bh=8ehUF8iI3V2JVPJRE2KySeqarSaCv7UrkDB5YzapNqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/XDgj5WaTbz4WrqV+IBoxhdV/NzmbYVJqpQqz2k2V84Qs8qK93nQpnYVwYbLOCKE
	 gtMN7tu+qfWbVpo4dT6t2rtMgffYBzuEMeU//nc37vWNO2vV69F9vPdDrlAIyIL3fx
	 TxfPRlRf8NxD3h5a6xxkymrKnM5Oaxm0IYQnU/z3gmKJOZid8sVMizdx2Ay/C8YKk2
	 nTHvcp9ZWOUVVeDTRWjh559fTiwaB1kJrmIF0/h6F31aKOLR4CbV9oRfP5gxDcgcas
	 9EmezOjTuXBNy9zk2U+2/15E46EyNtGav54xyh/CuvLVcGb7d4khHTZcbvO+NAWurw
	 a5SuYpab67xcw==
Date: Sat, 27 Dec 2025 13:32:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com
Subject: Re: [PATCH v2 3/4] dt-bindings: media: mediatek-jpeg-encoder: add
 MT8189 compatible string
Message-ID: <20251227-glittering-opalescent-caterpillar-3c24d8@quoll>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
 <20251224031721.9942-4-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224031721.9942-4-jianhua.lin@mediatek.com>

On Wed, Dec 24, 2025 at 11:17:20AM +0800, Jianhua Lin wrote:
> Compared to the previous generation IC, the MT8189 uses 34-bit iova
> address-space (16GB)  and requires a single clock configuration.
> Therefore, add "mediatek,mt8189-jpgenc" compatible to the binding document.
> Additionally, it corrects the inheritance for MT8188, aligning it

Two different issues. Don't mix them up. See submitting patches.

> with MT8189 due to their shared architecture and 34-bit iova address
> space (16GB) requirements.
> Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
> iova address-space (4GB), such as "mediatek,mtk-jpgenc". This mismatch
> results in an ABI break, as MT8188 cannot function correctly under
> the 32-bit iova address-space (4GB) configuration.
> 
> Key changes include:

How is this related to above?
> - Introducing "mediatek,mt8189-jpgenc" as a new compatible string to
>   represent the correct architecture.

Why are you repeating the same?

> - Updating MT8188 to inherit from MT8189, ensuring proper support for
>   34-bit iova address-space (16GB).
> - Add property "mediatek,larb" for MT8189 requirements.
> - Improved formatting for better readability and consistency.
> 
> These changes ensure that both MT8188 and MT8189 are correctly supported
> with the necessary 34-bit iova address-space (16GB), while maintaining
> compatibility with their shared architecture.

This is not a contest who writes the longest commit msg by repeating
obvious things.

> 
> Extensive internal review and testing have been conducted to validate
> these changes and ensure compliance with DT binding standards.

Really, no.

Best regards,
Krzysztof


