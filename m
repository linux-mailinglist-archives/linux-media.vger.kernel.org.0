Return-Path: <linux-media+bounces-44080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB1BC8EAC
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 13:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B81344E4746
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 11:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CCD2E1EEE;
	Thu,  9 Oct 2025 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nqBTzWtI"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA32E0909;
	Thu,  9 Oct 2025 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760010989; cv=none; b=Su43xdLcXPOz72QNh3ZC2mGGQ7vMccu6CfSU7yrHWs6JJx2ul1azgPvz2UsShTXrYVshbtmvGVyNo0CMnKAI2C4QJM/CIPntxTcqo0COMmyjk6ATQuU2dnLHv7S1hBQPJWfn0jrBLLyU7lsoEmc0uplEVZ2z650EfQUMDp8QPDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760010989; c=relaxed/simple;
	bh=6gUz+9JoOYVGPpIwvEyu26OypnA//W1aFpeDtPUjxaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPrma68RzKW6xspG6TUk1p7d4LBLuWasobb6dC/CcmKgfJV+44j2J+HyAECTtTCmO9X0RkOSkYK3WCppiSh4lrM+y0RUxsd0mP67FCqCNsJNObyRp7etODFfwVgbVebkdoSQuqnxcaPgwOZLHuU7Rh9yWKfTJU0HZfOrm1+yi3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nqBTzWtI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760010985;
	bh=6gUz+9JoOYVGPpIwvEyu26OypnA//W1aFpeDtPUjxaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nqBTzWtIwjw7fCRFp/gWpyyfyqCXm/UzYttMnMyC/r1TKf7qGYKGgn5yqtrInqUHl
	 Jid+rfe2P65rn6jVjolgn1z4JPa4Iofyy3x4l2K3zZBEfCwIxJIo826gYYL/OJin01
	 mH0fV0lG135kAvX+eScECWBYLLZyS22U5sPhorLN/DPseuEWedVJTLYA3LunjwBp8q
	 D45/YX7uTqKi+Jb/tJsQsI7pnjqpt7qc+lhKEKmnHUtFoYmPgZQmhecXl2oeedGZvB
	 MU3RPYN33wgluOO2P9LeoepkZ2WfYOxBtpEDxnoQ0OrwjqPjoiktUY8wIIfmRBg0f5
	 JfX8GTG6naTxQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70DDE17E0125;
	Thu,  9 Oct 2025 13:56:24 +0200 (CEST)
Message-ID: <9abaae2b-8e66-4e28-99c3-14cf3de13c8c@collabora.com>
Date: Thu, 9 Oct 2025 13:56:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa
 parameter from cmdq_pkt_jump()
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
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-17-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-17-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> Since shift_pa will be stored in the cmdq_mbox_priv structure within
> cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.
> 
> Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
> and cmdq_pkt_jump_rel().
> 
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")

Drop those fixes tags, they're not pointing to any upstream commit, and then, those
are not fixes per-se, as you are performing migration, not fixing anything.

Cheers,
Angelo



