Return-Path: <linux-media+bounces-15679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DAA944648
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 10:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488BC1C22536
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 08:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2167516EB53;
	Thu,  1 Aug 2024 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cJBKVRke"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109916DC26;
	Thu,  1 Aug 2024 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500086; cv=none; b=OEgfFOAKp8wlgZ40+gS2/CMr5zG7Y6Gt7oSK9D/PuHu1hMeSjaHFWFOI5Su8C4YKIdGuNcBARQ7EkPHAZfgFO4DpUkDsY19gFeGXhi28HI5Y5siX9ySO65Ku1ZPxWJ4cBaHcU4SwNJV16MEKZwcS/APIIPytNnFLXTWHsinYp74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500086; c=relaxed/simple;
	bh=x784ej56BkVxJ2bKoYiQJDFgu13Aw5tgE7YRjViXbk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMDXnSTZwrHwtR6nkzEm1El+ZBFR1j31PNgNffKvRLmxXrhoY/V+RYsqmxVeiW3Rr+2ir4s3oZgahthFkJv86F9O0MXm3wMxiDBHPWCWj1ZBMJHHgTt8/DH28QBIr7euT0n5kq2TYvfSpzvIjGx6OFYgKUY24GpIA54W4gMPVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cJBKVRke; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500083;
	bh=x784ej56BkVxJ2bKoYiQJDFgu13Aw5tgE7YRjViXbk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cJBKVRkeOHrH9TpIXhjSk/eCcG+3vxKtY3WmSZn0SnxuE8r7kLpW+ziLwmz6Za9tL
	 VENRc4DApAvevBFW5lWFR1bPTNMhu6bDfHnR1FnxLTvhpu49McuX9GlxG/ifT/jHpt
	 xSnDqkgFNczrs3fdLQYTslwfrxijGkj3S9Dq3Y0UyNc+oroZU/5G0/Kqa3eW+Khggb
	 mBBx2qOeVH5OsmUGVCiKUYQQxtyaKrsC+k4Gl/QAx/LRMMSzuF185tZDkU5xR+EB4F
	 mt/CiJS4+yr+fSDsQhD1YSia4FYP0yqJgxckxBYdUgUbmdRyjsl9fsBgi7pbHuFyUf
	 1tsl41u9m5tNg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1BC2E378220A;
	Thu,  1 Aug 2024 08:14:42 +0000 (UTC)
Message-ID: <6c77758b-1b8f-4333-b62c-44f61f14e27a@collabora.com>
Date: Thu, 1 Aug 2024 10:14:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: mediatek: vcodec: fix h264 stateless
 decoder smatch warning
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240613093357.583-1-yunfei.dong@mediatek.com>
 <20240613093357.583-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613093357.583-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/06/24 11:33, Yunfei Dong ha scritto:
> Fix smatch static checker warning for vdec_h264_req_if.c. Leading
> to kernel crash when fb is NULL.
> 
> Fixes: 06fa5f757dc5 ("media: mtk-vcodec: vdec: support stateless H.264 decoding")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



