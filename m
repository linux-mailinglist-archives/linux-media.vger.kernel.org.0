Return-Path: <linux-media+bounces-27830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F77A56569
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 11:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BB5B177D2A
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB557211A0A;
	Fri,  7 Mar 2025 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="RAFGnkWD"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED620D507;
	Fri,  7 Mar 2025 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741343506; cv=pass; b=kvMuZeDnbFlrJKjpuSkuHt8QWA2UNoktJnavMtGAQuH1nzA1Fuez3Cib+6hZREXyiPj7tv3JF5aqq2DXhefWyKjyprinzrS0cLIaNQE0ykXZp2/q7x106DVoC/nSWevxZTDNUoqcpJp9BPtUD+lF3CuApUnByhTe6nMiwihYKF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741343506; c=relaxed/simple;
	bh=G599lok46kj8WZG6hHVTV43Hrzt9xZBG3qGqbQ/XbCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8uXw6DsfxJ92x4vtD4Kb/KFFCSVOJ9S+Sxi03x67R6w8KcuUArQSdSchkHaL4fLuGa8NnyVkBvE5KxhV1MUa+vTgCGGAlm3BrU737xbN0TCIVTjd18I/cF8BmwRkMF2WjV5PM/StRzSDprI5z9XwiboHzNF6OiJiRMIhdVs/MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=RAFGnkWD; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741343480; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ede+VIul5w8wNXKhjR+eqLdVZpjoOcro+P7EdL4jcJjnzc9lcrVWsAyqh/Ih5X08OUpes6tEXPrIQhceEmXOz/fYT20xLf23PJ04C917SB16dwTDifmBDKHVthvaRyR5xXcgcBAxdH7mmaq287A2zXGPR/7YTl/c8pFFkWyb7+0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741343480; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qFw2WEAsUwSpHOvEDBz9YvCCp9lt0tHdWoCaN/z09uA=; 
	b=hcilYfJ9dcwMKOPmlBwubBfCD3KJdBGqplylaF8YpTOTgLqvUYzfTfclJvnoQFtqhJHRASGrb57LQvqTwc3pxddaz23YTuCQ9Aib31qI5wd3ahZsGbiL/9HRj31B2qm5bRbA68Y6qy9iBHmaAVJ2dv2XYWEPebbRt+ALpeUW7fI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741343480;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qFw2WEAsUwSpHOvEDBz9YvCCp9lt0tHdWoCaN/z09uA=;
	b=RAFGnkWDwrwggveYQKLJoS1fHCAqFsOvVBxoGQeKFqG2tnQoLFtDSsWN+a9tUphu
	JJ4aNJfJcKqyMwg8gzt+rjudfon8O7qCNSGypM0RYa95lLyqlxClFZREbPfiGTsj/qX
	UFa6yDLgKxelXnJik3bFi5bP2nlmYCw5VyC/JLno=
Received: by mx.zohomail.com with SMTPS id 1741343477176333.4836295262826;
	Fri, 7 Mar 2025 02:31:17 -0800 (PST)
Message-ID: <8c685f16-8f49-42ab-ab1b-0fa0804d65f0@collabora.com>
Date: Fri, 7 Mar 2025 13:31:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: synopsys: use div_u64() for 64-bit
 division
To: Arnd Bergmann <arnd@kernel.org>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dingxian Wen <shawn.wen@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
References: <20250307102405.56313-1-arnd@kernel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250307102405.56313-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/7/25 13:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> One open-coded division causes a link failure on 32-bit architectures:
> 
> ld.lld-21: error: undefined symbol: __aeabi_uldivmod
>>>> referenced by snps_hdmirx.c
>>>>               drivers/media/platform/synopsys/hdmirx/snps_hdmirx.o:(hdmirx_query_dv_timings) in archive vmlinux.a
> 
> Another one uses do_div() with a temporary variable.
> 
> Change both to use div_u64() to avoid the link failure and improve
> readability.
> 
> Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 4ffc86ad6c35..438536d88c7f 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -296,7 +296,7 @@ static void hdmirx_get_timings(struct snps_hdmirx_dev *hdmirx_dev,
>  	hfp = htotal - hact - hs - hbp;
>  	vfp = vtotal - vact - vs - vbp;
>  
> -	fps = (bt->pixelclock + (htotal * vtotal) / 2) / (htotal * vtotal);
> +	fps = div_u64(bt->pixelclock + (htotal * vtotal) / 2, htotal * vtotal);
>  	bt->width = hact;
>  	bt->height = vact;
>  	bt->hfrontporch = hfp;
> @@ -396,7 +396,7 @@ static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
>  	u32 val, tmdsqpclk_freq, pix_clk;
>  	unsigned int num_retries = 0;
>  	u32 field_type, deframer_st;
> -	u64 tmp_data, tmds_clk;
> +	u64 tmds_clk;
>  	bool is_dvi_mode;
>  	int ret;
>  
> @@ -418,9 +418,7 @@ static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
>  
>  	tmdsqpclk_freq = hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
>  	tmds_clk = tmdsqpclk_freq * 4 * 1000;
> -	tmp_data = tmds_clk * 24;
> -	do_div(tmp_data, hdmirx_dev->color_depth);
> -	pix_clk = tmp_data;
> +	pix_clk = div_u64(tmds_clk * 24, hdmirx_dev->color_depth);
>  	bt->pixelclock = pix_clk;
>  
>  	if (hdmirx_dev->pix_fmt == HDMIRX_YUV420)

Hi, thanks for the fix! Hans already merged a similar patch [1].

[1]
https://patchwork.linuxtv.org/project/linux-media/patch/20250306-synopsys-hdmirx-fix-64-div-v1-1-dd5ff38bba5e@kernel.org/

-- 
Best regards,
Dmitry

