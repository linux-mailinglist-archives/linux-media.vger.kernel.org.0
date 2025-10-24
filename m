Return-Path: <linux-media+bounces-45522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD9DC06745
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 15:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BE173B9C55
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4057331CA6A;
	Fri, 24 Oct 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZtXvucm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F25309EF0;
	Fri, 24 Oct 2025 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311832; cv=none; b=U9xdH8s+6Y1V6EfhKv1Ph+FrWHMt/txLBVw75XuePYrwwo0sG3OnLhoDpJwwaxAOsYLV2e9Ltpx5C/Q/oBNVdaHLU4DTccPrKACCx+dSQArp3Th0eGnd4F1ybiHr6kRLvB/WseLFUDCVeSpvScIDM45J3w3aw3WKGFNt/VRcZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311832; c=relaxed/simple;
	bh=A2BnR2YHSryVqsKA9P+YQyFmh/9l8BRKmmWfe/NlsaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ja9OWPQTNq73U6+GhlHmlNkOBA9j1Exr7yYpyIlpmMayYfx1kt4QEkOn6VnBzPXOIsfJMySpJNGt87o5SgGEJoqwJCUaoaEinebdu1QHDR/ftWYkeOwml39dchfkB2E0Y+7DuQJyB4TSYJ5zqNFPQW/5aINNh5s2yx8QFMphQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZtXvucm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA46BC4CEF1;
	Fri, 24 Oct 2025 13:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761311832;
	bh=A2BnR2YHSryVqsKA9P+YQyFmh/9l8BRKmmWfe/NlsaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZtXvucm/CfsW7ZEu9pDdtzSjZjO5nS5yODdFkvQeRrlKFUKNtzshAe7d0sflUwTy
	 wmMAsC3Q/5aspelec9kXuFJC8WY8P1zDgKS8uNTWZFIKGPBatu1IjmhEt6oBILk1cu
	 CR1ZubmRc6Frirymaa1FDOREXiQXlH/67KI4Iyt+UF7e6Ay0F0H1I4VOyM2kkMGCzX
	 WIYBVY7gi5SQdBo4v/6kTn5ut0Siw6V84sdLKa6GnP9W/SF3RPT2v6d8yKkgseEn3L
	 QUyeXJxcDbLwlwse1OvnqYF/2F5ThD7UID+ak3DWfxbhkw0G2MIh8AH6gsXb93oDLq
	 4yeu1u+XB2H4Q==
Date: Fri, 24 Oct 2025 08:17:10 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org, houlong.wei@mediatek.com, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v3] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
Message-ID: <20251024131710.GA1563195-robh@kernel.org>
References: <20251001183115.83111-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001183115.83111-1-ariel.dalessandro@collabora.com>

On Wed, Oct 01, 2025 at 03:31:15PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
> Path to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>  .../bindings/media/mediatek-mdp.txt           |  96 ----------
>  2 files changed, 169 insertions(+), 96 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt

Since the media folks haven't picked this up yet, I applied it.

I hope to see some more Mediatek fixes this cycle.

Rob

