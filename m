Return-Path: <linux-media+bounces-9997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FB8B071E
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B261C218B3
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 10:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92098159564;
	Wed, 24 Apr 2024 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="qw/aJUOt"
X-Original-To: linux-media@vger.kernel.org
Received: from forward502c.mail.yandex.net (forward502c.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3411591F0
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713953951; cv=none; b=G+3CucASIYfCp4ZZ298wJ2TqmhOv1jrHFSAzkuz7hn9xv0KoJX+jwSmnRflyFjDwaaREGGUDvu3RVwr5+ShSHxjVQ9KWMTttnPwgWl00Lly8AMLnbB1h6Snsp5qReoDv/fNIPhVPX49hRmZWHJEw0wzI1N3V0MduDN/RETGhCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713953951; c=relaxed/simple;
	bh=zLFpsCwnZXQSkbUXCqTPTA2rkuxnsQGtlUuFIpIo6PY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=V2YCzcYC39f++Bh3Up1j9C74+8nBk9jAJUD9fKIu8aD5WREBCYopLePlvjme5dhoBEtq6TOsuNjrNPZs4XlkCsNpOE1MXpOgIY1ozioa9z/TYCanIhWZ8VCq6hjaSo0nBPvcFT163VY/NNwtPrAu1egiJcuyks72uQuqFjx1MAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=qw/aJUOt; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1c:2a8f:0:640:9ed8:0])
	by forward502c.mail.yandex.net (Yandex) with ESMTPS id 4B9D6616DA;
	Wed, 24 Apr 2024 13:19:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 2JI0u8XSt0U0-GRyBOpDb;
	Wed, 24 Apr 2024 13:19:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1713953943; bh=zLFpsCwnZXQSkbUXCqTPTA2rkuxnsQGtlUuFIpIo6PY=;
	h=In-Reply-To:Subject:To:From:Cc:Date:References:Message-ID;
	b=qw/aJUOtB/njXotw7x8ACJAe69nby1E/Tq9M/nLlTZh3k8c8gKEEUjGcIzZYfUBS2
	 6wSwQ8T5DF/htDU9zeKT/5xThQ42FvpBKQqt7YweCf+5tFKlmlpqs3tV+xKLElvo/e
	 8oM1Xh6qvSmTwNnb50ljggQGoIPEQfdLXUeiy5XI=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <3a7d0f38-13b9-4e98-a5fa-9a0d775bcf81@yandex.ru>
Date: Wed, 24 Apr 2024 13:19:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lvc-project@linuxtesting.org,
 syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
References: <20240423191310.19437-1-dmantipov@yandex.ru>
 <85b476cd-3afd-4781-9168-ecc88b6cc837@amd.com>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
Autocrypt: addr=dmantipov@yandex.ru; keydata=
 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
 A/UwwXBRuvydGV0=
Subject: Re: [PATCH] [RFC] dma-buf: fix race condition between poll and close
In-Reply-To: <85b476cd-3afd-4781-9168-ecc88b6cc837@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yNC8yNCAxMDowOSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCg0KPiBUbyByZXBl
YXQgd2hhdCBJIGFscmVhZHkgc2FpZCBvbiB0aGUgb3RoZXIgdGhyZWFkOiBDYWxsaW5nIGRt
YV9idWZfcG9sbCgpIHdoaWxlIGZwdXQoKSBpcyBpbiBwcm9ncmVzcyBpcyBpbGxlZ2FsIGlu
IHRoZSBmaXJzdCBwbGFjZS4NCj4gDQo+IFNvIHRoZXJlIGlzIG5vdGhpbmcgdG8gZml4IGlu
IGRtYV9idWZfcG9sbCgpLCBidXQgcmF0aGVyIHRvIGZpZ3VyZSBvdXQgd2hvIGlzIGluY29y
cmVjdGx5IGNhbGxpbmcgZnB1dCgpLg0KDQpIbS4gT1RPSCBpdCdzIGxlZ2FsIGlmIHVzZXJz
cGFjZSBhcHAgY2FsbHMgY2xvc2UoW2ZkXSkgaW4gb25lIHRocmVhZCB3aGVuIGFub3RoZXIN
CnRocmVhZCBzbGVlcHMgaW4gKGUpcG9sbCh7Li4uLCBbZmRdLCAuLi59KSAoSUlVQyB0aGlz
IGlzIGNsb3NlIHRvIHdoYXQgdGhlIHN5emJvdA0KcmVwcm9kdWNlciBhY3R1YWxseSBkb2Vz
KS4gV2hhdCBiZWhhdmlvciBzaG91bGQgYmUgY29uc2lkZXJlZCBhcyB2YWxpZCBpbiB0aGlz
DQooeWVzLCByZWFsbHkgd2VpcmQpIHNjZW5hcmlvPw0KDQpEbWl0cnkNCg0K

