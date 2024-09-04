Return-Path: <linux-media+bounces-17610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A396C36C
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 18:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17EC32833CA
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 16:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510221DFE18;
	Wed,  4 Sep 2024 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oQX1xVVA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yo609B0v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oQX1xVVA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yo609B0v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0471DC184;
	Wed,  4 Sep 2024 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725465998; cv=none; b=m5kZyHoA86B2XFKSYm2eJx8cM/nrRB+i+6EC8pKU5m8hD/kevQfbahf8cTtmAvGqZIQBR/S2Q2upPGtsRP467T4yt7ji/VBw2Dh6Ow3kTuoODCYjcfeJlrkQgkQKTvYEdXcp/Mz/oxd1x63CdtidUvowMaH6eie1tzKLQxvrUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725465998; c=relaxed/simple;
	bh=l3HQZJah92C3OPaWoFQv4njcuO+HSfMzkw/gomG4vPY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7yF5FdH+6j0rTMC7I7kqG1d5WQ/GaQLj17pPnbeHiiAE198X/q8nYiQHR/hzQtfQApmOyribGevte1Uo6c61PhGvWKMGrtuuKtAgCWPRwU8vAmLi6nPSFIVBWa6BWT8+EQvVZdXeYhjbcvZ0KaBpJYn5obtsK9lci7lq4HBfZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oQX1xVVA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yo609B0v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oQX1xVVA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yo609B0v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E21C219D3;
	Wed,  4 Sep 2024 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725465995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmu2mE/mxmqcjLDmCHNPl0Va+ZcStvQbZAZzFFVoH08=;
	b=oQX1xVVAufECcvj4cwOaaN/BmznDzpFLpE318gGHBy7CdRqwj1Eqb6W9APjJjEH02R7yP/
	xsJvpNPA7KEigVn6hT7baRze8j1weJnpFKfsMr2E2iJlR1e78BrSm8tMcDg+jc5cz4Y/nD
	PHuNgYx4OQep7/eBNWWu3eJJo3C/N5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725465995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmu2mE/mxmqcjLDmCHNPl0Va+ZcStvQbZAZzFFVoH08=;
	b=yo609B0vj9aa4mNPz+JIbwneoov4YLOZmFf+GKtVceMVpZwtyzmsDaGtFFx1MYyvmwwHma
	YZlb2MKcNxm8rCCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oQX1xVVA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yo609B0v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725465995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmu2mE/mxmqcjLDmCHNPl0Va+ZcStvQbZAZzFFVoH08=;
	b=oQX1xVVAufECcvj4cwOaaN/BmznDzpFLpE318gGHBy7CdRqwj1Eqb6W9APjJjEH02R7yP/
	xsJvpNPA7KEigVn6hT7baRze8j1weJnpFKfsMr2E2iJlR1e78BrSm8tMcDg+jc5cz4Y/nD
	PHuNgYx4OQep7/eBNWWu3eJJo3C/N5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725465995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmu2mE/mxmqcjLDmCHNPl0Va+ZcStvQbZAZzFFVoH08=;
	b=yo609B0vj9aa4mNPz+JIbwneoov4YLOZmFf+GKtVceMVpZwtyzmsDaGtFFx1MYyvmwwHma
	YZlb2MKcNxm8rCCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F4006139D2;
	Wed,  4 Sep 2024 16:06:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EPwnOoqF2GYIFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Sep 2024 16:06:34 +0000
Date: Wed, 04 Sep 2024 18:07:20 +0200
Message-ID: <87y147h07b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/5] firewire: core: add local API to queue work item to workqueue specific to isochronous contexts
In-Reply-To: <20240904125155.461886-3-o-takashi@sakamocchi.jp>
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
	<20240904125155.461886-3-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 3E21C219D3
X-Spam-Level: 
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[protonmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,linux.microsoft.com,protonmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.51
X-Spam-Flag: NO

On Wed, 04 Sep 2024 14:51:51 +0200,
Takashi Sakamoto wrote:
> 
> In the previous commit, the workqueue is added per the instance of fw_card
> structure for isochronous contexts. The workqueue is designed to be used by
> the implementation of fw_card_driver structure underlying the fw_card.
> 
> This commit adds some local APIs to be used by the implementation.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-iso.c | 30 ++++++++++++++++++++++++++++--
>  drivers/firewire/core.h     | 10 ++++++++++
>  include/linux/firewire.h    |  1 +
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
> index 101433b8bb51..af76fa1823f1 100644
> --- a/drivers/firewire/core-iso.c
> +++ b/drivers/firewire/core-iso.c
> @@ -211,21 +211,47 @@ EXPORT_SYMBOL(fw_iso_context_queue_flush);
>  
>  int fw_iso_context_flush_completions(struct fw_iso_context *ctx)
>  {
> +	int err;
> +
>  	trace_isoc_outbound_flush_completions(ctx);
>  	trace_isoc_inbound_single_flush_completions(ctx);
>  	trace_isoc_inbound_multiple_flush_completions(ctx);
>  
> -	return ctx->card->driver->flush_iso_completions(ctx);
> +	might_sleep();
> +
> +	// Avoid dead lock due to programming mistake.
> +	if (WARN_ON(current_work() == &ctx->work))
> +		return 0;

Maybe WARN_ON_ONCE() would be safer if it's supposed to be called
frequently.  Otherwise it can spam too much.
Ditto for fw_iso_context_stop().


thanks,

Takashi

