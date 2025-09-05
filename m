Return-Path: <linux-media+bounces-41814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC7B452E5
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BB821CC0AF8
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CA6284662;
	Fri,  5 Sep 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KssQjEZD"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0D2820DA;
	Fri,  5 Sep 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063715; cv=none; b=CvT2/a7aCfc2t/tqwOdHICO0yQK1osr76WqNxbsEoa4KgxPNcyL4CQ6x28jGuJHDNH0WHkA6gHVaTgu8ExBCMmHsmxal5pb7TrfV8jAb63ufBmwehu8Rn8VW9ctfV73pfgpEYJALn+6dt1iXCuAJj2bAUX4ubCR8ps0kGKxOokQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063715; c=relaxed/simple;
	bh=33A/I19euiFo7KyPkCzzuu4tf57r3cMykqNriw0KQWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1eLGb4QGr+LY0oW6G9YY46Fex4JUb+bvf8LSFCEdcO8oNApJosLiwn/erM9zrtEf5nUEVskIEpiuN0fRF42Qqzyf7k1D532gc7IEh+9GkYV8PmdqnPX9KisVaYGZqrYFp+0lcnZ2NecjgEA5iMDTgmlo/pFz9oosXlQ43pdp2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KssQjEZD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757063710;
	bh=33A/I19euiFo7KyPkCzzuu4tf57r3cMykqNriw0KQWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KssQjEZDH9qu/sgjacMKg0Zz3UxIzN6z1Hvhb5Fo9k5JDDWuD+TrfyEPCYWFKEmrJ
	 btk2pincIPdba6Wn/25wln5tco96FJM/f8dTQZffE8QGDFfxp2jrbVcO9wDEHh+gqk
	 yTHEibEWSqqAPD2ntAHoude1EL3UdPjp4aOO41aCWzfU7L4HQ+B28rK9JNjat3vt5X
	 X8JwwuxuQvV/D6NYUiKcCgLYKHSKpmZ6PEZS5gFA1HOVradnMsZ4MVTCj1A99pD6ev
	 Z0BaaOfxx0ZcWJGwfUiWiEzuiyeijBEqH4pkRhGqr57Snx/5Yp8jY3sHCcZQ0zh+xR
	 k4w/eCvUdARjA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC6EC17E0523;
	Fri,  5 Sep 2025 11:15:09 +0200 (CEST)
Message-ID: <9aa961d0-8138-4363-a606-30d879638a5b@collabora.com>
Date: Fri, 5 Sep 2025 11:15:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fix sleeping function called from invalid context
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>,
 Jarried Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/08/25 11:15, Jason-JH Lin ha scritto:
> We found that there is a spin_lock_irqsave protection in msg_submit()
> of mailbox.c and it is in the atomic context.
> So when the mailbox controller driver calls pm_runtime_get_sync() in
> mbox_chan_ops->send_data(), it will get this BUG report.
> "BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164"
> 
> Additionally, pm_runtime_put_autosuspend() should be invoked from the
> GCE IRQ handler to ensure the hardware has actually completed its work.
> 
> To resolve these issues, remove the pm_runtime calls from
> cmdq_mbox_send_data() and delegate power management responsibilities
> to the client driver.
> ---
> Changes in v2:
> - Move pm_runtmie APIs from cmdq driver to client drivers.
> - Move pm_runtime_put_autosuspend to GCE irq callback function.
> - Link to v1: https://lore.kernel.org/r/20240614040133.24967-1-jason-jh.lin@mediatek.com

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



