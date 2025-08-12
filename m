Return-Path: <linux-media+bounces-39577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A59AB22582
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 589711A26804
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401D02EF645;
	Tue, 12 Aug 2025 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S8zR2e2K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G0dToPMx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="134V7J77";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rd+o4RgY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5DD2EE602
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996888; cv=none; b=iSp7iys0aFgxGz/f9HQn+9z0Yp4BZHzuVgRemC3bfI4d++FoNqK16X5QJ7m6pTYqg2Iujm7d9BYlVAog8T5Ug1KzFy7aUGia85Ic+GVHfFzcIfkPrnpY/poV5F5ncqFHyFczoLV7YFruwW/hk8olA7jzl1mRQrKjTXLPZwHBieQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996888; c=relaxed/simple;
	bh=WnAXs8sUOKcPKdO7LQ8/9Ps9rFCgxNc9yrW+nYqSQkg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=soHXHjS5rhaFFrH35dj6Owk/7HTmOPKxK/s76P3J+EDJOpxmSCNYfrXBNok98YsABRGfhx32Led0SjXoYw93ABczM85fchOEE2LxHQIKQ/uSduZA5PO8QfVBBOODOiKuNWwgvnPbcJhVw55ak5N87iNwA6ShUqclkpMqhMnGKcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S8zR2e2K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G0dToPMx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=134V7J77; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rd+o4RgY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B983C21C5E;
	Tue, 12 Aug 2025 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754996885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+Pq+HWMOwp0lxxt7RjXumdt9oJHQterGtSmWXVf0m0=;
	b=S8zR2e2Ky0Tl0AVVR7GRobH8pn04HJHoHsY++xsuJPudxP9vSzF6sgovK03TfxELq8WzBu
	eNFcan5QhsBSPjhG7EKLQRJYev6ZMSP+RkOz81SEJq+rLRJIt91c3b+CjnNfCl4LPyw/eQ
	OcLBmY0P+IoYPDAuza6Qa10GbTAlH8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754996885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+Pq+HWMOwp0lxxt7RjXumdt9oJHQterGtSmWXVf0m0=;
	b=G0dToPMxRl2Lfw0GnvagTFm9sUQ5deL6I8usuDxhuw9uRWkQ6CU5lZ5tCUHysIS8e/JJEF
	f69J+HOdxqTb9iDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=134V7J77;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rd+o4RgY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754996883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+Pq+HWMOwp0lxxt7RjXumdt9oJHQterGtSmWXVf0m0=;
	b=134V7J77C+ndgiw+lL+WMR2wzokp1IR0YIjOL9uNNSMZjXkpIT5mM1MAxVjRUFF+FGj44r
	BeLRbrJPnk+Ewrfot3DoEUGNx0TpvOTg1nomxVYQKKbHlWntffMedjxcObfbnjieMClcc8
	fjUvEOPT1gCGhdp/CvPQbOW9gA+qqMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754996883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+Pq+HWMOwp0lxxt7RjXumdt9oJHQterGtSmWXVf0m0=;
	b=rd+o4RgY2c3kd9ui1kz8rf4ExHKD28a1Gdu06+3wUMo67EXkcFl2hfts+EhZyt5PXeobVQ
	QJ79+7tSSMytUFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 769111351A;
	Tue, 12 Aug 2025 11:08:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DstoHJMgm2jJFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Aug 2025 11:08:03 +0000
Date: Tue, 12 Aug 2025 13:07:57 +0200
Message-ID: <87ectgztki.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 5/8] ALSA: hrtimer: Avoid direct access to hrtimer clockbase
In-Reply-To: <20250812-hrtimer-cleanup-get_time-v1-5-b962cd9d9385@linutronix.de>
References: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
	<20250812-hrtimer-cleanup-get_time-v1-5-b962cd9d9385@linutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,linutronix.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B983C21C5E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Tue, 12 Aug 2025 08:08:13 +0200,
Thomas Weiﬂschuh wrote:
> 
> The field timer->base->get_time is a private implementation detail and
> should not be accessed outside of the hrtimer core.
> 
> Switch to the equivalent helper.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  sound/core/hrtimer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
> index c364bd126ac8b311e3ce899e226ff9fd82c4485f..2d5f4d47071f79d7db24c8f004f0f4154808fdd8 100644
> --- a/sound/core/hrtimer.c
> +++ b/sound/core/hrtimer.c
> @@ -44,7 +44,7 @@ static enum hrtimer_restart snd_hrtimer_callback(struct hrtimer *hrt)
>  	}
>  
>  	/* calculate the drift */
> -	delta = ktime_sub(hrt->base->get_time(), hrtimer_get_expires(hrt));
> +	delta = ktime_sub(hrtimer_cb_get_time(hrt), hrtimer_get_expires(hrt));
>  	if (delta > 0)
>  		ticks += ktime_divns(delta, ticks * resolution);

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

