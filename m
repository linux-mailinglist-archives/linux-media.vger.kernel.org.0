Return-Path: <linux-media+bounces-30122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7DA87B90
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BECAC3A9BC1
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5915A25FA03;
	Mon, 14 Apr 2025 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QCgux5ZS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7CF25DCFF;
	Mon, 14 Apr 2025 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621871; cv=none; b=AdlQ6d8VtVCamuQn5comUyWTROMkMG6NytqWizXvyjgPK+x9cF3WyIF0T1o/GRQuwhMZ3LgmqhGxpPKIjrmJMXkNYvWmmOeXYgKeIQWUCAOQUaEBtH5kV83S3z46JybOkHaBj7PX21k9m2PguYHgHrKXoFJBjqElfAKWYOLT/0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621871; c=relaxed/simple;
	bh=7GmyhB9YiiseELmMRG3esYEYrbKodzmhymAzhPbwobo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QW+Ll0Iul7WKo4NIb8DHz8OJmO6b0r+/n27RHKGNDlfoL+K0nkU2MoN7pK/GlW6/I//7AkhQq7J0A9M4wx2EsGduvXwF+X7acx760dFxzEQF0K1xQttUnYDsbG+9V/YU4xTRZ3FJjpYHcOy+LYPosrCIio6UmmZLe9IMG0xIAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QCgux5ZS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744621868;
	bh=7GmyhB9YiiseELmMRG3esYEYrbKodzmhymAzhPbwobo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCgux5ZSLOc0F0gQOZ05wl0VGLS1ov+KNQkID7gnWBgAx5krbzD35OkruxUhAVyEd
	 +FICNdd6DKfOdwTMCsbLF/FfnCN28Lyq5Am/GPv6y4VqiULZzNuGZ5q7yKUAyHpdU9
	 hngNJtDvzRxHIwbdQgvf4B7GVisHQVvM+KbA67/K6mFriNM6Z97m8y1fmHwfC63+HB
	 felvBiYMu+AFmp3wCz8fgSdpqJ4L7GOe+Rf6ueVdkEdyInGHUY58JG+KL1KEEzBCWe
	 xVPIcMi/V5BGD8bJqvHuTM8F06tGqMmzIbfvDY6C8P4MaWPt+C4egjjssML+UhIW5h
	 usZRFqv+OShsA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55EF117E0F85;
	Mon, 14 Apr 2025 11:11:07 +0200 (CEST)
Message-ID: <9a6f30c9-9b87-4536-ac4c-a1b437729108@collabora.com>
Date: Mon, 14 Apr 2025 11:11:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: mtk-vcodec: Don't try to decode 422/444 VP9
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
 <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-5-5b99ec0450e6@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-5-5b99ec0450e6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/04/25 17:40, Nicolas Dufresne ha scritto:
> This is not supported by the hardware and trying to decode
> these leads to LAT timeout errors.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



