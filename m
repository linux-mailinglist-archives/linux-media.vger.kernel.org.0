Return-Path: <linux-media+bounces-38111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F3B0B09D
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 17:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96316AA4B12
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 15:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E302882C2;
	Sat, 19 Jul 2025 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZYYv325+"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B40522D781;
	Sat, 19 Jul 2025 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752938760; cv=none; b=aGpRzcFgRI9pUXL/wOseq+wjXy9CfQ4bfEboyBcvH/bfL7yP7j1a+mYfwFnrEcDVx1gNawe1fzjEOKmp8B3NJ/UX36eqwp1HbYO3MpwyyCwldMY7g9qvsVF0Ir0qlit/8oNv09hKNTcvYu/ri/WfFK0iGJjGqYXjFlLzZt/rqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752938760; c=relaxed/simple;
	bh=g0j/PNgsynBwUdU3W6cJGRb/c6+Y032um+BVvLRBIZU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=uV/Qcy0A1k91tPe0hkBrzqoJOQjYc6U0phCgZo5xtc040GUxuDBysTqYwH1atChq59EUXYJxl3XHIr1ivFDGYWxmSKkwfpYFd/0YUT6QIw9KaZWLpdP76WytwdJSKE4nvfzkAhUwBNWDqXXJibQbVA0IdaMrrlmeeZHW9zxIRq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZYYv325+; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752938739; x=1753543539; i=markus.elfring@web.de;
	bh=g0j/PNgsynBwUdU3W6cJGRb/c6+Y032um+BVvLRBIZU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZYYv325+qLmkrr19YkUGAqHTi2CA7aaa123VNcKqEe1ybR16+gOu4fde0r5h04i5
	 yWajp4BdJgKYYd9apOTFeIBNqdTuzQUEH6/H12Je7Z9rEX/OkhbQIghN/poyTpaSX
	 KZdErHsNp9FfcuO7RgljNBPztU48uJB1qD2hadF0xpxvhdqNbG3WscVGQT7vgNJ+c
	 qU+R5xkgWDIroats12ka8v6itwFN3Fl4FlmRv4TFLt9xE7V3QwXP+QaRDSra0nGQf
	 I/OqLfkWHCRKuU2Y1C+OjnayrA8F5qpZSPhfaKVs/SKsLjGdipCP/fUmhMXplZG3S
	 JUlRLa1zsFcJCoDntQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.241]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjxeO-1v1AWB1QcK-00eBI9; Sat, 19
 Jul 2025 17:25:39 +0200
Message-ID: <9ba92beb-0bb9-45f5-b0b5-8c42ee9808cb@web.de>
Date: Sat, 19 Jul 2025 17:25:38 +0200
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
References: <20250718124018.79205-1-darshanrathod475@gmail.com>
Subject: Re: [PATCH] media: b2c2: flexcop: Fix coding style issues
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250718124018.79205-1-darshanrathod475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xCoBBMM6LU/okJQV6O6IL9cylkqT4Y2RSIVCxWAHKqIFTGt0W35
 +oZ0BRxvgeg8pMbx9z066wWWj7qqvwhbdWCDZfIMsCQajLQyT9e904v0iR9gu8xVkJl05pZ
 IQYwDWEgvPT63kJugIJ84s1F8UWk5RN9Ep7EcT2hH4pamTKV8ykV0pg8Zm7smIkiG4iQTkU
 I33wCQXuDB+vnDVy0b9+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bN/Vvi1hSU0=;+PgUZGAHM+J9XrOkBAkwLb+wjKC
 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

=E2=80=A6
> This patch cleans up these minor style issues by adding the required
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc6#n94

Regards,
Markus

