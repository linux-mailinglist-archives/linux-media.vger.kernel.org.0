Return-Path: <linux-media+bounces-55286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ml/HfbQsGmLnQIAu9opvQ
	(envelope-from <linux-media+bounces-55286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 03:18:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7725ADBA
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 03:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 240073023DB9
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 02:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55542D73B9;
	Wed, 11 Mar 2026 02:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvSKyg0D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62781275B18
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773195498; cv=none; b=By1YwG9UJeALkrXO/EhFyR7ZNh8DMfVdA0fkSuL9uCqIa1vygWiGxflFvfsXOqleKIHdAEhpKxTTS5KDyj+Ql/jYIbDE1GRBQf3MgQvPl2fmjBgG8LzJYUZHppcwSLI94nr3BeqNqyDs3ndHNt0crEV4X0CSAE6RAiCeHYKDPKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773195498; c=relaxed/simple;
	bh=+/dHpzDdvnXv9XvCFyqZfCQUq6sgyPwg/78YsLVfcJ8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZwZO2d8HNvqidcQ7y/JC6aI28/kUwMy0kdksi7Kto4Bt09afgm9yaZllRxo50yK3IphrmIkUhBwEgIXSZoKDy1Lv+a39dMn+R361Y6zXELei22Nnlo7q/bePtSUgdu+aCruHw6z9GG6YDwLRUQsPayScawFB8M6dpjR96KoYNH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvSKyg0D; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso59392465ad.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773195497; x=1773800297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=fvSKyg0D0WfL/vzr9Cx5vJtutHyS2zyBDrgY+VRcTqz1DcJwn3lM2Y8uF8N8UAqBK2
         bdETDCx+d2sNjHBfAebcNpBL6hJJn8e60zBt8yIUzmQ+26hJT7kQ8hlERQDXCsi1hH9/
         kzzikvy3SQ+VayGNhQqv5kCVuwATD6j3rBkca+qYvqazKuYg6466as/ASq2rfdi04rmo
         kQ6AChj+ypwTBF3lpFirsL2emJtQF9olWt9gLcHB9bqFfkF/Nbua5FQ9vsA6Hfo0vh8t
         PnsuNnFBT0OYeAU47bdPH7dWapocF/3WdLPxpl7rHMOHJMpexIzRW+OQnKOe7EktAZqu
         t9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195497; x=1773800297;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=ejLsv/TMFXZqiZjChhR7piaR6jiX44j5K+tleJBDj0Adao94IX22euvO+HSX2SoOtI
         q5tKfd5bTecKAOsAWBbAhYiqP5j+U/ArZfllobokNqBZIPLYDiYvkXjJZ0F8rB7S4Lvz
         gdnQQyuRFfPCAlJY9xAUj9fvSKVAkPZxhGABXSma1vBf7MQwqtbpoTAZlv94ENEKReYl
         Q3lYjFOinpv6JPdd51uT/WZjAtXZKyfyPzvvhvCe3d2+BlaCoZmxkJnxVCUGkRNe5vL/
         CGgi697mZml2RX8CZd3Ltc5gYZ6CauXbYEhAwcZs8PwNwUKUN8KTVI4fMNoSiLmLHxx0
         6sjA==
X-Forwarded-Encrypted: i=1; AJvYcCWwT1zP5dx1g4GGRxNcjCzS/uisNBRVr1WvIDqjHHffuKSiRZ55O2BuBJZVfnVwFW04Ef6nYSTp0TYXpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8u/ictgSMQXYQrxaUose6fxeDJAF3mcJhZEiGmgk//CeW1qOx
	fOAjQjt1InPtF8nludPBJmQvOKzb7kpZ1RTVpcmScOF864+PtWT/jlRX
X-Gm-Gg: ATEYQzwtFJtR/QbiGAV0z5Ba2Ne4yi96Js5nVeHhDD6le8joartaS/RKJgOraR4cPm2
	ySjdao0yHuOX0lpoh/G7agh9A6jsqJK9G1gAUcCVolCb0ZN2H94nPa41V69qcVYAYAl0+Cu3xhd
	UCvx1Zjl7pj3CSlyGFpGQCDuzQ5DRZaBI9GlZ+R99Or/J2htj/FSwm/QaHlA3f22uKHPeT3krBK
	kThOKs9Wc/OgeT0r8PriaXmQ9d+EmBi5qt01OfLSJp+gFOyFWuzeu2XyW7k/q7S3qU8TnPA7rDF
	Pya4exKon0d/EBA5FMXKPMvI7rtuuZGRf3WO/cosUOeed0Uze8Iyp9Cflsf6D2ZahK8T7wqKO0j
	gBT6nRk4xqglLCH/6ibdxqAT44xHQcDcg1Pq2AplxriXDae9rvZ4edGwtc1690kSne1It4ACDPF
	qtfqoql3GJjBr3cZ05nNKxJGyPIufXhT9v/Fc=
X-Received: by 2002:a17:903:1666:b0:2a9:47ff:101c with SMTP id d9443c01a7336-2aeae8eb7dcmr9366255ad.46.1773195496591;
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:aab1:729a::4bc6:faff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e009sm5679355ad.46.2026.03.10.19.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:27:18 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
CC: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org,
 nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com,
 maudspierings@gocontroll.com, hverkuil+cisco@kernel.org,
 ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org,
 lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
User-Agent: Thunderbird for Android
In-Reply-To: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com> <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Message-ID: <7F16ED38-6BC1-4D31-B5B6-6C1E45D24C25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C1D7725ADBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55286-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.841];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 11 March 2026 3:22:28=E2=80=AFam IST, David Lechner <dlechner@baylibre=
=2Ecom> wrote:
>On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>=20
>> Hi all,
>>=20
>> This patch series replaces manual cleanup and explicit kfree() calls wi=
th
>> the __free attribute from <linux/cleanup=2Eh>=2E This modernizes the me=
mory
>> management style and simplifies common error paths without altering any
>> functional behavior=2E
>>=20
>> The __free attribute provides automatic scope-based cleanup, making
>> resource management clearer and reducing the chances of missing cleanup
>> on early returns=2E
>>=20
>> No functional changes are intended in this series=2E
>>=20
>> Testing:
>>   - Compiled with W=3D1
>>   - Build-tested on i86_64
>>=20
>> Based on:
>>   <linux-v7=2E0-rc2>
>>=20
>> Feel free to share your valuable input in context of the cleanup API=2E
>>=20
>> Thanks,
>> Sanjay Chitroda
>>=20
>> Sanjay Chitroda (7):
>>   staging: greybus: simplify cleanup using __free
>>   iio: ssp_sensors: simplify cleanup using __free
>>   iio: st_sensors: simplify cleanup using __free
>>   media: mediatek: vcodec: simplify cleanup using __free
>>   media: chips-media: coda: simplify cleanup using __free
>>   media: allegro: simplify cleanup using __free
>>   staging: rtl8723bs: simplify cleanup using __free
>
>There is no reason to put patches from different subsystems
>in the same series when there is no dependency between them=2E
>It just make for more noise for everyone=2E
>

Thanks for the feedback=2E I will split unrelated patches into
separate series per subsystem or individual in future submissions=2E

