Return-Path: <linux-media+bounces-43173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB5B9FA3D
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147FC2E3240
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 13:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5314F275AE3;
	Thu, 25 Sep 2025 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iDwQTQjf"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BB22727FD;
	Thu, 25 Sep 2025 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807852; cv=none; b=g8jISNTJM9ounx9QtRjdkf1sZySXJvxCCPISg2A/tclNxVVJt7D89WPgrYB8YHZTZAkJhuX++z2/vGvHQmsyOt0zBOGZUahhhOPVp0CHzAfIvt4MH+kAVBdF81BKkfw89z6S5XvIYUbX0/m+XZagLKFzwDUBdouNCN1WfMhYYwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807852; c=relaxed/simple;
	bh=z0nrjmYw4OalvIuVx9M/Xqt3AoRAIrJYUKWWh5/SgpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKICBlGmMMMQ6vwNAk0kZfek9kCJR6bQ9HKr999RjH3G+BwCKeRlR8cRATcm7LMBXKMnSysdmRJRWA36lHzN9R/nIlqPjLe/eKeA8W3SQsZoeGy0ZJcllQQzjamcPf9azlB87es5H0h5H4Vk5Tg53HMJlj4Z6OgjtNJSGK8CJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iDwQTQjf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758807842;
	bh=z0nrjmYw4OalvIuVx9M/Xqt3AoRAIrJYUKWWh5/SgpU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iDwQTQjf+5aoYii8V7TIlFrezpbgSWVarP0i3pxD7eLDrfSa7YofMaSS2KBC12M6e
	 XucJJgfriXb0oON4oX0H4VjHWsqgpr7i3ZGaBZlfPVjvcIJ4/BvCjMj5m4q1bJ2bpN
	 eqzaOHFhyvVBmrCS8BtaUMyjB7rcKIQauoqRAQmodaDfYkw+FhuEr8V9cPnrhnzPNX
	 Qdio0coW3QiE1eUIYNGQgaGwiUzG8T7axx0hkl2Yy/dw0hSaqfpxpwIeo2kEYVQkt9
	 +wASpjhxocwK+CEIL0FDe4EE7h8QkOwegCUEy/a3DbsLH60WSnJCsKvnXM0DeH5ynl
	 K29dDioXgk/XA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89CB317E108C;
	Thu, 25 Sep 2025 15:44:02 +0200 (CEST)
Message-ID: <a1224727-0d33-4e62-a538-8013115848be@collabora.com>
Date: Thu, 25 Sep 2025 15:44:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: mtk-mdp3: fix device leaks at probe
To: Johan Hovold <johan@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>
References: <20250924143919.11183-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924143919.11183-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/09/25 16:39, Johan Hovold ha scritto:
> Make sure to drop the references taken when looking up the subsys
> devices during probe on probe failure (e.g. probe deferral) and on
> driver unbind.
> 
> Similarly, drop the SCP device reference after retrieving its platform
> data during probe to avoid leaking it.
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Cc: stable@vger.kernel.org	# 6.1
> Cc: Moudy Ho <moudy.ho@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



