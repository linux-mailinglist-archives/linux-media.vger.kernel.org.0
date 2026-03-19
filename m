Return-Path: <linux-media+bounces-56305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHIHF969u2n1ngIAu9opvQ
	(envelope-from <linux-media+bounces-56305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:11:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8632C8690
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA750305FA49
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE613B19CC;
	Thu, 19 Mar 2026 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/7Xs+Gq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267A83AE717
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910974; cv=none; b=mP1G058/mFxSGP5vW/UvGcMgLTuMaOHJj0QLXREMCXrUUPixWhEsqxpCc5UGA0ntIDoMbRoFj+h0U6BJ/JJ5fbeJZF9vGVp+oZDyLbqjbwggMJyxPSrwLBRatcaEynNUvHpx8vpFZe9zeqj1L+l2o9lfvV4lVcf1iW1+4fDOf/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910974; c=relaxed/simple;
	bh=75nM3lYRQU7IZ2qAXZ2X20vZw1P7LFmoQkBFEZVgVAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nY+H0M0Zr2d9WdJoAF00zJOmyFP5CiuZiSvZJgmNjWLwb26ISS+9A1xm3rNSMQ39/k24MaAdxNczrsOtua0YjtjIpcNw6bHcDzuuwQT5QIfngzWgXYZy2ZJN+E3Ojw+Cuy9iGijsZp44abWs5Hhy55CtgSY5hTwJGZ/yCe8mo8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/7Xs+Gq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso284207f8f.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910969; x=1774515769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kDHkOh/+rJs2mQxrqKz06BUKYb3btvvpq78iMwVqDVQ=;
        b=y/7Xs+Gq5jYiGf7PC8Q7c7IqOvopdkKNPW+yGjax4cPo89Y7ve1SxUce+lG2Tt2ZAn
         hnrPfksmMuunFwNMGvIL0G5+6lyFgR9VDaGKJjFjDTVNXdD9PJABXWgblFSQmGnWuPKX
         BTGIODYhzTWlvhig+pZE7DAm2PHaTiQoizmHQV0cG6/rSVuyM3Ly/mPuo4fujFaDNp1a
         CPN+XQw999J8PKb2wCP2JUg2c8mD4UP7s/fVlcZmAl4FnB6yZ3zmg37jsRAbtGpg10ed
         7MVTX6KuDpmIzP7KNeBhYY39jBSgwVvcV3oE+MC3k/+FF4TEH1fa6bDTIQDAmy2PYKun
         nzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910969; x=1774515769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDHkOh/+rJs2mQxrqKz06BUKYb3btvvpq78iMwVqDVQ=;
        b=A+8rECxhFL/TaRvCWyAVF9YB8Etm0qoa8SnHUWK9ZFikLcJcKFhD3ZUMZIohcWYErj
         HIN96FQY7J6ryLgzkw5R+pHIKKJZ/Rde3PIWE1UcWiACN2DLUJlojWxr0+dPLNvZPMIh
         aTo7P2S2LwRo3kGAJ/ChM+tVUKMOXgoBz+tlOOHXpaWxLA0jwddWKtXX9Ibo14YhEbjv
         ulcbyX3orumMJVzruTMRRKpex4ttbrQjQFHu0icfDE3f+HC+kp5VfjKwykljNLjh6tFP
         q1sQmw1KCBjZq9PT+n/f1xgDvh7Tj+NveYdIu3Qe+2aFWQwjRvFz9uj1vfbIKeKUc5OF
         E9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXFDsCqX9kGcKOQK4bgDtq6m1xpecL27CSYAb5y2Q2uj8vQh8W/agKcnGRRQHC7Lc/Sm3FEU4K2anRwbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz88aPsufUtNGT0Om1+zbDY6VUEs6UQW0rB//umVcQioUjEFFJG
	UkOp+NC1tvTlGUjLrSFiP78Z7/Q/f46E217MOKxtqd5cqGA2uZA0iEg6zrwx8JAyv4Q=
X-Gm-Gg: ATEYQzwq/KooR9CiSWn5Km1CxISqcnpAUUXkaB1XLvF8/FgXvfqegdpkwTcIv3h2uEt
	+SW2nJ792jS7IlvHk53kLHp8YLLSM+7BB7IpVE201R2hqCSbYQy2QG8zZnGivhj1IUEniVut/AG
	sKC4kNnqbiU/H4PlX1edBKRrg3cCTIbfZIEgKhKMYS7jvA7U8IRUpg1axQltTfZnN/zvApnjJnD
	nIL73I25BpqCr3Y87+FO3r92+kRtIXbN93SP8ZVW3WFe/fpho7s11j5WAD9mI5ff8gU3SxntpKe
	arI2EUk86GyrVq4X5C1K4e6dlsO83CEirGBQqwueROM/k8zU65IKk+i9SIJaWsQMnu7UBwENb3R
	CXdiOiOIjuoyrKjnL/FgvTFY5jywSPCpZMizxK/6j8xcVkFi+78gUNTLzVCZeRuuOr4XC/g/4/F
	pzKWlM/fubLza82ya2d6lLvuSZkj3E
X-Received: by 2002:a05:6000:2006:b0:439:b629:42d7 with SMTP id ffacd0b85a97d-43b527c6c7emr11231724f8f.46.1773910968290;
        Thu, 19 Mar 2026 02:02:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm15002809f8f.1.2026.03.19.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:02:47 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:02:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Message-ID: <abu7tNtikJJWobn5@stanley.mountain>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56305-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A8632C8690
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

Keep this as:

	if (!ret)
		demux->playing = true;

1: It matches the original code.  Don't make unnecessary style changes.
2: The original better style.  The old code said, if there were no
   errors set playing to true.  The new code is ambiguous.  You might
   think ret is a bool or something.
3: How do we know that the playing wasn't true at the start?  This
   could potentially introduce a behavior change.  That wasn't
   mentioned in the commit message.

> +
> +		return ret;
> +}

regards,
dan carpenter



