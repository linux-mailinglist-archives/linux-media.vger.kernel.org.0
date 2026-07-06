Return-Path: <linux-media+bounces-66720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FzihGFR/S2qJSQEAu9opvQ
	(envelope-from <linux-media+bounces-66720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 12:11:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFD70EF20
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 12:11:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PpJR8XbG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66720-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66720-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 254123036094
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 09:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1513F0757;
	Mon,  6 Jul 2026 09:25:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC64842F705
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 09:25:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329945; cv=pass; b=CwH6tvQcUgMsYB0wX37uRW8lK6UakQqjX+f8gWT2m9+jvqC2NrtkhmsERhYI0/MDjevZYR+o+KKGEBXYcHvAs+VdGCWbY5JrV9juXiNKFMRV5dFPAlM3d7HukSGJ3GLxG3iyif90uH36yjGynjvht1Z9zfFEs1FnW8m3BL1wXa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329945; c=relaxed/simple;
	bh=aXWqhXzW8pgQrEqSXKb1HaNw65owccWkYKJ5NB9TYM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzkCTYZrJXVLqrASP4b1BuETP73RboBaW9iSK3N0urdiNRbKGDjHHkj+UGUe7pzm6JTSa61g5OYimi8jV3WTxd3rJnJvZ/32sY9CILL9gGS5AMM+hkP3pYUooqLLkc5G4OOrrcpAaMItSCKshfztyMN4cBCjc5gBAD46t+8j4mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpJR8XbG; arc=pass smtp.client-ip=209.85.208.54
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so4852125a12.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 02:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783329941; cv=none;
        d=google.com; s=arc-20260327;
        b=ctsBHf1PDSCuWsjh4qe6qII9VAdVjoWaaw42AGG3S1Rj5AsCD6Sr1SN66rUDFKoxT0
         Zxk1A+R2xWhiKgM2K6mKfykvegPzFQFCVvflAeuu8T6OrxuPBovLmPGOYUO1vgHHnGpD
         rp+s8USvZO3Ll7jHlSM2VHT4skrIRAwW6XtaHfmPGpsHGW+m0lKdK3Ra31OQUneTaVki
         MkEaRHjIEByUvb+rrWz2Z4Ts6Udb5qN615KERXdsJhooduZV96KcRcCtfqWGlXmF8cAY
         usP2ptzuAQDbQPS0Bzbvk/RL4MkxZoVKy26QelywlAFQ4SAy4g/HGudECCGfNvFXlg96
         ZBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aXWqhXzW8pgQrEqSXKb1HaNw65owccWkYKJ5NB9TYM4=;
        fh=cMaujbrUONhSNpjd8W5iDhXkNe6RdgcKWUVoagAvfjY=;
        b=RLfLmDTWk4f6QoySJH7k9MaAFG3f2SiRaYjaDB27VpOCaec/jsowx8JwxOx0Nah1fj
         HPSGBGiLUn1S1KwTf1XP6i2AwWycakREKVmF14k5RMjqWducVNm847nKDFW0mTVD6nBD
         dDo9wg1nOul3HdAWwNOMtrqvsnBiaBH0hHHJXOOsrdrsQC0uB65o/AZxoI6jhK+SRccd
         4ROTGqkUPQB7vE+P6lYe1ITUt8Sk9YTVgkCQ1WB+IxsmzDRCADJf5DKIRgakUpZn6xd6
         p0HnNEM9rA3rGvNb3U7UJ13eCWyCviZ2lNluQ9lGKH4zbFkZcUufjUz0IGl+vgQinOUs
         YDHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329941; x=1783934741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXWqhXzW8pgQrEqSXKb1HaNw65owccWkYKJ5NB9TYM4=;
        b=PpJR8XbGSUTSOOMJPu/Vl6S2VqjAh6oyIygU+gDts1b8DxiuXMvQSchKXCHjZolW6m
         132MuShiD3TsEYyfiffHy5RhDSZx7YqAF+D9PhKV+19EGzSJMSlHG5+K+AtvkfEnITGS
         sXsql824qtzVhYk15+XuD/KnxUK4bDpbv9A6SkQuKbuCemeQ8j6siKJYGBYGhPJCZ1oJ
         28erxhT6Fs30DTZqzdFPOBH0zTU3TsvvOWj+fJE38SRPHaJgRc7Lhn5m7tODc/cXqBsz
         bj7rf1ZH+TIfsM4CAb7QOD0TTU10gT7/bGWiRIMzqnWQ5CQQgM+0DrDvUHVAb0cUQSzZ
         lJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329941; x=1783934741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aXWqhXzW8pgQrEqSXKb1HaNw65owccWkYKJ5NB9TYM4=;
        b=IDvBBhZ5T4uk5P+ESWcMCEtGN4b85FPOWo07s5RjPwyAJTCJdSBLMfMrhNnyXZyAtV
         OWLA5XpHY7rtbG6b4JIyVDFh66mJAmiUCV/QDCba0gJC9rBJmsgpo2zyeor9LozFnrQ9
         +v8LQhuKU2EESV8+SGQWgwjv6LpMRAUH9aAvjFCU1AsdeJMfSDZd8InrA213SGAz8pmT
         ZqfWncdWz46b/6QVh0ETELVA4bpJjDzMmGvMadyW9wOH3MjTJAykKMyePL+CmzK2deLs
         LPOrpPuJ0yhXq3hPePRTMKj/fiJcLLnLIzpGLD8LF8m28+R3RTCgfFqtx3yIb4xFkyL5
         vbrg==
X-Forwarded-Encrypted: i=1; AHgh+RrqkmeNTGBDaeXsnrxO3JYB1WU2a0jdLGD0bK8GlPQPRDx/XagaQz5LOwvYD0NEo7YpHg/iFEI5rIo21w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjGifWUODpdMm1709HQkqXD+yAIo/JArznBk4PV++cW7TihJc
	GbzFsUXKI9oPXJO5hi3/csHs9i0eMU0tZrUSaRjZSWc+xRapK/gOkEcBXS+15SeZuJMzdWU8AFl
	pyKfZbBBA43IV+y0L9vHQqC4mytLFCE4=
X-Gm-Gg: AfdE7cmDM5e/Tj+BhuJKRVrv4cEz0oUGrFDPSVIu2Nop7GNprBP9lhoQWe0/NJFnltG
	z/BAI9sv/SACtSgdIVGbo49Lq/nGBlmSvutPDk9jev+bUEHnp4+ut1IkhXAuZsZ/mnutlsK2nA4
	x0yndBS1FPmmp8k01AXxx7sPiBsyPewiLpeC8dbV3+ZB6F948xKqOEyeGVxU3yP7GnpZIlFhBen
	mFK2+ts1u+jyaAUKOSskGiEmAECEkQTeHvQGvtiWFRQki+cvLxxLAIiQcQR4QH1YMDGij28V2Ro
	vzdYg39MB1RKNwn9G/J5zxDZS+hY+kABn0SmQN8nZi3wmr5AVKZ35eAYLSBk9yYQ5WJftb1VYlE
	D2HawOjlRSXtIeKG9T4T4hZmbdKsBPFEdYt5yWp8Hxpb3QyYUSarnNDCw5A==
X-Received: by 2002:a17:907:3e05:b0:c12:51d9:bb7d with SMTP id
 a640c23a62f3a-c12e6b7d3b2mr304229666b.41.1783329940510; Mon, 06 Jul 2026
 02:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
 <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com> <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
In-Reply-To: <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Jul 2026 12:25:04 +0300
X-Gm-Features: AVVi8CdPYOjGsLChEXFwTwQ1EHWsCOAVxNB1tFPEox7z0_aLqRs7WYJvuTu3rp8
Message-ID: <CAHp75Vdh5crSErhWQ+pvEQcPek+H81hvoTeJC_2oxAE65ijaKQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dileepsankhla.ds@gmail.com,m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:error27@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:dileepsankhlads@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66720-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CEFD70EF20

On Mon, Jul 6, 2026 at 10:26=E2=80=AFAM Dileep Sankhla
<dileepsankhla.ds@gmail.com> wrote:
>
> On Mon, Jul 6, 2026 at 10:58=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > This is a huge driver and doing half-baked work doesn't make sense.
>
> I will try to send a patch addressing all the "else is not generally
> useful after a break or return" warnings.
>
> > Also if you want to continue working on this driver, get the hardware.
> > Almost any cheap second-hand Bay Trail and Cherry Trail tablet should
> > suffice (of course one needs to check the specifications beforehand to
> > be sure it uses AtomISP camera).
>
> Sorry I cannot get the hardware right now.

I see, but please consider that to have in the future. The driver has
tons of work needed to be done, but most of that needs real testing on
a real HW.

--=20
With Best Regards,
Andy Shevchenko

