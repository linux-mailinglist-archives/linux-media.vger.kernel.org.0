Return-Path: <linux-media+bounces-58144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xyaaABSJ1GnmuwcAu9opvQ
	(envelope-from <linux-media+bounces-58144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 06:33:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BD83A9B3E
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 06:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3BF03022947
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 04:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BBE2DF717;
	Tue,  7 Apr 2026 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9vWcEJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17429CE1
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 04:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775536394; cv=none; b=e2YjRu6SYNs+2ZXlz4RYoYzFVprLrUSx8uhOTbUn09ucQHaw8YnxViwwJUgwjFdNcoKKQ02BEnoR7BYoKc+kd8jkJqBhvzJ7VB1ibTGp4AVbC0Jojk2rAOml3vZTZtXBNMSpNwAKj4/RlnrKMkn0ExELJdpva8EnA5jaJIUFtww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775536394; c=relaxed/simple;
	bh=aY5lw23glW/CLD6ikEr6oG60Cdo0MGUqRFXqurgvFjI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BmViOZgAHoi9G+kP4JuRRomhwCfdtlKxOOf50q5KIasp4AutsQQXzxAv78QTW8ZNDW8Hdw9YYnc5c334eTEm8BwWAlRG8KnNeOTDTPhjcLsqcqt+GRThF8XSvsBR48MSQLjdP/B/gAsYDSoPZXdzDydn1ECGyx4eQ++ho3icK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9vWcEJ/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b23fcf90b2so45010655ad.3
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 21:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775536392; x=1776141192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aY5lw23glW/CLD6ikEr6oG60Cdo0MGUqRFXqurgvFjI=;
        b=C9vWcEJ/MNOC0pIXarNXEfzjM9dxonGt6Pb/lEjXazvvvRiDUTOd2cDRKwd5rq2W7t
         4BcOSBmwMwVzszBQZiDfMVwQ/FOJXDiReGyxYDUoH4dkErjmuHnDMqSxOLka3NJIAmrD
         tZywA+VB4pHA4TXq5PzsSGHxREeG2Fypjy877837+WFFaBNNr14bOo3AFWfH0An9AcJn
         FXl6RShkPIw6O3EEVHLlyEC2Pi1M7aOhSel0WJbXH5dV0OeOFUk6pN84+Mqkml/Vig7S
         3zwtY4uLgHMubBMSC19voOlT4+HvX9lbvzmAhPflM0qcKCIV3cir7Ah0lGMf3OqxxjWU
         7hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775536392; x=1776141192;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aY5lw23glW/CLD6ikEr6oG60Cdo0MGUqRFXqurgvFjI=;
        b=dO0sNeF8ALgeK/aad+mKQj4C9M5tZSoCfF50iHMYMuKAbY3rfv4bN5dQj87nSbAF8B
         g9KA3gXL/W2YpFjZne3KCq29qWT8P1iA+JeXgp5SXPcpVLRACp1IuKOLn47RWarwFG1N
         6zoCbV9NU1joYsI+mFBHYETtejueY8RTI6WfNau5QNNDDpE5ayIaFts8QSG1WH5vn4Qt
         54zAbqLT2GNM55Yf4a3yz7QkSr7y4roAFoLyDz68i0Mru5Yda/gdl+HhMxEblC3gW+iB
         cG+O5RzvEi8rakQwZ9tiMqVm++lwp1BLb3D9wsRzmBSpOC080zY4Znh0/IW4uBYQOlfG
         B70g==
X-Forwarded-Encrypted: i=1; AJvYcCWVCeLrkTDxarC4oU1COlpnhQVi8EG6p/juJ0mKGyJJI9eFj/LfIeHDPAGEXfwKqTEIzWHrAOK4Z5jTjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+jJahtaPoaMygmTWBMHr/5AP2Pdd96JSFbCM/0mxbEcvvVYJx
	J3sEnozVa0F9u+x3sG/SI2LgMPFOQ2D5TNtLp1+khLK+ZO4c3/rGQUQ8
X-Gm-Gg: AeBDiet0fmHJMdRtRtqo4eayNanjhAFMWz0IPi0aj3Ir2Z1tFdQ4doC5R7qVuF659BE
	BPtSw6jVw4LxzFuPLDzu+TmyztPIxqWw9PArzuCvYR6GxSL7sK4kzgwZkE4GbjNUWWo8LHdQ2pd
	W0Bv3mSlJBhyHjxAn2CeiV7Pzo+s8LFvD0I9b0WQk1zG9zy1huiZDCxnxbVN467OVWt/14AyFL4
	eup+subEd2wXsAhYp8Y7HAH9cmzgEo1YcLglwT1IfCsz0IAf+n4xrwqa+MYtXqEyK+/vhw4k14z
	PjHR2kDsoW+H85HS1nuu3pJONALCZkk7Pe6K+4S37zsFnTh4Bb7OBMZQ/MRnhtsIE22fCcrp6Qv
	hg4ocdxKMFru6ZI+WTU6MLcSEsR6mllr5R9QwSRdS/xSpO3ctF+UfOPysHlRAhmGup3XFo/X10W
	LNWRqryCyF5YnWf/drw7XHXTVQykY39PpQi4ME/BKZT0hjngc=
X-Received: by 2002:a17:903:17cb:b0:2b2:4029:d781 with SMTP id d9443c01a7336-2b28175e05amr169006415ad.20.1775536392335;
        Mon, 06 Apr 2026 21:33:12 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:ac05:d63f:2fee:6ca6:948a:5a97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497c0f3sm162401745ad.41.2026.04.06.21.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:33:11 -0700 (PDT)
Date: Tue, 07 Apr 2026 10:02:59 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Hans de Goede <hansg@kernel.org>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org
CC: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/3=5D_media=3A_i2c=3A_gc0310=3A_fix_probe?=
 =?US-ASCII?Q?_error_handling_and_unwind_resources_properly?=
User-Agent: Thunderbird for Android
In-Reply-To: <8bd6abed-a317-416f-9301-f218ea766b1d@kernel.org>
References: <20260401181657.654055-1-sanjayembedded@gmail.com> <20260401181657.654055-2-sanjayembedded@gmail.com> <38dc77ed-2427-44df-847d-4d41183e0df2@kernel.org> <DB5F4EC4-0754-483E-B59A-595A565E628A@gmail.com> <8bd6abed-a317-416f-9301-f218ea766b1d@kernel.org>
Message-ID: <28CE2DB3-C445-48A4-B78D-BB6C1920F698@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-58144-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 48BD83A9B3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6 April 2026 9:39:08=E2=80=AFpm IST, Hans de Goede <hansg@kernel=2Eorg>=
 wrote:
>Hi Sanjay,
>
>On 5-Apr-26 12:16, Sanjay Chitroda wrote:
>>=20
>>=20
>> On 2 April 2026 12:36:33=E2=80=AFam IST, Hans de Goede <hansg@kernel=2E=
org> wrote:
>>> Hi,
>>>
>>> On 1-Apr-26 20:16, Sanjay Chitroda wrote:
>>>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>>>
>>>> The GC0310 probe path currently performs error cleanup by jumping to =
a
>>>> common label that mirrors the driver's remove() callback=2E This is u=
nsafe,
>>>> as remove() assumes that the subdevice has been fully registered with
>>>> the V4L2 framework, media and control resources have been initialized=
=2E
>>>
>>> That is simply not true, all functions called in remove() internally
>>> check if their init counter-part has succeeded and if not are a no-op=
=2E
>>>
>>> If you're aware of any specific calls in remove() where this is not
>>> the case, please explicitly describe these cases and describe an
>>> example exit-error path from probe() where things actually go wrong=2E
>>>
>>=20
>> Hi Hans,
>>=20
>> Thanks for the clarification - agreed, the remove helpers are defensive=
ly implemented and the existing code is not incorrect for a functional poin=
t=2E I should not have stated gc0310_remov() from a probe failure is unsafe=
=2E
>>=20
>>>> Calling remove() from probe can result in unregistering or cleaning u=
p
>>>> subdevice, leading to resource leaks and subtle lifecycle bugs=2E
>>>>
>>>> Rewrite the probe() error handling to unwind resources explicitly, us=
ing
>>>> fine=E2=80=91grained goto labels along with appropriate error logs=2E=
 Each failure
>>>> path now frees only successfully acquired resource, without remove()=
=2E
>>>>
>>>> This aligns the driver with standard V4L2 sensor lifecycle expectatio=
ns
>>>> and avoids incorrect teardown during probe failures=2E
>>>
>>> The rest of this reads very much like this was AI generated=2E
>>>
>>> Did you use AI to generate these patches ? If so please:
>>>
>>> Make sure you actually understand what the patch is doing and
>>> very yourself that it actually is correct, which in this case
>>> I believe it is not=2E
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>=20
>> Yes, I did use AI assistance to help draft the commit message, but the =
patch logic itself was written and reviewed by me=2E However, your feedback=
 makes it clear that i did not sufficiently validate internals of existing =
remove() based cleanup=2E
>>=20
>>=20
>> I would like to propose commit message that align with change and exist=
ing kernel internals:
>>=20
>> -------
>> media: i2c: gc0310: make probe error unwinding explicit
>>=20
>> The gc0310 probe path unwinds failures by jumping to a single label rem=
ove-style cleanup=2E
>>=20
>> Refactor the probe error handling so that resources are unwound explici=
tly and in reverse order of initialization using fine-grained goto labels=
=2E
>>=20
>> This improves clarity and maintains symmetry with the probe initializat=
ion path=2E
>>=20
>> No functional change intended=2E
>> -------
>>=20
>> Kindly share your input on the same, according I will plan to resend v2=
 with an updated commit message as above=2E
>
>The problem is that your patch makes the code more complicated=2E
>
>Since we know that gc0310_remove() is always safe to call
>the simplest and cleanest code is to simply keep calling
>gc0310_remove()=2E
>
>If you plan to do a v2 of this series please drop this patch=2E
>
>Note I see no need for a v2=2E Patch 3/3 is good to have and
>v1 of that can be merged=2E The other 2 patches should be dropped=2E
>
>Regards,
>
>Hans
>

Hi Hans,

Thanks for the input and clarification l=2E

Understood=2E Since "gc0310_remove()" is always safe and simple to call wi=
ll keep it=2E

As suggested, patch 3/3 is already in good shape, so I won't send a v2 ser=
ies=2E
Please consider v1 of patch 3/3 for merging=2E

Regards,
Sanjay Chitroda

>
>
>
>>=20
>>>
>

