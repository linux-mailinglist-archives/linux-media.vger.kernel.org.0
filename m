Return-Path: <linux-media+bounces-42956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD077B921D6
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 18:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C538E18981C7
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 16:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC0431079B;
	Mon, 22 Sep 2025 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Okdk4HLp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D1E31064A;
	Mon, 22 Sep 2025 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557004; cv=none; b=GH+HscK0H8DfY05Ksh+i8w7drjSBdmzlmBebGJm0UzPDzYGtwKi2m/dgIrwBiNWanGjMaWhkFwUeGfDIEXTzyXycMdqJtupYd5F/YxwfvvBEL5QZ0ArKvoeo1PtPGOCHgnEjIFh9y/oNwkq4vHHNRcZEKRjBrlMFlxqgcfLVFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557004; c=relaxed/simple;
	bh=SBGcHxTA1qXpjYcMN2XvPCz4NeeP4t9w4dEm7rTj6mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2qgeXoStKx7wIOIFvKYzdOBhGX/6BwoLfVKQII+wdKTkGcnhk5FAiNkxGqY0RpIhtl3qpEa8E2gOWDXiirD95NbWqkxkzqLquUYrXwA79n/oM35V/+mrC7MvmD5oDJkd4oO8GKi0rN8tFUZ3RxTNFBnTe8+UxPA8rMW8JvBqIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Okdk4HLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05220C4CEF0;
	Mon, 22 Sep 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557003;
	bh=SBGcHxTA1qXpjYcMN2XvPCz4NeeP4t9w4dEm7rTj6mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Okdk4HLpW7Kmoxgxc97pQ2qYlroVJ/LR1qBFjpayn3uKBBhgY65vvD5163oCK9WgH
	 hpHrSkjmcc6hzLlajkdmPSJiDTq44kQzw2/jZaHLba2rTWEEGCydLFy3QhKZsN4ZXC
	 Vjq5Ly2WbORSmmMberQB7tT42jTifK/WO50CloeJ4LpSZQlrN36/p8u3IWvu+PYGpd
	 llpAF5PGvW4gn7LbQwItU6acJSa2UjKBpARczJa4qmhZzuKQMUc3+BOK7LMSX1Vem+
	 0qd5B/8DFOZw9mtOdBWfi1YR0BQu0XbhSvy8gY/Iv74JmQcN+kHjIhg3QdmldLL/mb
	 6D94AhDK7WiNw==
Date: Mon, 22 Sep 2025 11:03:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	George Sun <george.sun@mediatek.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Message-ID: <175855699590.126634.9163224835580363424.robh@kernel.org>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-2-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915091958.31509-2-kyrie.wu@mediatek.com>


On Mon, 15 Sep 2025 17:19:51 +0800, Kyrie Wu wrote:
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. At the same time, the decoder supports the vp9
> decoding protocol for the first time in single IC.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


