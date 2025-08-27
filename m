Return-Path: <linux-media+bounces-41200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B9B387EC
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 18:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50D751BA2589
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D39A2DEA74;
	Wed, 27 Aug 2025 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="S2Wb8tAr"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E7128C5DE;
	Wed, 27 Aug 2025 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756313104; cv=pass; b=O7BV2uqE3b1XBwPf5iQr5IM6iTs/xRxv7xZ+n+6JqGMuBQAoE8Eqci1is4cgpfKhp+ENBs7NMDjhcAAVlZpCkbCmj8uS+GFGkZaSgeiSO3n6kmwOnwnOcdMewe36nI6ZFYNwQHJ0bQP4HbAHNLgEVv31rw1/eIPqPRN22XFGr9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756313104; c=relaxed/simple;
	bh=3fZgq6UvUMRm+42+BiObBudKL9NE27gUKheRt3OBfxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hKsqSlcOKmA/U6q3sBKuHjTl74KEgoVO1SQe++NbGEbp0myV5LVMbESLj53T7C/ddjYRxX16Z94QLXNxRBRyRp06/hujD/Vfo8ocrnob6v49sPjKXwTXWZLgf3tWHGNQd/Z1piKnDw9bZCZsIOb6ID8yN76J7ZtlGkqjVsIfYB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=S2Wb8tAr; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1756313082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KwUlnTqg+jwWJzfneZmU7VY/THDE8miEzmNy/ypgiPqCTTgwM0Hyg/DJggbjnfOsOnVH26MK3WxlZ8WkGv9eC2g54+EibFEP1McCGNSI6MIXJsMhre/hkC24BH48JmBe1J4t6l4VXPp5scpP6Mdb+ycSKmouxZE0g/K9mz1lRsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756313082; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=1CZTC1Ly8WAopNsla9E+3x2mQOh+bAYM+b0OWkhcPm8=; 
	b=GtDeJYvwA7nRPiwLHWJpPj6YXliy3xWuJ7fWIFBtUycaF8T5tosZFJCBRk3vgtOeJaIeC/sc9lrdLrLpLiplk2pSrDaT8eSggn2X0Gg00rU5ApY6z8WQzAI+fbbfiee+uAZXdibymbubSsnFxOohkkLhM8CdJHuukU0VhHLVOXM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756313082;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=1CZTC1Ly8WAopNsla9E+3x2mQOh+bAYM+b0OWkhcPm8=;
	b=S2Wb8tArRPlRtBTR5cvfRk8IaoiSOFD1wyCAJOOBbCMbAjgY7fy8TJ5PmEqgy1P3
	Xku52EuQ6vOKP0VHQ+OFQhynVZc3sfTtGOt+0tmdYCdrxuktua60Mh5/Uv9kK9sN9y7
	gWWzihc+ZW8f7wfn3WZPnnpihw7RT2WMgdjg9V58=
Received: by mx.zohomail.com with SMTPS id 1756313079630903.252619803708;
	Wed, 27 Aug 2025 09:44:39 -0700 (PDT)
Message-ID: <6e4804dd-cb6d-4e3e-b964-633ae710c7df@collabora.com>
Date: Wed, 27 Aug 2025 19:44:35 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: media: Remove redundant ternary
 operators
To: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER"
 <linux-media@vger.kernel.org>,
 "open list:SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER"
 <kernel@collabora.com>, open list <linux-kernel@vger.kernel.org>
References: <20250826145057.534259-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250826145057.534259-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/26/25 17:50, Liao Yuanhong wrote:
> For ternary operators in the form of a ? true : false, if a itself returns
> a boolean result, the ternary operator can be omitted. Remove redundant
> ternary operators to clean up the code.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index b7d278b3889f..c3007e09bc9f 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -237,7 +237,7 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
>  			break;
>  	}
>  
> -	ret = (cnt >= detection_threshold) ? true : false;
> +	ret = cnt >= detection_threshold;
>  	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: %d\n", __func__, ret);
>  
>  	return ret;

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

