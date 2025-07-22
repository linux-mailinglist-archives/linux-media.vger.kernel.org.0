Return-Path: <linux-media+bounces-38196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E2FB0D2F4
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 09:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D5B956272C
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E0B2D2389;
	Tue, 22 Jul 2025 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMPjpfp2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47031A29A;
	Tue, 22 Jul 2025 07:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169145; cv=none; b=CgfiSrq/BNmIf0WN/CocD0ZjHLOXgLxwbvH6LVh9jAqGgfzPXrYe9N7lFFyZA2MSrOXFcVRHI055klAxGDhg0as993i/LROfofYDTOkx4bOkpjQ/5K4OnFA3Ket7oY/WM5+5wbjDOWmxUfH3k5cRYQMfEhbx7szf8JMDvr+FYgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169145; c=relaxed/simple;
	bh=Z9xJCIyBbmbt70/7krlXdDXHbbW5MUVXqLDthWupuHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obNWhr7nNEKnIWRQE37MY+GmWFqg7r1wnalRHw7c3LLlE3UvOc3UKzXA1jt2vetRzLjrievjJAciDx1WDZh7T5lRZIcSnaon9TUKCPmWR01X4UgR4l4wrZyVwRY8tmOoen995O+paMQKblO3drfIT45I+9vsgObfMzZe1AcV12o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMPjpfp2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10989C4CEEB;
	Tue, 22 Jul 2025 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753169145;
	bh=Z9xJCIyBbmbt70/7krlXdDXHbbW5MUVXqLDthWupuHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMPjpfp2OWAqia2a5IeLgdD3yLlUpfmkdNF6/xmTW2HALSfpJuvYIXoYGrniaGuF/
	 zLkmC50vG36UFMRinuxw4nOWVqimT+EXZH3B2pNDK2mKi1qqdevRH6PD4AgA3evM75
	 ruYawulIvwrijJBjqXUu12yl8S2+IYPxPHaeRxJpITw5zda+LGVYlUpHq7Gx9K5MH5
	 x/i15MFJyn0Q8LQEFkzMC4sPjxjJHJrxEzDgMDlNb5zEeGxXpqOTzvXwFEh9HPSpLN
	 tGR4tnEeSPTYQ06zXm6ImwYCtU0m0+zzy/rhtTco3mjRsQG6BaEuGrfXE7UPN5YOJg
	 4JgtAxlVwCiFQ==
Date: Tue, 22 Jul 2025 09:25:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Message-ID: <20250722-sly-sparkling-kangaroo-6ab9ed@kuoka>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
 <20250721105520.5625-2-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721105520.5625-2-kyrie.wu@mediatek.com>

On Mon, Jul 21, 2025 at 06:55:13PM +0800, Kyrie Wu wrote:
> Add compatible for video decoder on MT8189 platform, which is a
> pure single core architecture.

Looks compatible with existing ones and nothing in commit msg explains
why it was not made compatible. Describe the hardware, say something
useful to avoid such questions.

Best regards,
Krzysztof


