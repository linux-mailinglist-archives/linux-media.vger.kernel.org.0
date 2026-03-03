Return-Path: <linux-media+bounces-54278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAxXJtCopmk7SgAAu9opvQ
	(envelope-from <linux-media+bounces-54278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:24:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B81EBC6C
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1F28309E2A4
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F0038C2D5;
	Tue,  3 Mar 2026 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ko9PnWd6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FB138BF76
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529701; cv=pass; b=GY5v/u9NDbV12+5XUW6hOt37eNZQurf57BAEQY2pJ5HbdgN0b4qkfUfk6XFj8Fh/Ig/HxZTkOheaCcYExP7D9a7n5451CNplnaX2JBhBMN1pXScSmCnunR3sBKMc6XXnhtL2j9q2fXos9KLjYCadGUQ8SM99OSlYxFvJ17xhfDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529701; c=relaxed/simple;
	bh=fN3t0vmb2MEuNSgkXqPeudxeGP+K0mWzA2P+qEzEmPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyFlthAsSP9oh/S2cG+zHoybDuwqcLe5Ylj+he0iolIBm/CcYWfEOKrOSqy5CRik0S9ysuNlsc6dXiJ5w+2QaxdP6SLEocDx6rEPL7iSRVOOUyorbviycfg7uwAhrwOHNS1olJV86b+zN8pzaBhZds3TJr0SyIw23zT9c/KrRlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ko9PnWd6; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so872748066b.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 01:21:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772529699; cv=none;
        d=google.com; s=arc-20240605;
        b=MQBsAk7BSMYuK+XryPQ0i+pCO1184U94q2iKHNb7nemaOHgDjo2iYXZ6g5Bzj4A2Ru
         yJBnLdrvWztFX8Mc1cua9pvKUcMfSImUMTVmYUggRB/Ti9mHzNqo24OPXhnwiGYNkAA5
         WHqw7uEYjGoe9W17203ZGHWf6QfdpmmbDaTHyFC5YE2qEhtv2hXlfE5WjHu4scVw6Ly5
         N5iT8fWwqLRaFKFKajuU5B5Ro8iikF65DiKLXNot4gDexJisXcL1eQOdWzOvQEd+oVIK
         5b+G3yzy/WsugpJRX7yNfVIDp/0Y4zMJzu+9yf5UQOjg8Q4aBoqNrMuIud8Yk0yxSvhE
         4+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JrB2cc9THhmiBknivOgMNl8QvoNPpvuT94F8tRthmYA=;
        fh=znU5I404lwUvjHOQe6HXVZ87vytsWW9UuxFeTEVPKzE=;
        b=gvxfsQ/xy86MTe9KcFRPzMKshpo4mwEnLwFpgIAIJeSDoFPIthoWBvJbLNWOLUb/25
         GUjWsCf6hIJuHxfPqb1IGO4WLOuram+X7UFc164LQSR88HrSHCh+cIxPiKaaY9cIGz/s
         zInHQCjBZqsIhlnQXhk1cXC2z94fcjPg7HgwDa31vM0ODO2JOdpz3Y5dJSZwY0J2WIXI
         ui7meFW8KUgu7vC8agqz+4yLUeEAfbYw7KfMnDvvmqc6arK8vT/Yh5OoMURVrBhLbdb5
         Q3ZKZ4EDXiV5yM1ptCTsg8ehx7Ng3yvZF+2ZBPtgQbPfC+w1UboXjnggeouF0X6pg2Iy
         W+xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529699; x=1773134499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrB2cc9THhmiBknivOgMNl8QvoNPpvuT94F8tRthmYA=;
        b=ko9PnWd69T//2cw+m+RYWZ0NSKLXW6DJcHwbNWebU3cAu0ZlYNzX9n4xP0rDD+c9Fz
         lJ22d9d4FjEE+NxYVWQPHPozr6MbRyshAIgiCMdcI1UYCydLybvW2l9aJyZh1CYRhEqv
         QtZzytvIywpLfABcvcgydnW1uQd/jYzJwzs8DYG+qqSJvUpzlK90Mw3EScV9tOB1TFeI
         o/mad9C8f0iThZhzQOJyCxeqkzFVJ6S2C+sgTBk+s8lEEXlEryCZluabusOTlA/tw9Sw
         a9O4pFtNYe+fZ3FgHAk7ujfpBtybkMnJpMn85MytvfTAVHiAT/76Ixk3XaZr3YV9kqDm
         ryeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529699; x=1773134499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JrB2cc9THhmiBknivOgMNl8QvoNPpvuT94F8tRthmYA=;
        b=ikUdyFwBdk7YzxiwTQLHiFpJNCJke6vDkerdTJ9nl33odXo5HG6W+2A8tjQAcza15U
         6Nz9afISsWrOhS40i/GdjExjyWikNglMtavCKxI9EirqPPkrMrPQ3qv5qJzxYRPUzQyA
         gSHLvm4N95jkjejggRPTthmSZ3bSHmbLQNnRMUKAOHWjs472mVUi81iN+s6PeSXZFers
         KPA9E+AsOfVs7iogH6y8r9LySWPKN5ho1KbxTiYPfVPIhs9gddRDvwFFN/0oM1m9bU4u
         XxmjySNLfgd0eWj/oiBdg4qZFBxDeq/U7UOsITbEw79qSIyRVb/g9l6jURA0LCcZenJZ
         iUBA==
X-Gm-Message-State: AOJu0Yx+laPD865uWphOLt4RL1SDM5zELvhqk6nGFeJoMjHDaSVYcnzG
	Ms57AKuJXGZYLVDPv+Qz97F/HRWnH0YIfZqtvXv6cWxoKFYJo82TbcvqKvLtwKOM8UECRqPfnun
	OpeGmwXaH4CXV9atkw2OYnItUXqqBIUreBypd
X-Gm-Gg: ATEYQzzr5OZDyeikGn9YVYbIHQ6VvR8bmGKQYVpI5sbuQGrLTqCNV2sPkV5Ob4F120N
	dnNVdacz/ILHZ3YKb3ONxPIPSe07PWephhgtZjJJzT730KqUnOUeBne6v/39TQeA+YFwB+qMc37
	opJ2Rg/W4Q0yw9F9kRa6iP7tUQgdIYO9tqWNFyV+0B1K/nT3vWRIDTBip0kAnpXKWWzo3Rk3u5o
	8LIZoBjFHNdIUg7tVGo+JgXP9LLRXMX5l2Kz8EMMsoDBo8oZI4Ghemjt4zqlFo0ymbd71STN132
	V3rRtb3M0HTqZ7RYmCd85Qpab8PYZl/hQBzFoW/RXbvc/s1Cof/TwhqWFtPQnyQGk8N3+1Qt9wY
	zhcSk0OlVBNz6sFzXcQ==
X-Received: by 2002:a17:906:c145:b0:b8f:6699:a036 with SMTP id
 a640c23a62f3a-b93763a28dfmr996571566b.19.1772529698649; Tue, 03 Mar 2026
 01:21:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Mar 2026 11:21:02 +0200
X-Gm-Features: AaiRm51jqtcJjBk7U_Is4f-hm6C4SiOIrwgEnfnYpuDykoNtDCu1LqaawynvC2Q
Message-ID: <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	Soufiane Dani <soufianeda@tutanota.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 034B81EBC6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54278-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 10:34=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Disallow all private IOCTLs. These aren't quite as safe as one could
> assume of IOCTL handlers; disable them for now. Instead of removing the
> code, return in the beginning of the function if cmd is non-zero in order
> to keep static checkers happy.
>
> Reported-by: Soufiane Dani <soufianeda@tutanota.com>
> Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-0=
24429cbff31@tutanota.com/
> Cc: stable@vger.kernel.org

> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

Is it the correct one? Driver was before that, so I believe this needs
to go deeper.

...

> +       /* Disable all private IOCTLs for now! */
> +       if (cmd)
> +               return -EINVAL;

Maybe even a warning?

--=20
With Best Regards,
Andy Shevchenko

