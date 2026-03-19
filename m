Return-Path: <linux-media+bounces-56299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCcJJbmZu2nwlgIAu9opvQ
	(envelope-from <linux-media+bounces-56299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:37:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F14E2C6DD7
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8469F301080E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6748C34DCC8;
	Thu, 19 Mar 2026 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IlVfaEH6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877C238C03;
	Thu, 19 Mar 2026 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773902258; cv=none; b=EFuP1RKYs4iS+syza2MOh5XHuRNVVpzvLL4LGDse4Y1o0ZU3dtJZGMhAzqzEeazWahriQ3cDHinRfaWKlFd1F/xT39Cle1VfTW3bIHjVHLLAxM6rDApzcd9UWxxdBXBgjhVVObJrcc9wIus0PsJTQeHo74lY8vsV0wcv8VpxQa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773902258; c=relaxed/simple;
	bh=+iDhvuHPICSgtWtPT6Hm3wDnC3T3EtX7BJlT9S5PvEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYRLmjPudVGdKr8ruW2grJK6iBaJSIwwG70Ir9Sgvs5ITHhDwFq85soDngPrMT+ySZVJpZ7pQ1pQ/zAT/vp9s6LoKb3qgyt+P8pv/uocBGcmSMrBnvIwv2sk90fvijTW0hYM/bg4qxUu9NbpqoIURED4qXqVdjncRQ2lnO560EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IlVfaEH6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3D6C19424;
	Thu, 19 Mar 2026 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773902258;
	bh=+iDhvuHPICSgtWtPT6Hm3wDnC3T3EtX7BJlT9S5PvEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlVfaEH6HHeYNM7IO4/o4yudqv7QfXRXFOwcu/vFt3JwVbjt9mV7ahWzHhQNYYj39
	 uXZsoX5BAsMDxaDWzFz5z54KyiYOgzBgwr6+xZqkPTMEJZ5bI/gdHpYxLWJVcqycDP
	 FmujCC2omry3Lhx/BUbDRKcOPrq3TczehXc/CfTg=
Date: Thu, 19 Mar 2026 07:37:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Message-ID: <2026031922-unafraid-fable-f24b@gregkh>
References: <20260318191149.109616-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318191149.109616-1-ss22.kern.dev@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56299-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.750];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 8F14E2C6DD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 12:41:47AM +0530, Sudarshan Srinivasan wrote:
> This patch fixes below warning reported by checkpatch.pl
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110.c | 32 ++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..970343c4ec51 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -932,6 +932,27 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
>  	return ret;
>  }
>  
> +static int handle_ts_memory_fe(struct dvb_demux_feed *feed,
> +			       struct dvb_demux *demux,
> +			       struct av7110 *av7110)
> +{
> +		int ret = 0;
> +
> +		if (feed->pes_type >= 2)
> +			return 0;
> +
> +		if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
> +			return 0;
> +
> +		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> +		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> +
> +		ret = av7110_av_start_play(av7110, RP_AV);
> +		demux->playing = (ret) ? true : false;
> +
> +		return ret;
> +}

I think you still have too many tabs here :(

