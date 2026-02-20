Return-Path: <linux-media+bounces-53130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3bVrCZN2mGlkJAMAu9opvQ
	(envelope-from <linux-media+bounces-53130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 15:58:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BB168913
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 15:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAD433061AE9
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 14:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8619F34D922;
	Fri, 20 Feb 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0vC3RKs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5412C15B5
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599498; cv=none; b=QLkVfENRGBUNHQTfuzlYZ8ddZiH1cqqtVk+V2HXkmV5oqi36XtA6HatnVQ27wBRv8QbM4zj7pkmMEGw2aB2Oddqo//6U582d/9qcTNwa2y4KdDCN1lCduVYGBXeJeSRYFqKm6dZpxQw5fNAbqoaVlnPVIKYGm0YuRswmnN3yF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599498; c=relaxed/simple;
	bh=LHawgZ3VnSJrfXz5kNQuAxd4XsIY8ltpzYeG+QrhQek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E0dORqs5m58/7202awblDuvYzlf3LdG3nFb+KH2u5NNJ1zEFkZBkkZeTM4YOuoOUZnqde3DsgI2iHF414az/nXMvGcsEyIO2NEij+G8xTv2oY9fSyDiNZDfXm8+HX4oCTh3vkXB8RB2gLE9HxeVQbMxAWxkfPbbKy0coxaXtw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0vC3RKs; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso18721915e9.2
        for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 06:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771599495; x=1772204295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYIqBbrp3teONjG+fZ2iOJuN6GhpEJNyNTg1t/awccM=;
        b=I0vC3RKs5WV8xPq/Nk0KnwxwV8Ww5p1MiRvkesyup2TtQcm6L4yV7PX2omxUzw1bCz
         1Lqz7es+hOWurIMBiPBNqKev3EtTN8SEEeqK8Req9+MeMDaKbzknLGR86nFQpWUIrCX3
         ljGQFTK7P1eXFYBDm64QkwT+JVfitzoag1KyZiWk7LssOu0TKPTm/epT94wPccVX0qbv
         BKyCK04uGi8w19bWVmqlr4pLLdU9W+WfzZrjb2yv4kA1hwHdz+aZebZB+HI4YCH2bQ5a
         JHRyR/gkltFpU8yKAn71GvjqYfgsf1hEZpQvl+NoybBioralA3hbb1kh1Hnkoq1wEj45
         T9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599495; x=1772204295;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TYIqBbrp3teONjG+fZ2iOJuN6GhpEJNyNTg1t/awccM=;
        b=tRxYWvT5BnCy4WGjrnYVP4aT5+p2hXOf5SglTKmnonQotaQ0VWju1hEG2b/s8BjRBW
         OChmmZfU+xnntDw1fR5p56HnQ6w+yXgQBLGCHJ7B/0V/GfvipdncUcUEJvGGm5z2kRqR
         q18FUVyiWLRpylpEC/72Diuu10gVQSIj23Uf1w4DCQ/B0qJqbmhOtH8W5A674GkXsI6C
         QqQPrGxo0jgfFj/LG/39YKgCVA8YGTSJW403sQcbhuZ0tH8aRNkCIW/eYDfytDQLsEop
         kXoGX/K17pFXv/BxNo5ozIIy4eWsECLH7Qy8m63YCtMEMRWWXy1xMF15+3PVC+csaJdX
         Bc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjaKSqOqZjOSSAv4t9u522kj27ggrbGhs95+2m3Z371t8n25hTUfbFRZu6QEy9LZa+n5yCHP2W2WrKYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeCH8OKOv3XmoWpMIku3Jb8alpUTu872ZX4Mlu8NPWKRTktCLw
	CYcM6Jq6pUij8KwnY6TnBfk77ba6MtVeGHU4IkpYvhLJ3fjwFbTR/j8B
X-Gm-Gg: AZuq6aJK5BopqvlYW7+RdKgWPgGQAOtk4QJD5dEgOdzyVrj6o8+OW09GE5/q3OHq9bq
	EC9vHyT+u4Z9ykZN2niXe6QnHM4sptKxeh3zkY2QxnFXcp6vHOIw5EcDO+ttx68/1r7lRXCygbf
	OPNN71c+y1Pvj//+RIfsZg4ow6jFxgDeaOwjgf4sHG7zQvGPS7Vse3NrghiwKsYVq+uL/+UkKDZ
	TvzKTe8F7+AKOvFnKspxa7humAuWn41vb3zkdTdvZE7TwtzQoigfyQ3sMC+J0cplZn59kX+gSCy
	6NUuK7DrNIfn6xIiOX1kEuaU9xfjzg9OWDPnp9Q0qFyEE1NlSB87CqFr7oxU5twJy6nP9qwhte2
	62l4kHrkbjLwgjLX4WwacIuRnp1PssS8HdJujcOqa3fYSP4r4S9rkw9EyKg6QrTIMkpx/GG4B4w
	lBPbCs/ENXpI2eIa5UPPMjA5lcH3ZbGd9yWHyZzQa8L4bt/oVg1ecB7DFevgeVv9X7Ag==
X-Received: by 2002:a05:600c:1f90:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-483a5311c82mr34538845e9.2.1771599494937;
        Fri, 20 Feb 2026 06:58:14 -0800 (PST)
Received: from Abds-MacBook-Air.local ([2a02:3037:218:21ee:2dc4:34f0:2c53:7809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a8df83bcsm7368285e9.13.2026.02.20.06.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 06:58:14 -0800 (PST)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Ding Yihan
 <dingyihan@uniontech.com>
Cc: dwlsalmeida@gmail.com, mchehab@kernel.org, linmag7@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by
 value
In-Reply-To: <20260220145236-d4661904-0ed8-4c04-8bdd-09f537b70ba4@linutronix.de>
References: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
 <20260220145236-d4661904-0ed8-4c04-8bdd-09f537b70ba4@linutronix.de>
Date: Fri, 20 Feb 2026 15:58:13 +0100
Message-ID: <m2fr6v5unu.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,syzkaller.appspotmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53130-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdmasalkhi@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,96f901260a0b2d29cd1a];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C5BB168913
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 14:56 +0100, Thomas Wei=C3=9Fschuh wrote:
> Hi Yihan Ding,
>
> On Fri, Feb 20, 2026 at 09:39:45PM +0800, Ding Yihan wrote:
>> While looking into this exact same syzbot report, I noticed that=20
>> `vidtv_ts_pcr_write_into()` in the same file also suffers from the
>>  exact same pass-by-value anti-pattern (passing `struct pcr_write_args` =
by value).=20
>
> Good catch.
>=20=20
>> Since `pcr_write_args` also contains implicit padding, it remains a pote=
ntial trigger
>>  for identical KMSAN uninit-value warnings during fuzzing in the future.
>
> The fact that the report is about implicit padding is valuable informatio=
n.
> It should be part of the commit message.
>
>> Also, regarding Thomas's concern about modifying shared data: passing th=
e struct=20
>> as a `const pointer` (e.g., `const struct null_packet_write_args *`)=20
>> would perfectly guarantee that the state remains read-only.
>
> Agreed.
>
>> Thomas, would it be worth submitting a separate patch now to fix
>> `vidtv_ts_pcr_write_into()` to prevent future KMSAN errors? Or would you
>> prefer this to be addressed together in Abd-Alrhman's v2?
>
> Doing it together sounds better. This is not urgent anyways in my opinion.
> But on the other hand I am just a random guy whose commit got wrongly bla=
med
> in the original Fixes tag and I don't know anything about this subsystem.
>
Sorry, I have misunderstood how the 'Fixes' tag works.

>
> Thomas

--=20
Best Regards,
Abd-Alrhman

