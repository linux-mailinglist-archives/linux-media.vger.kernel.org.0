Return-Path: <linux-media+bounces-45013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B368BF0674
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA1A3A8326
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183562F617E;
	Mon, 20 Oct 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UIJLHvH2"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966FE1D7E42;
	Mon, 20 Oct 2025 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954669; cv=none; b=jTFRC5gu7iOSPM8tQ0TCfSFGV3+r32MVXkiMUC2rTYujeLGj28QxsyaM5r6EQZTR5W4CExtB1Hu2fsqx8kFThmEukihG51R249b/XD2gTrmvaXcVSsk2VWPJZsrOKox1eD0JxUB09hm+yzcfkyukjWVOS9/3K2sp4pluAXlih8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954669; c=relaxed/simple;
	bh=dvZ8bfGnbZO2NRCAIBX8BuUMCdu45We+toYTCgYJlU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7+bj+kw2PcfptIVHvrvnFgn8C14o5KPL7mVopMWWUMLc/qe+SsInt41IMqeajx9xebD4XTKzi/U0YfhevYt9Y35ig1tVwWouSrJNLsaxu3ARF52/UT8wu/qj8tzgZR84K0+55uvb3reAmhhwTnbB033RtXb0O4AJ9lrJwpqYDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UIJLHvH2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954665;
	bh=dvZ8bfGnbZO2NRCAIBX8BuUMCdu45We+toYTCgYJlU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UIJLHvH2ugD4Q5kVNdA3RiMXkg9uBwJ9IRPs6Y/M/cDPN1L8vfpoGlhRM+jwoZwRm
	 qc8Nf8dlC4pceHHMz7UGg7dtgeBwPv3tEpiuulq/PW+N+RdqFi4GLHeDOtwDr5APcm
	 o446RXh0kM4lZfV+NgjemI7zu0H446cZBZwsq/dn2baQzudIlfzzOR/sSeiVN8vmVH
	 +sb4hG9PjV2S6FW8WWRolfkvpqkfpExqhFsR9oUPXztISVqWgBkzPONrkF7lkAjzmM
	 3jGLJvg6iDNidNQL8KHHn8uN7WQt9rkxZI5stGvKaNzOp6mfw7BzE7fz5tLAauh333
	 vyWlaK3zTmcUg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B534517E108C;
	Mon, 20 Oct 2025 12:04:24 +0200 (CEST)
Message-ID: <a624e724-4f29-4d9b-ac13-eca387867805@collabora.com>
Date: Mon, 20 Oct 2025 12:04:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 19/20] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write()
 and cmdq_pkt_write_mask()
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
 <20251017065028.1676930-20-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-20-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> The original cmdq_pkt_write() and cmdq_pkt_write_mask() only supported
> generating GCE instructions with subsys ID. They have been replaced by
> cmdq_pkt_write_pa(), cmdq_pkt_write_subsys(), cmdq_pkt_write_mask_pa()
> and cmdq_pkt_write_mask_subsys().
> 
> These 2 functions can now be removed as they are no longer in use.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


