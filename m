Return-Path: <linux-media+bounces-58626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC1lHYOZ3GkxUAkAu9opvQ
	(envelope-from <linux-media+bounces-58626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:21:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E73E8286
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7415A30055B2
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47733392C4C;
	Mon, 13 Apr 2026 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1jEkIGW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA1C38947C
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064895; cv=none; b=k70Jz969nG+qi52XY6Y42bsRQP2qAGkYsNrEGPTjIhHPGNDPHFWhF+4zwhY3YA3PASw2pYifR+tqUHVCHxuQdjoPEYJVz4NRs9Xa4hfa599VgDdPrEF/fh/grUW88Vut4Rk3psOuxra8Nv6CeOcE8M+CWUt2G7SIJvv/wrY0Rjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064895; c=relaxed/simple;
	bh=dPLuupoDLLr+Wx19Z3u7DYxO18a6a48VRDBlxNU+JIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkAsvWWcXu9I/RvYVJ4brDoO12JCDEO+uOYXIV3f60qdoTYwfATmk2XRvsIAk5745LI18QHSlSeOPG52Gypj8ysnNbZkyzUbbaEyKjhFRRlkTiDejcmt1Uo26ePKY/xKxEhkrcLugzBP9BS7s/pxZn/Hfy7W8jeivzHUK1fa+0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1jEkIGW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d73352cf2so716364f8f.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776064893; x=1776669693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iw4ljpgUqAKzzrRRr5hlS15ea4IPkp99uerSPaTGYwg=;
        b=V1jEkIGWqG/8/6P6LxcgA4AGNYqZ+EbUWeu/rDfz2cAaywc7oCBZ0bLzhP7OkWPeOv
         AHr6P1KOBXsl/x1Hi3A6FFTUcYmVL/lpdXUJUFsgDMhCWLF+7qwmumf71NEPz7L9mq3i
         aVJE7mAc31AOHz8L6cyGoCRSBIv9ofBta42XMCqkwodI/X/jJ6u+Y/8qF+LNYb0DTAhI
         sQt9P+Sr5FvRdBrNtNVEfVbQg+3yARWn5j4k2hoDGdhUEBOmdKfbHXSWkbnwDqAXi16m
         leUiAtPRFKR++co+h9FArK+FMkrpI9wZU8HeJECK3GBfjZJVJUSGbHMDEFpO1V1lp7Ip
         vP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064893; x=1776669693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iw4ljpgUqAKzzrRRr5hlS15ea4IPkp99uerSPaTGYwg=;
        b=lYRuB6gaDBfYuvlZlKDOjw7i/9XzKV4e44NYRCQfR950xTGtnmdXo7XEb+kHU/n0o8
         G8ZP3qolwQUpydyN4CTnmIl44sbjIHh0XebioU4qgJLNTX9O24iEalydE/LOgOiTmTXr
         YrKjSiLJ0TNXPgcfqPwcHYgUgPibJIxbXUE1a8D9GHLW5YJz6xfdKDoScKH9gcoqRvRj
         DupyYT6bI4ouZPsaK1DiicWrmL5PhcmwfxEvzDFuBmufa+K/FjaYYmF3KJvPRUoATf4k
         EIeawq/MZycWBMomMaggJsLObVpYDzo70DpTPAEnhIoIqEvOsLhHcBF14rNe0zQP4GR/
         Kkow==
X-Forwarded-Encrypted: i=1; AFNElJ+S9XSU/Q8Jlk3zgJrjOO7J3vM+3uEQX1PHc7/WGhcqwAtU4D+XGgb3N9izL5qfAID2qqs0qiz18MqO2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa4wyLR8AYI8soogBV0IM17gRkNX7tLIpJCtzIQcp9vuhMg3bk
	qAVyWm6OjSEU72Y2TbuZv1raV9PuIUPG4/KLGaMbGXGS1yfsRFVW4eAz
X-Gm-Gg: AeBDietRaI61q1o46PJzKzKldtm9gylRaZsgiTr/HWOeg7lku/u/XKFkzsJNRxY5arT
	YyUkrr24s2HcxR1pYfIvQxKJncYH8/hyPp76gJi8DdfGssfLVTGtdZbEo4yhYkTGb89NvIlsMgo
	qTpv1FK+G+zSZU5DV7UuzKqpOcwtt0p/t+qQTD4a5zaMG8HvI+ELWtyKxjDBg+iG5LIS9UqKCZc
	DKHYcra2IOCy6ssnPK79/xX94IPmQfGn/PtZeXTOC3El45eBO1yvxMzb5dwoCqAkeqes7LbBHk+
	sUIa5gswNvYDTYYJ9RZ+sZsid6AhToXT5657bRwRJ1u9jhTOZxXxkbZCZ4x/caR6KI+mlZLC0Rs
	KVl+HI8wyYqqpKt6NGiCpvRJ8SUXPG9fAC8VFLgKljDmF1lzC5pKzCjF9agTsuUJD6HK8uEfMnw
	HcceuP4gJdoC1XobtqUdKwN20isVpEIw==
X-Received: by 2002:a5d:4b05:0:b0:43d:7508:c9c6 with SMTP id ffacd0b85a97d-43d7508ccafmr4141774f8f.28.1776064892744;
        Mon, 13 Apr 2026 00:21:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7c135fd6sm3713097f8f.28.2026.04.13.00.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:21:31 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:21:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: tegra-video: add missing error
 checks in vi_tpg_fmts_bitmap_init()
Message-ID: <adyZeOe1aL-0cSB4@stanley.mountain>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
 <20260411211006.150782-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411211006.150782-2-hossu.alexandru@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58626-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 1A1E73E8286
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 11:10:05PM +0200, Alexandru Hossu wrote:
> tegra_get_format_idx_by_code() returns -1 when the requested format is
> not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
> check this return value before passing it to bitmap_set(). A negative
> index converted to unsigned would result in an out-of-bounds memory
> access, corrupting adjacent kernel memory.
> 
> Add WARN_ON() guards so that any future SoC addition or Kconfig change
> that exposes this path fails loudly rather than silently corrupting memory.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index afc7327ef318..e6416ea8503e 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1025,11 +1025,15 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  
>  	index = tegra_get_format_idx_by_code(chan->vi,
>  					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);

This will only fail if we can't find MEDIA_BUS_FMT_SRGGB10_1X10 in
the tegra210_video_formats array.  The commit message makes it sound
like this fixes a memory corruption bug, but it can only happen if
the memory is already corrupted beyond hope.

Please write the commit message to be more clear that this is not
a real issue in existing kernels.

regards,
dan carpenter


