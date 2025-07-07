Return-Path: <linux-media+bounces-36938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 348ACAFAB37
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B66F17A175
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 05:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14E8274B56;
	Mon,  7 Jul 2025 05:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiN2X4Ib"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E42264CA;
	Mon,  7 Jul 2025 05:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867297; cv=none; b=UG7UoG5BpZM1270fW1kLu0m3LVLgUdpyBxflzMtUSL++kcM6JkO10ebwZHFJMCogv4CsHpXX1Qyf5e4ekMAULM/RhZE6qjhpRu487e/nPuh8YN24R3q+lKF3t42X/yh4fdGhYaFRYPfxbX5GjxifqL4mDtrJV6AF95s2PR00k/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867297; c=relaxed/simple;
	bh=z9QN/N6kVsbMUbthlPPWA6t1axlzGJzBvA+FmlSX6dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyLM+beO1OojHADe/UpPKSOg4X0GxvqVNI0QTkBBYdxOBL6U/p0in2tHOCz+Uc0UQdZsqnlinfvZ8ad5ATTFq0UG/5hhrstReYUg/ytE5p3Jf8eX2GJQGwt5hddlLaRolh5mWKvnjhncSiN8b9ZVhv3TdtWaNKZ46erbZY4Vg88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiN2X4Ib; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAE0C4CEF5;
	Mon,  7 Jul 2025 05:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867296;
	bh=z9QN/N6kVsbMUbthlPPWA6t1axlzGJzBvA+FmlSX6dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HiN2X4IbQMeCVFIN1EgzFwjzH6PHJWykCp4CPCcUiCBdjfaR9tKeBzT8JCaMPeEQZ
	 UJZLeAFSPfiuwfRZQ8g8epxpxJ+yMgUlqNI2Bk8wEfcOYhS+C8IKLJCi/Q6vQPkj0P
	 OhPQoWGI3VBJNpK/XDVosYT4m8BIvCE18EKQX9GuUhyVg6VFroW0SvOg/PD89Fl0qJ
	 j+ao529CPlRJLzlT47K6WX8Ste2z/iq+gxO2kBAA7GS6k5tf2j4ZOnu+ENqyqwmafz
	 G8JaQMMz/vQL7fFMr6TH7Oc1PmYhLOZHzyc/R1HN7i61XepWAJDxYZsbAkjU0UURcP
	 0PvOlaXwIdxMw==
Date: Mon, 7 Jul 2025 07:48:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 03/13] dt-bindings: media: mediatek: add cam-raw
 binding
Message-ID: <20250707-crazy-loon-of-refinement-feef9e@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-4-shangyao.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-4-shangyao.lin@mediatek.com>

On Mon, Jul 07, 2025 at 09:31:44AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-raw.yaml
>   - Various fixes per review comments

Which fixes? This is way too vague, considering how buggy and poor this
code is. Where was v1 of this?

Best regards,
Krzysztof


