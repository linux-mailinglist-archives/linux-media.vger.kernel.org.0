Return-Path: <linux-media+bounces-29994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67FA85119
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 03:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DFDD464F7D
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 01:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCFF26FA72;
	Fri, 11 Apr 2025 01:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WVka6cmP"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224E61EFF9F;
	Fri, 11 Apr 2025 01:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334047; cv=pass; b=n2WCSyRRbgbC3vnvkV0nROCIC4uzk1HF9pqR2QsP2yjaiuUYS75/BaOeSOF8M2QWgT2uuGXzuZiFJmkb7aXbcv+y2VjyxBNaElXg0IJeGgaW0kDEF5eW0Zj9QDldNSTRsD7bONHM/aWsJrNQ0vGBNiirDPKvvYKHWFvKBiELSl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334047; c=relaxed/simple;
	bh=I7i+GIouev0t7n+43O6YASB7FxlfVGMD0dqBCQj5mJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxJN6oW70aUgHdHg45xYArnwMrFykLBDe4Mw/RiAZZfKmPGoQ6EjIEAQpsEwMP/Qak0qA0FYJ9BtMlcuRjMip6FZlIcsKk4QoURE3ZJqdiO3gHD+J3hggfl8pMonJNii8t0UNQduQIvBEq4oaxm7oZzprGGNI894iSaORsR8EzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=WVka6cmP; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744334021; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z5hnocibtqfSSHECQLrySBsEKPruFhchv0MhtyASs9fPZLK2UN6E6tWfe+lodd2ROXCgDU9rqvZHls8mxmwEH4TZFoykUSlg/2okZEJKiLvlk568+vUOgMrc8lCTWybYaBDtgcNRZuOgLmLInzvyEGBXeTjIluBzZCRjg2giefo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744334021; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+gqP9OdXVjB01afAL7nFZ5jI3eFKniYpprLC4MIIIfs=; 
	b=TJEjxh6cUMMuQiSSOxEpS86teGloynnHsPUtHfEwoOGkiOrSps+kRa6gM2veqz6VOgKq/VnezbPaZCEaH+/LkyecTjG3ONPf6vKTYDOmEZXxzxjvSw4/cwV5zWZwQygSfDKy+Io49WpipNF46PpQevOioBt0JWIfaeEBP7rHqKY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744334020;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+gqP9OdXVjB01afAL7nFZ5jI3eFKniYpprLC4MIIIfs=;
	b=WVka6cmPAyOuIMoxh2Zj8x/58d9NEVmwzelxWKAxBVx2NX5ZAB1XY0qUwpv66dnw
	IaWCF9rIRLsY4xERLirDVxCrRCH3m+7pJxhm/VBhy9wITYQUn3A1YM5X+PQfQoC3AvH
	ZJkUjvCG/Sajs6rd/ES04cybE7XaGnBpuy165Bco=
Received: by mx.zohomail.com with SMTPS id 1744334018182980.3859780297824;
	Thu, 10 Apr 2025 18:13:38 -0700 (PDT)
Message-ID: <1ca0fceb-ebca-45fb-8733-0018843b8075@collabora.com>
Date: Fri, 11 Apr 2025 04:13:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: synopsys: hdmirx: Count dropped frames
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
References: <20250410-rk3588-hdmirx-sequence-v1-0-aad3f216d351@collabora.com>
 <20250410-rk3588-hdmirx-sequence-v1-2-aad3f216d351@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250410-rk3588-hdmirx-sequence-v1-2-aad3f216d351@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

10.04.2025 23:43, Nicolas Dufresne пишет:
> The sequence number communicate the lost frames to userspace. For this
> reason, it must be incremented even when a frame is skipped. This allows
> userspace such as GStreamer to report the loss.
> 
> Fixes: 7b59b132ad439 ("media: platform: synopsys: Add support for HDMI input driver")
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index f5b3f5010ede55bde28756da326a434cc9245492..7af6765532e33239f4260b29ea82b31494b66213 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -1956,10 +1956,6 @@ static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
>  					vb_done->field = V4L2_FIELD_NONE;
>  
>  				hdmirx_vb_done(stream, vb_done);
> -				stream->sequence++;
> -				if (stream->sequence == 30)
> -					v4l2_dbg(1, debug, v4l2_dev,
> -						 "rcv frames\n");
>  			}
>  
>  			stream->curr_buf = NULL;
> @@ -1971,6 +1967,10 @@ static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
>  			v4l2_dbg(3, debug, v4l2_dev,
>  				 "%s: next_buf NULL, skip vb_done\n", __func__);
>  		}
> +
> +		stream->sequence++;
> +		if (stream->sequence == 30)
> +			v4l2_dbg(1, debug, v4l2_dev, "rcv frames\n");
>  	}
>  
>  DMA_IDLE_OUT:
> 

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

