Return-Path: <linux-media+bounces-37720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95883B049C2
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AD1E1A63FC6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC5B25DAFF;
	Mon, 14 Jul 2025 21:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b="BhHUe+35"
X-Original-To: linux-media@vger.kernel.org
Received: from taubenbroetchen.weidenauer.cc (taubenbroetchen.weidenauer.cc [37.252.242.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D9523A9A8;
	Mon, 14 Jul 2025 21:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.252.242.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752530070; cv=none; b=W6m1KWu1g9khjL63J8c5IhLRQS6H178dUCfLlIMjKrgEsAUMaPQ+/+1dizksSekipMzfD/Ym+t/j5twP6tYbTxW0x7lGuGF/BR9yTihR9GhjXTY9iXwI4olN1iDC+u6VwOMhQNk6aRzQ5nME5u95V2Ao8kOFjuebh3MiKUC3yeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752530070; c=relaxed/simple;
	bh=ZdtovMNt9ZNn1pVjaqdynhY0nvuEphqZNR8E6ktlgT8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HJJgpxrnQYCKhZZlui8ia6I/Bsm4miLvBD1FoxrZOYNDCLpsvZuIiZfzNVgnk0DRcI2ZhpOWViIIYN1KV+HqfxRtnUKvQGhAkpl48KoGd9Owl2A8WpsjtWCErNfIOP7U/k4TQ0Nc1GnCBp4MRA7XjRdWsSsYG7fsF1PtvVvj9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc; spf=pass smtp.mailfrom=weidenauer.cc; dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b=BhHUe+35; arc=none smtp.client-ip=37.252.242.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weidenauer.cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weidenauer.cc;
	s=taubenbroetchen; t=1752530066;
	bh=ZdtovMNt9ZNn1pVjaqdynhY0nvuEphqZNR8E6ktlgT8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=BhHUe+355rjUE4rpdowABuCbkEzxXI+yQUGpR7EFr7LVEz9h026xa6jyWDMincFn/
	 PRKMySy0qTgw60RLBQGY46dMXlSOU9mL2Zgg8mP3klTkSio8Mj1cDUSnoWAl1PQoCb
	 0hEoRzMUo+jLlvH4TZ/+gCCWQcjsyOixidSzB6k5lPSGMZWLeUCiNLOlWS9gQjPIXV
	 izf6AczClqwFuohEvde7yPnfk14z9MiuhJQjTlj7Lshj4tXIUmqCarp3WvHcKkYKdv
	 yYl6jAbq30MRSAO/E4i0rF8GJthH3LEt+YbKe5mztH04++nDR1J7kQ4Z2LiO3IVON9
	 onP29u/FGCoaA==
Received: from [127.0.0.1] (i16-lef01-t2-212-195-167-236.ft.lns.abo.bbox.fr [212.195.167.236])
	by taubenbroetchen.weidenauer.cc (Postfix) with ESMTPSA id 2714D64263;
	Mon, 14 Jul 2025 23:54:26 +0200 (CEST)
Date: Mon, 14 Jul 2025 23:54:24 +0200
From: Martin Weidenauer <martin@weidenauer.cc>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>,
 hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
References: <20250714153409.46085-1-martin@weidenauer.cc> <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com> <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc> <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
Message-ID: <1D5485BE-E03F-4364-A48D-051AAECFBA9A@weidenauer.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: mw-taubenbroetchen01
X-Rspamd-Queue-Id: 2714D64263
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 8.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,debian.org,kernel.org,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.sr.ht,igalia.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]

On 14 July 2025 23:38:47 CEST, Andy Shevchenko <andy=2Eshevchenko@gmail=2Ec=
om> wrote:
>On Mon, Jul 14, 2025 at 10:39=E2=80=AFPM Martin Weidenauer <martin@weiden=
auer=2Ecc> wrote:
>> On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy=2Eshevchenko@gmail=
=2Ecom> wrote:
>
>> >Guys, please, coordinate and issue only one (or a few) patch(es) per
>> >an issue=2E No need to send zillions patches for the same problem
>> >file-by-file=2E
>
>> >On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin@weid=
enauer=2Ecc> wrote:
>> >>
>> >> Fix checkpatch error "ERROR: that open brace { should be on the prev=
ious line"
>> >> in ia_css_dvs=2Ehost=2Ec:277=2E
>
>> I deeply apologize, however this was the instruction of our workshop in=
 DebConf by Helen Koike <koike@igalia=2Ecom>
>
>This may be okay for the driver that consists of let's say less than
>10 files, AtomISP consists of dozens of files in several (nested)
>folders=2E It's not a good example for such an approach=2E
>
>> Here is the link to the exact workshop:
>> <https://debconf25=2Edebconf=2Eorg/talks/55-submit-your-first-contribut=
ion-to-the-linux-kernel/>
>
>Hmm=2E=2E=2E this really needs an update to explain how to work with the
>drivers that contain many files and literally tens of thousands lines
>of code=2E
>
>In any case the problem with your contribution is not the code, the
>absence of coordination and possibility to clash with somebody else=2E
>Also it looks like a DDoS attack against maintainers capacity=2E The
>smaller patches are and the more of them --- the less the usefulness
>of all this activity as at some point that floods the maintainer's
>mailbox=2E
>
>TL:DR; (always) Use common sense!
>
>

To be honest, such a contribution also seemed to me a bit useless but I th=
ought all of this had been discussed with you maintainers beforehand=2E

As it seems this was not the case, although the workshop has shown us how =
easy it is to make contributions and for my part I will use the knowledge t=
o make meaningful changes=2E
So you can scrap this commit and I'll make a few commits in the next days =
which make more sense=2E

I apologize again and it is an honor for me to start contributing to your =
driver=2E
Be well,
Martin

