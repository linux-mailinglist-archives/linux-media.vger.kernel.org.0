Return-Path: <linux-media+bounces-57844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JYoCYLazGnnWwYAu9opvQ
	(envelope-from <linux-media+bounces-57844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 10:42:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BBA377003
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 10:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5192A309C082
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 08:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD1C3B27F8;
	Wed,  1 Apr 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWLth0XK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D018B3B27C6
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032162; cv=none; b=WwZ1cuA9jQZXibrQufw1naSvxyt9SLr0FTUV1v4usHG5lHGBgDAEL4c4OgMcdkscpvqmCL5bZTX1dakD3sn4FwAJNaC0nsgv3k2wSKGciTkCZZAxGb/6vLEJFVYwAEdLa7lkB1j6n3XjMLaUjODj2CgktNReThFEFKXYdbkI1dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032162; c=relaxed/simple;
	bh=xWymgsxKoXsfs+629uIVGha7HwRpch1lFzOxT+ljJkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecsmu/FUlcksgEqXqELJ/1t6BayuRkiiEi7Z6srwSst9Vg+fSSxamIZFJr+MQsfDFTGFpPkao0/mBlRVkgS2fAO7PDMfgx1oVxUNw7sw3dJfS+GkmNo8qxBIOuGgYONNd809Zx8TsnfytgyzB0yeU+OWDF6cpzxMWRYCvMVZGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWLth0XK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fd27754bso64675135e9.3
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032159; x=1775636959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HH4vyhHFmJJWYYMCxWnCs0SONovTrBJdlFBGYKRYxY0=;
        b=ZWLth0XKQb7JR4jS5VgqFbZaARyp1l1pJoSfni3Z9ztKtgFDS1EeCj+8OWd+k0P1T1
         HcU8TVqsSuzHJx58AN5mfLU4sd/3r4ETplVqb6R/e6kNER2J2+WTKJ4ELx++E4RSWwZb
         bJ2svuysyzxE5syXijybjBktQCPsw2CDU98fkZssN62rqKXDAt/JWSGLlcnQbLmcgABv
         ImbpzQILF7t+ltNnPTMPRQ1+YN3FZ4QDq/Yr4m5G52qLVusnzTErNkX3hMo2REK04T5p
         Zxpl4F52AGDAtrGiVLXqn0MKq7DUtaGMv7wDem93gzJ11tO8DPVcIcn2SUWb58uip9HF
         nvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032159; x=1775636959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HH4vyhHFmJJWYYMCxWnCs0SONovTrBJdlFBGYKRYxY0=;
        b=DY7ZbWWgIOKdXQx84g8hqgL6yo25hanhI4K+xDHmZiRVtaU8Af0GvBeAk4aKTPMywJ
         vzbiCfHEcnK34aBQhLXigy8Q6uAX9AuzRvQcpmtqfOK6J7tWIYg10v4FNJ4TybKXOHTl
         F/pmeD1yzNCBzvAU9OWIne4IUMdaKEFKEZu31azDRP6bRxqV3wmS0ES6RRom/v8+jvt9
         k+lsngPb9JkXmFzv4CDa4HHwfFgp8fNVZYFo4kheNYFxhVXqd0PTvL4hgfdnAIgwaHI0
         EvKFHlLVHDIdY/2Zn2LDVhqqXOeAmZKiLXqsyPU03HQTxZC/erbVniw/3GxRHK1CCAhA
         BnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNyF1tiUw1nf3LoJtxj/SUhUFNiTyPArVo3kK1HxgB1SZC2o9me3tq3xYIPrQtlPv/EioXhFZlFJ+geQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwWikDNmxzbxSKPt4+MvpOC1DvDV+CyGOPDbTsBKRkuDrSeFLD
	+I3O9drCEp4OpWiRk4Gv/4pSM7OymvbmANLdOJM1ExJTfj4oiWx7S6c3
X-Gm-Gg: ATEYQzyxFn+9plT1VSvTWzN/0ZObx3/IVo3nSdhkSPV0WxdHPpLafsUAVkzmQj9W8ze
	4PfjnLI0EMWKnSvuyyJ94Z8+Fz5k1/lbvhH17zRez1RrLFI11sIjzK6jy0EWsFpRwHfOShjiPHh
	NXLotdVD7mhrUxkphC6bw2qcAInWacPLhyGe7l5omF2FjOSzEoPBrDjhDTp9dnYK/m4TMgJ3Jdn
	c0JMcm3O3EB4los2OOtfTDre8k4ywS1FHb8oHtmiI6r18tnVi+3PvD+ExzCcyVHK/AIo6N+YPjp
	KcSTg6YjCZdX0kZtCuYqkJiaAqUIDXot2SK4JDNYa+X+e9pWKDgEDgIR0TcE/vB2v7RPSdBd2Jw
	ywO9Q8CX+YdkgVOQ/2okvORKMYTSWLj4FIG512LcRGvhZ6sWxk+L/BYmlifEpLFKWiZUwYQH6xo
	b5Oiz5cQNbu75zCbYK+lA=
X-Received: by 2002:a05:600c:8184:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-48883590481mr41435375e9.19.1775032158912;
        Wed, 01 Apr 2026 01:29:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a6ebsm118583285e9.6.2026.04.01.01.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:29:17 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:29:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: av7110: coding style fixes: too many
 tabs
Message-ID: <aczXWu23wEVVO4fJ@stanley.mountain>
References: <20260330204035.22074-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330204035.22074-1-ss22.kern.dev@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57844-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,checkpatch.pl:url,stanley.mountain:mid]
X-Rspamd-Queue-Id: 06BBA377003
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 02:10:24AM +0530, Sudarshan Srinivasan wrote:
> This patch fixes below warning reported by checkpatch.pl
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
> PATCH v3 consolidates and addresses review comments from earlier versions.
> 
> v3:
>   - Removed the additional tabs in handle_ts_memory_fe() as indicated by Greg KH
>   - Retained the original code style as suggested by Dan Carpenter
> v2:
>   - Refactored change by adding function handle_ts_memory_fe
> 
> v2: https://lore.kernel.org/linux-staging/20260318191149.109616-1-ss22.kern.dev@gmail.com/
> v1: https://lore.kernel.org/linux-staging/20260316152340.238100-1-ss22.kern.dev@gmail.com/
> 
> 
>  drivers/staging/media/av7110/av7110.c | 33 +++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..35f7d6bb8c74 100644
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
> +	int ret = 0;

Don't do this unnnecessary initialization.  It just disables static
analysis for no reason.

> +

What happened to the if (feed->ts_type & TS_DECODER) check?

regards,
dan carpenter

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
> +		demux->playing = true;
> +
> +	return ret;
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

