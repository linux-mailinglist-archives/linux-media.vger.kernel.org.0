Return-Path: <linux-media+bounces-65308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LOIRAFVgNmrx+wYAu9opvQ
	(envelope-from <linux-media+bounces-65308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 11:41:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A12A6A8B10
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 11:41:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SYpMi2aA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65308-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65308-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85A2F3037BA6
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 09:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1C7330641;
	Sat, 20 Jun 2026 09:41:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5569B3438BE
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 09:41:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781948462; cv=none; b=frX1qUghGBrxMaPY2LQSA81gf9X26yT1X8hBtiuSVc67kSxg6+HwaLbwN4NwwC4E7mA/INkfZjh26lfNEXitdyurW3O+mB1qD20sJgQKpaaETpmkWqj3ZOQlttVpofSAY/d0IqznqP0XOMDi7Q/9ZEDaWKIClNWW3xylgQ9dd3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781948462; c=relaxed/simple;
	bh=AlGeUZ3QYvy+bZ8/zcaFDTLVaQTK5y6L+E5GcwCrFkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJLDbIIcTAxmAe3zoaOyKwlyUsakW/+477hbasgeGo0FjFfLiZ91LSQQcBG8rEqiHvuhAdWudNEuV/3gvm9HbnQWnGZSP07SYNmicGxrLAWoj2kS8ubfnVZiLKhYd+ZCC3nda7XkexZkgdbTLsQao4twe+ubmJ59i1fKNQWnJqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYpMi2aA; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-460166910e6so1688328f8f.2
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781948460; x=1782553260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HF98Lg0bNQFMKMo/Ru5lBzs3ltxb5oUjteAdlhOVD0=;
        b=SYpMi2aAaJ2Gakg+I2gTFd1iNi7NujkutBFattTs/STXwLFJVc/kpJ+soAPItC20A+
         fBQKkavaeY1rYqGtoDBhwHsFyYUYhv2jjLnHPD1ATK4+/zYl9/F82a3RJWVYdYnb3xiL
         RZOLPCNOrqSGr9ZUrO1gSzKnnHxo3ArcuNu6D50/aPAF7/MtuwsWvuebxxeoBRAD8xV7
         CVtwfGseMmXDBkOSI5DqRZ1hfU/xPUdoh8SsonEg3q7c45QHRnLd/A4HHN6DZW3CYte2
         imkIzJ+JKRnVGzCtNjvt7PPo9hbq0+ZF7wgcJXOEDkSxO0FgnGd3oCxf5IUq0FkrjQcu
         +bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781948460; x=1782553260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HF98Lg0bNQFMKMo/Ru5lBzs3ltxb5oUjteAdlhOVD0=;
        b=XBUy4yYUlc2lHvVqT/HGSyYzRSIDiNrUi7osttY9WWJ+nAWgG3whZbXmQo+SWZUMGR
         YeZPHbGHqYLZvjpO2jrYbClVorkpK1yC6l3021w0q3MufLNvo2ru+fiZ+IBBlQQlaaMc
         /Ma6tfqnis5nPmsDSqEG8NAuUzAmfXT5fJ3gNknkah+vDnGp3SvGpbCAhbTxu60xxzKs
         YfrVdzepc0NfU2+fqBBjoMTkyuk0zqBfSn/AXM4bP01CNMjdAQQ4uc6f3CClYRlcah5O
         HjX/voNoKxgBwAczgEyT9U1mCptn/3iarHeiYRSXjv8YHoTGgIlrVYPT+F9Vzr/PJKMO
         oRMg==
X-Forwarded-Encrypted: i=1; AFNElJ9xLW0vyYVetTSGsTn2bL+8p1hljZl3/eVxquzAwpl3sa4kKy6RLEXm9hprQtRFqtRDGdY2mTI0xR9jBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJAg25LNJpr1v0q1R1pD62YoK7faAv0ud3sEFF0omz1/l/518P
	4bmupeAhL4GgB/sdTbUU3Sq4qvFl2Wn/OQBLSWwfGA1PaWMG2d/kS6dklrnbIuFQ
X-Gm-Gg: AfdE7ckqvJrqcXi51mD0vjLCf4E6wZE+n9h3rSSDN4m+lGJdOYAMcCr4K7fwsAv5LUB
	hBRcv4Wdfl3yLTfjMyZkUzE9TF5IJaLQIPd4BWgS0cPnjGR+XpN1e24jURWaRWVmxNKIMtBAD/G
	u54mmEvhCfh8LDMGS77RkYWBPK4F88WoPEUG5OtdNZrw9zUkz3QSt/d8GALa/6ZJliS4hZ9xdI4
	JzWlTUOvAlSy1TkuFuSRZUzAE8rSsPfxnFoPxasv1IbCdBi3SGxTWGAjpsG7v3/8BZn5199ehQV
	aIfMqpy56nj/pj3CptwMuK7cJQmegXDs3UDyMUNgnD4ApL5EWge06aDpkam6ux65b6h72XQrdXp
	RXXTrZm8y2eICz2asGy/r3unXvurEK7o4v+kv313Ks8G6fYrpiDwsIGRGYNsMOylCbsXlXIj4Cy
	f+PtwN4X2kYV4uNmWAfRo=
X-Received: by 2002:a05:600c:1c13:b0:492:4e1c:120 with SMTP id 5b1f17b1804b1-4924e1c2052mr7589415e9.32.1781948459551;
        Sat, 20 Jun 2026 02:40:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15470sm149067445e9.2.2026.06.20.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 02:40:58 -0700 (PDT)
Date: Sat, 20 Jun 2026 11:42:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: av7110: refactor av7110_start_feed
 to reduce indentation
Message-ID: <ajZSd4RhjJgDqn1q@stanley.mountain>
References: <20260619221524.51814-1-andrem.33333@gmail.com>
 <20260619221524.51814-2-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619221524.51814-2-andrem.33333@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65308-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrem.33333@gmail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem33333@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A12A6A8B10

On Fri, Jun 19, 2026 at 07:15:24PM -0300, André Moreira wrote:
> The av7110_start_feed function contains heavily nested if-statements,
> causing excessive indentation and violating code style guidelines.
> Refactor the logic inside the DMX_MEMORY_FE case by inverting the
> conditional check to break early, reducing the indentation level.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>

Imagine I read this commit message

> ---
>  drivers/staging/media/av7110/av7110.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index e77be16f442c..2e32acf897ff 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -942,16 +942,16 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
>  		    (feed->pes_type <= DMX_PES_PCR)) {
>  			switch (demux->dmx.frontend->source) {
>  			case DMX_MEMORY_FE:
> -				if (feed->ts_type & TS_DECODER)

And the first thing that I saw is that you removed this check.  There
is no information in the email why this is okay.  I have to look at
the code itself to see that.

The patch is fine, but I don't want to have to read the code to find my
answers.  Re-write the commit message and resend.

regards,
dan carpenter

> -					if (feed->pes_type < 2 &&
> -					    !(demux->pids[0] & 0x8000) &&
> -					    !(demux->pids[1] & 0x8000)) {
> -						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> -						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> -						ret = av7110_av_start_play(av7110, RP_AV);
> -						if (!ret)
> -							demux->playing = 1;
> -					}
> +				if (feed->pes_type >= 2 ||
> +				    (demux->pids[0] & 0x8000) ||
> +				    (demux->pids[1] & 0x8000))
> +					break;
> +
> +				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> +				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> +				ret = av7110_av_start_play(av7110, RP_AV);
> +				if (!ret)
> +					demux->playing = 1;
>  				break;
>  			default:
>  				ret = dvb_feed_start_pid(feed);


