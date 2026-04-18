Return-Path: <linux-media+bounces-59084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN+8Bf0B5GlxOgEAu9opvQ
	(envelope-from <linux-media+bounces-59084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 00:13:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F1422597
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 00:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7511A3029771
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 22:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81064346FA6;
	Sat, 18 Apr 2026 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="DXMEgVnE"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7967D7260F;
	Sat, 18 Apr 2026 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776550387; cv=pass; b=IjbIJtmoCf5Nlmuo00tevl6OusOIl0t8zV98uH8P/uRtU1/H0aZ7TF2bObYuExREWuqJTMKyh1e3ZW+pnUtdq17FzLPC70MxP19ium21rDMRSOHgvno8f26Kpg8ieVOb+mxUI/xRk13JOQ/4c/tKT5U3cHYIkX9PSNcQ3uUsxZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776550387; c=relaxed/simple;
	bh=eZ9fGj7rWXDo/FC9jVYj0iuO9cHnEbJBbMiAT/1AbQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8gSceFIluIQFSiYmrg4CLF+jBdZgKzNbNAQSA2wDnTpyAgv6OEVUtqWPqBSUqBaLB2sEydSDZZ3kJgRmRNsk8VIECTUXyu9SA2ogBi0bG450ktv6evk5En80NVfyJipv/LT3AREkkMDcN56FYMU2KMgezTaEta8LZfuGULU8HQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=DXMEgVnE; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fymGL4lZvz49Q6R;
	Sun, 19 Apr 2026 01:12:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776550378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16P8mth32rfV+ClQlpvXTgREUfMstwGC184Z9DquGF8=;
	b=DXMEgVnE0HsMw2420biuWHrceXei4P79OjTCIqtx6cooPQET/Cw6w3m611ChKbAyRUFjHu
	oTKAeJbEWAQ5I1hqL8sSIBZouwQG3GVXGDlIg8+ohT1ygoWXGTYzbqwUTcgqBC9eXTtEYU
	bmHeHDymKgj6NUTyD3QU5763OTcLcsRjNSCGUg/m2gAvmJt2p9DdjAijNkltLd6X+nS3fJ
	4bYNnwMvh66vVVcNT1bWUHfUEoC6jSz+QFI+stKnRMa9kUFirWsjWQYqqsdd6NCcNgk6Yk
	Sf9oH2dNlOq1+BQwmzgMm4FNp0iouo2L8BduNZIOjSek8T+QjVXz5PFwsQAHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1776550378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16P8mth32rfV+ClQlpvXTgREUfMstwGC184Z9DquGF8=;
	b=skRGIA779Pc+6qzjTd87WDiAY/Jg/ailGSVXGF4M9k0bHZASzFDgALtLaMg5eshiGUuXr5
	tFZy8pixB7Rp7LIaWB/iI6GL/GXTjaJ7PutePhMrc3oP27z6oRAkT41gBtzn4nQgdtOVRd
	hpN7ITT+JuOc+EF+0xDH+Vmd9iGCkhHxU4rOLEi1aK5w7xYeNWZaJo7mJc0nftSisWixwT
	ge1lVo5Sn406FweHoK+GnDbKSqIX1V/wCbK9ABktxuL0TmUDMgvPbIdaQ29JCwwUNztaa7
	O5LIpGDxUPlOXHUkYXcKRuj8GaPdTPKrAsE8p6mHTQhUWYYMzCDrgKUKEvRjsg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1776550378;
	b=OWttlKMUXn6upULYhURNPtmn/awaPGZP+VWz+k7/Y640Lw7kB6XrsIXQgQt4dQWsehWphN
	a4TnRgon3hi8EH9IlJ/4jWNM2U5T/VZNz4PfbZ5QBdltShs5N0gFqpylckkLO/jPhG3aZn
	joLzQIAFBrrJnv/gNK3sWaQZkeClJuxNsufHIvgnDcc5EZHl6g9Mu4G784eFguihFA9Jyf
	RY7d8j85Zs2RQa9vz71/0w+8LwO53jzefz+WjvOQW7MtxEO+wN5/AjK2hR+afBf24N2O3f
	WK+smjB2LpuMS+WWHSRuToMOdeh2wFRX5aMszp6RCT2e9BGE1o6LQq1JZPwKsQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8E0E0634C4E;
	Sun, 19 Apr 2026 01:12:55 +0300 (EEST)
Date: Sun, 19 Apr 2026 01:12:55 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix block comment coding style
Message-ID: <aeQB5w7EYm52zYND@valkosipuli.retiisi.eu>
References: <20251227105520.23086-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227105520.23086-1-karthikey3608@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59084-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[iki.fi:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D9F1422597
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kerthikey,

On Sat, Dec 27, 2025 at 04:25:20PM +0530, Karthikey D Kadati wrote:
> Fix the checkpatch.pl warning:
> WARNING: Block comments use a trailing */ on a separate line
> 
> This change aligns the block comment at line 1384 with the standard
> Linux kernel coding style for better readability.
> 
> Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>

Thanks for the patch.

It no longer applies to my atomisp branch. In general, it'd be good to fix
a few more issues of the same kind.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 3a4eb4f6d..327836372 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1380,8 +1380,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
>  	if (atomisp_css_get_grid_info(asd, pipe_id))
>  		return;
>  
> -	/* We must free all buffers because they no longer match
> -	   the grid size. */
> +	/*
> +	 * We must free all buffers because they no longer match
> +	 * the grid size.
> +	 */
>  	atomisp_css_free_stat_buffers(asd);
>  
>  	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);

-- 
Kind regards,

Sakari Ailus

