Return-Path: <linux-media+bounces-66654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jUJOAB09S2pOOAEAu9opvQ
	(envelope-from <linux-media+bounces-66654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 07:29:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9E070C9BE
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 07:29:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VLpgAVni;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66654-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66654-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E36A300D76E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 05:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85DC3B389A;
	Mon,  6 Jul 2026 05:28:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E413563DD
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 05:28:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315738; cv=pass; b=rBNNy5Ep+guitxBO56hJcrG+UFjovWoydmuD9hK314iZAYERqwmIU2rWkhrdrQGbi6/2EoWG5brcs0KZZMrTHgUXxXlDxW6VNBmOJpjMc70tRpuN/trXiDO2Yz2I1Z0+K4sHGeCnPGlOMnjsnU/zOF/WGIRR1zxUYTKR2VPOIT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315738; c=relaxed/simple;
	bh=Xl/TbKH+g9cHqWt17u800xn75IkzwNS9iGyCcYjzCmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swXVmXKJjiRFreCf7HsYeMdXJGTa1jO/YfcKb8H0Ng2lZY+da4FRs4kEo7qVAv6pVxi0+5JZZHWwF0CyuDJE6Mr8wwfPhcyVWX3jZA2097+8O89VqbrN5+M5NgY7seFeWBh/H0mDJebPM7ODf9mg0iwwC9gbZKR/sfjvAGlQJOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLpgAVni; arc=pass smtp.client-ip=209.85.218.51
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c127813835aso271369766b.2
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 22:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783315735; cv=none;
        d=google.com; s=arc-20260327;
        b=qgheEK5okr8hPCZOaFhVrolUzclcjpJV4/ouEyeBIXB23HiZpprF7+geStlZth7zSs
         6yvzGpvP4JDTnB0JIJkdS1upQEFoznAwLZ78n1fDj62ymvtuYlbIMoiMhp0gXPPDAJ0R
         fOLoDrjAVwn0ry8j49vGnSciI6mMWMkldWvHrXMU0hKEAWbyziZKvCvwAJAtrnIb1HbW
         6wuVvbz5pHgblHP1+WG07jnMXEwI85L2ffjKc+/wIug9kO/6OzCdl6nxtLv6o+fHnmb7
         mZ6QPK26fXGDLL0myBC0/zO8mWawyXd6PwgpvZH5iiiI2WW5DSGxebqK7CbSsuowLurY
         nIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xl/TbKH+g9cHqWt17u800xn75IkzwNS9iGyCcYjzCmg=;
        fh=B7+xW5WRdHDdBcKMnf7Mgid6ZwRUPmlh+8Yhjcl/hUE=;
        b=DvOUxVIBByv1s2RhBYlTqOpZBdOCtBrKXG3YZq3/L6JIiomH/b58haKfE1PJomugS/
         +pZaFi+mmqlLfSR1Gy/ii51x5/O5b8fzK/SamLmJII9Yqeyn9I5QbrI3pOxLqZQWR6M8
         Jrb8cqORWVStT8FUWzscVT4f/bLSyZ8gWB3wnTzy8II/U3weKAreZx2/ezEIGmwdqL+i
         0jsqGdBpU2ZhbaFwsZ63WvqSKOrNL2CqFWUOIvht409OFsV0PcmnfuFPsTuHLRsqVqkW
         kQIREmW6/pGwwn3WtCDZ6W5rRvyU1YHYDZfhTwyIpWGgC3H4FQr1l1JmxmBBrWB7Exfq
         4jhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783315735; x=1783920535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl/TbKH+g9cHqWt17u800xn75IkzwNS9iGyCcYjzCmg=;
        b=VLpgAVniiTWuxiYpK63vuvQyuGpHFK7mZznQY8yDkDudWxv9qCDTx0AQJHTlMnBwMo
         luwbf5A4hsIB3Tz2UmzCC2PQRCDR+qk9FBGD/k4Zwl1f7bk5o03icDI8Hg5UtBh784Eo
         hhfAwTzQe2ojmiyfRV0t8FVF4E17Er+NupZOdrirTmDWVEGTzKnG3bBvrF9932Ocj4vw
         CJhpRrcrllZSVGNvs0HXCgxgEmerF9kWGClGss9Z2LTl3jVtUkeb9xyVK6mNaCf4dHLQ
         EfoMChNiK6Azfiy9/v1LC9u8FL6IjEtZrB6tYBhxSlCoxPwa7BFqFe5ujXKRYXn/lSrd
         gXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315735; x=1783920535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xl/TbKH+g9cHqWt17u800xn75IkzwNS9iGyCcYjzCmg=;
        b=h112+uWcf8cFdTw4Vy4bmt2nQN1d5+pJxZrbQ8TlZIAsqZd0kaiABj3vUSn1M7m9M9
         MnM+PjlUatsI2vWbhOswm+dn4bNYNEC9C/WPgmhphvHZKe8+vuDNnPGXQFp6QLcAkJvr
         gCJOjf4kPYiDA7bTRx3z4byB9rzystFMj9dm2QjiqU7/ICUw/77qreGQcyDEUfrFvreb
         +jJiFsO2FnliNr22VRX/GZPqEjdCSedZOmFjPVnSImqMsTezuPj9Nq/urcnD+Cq66fNF
         35eUxbm68hLQxvScL2/+En/RtDfLbdpdfDhdO58zhKBfErhVdyuXWn6NxOVfTT0aaToO
         rmCw==
X-Forwarded-Encrypted: i=1; AHgh+RproVmopbs7FVwBuZZwsBAKOmI+f6JxihfpWa/cQNo7B2Rw6ukQd31wWrspZ7iU6Kl+vg1KgZm0+V+a9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpc9GV5jkWOJK8wQBLssCPpiIWxaeD9CriACb+En9ZhejPMZ/5
	qdcy9p6ynQFBYXhaDcAMmh+VRB+xehqUo/xGKc6cLL+n/Wg5SUYPDj5Knf3rPcNowqsaqLSPlMN
	3Gcc0/Id53hVvahX4whNrqDWnGXP/RMU=
X-Gm-Gg: AfdE7cm01M6yPs8YFDe7A2IXnE5n1RDnXypqutOz0RBN1OgvM4E1PnGLgFdfYb1VgX/
	gxykcycK/Lckd8RKbC26qDtGzFAB7g6ncr1O2nUr3ejISffwWOCLHQnsWzNTGlq7KuHpM1wYaN5
	FmGQUq4/vnVA00rhVmR4G2C2LxnIwZdHMBhgUo/yzbN+WRi7P9V0JDo/yz3YBnzEojd5xFZ3AsE
	Onn8x9XXwg1kwB0z8u3EHosZwMoE+Ehd6ed9/ONXxJuxIH20PumG30ROZOiE459gUMooldYFyoT
	GUqZwKUbP5OCnxd76uDrxfQ7JCnuZ8vZCeb8JyV/d9segXCIZ0qM15SGP+PzJdUTjEIfRAVyyyH
	tUgAf5SQEVZLT7Nx2Di50GtT4PW8kV8b2Dk8v/4ati1tpSuajJD1tcubMTw==
X-Received: by 2002:a17:907:3e84:b0:c12:8c27:e2f6 with SMTP id
 a640c23a62f3a-c12e6947284mr285067166b.13.1783315734816; Sun, 05 Jul 2026
 22:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
In-Reply-To: <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Jul 2026 08:28:18 +0300
X-Gm-Features: AVVi8Cds722lQuQUNeNlHcyk4-qd190SE0LVbAYjHjmEX2jaCmB-aaJBsXCpzD8
Message-ID: <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:dileepsankhla.ds@gmail.com,m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:error27@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:dileepsankhlads@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66654-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A9E070C9BE

On Mon, Jul 6, 2026 at 8:13=E2=80=AFAM Dileep Sankhla
<dileepsankhla.ds@gmail.com> wrote:
> On Sat, Jul 4, 2026 at 7:15=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > Is this the only place (of a such kind) that can be amended
> > in the entire driver?

> No. There are other places too. I performed a quick check:

> In my patch, I am trying to address the warning only from a single
> file. If you want, I could try to send a patch addressing all the
> above warnings.

This is a huge driver and doing half-baked work doesn't make sense.
Also if you want to continue working on this driver, get the hardware.
Almost any cheap second-hand Bay Trail and Cherry Trail tablet should
suffice (of course one needs to check the specifications beforehand to
be sure it uses AtomISP camera).


--=20
With Best Regards,
Andy Shevchenko

