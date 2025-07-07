Return-Path: <linux-media+bounces-36935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5960AFAB28
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCDA7189DAD9
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 05:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C787275AE0;
	Mon,  7 Jul 2025 05:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYcuETOe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259113AF2;
	Mon,  7 Jul 2025 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751866958; cv=none; b=NsW3JKLM0g7Q1wtNimIrr6ykkhstAoL14kaWJVeDSTrj4ewqqF3MIwwQ8UEYaqLaIG9tqJCR4ochKbrIBNg2WF3GRDJxCDZbUXQ0ujCazl8aIqabMr1XWShsW7avWVEex+GaELEhjBhfLY/Rvk+jGNwDPWckfZtFAhl2+Vr8P8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751866958; c=relaxed/simple;
	bh=DYxEwke6KQfAip5v2Jtz2Vpn6CF/js+HUrRQ9qzGcvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uREGpSE+d+Joh6l9OYW12UUkhvGsP7zrlFjFsX6i+ByY2Yrs/iAJaJO7oBp1jKNZgyMzSO4Zcc7P3wfLYdqZkzjp9uCgf4EKVT5FQT4d9zop4hkaTRDNT+KyndK048MvLY9E22n+iVqY8FxdmCUT6JEii6RsRcRusem7yZg0Nio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYcuETOe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA5EC4CEF4;
	Mon,  7 Jul 2025 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751866958;
	bh=DYxEwke6KQfAip5v2Jtz2Vpn6CF/js+HUrRQ9qzGcvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYcuETOeDFCBCzio5Luj3iLUeQLKqO/4YJ1FYL51lb8F6z4FScS+B5tMnBlkGb9yP
	 5Mpfej0WC0NLKucQ356U0gDdjukScfT9PYSkMWfSwx4gZncxmpOCjHoNJg61j0NWsO
	 aAGd4L5BUsSj57XbmIzaW/1O9ZArSNS6czEXW6URDSIi/cJ44ylnOBp1EYe5Lv7Rh8
	 lp1v2kAYD6dsgyz3FvizlRcsBl/I0FJLiKvJjMVl+/v1vJqRYIzJZUrqI9NVHVezBL
	 9PSM4lSFImsSeG/Yd3d7I6xw2wUTLhPwWxagCH/XScIHGIJI/WZ76JEhntsIZ9Y2W8
	 UnJ/ARQ9SWzRA==
Date: Mon, 7 Jul 2025 07:42:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 01/13] dt-bindings: media: mediatek: add camisp binding
Message-ID: <20250707-amazing-catfish-of-reward-f4c5ba@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-2-shangyao.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-2-shangyao.lin@mediatek.com>

On Mon, Jul 07, 2025 at 09:31:42AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.

Missing SoB, missing checkpatch.

> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-camisp.yaml
>   - Split bindings into four separate patches (one per YAML file)
>   - Various fixes per review comments
>   - Update maintainers list
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>

Apply this patch and see by yourself.

This wasn't tested either, so I will skip review.

Best regards,
Krzysztof


