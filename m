Return-Path: <linux-media+bounces-50254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E0D066C4
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 23:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5916430299EC
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 22:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1FE325723;
	Thu,  8 Jan 2026 22:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="JMEchq72"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067BC1D9346;
	Thu,  8 Jan 2026 22:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767911233; cv=pass; b=Zx+0BGpStUcsKNwETgpmMe2qA/VNRGrrGUEq6LqDmrD2GcHR/viDeCVZbn+abrNcj4Dcd6BkGAMtfSPJZ99f6zOli3f4aiO0utOJA2Wl3rCFCB4xl3fYarT+1J5BDe0mI7ELZf14/IGhmsilo3hdQ/I005qNRS5eZZxUXM3kNKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767911233; c=relaxed/simple;
	bh=95jlgZwd9kMfUqnotcJNiYdKdz5zCyqtwdcDbLE61FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tgfj3Y0hH/qAsCs5BK3LtRUauntFnWmQ9aXjy3szi0Wjp2HrTDgzEnT1LTtHhFtDaf7/WyrTG0giCGtA/V3EIY/HEJMVVyNsQr/Fqz8JeDTv5N1/GT8S5StWUXzAjisYD4BftM1I2PLg+ak9tTlXuBU7jYlWdCM23wyxML/Li3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=JMEchq72; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1767911215; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A8KLZpmn7MOSCJcsfyyH3yeLflAIMDcdMDuBJMnxwAE7A6vdm8Q7upgYcE9NvSKFTIqG+iDKzFOyENCboK6ZgxxBN3e1ulXQVgKuQvmLUeiMEys03WheezjFXZWqWn1O/7lQJOApQdjYEZItwsz5PXTDn/McUXefW4ixwl07rh4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767911215; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bSajWblRK/fbmIiboDgzgrtbFO4QpuM4aaPWjj8c+p4=; 
	b=ZZVVgsIXJKjKv0+r0g1LYxez1BqeUZHbUPKRzA2/7JpBxcPbJGRi4Wv/N+pkKKKstyOXBvydDBWwmt6poliyu9AAVjxd8U38kHMf7KTQxW+oKB34fk4bs6K1c/hQjeL++vTMhPE/4gJJ6Vuln7YQYXV3jq613fefbOBXYz0+b0A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767911215;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bSajWblRK/fbmIiboDgzgrtbFO4QpuM4aaPWjj8c+p4=;
	b=JMEchq72MUGGJDUGWsiDRSMTgevq35jyKN/xZWUJdigtjQ8t8+Ni10ljbabyNCJ2
	HnzkIb8TLZURG3gOiBm1g/GPLkMUZnoacb44JdUhI1RRJEGFeeeYRfEan8Bw4EzQoi5
	QH6jZdMJdMAu9Glpjs9yIYGBK4JdGy+S6Ha7L9jw=
Received: by mx.zohomail.com with SMTPS id 1767911213578185.64866105464432;
	Thu, 8 Jan 2026 14:26:53 -0800 (PST)
Message-ID: <af5546be-50d3-404a-be76-297139988b80@collabora.com>
Date: Fri, 9 Jan 2026 01:26:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: fix integer overflow in
 hdmirx_get_edid()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dingxian Wen <shawn.wen@rock-chips.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aWANkxRApxDeReRW@stanley.mountain>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <aWANkxRApxDeReRW@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/8/26 23:03, Dan Carpenter wrote:
> The "edid->blocks" variable comes from the user via the ioctl.  It's
> a u32 and "edid->start_block" is a u32 too.  The addition operation
> could have an integer wrapping bug, so use the size_add() function to
> prevent that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index c3007e09bc9f..f054e30cbfb0 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -717,7 +717,7 @@ static int hdmirx_get_edid(struct file *file, void *fh, struct v4l2_edid *edid)
>  	if (edid->start_block >= hdmirx_dev->edid_blocks_written || !edid->blocks)
>  		return -EINVAL;
>  
> -	if (edid->start_block + edid->blocks > hdmirx_dev->edid_blocks_written)
> +	if (size_add(edid->start_block, edid->blocks) > hdmirx_dev->edid_blocks_written)
>  		edid->blocks = hdmirx_dev->edid_blocks_written - edid->start_block;
>  
>  	memcpy(edid->edid, hdmirx_dev->edid, edid->blocks * EDID_BLOCK_SIZE);

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

