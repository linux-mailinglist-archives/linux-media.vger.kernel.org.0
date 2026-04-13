Return-Path: <linux-media+bounces-58630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DRzG3qc3GkxUAkAu9opvQ
	(envelope-from <linux-media+bounces-58630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:34:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C80FD3E84D0
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAD96300D17D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E38E3939D6;
	Mon, 13 Apr 2026 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0xUq+Q4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C338AC7E
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065652; cv=none; b=XfQO0lxHr28DF5g36+P3hkRTWCg0n7PQmDT4u7uZGMET7XCjXyvVD79NG0vzNAR9Lzkel5rPqLxEaTcj2XSIRebiskN9+HTOKFx10+MXTS5kItLPamrGmDqORPpBmkFTiYhaOlJLN5rUOqRakd0cOsAnDT1KaIkgt6hqcu5rJKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065652; c=relaxed/simple;
	bh=e6BQAZGUgVAkgKcYanzsYKMx63YC+gNCChBKEtZTy5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af0T9Y7w1Rc0mtrzfm6MrC+h0A369AcqrgX/7Gxk8/Zckywh5D2j0EL+moJ7KnG4m1d/dHnSRcDj1VJFHLVu66lIYCGamz+ACmtews1daw/zz4HxrecVNEbsB1JgMjcRFtGd3MgwjRO8Pwghilf0/HcaELhOcAV6kxcNs3qtiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0xUq+Q4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso159938f8f.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065650; x=1776670450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HEasNH32115c+BoQHyOfy+FArvbq95odOHWQ7HgwtU=;
        b=E0xUq+Q4qhtBwrOWeaPcMpTD2As0MFGwL/PO1h25s/6Utw+tkSbYs0QFZQyQOx69RT
         /YGrf4eOMqCecwQzcP0vOagV+KZjyjPTuDldHo/6z2LcQP+q4O9VzILrHgJLjpPanbCk
         m3B5Ag/BbKXc/HfO2Mf9JjfnZZVvaOs6a1fwx5YwEM1iQUET/brQr8kPtXc5I0fL/h1F
         zzF5RiLvNsvl/fUzMU68pfEVhDg/4ZQIJlHugfgIU8Grq+SucwWInIATKoY3psiRPwfg
         eIF5Xd1lzXNTYv7QfM60u+6pqvIPW4mwp426B36WOqWaQ3nkwGH5fweEXe5ySyZ2vren
         MF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065650; x=1776670450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HEasNH32115c+BoQHyOfy+FArvbq95odOHWQ7HgwtU=;
        b=GhQVsnonpMGzflXQI7rGowh5W9F5FCrwgrrtcxTQ4VlG6rNPzFGvjap8Zh7usNGe4U
         d2BXmfSa+UmrupbrNq3nUxOkj1UwjLl/MCWiJvcIcQ42ur62vqGnz7xQtFSR+5ni9jFa
         Hoy2DsxrsKfdl2Z7gY8VWopEyF65HZ/QtRrJISMdUro/SNHYPM3frZ7rq5bhS9co3x4b
         1WKf1MltfNtHSVaxrBv5tWCbyMTozxIcclqJy2gg6z9FmA3DcYf2jrBCeVFRxXYPXp0G
         eUeWOmW5OtWw47KTjPAmkR7tnDNMQ8vTyDMUHx04o7JrDIHHzyI6XsflR/bEeRD4Wegf
         GScg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z7h822hzuos/PlN7j7CQeRg0IgIPIdkS7Qe/urp9jKfiKtI24dwuanOdAjtPofGtevxaFTDZGmiEhaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJahBI2hud0KFM7CB2CBQnWaCrt+xCz4y/6iX3uNHshbPLBdv7
	EwJMIVJlDMSMxLuCDWzTCHDzPlyS70NJuY1mgrLpuSbLyhPLMX7OhqOz
X-Gm-Gg: AeBDieuiuaFe1PF4i66hDX2bdIqsl6fZurfLAJSyqYJ2idsAIAfRiqN8Pe8gRD/dA4C
	0y39RuqOAAQj9TH7h9k3d1SAx58w9SAy8x4/n4/jIxT3AA6x9v/LJcLYBX3+lNUoIspoVNY/+kZ
	mcLS8mTq9fpkLxlAAhVkgiRHL9ZQ7Ho8KYKX3XbbFUndK4FG5i4hFVR+W6PnfiZK5mzmS16woca
	1SCmBJwgWjk78BY75oSMUsHJATx60YfyOZmnwg72IS3DSjBfGuG+5865qzSkB8yPkudX/1i7uAB
	/vEJv4Aw45dzv341b+q+nabahPjodV7w/Kh2FgwJQ1yiWaS/IimVFm6sPmEdM3e3RyWR5W+YeIV
	nnK/0i0Totb3cRKWKC6aBwgioSQjcAhuxDPpQCxstu4KagwcFOO5sKXmL15QP0Iz+oM506YLd0Y
	yVg3tvoMd4vB/7zBsBhvg=
X-Received: by 2002:a05:6000:25c6:b0:43d:7cb5:43a6 with SMTP id ffacd0b85a97d-43d7cb5513amr831948f8f.2.1776065649604;
        Mon, 13 Apr 2026 00:34:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6f4bf2b4sm15189470f8f.20.2026.04.13.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:34:08 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:34:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: vi: fix invalid u32 return value in
 format lookup
Message-ID: <adycbQO7qXN5Uq8D@stanley.mountain>
References: <20260412000245.26696-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412000245.26696-1-dennylin0707@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58630-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C80FD3E84D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 12:02:45AM +0000, Hungyu Lin wrote:
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL
> to signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
> 
> Return 0 instead to indicate an invalid format.
> 
> Callers assign the return value directly to pixelformat, so returning
> an error code encoded in u32 is unsafe.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 9c0b38585d63..966792a6ec19 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -81,7 +81,7 @@ static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
>  					  unsigned int index)
>  {
>  	if (index >= vi->soc->nformats)
> -		return -EINVAL;
> +		return 0;

Someone else just sent a patch for this which added error checking to
the caller.  I liked that approach better.  (I haven't checked to see
if your approach works).

But either way this needs further review to see if the bug is actually
real and if so what is the Fixes tag?

regards,
dan carpenter


