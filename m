Return-Path: <linux-media+bounces-53085-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEG8J4rjlmlbqgIAu9opvQ
	(envelope-from <linux-media+bounces-53085-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 11:18:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1558815DB86
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 11:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38C3830182A7
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82D230AACF;
	Thu, 19 Feb 2026 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvtTILJD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7A328C87C
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496324; cv=none; b=FJML1Cq5V+1va8+lu1e3vyrFg4Myonvj+jP/LEow3oKbRqSHKTiO4re1/UPSq/upzklgTWlSbH7bCYG2AQH7vY11kB2TGI0Ct8vKcC59BR/839AT5FEJ7miIYaJLqYnwEO82kXUXFEmBlPIzAlLArRi1g8nq+pmqF9O2hpLXZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496324; c=relaxed/simple;
	bh=wzh55W09PaCWhWdIbCT91GweQa2ZaySnkVYjZLUYTW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qSZUWT+cDZ5xwA6ZbWs7a0/lU6eKlQ6wuAUMHNWO07121L72tZ6VGZ4cxf0NnBAanxkCywffQKFf9Ehwj4qAEAHDszQ37zbxb/sxmr8rgyw3g3wUAKEd4s7AHecKwD1jB2jnetfaAR6QeEN7LrXB7gKEJ8G+G5Mq6GVENo/uqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvtTILJD; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso6839125e9.2
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 02:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771496321; x=1772101121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYel7EaCkaihWct+rkFi+N7PaNErw8Up6SMIw3SlfbM=;
        b=WvtTILJDNLci1vc/aJqlOXrlKUWTe95uY2alHtnHlEcjv6KYNqegMwTyssFq8Ky5uN
         3iGpydkzOCwJqBruKg0lHW4+cNjibW1kszXXvG1UH279WrCV5MIJrwbsYofBc6XtHqid
         bo2A7lsdu7a2GfrZf8+e1IyiUNoVDz1JKs2+7mqm5I18zXEDzfFjuZ3f4+T5JRb6v94c
         CgIOTMCp+pwn31SeW8+l5TnbpRMnvYStZExPsjWKSwK9JPhzdIxVdGkNgkZZ7xRk3g4t
         /He2vO6JZfvmmXc9yVBd8JJXQpg7eP6GIPiMw+pI0Ot8fgq6MEP2lncKk939VPixtKHZ
         Xzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496321; x=1772101121;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYel7EaCkaihWct+rkFi+N7PaNErw8Up6SMIw3SlfbM=;
        b=sUoZNj/R+FcmYz38R0Ld/LjJ8ZwYlpENTZlJoDLTtyOQ5cPcXiyJyeDJEughQCRjm5
         2bukj62rIx9vLo7oyzGPx/LllseW5ApEGHFHmoBv1ydUoW1O3zGI0h2NHFE9mDFR3VKV
         7pf3xU2b5vqny0TYuQvl0VnnUBPzZ8ovOWhSVV/e4nFUuJYGwlyCcAVaJP07HDKYhQZx
         l+nmmUN3SXwq5Lu+f87mW3QsLsqmxgBLo0TbEcE2ogZYtsRliX28VflUcSLfDc9ne7Vs
         +cKX6yRR7gMieKdxRlQUzatTk8YQcRiXsdqDrnUflvp+ApYD3UcFT8/qx79GmmFFDnRL
         xG2w==
X-Forwarded-Encrypted: i=1; AJvYcCUAHITXc4Yo7pMDOEA+pCu3488XHERhih8y1dwHxIpqj4z8ZQ37W4G295qYMXCEbJSBE1Z4rNtSEWv2DA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg6bgAX2HYPw6B9UDJkRJKOguKbz71IBooOV0Bg5TCniUnqDkx
	hIVCkXDEre3oxnJnJBRq3ghi5eSHbU7FIBbDraQFxbdoMPeolGIxIwb0
X-Gm-Gg: AZuq6aKx8Xfk1KgR0iemDH4eZi2omTBYxYnWthodkPqq08P2ztjeAZ45JrbibsJXdUu
	/TUtbmQvFxL6ygizfE93koZ5gLDkvGrMz4xBQ+1hEiMdyQ1potcaTKEm4DMFqDJvslMtWdi9RVR
	F73Q9t8PRT57LHUsQOCWFHRWViAV57vGx2YtMQr4hSIsRBkKPo1/L50woP9C6uPRRXhSHJGyG4+
	1sZXmbuRofXruUi0/JWS7BnrNmwHQQKNyyiWxMC+I21/DCWDouOL0cE1hzNcudunPCVtoklMVLs
	0ay4uyr44HpD/KJgJYnWk7K5uC+L4BCS9ilQt6eweI6s/+yOpVvyF85c8JFwa3MihLtVm//beF3
	yV7f6CCbUfbZobHgjenBTJw7U25RI2y8ULiH6X577trlyRCRoYgzq2mMDNGP7zaqXyac7idAge0
	qv7/PiZ0KcVpOR3NY8Kbf9tt7HNEzTzYiYM6VGOhfBkjLQgHiM1Ohoj9I8IihHuSNH
X-Received: by 2002:a05:600c:6912:b0:483:709e:f22d with SMTP id 5b1f17b1804b1-4837108fc46mr349815445e9.27.1771496321068;
        Thu, 19 Feb 2026 02:18:41 -0800 (PST)
Received: from Abds-MacBook-Air.local ([2a02:3037:201:298a:fcf6:596:46c1:61a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f95ab0asm20672715e9.7.2026.02.19.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:18:40 -0800 (PST)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: dwlsalmeida@gmail.com, mchehab@kernel.org, linmag7@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by
 value
In-Reply-To: <20260218141123-d54e3a23-c3dc-4ce7-8a8f-1d77fa4c7960@linutronix.de>
References: <20260216211703.3702-1-abd.masalkhi@gmail.com>
 <20260218141123-d54e3a23-c3dc-4ce7-8a8f-1d77fa4c7960@linutronix.de>
Date: Thu, 19 Feb 2026 11:17:55 +0100
Message-ID: <m28qcpyr3g.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,syzkaller.appspotmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53085-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdmasalkhi@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,96f901260a0b2d29cd1a];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1558815DB86
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 14:24 +0100, Thomas Wei=C3=9Fschuh wrote:

Hi Thomas,

Thank you for the feedback.

> Hi Abd-Alrhman!
>
> On Mon, Feb 16, 2026 at 10:17:03PM +0100, Abd-Alrhman Masalkhi wrote:
>> vidtv_ts_null_write_into() takes null_packet_write_args by value,
>> causing MSAN to report an uninit-value warning on buf_sz inside
>> the function.
>>=20
>> Fix by passing the struct by pointer instead, avoiding the stack copy
>> entirely.
>>=20
>> Reported-by: syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3D96f901260a0b2d29cd1a
>> Fixes: cd7a5651db26 ("alpha: add missing address argument in call to pag=
e_table_check_pte_clear()")
>
> The Fixes tag should point to the commit which originally introduced
> the issue that is being fixed. My commit for alpha-specific code is
> unlikely to be the root cause because a) syscaller is not running alpha
> systems and b) the first occurrence of the syscaller was before my patch
> was picked up by Linus. So please try to find a better Fixes tag.
>
I will fix the Fixes tag to point to the correct vidtv commit.

>> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
>> ---
>>  drivers/media/test-drivers/vidtv/vidtv_mux.c |  2 +-
>>  drivers/media/test-drivers/vidtv/vidtv_ts.c  | 18 +++++++++---------
>>  drivers/media/test-drivers/vidtv/vidtv_ts.h  |  2 +-
>>  3 files changed, 11 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/medi=
a/test-drivers/vidtv/vidtv_mux.c
>> index f99878eff7ac..67a580396112 100644
>> --- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
>> +++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
>> @@ -363,7 +363,7 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux=
 *m, u32 npkts)
>>  	args.continuity_counter =3D &ctx->cc;
>>=20=20
>>  	for (i =3D 0; i < npkts; ++i) {
>> -		m->mux_buf_offset +=3D vidtv_ts_null_write_into(args);
>> +		m->mux_buf_offset +=3D vidtv_ts_null_write_into(&args);
>
> Please explain in the commit message why this is change is safe to do.
> Modifying shared data might break the logic. (I have not verified this)
>
vidtv_ts_null_write_into() only reads from the struct and does not
modify it. should I add a const qualifier to the parameter?=20

>>  		args.dest_offset  =3D m->mux_buf_offset;
>>  	}
>
> (...)
>
> Did have syscaller test this patch before submission?
> See the following documentation from the report:
>
> 	If you want syzbot to run the reproducer, reply with:
> 	#syz test: git://repo/address.git branch-or-commit-hash
> 	If you attach or paste a git patch, syzbot will apply it before testing.
>
I will test with syzbot before sending v2.

>
> Thomas

--=20
Best Regards,
Abd-Alrhman

