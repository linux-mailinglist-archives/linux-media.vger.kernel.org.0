Return-Path: <linux-media+bounces-23183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A052E9EC94D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42F0F2815B1
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A22D1C2443;
	Wed, 11 Dec 2024 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtAXYuje"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FFE236F86;
	Wed, 11 Dec 2024 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909956; cv=none; b=Cbf5xcW7jf0N5gLOf/zYP7X3t8B4sihvNzMR/9m10Ezq37LylLyn5x0sSOoUL6mClRZnhyiCgOmp/SPvvYkfuRr9O0nzgmDADQTN93qoQelOWwtGfGjV6mJ8GLlJz21IH7EKIF3b8NGFYwQOiqvneayzXi67HkYWD6ACOidArL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909956; c=relaxed/simple;
	bh=CSDhiOEmbfrkwtGpS8rSLIKuetIToYhzF+eZR29YgAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCILP2lAt31qE+0xfpEqtVEhs7t0sCjyC1rzYIhEXkxEAfx2F2B6X3BsxuTXlu3WoWT1X07eN41nEXOmq3CpG49xvvO4Lm2KGGEXKbrdKMMNpPpf0LdCTxRHS8X4lubiMkwsuZySfb9uFk/DVxZDahWjznhjcww6gkv1VD1Arg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtAXYuje; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FD0C4CED2;
	Wed, 11 Dec 2024 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909956;
	bh=CSDhiOEmbfrkwtGpS8rSLIKuetIToYhzF+eZR29YgAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtAXYuje0C0W2XsEKYln45lBU/EFfMLyJZqXQmHotXtIwH27nE4f0HZBJlpUs4D8m
	 7lcuS70CTinpynbUtwW5HEJoQ1yZ4WAAL134eDLuXdEOgobZcSiQrPzqwmNOv1Xp1W
	 XQsOKSo3GsSoVSRhaZoVb9D11MJhEmleTLCRzbzDk9JNE9egOHimNP4/0IXiOplxCs
	 dDS9mMw9TI+88mDzdk3qrJ0FaEe95qXFd6Bzvsd+BjcFKSJjxyw2Om70/wT6uCGizp
	 yW30CeMS3HTD7cWWxfwYPvZZ+dB9NjLKwASqxUDnS5XLC188u0ONd7gmhIV3Mpe0Bm
	 GaMAI7SaSecyQ==
Date: Wed, 11 Dec 2024 10:39:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 2/8] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Message-ID: <yhfxpflyumevs66sdwgiiyuablpfxfxw3e7ybrxju7ssicmnu5@truuiuvxlq6e>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
 <20241211032256.28494-3-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-3-jason-jh.lin@mediatek.com>

On Wed, Dec 11, 2024 at 11:22:50AM +0800, Jason-JH.Lin wrote:
> Add compatible name and iommus property for MT8196.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)

Headers are never separate from the bindings patch...

And you reveived exactly the same comments before which you just
ignored.

NAK.

Best regards,
Krzysztof


