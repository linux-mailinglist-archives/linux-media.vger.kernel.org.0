Return-Path: <linux-media+bounces-54748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKCkONS0qml9VgEAu9opvQ
	(envelope-from <linux-media+bounces-54748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 12:04:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC7321F6B7
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 12:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF17B3015DB6
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 11:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFF13803CC;
	Fri,  6 Mar 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXEoZihR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF73806A2
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795084; cv=none; b=mtWshI240snFJN5So7oy//U/4Zq9IG1Ce7cfd8spSkwdK6ILufm1KwnJy93SwfZQ8wCQBegdqceQpPODt96QtcTPgynSzBx9U6I9UNgwa0OVaTF9zariJWwYEgUZoEN2RqMTFAJ0JfM9lPis8w9r/6AOaewyk3tgLYjULBkyQeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795084; c=relaxed/simple;
	bh=8XP1eFWvh0Kk8uFTpykxii/ZLhv2yrSr5WeT6zc6P6Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PCDwAg0s/kci5AytnVonR+8im5Yux0hxyoWotWvhyGUtlpIFxy2PeZ83NXWtri61EG1ZHwXLhp1k1d2TIdOQA/cCh+6k/tkCtKaJxiAYfQOozDesAhxQJ0hwO06mNoGCzI9yWwOUldZTOfUSMB0WGOOHTYCvL5JGTdBTEP9Jrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXEoZihR; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-660f1a1e977so3338117a12.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 03:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772795081; x=1773399881; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHrSIGCtwz+QUPj/e0xR8BNm6VPbuN89FwG5ueoHtFk=;
        b=eXEoZihRmmBcQPhz8I5kopCH5IYSgcFXgvpmFQe48nm0l5i7nH/olZ9jV50yuD5MfS
         VpW523f7tvjFi8KYMPHpw51IMssRv+v2KKxZ3uZKuxGhMtJ2Ma3qM4MYyksfYASGp27r
         0w8pAMyDyTX+veaxu8ToqlEsIH1HXzHHk/53JuHfrqhnKaDLDHGmrY2eCIUSXooz8LrC
         uOMZmQAwBEjjLNpO57HOUw6T9HPfbla7tguelkOSuA8StCG4d33lpjEn839/eS3UOaBt
         KvpCi+UvNzNyyjXkxL0QjbAE9JQ6EgcoYLYh/+Ij+Vl2ngOAOuKUILJwEF1dNjqkC+PM
         GN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772795081; x=1773399881;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHrSIGCtwz+QUPj/e0xR8BNm6VPbuN89FwG5ueoHtFk=;
        b=X3v7+jLlW3jEuT74GXDu1rEP9Z0fP1kPy3n4E24+o9pqbFtsBk47fbubAB2CfXm+St
         XRm9Pcr5294kMGUH8YYDca6JqKR6l7SR6QQG9ORzSHXyaXFywwi2c/l42F6EvSH8txR6
         jfw1NDe4kKT7Y0dfzpnySiV0bRTwvKBs4lXRtKQXycWsGGV4Y/iQAJSLz3pxffZ44mXL
         ZrV5qwipq8TWpeCBFT2PgI7Zhnq87IUoCZmp/sJKYnhw07Hx95QSuvix8+JhhkWVAKL9
         RoBM+gjrx2WAd9bGzfUT5V25fAHp1IokMicPASCbx5d4FSf/66l0+FIvKyw5SlgrEc2e
         +Chw==
X-Forwarded-Encrypted: i=1; AJvYcCUcOXgl/tVIOJNPaIPhDbYjWKdFHcbEGxT3kCLfMXaXZlHQQedvD6FGWk/GDa1EfT47ZvZGpfznDAymAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziyNwo056h/FLHxdIC3dlbtseI4NSzBifyXqdKqDc0llmrKfmW
	lWNi0VzySgOqO45OisPnDdtShX9rYr1FvFjMem6vfRzQlc9eTwAdbJqJ
X-Gm-Gg: ATEYQzyFL6E3PHtQmepMTkpvAG4DXJAqLr3DiOEX1g3z0/bTVeHSmcWDiF7WeKDC+zS
	+KuM1txJLduvxRpXbIuDPqKBN5tHCRP35RSUVAij9IlRw/UCZwAtgSwLDkMN0LTYMmLgLpgiQ2G
	zIZTX4phfAu7aFnf5NJhIiiXivPbP0cNkrSnjPhNCWiWXm+CqZOf+e7kPdGVK3S9Qlf+ON6hY/u
	RinSm3UTg4yb9T/JW3MCsWiBHmtc1tTMfWgYcFI95F08hKxjWmG0TNbR/nEjyZ3exvI6lUQNdYC
	MXw9KMu7OhvupfbRegbsM+ZlWPeNdzPRljau7YnGEdzP2SLty+HogVtUVD+twZHfrgqWSM82xr7
	noGBCDh366JIZSEDW7dUFkeWoDbr4/SPgitxZZasymfLW75aZRQ3p2s1ERlO19w8oqzL4xiZnPH
	Cfl54eXxFiu8AXMg2jjvfH0fsPs7u6EH0m6QkpVvaIVeSgKjBqz8cs9QVSRudqF0E8ACirdmEqA
	7RF4QADn9NrgGG7j8lO60MFmcZLV7qWn91gHJp3367O/A8Ezj/xxQaLUD/Qsf4VGw==
X-Received: by 2002:a05:6402:358a:b0:65f:aecc:4f1d with SMTP id 4fb4d7f45d1cf-6619d54491bmr704724a12.24.1772795081346;
        Fri, 06 Mar 2026 03:04:41 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66f0asm374769a12.1.2026.03.06.03.04.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2026 03:04:40 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] media: venus: allow interlaced video streams
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <d3310437-2776-4c7f-a844-8dc5de0f6359@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 12:04:28 +0100
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D3656655-844F-4369-97FF-0A57D023E988@gmail.com>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
 <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
 <uis6txrcj2thbtkrk2u3w23orzzjkluuzynqcijpcix7zlsvz5@kyrmka6zwtyx>
 <d3310437-2776-4c7f-a844-8dc5de0f6359@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Queue-Id: CDC7321F6B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-54748-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action



> Wiadomo=C5=9B=C4=87 napisana przez Vikash Garodia =
<vikash.garodia@oss.qualcomm.com> w dniu 4 mar 2026, o godz. 14:28:
>=20
>=20
>>>>=20
>>>> have any other ideas.
>>>>=20
>>>=20
>>> Venus should already support h264 interlace.
>> I guess, the question is: do we support interlaced H.264 streams?
>=20
> Yes, we do support interlace.
>=20

Hmm - i'm curious: when you are saying "we do support " - it this mean:
1. just support or,
2. suport for demonstrating working state or,
3. support for useful usage (i mean useful in user space like e.g media =
players)

Isn't target to have option3?

I have qcs6490 and decoder fails on:
-kodi
-mythtv
-mpv

Tested only on  3 major players as i'm afraid other exotic userspace is =
rather niche for users...

And believe me - repaying to mine users: "hey - my distro supports video =
decoder on qcs6490 as i can prove it by showing you working test tools =
on it" is not what they want to see.=20

=20=

