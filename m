Return-Path: <linux-media+bounces-17239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC76966A91
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B571BB20D5E
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5ADC1BE840;
	Fri, 30 Aug 2024 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l1gTFH/0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FD166F0D;
	Fri, 30 Aug 2024 20:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725049947; cv=none; b=pCGKlDtG+oL7xXZSYJR/loIHqPIQ1FGqisYC9Xvaa8NSLcTRD+Qg2ifq6WwaSWMY6vzEGYPQnrZcjwQ0smHY2Syl8puuVDkepDB80JCnsrDGyi3mR5DwZPoIBf1t+QtAbVoJADjCFfCTxAF6ZlmbwANU1/jVIvjlyX9yYa+h4IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725049947; c=relaxed/simple;
	bh=rOtkussEVvEtJaYYLqRR1742JXpbhS+YhqlnswW9ZG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnLCtmBYr5alktwGObTsJN5aIVSWTt7fcBVRDyP/YJp/Cju1J2jigjMBc5Eqlcp94brxanaOrrA7rIotU8RrDX20Rnhm3+0ISqmtgnkUEeuGIlTydSl5Cqv2AVmc1QWFheHVLOkc1A7UoYgnOs7OAfIYU4Ff4djUHPxR1m4kgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l1gTFH/0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725049943;
	bh=rOtkussEVvEtJaYYLqRR1742JXpbhS+YhqlnswW9ZG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1gTFH/043LrvIs3MAkQBN3SS90BvwS3PZwIsSVvAt841aCoqoEpMc7aFPtO7AW1d
	 EwxHd+cBGOUuHl25xHzE4Uy2jzmDNPTulvRK8mo/gCrEhiI77vuu4MwDakXCPXzY9y
	 hCw4Tshns0hj6Xy+Tw+XkZwSlCxGK/PJH4Go/aX1Y9C0tQh6hMmNMDSIJKlvk2fi47
	 4HnFcMCjhwwH4eQFuqP3b2giom53ZFykytaVA+7vRtkMxs9tdKSYaCEtXzdU1MYXRb
	 IZ1dhBVg2qePGDmC4EshaD8jMQ/ARgcSmf28iNda3Jfj+Bw7j0cQ0z2rAmbuaCSeWL
	 JWUNJaSINFxqg==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34D2D17E121B;
	Fri, 30 Aug 2024 22:32:22 +0200 (CEST)
Date: Fri, 30 Aug 2024 16:32:20 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 5/5] soc: mediatek: cmdq: Remove cmdq_pkt_finalize()
 helper function
Message-ID: <7a5a4d9f-f22f-433a-87a3-7df7ae4f8cd3@notapiano>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
 <20240810090918.7457-6-chunkuang.hu@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240810090918.7457-6-chunkuang.hu@kernel.org>

On Sat, Aug 10, 2024 at 09:09:18AM +0000, Chun-Kuang Hu wrote:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().

This commit description doesn't match what you're doing. What about

Now that all occurrences of cmdq_pkt_finalize() have been switched to
cmdq_pkt_eoc() and cmdq_pkt_jump_rel() for more fine-grained control, remove
cmdq_pkt_finalize().

> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

