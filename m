Return-Path: <linux-media+bounces-41995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 440A2B48CFD
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 14:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12BCD3AE74A
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE5F2FD1A3;
	Mon,  8 Sep 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HvgEiEVx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9512FC01D;
	Mon,  8 Sep 2025 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333461; cv=none; b=MfHqa3Ve8HyjSXYiKrNH9FDpDhEtzt3RVJZT0GLjTbe8AGn5+R0osZQmbKSJ153c5HAycHcx0jUCduQAomAdT0fs8q5hbN6oZlrW72XOn8Zyz2j0UGAKNlE0gpXKctDFHUrJdNSpGyuU3rvEuuU+eyHzF7enFLKpRFcITpPdFrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333461; c=relaxed/simple;
	bh=eA5IKwm86oh4IC1IXrQrqhzod5aEjDjQZFgET/xLfw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QM+PcnYSeCDg+Hg5qJ8+xgVhX4gnHDQEyDSUXUrBsvtx6PczWJdov5KV/r4LqkCX4NjavpFW2bFBW0NI4+Ju/2IkFBK7nci6pYWmeUsKFY73McP8NtHqO5dHMpvxTt2cm9IWbc/wGQHpDn9e8X7TkRINuvSoEX42nHzpaEWk9ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HvgEiEVx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757333457;
	bh=eA5IKwm86oh4IC1IXrQrqhzod5aEjDjQZFgET/xLfw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HvgEiEVxha2G4nrYPRMoeQJlBcWs8at9+NXvCVaPZtv2CB2svqxMXSqSskJ32glJF
	 CjMMFTIwdNUyKVDkDBzMLaKu1lWHHhRfzID5rakeRs6DDtKx7pW+RMhgIxmZDSlgai
	 nWqXObB9X8B9UUy3WyZsTLtBkk3akgoHSC/iK1FJ39tptv2eF4nhVPSXr7NWpqfPVc
	 bozlTu4kwTnxat9lImfqN7HGKaPlmOob+uB+DVQk4v1dCh+mFiVTYgqBt1aEadZSOK
	 YN9EUWoUdrPeXBTQ/7wpKPpDs78SOVO7Ul9/QiZf7bnMDt5RLEqjyKW9u+Kd42YC+R
	 uuCa2NDDN6bKg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 241BB17E00A6;
	Mon,  8 Sep 2025 14:10:57 +0200 (CEST)
Message-ID: <aded7865-870a-4ba6-82b8-459150b7d1c7@collabora.com>
Date: Mon, 8 Sep 2025 14:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] initialize vcodec scalar variable
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250907093557.8008-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250907093557.8008-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/09/25 11:35, Irui Wang ha scritto:
> Initialize vcodec structures:
> patch 1 add missing initialization to fix the encoder's UNINIT checker
> issue.
> 
> patch 2 converts memset() to = { } for other vcodec structures.
> 
> Changes in v3:
>   - Converts memset() to = { }
>   - Combined with Qianfeng's patch as v3
>   - Link to v2: https://patchwork.linuxtv.org/project/linux-media/patch/20250715081547.18076-1-irui.wang@mediatek.com/
>   - Link to Qianfeng's v1: https://patchwork.linuxtv.org/project/linux-media/patch/20250803135514.118892-1-rongqianfeng@vivo.com/
> 
> Changes in v2:
>   - Add Fixes tag, update commit message
>   - Remove unnecessary memset
>   - Move memset to before the first usage
> 
> 
> Irui Wang (1):
>    media: mediatek: encoder: Fix uninitialized scalar variable issue
> 
> Qianfeng Rong (1):
>    media: mediatek: vcodec: use = { } instead of memset()
> 
>   .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c    |  3 +--
>   .../mediatek/vcodec/decoder/vdec_vpu_if.c         | 12 ++++--------
>   .../mediatek/vcodec/encoder/mtk_vcodec_enc.c      | 12 +++++-------
>   .../mediatek/vcodec/encoder/venc_vpu_if.c         | 15 +++++----------
>   4 files changed, 15 insertions(+), 27 deletions(-)
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

