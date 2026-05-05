Return-Path: <linux-media+bounces-60408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMbTLxrm+Wl1FAMAu9opvQ
	(envelope-from <linux-media+bounces-60408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 14:44:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 167984CDCC1
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 14:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D18B33046F92
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 12:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6788D436370;
	Tue,  5 May 2026 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMrdL2dU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49AE313550;
	Tue,  5 May 2026 12:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985011; cv=none; b=ACS/g/NeDxDxqMHJsNYqZojJrxWZb+MbCDcNYghS/T3d0F3LociNdXrKdHzjBLoJPypVvyP7XIx8uuLLaoSl6zdsmWNK6p+lnlDRf6ynuj/4+Of3QaAxXHJIAF7h5OaQaVA36v25g9cyb91ztQBQNgel5AgIca67iARkhvh2IKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985011; c=relaxed/simple;
	bh=RRFrNkOQz3XsDjXV2ZqAeXaXDFjrJW31GWWurgjfvfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qth+g0RT5pQH6ju2rO3wVXYUVU9HP1kOxuZQ57ZsNM+PCnxbV/KCy07cGV6vmg+Oc7Uq7lhU7c2Eh8FsVJidjbduHYIxf8GL454/sDnbHDA/XrA1GR1LIbFBFRHOWNM8RIDNEHFtIW24Zpq7iQreSbWBbDjv4XQDLssHmV9ft90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMrdL2dU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AEAC2BCB9;
	Tue,  5 May 2026 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985011;
	bh=RRFrNkOQz3XsDjXV2ZqAeXaXDFjrJW31GWWurgjfvfI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GMrdL2dUbXiR3Dp7iC3H5WssTbXGbccCKDf6DHtUJfIyupoN4/C1d2V9LfYMccDNF
	 VEeJlqhD7tHgE0AuYWspvO2FPaGCoMBw14jGcRX+h8BbYfGw9WcBPnk2S5M0AThKcr
	 Hj2xDsviqtd1GZMyE93TSu35fUn6k5xPLZ2HW4zoheXoh8405wuyRtiELKb5jLHJWz
	 iRHWVlH32gX1LoabadE3nOUPcb9+Y0yXNMnUpvLiSH/26mc+hO9Yr5aiU0DZnhCupF
	 uQfqcoACXbmEidz567vY4/t2JovYH2axbsiB2h0+GtFaD1hL4Aq3GORg0fOi8bkf/L
	 x5ZBDqXdOkxZg==
Message-ID: <936a9b7d-0602-49d1-992f-abf620b37836@kernel.org>
Date: Tue, 5 May 2026 14:43:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] staging: media: av7110: coding style fixes: too many
 tabs
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, error27@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260401191743.26951-1-ss22.kern.dev@gmail.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <20260401191743.26951-1-ss22.kern.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 167984CDCC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60408-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]

On 4/1/26 21:17, Sudarshan Srinivasan wrote:
> Fix warning reported by checkpatch.pl
> "WARNING: Too many leading tabs - consider code refactoring"
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
> v4:
>   - Added the missing check for  "feed->ts_type"
>   - Removed initialization of 'ret'
>   - handle_ts_memory_fe() accepts only "feed", "demux" and "av7110" extracted thereafter
>   - demux->playing assigned to int, instead of bool to maintain original style
> v3:
>   - Removed the additional tabs in handle_ts_memory_fe() as indicated by Greg KH
>   - Retained the original code style as suggested by Dan Carpenter
> v2:
>   - Refactored change by adding function handle_ts_memory_fe
> 
> v2: https://lore.kernel.org/linux-staging/20260318191149.109616-1-ss22.kern.dev@gmail.com/
> v1: https://lore.kernel.org/linux-staging/20260316152340.238100-1-ss22.kern.dev@gmail.com/
> 
>  drivers/staging/media/av7110/av7110.c | 36 +++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..486dd8010e7f 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -932,6 +932,31 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
>  	return ret;
>  }
> 
> +static int handle_ts_memory_fe(struct dvb_demux_feed *feed)
> +{
> +	struct dvb_demux *demux = feed->demux;
> +	struct av7110 *av7110 = demux->priv;
> +	int ret;
> +
> +	if (!(feed->ts_type & TS_DECODER))
> +		return 0;
> +
> +	if (feed->pes_type >= 2)
> +		return 0;
> +
> +	if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
> +		return 0;
> +
> +	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> +	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> +
> +	ret = av7110_av_start_play(av7110, RP_AV);
> +	if (!ret)
> +		demux->playing = 1;
> +
> +	return ret;
> +}
> +
>  static int av7110_start_feed(struct dvb_demux_feed *feed)
>  {
>  	struct dvb_demux *demux = feed->demux;
> @@ -951,16 +976,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
>  		    (feed->pes_type <= DMX_PES_PCR)) {
>  			switch (demux->dmx.frontend->source) {
>  			case DMX_MEMORY_FE:
> -				if (feed->ts_type & TS_DECODER)
> -					if (feed->pes_type < 2 &&
> -					    !(demux->pids[0] & 0x8000) &&
> -					    !(demux->pids[1] & 0x8000)) {
> -						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> -						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> -						ret = av7110_av_start_play(av7110, RP_AV);
> -						if (!ret)
> -							demux->playing = 1;
> -					}

If you rework this as follows:

				if (!(feed->ts_type & TS_DECODER))
					break;
				if (feed->pes_type >= 2)
					break;
				if ((demux->pids[0] & 0x8000) ||
				    (demux->pids[1] & 0x8000))
					break;
				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
				ret = av7110_av_start_play(av7110, RP_AV);
				if (!ret)
					demux->playing = 1;

Does that fix the warning?

I prefer that over creating a new function. If this doesn't help,
then I can take this patch as-is.

Regards,

	Hans

> +				ret = handle_ts_memory_fe(feed);
>  				break;
>  			default:
>  				ret = dvb_feed_start_pid(feed);
> --
> 2.43.0
> 
> 


