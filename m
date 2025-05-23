Return-Path: <linux-media+bounces-33287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F78AC28F4
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 19:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186891BA3395
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB91298998;
	Fri, 23 May 2025 17:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GbqsbwsG"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01547367;
	Fri, 23 May 2025 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022132; cv=none; b=s9/TYwAjypT+NfoQbK2j7fRYCrhd7b7QG2KjjawdJeN18E5ngfeytsg8tR+dKHy6syFFTPbwOtHPaPGqbDJ8dc3KiTObkLRTfjhce0Mp1XPx9TdYrn5ahtqzYIEiNnpdKcdKLRLOrwZGv8UiuE2ARB2V4yEPyJVYuPf812gvoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022132; c=relaxed/simple;
	bh=8xnFGfZkpvX17dDBlT2Te+gCXFgL6HH6WpSwzTZZvB4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KQo1mwKqtNUE3OUp++gc/y+mtlXVWwZSUijlpWPFrdkuupUg/395+/9QSPCUpmVNJqwyRFC/OCmlY8b8zfTLeIL7rQaB+WyWm1Pj5ur5O3bpZHh3QGEHHbcEsRg3wemghbATOyZ1YHsiv89QZBsoN7anY5Woj/SgdFZfGRAEGrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GbqsbwsG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748022129;
	bh=8xnFGfZkpvX17dDBlT2Te+gCXFgL6HH6WpSwzTZZvB4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GbqsbwsG8/gAI475WJiVMV2cUrcqVA80u0sojp00wG6kR/RA+eXIMmxkzNcIWDoXF
	 wT0XL8aFFELFc5SAClifJtdJRJx/0oweYyxdquwjPe+oC8nhUCC2BRFgs0fqwnTcpD
	 KO5ZhZ4NaVtcBck31o7MtIw5J6m4HajXhysB6m17GI50DT7p39wZEgGo34TnHOmw5R
	 QXu2BhhB0eivSNGFBSyQrUxW5hzRuVRKig9tzbe3lUw1/wKWMudBz6LoM8MCB3ty9t
	 mHyRBbqZlsA9dwtufDjfyCkC+deVIc6EFtXOTterIoPRvW/aEWY8lz+vH7wmrohkgy
	 ZlxWz8oKrjVuA==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C660417E1135;
	Fri, 23 May 2025 19:42:07 +0200 (CEST)
Message-ID: <ab06cbe0d1c30e8fde725eabbc504932a9512692.camel@collabora.com>
Subject: Re: [PATCH v2 5/7] media: chips-media: wave5: Fix not to free
 resources normally when instance was destroyed
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 23 May 2025 13:42:06 -0400
In-Reply-To: <20250522072606.51-6-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-6-jackson.lee@chipsnmedia.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le jeudi 22 mai 2025 à 16:26 +0900, Jackson.lee a écrit :
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> Since applying performance patch, there was a problem not to free
> resources, the root cause was that timeout sometimes happened after
> calling the wave5_vpu_dec_finish_seq() when application was closed
> forcibly,so if failure reason is WAVE5_SYSERR_VPU_STILL_RUNNING,
> the wave5_vpu_dec_get_output_info() should be called to flush videos
> decoded before closed.

Either squash, or try to bring before too.

Nicolas

> 
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../platform/chips-media/wave5/wave5-vpuapi.c | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-
> vpuapi.c
> index 68d86625538f..d7318d596b73 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -209,6 +209,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  	int i;
>  	int inst_count = 0;
>  	struct vpu_instance *inst_elm;
> +	struct dec_output_info dec_info;
>  
>  	*fail_res = 0;
>  	if (!inst->codec_info)
> @@ -229,11 +230,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  			goto unlock_and_return;
>  		}
>  
> -		if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING &&
> -		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
> +		if (ret == 0)
> +			break;
> +
> +		if (*fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
> +			dev_warn(inst->dev->dev, "dec_finish_seq timed out\n");
> +			goto unlock_and_return;
> +		}
> +
> +		if (retry++ >= MAX_FIRMWARE_CALL_RETRY) {
>  			ret = -ETIMEDOUT;
>  			goto unlock_and_return;
>  		}
> +
> +		mutex_unlock(&vpu_dev->hw_lock);
> +		wave5_vpu_dec_get_output_info(inst, &dec_info);
> +		ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
> +		if (ret) {
> +			pm_runtime_put_sync(inst->dev->dev);
> +			return ret;
> +		}
>  	} while (ret != 0);
>  
>  	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__);

