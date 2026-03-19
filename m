Return-Path: <linux-media+bounces-56298-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOVQFOqSu2mYlgIAu9opvQ
	(envelope-from <linux-media+bounces-56298-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:08:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E50422C689E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF4663016ED8
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5132E9729;
	Thu, 19 Mar 2026 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LcwKhVK/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284E32248B3;
	Thu, 19 Mar 2026 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900514; cv=none; b=BvfmF9/uvwZy9rLTXfQ0GjEjDEI8xgUozqt5NQ6BG6rZXkjJZyDZRQiOUqrzaqtHt7+7VXQS8ktprQUntttKpNz24wM9xeJFfewcQAxiyHk8PQwsMNrmHP+zJxZZKiuyE5GHevrmzKeCCcF+94pwAQhxmebWqjHWkKIookX47zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900514; c=relaxed/simple;
	bh=sjVMLUwpS3c+gFUKAFN/d5MgZTX7s+jQwrgjDxItyYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euXQDF9UPagwUKD0vxtdXo9vnkABPwuJBmoWt6PmTCrZxuP7/Ocjiu86afu4SkvS5Rt2ZJ3bqNkwNLN6/v+Yc64RrewWLOI4nwDCMew1ee0uTTuAhFKTzj26p2PkO/Ji63HVjoyQNWReGa4uzG9G2+UNemybB9oZHQPq2kTVTW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LcwKhVK/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CD5C19425;
	Thu, 19 Mar 2026 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773900513;
	bh=sjVMLUwpS3c+gFUKAFN/d5MgZTX7s+jQwrgjDxItyYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcwKhVK/cE1gFcETdBWq81JQ5GhOynD1mWjQMGatQfSpjPUZUo1zI5Wv50bqed60B
	 VFFNgV2qTwXFYJ07nHehWBwdNiZ3aSn8jr66uXbEDGkq/GrVSt1+UCp8RA62k0cJLM
	 js+F5nIwWQwo7Uv9N2VvStcftmGns0RIZgjE0KnM=
Date: Thu, 19 Mar 2026 07:08:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: av7110: coding style fixes: too many
 tabs
Message-ID: <2026031905-resubmit-germicide-8b87@gregkh>
References: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
 <20260318193233.110451-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318193233.110451-1-ss22.kern.dev@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56298-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.862];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: E50422C689E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 01:02:29AM +0530, Sudarshan Srinivasan wrote:
> This patch fixes below warning reported by checkpatch.pl
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110.c | 33 +++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..15460ca026dc 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -932,6 +932,28 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
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
> +		if (!ret)
> +			demux->playing = true;
> +
> +		return ret;
> +}
> +
>  static int av7110_start_feed(struct dvb_demux_feed *feed)
>  {
>  	struct dvb_demux *demux = feed->demux;
> @@ -951,16 +973,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
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
> +				ret = handle_ts_memory_fe(feed, demux, av7110);
>  				break;
>  			default:
>  				ret = dvb_feed_start_pid(feed);
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

