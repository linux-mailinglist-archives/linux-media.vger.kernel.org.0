Return-Path: <linux-media+bounces-38113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893DB0B0BA
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 17:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82567189F7A3
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3BE2882CF;
	Sat, 19 Jul 2025 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="q+/G7Zaf"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E61F8EFF;
	Sat, 19 Jul 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752939806; cv=none; b=HkUVaEjrc9/EqYUkCECY03UVBr0BUENwGJpWJKJW6fsGPU7OyJg8QiN1XUJJEmWjw+LoNgMk21IGhrCS+ahEqMw19Udt126JawKBw0X16wLNeBZTFMDMELCXRSR/wXJ7F3IdzfuO1cCTkBQVVFt9tRqMyH+lP239RoXpYShFa9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752939806; c=relaxed/simple;
	bh=8GHtG+Usdw+YgOluqgNIl2SWreWzFF/k2Zjv75j9ds4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=l0R38CG87uvrkIH4N5omg35GESkd/py0Tn4y8tKA21iK2xG/gSTL54f5TNTp767lEGZ2n6+xCN6BsNlVnT0Gjw414eGZ6NrGKKQ92J44oi9B9s1MmU6ODF4W9SRbj/7jk7IpT7HyGbQ4wKD389cVCvnXP1TRAgd2hBtGq0ZQ9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=q+/G7Zaf; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752939801; x=1753544601; i=markus.elfring@web.de;
	bh=8GHtG+Usdw+YgOluqgNIl2SWreWzFF/k2Zjv75j9ds4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q+/G7ZafbqXOyCAilAT6YM2CsmX68NLGy9Vgf75p8fMn3ZmmpLVWIXI9Cnfzy+5f
	 JHsaY5uHEkLKCP90usnHcDf1g8QKvIAGWRh3o0QrZK7JYf9D4/k9nerA5Imq3O7VV
	 7P5VIUbuALI56UrusfoaW2d57tGHQ/xTQwEuYKXaFGgdMBY6puzXXmR8B/wYT8ZTo
	 W33ebGt9yXycQhoyecCdXVrhCJmrhKUlSiGZMIuePn3OCd/ikrOW8TD7vVETwI5Rr
	 bCSsO7khThu03KhJR2Oj/E2v4FzKHzXM0K6mYaeZIk5dD32S+7nrawrZxtOdsin56
	 TSLnpSi+Wbcbx4gj1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.241]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTfon-1uBP4G0fJl-00OAxF; Sat, 19
 Jul 2025 17:43:21 +0200
Message-ID: <30e1ee72-eaa1-4f0a-b953-ed875074cb7b@web.de>
Date: Sat, 19 Jul 2025 17:43:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Darshan Rathod <darshanrathod475@gmail.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250718130807.87691-1-darshanrathod475@gmail.com>
Subject: Re: [PATCH] media: dvb-core: dvb_ringbuffer: Fix various coding style
 issues
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250718130807.87691-1-darshanrathod475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u4uNVs97pJolT27RS0p7wOjiQxPuDfmhUOmeOZKfsThwl4VeB13
 q8Rs2x4v8NGCOio8J/2KCzhTbrC5SYRUKhXyZt75asihbY0iz9mVL18UN4GCqcyWTZowoZg
 j136OZ+Ba72hN5ve0Vv/fDGmjoSX/uvtKMZfwYdu7ZSBOWIyJwA6iwcGfhuyketGEfAymOx
 Z5X9XaLoAoxZEC59/SK8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XvWIvOcRQbQ=;H/PEUAI5lk2oTvY8/Dlp5FoWBw/
 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

> The file dvb_ringbuffer.c has several minor coding style violations.
> This patch resolves these issues to improve code readability and align
> the code with the Linux kernel coding style.
>=20
> The cleanups include:
=E2=80=A6

Will it be safer to provide desirable adjustments as separate update steps=
?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc6#n81

Regards,
Markus

