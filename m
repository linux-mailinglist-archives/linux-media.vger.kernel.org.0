Return-Path: <linux-media+bounces-66172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8bJVO73WRGpE1woAu9opvQ
	(envelope-from <linux-media+bounces-66172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:58:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 601586EB5F5
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:58:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lgd0dUqs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66172-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66172-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0774A3031B42
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D113EEAC3;
	Wed,  1 Jul 2026 08:51:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv2-f1.google.com (mail-qv2-f1.google.com [74.125.230.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E2C3EF0C9
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:51:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895917; cv=pass; b=ai107voLsmBTfYckc31dJLHz9SX/zyxwx8gL5erUzB4KVpDYKgA2Sc5Atqe0rOACyX+/P4qGhPAPbMJ8RrDqKIj9Jx7gaqKgipGT8eNXrKgGPD08ak6SswnBNDxeVV2UpEnn6WtMFZ1oLb5YNqZsJCT/8/gV/FR3WM0MS4+Gwak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895917; c=relaxed/simple;
	bh=pFH6cNuSmlixytcQni2TC/N4wflLe2KEpz6FoIXOnHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fo+clyT74y7bcnhPNyy4aTQOgBTMsy2YOM/2ru/JmtpfxKiRtKgyhN+nryoAo9Xi2sJlI3IXKLYezjJGviI0k+vFcKX98HgkpSXqMCLH749Uegc8VQvy/lqd8z+ft34jCrD3DuMPy/XqexbKXkvDGRosLcGNCWwDEGanTmyGlg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgd0dUqs; arc=pass smtp.client-ip=74.125.230.129
Received: by mail-qv2-f1.google.com with SMTP id 6a1803df08f44-8f3f86931afso166026d6.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 01:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782895915; cv=none;
        d=google.com; s=arc-20260327;
        b=HOfNZn6FRnz3hv3DUOG52eDfACM9IijGcVTxZQaqaiVoHGNU2GJk3Mq/GaPi1ZEMW2
         +2YUPDgkhcChBM7fcUB8savWc1fVD89toUrYu2Z9XmFvpuZkrpQVD7p4M9PIESxGc4Vs
         G7DE3V4rHA7Imbty8xXh6RKy7F1gVvckP7a9Wyol0s8wE2GOg4ZIWB0B6WhY0nvGrQFM
         6MSgR1jjsN+uh3X5IDR1Bp9s+sU6BnDpp+Xptl+D+03W0VOpRU9jeyPl4hjTRLO0GuLC
         15q5oaF3TYMnXt5euzqf/rXotgUKnsf6yCjjmlmzNTmdPV97LkwxKq6yiNOaa3QUwFVs
         lIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFH6cNuSmlixytcQni2TC/N4wflLe2KEpz6FoIXOnHo=;
        fh=w2tscBpKXKKbFrVmkChLjz6IXrJqXTd0FB8VchoLUEQ=;
        b=UScST5qSp0pk7ZfVQQdcleKPgjcDqgsKMXmS1HPoakOdxmBPB6OIR0Dk2zA8sBHW0u
         QWG0s5W1pxaWCzUHHWUVv0Pq3FPqxn5efP03JZ98HhwQWSWBVQ+0gM4r5UMzIIfT6wP/
         Mc4n4uVQVik+8AozCVVgqQnSPw8UcYvuBPvewQI/K+4Uz1srUIkyl9LFqjP41MMwJdjw
         44px/cxQnDcMMZZkdIrdbRmgfHMUL+Mt1CE9jkXKXY00qZG+14CAk7caOU+x9IOOH866
         WvrdCG2VeoJNOPyaLDhBoWpgYvEGCZRLakv6l/F0RS7SJGpkj8grkL9fJGrOOKFD4NoE
         CXNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782895915; x=1783500715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFH6cNuSmlixytcQni2TC/N4wflLe2KEpz6FoIXOnHo=;
        b=lgd0dUqsFfO1CYusZPfOfrzufG+lii6GPbeRmg/suQA55Kz5WAPx50yZfDTWzMM2J5
         wze/8ZLup+HTj6lKgYqnvqAMlokKIZXHtVHJKSzGCsGu6h9JpI0AuNmwTIV/2VUvGDEh
         ldYHq4ckfOFytq2J1vYYjzLCmpudR1ihTWiWex4ZJeb4r3LO8Zua09jJIVUIviHY5IGq
         HcW8MHuXjaeoJphBcwryj4vMBhwpwwoTrBgay9KV5Co/6lVnKMV018cR/sKMGR+2/t+Y
         FXf4/456Bcg9/aMZVa5lO1iFfq3jBxLhCJDaqzJsOY0EmCq9/41wfrt7Tugx3BVksD77
         RUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895915; x=1783500715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFH6cNuSmlixytcQni2TC/N4wflLe2KEpz6FoIXOnHo=;
        b=Kt+8vCtL+YTfSpd+HDsBqBS2Rz/3qQbgUi85i58LOji3vF20iPya1l7TDAHqW1BHy0
         +HAWMFioJVeRv/4h5fp5luAjCaabM9nsAILL4DrnEfVHCcxTTsdQP5qklS2+GOcTgpxM
         mSiezPHKpCa5i8Q6P+fvMo4p2MD6QzHmG+iwzkLN2cQIG/3vG/EBC1zFmAQ9FdEK/38l
         raANKQYolCMKxEU6sr6D8gnyoY0bmtSksAsaLL8YSdHRk0oc+RkvTU5A22hmt9x2zSvC
         qgWR79zJe0puhdrVzw2G4PsLFUpKRQeTQaYOgZFmu3lrXWTwrS1zvPKAWqdma1zOG+or
         Q+8g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Y+Af0X1EBDsjPl4A1jDK2nEUQMzWgmRppVTw8L7DVMeSzd+yCmjCRgSTDmidXxrWj5L0W50NijtYtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgGURSCN/hO8/1jU5sg8CZoquG1iIR/lbskwn+VR/02+/aMZO
	rsLicRSVJxuc93V4g+lL9Ynn6zcwvMIlYdb1utMbJEdPIdDZl8ZGWELUpa5gGaXxu0WDv3qjKdF
	Br5cjTZ+2FUY4tNeo9ogI1Ed2LpIAqcs=
X-Gm-Gg: AfdE7cmpOc1JM+iAr4Fu6r6dGmShQmjWxB4crkSsguFghUMrqaZ4x/JKrhMXOuCpQ/7
	9P3fEWbmmeua1urgHIUxaQxP0ncCbDJQsMS9SG8B7fwSVoT1/qwxeHRrDlcBqyWSHAR7KQoHvXt
	1/Lfvypfmq48m3T1qiK7/EdQKkfYJbmVf2esJ6+ihMtJSLcUMPuijpxFYMBmneg20WyTLTGbLd1
	6kpa2kOJfvSK+0yfOyEIccFooDw98Yv8eXucr/mH2798+AXo1/8yDxcW1M=
X-Received: by 2002:a05:6214:540f:b0:8db:4069:6e6e with SMTP id
 6a1803df08f44-8f3c64d59bamr8214296d6.6.1782895915154; Wed, 01 Jul 2026
 01:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630160435.3293-1-bohdandmarcus@gmail.com>
 <CAHp75VdX_DmiWXc_pYCgZd88cO3=yB7vFsgHx_8HLAJtaJOHow@mail.gmail.com> <CANqab03_SQFDb38wkXBMUiJ1Xk-g9_ZpqvOUo+nQyR+SsVnsFQ@mail.gmail.com>
In-Reply-To: <CANqab03_SQFDb38wkXBMUiJ1Xk-g9_ZpqvOUo+nQyR+SsVnsFQ@mail.gmail.com>
From: Bohdan Derkach <bohdandmarcus@gmail.com>
Date: Wed, 1 Jul 2026 11:51:43 +0300
X-Gm-Features: AVVi8CcHUGs-vT-SAPnhCzFIV74Ay11IKjwWBKd4L9H8eKNQ4HL746SlI2bC5AI
Message-ID: <CANqab0096R4gKrwfKF78iyQt2aM0qQJoSwrBKBqMiZxna60rsg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: fix block comment formatting style
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66172-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 601586EB5F5

Hi Andy,

Thank you for the review.

You are completely right about the indentation and line wraps. Dan
Carpenter also pointed this out to me yesterday, and I have already
prepared a v4 that fixes all of these issues perfectly. I am strictly
following the rule to wait a full 24 hours between sending versions,
so I will send v4 later today.

Regarding your question about whether this is the only issue in the driver:
I understand that sending a patch for a single block comment in a 100k
LoC driver is a very small contribution. Since this is my very first
patch to the Linux kernel, my main goal was to learn the correct
workflow (git send-email, formatting versions, acting on feedback)
before sending larger patch series.

Once this v4 is accepted and I am confident that my setup is correct,
my next step is to grep through the rest of atomisp to fix similar
block comments and submit them as a proper patch series.

Thank you for your patience and for guiding a newcomer!

Regards,
Bohdan


On Wed, Jul 1, 2026 at 11:42=E2=80=AFAM Bohdan Derkach <bohdandmarcus@gmail=
.com> wrote:
>
> Hi Andy,
>
> Thank you for the review.
>
> You are completely right about the indentation and line wraps. Dan Carpen=
ter also pointed this out to me yesterday, and I have already prepared a v4=
 that fixes all of these issues perfectly. I am strictly following the rule=
 to wait a full 24 hours between sending versions, so I will send v4 later =
today.
>
> Regarding your question about whether this is the only issue in the drive=
r:
> I understand that sending a patch for a single block comment in a 100k Lo=
C driver is a very small contribution. Since this is my very first patch to=
 the Linux kernel, my main goal was to learn the correct workflow (git send=
-email, formatting versions, acting on feedback) before sending larger patc=
h series.
>
> Once this v4 is accepted and I am confident that my setup is correct, my =
next step is to grep through the rest of atomisp to fix similar block comme=
nts and submit them as a proper patch series.
>
> Thank you for your patience and for guiding a newcomer!
>
> Regards,
> Bohdan
>
> On Wed, Jul 1, 2026 at 11:31=E2=80=AFAM Andy Shevchenko <andy.shevchenko@=
gmail.com> wrote:
>>
>> On Tue, Jun 30, 2026 at 7:06=E2=80=AFPM Bohdan D. Marcus
>> <bohdandmarcus@gmail.com> wrote:
>> >
>> > Fix a block comment formatting warning reported by
>> > checkpatch.pl in atomisp_cmd.c to conform to the
>> > Linux kernel coding style.
>>
>> Almost the same comments as per v2. Please, slow down, read other
>> comments and act accordingly.
>>
>> --
>> With Best Regards,
>> Andy Shevchenko

