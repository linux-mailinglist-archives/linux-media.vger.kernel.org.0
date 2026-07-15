Return-Path: <linux-media+bounces-67703-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V1DlIkSZV2roXgAAu9opvQ
	(envelope-from <linux-media+bounces-67703-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:29:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE075F676
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:29:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p+uaGv7n;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67703-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67703-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0306F308B619
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA4F27A10F;
	Wed, 15 Jul 2026 14:25:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ECF370AFD
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:24:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125502; cv=none; b=caFjO81pmqi9OnclBkiA+otafahfpGgUNEA5nmOhsY1zGlIFhZteSKgqqg2wLCQoaR47XjQfkcc5qiSjf9T3yjzFdIntlGZN4VtTqO2iQAmeV3rnJT8EldLRHNpUzBH+UXvPWMJ01enY2xY/bAL5+awgt6OQr+23NENSnKsypBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125502; c=relaxed/simple;
	bh=rwPDXsTip2O50qVw7MVaMEE2q0Alcc9GaVCCh+wa6Ys=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D00j3kEMEef/6fQqEuYdrYTf7HknfEMhGgGsz0wPPIBQtzXCFIi/ZvxVT67pk6yvm4crer7alx4JtuAS3PSSaUuvOBdw1Lv5k6B8YmmWMnzyawc1BuKay5eeinj/4jHnoPF4zCIb75eRRz4oqQb9mK/UIBdXir5oSzDco0x6YT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+uaGv7n; arc=none smtp.client-ip=209.85.208.172
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c94d4fdb9so33002381fa.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784125496; x=1784730296; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=;
        b=p+uaGv7n+9KlnK50A62Fc94XvukPlOs/ERAuEXCCVD/shAB8LGCqp5vev9Ip2ohKO/
         gUwi5+TU++NeLB7+nI21M7uq25Dhk5hMHFMmQ4eSzvYEzjckgS6yXOcRv0G00yPBWd6U
         +AGlTPRre0RXawDHVtI8L+ipcsI8kTnw6tfDm4BCEAvmHukO/QBVyu2MJ4jQwE9a3JvD
         s603OvU7QFTSOSPxNbW4c/IC2hDI3HosdWNbktqZQErn4FXcqvIjiCDSSwrqpkwkqGgO
         BHN0173sgMJEZUBewz7gKSVMwO+LhNZFXRYwxEKdW+gVlffkGUPY8BMOfCFkuv8iLEB3
         07LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784125496; x=1784730296;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=;
        b=YqfHOsLjvA3EMi+acyT+TCwK4QCMgnaIVYOrGjB0q8Te9jxZtYyoIt2h/3oKEOePaI
         yr0Kr1VPC8xsm5fyu6MkAhIgnpYK2P3Tk8aoe+HwL2WN10W7ZR+ifXqwGuRUsdU9YMk6
         3iYEoGADI7nEer5ATpYZ6NigCQXqh3kLonrEI83GSE6RfznwxnfUbzbxQ1HLCR8RZEHK
         nSfPXAqihfUwmTLPSU/qggTjMgOigwaQg4ySneltURiLITf3cdDST0W7htsf4IbuPWBJ
         0zQV1go/nAqj/uXO4GPrLiZAc1qEQnwhzxc3xqhwRkeK3k+1Hwe5Ol3ZJbBBC/OBmp4+
         mzpQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3wfPOrDC4VeNwI6HWMktnuaGvOIkoq+OJhTj6kpDxhx+AXM5kIWn+0jkElxDRLmHUWj+yx+9nEKGlWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtbdKNOax69Tof5cMDgrqwSJyCEtdbVAT0YJj/p0il91ErzsLt
	GHhS90cWfLQ/tIycSZGN0/IX1tTHrSwf37I7J8xj0rkZ5nhBgYvTy8g7
X-Gm-Gg: AfdE7cm11Em9kkXS6TItngatRlB7ZKxDMvbDx98hzXu2Fnl4Ujyb01ssTmnp8VcxJrP
	bKNnWcEUxcQV/nnJG97Cvu8pAM6uIscwYf3iTtbizkQjlx5d2aRZX9QNnEy6993JQFzA63q3Piz
	SoAB5IEhYELeGyIW7zSGIoFR+I65lLbHEg7L6/f9m8TaFM3H31VZG63wEBgHQYJ0FwCTlU7RvoZ
	kisnlgixzBP5tic9fw3gz6Vcip8SFRxEC7awup9URTTiPb6dRkQWDuCWwBJdfOXELhHkbhZQ+B9
	gL7ZjFRAK7T7L5Uyef5AV/+Mjnshkki9D0bcW6Gh3MiplwR46N/kOtjZmhajJWK2OAKmNv+ie58
	3As+ETTk9if5VbM/8SBMclT399ZkdChitQ4VJxRELR8cQtH9if5V5eSmaWzThW+09hRT0fCKm0x
	ZCkaRW+F3MXZQ0OAh0lbGRY527rD/IaJFWZAaj9GaZrs18QiutKpCM
X-Received: by 2002:a05:651c:b28:b0:39a:fef1:ad7 with SMTP id 38308e7fff4ca-39c94cde536mr48470341fa.21.1784125496005;
        Wed, 15 Jul 2026 07:24:56 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180f3sm36977811fa.4.2026.07.15.07.24.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2026 07:24:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race
 conditions, and stability bugs
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
Date: Wed, 15 Jul 2026 18:24:39 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Doruk Tan Ozturk <doruk@0sec.ai>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8DCA30D7-46DA-41A3-BB05-4C841D20BC0F@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
 <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67703-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[christianshewitt@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:doruk@0sec.ai,m:linux.amoon@gmail.com,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,0sec.ai];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christianshewitt@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EDE075F676
X-Rspamd-Action: no action

> On 14 Jul 2026, at 11:23=E2=80=AFam, Anand Moon =
<linux.amoon@gmail.com> wrote:
>=20
> Hi All,
>=20
> On Mon, 13 Jul 2026 at 17:38, Anand Moon <linux.amoon@gmail.com> =
wrote:
>>=20
>> This patch series addresses a collection of critical race conditions,
>> memory leaks, use-after-free bugs, and resource management issues
>> within the Amlogic Meson video decoder (meson-vdec) driver and
>> associated components.
>>=20
>> The primary focus is tightening session lifecycles, safely =
synchronising
>> the V4L2 m2m framework callbacks, hardening work queue operations
>> (esparser_queue_work), and correcting buffer validations to prevent
>> stability issues like KASAN out-of-bounds errors or stream-on =
timeouts.
>>=20
>> Summary of Changes:
>> * Race Conditions & Synchronisation: Fixes multi-threading and
>>  execution races across stream-on, stream-off, job abort, and
>>  teardown pathways.
>> * Memory Lifecycle: Eliminates memory leaks and use-after-free
>>  vulnerabilities by safely pinning, canceling, and sequencing
>>  device removals.
>> * VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
>>  parser, properly tracks ongoing buffers via atomic counters, and
>>  prevents invalid memory writes.
>> * Platform/DMA Adjustments: Adjusts DMA segment configurations,
>>  canvas handling, and buffer sizes to match modern hardware demands.
>>=20
>> Note on an outstanding issue:
>> An execution deadlock occurs in the driver workqueue path during high
>> stress or long playback sessions. This stall is triggered when the
>> Amlogic hardware internal video FIFO buffer becomes completely full.
>> When esparser_queue_all_src runs, the capacity validation check is
>> tripped due to a design limitation in how buffer exhaustion is =
handled.
>> This blocks progress and leaves the workqueue worker waiting =
indefinitely
>> on a core mutex lock.
>>=20
>> The resulting hung task call trace shows the worker thread blocking
>> on the internal lock:
>>=20
>> Workqueue: events esparser_queue_all_src [meson_vdec]
>> ...
>> __mutex_lock
>> mutex_lock_nested
>> esparser_queue_all_src
>>=20
>> I have tried to address this issue, but the underlying deadlock =
persists
>> under extreme conditions.
>>=20
>> Any feedback on this new appock is welcome.
>>=20
>> Testing was done using v4l2-compliance and active decoding pipelines
>> on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.
>>=20
>> The v4l2-compliance tests passed successfully via:
>> $ v4l2-compliance -s -v -d /dev/video0
>>=20
>> Pipelines were validated using the following GStreamer script.
>>=20
>> [1] =
https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5
>>=20
>> Previous changes:
>> v6: =
https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/
>>=20
>=20
> I will review Sashiko's feedback. I will look into these suggestions =
and
> work on incorporating them to improve the code quality

Hello Anand,

I=E2=80=99ve picked this entire series into a LibreELEC image using Kodi =
22 and
ffmpeg 8.1 (using the RPi source that improves v4l2_m2m behaviour) on a
7.2-rc3 kernel and run some tests on a GXBB/S905 board.

Without this series H264 plays and seeks well and the unmerged H265 =
codec
also plays well and seeks well but with minor artefacts (something that =
I
need to look into). The experience is not perfect (this driver has a few
flaws) but it=E2=80=99s consistent with the =E2=80=98usable=E2=80=99 =
behaviour of the driver in
the last 1-2 years.

With this series H264 plays but seek seems to hang everything with no =
logged
errors anywhere. H265 results in a black screen and again everything=E2=80=
=99s hung.

It=E2=80=99s possible that kernel changes need to be balanced with =
userspace? Can
you please share details of how you have been testing things (and on =
what
hardware)? - I will attempt to replicate and poke smaller portions of =
the
series to see if I can isolate which bits are problematic to the =
otherwise
usable current experience.

Christian




