Return-Path: <linux-media+bounces-24935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4994BA16A2C
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0147C1881E9E
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BBABE4A;
	Mon, 20 Jan 2025 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="asiewVR/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A40197552;
	Mon, 20 Jan 2025 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367248; cv=pass; b=lWIt4tWMWDOq8zlnD976xnNlaonD24ckMWl1kKVBESbedUoGGnSmtVkbm9+ebTjFXU851LPOjs1Pj0a1dDRcVdI29QwnIORNfe7gxuoYo+0UKEumsR/iXjiaE3OsvfxZyZFFn2A3RAnTPX6VVIPfgMr0YjbB+HDU7KQrUojK+RQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367248; c=relaxed/simple;
	bh=H61GQpYbbYbYLA61lSFIkeOmhKZYK/PurUBXcy2vims=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2OryRnEWhdeTOuDUb5zFmWt3Dgwdaquv2n+knJpv/Y4N4fZayYgIgoaBdW+UeHbhgHtj0IUQ1yWaTagY4PHf9zFRo02qLJyWdk/W+t5IRnB2MVs8FaIfgRXgIQvl8qEpMUOCXr/O4p4oDIEDN9wEVtvjObZCgzD32I6votl7c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=asiewVR/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1737367231; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b9G/6NzBeeKQZNREnhz8U9epwFn5p9ZDZCo2W6PE50asjCTfLp101o0G0DaQfPUHDUZ0+cwBGXl2Q4nZ2h/Ri0i3M1LKHpwmqy6fNYQgddvFhG+PkJQt/w+g5veEo7EmNtu8HNL6ppZbHFEXitC5ptHcbfNpCngRKiXEKtnnePU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737367231; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I1IH9I2LoIXSUcpoXQGZuE0Mnv0U7doshI4vVWFrmzo=; 
	b=m2DH8WZHu4PoQSOokHCXLAZ466oM52cqNsBbzMV7/ajN5GRYRXAT3sULK+G0QBjv927n+JUt/cJJa1GEiBQ9s9z7eml/DoTREdkdm5k4R9kP33Ds3WnqtFj1Y+TvjHhq9Tq+GnkEiRViOz/K82/+RBQGRLbkySJLinTEKGEi1dk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737367231;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=I1IH9I2LoIXSUcpoXQGZuE0Mnv0U7doshI4vVWFrmzo=;
	b=asiewVR/ouDehvsk5qnudZTANSenn9lFIdPAHz2jTHgCzBcBymfqP/0gfbRkcyFv
	WcC5zjA0NSCLzgGXs1zp9rf4GsBpp3SBX8zlj9lCv8RIfCVS84n/aVD5FGTFYuyMg5o
	Z2AwaygtCCtMPImQO6BHY1T00saC7/CSIZSqgoBs=
Received: by mx.zohomail.com with SMTPS id 1737367230040944.226790523277;
	Mon, 20 Jan 2025 02:00:30 -0800 (PST)
Message-ID: <cc3b22c9-ff98-4328-9e70-4d22c29a6b0d@collabora.com>
Date: Mon, 20 Jan 2025 11:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: HEVC: Initialize start_bit field
To: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250120081052.63224-1-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250120081052.63224-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 20/01/2025 à 09:10, Benjamin Gaignard a écrit :
> Always set start_bit field to 0, if not it could lead to corrupted frames
> specially when decoding VP9 bitstreams at the same time since VP9 driver
> set it for it own purpose.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

I could add this tag:

Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")

> ---
>   drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index 85a44143b378..0e212198dd65 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -518,6 +518,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>   	hantro_reg_write(vpu, &g2_stream_len, src_len);
>   	hantro_reg_write(vpu, &g2_strm_buffer_len, src_buf_len);
>   	hantro_reg_write(vpu, &g2_strm_start_offset, 0);
> +	hantro_reg_write(vpu, &g2_start_bit, 0);
>   	hantro_reg_write(vpu, &g2_write_mvs_e, 1);
>   
>   	hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma);


