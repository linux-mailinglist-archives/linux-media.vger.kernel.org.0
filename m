Return-Path: <linux-media+bounces-37708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA3DB047FA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C753BCD61
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C6422AE5D;
	Mon, 14 Jul 2025 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b="glr1dM6n"
X-Original-To: linux-media@vger.kernel.org
Received: from taubenbroetchen.weidenauer.cc (taubenbroetchen.weidenauer.cc [37.252.242.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62412E370F;
	Mon, 14 Jul 2025 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.252.242.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521945; cv=none; b=h6fnUugQnKpmdxCOj33Q6mgu8/4nxt4/u0EAL4QMKAyDMHzMWzrYxZ1/OeEuP4eCpR7xH5+xlqtsID6Vmto1RaELSRhQ0HulbYM2Qs7NvrPt89ZxaUrEveY2Abo5rTSnBGsrbsKLXfwBeNEfrNo+/KvFlwYdo6nP+68fPjmxBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521945; c=relaxed/simple;
	bh=Mz5M/kJtIAT6vDMG1qYV1GLqe+Z3k6kVFXTM4uQXpWo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=N6G1Hq7oCCJuv/eopvUYNc34bMLV0ixenlOfWJINoL7Cd2XV3SJa1XP7k9tdXMJjtyPdaJE9STEw2jiP33iOO0tnN1tUdAlUOfL4sV4Sr59e/KqKcCcUMb2dhB1gZLR2iEPooTbXCzYQn7GBeIkBljrmm682Qt1J0Ym8ETKdh5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc; spf=pass smtp.mailfrom=weidenauer.cc; dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b=glr1dM6n; arc=none smtp.client-ip=37.252.242.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weidenauer.cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weidenauer.cc;
	s=taubenbroetchen; t=1752521941;
	bh=Mz5M/kJtIAT6vDMG1qYV1GLqe+Z3k6kVFXTM4uQXpWo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=glr1dM6nEdgu7wmbeaW1KoWuV3jcbijwxKsrJHcswMISzJiiMeFipQRxWBK1RMp0F
	 0e71zG6JZ6WbkgxnQ2UVMCmjVKi/zji6JZocsBWw6ld8cEohJ3Lg0pvKtsz6vpG+WK
	 Leb9qcmQBWR5oYx986k5GeLsejcd6bj3zBXeRXDIRPqPXveJpmoP5K4jZfMfgxs0aZ
	 cdkmBsUyS6ogFT3Bli5DC8WXlBOo4pxMH0dbFFtQjD+pCfFuCyMx85t9yvDaoS6jW3
	 sRdbeJrs311NyElztHjoJjeCB53pzWbkbXWJVkVIlkZ5/ZA3IEBRQnJF0aOTOFUI+g
	 bhN39eFV8q8uQ==
Received: from [127.0.0.1] (212095005104.public.telering.at [212.95.5.104])
	by taubenbroetchen.weidenauer.cc (Postfix) with ESMTPSA id AA22C605D5;
	Mon, 14 Jul 2025 21:39:00 +0200 (CEST)
Date: Mon, 14 Jul 2025 21:38:58 +0200
From: Martin Weidenauer <martin@weidenauer.cc>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>
CC: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
References: <20250714153409.46085-1-martin@weidenauer.cc> <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
Message-ID: <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc>
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
X-Rspamd-Queue-Id: AA22C605D5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 8.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,debian.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]

On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy=2Eshevchenko@gmail=2Ec=
om> wrote:
>Guys, please, coordinate and issue only one (or a few) patch(es) per
>an issue=2E No need to send zillions patches for the same problem
>file-by-file=2E
>
>On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin@weidena=
uer=2Ecc> wrote:
>>
>> Fix checkpatch error "ERROR: that open brace { should be on the previou=
s line"
>> in ia_css_dvs=2Ehost=2Ec:277=2E
>
>
>--
>With Best Regards,
>Andy Shevchenko

I deeply apologize, however this was the instruction of our workshop in De=
bConf by Helen Koike <koike@igalia=2Ecom>

Here is the link to the exact workshop:
<https://debconf25=2Edebconf=2Eorg/talks/55-submit-your-first-contribution=
-to-the-linux-kernel/>

In grave apologies,
Martin

