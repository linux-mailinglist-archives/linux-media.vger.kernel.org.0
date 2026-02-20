Return-Path: <linux-media+bounces-53129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJyBN5N1mGnhIwMAu9opvQ
	(envelope-from <linux-media+bounces-53129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 15:54:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FACC1688D4
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 15:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 760343069AD2
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 14:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368E134D91E;
	Fri, 20 Feb 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdFGVu2i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06529ACC5
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599240; cv=none; b=UavKkyrIu2QGOot53AntTj1WHJrYIa1hYmHOY2klsKUY0KoXtU0prpykoS93ndWGvnU/MljB2CTog9QOPQPZATs3c+o8GspUNIge89GtaZMFYBAcRV7SysPainM8i8EFoQDt74fgGEKDLGBoC0Wjx9DPzDY/67Qt6vp6Uc2kfgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599240; c=relaxed/simple;
	bh=62KlM9xR4pj8y7WZ5gfpqjPk5aV0ehecJlC+iwxZhl4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DYjNa1evuN1J5ChYMdg15YE+7KaJlhS2chDg6PLyzAwvAqfGABAe+Gakwv3C1vj02NjKax6EnN4G9YbCSFjPT/c9Qzpyscdh0Pglnrz1eEFv3I41XkrWoxBkr8TaudYb0S8eIZgw4E2FHJqG379dp0DOrZ2fY6SSlDagIm2Agpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdFGVu2i; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4807068eacbso17684275e9.2
        for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771599238; x=1772204038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pY3zllAVJn7qBREKILNRglWbWrteJ2SYfsD9bwaiqdI=;
        b=jdFGVu2iCC+nCoE/ygOxl+8QG//TWOAS4KwvnZu+xsPqHGenucLTr6k8ML7iN9PjNt
         R3WvJs0KXKLp5UdCcpcHyO4f6Jj5qDk6M4O6RRriXwRAhZVnA123/JD679RqSyOljp/c
         FDOX1XLqzl0QDUbeXqwOiahtQb5EaVEmcitnmf4+GaK9CPKFmLDWUJvhhnevqG48ImOA
         u/8bWeWSz5Y2dpON8mLac+J2Nlazejb/9najJ5rbtA+dTBFDvNX2peLJVKfdIA9DA7wP
         ks/3nY1JRMi9eAxZgzJKviC4RPv+RJ54hjqSdvJ+aPgqRORh0m8LQEyioxrfALpqc2Om
         6ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599238; x=1772204038;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pY3zllAVJn7qBREKILNRglWbWrteJ2SYfsD9bwaiqdI=;
        b=C05ld28ibBSCmvcgGgxUFIVdgR7KyF2GYsQHxagUpwB1vMa7EUq/1zNiO/dGngmZbi
         SXMpvt1mlzSKfPmDxEPVS009+ek4FdzeUbvbX71xy/dJwBARkxq3O2mDY1/AMP/nKSFH
         1M91Qrtt/NSr6KlXnllNcvaA4pKfeiNrOjAyWn3cMbOY/SM/BEtEKniL1mk5FdtQeMJ4
         b742sdlAb1tVPE5j5QFGSUA7Ykn7hgah+9fwh4+WJxIBcyy7IAAgLitM24Aidzoh2gDU
         0fhnT+l5KQphMNWPS4vVs4x3sp5Jq30LgX68dvZjW5SJM7ShbKqYfm1jZ+WcDJ3k54bT
         /p5A==
X-Forwarded-Encrypted: i=1; AJvYcCWm7VdPH9UwmxDHwuY+pFLUD6SGKW2kWlrxW7imkBQ8DkffZ+R+K/rEQWFGY6ggWhFaYa7vFyA9xnm/gA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ud2pL1JkHiAqAd2iwyyDtZ+adortbxObXuTm1HMaXCk3UW1H
	GpFXRyFIDVFEvbEgOLsICqtdB4mhKrekVXguRZWz+vtpfblq6jXV1NCHzO6iqP43
X-Gm-Gg: AZuq6aJRCaoRlxtIF+c4SjoQXE+x0xF4gxRsyMhhHlyIm3QNohtqlNnKYtDAPX9t/g6
	foqz9A/nEj+PwkiGTli8i7BgGboW81JOwleocQH7yKOWPhuBeEZ8WLk90OzPWVeJ0/aP6tpOccK
	fNICweZd18Ve6Z9gGhevnJ2i832xBmrB0L4ZlTdnPrO97bKtOQG3/n3i3wfTJZdp8TMGsL0FSP/
	9DJUyElNbH1VsW3HZIb10jI+uWh5u6WQftlz/p3yL6UZrVWH0sunSSKq/WeZ1XzArmZiV59isVA
	i7lcqRMLC70FHxpzJM7m0cV2APTC2Rjhc/22t7zTGZFYXe1oaeS027PcCsFA4wOoK6mjGSfJUaC
	LAJCAtCyo0ayTCo2FYmXqMZqa1xrkg1ZOjWUhipp36W4HVKib1l8O7UXbQ9z0EtIyT1bz1kuYWz
	DEzY1MX1D0Ih9WaVdG6MSPsRPK9x7UcEsxndDhC9wGv0VQtdH8E/4W3rFWYNrK3snVFg==
X-Received: by 2002:a05:600c:4f8f:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-48398a52bd4mr152790485e9.10.1771599237657;
        Fri, 20 Feb 2026 06:53:57 -0800 (PST)
Received: from Abds-MacBook-Air.local ([2a02:3037:218:21ee:2dc4:34f0:2c53:7809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5acaasm51603909f8f.6.2026.02.20.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 06:53:57 -0800 (PST)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: Ding Yihan <dingyihan@uniontech.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Cc: dwlsalmeida@gmail.com, mchehab@kernel.org, linmag7@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by
 value
In-Reply-To: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
References: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
Date: Fri, 20 Feb 2026 15:53:34 +0100
Message-ID: <m2ikbr5uvl.fsf@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,syzkaller.appspotmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53129-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 4FACC1688D4
X-Rspamd-Action: no action


Hi Yihan Ding,

On Fri, Feb 20, 2026 at 21:39 +0800, Ding Yihan wrote:
> Hi Thomas and Abd-Alrhman,
>
> While looking into this exact same syzbot report, I noticed that=20
> `vidtv_ts_pcr_write_into()` in the same file also suffers from the
>  exact same pass-by-value anti-pattern (passing `struct pcr_write_args` b=
y value).=20
>
> Since `pcr_write_args` also contains implicit padding, it remains a poten=
tial trigger
>  for identical KMSAN uninit-value warnings during fuzzing in the future.
>
> Also, regarding Thomas's concern about modifying shared data: passing the=
 struct=20
> as a `const pointer` (e.g., `const struct null_packet_write_args *`)=20
> would perfectly guarantee that the state remains read-only.
>
> Thomas, would it be worth submitting a separate patch now to fix `vidtv_t=
s_pcr_write_into()`
> to prevent future KMSAN errors? Or would you prefer this to be addressed =
together in Abd-Alrhman's v2?
>
> Best regards,
> Yihan Ding
>

Thanks for pointing that out. I agree that vidtv_ts_pcr_write_into()
should be updated in the same way, since it has identical padding issues.

For v2 I=E2=80=99ll incorporate both fixes together and switch both paramet=
ers
add the const modifier, as you and Thomas suggested.

Thanks again for the helpful review.

--=20
Best Regards,
Abd-Alrhman

