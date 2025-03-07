Return-Path: <linux-media+bounces-27815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA6DA56415
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A640C18896F7
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0248720C468;
	Fri,  7 Mar 2025 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Isuo3D/7"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F2520AF8E;
	Fri,  7 Mar 2025 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340240; cv=pass; b=Q2kmUazO69ey6noWARE0mPiu5h+QiAcg03VsJw6Re03EXxucfepFnwL5ChvLnyVWB1s+2U1sylYPhNbKDcKZmCxnUq6ypJyUcxoq8un7XrZGa+0wK0L3ggwjNqAW8d3SZL7Oc6+GlKt+FP4wixXvRBS0PAHqw7k7UY8pSgqBYK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340240; c=relaxed/simple;
	bh=pv53MAeGjoiFQqNXLiXE3et0/Lq/9AMSnZ1akEuS9fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyjcpJGrKHjOEFWOCsHZrDArKCNaW1QZCAgDyrhmNREWMHSwiEFIcQ27PqSDm928ucJ6ABWn/JehL9WXNK3b3IISSI9gQAP16t00TUO6TYO7ZxO35tsxtfThOVOwXJUcxKtsKDiJaurqpGO6NAH3ASFBJxIQROCsSo2z2Rzk1rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Isuo3D/7; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741340213; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LYn6GIfaYZWzF9ZNCaSaO5N4jS556vayGz8aDkSwTRms0GvGo0Dq2PfFKzTi4X+hNufsEJofnDDbprWO4vZt4477W5PqRDlQ1V0NLjcSrdRU7aFqgSYBC92bzshh3CnERcTb0fGTcyU31HpRXcCikeWutfltVtnHdclSpj+z+QI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741340213; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d/Gjk0QUCFk/jfd1542mqf2c43lGASS+o4NBP40gzk8=; 
	b=RILGbO9cZBPbbM6hWcg0/gXSlG+onA91RFRf5wDZAdE0fepPAu/wbt8825YDEPu8wEpPVB8nwY8GdPEClm07SUpSvLiH2kza2wUU4aUudJYa9cGzMk9+5uGNNywXxrBGo0l0h5obOPSo49ycUtkvmI3yud32L6+KNTqK+fBcBl0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741340213;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=d/Gjk0QUCFk/jfd1542mqf2c43lGASS+o4NBP40gzk8=;
	b=Isuo3D/7EwZDxPar3A4xxpmP6m0I2xSx/rpw+WYoYyQ3J9+uwhaw9Xup3U8W7p3v
	W//U8EYMVsMAj0CH1uSKaSWWB5RUEcqLPY5eZUrVh0oAe6jYSevGD/BtSp7WDX6d4uH
	TRFIpsm6UusxdNLGLt2lk+eUXjwtipcJzFhf/mRQ=
Received: by mx.zohomail.com with SMTPS id 1741340210750445.0809904130947;
	Fri, 7 Mar 2025 01:36:50 -0800 (PST)
Message-ID: <54d5eef8-66a9-44aa-9e9b-0324d6fee46d@collabora.com>
Date: Fri, 7 Mar 2025 12:36:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] media: synopsys: hdmirx: Fix signedness bug in
 hdmirx_parse_dt()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Dingxian Wen <shawn.wen@rock-chips.com>,
 linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <7ec94789-305c-4de4-b477-c0eb839170e5@stanley.mountain>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <7ec94789-305c-4de4-b477-c0eb839170e5@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/7/25 12:30, Dan Carpenter wrote:
> The num_clks is set this way:
> 
> 	hdmirx_dev->num_clks = devm_clk_bulk_get_all(dev, &hdmirx_dev->clks);
>         if (hdmirx_dev->num_clks < 1)
>                 return -ENODEV;
> 
> The devm_clk_bulk_get_all() function returns negative error codes so the
> hdmirx_dev->num_cks variable needs to be signed for the error handling to
> work.
> 
> Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 4ffc86ad6c35..e0d3fed87a92 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -154,7 +154,7 @@ struct snps_hdmirx_dev {
>  	bool hpd_trigger_level_high;
>  	bool tmds_clk_ratio;
>  	bool plugged;
> -	u32 num_clks;
> +	int num_clks;
>  	u32 edid_blocks_written;
>  	u32 cur_fmt_fourcc;
>  	u32 color_depth;

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Would be also good to return the original error code. There is no need
to check for the < 1 clock, it should be the < 0 check. Can be done in a
separate patch later. Thanks for the fix!

-- 
Best regards,
Dmitry

