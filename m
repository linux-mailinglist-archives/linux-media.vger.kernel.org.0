Return-Path: <linux-media+bounces-15677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4542944642
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 10:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58A071F22E65
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 08:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F5416D4DF;
	Thu,  1 Aug 2024 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WP0JsSDM"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14493208A4;
	Thu,  1 Aug 2024 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500082; cv=none; b=DZHSfTEPSXJ9sU9Q49omBIVB/0POZS8hUb0JjMOZEMSXHNPfO9YjpcmcN39eRHvx/nmO9c7LP/8f0WMwIhhEVlTpjn6WYrlt4xaz8iTOfjnsAaPUa8SU8VWMWlusl6so+COp9GJggC71K/YjI/C0uLxsNqvpVaJ5uQGet1xHmfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500082; c=relaxed/simple;
	bh=lJpczff7Dl4zEd5TZagIVzH+sb71OGv7h5on9gbAmfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQKSIRcGgPcqlJG05gihSd7nGI+glnQwbYN2s0HfTa2A17vBEEGlEq9qFtl7oCFuscNxtRfXI7atsCoDcG+VtlpVsAQp8v2MhVUOYB2BQoxJcX6hXTXDOGwOgQr/NfJZxQfaU4Hr/uIzNOtr9MgSvVu2WqZgAlJHXG1j8hpvg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WP0JsSDM; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500079;
	bh=lJpczff7Dl4zEd5TZagIVzH+sb71OGv7h5on9gbAmfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WP0JsSDMLpo0f0M9XD3jZIkGH90CClO4MBNLf+P2iohMKPHDy4WToPlJ+Q8aMu2Xx
	 trPK7s/4jr71gOjadyTRei8/MC/vZkwbw90p3CwFWvxriH24qn/a+k3Mcd01v8pdMo
	 XUmbLeJHVyH4n1UZMoxmsyMydWFjcL/8iKAbAYhfO9f0MKnzDemsVz1GszCnVCDngF
	 lawKbSMvR4274pwaZUhp64xJU+AGbLk18fvAeOT1yLRSSlj09Tnbqe8UdKNw8QQ/h6
	 qJFjMnk8TkqKKbJu6lcSC6C8y4cV4JNcvO+tUMm3SeJj3P16QFaVug6J2uNXti2rUW
	 +dK5u/JQ1nx2Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE54E3781139;
	Thu,  1 Aug 2024 08:14:37 +0000 (UTC)
Message-ID: <89237e84-c52c-4338-a36f-022102382c5f@collabora.com>
Date: Thu, 1 Aug 2024 10:14:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: mediatek: vcodec: fix vp8 stateless decoder
 smatch warning
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
 <20240613093357.583-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613093357.583-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/06/24 11:33, Yunfei Dong ha scritto:
> Fix smatch static checker warning for vdec_vp8_req_if.c. Leading
> to kernel crash when fb is NULL.
> 
> Fixes: 7a7ae26fd458 ("media: mediatek: vcodec: support stateless VP8 decoding")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



