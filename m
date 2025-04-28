Return-Path: <linux-media+bounces-31138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE06A9E8B8
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E69E4189BCAD
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 07:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260FB1DB34B;
	Mon, 28 Apr 2025 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAVHa/Pb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC2BBA34;
	Mon, 28 Apr 2025 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823678; cv=none; b=dzdnfRIgXGDieX8ktCV3KNt8R7YQpVDcrbvZJOieElCq0prz9zqy3sbnrsVVTm4S637Luw+MEjckVCCjKpBhmtg7Xfw4f6lR+tDByfkV2NgQS/IiMzRE7EckuYMgXOC4I5ZfKfJDOpBhouPTImrCCgRt4uQdIgbnyeGq7mb5cKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823678; c=relaxed/simple;
	bh=3kWcnczSy9PqVkb7D7BZRFCEGExRBTJJZ1RAYq2S0wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux5JW7t39LvBp70imlnCFJFnD4Ha+YHWuCtrpNkwJN6JLCqgBE3NUyt84fYtoDDC0fo94VD4ZJHkBEr15hjwA4qIP841VtEUzjVdhCY852ZfjSlUuCLiboJIfExySNe6cr5WMfT4jc4X7GX+69LXL4cD/w7I6kwE2zPnuTpxB/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAVHa/Pb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59775C4CEE4;
	Mon, 28 Apr 2025 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745823677;
	bh=3kWcnczSy9PqVkb7D7BZRFCEGExRBTJJZ1RAYq2S0wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAVHa/PbhnSOL50m/Ox3H2JFZOnDthqZy5wgNh1d/VTRwGiahXD6IW+bSUAw4Ruc/
	 dbT39t4Ack+U5dlRr/nkk7RFAsaSMCOl8xxnCudXu2ifXTN9Ovn4pL5YrctWU8adOo
	 RmNpQZ6WEJRD2/tPNPTQkn8ivP96YbhXhIiFbS3+ugyBk7d0DJQb8QreEZe/0aobEJ
	 /1+mjIZRAoWSRP4jlLXj1RcwxzpFu9i+cW+KcUJECZUuntH5njEnma4NW97EYKDY3r
	 QTY4FDs9sUOluGOPFA2YedLJvFPHEyjDEIdxhNeU2KWQjGd9w93H6/wsKtOavHkRI/
	 S1m7HCzMoSP0A==
Date: Mon, 28 Apr 2025 09:01:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Message-ID: <20250428-inescapable-smiling-oriole-bfbe3e@kuoka>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425085328.16929-1-kyrie.wu@mediatek.com>

On Fri, Apr 25, 2025 at 04:53:16PM GMT, Kyrie Wu wrote:
> This series adds support for mt8196 multi-hardwares jpeg enc & dec,
> by first adding mt8196 jpegdec and jpegenc compatible to install
> kernel driver. Add smmu setting to support smmu and iommu at the
> same time.
> Secondly refactor buffer and clock setting to support multi-hw jpeg
> working.
> Lastly, fix some bugs, including resolution change handleing, stop
> streaming sw flow and others.
> 
> This series has been tested with MT8196 tast test.
> Encoding and decoding worked for this chip.
> 
> Patches 1-3 Adds jpeg encoder and decoder compatible.
> Patches 4 add jpeg smmu sid setting.
> Patches 5 fix jpeg hw count setting to support different chips.
> Patches 6 refactor jpeg buffer payload setting to handle buffer
> size bug while resolution changed.
> Patches 7 reconstruct jpeg dst buffer layout.
> Patches 8 fix multi-core stop streaming flow
> Patches 9 refactor multi-core clk suspend/resume setting
> Patches 10 fix decoding buffer number setting timing issue
> Patches 11 refactor decoding resolution change operation
> Patches 12 fix remove buffer operation
> 
> ---
> This series patches dependent on:
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250424090824.5309-1-jianhua.lin@mediatek.com/
> 
> Changes compared with v2:
> --refactor smmu sid setting function interface
> --Some modifications for patch v2's review comments.

This is very vague. What exactly changed.

> 
> Changes compared with v1:
> --refine jpeg dt-bindings for MT8196

This tells me nothing.

Best regards,
Krzysztof


