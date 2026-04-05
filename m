Return-Path: <linux-media+bounces-58062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9/waE5k20mkTUQcAu9opvQ
	(envelope-from <linux-media+bounces-58062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 12:16:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB9439E058
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 12:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16A303003800
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 10:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B5E33D6FC;
	Sun,  5 Apr 2026 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7WxuXvK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878734C6C
	for <linux-media@vger.kernel.org>; Sun,  5 Apr 2026 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384207; cv=none; b=LOZdNzjmfgKRRTgVCRRR8qbPoGBB1W1KUazENF5MynqAbg/9J8OkRPFo/JzwIFwkCPkVX8zH/kYzKrieygxHWd8BKViV+VqMVBOHNFoE/SsMx9GSNG/3uFfAgWTF9dZUIiMP4dN5/7IdsmsoffNtPbUhom/vYgeY8GTLaxbrJg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384207; c=relaxed/simple;
	bh=mCnHLWneSs2Y/R6Z9WTw3gnhijcrCO3nFRbsCWDS/BA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=eIHY/uo6BwVfRAkpj+NZRvvaryTY4wI2rT5AJJu0PJxHM+uIR+GF8Lg4On3KrdHeMv9nqg22qgNxT54ZEGSz8THn9wCobDqVUXPC4mcH5EzBfHTlNILWlyFzFczxaZnpbbqCtWBQVPKhiEV3QGLSn0fkDwZbUutRJkdNnrbuq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7WxuXvK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b0afa0210bso14942165ad.2
        for <linux-media@vger.kernel.org>; Sun, 05 Apr 2026 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775384206; x=1775989006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mCnHLWneSs2Y/R6Z9WTw3gnhijcrCO3nFRbsCWDS/BA=;
        b=e7WxuXvK/Oyqp9uBQkMEUuOL/OVWZ8Fk5BaWbCqLlYI7J9LQx6uB3ELJFSSRUajNrE
         DbJB42sGrtSiQjucp42odvuq0NhmrJUxrH8PRQaifCYP6kM3TIScHPKRx5OVYe1QEBxK
         jx652s/gyywCpFsmt1wJrfccFUogM07lzl572w/oDmKFACGmvv0JPta2C/Bz5toz2WIY
         kHqnxAteFIACoESixbJPb6n5mQz0SFc3sXFPZmgNZO2Mpw2Zxe80o+yVzCU8GFfn6pEd
         69SEdOIQH/DUnyZeGAQclBbmv27pnRjUiRHwQpKYved08Ct8D2OISbZO4v105gYx9K+w
         Iu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384206; x=1775989006;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCnHLWneSs2Y/R6Z9WTw3gnhijcrCO3nFRbsCWDS/BA=;
        b=Ya+ZBKbqqRYjIfeYWCVHsd7qoK2XCl7OxEJFkRaUl7LR/t2iupxevL91W7YWY49Jn7
         vQeqKfASbBHy7onMVOra2D+eEnySCsQ/fv8R7Hz//cm3LhVBrUV6xJWpv+Gaim7lekiW
         sNA+/3IMdxsuhlJfN/BLk9dGc5od93QBFtjqhcHY7d/XlWHgWtxPyx6V24iwX11X9xn/
         FLT3FNJTijtwxt/DBW2tnx5pixpl8vB6tWBKK/wech/mJ6SQIR4T91u8yG0kQovNJCmI
         N+C4gomhlEZiPClHhb5aQoBBuVjRN8vH9Caqr37h10zLxO7ud3wdcD3vMG/YmJ+wvkJm
         nCIg==
X-Forwarded-Encrypted: i=1; AJvYcCWhHdyZ8g0rJEfBHF864u6SY8A8lj55dOWLYnwkhzq64IYYxu/GGf6hLwTxzCVlw7Z78pOuveAIefndwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpxecruhA8lcjs1wqIU5m6xnAHBTxQlCYhnBeuLfYj9NFJkv3b
	NNH9H9B7gvHMQ2ju4T/apcXba2t9pDUZQn2WU7tiYiES79Ep4uEoguXiIl2Dzw==
X-Gm-Gg: AeBDietzPAv2YIWRxRPgf5FAavoM4kxIsweWaCzLYUMvU71ODuAaC17Mkuq+TtbldaC
	+XC3heT36AR5qwZI3hrz2OYbzf/fVVKu9QKehcp9dLq6crx3tt3+E6DtYq1KQhFfrB04I/m1gLU
	yK+mXOoRytYcyTaKA6TYrtYwwN5iJ78pOlhlYaP+uDHaNo2Ix3fNji0HbOE0/GzLftCi898rKCN
	d0L+IuWNnS2fm0G85rRxrSfORzYpICOWcGJqUVYyMTwTMWpi7tMa1lr39stv2p0vNEupBxcYu4u
	+76n1nAy2tEncuRZLdmuSsHtHY0WJCbY16b4BoksYYdw9s4CmwL5/HTRkJn0lJiNFq0fv+KNMwq
	eBSlcPv5k1vw4Dipt2C7pI5Ne+DKBiPcTm8ciz12mF+fTWMDHaaUuaNgJf9M4drLD1e2KPNsJc4
	fnnZrwdhDCuLJGEUop37Zst8b0MgGy+JGGaJCaeZcO7yV7g0zhg+T222E3
X-Received: by 2002:a17:902:f747:b0:2b2:4e70:631c with SMTP id d9443c01a7336-2b2818b40admr52203755ad.28.1775384205809;
        Sun, 05 Apr 2026 03:16:45 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:7915:e198:7f98:a783:bdbd:79e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af19sm103826785ad.50.2026.04.05.03.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 03:16:45 -0700 (PDT)
Date: Sun, 05 Apr 2026 15:46:39 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Hans de Goede <hansg@kernel.org>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org
CC: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/3=5D_media=3A_i2c=3A_gc0310=3A_fix_probe?=
 =?US-ASCII?Q?_error_handling_and_unwind_resources_properly?=
User-Agent: Thunderbird for Android
In-Reply-To: <38dc77ed-2427-44df-847d-4d41183e0df2@kernel.org>
References: <20260401181657.654055-1-sanjayembedded@gmail.com> <20260401181657.654055-2-sanjayembedded@gmail.com> <38dc77ed-2427-44df-847d-4d41183e0df2@kernel.org>
Message-ID: <DB5F4EC4-0754-483E-B59A-595A565E628A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.95 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-58062-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DB9439E058
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2 April 2026 12:36:33=E2=80=AFam IST, Hans de Goede <hansg@kernel=2Eorg=
> wrote:
>Hi,
>
>On 1-Apr-26 20:16, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>=20
>> The GC0310 probe path currently performs error cleanup by jumping to a
>> common label that mirrors the driver's remove() callback=2E This is uns=
afe,
>> as remove() assumes that the subdevice has been fully registered with
>> the V4L2 framework, media and control resources have been initialized=
=2E
>
>That is simply not true, all functions called in remove() internally
>check if their init counter-part has succeeded and if not are a no-op=2E
>
>If you're aware of any specific calls in remove() where this is not
>the case, please explicitly describe these cases and describe an
>example exit-error path from probe() where things actually go wrong=2E
>

Hi Hans,

Thanks for the clarification - agreed, the remove helpers are defensively =
implemented and the existing code is not incorrect for a functional point=
=2E I should not have stated gc0310_remov() from a probe failure is unsafe=
=2E

>> Calling remove() from probe can result in unregistering or cleaning up
>> subdevice, leading to resource leaks and subtle lifecycle bugs=2E
>>=20
>> Rewrite the probe() error handling to unwind resources explicitly, usin=
g
>> fine=E2=80=91grained goto labels along with appropriate error logs=2E E=
ach failure
>> path now frees only successfully acquired resource, without remove()=2E
>>=20
>> This aligns the driver with standard V4L2 sensor lifecycle expectations
>> and avoids incorrect teardown during probe failures=2E
>
>The rest of this reads very much like this was AI generated=2E
>
>Did you use AI to generate these patches ? If so please:
>
>Make sure you actually understand what the patch is doing and
>very yourself that it actually is correct, which in this case
>I believe it is not=2E
>
>Regards,
>
>Hans
>

Yes, I did use AI assistance to help draft the commit message, but the pat=
ch logic itself was written and reviewed by me=2E However, your feedback ma=
kes it clear that i did not sufficiently validate internals of existing rem=
ove() based cleanup=2E


I would like to propose commit message that align with change and existing=
 kernel internals:

-------
media: i2c: gc0310: make probe error unwinding explicit

The gc0310 probe path unwinds failures by jumping to a single label remove=
-style cleanup=2E

Refactor the probe error handling so that resources are unwound explicitly=
 and in reverse order of initialization using fine-grained goto labels=2E

This improves clarity and maintains symmetry with the probe initialization=
 path=2E

No functional change intended=2E
-------

Kindly share your input on the same, according I will plan to resend v2 wi=
th an updated commit message as above=2E

>

