Return-Path: <linux-media+bounces-40822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90CB3292D
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 16:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21C981BA0292
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 14:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FB625BF1C;
	Sat, 23 Aug 2025 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="jL4KLjHk"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326D41448D5;
	Sat, 23 Aug 2025 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755959620; cv=none; b=B8qAnzrsKvcJQ2aj+vhGZxS86yXMTUlZ+oUel9lgTRv27z84oHtht5YCOuJFFzWW6gSls48TBGAXj4A4Pgos3wDh7Sn8QN92irwXP6d0GVYIFFmDC/8JTQAEoUbPfrK6UKHUzwIOeHtL16gHLimEuIaP5yscxLkjJRRpPajzekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755959620; c=relaxed/simple;
	bh=A25igD8CYNOAIY8Fto25Ma8g61zwPgXrBl4KaNHq2Ys=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I/HNN2gnZq5YLfh+0Wy+atiMES/jS1KGUWPjv/kUFvFjcJ+rm1OEYpyr4nMl7ayCEMV25tbm2NODsF9BxVYh0RZqhmFcRfG7LwUapj0RBnUejkeDKexs40BJgTecDhMJ7V+rv5w5/pQlsTV0aLj74lwtDxQggM0baYL169Emxys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=jL4KLjHk; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1755959615; x=1756564415; i=markus.elfring@web.de;
	bh=vfabdPp9PDIk1yDnOaoAJ7IqG9PbPz0zGe/U2C6HK44=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jL4KLjHkPkBmIDFb6zJpGFC9Q4M3iv1NYkhyyAitkFCl2Nxm4El7QrNctr86SAFU
	 +QB1fQMsaLsBJBqcOexRw616ctghMj+j0fj0+c7Lr6uBiCNrOmLAjroUDILP5eiNq
	 O/SCznDkt2yjhKAUglRDLraSkYjJxMwOc2N5+kTvKivIi35281GnUcDn6hvHJLEcG
	 dsm2t8SHf1mRTUWjUQKwG87ii3agPg23L7CpTQzthOrh2BiThvbyhrCGi7hQEK1Oy
	 zSM7TfejZ6SVED4a2oxrPy4cnIfDKim+vp9RACBj68jKqjjN3yTe9HBhFb4khELKd
	 FMCVJ/Yteli+7mJF/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.194]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N3ouw-1uPG072IqG-00zGgh; Sat, 23
 Aug 2025 16:33:35 +0200
Message-ID: <45dfc1f3-7fe9-42b8-ad51-95cb5feaac87@web.de>
Date: Sat, 23 Aug 2025 16:33:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jeongjun Park <aha310510@gmail.com>, linux-media@vger.kernel.org,
 syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250823115659.1176464-1-aha310510@gmail.com>
Subject: Re: [PATCH v2] media: vidtv: initialize local pointers upon transfer
 of memory ownership
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250823115659.1176464-1-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZYdvZ19BnYUGNHGznSQ0y0Rk/F8wZpUh7GBEwDX80TdZU9IYnD4
 LBnXYx/n6Hgf3F4g17qccezjzR14piSZKCIAYEYkZ0tLKa8IchYAVOZnqjldf6W3qnEngoY
 +7tOoxAxiJ3SGiE4uA8MFopfNzipZ+8lNOl7oBMnplpU140OJ8WanozGIRw5citGYFzlcbA
 2W9TbspjVCga/bh7iOW6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j5rnIQufyR4=;9HvA11klspoiqG2uFHV2NGBERUE
 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

=E2=80=A6
> Therefore, to prevent use-after-free and double-free vuln, local pointer=
s
> must be initialized to NULL when transferring memory ownership.

          reset?

Regards,
Markus

