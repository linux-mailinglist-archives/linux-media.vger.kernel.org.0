Return-Path: <linux-media+bounces-2405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F189812D44
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 11:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 461FE1F21AF8
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 10:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8608E3C480;
	Thu, 14 Dec 2023 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dPlxhpBa"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2921098;
	Thu, 14 Dec 2023 02:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702550702;
	bh=8MCgKlYjlQs8HPb4sZJqU1bsku1l/knsZYkBzx7U5Fg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dPlxhpBaW7ElU672KHJklTLQuGm3qI83NTgMS1/f5JeIt6eKtjVFvaFZ7P0w8yKGw
	 hRcHVnReHUclWo6Us016CB1TDKda3FVpql45MI8dMyul30+jlkFDXa8+BU6mNE9I/E
	 +O9eFOVAUC+ii9qp7Hx/wglOhGvN2PouJ6AbLpmmKCew2aBdor2mVAk61u64XiNFnY
	 ZbURT4XsbWC+LaIIKaKEuD0xqGyOYecryagUhj45gEAUyWCRDNES/iP9/oJOHq9Bp4
	 255la1tUig8oltvahsF3ahpNESGJikk21kjk0xtsE/ZEYeRR8vsM4BhHNq5TXHvhvX
	 ihS00YZvxAQwA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 64B5537814A4;
	Thu, 14 Dec 2023 10:45:01 +0000 (UTC)
Message-ID: <23255060-5a75-4cbe-9fde-f185fa958a6a@collabora.com>
Date: Thu, 14 Dec 2023 11:45:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: fix possible unbalanced PM
 counter
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com
References: <20231213122017.102100-1-eugen.hristev@collabora.com>
 <20231213122017.102100-2-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231213122017.102100-2-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 13/12/23 13:20, Eugen Hristev ha scritto:
> It is possible that mtk_vcodec_enc_pw_on fails, and in that scenario
> the PM counter is not incremented, and subsequent call to
> mtk_vcodec_enc_pw_off decrements the counter, leading to a PM imbalance.
> Fix by bailing out of venc_if_encode in the case when mtk_vcodec_enc_pw_on
> fails.
> 
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregnoòcollabora.com>



