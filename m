Return-Path: <linux-media+bounces-26257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8AA394AB
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EFBC188EA67
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 08:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168A422B8CA;
	Tue, 18 Feb 2025 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQRi2Vmv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1DA22AE4E;
	Tue, 18 Feb 2025 08:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866356; cv=none; b=NqwgpIsXtDiLcoLTrfzWTJ0y/y88qUr/0F8v6hosNues4/w0LjBU+4uF+dfulnLnZoHmtIwWyBbisZijJN9+JiK9vBcXBIlE67AWkXf8f+go3gzSuqsZ3EhLU+c4leLthWIOi7RLio1txXwu01Yna9nDW4ziwhPblKjiBEeSoFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866356; c=relaxed/simple;
	bh=m0uzICN3CTQeSUf/G77xR807tJo8YURiD8Lpz5F3ens=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALhYAajpM87eqijgFShBdMvC7GR2OcARH5nDWsx3ciW78498MsRDG1rJND8D/48D6MvtlNO8p2lgjlcI67qE0vpuCuzQFMffA9nDuM/MFojjM5R0bFEngAeQc/pNg73jlJH7+tGSRy/J9utWsuchl5U4DdKIb/ZrBV6DexYoonQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQRi2Vmv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52511C4CEE8;
	Tue, 18 Feb 2025 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739866356;
	bh=m0uzICN3CTQeSUf/G77xR807tJo8YURiD8Lpz5F3ens=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQRi2VmvFsxCUwDouh54xRwY0cY4kmYzRFK8LAGBUCczQ5U1izTJrDWOi6rz1KfUt
	 goxHiFMqd0AWPpsfvy+HJbCIBsBzEvMlVkm90Hn1Wu6nzQbTorNu8WcFIBAkm9B+HJ
	 nbG3WQ385KXyW9FZthjupNrV9+nm6jX5T1yDRGuY0gLKobJmvB1r55CMQt0yH4dOAd
	 9yjcdH8R6YIng+qM6PvycbzemR4koU2b8ltMNQg6/jAeUr4gFLTds1CaMoaBBtY0Tk
	 klNNYzDYu1BR/pBi1QGxcS8RIlzjmrd391OatYOmQm0ZQtaldWlsb8kDI6FdhI/xEL
	 3QlKkcPjc8I7A==
Date: Tue, 18 Feb 2025 09:12:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, 
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: mailbox: mediatek: Add support for
 MT8196 GCE mailbox
Message-ID: <20250218-cryptic-pompous-salmon-d816ea@krzk-bin>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-2-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218054405.2017918-2-jason-jh.lin@mediatek.com>

On Tue, Feb 18, 2025 at 01:41:46PM +0800, Jason-JH Lin wrote:
> Add the compatible name and iommus property for MT8196.
> 
> In MT8196, all command buffers allocated and used by the GCE device
> work with IOMMU.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


