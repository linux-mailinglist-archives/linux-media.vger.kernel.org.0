Return-Path: <linux-media+bounces-29995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B2DA8511B
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 03:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 706761B83DF9
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 01:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCBA270ED3;
	Fri, 11 Apr 2025 01:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="VzBDeQ7B"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B1367;
	Fri, 11 Apr 2025 01:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334048; cv=pass; b=gqtyP8zRf2J8NOmm1FuEFFTeesXW7Ysg6O+tBd6Jp7bAYnfYsrX2vwFhliObTRrCeKhA/sJTZf/UX+mlNaG+xtA65U2cC7XECjxwZCTigl4X8n3vey+fkQkQOSDdNFePCZboJQgPa30dWiicA9bhohCcADcSemxNvp9rcemSm9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334048; c=relaxed/simple;
	bh=j4+SiIZxvGybY0h9n1Vw8sCcruUlsGBGVrYHH/f8200=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTYOQthtRX9LdAong/BPmoarFRIq65rmSQJNbdLHAe3Dj6YI2V9TUu2roSUEKZO05DBdzv+ZUvF5fB4ItdtbsgFXgG7+F3LolY7zddsLMLZQKrd1CnC7iKulZV7KH19QcykBAaD3CgyVU9XTamdhrEdkc9ODt35o1WhWGeDa5IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=VzBDeQ7B; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744334023; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OQ9dNyUJmvcDbmGsZyTbKr3B2lP+PG4xvC6/mMCcY7kU1Fa6LLv9g0EyG/Btv/0RhdZtFX2yUSckNml0q9y5TJjOh5l5Dqlh9arggZEZBy53xthV+LYAqokYnIA1t0Ftktklzbho7Iq8PtJM+lTTlulwah32+1Wzm3lflI4UbsU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744334023; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=apyuPFPIqMQ+y3i2fKfqaByjd0lfZpr9zLn4Mh6y+hw=; 
	b=me/wqqa7Hf5exjz6XlD0ePYO3ZIerX9wkIzmFRbDPQzv2hLpkAikxc4134XWilvdkq1hxv6XSyY97ayE+oBOlrxgurDx4eK2lMv6mlI+CleIzqnCE2A8Z0KfGzpV3CO9AVM1qYyH9QmoROSBR3aEibc1M+MRTvLuM4a+SXKOccA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744334023;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=apyuPFPIqMQ+y3i2fKfqaByjd0lfZpr9zLn4Mh6y+hw=;
	b=VzBDeQ7BkM/5q1O6FAEYTtrU3ALrcIj9sRA3En6J1YIBeDoWGfAdqLXIAWIrFFyj
	fS1Cx5WKhBkoYmJKrCvlkwB0QCQsUTnLXruWx8YFCms7durILycdb1U86CNulYUPOGK
	H9fgJBhwwQqUphUz0+S7HFSS4Xk4XYY1FSdKbZ38=
Received: by mx.zohomail.com with SMTPS id 1744334020773726.2543250344297;
	Thu, 10 Apr 2025 18:13:40 -0700 (PDT)
Message-ID: <a928de25-9586-4af0-b7f3-63be75cb508b@collabora.com>
Date: Fri, 11 Apr 2025 04:13:36 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: synopsys: hdmirx: Renamed frame_idx to
 sequence
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
References: <20250410-rk3588-hdmirx-sequence-v1-0-aad3f216d351@collabora.com>
 <20250410-rk3588-hdmirx-sequence-v1-1-aad3f216d351@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250410-rk3588-hdmirx-sequence-v1-1-aad3f216d351@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

10.04.2025 23:43, Nicolas Dufresne пишет:
> This variable is used to fill the v4l2_buffer.sequence, let's name it
> the exact same way to reduce confusion.
> 
> No functional changes.
> 
> Fixes: 7b59b132ad439 ("media: platform: synopsys: Add support for HDMI input driver")
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 3d2913de9a86c6a4e66562727388b4326365048a..f5b3f5010ede55bde28756da326a434cc9245492 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -114,7 +114,7 @@ struct hdmirx_stream {
>  	spinlock_t vbq_lock; /* to lock video buffer queue */
>  	bool stopping;
>  	wait_queue_head_t wq_stopped;
> -	u32 frame_idx;
> +	u32 sequence;
>  	u32 line_flag_int_cnt;
>  	u32 irq_stat;
>  };
> @@ -1540,7 +1540,7 @@ static int hdmirx_start_streaming(struct vb2_queue *queue, unsigned int count)
>  	int line_flag;
>  
>  	mutex_lock(&hdmirx_dev->stream_lock);
> -	stream->frame_idx = 0;
> +	stream->sequence = 0;
>  	stream->line_flag_int_cnt = 0;
>  	stream->curr_buf = NULL;
>  	stream->next_buf = NULL;
> @@ -1948,7 +1948,7 @@ static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
>  
>  			if (vb_done) {
>  				vb_done->vb2_buf.timestamp = ktime_get_ns();
> -				vb_done->sequence = stream->frame_idx;
> +				vb_done->sequence = stream->sequence;
>  
>  				if (bt->interlaced)
>  					vb_done->field = V4L2_FIELD_INTERLACED_TB;
> @@ -1956,8 +1956,8 @@ static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
>  					vb_done->field = V4L2_FIELD_NONE;
>  
>  				hdmirx_vb_done(stream, vb_done);
> -				stream->frame_idx++;
> -				if (stream->frame_idx == 30)
> +				stream->sequence++;
> +				if (stream->sequence == 30)
>  					v4l2_dbg(1, debug, v4l2_dev,
>  						 "rcv frames\n");
>  			}
> 

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

