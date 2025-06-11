Return-Path: <linux-media+bounces-34493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549BAAD4E80
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 10:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB10716903D
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 08:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D1123BD1B;
	Wed, 11 Jun 2025 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MLHxkMMm"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5540823ABB1;
	Wed, 11 Jun 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630818; cv=none; b=HZ1yPilNtIz5B8SKFFLdxDu8k2LHpvXrJt6DJh9ydl5CBPmcPye7G4MBmNIR65njSo5oS28P9iK8LYv5f/nI0Fi02Yh7W5Gdu3DoEyz/ixSYQc3BUdTJoBrQYJA5MdotCepSRBF4VXukZTBa/OW7Kwsj5k861ojn1CpCfw2Et/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630818; c=relaxed/simple;
	bh=BUbdxVLJuS4fYAYAMWAmKlXzifES1ZREElljdWotK8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufRVtbc+9b3+dWYcDjFQ2BRGMGaYhucaKNLLxwm6CQhTmqFeQuf0sgOkD2YS76mudgn9iTVUbZBKcFqk6rU/um0qoqM/LmYh4Zh0elRn6d8kTawHi94/q6H1pm+Vk5QCzZEc5NnMpbi+tCCh2zH55U8e5kDAOxA79aJM1vIlCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MLHxkMMm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749630814;
	bh=BUbdxVLJuS4fYAYAMWAmKlXzifES1ZREElljdWotK8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MLHxkMMm3Hua6frP7w6apjFbxOH+2rWBBkuLeRsn4k+NHtk1y+ngba1mdk+aq3N9J
	 g/uYluVcm8JwfuatvfvZbAKql1NHFo5TmcnVNir6KBVG5iPq2F2bw5syV1z5DHYL2C
	 v5A0jXbjazNOFx3fpGK5hpsTYuAK6dsEVtX9ARcbfByyf8upTEqYuAU7nDp+c7pqch
	 HtPvfn2EUysuDah6+xy31icKlZosKLis9eKWy9y3xnW8zMJlBWByM4zLkmkcahK4cy
	 lMY6UwoImu3hdQhmytu/NWU64U9GHofr4hLCDqq3vHsC8XRtjJDqCsjtNoCyVNnrfd
	 HSDLqLaoeIvYQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 592C217E02B0;
	Wed, 11 Jun 2025 10:33:33 +0200 (CEST)
Message-ID: <e492fb4d-2899-4b63-b69d-1e922c3807d2@collabora.com>
Date: Wed, 11 Jun 2025 10:33:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: vcodec: Implement manual request completion
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
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-4-603db4749d90@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-4-603db4749d90@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/06/25 22:09, Nicolas Dufresne ha scritto:
> From: Sebastian Fricke <sebastian.fricke@collabora.com>
> 
> Rework how requests are completed in the MediaTek VCodec driver, by
> implementing the new manual request completion feature, which allows to
> keep a request open while allowing to add new bitstream data.
> This is useful in this case, because the hardware has a LAT and a core
> decode work, after the LAT decode the bitstream isn't required anymore
> so the source buffer can be set done and the request stays open until
> the core decode work finishes.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



