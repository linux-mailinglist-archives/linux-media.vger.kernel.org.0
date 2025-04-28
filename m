Return-Path: <linux-media+bounces-31230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 039BBA9F745
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 19:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71D081A83EE9
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 17:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AEE28F92C;
	Mon, 28 Apr 2025 17:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KOAlFSVg"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA6C28F529;
	Mon, 28 Apr 2025 17:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861168; cv=none; b=aMEr3HoyKoqKmi4hy/yQxuNbKLyyuS3dIizTT3wPw73RPPScrjhYxLG++uaHfeGE756C/9f9KMbxFb9zXnAfKxTmBjf7DuIL7cYwW8iYuWVHqro9UiSl8culVMFjxZjOcydlag1xKY4s0TBhVG4lQ2ELsXIqUtfnWV4jBCZo+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861168; c=relaxed/simple;
	bh=cmQBBf3nlrtWpI6KU14LdCq98gV6uMF56G0Dt/F29vA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cnFDqkil5T3n+1u7nLkt6ZZWjUCvwhr11XADz0m4m5lzM35tQ8ejoYchezzY5DFN6xSBmg0FCg/ub7re0kOvsi6iIb77ME2utHtM4zcjgSzjYOMUaiCSbUynKWqdHFkesdgxwZ1NJF/IB6XgAAnLUYPNJsUrzpKKLFLGDWngVyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KOAlFSVg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745861161;
	bh=cmQBBf3nlrtWpI6KU14LdCq98gV6uMF56G0Dt/F29vA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KOAlFSVgb2w2fzFPmcnlJp+nWpbUg6M2Ysqyv50fykpqHWN9svrNe0ta8xSRTGVah
	 Z3/mBDRwsqzu0rYvgsEiKkE1hTyFgYusbxwwt+gly7F/7mmjoW+K8qYdT6hADMknhQ
	 /dBqMPKC45u3E92n++ouWpnh7JWs+zcmWk+w+EXgtEOyEcCvo+hxBEaFICJrezbZY3
	 tvTeAi07VF+7r52N/Rlo+6o2xaG1RM+oTd7LQhh9bokm2GVFX0GcUG+ux7OAKQX9tm
	 UIcXbOLx0r16fMz/Ygz4QAol8VO2adR32dcrL+wFqMTgUvkGiYryl++jsva7K8GUJP
	 ye0BP1hUYsnAw==
Received: from [IPv6:2606:6d00:15:9913::5ac] (unknown [IPv6:2606:6d00:15:9913::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D3E717E0F66;
	Mon, 28 Apr 2025 19:26:00 +0200 (CEST)
Message-ID: <d901822b2710a2d642f1372fbfb53f99f1e60b2e.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Free post processor buffers on error
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	kernel@collabora.com
Date: Mon, 28 Apr 2025 13:25:59 -0400
In-Reply-To: <20250425192447.227063-1-detlev.casanova@collabora.com>
References: <20250425192447.227063-1-detlev.casanova@collabora.com>
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

Le vendredi 25 avril 2025 à 15:24 -0400, Detlev Casanova a écrit :
> When initializing the post processor, it allocates the same number of

What do you think reworking as:

  During initialization, the post processor allocates the same number of

> buffers as the buf queue.
> As the init function is called in streamon(), if an allocation fails,
> streamon will return an error and streamoff() will not be called, keeping
> all post processor buffers allocated.
> 
> To avoid that, all post proc buffers are freed in case of an allocation
> error.
> 
> Fixes: 26711491a807 ("media: verisilicon: Refactor postprocessor to store more buffers")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

If you are fine with the suggestion, I can make the changes while
applying.

> ---
>  drivers/media/platform/verisilicon/hantro_postproc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
> index c435a393e0cb7..9f559a13d409b 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -250,8 +250,10 @@ int hantro_postproc_init(struct hantro_ctx *ctx)
>  
>  	for (i = 0; i < num_buffers; i++) {
>  		ret = hantro_postproc_alloc(ctx, i);
> -		if (ret)
> +		if (ret) {
> +			hantro_postproc_free(ctx);
>  			return ret;
> +		}
>  	}
>  
>  	return 0;

-- 
Nicolas Dufresne
Principal Engineer at Collabora

