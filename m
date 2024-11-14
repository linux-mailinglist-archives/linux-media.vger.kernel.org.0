Return-Path: <linux-media+bounces-21400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 269739C876C
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 11:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90162868C6
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 10:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6D41FB3CA;
	Thu, 14 Nov 2024 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LulJ83Md"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB291FAC5F;
	Thu, 14 Nov 2024 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731579315; cv=none; b=h+w9hvtjYdV5XGB7JwMPK4VahKOUQLeFG6S+XNOCDt+mntoC8bal5CA5FdRYeBDFjnMS88RbtHbkp3reQlqFrsxq3vF2UhEl4p/zVF3i5Pa71jIv3mz141xglxpMnskgMbsJH0jlcIyS7xkX7SA3sYGf7NCjEX81IMSmB1oo05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731579315; c=relaxed/simple;
	bh=nKvB9pDqz/xoRqE3G6i3ohCmrTQ0WvPw1A1TR8q+06M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sd01FyHyiT9FK/2xydQzXIuU7jawbsnf/Pu8Uuxb1A8GQU90u83X01EcHJdiT67DG1qzlxKgRtYx/ZsG+PsAQLQuvE82INUksf7biEi2ZmzZYGUgtDwBzInTJEC5qEQiyNgjpE/Oe9zIFEkz+QSAgdJwGm17sqFr2UXvSIMiSu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LulJ83Md; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731579311;
	bh=nKvB9pDqz/xoRqE3G6i3ohCmrTQ0WvPw1A1TR8q+06M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LulJ83MdgPmpqTGQT8+lBAfJP7Fi6lnzWcz2zdgynLjJgbbilq0r2EfEg/SCGFYSa
	 ynD7eTAmyXlk6YTG+Gkb3Z7bUwtvjq46GS1KMdwwegyupVKFyqT1Rj5crD0Vmnp/cA
	 uITN7nHc6dRW7mrDdsTXGcop5V82coy6AP/NK601hYIXzU/V6SsUPnlm5mWx/5Ri8n
	 M9M/kk1KaSgrvBBX/eSR6yn9hq2kfn0DHk8iBqO5COIbyE22NgcV+oV+GOvz+p2m5U
	 JEWuvu3DX/BlKdIB6jdwSKNtU6w3WhKpJ2Mn6Kxq9u3yaUO6TKLaGlpXmHzeVCGKyY
	 sfkeapwdgz5vg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2308317E35DC;
	Thu, 14 Nov 2024 11:15:11 +0100 (CET)
Message-ID: <1b73bfbf-e97a-495e-b0af-5273abec5ca5@collabora.com>
Date: Thu, 14 Nov 2024 11:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: mediatek: vcodec: support extended h264
 decode
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241108034019.20064-1-yunfei.dong@mediatek.com>
 <20241108034019.20064-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241108034019.20064-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/11/24 04:40, Yunfei Dong ha scritto:
> The address end of working buffer can't be calculated directly with buffer
> size in kernel for some special architecture. Adding new extend vsi_ex to
> calculate the address end in firmware.
> Adding capability to separate extend and non extend driver for different
> platform.
> At last, hardware can parse the syntax to get nal information in firmware
> for extend architecture, needn't to parse it again in kernel.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



