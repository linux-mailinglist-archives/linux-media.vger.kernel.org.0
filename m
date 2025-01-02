Return-Path: <linux-media+bounces-24208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0549FF960
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 13:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAEEC7A17A7
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 12:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07ACA16C850;
	Thu,  2 Jan 2025 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xb1eGjPY"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77384A18;
	Thu,  2 Jan 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735821311; cv=none; b=Uw50knOU6/nbsxofMNQ1DiApJDn4f3NIBer1PwuFT0cwzTwOV7rKbNadSMr+ziprgJM0aT2HvzVGtT1qa9oQ+sC0Njf21V05F/Bc+9hugEZxmpbISQSS79dMsWOCB6bki80WtICAHrKpQvXN4sPvcnmRbTaaZvG0MxvGWnko92k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735821311; c=relaxed/simple;
	bh=os0Cxr0lwd8+rwXJ9k4K8vMInJAZ02qWvwYce/ccerU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ku6JbkYtIEU52gJTz5SJS3VgaZNt6/cCmp6WtOy8uojYNKQmtku7usob4tDfK0d19SdXnpYueWETMAjj72YrcGkonoqC5GroB1f+4jf7+E71UesKklk1xhGlgznDHtYED7aHgLAJaoTPpbQ35s2k7Z3OD+upqAa5pyLVgEmuibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xb1eGjPY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735821307;
	bh=os0Cxr0lwd8+rwXJ9k4K8vMInJAZ02qWvwYce/ccerU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xb1eGjPYY0Q1gMpcj0EOzFqsSBuNzqEDicEnSklEr8GmRSC4wqCzzibGI2VHzets2
	 +mHqlmeaWDmGDG2EWT2k0N3SLtJs0VU0aJ+0BBj9LQ6JAP0GH/nQb+ugzGJCG7lp6y
	 Rouod0S888w4oOTBkrxRtYhFPM/L82x8FUuOOGRCHP8uTLBuysKqM4naUXbrM1H1kE
	 5i9MIf8lEzwS1318CQEkO0CSjd85ASUbHiN2h8HTiZOhFkHuU/xpS5Dv2UADRjuVEb
	 cSSnVkg2A0rnx/XI6KZIe/tiUzV8OgtlQR7PX1WtbyZ4Kjlm2vKytGoMutXEUUmj1H
	 jowAXaCngckCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 903C217E156C;
	Thu,  2 Jan 2025 13:35:07 +0100 (CET)
Message-ID: <033b6577-61da-47bb-8e22-3c84d89220e0@collabora.com>
Date: Thu, 2 Jan 2025 13:35:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Remove unneeded semicolon
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20241230135314.5419-1-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241230135314.5419-1-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 30/12/24 14:53, Chun-Kuang Hu ha scritto:
> cocci warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1092:2-3: Unneeded semicolon
> 
> Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412022048.kY2ZhxZ4-lkp@intel.com/
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



