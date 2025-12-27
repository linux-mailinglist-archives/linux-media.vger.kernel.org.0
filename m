Return-Path: <linux-media+bounces-49598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F758CDFB2B
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 13:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7933012DD1
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F02339B47;
	Sat, 27 Dec 2025 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+2YMh68"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7031332FA1E;
	Sat, 27 Dec 2025 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838829; cv=none; b=C3gD+rHNpozReZlC4X9EH3YtFyx3tEU6Y3ZlvHLiCsvLH/3H6symRqHcbVvF+GM31bvB7ilhwD4hmGoei/6Tm6aI0A9bCStk5Peoun9TbDlPfjDFCEGsPtQB2I7Kr1p3dFsjKMLhdUqVx9wwLfXiWY4T5V1kC+Q3qthz6N1Ouqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838829; c=relaxed/simple;
	bh=8v2tz0JfK6WqVTLbRCNHBz2Yx1sDxVrIhMcSIbpqRvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sS4np836h7zYixwJnRijxZGdVfv5aU4pmd1AAWX4l3OGBB/gh1Ggt7zDL2HnZw438A5mHXssCw198BvGx9AW8Cm4zKpm18o1LjiS8ESzJzflzmRNPCnR4Hh5E2AjkSoG/jlEMigfLkprZH7BKfCiVVrkmUJ0y6r2nOy5QtDqN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+2YMh68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF26C4CEF1;
	Sat, 27 Dec 2025 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766838828;
	bh=8v2tz0JfK6WqVTLbRCNHBz2Yx1sDxVrIhMcSIbpqRvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+2YMh68LEqHknGT7FJBSeYImNH6oZ4QjdFPLuOJ3nmnc4xoYyBwnrGHW6/eBFfZ4
	 pqYXpPb9gr/xXzLk3x9DjtDTzg90Y+U03DWSdy5TIQ5EQgDv4olrwhjSh9QULbHJVJ
	 KfJhpgfCmO0fSzz+v9hghEQO/H0ir7KcWTmmiJBT4PRJ+2FKdEI1X2ZvJ/Phonht56
	 n6jRtEo+fifN808/PrA2SC5KDyvB29MFCayjhk0248wL3DV54kmOXjHNuczR+daQVp
	 Ho4Ik0kfhUmfSbkUVWP62+qO8SkTgvpNvPsZKBIRwA+6ssii+YEtlpDBu4G3N/jGvT
	 b4dgUlMdDYU7Q==
Date: Sat, 27 Dec 2025 13:33:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com
Subject: Re: [PATCH v2 2/4] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20251227-romantic-crystal-vole-4bb126@quoll>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
 <20251224031721.9942-3-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224031721.9942-3-jianhua.lin@mediatek.com>

On Wed, Dec 24, 2025 at 11:17:19AM +0800, Jianhua Lin wrote:
> Compared to the previous generation IC, the MT8189 uses 34-bit iova
> address-space (16GB) and requires a single clock configuration.
> Therefore, add "mediatek,mt8189-jpgdec" compatible to the binding document.
> Additionally, it corrects the inheritance for MT8188, aligning it
> with MT8189 due to their shared architecture and 34-bit iova address
> space (16GB) and singlesingle clock requirement.
> Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
> iova address-space (4GB), such as "mediatek,mt2701-jpgdec". This mismatch
> results in an ABI break, as MT8188 cannot function correctly under
> the 32-bit iova address-space (4GB) configuration.
> 
> Key changes include:
> - Introducing "mediatek,mt8189-jpgdec" as a new compatible string to
>   represent the correct architecture.
> - Updating MT8188 to inherit from MT8189, ensuring proper support for
>   34-bit iova address-space (16GB) and simplifying clock configuration.
> - Add property "mediatek,larb" for MT8189 requirements.
> - Improved formatting for better readability and consistency.
> 
> These changes ensure that both MT8188 and MT8189 are correctly supported
> with the necessary 34-bit iova address-space (16GB), while maintaining
> compatibility with their shared architecture.
> 
> Extensive internal review and testing have been conducted to validate
> these changes and ensure compliance with DT binding standards.

That's not even true. If you did extensive internal review, then people
would have tell you that you never mix fixes with new features in one
commit. Never, that's like basic rule.

Best regards,
Krzysztof


