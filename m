Return-Path: <linux-media+bounces-55857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH78MYK6t2mpUgEAu9opvQ
	(envelope-from <linux-media+bounces-55857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:08:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D15B295F88
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A53030157CE
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFA2355F30;
	Mon, 16 Mar 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jb8r+CUA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0534D90E
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648510; cv=none; b=JnSfGBO97xe/C8HmSXQPmSjre1HMfsg6rSe6EsbtPtBlOq8UtR4msDVen43fsTbGbAh+qxKTRIblvfe1Bmp4VPtITbInWzDnSAbyTM+WO5jcDDCpv7J6h2KVPA7M+5JHOy7LWR653LG3ej4Rx9UYZ95zp6rWVlDvfcnOc4mnv7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648510; c=relaxed/simple;
	bh=x1uU4O6ERf7uSMhZA+GDKpID7bpPyS29bfrvbbIt+58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyKGWVPK9Di9K6U1f0qpniOYeKSVPdmtxENd01d/cilXKy6ZNZHVqVcucmni427bRYShghflwNFy6tTqr2woB7YhW5gtzr6OEbqI1z42SVQKBKX/BNDujg5WR5uG3T4X/LzDuBMfTON0hRMgZw75b25/EKPHdMBLQrsQR9wTJfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jb8r+CUA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so48226755e9.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773648507; x=1774253307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gM8VLpK7o2tGvr7MARawA5A/lh/4eDEJKA70VNN8UJ0=;
        b=Jb8r+CUA/4QKbRlV+vbcwmDcp7cDy/TfhdZgfrt85Tmrmy5bqd53iTUoTs+/T+oVvL
         0AJUbjndWk6xC7UcSox15au2h9ayJigpl4idpujBnqfHL284i4kN4PeVIoLecK6kfILQ
         NALgjSkYkZfEECKvDckFo6wVuVGXERQkG4zbl/jjEMrXU5MtLuYQ73njKbPMSVDGBQk2
         7/D0oJVxOAEvVk36VPsvw5AaN0yZYN+RuQRCCwvD+ZN8sRLE88rBT7p6dChmA6pg03bq
         dn62yTqUr2gsZhuABaWMLoqeFciiCZbOs9F8akSvb+giNFtii+8DT8QkKNYm1HMZjutG
         OjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648507; x=1774253307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gM8VLpK7o2tGvr7MARawA5A/lh/4eDEJKA70VNN8UJ0=;
        b=Sw/8mCz3mIkcZ/TxS3PyKztO69KaiYWr6AHQvfH77o34S1LWggtbV1aQztjbcidW+2
         gpboKOaqZISCPbj0b+7VlGBj9+2v8A0uVBcSYkI/WZQZdPxdiKJLTl+ID7RWDV7c6OpY
         eKFu40ReTopjmRog7QUKBGK9Xf/dIg3vGCbqtKyRc0OYEGjFWciSjLjGCqjwM1mK5nOO
         5qYtNbE2MPPZybD8D1bBlEHE0zO+wFbNckhwGfgYsztaP4thmSaVs6KbRgPxR8ag8/aP
         BFScl9uBQw71sFfCFTEV0GyL2e/CFQT7GOQfiFG3XDR6nG92RBKJj4wm/8yC+UpTs78K
         13bA==
X-Forwarded-Encrypted: i=1; AJvYcCUmInxlcy3YM84/aGwZyAALJwWmjSBR1ikNZLCZaj2fktqS/4E53X1Fe9D+SiwfpZ12AoMVK/+h9mGNkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1JF6zxpU610k/oneKmRs3oO5aUnvL6kFyX4aVSVA8kL3SkN7F
	9UNsNgRC74iq3TyimbRFCYtsSs96u+aIyzcBJuVB18yxIDy80kMqrnzJ66emUZa1bkY=
X-Gm-Gg: ATEYQzyhf5NPjTDgVN75QO6YjIw6KHcXSft50EmhL7KCv6p1K+NwZvsCvTJr3OypHjQ
	7FEPosMHW5man4ujZUSzw9MNtaNo+Z7OeEbAGaOgD0vt+O35TCB3VaUSpEummwyVp4zITgyZhBI
	F+F1VlD5mtd3O1kMQaB/PTWMLG9rHvYunqH0mTl8LLcfbN2UmFyolf3yobkoZIDMOsUjfqNDxXD
	SQVoR9MomjBq+d3XKSg7MAzksiamRSZ9k+D8yysuUcEuzQJeHRIgYuF+TykMYjEE83mNkIXMWrm
	iTLb5kddi1aWKux3qqO8eS9d0xst0PWao8ETJqu37ssnlgM9NfFFs31C3/q2khMcdQEBk40iEOn
	rCUE73uQHlCll6YS97kW5T/sweQ3GGvKuyO5PfpNlLl226xZOE/M/k+xO3sRA0vsIVS7ZFiklHh
	iJIpEQ1zDwuNx0YY0xTRRYnQIAz9L4
X-Received: by 2002:a05:600c:8a09:10b0:483:badb:618e with SMTP id 5b1f17b1804b1-485566d6e33mr138080005e9.8.1773648506976;
        Mon, 16 Mar 2026 01:08:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ac17f2sm456509905e9.6.2026.03.16.01.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:08:26 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:08:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging/media/av7110: update FIXME comment for signal
 strength
Message-ID: <abe6d4x5wFwtcCiA@stanley.mountain>
References: <20260312-staging-cleanup-v1-1-fdb9f8367e3f.ref@yahoo.pl>
 <20260312-staging-cleanup-v1-1-fdb9f8367e3f@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-staging-cleanup-v1-1-fdb9f8367e3f@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55857-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D15B295F88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 07:21:17PM +0100, Tomasz Unger wrote:
> Update the FIXME comment to provide more detail about the future
> implementation for computing the signal strength based on the tuner RSSI.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/media/av7110/av7110_v4l.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
> index 200a7a29ea31..a64761979609 100644
> --- a/drivers/staging/media/av7110/av7110_v4l.c
> +++ b/drivers/staging/media/av7110/av7110_v4l.c
> @@ -310,7 +310,7 @@ static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
>  		V4L2_TUNER_CAP_LANG1 | V4L2_TUNER_CAP_LANG2 | V4L2_TUNER_CAP_SAP;
>  	t->rangelow = 772;	/* 48.25 MHZ / 62.5 kHz = 772, see fi1216mk2-specs, page 2 */
>  	t->rangehigh = 13684;	/* 855.25 MHz / 62.5 kHz = 13684 */
> -	/* FIXME: add the real signal strength here */
> +	/* TODO: compute based on tuner RSSI */

This seems reasonable and also pointless.  Is this AI?

regards,
dan carpenter

>  	t->signal = 0xffff;
>  	t->afc = 0;
>  
> 
> ---

