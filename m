Return-Path: <linux-media+bounces-17611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8496C370
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 18:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9751C21EB6
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 16:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8B21DFE1C;
	Wed,  4 Sep 2024 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F3dKjV7t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JArJVYB+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F3dKjV7t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JArJVYB+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263361DC735;
	Wed,  4 Sep 2024 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725466031; cv=none; b=YgQsx8828AzEsJueD6eQYhyzs7mWlTllhDA0tyChd6nf6gRqUCatYtY1JJp2OukFls2QF+esYikErbEVG55burccoOAxIzoqPJOFa3P4j2UBVJOk8eCNiXDr+XiL7yNRNhkpPbnS43H+p5Y/ouEuNAz4RY1duukvojOZIqYZM9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725466031; c=relaxed/simple;
	bh=xPo/yDUHt5HIsJ3otnWm4h+YkjvHTK99UykBUaSCIdk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s051Ro/cuHTqSbqHYgxXrEW/b4zlauTsiqKTTrpHye+xdEa7vRA0dVqeYE7HZnfrV3LhY6bSGtASglZVXoVtXp2PtdAzom2A84+c00a6mTMkfTqGuO7y+7NJUyo+6fD3kvYP6HC47TByYjStFrmL6hmme97Yng1A3vJX5yqIQpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F3dKjV7t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JArJVYB+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F3dKjV7t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JArJVYB+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5947A219D3;
	Wed,  4 Sep 2024 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725466028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OwsX0RzCxzLOQkOUafPWPJRk22xKNYS5/O+3IGcWB7s=;
	b=F3dKjV7t0Q7n8VBg2YGt7gwX/XRtFQHOsOaWhZFMhBTCFgFt+KmoV6VVAaiao0ZLqZEDzb
	l2zQ/emwyYMLU/7mgaiC/9YsyKvIgJttCFAgc4Fo/2uPSOO0RJvH3hWgpcaUDU+UV1WYyj
	yJjOTlFiqsWFwtK/N7l/NWR2cxyrEbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725466028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OwsX0RzCxzLOQkOUafPWPJRk22xKNYS5/O+3IGcWB7s=;
	b=JArJVYB+feprYWeFW/TzxnWQctQAmScilwmM2UG35Mg3vX5tXylv4Nm/1Npu+xZ0gZCyiv
	nm8Wj7yRpEjpRoBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725466028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OwsX0RzCxzLOQkOUafPWPJRk22xKNYS5/O+3IGcWB7s=;
	b=F3dKjV7t0Q7n8VBg2YGt7gwX/XRtFQHOsOaWhZFMhBTCFgFt+KmoV6VVAaiao0ZLqZEDzb
	l2zQ/emwyYMLU/7mgaiC/9YsyKvIgJttCFAgc4Fo/2uPSOO0RJvH3hWgpcaUDU+UV1WYyj
	yJjOTlFiqsWFwtK/N7l/NWR2cxyrEbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725466028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OwsX0RzCxzLOQkOUafPWPJRk22xKNYS5/O+3IGcWB7s=;
	b=JArJVYB+feprYWeFW/TzxnWQctQAmScilwmM2UG35Mg3vX5tXylv4Nm/1Npu+xZ0gZCyiv
	nm8Wj7yRpEjpRoBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FA37139D2;
	Wed,  4 Sep 2024 16:07:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6yQBqyF2GY6FgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Sep 2024 16:07:08 +0000
Date: Wed, 04 Sep 2024 18:07:54 +0200
Message-ID: <87wmjrh06d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 5/5] ALSA: firewire: use nonatomic PCM operation
In-Reply-To: <20240904125155.461886-6-o-takashi@sakamocchi.jp>
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
	<20240904125155.461886-6-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[protonmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,linux.microsoft.com,protonmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 04 Sep 2024 14:51:54 +0200,
Takashi Sakamoto wrote:
> 
> In the former commits, the callback of isochronous context runs on usual
> work process. In the case, ALSA PCM device has a flag, nonatomic, to
> acquire mutex lock instead of spin lock for PCM substream group.
> 
> This commit uses the flag. It has an advantage in the case that ALSA PCM
> application uses the large size of intermediate buffer, since it takes
> too long time even in tasklet softIRQ to process many of isochronous
> packets, then result in the delay of system event due to disabled IRQ so
> long. It is avertible to switch to nonatomic operation.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Feel free to take my ack:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

