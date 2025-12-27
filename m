Return-Path: <linux-media+bounces-49599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5A3CDFB34
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 13:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6305A300DA6B
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A130333A000;
	Sat, 27 Dec 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O46vvCR9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCB3126C7;
	Sat, 27 Dec 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838873; cv=none; b=M3piWSqlU/U3GzYh7iE0cFmNm+4d83fCJGMoZ4lpOGR5GrXrC1YVKMWbf6j9DBlsVSCQx6XCfIfs+KqxUCV3snyLgu0KaCOeFKIDeSVDoMohLPxq+MtXvbtyc1+8AY+gD5mC9+JQCMLDxN9rGA0G+rC3ib6Ox7vYImFufi8/LdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838873; c=relaxed/simple;
	bh=6HCYp3y/LUjuszjlwAsie3ZUZ6lnUVx7wWALthdwp+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S76BUkGDwO5cDe8b55jeNqXvVVvEecnKkOezdbYVsysZJrE5/cnGXziZ8JblhaXGZjQBjtdBsOy7gvGi2RbUofpNHC8klj2NXVR6e+svBWAdL/P8FpQQrqNm8F8V5utpLYRmCfHgEd8UUzPVxZgMhDYpQTy8rb5Of7h6fiiyQYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O46vvCR9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACC0C4CEF1;
	Sat, 27 Dec 2025 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766838872;
	bh=6HCYp3y/LUjuszjlwAsie3ZUZ6lnUVx7wWALthdwp+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O46vvCR92jmq8E3o4O8MlM/MtC7tWTTqila3KaTLQCJyGNRiTX+BpXbvRjGA4kHrv
	 mXCeaLHX0uIdESJs1qBz7uJLe+IP6qPK62v1P+8CKzaG/fVjrJsgA1CFg8CGIvEYvx
	 AYO5monP/di7bk+oOE1MOzQLdWdzfFhbpeqNkU6qu+Npv7+zp1DCvHfcpEJ+UAZPM9
	 7JumHN3gpyYIm23Wb275g449wOeXCfBt0gu+3SePp8vEgVs3tRCgNKSrh6lV8Auzw5
	 o/ZhFBgy08ZbCs6YMBQMVwoRJoI7T4a25rMGaIbzwvJaGrxVemwIJfzk3NYqXAM4a/
	 MV4S6GwCRhLKg==
Date: Sat, 27 Dec 2025 13:34:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com
Subject: Re: [PATCH v2 1/4] arm64: dts: mt8188: update JPEG encoder/decoder
 compatible
Message-ID: <20251227-overjoyed-illustrious-snail-9323e9@quoll>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
 <20251224031721.9942-2-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224031721.9942-2-jianhua.lin@mediatek.com>

On Wed, Dec 24, 2025 at 11:17:18AM +0800, Jianhua Lin wrote:
> The JPEG encoder and decoder of MT8188 share the same architecture
> and features as those of MT8189, both use a 34-bit iova
> address-space (16GB) and a single clock configuration.
> 
> Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
> iova address-space (4GB), such as "mediatek,mt2701-jpgdec" and
> "mediatek,mtk-jpgenc". This mismatch results in an ABI break,

How this mismatch can result in ABI break?

> as MT8188 cannot function correctly under the 32-bit iova
> address-space (4GB) configuration.

Do you understand what is an ABI break? This commit is the ABI break.

Best regards,
Krzysztof


