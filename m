Return-Path: <linux-media+bounces-51662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCc0KtPEeGmltAEAu9opvQ
	(envelope-from <linux-media+bounces-51662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 14:59:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E2953F8
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 14:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D247311A9E7
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADD535C19D;
	Tue, 27 Jan 2026 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1bT+EfN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976AD35B62E
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521914; cv=pass; b=DnMHHXfQOLHwKkLFo2siKvtHCOUcDTbya4L24FSzbWkVpTFxrS2eNKjjoKl5VwhXct+bq6E6KxIrsLAEqTANm2PgSO4s9fHp2eE/ZqTEEKlcJ0lNXgsjdHVA0l/SH5qAGMFyJR6pznR3ogJroytgv0UAXbCYReV4ipNDOKTpfv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521914; c=relaxed/simple;
	bh=/inq+L1mLk2RX/zGmX3sYrJ3kDdR2Us7y71FbxyEiV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9CHNclgxAJF0TiEWuvP0rkRcE0/bjSsSbOKKZZLLab9E1GbfJFQffEkEC08PtAD/1e22KUF6aRvr2hrPW/YTP71HkLfp/klkosVYsyEbcm6mIpqFvgXpyAlDjyMq7t1AOELKYEd0HSVaNnxB+paCHsMwV8l/3lkH7SVc8BH/rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1bT+EfN; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8710c9cddbso690378966b.2
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 05:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769521911; cv=none;
        d=google.com; s=arc-20240605;
        b=YRJkDASSofpfOJlI6lh7zb/+Y+x/3kHJkMsmFJEYo6OxwTiXgFMp9ND49gAQWvwSRh
         bg3jnYi5tviSi259/wCmhYUSDYOawbRx53/z7yK41ACvEmMIEss+Q4Hd9Pk2b4ZUe7ju
         dHAVPnX36D7QGevXZAbQAJ0RU0jcdtyre5qGUeNCirD8UhPi1rAAjfa5r54iSWD9yvA5
         Uzu1yDZw4/MijmuK+bzkXpCHxI9Pk4c+0DY98jY4uzfqwQI6h9MYSQ/mvAcikLRDtkhU
         Xrq5qPpxQ3eeSm3HolMSryoK6dpLusMHNJTJ2n6UbNEaNhGXYkKrj1KI1X4/Jhhz5XX1
         VeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RdWgO0paPnqDQTBnvHJc+Nn6gcQL1dHFGI4D7+hFT/4=;
        fh=1W3lguYFk1II6zQTb3TuQnx+wQe1EeEfimpEiTKz2fk=;
        b=XLSqeUFd9Q3B7pmeld7/WOQ4Gpfcag3uv7r7KMpQaY3tdr0YWEntY5Geq0gr0GpG64
         PF4lxhtrnfh7VVjM7RY5VcR/xgq5ndcfH47Svz0B6FJWnkmDvg3cs4ttoykmLr/AgQem
         JpZXmrbyApVEYRWed0bCmRTZ6onL8XQyDQqpjc7BVc91VKNLL7J+5O/Gu8RDybrfI+Xw
         p9MLqS0rWNTQw7gmNYVWlrZqlgEg6AGqxM3h+BaHN7+tpqlbqxEDA7G0kmG0eefba8GF
         SDerZCNYIIwuJOl8lHY0yBNYIJTzpFIMzPFqaUwecKMf6m9sligQboBhG658RJxWGNY0
         QSVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769521911; x=1770126711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdWgO0paPnqDQTBnvHJc+Nn6gcQL1dHFGI4D7+hFT/4=;
        b=A1bT+EfNWEXLFR/ICYKD6sQfi7xrxowEnHxT+lLBe2YuAVDDLczr47MFSy4TAZiIVB
         ii/iLwKD3UcLs2Sq6Dx9msXqddzN9JB4jRTBCgnJbLUK5YxQ6G/2yAHCSoP8fh2DomwO
         GHuZLQKLpRbD+AyfJXYHD2XOqYvCqyO0/h3xegCq7KpEWubPr4YNRJ3lJPiJT8O31inB
         QvHsC5lDVAOwFlHBhlw5Aubcrd6KuSWzS3f5zYZ/5uBycGd3BDWfNnvzhN6+J2mKs4t5
         QxMqFgHLQBmUPNS133Cb9/+Nn92P0+/xwH/Ku3yr/TBlcgqUEVOBSz/uhJPZeq47zbHb
         2pJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521911; x=1770126711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdWgO0paPnqDQTBnvHJc+Nn6gcQL1dHFGI4D7+hFT/4=;
        b=rjUTVixTNNqN1xlT9LyTgkuxQuarwsfzcrJE++YkJAs5KNcQwBdpe37O/J51UvpoRT
         qU7GpJtXt4C2AhODcfGPLvVQuvBHl63a/bXJTzcZa0tgHeg+XBAEKHBuqjDr6GTH7/Jf
         sm7ksE/KfekAqa5MHOdV5+AQ3EMzvXBvP+YbiP/0eBMr45j1wBEAu0tyHFhjtIBY1qWe
         70volIB+mJarFc4f5dY3VGcSHxZ39sczmpNhqjn1ZK+7X3z47M+AoIngoJ9XbuHIFSTk
         5UhuRVYi1hNptTqqWtpWycpBi4UIxr83HeYeZ0Z1+8ubYSLEXFjqVYUvONk392sNB0jz
         ZQeA==
X-Forwarded-Encrypted: i=1; AJvYcCUFQUq+bAgVPRfJWCrzff7d6ikB5Nx9YMWb6oLD1mwYpo5nsokcT2d1+ddbUlcPT2A/5moTbkif/ZrieA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/v3dGCIRfsjwyR8s9aYo1Q9xu5Ww/df8nGmGHOjsvWZYAiyvO
	ISzWQkiqVHmB78mDC8zpujtaGQ+/7LVhhidnGnJ7Ras7lE+2gFgrKS6nFWvDNUst8AqBaT6qcpT
	GgVjFxO+lyBy7bhBP5al9KFTIduDbAf4=
X-Gm-Gg: AZuq6aKdy4R0RewQB42XU6rWO5x3Ev/uL4LML+FZi3stUh0xSe51oiGXJGkwjCSKkBq
	+12UrsA/5DrYCF86m57+HIaRjl1fcCDDvm5XGO54o7pE+VlV3hs+6VtpcVITKSJHThG/+GjY7bq
	uan7QnVv27txRVcfaMwy7X76dlmIFWjdSwOPYw8sQJBqT6Jg6rphSF/Jusa1/yu2ZPdgPiPJkxJ
	G+k+A0smHPUzSplntUJVPB4u2zommR0FhSlxPu7VCykEfrc+j9cOtnaATjEU8fir4TnbgPCm5kj
	hdjGlQh8OZ6F4epYQEilG9ZsLBz0eQ==
X-Received: by 2002:a17:907:8686:b0:b88:5c68:ecf0 with SMTP id
 a640c23a62f3a-b8dab3d2eb2mr139147166b.58.1769521910755; Tue, 27 Jan 2026
 05:51:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANypQFYPhhcRZoZn1h3JQSvtbEg9x9RCDLFcqkfMNxrZWJxnXg@mail.gmail.com>
In-Reply-To: <CANypQFYPhhcRZoZn1h3JQSvtbEg9x9RCDLFcqkfMNxrZWJxnXg@mail.gmail.com>
From: Jiaming Zhang <r772577952@gmail.com>
Date: Tue, 27 Jan 2026 21:51:06 +0800
X-Gm-Features: AZwV_QjjabzWFxkk9gS2CACYUlJlZ5QqLjQyl6kETc1G8-qUVx50mJysktYtBuE
Message-ID: <CANypQFZ_oeo7tuBfQuGiyjQWk_fVuXzOn-s0C5bjgjwQ3Ais4Q@mail.gmail.com>
Subject: Re: [Linux Kernel Bugs] KASAN: slab-use-after-free Write in
 dvb_device_open and 6 other issues in dvb subsystem
To: mchehab@kernel.org, hverkuil+cisco@kernel.org, tglx@kernel.org
Cc: mingo@kernel.org, Darshan Rathod <darshanrathod475@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51662-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,googlegroups.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r772577952@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 094E2953F8
X-Rspamd-Action: no action

Dear maintainers,

Jiaming Zhang <r772577952@gmail.com> =E4=BA=8E2026=E5=B9=B41=E6=9C=8815=E6=
=97=A5=E5=91=A8=E5=9B=9B 17:02=E5=86=99=E9=81=93=EF=BC=9A
>
> Dear Linux kernel developers and maintainers,
>
> We are writing to report 7 issues discovered in the dvb subsystem with
> our generated syzkaller specifications. Below are the details of these
> issues:
>
> (1) KASAN: slab-use-after-free Write in dvb_device_open (reproducer: c, s=
yz)
> (2) KASAN: slab-use-after-free Read in dvb_frontend_release (reproducer: =
syz)
> (3) possible deadlock in dvb_dvr_release (reproducer: c, syz)
> (4) KASAN: slab-use-after-free Read in dvb_frontend_thread
> (5) KFENCE: use-after-free read in dvb_frontend_release
> (6) WARNING: still has locks held in _dmxdev_lock
> (7) WARNING: bad unlock balance in _dmxdev_unlock
>
> Here is our analysis:
>
> ## (1) KASAN: slab-use-after-free Write in dvb_device_open
>
> The root cause is double put. In dvb_device_open(), the refcount is
> decreased (via put) when the open operation fails [1]. However, in
> dvb_frontend_open(), put will also be called in dvb_generic_release()
> if dvb_frontend_start() failed. Such process can lead to double put
> and use-after-free.
>
> [1] https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/media/dvb-c=
ore/dvbdev.c#L113
>
> ## (2) KASAN: slab-use-after-free Read in dvb_frontend_release
>
> The root cause is that in concurrent scenarios, the kernel attempts to
> access dvbdev->users after dvbdev has already been freed [2].
>
> [2] https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/media/dvb-c=
ore/dvb_frontend.c#L2916
>
> ## (3) possible deadlock in dvb_dvr_release
>
> The root cause is lock imbalance. Call chain is as follows:
>
>     dvb_vb2_dqbuf() ->
>     vb2_core_dqbuf() ->
>     __vb2_get_done_vb() ->
>     __vb2_wait_for_done_vb() ->
>     _dmxdev_lock() (call_void_qop(q, wait_finish, q)) ->
>     mutex_lock()
>
> ctx->mutex is locked during this process, but if the return value of
> vb2_core_dqbuf() is not zero, ctx->mutex will not be unlocked [3].
> When the task exits and calls dvb_dvr_release(), the function attempts
> to acquire dmxdev->lock, lockdep detects that ctx->mutex is still
> held, violating the locking order and reporting possible deadlock.
>
> [3] https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/media/dvb-c=
ore/dvb_vb2.c#L415-L419
>
> A potentail solution is to protect vb2_core_dqbuf() with mutex, e.g.
>
> ```
> int dvb_vb2_dqbuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
> {
>     unsigned long flags;
>     int ret;
>
> +   mutex_lock(&ctx->mutex);
>     ret =3D vb2_core_dqbuf(&ctx->vb_q, &b->index, b, ctx->nonblocking);
> +   mutex_unlock(&ctx->mutex);
>     if (ret) ...
> }
> ```
>
> If this solution is acceptable, we would be happy to submit a patch :)
>
> ## Other issues
>
> Unfortunately we do not have reproducers for other issues currently.
> We have attached kernel console output to help with analysis and offer
> our preliminary findings:
>
> (4) KASAN: slab-use-after-free Read in dvb_frontend_thread: in
> concurrent scenarios, kernel accesses fepriv->wait_queue after dvbdev
> is freed [4]. Would adding a refcount for dvbdec to fix this?
>
> (5) KFENCE: use-after-free read in dvb_frontend_release: similar to (2).
>
> (6) WARNING: still has locks held in _dmxdev_lock: it seems a branch
> in dvb_dvr_do_ioctl() might be acquiring a lock but failing to release
> it?
>
> (7) WARNING: bad unlock balance in _dmxdev_unlock: in call chain like
> dvb_dvr_do_ioctl() -> dvb_vb2_dqbuf(), kernel misjudge lock state and
> attempt to unlock an already unlocked lock?
>
> [4] https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/media/dvb-c=
ore/dvb_frontend.c#L682-L685
>
> You can refer to [5] to reproduce issues using syz programs. We also
> provide our generated specs to help with running of syz program.
>
> [5] https://github.com/google/syzkaller/blob/master/docs/reproducing_cras=
hes.md#using-a-syz-reproducer
>
> Please let me know if any further information is required.
>
> Best Regards,
> Jiaming Zhang

I am writing to kindly follow up on issues I reported ~2 weeks ago.

I wanted to check if there has been any chance to review these issues
or if there are any updates regarding the analysis or potential fixes.
I understand that you are likely very busy. If you do not have the
bandwidth to investigate these issues, we are happy to analyze the
root cause of them and attempt to write patches :)

Please let me know if you would prefer us to proceed with working on patche=
s.

Best regards,
Jiaming Zhang

