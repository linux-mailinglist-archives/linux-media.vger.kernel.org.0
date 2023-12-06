Return-Path: <linux-media+bounces-1737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5ED806BC3
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 11:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6576C1C20F3F
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 10:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913FD1A29C;
	Wed,  6 Dec 2023 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LZw1QPHb"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E92FA;
	Wed,  6 Dec 2023 02:19:37 -0800 (PST)
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB2EF660732A;
	Wed,  6 Dec 2023 10:19:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701857975;
	bh=UIy6Wcqp5kGevxZ+Hlaa9ohz+boVqoC9hBiFx+0skE8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LZw1QPHbwHNH02hOUzhaAEEcCznJHI2Kccpc0j+0vxUhqn2EB2YTd5Jbjhk6mVg9Z
	 gAXkyxL9euyUl4jiueoQqpvhXTEJW3uzC0hF+G4lj8WUB5IXpo1U0KBdU1plfLfbvr
	 jTvzqJboeY/EywwNiPMFg0dzYZ4XNlOkJmOfQFbHXPQ+49OX+4ikX4osHH47lKtNF+
	 9nCGDSAfLobENWjskTqJTsnIuD/9F4Tt7Q2DjMimyz2vegEhvg5rGm5vyuDd7Zp0JP
	 MzjL/nijM5NUkgrogipZ8BvrKAl3Fkbu+Zpm1YBq+bTln+/TT6b1U+vCd/B9BcsxoT
	 qYWzxupVCjIMA==
Message-ID: <6c693161-0e89-4f9d-9a92-18f3783eefd2@collabora.com>
Date: Wed, 6 Dec 2023 11:19:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Fix mtk_vcodec_mem_free()
 error log criteria
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231113123049.4117280-1-fshao@chromium.org>
 <20231113123049.4117280-4-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231113123049.4117280-4-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/11/23 13:26, Fei Shao ha scritto:
> mtk_vcodec_mem_free() shouldn't print error if the target DMA buffer has
> never been allocated or was freed properly in the previous call. That
> makes log confusing.
> 
> Update the error path to print log only when the caller attempts to free
> nonzero-size buffer with VA being NULL, which indicates something indeed
> went wrong.
> 
> This brings another benefit that the callers no more need to check
> mem->va explicitly to avoid the error, which can make the code more
> compact and neat.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

I think that this error is supposed to catch two issues in one:
  - We're called to free no memory (something that does make no sense),
    this may happen for example when calling xxx_free() twice, and it
    is a mistake that *must* be fixed;
  - We're failing to free memory for real (which you covered)

....that said, I think that if you want to clarify the error messages
in this function, it should look something like this:

if (!mem->va) {
	mtk_v4l2_err(plat_dev, "%s: Tried to free a NULL VA", __func__);
	if (mem->size)
		mtk_v4l2_err(plat_dev, "Failed to free %lu bytes", mem->size);
	return;
}

Cheers,
Angelo


