Return-Path: <linux-media+bounces-45016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1FBF0659
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7F96134B1D3
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9104A2F7AC5;
	Mon, 20 Oct 2025 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HoJ9JA6o"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57C2F6582;
	Mon, 20 Oct 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954672; cv=none; b=rzSPhS/N3CTVLIvT5p0oPcHJmcH5NolEkU6FKALxcZ4cfcBNHCistd3j01j5PGOKpxagaWtXYK50oZ+h46uln0HwiRRRBaOYbmaP4Ila1QywOMgS09ndy/fU8F7/xnrBfLfIp0t98B+uKCLJRz+D09M/Gy9dfmaWGpug7hr7YUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954672; c=relaxed/simple;
	bh=IV+xFbIFU0tK2tXhub1pHDb9c/lzEMIQDMPHcmWu09Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HslmDCh+KKRqaeYX0ZJ5dSVlUE1H2yZDAhX9HwOHrVww6uHhGKH8YAtyRoRLS8dfsCZdHS7gK9VK3wI54H9iLpvPj4U9pKZhZzynoCOKzS0weXg2KE4Q1K7py/QPmcKUNQym42V6Qzg01iMbCwzvD7DlM+CxhG27bAGzx1IunBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HoJ9JA6o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954669;
	bh=IV+xFbIFU0tK2tXhub1pHDb9c/lzEMIQDMPHcmWu09Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HoJ9JA6omdS7lMAhbjAEXaISHRoSK3MfmK2nKyNOjLq65oRSL2dA7fyDZeYqiUDw2
	 mJTa+ai1jhseUueMTKXpEUQlm7pauO12zVU7c+SIHC7QStIfpJZunQaBnwZs7v+Vay
	 I1nmVMhNfs1hp/SdRmIJJhWBlGyUHUK6jPA3LRE5JXJgH20IeiaNQkmDnp4N5woFdQ
	 WUZDKTLt07s/KJYIQ0A2gn9id/yY5BOOmzCGqrm1iyNzdfs7wE6phxnFNIeaP/urDW
	 Pex+bYGsi1NA1EvtPHoZvIbz8IOu1YgocDV3oBVLZHDUvrvnd+03+AFq8+BleeuUWB
	 ZG467KK8/EIjA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BACAA17E13A5;
	Mon, 20 Oct 2025 12:04:28 +0200 (CEST)
Message-ID: <def12c6b-94ef-465b-94ec-2144464e4ff3@collabora.com>
Date: Mon, 20 Oct 2025 12:04:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/20] media: platform: mtk-mdp3: Use
 cmdq_pkt_jump_rel() without shift_pa
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-18-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-18-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> With the removal of the shift_pa parameter, cmdq_pkt_jump_rel_temp()
> can be replaced by the new cmdq_pkt_jump_rel() without shift_pa.
> 
> Then, remove the cmdq_shift_pa variable in the mdp_dev structure for
> each mbox client.
> 
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



