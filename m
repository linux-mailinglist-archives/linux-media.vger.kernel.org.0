Return-Path: <linux-media+bounces-57528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNhNFM7PyWkQ2wUAu9opvQ
	(envelope-from <linux-media+bounces-57528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 03:20:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A403548F0
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 03:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 893DD301111A
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 01:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F9D253B42;
	Mon, 30 Mar 2026 01:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+NbLXq2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89932A1BF
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774833593; cv=pass; b=ArhLgKm69+M5RBQtfk5ygPJ8oiYQ0y9sx0/LMT4iWXCeZYbjP9lypeibvRh13sT7oJzaXlsaYLlph5cPtHOFSnlzzjYvtI5LEJ5o71vxf5JxlMc7tdOF+/rq6PkQ+rScOcsQfk54J607ybF1zc51NXVjBCQrvIWMkA9QuzncmWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774833593; c=relaxed/simple;
	bh=OvSZnGeX0OVBOLO4vKH75y21Lqa/jeNO4/gUCjChH4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpcTstrYzUXlzD+tKuj+C6pt+OL1Z7fqjs/M+qe+n1g9ZSsGEzC0A+CxY65LfYcsi1rL8a2HkRYHYvG+5MwrfKA1+I7VlQyGt7wF9Xxt+38Qg7phTJWthgoiJYBZMrLDxravhITGNPWaidqer/00lSUNmpChavteKw+VD9Yob94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+NbLXq2; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5fff18d44fbso2549736137.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774833591; cv=none;
        d=google.com; s=arc-20240605;
        b=Z0vZThLzWlQHLGdWEO4ZFQJWtW5zQrzWRlS8VPnsDOz3FwXoPEPDTvpEpVpUR4Fxqo
         S8YtFQ6ZkH+NUsALJUm+muU4UkOnAnmEbiAQm22pLaxlWcPf2bI6LwB7rA9ARHBdkz1M
         QF5wB4PM+Ffk7456B56d2FEyejJGQPsbqhyM3RPsUARHIu8unY+7cW3+5t3WdKbbk4fF
         dYj4FltwKeoRXW/212F3KnOcyhv2thK+O+VtihSUmIlbEGRf37jygwAGHqe4ykbY1Ohd
         X1mRjfAgcQAh509VGMy/7n+XrrBcT+82fm0RXuvSsBpfDK5VDCJSkVU/MDA5RtMUKdiV
         6g5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OvSZnGeX0OVBOLO4vKH75y21Lqa/jeNO4/gUCjChH4Q=;
        fh=ma/2AtEBOVmKjg81yOnV++juSsmuSYoABgpclDbs1qk=;
        b=jZbC7KwPdDd7bi7RSO/VqzipK14UQjLhzhQL8wKkfFUEP5kWk2gkRtPAQwV+s76EnR
         7WrpgHPzhGuuMt3yZdsJ+gSyNwjGxo09rSwXuyNZ+08sA27xwGnFGxOLNSPQh7CshLvM
         foeAZxnxhQ/SrRC8YygFfbCv+7ZeKnBSalTKzd37HigAk8JYeSPS5CKQfqJUz3oRNrbl
         6O4K5T1QJjsMRJ+gwAl5vqIzQJno71sylRnsrbghzAlj/vULOkeo8kf0Q/DqzzXmfmQE
         1ii/3RD1ylOQR6rUPWO85CpphgrZ2IcETU9YevV5WLF8r7rvlwTDNM6lE/j4rpt++d4H
         SuSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774833591; x=1775438391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvSZnGeX0OVBOLO4vKH75y21Lqa/jeNO4/gUCjChH4Q=;
        b=q+NbLXq2/HXieqtSL3NULwOD+P7SjOJkknmJXGj+u+VjMhhNzwMJ/Be+OlxCOmMBFA
         dGEeRkeakaztgQdk09OxAxu6kGkSo/cW5nqnBjqL9dSG0knsOaF9WVhTLC8Eo9JohRbR
         99OOkjhcUJ3KZsVivXpAl6MsoMdfkbbJY4bzmHLn1yzuzjeGcbFXY93+SfyevEDXriwb
         bYzxlU6X0qyJd5hcF7ih1RGjtDKHQJXe12S4d/JM56QDB5WnEC3wOR31ULx8zEJ/Hg+P
         V6ZqePqiKxFuIGrFq/bcvtJ+xEF2APkjgmQEXIf/F7i2ZfS2VhVklY2zNpaMOrGXA6EU
         PSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774833591; x=1775438391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvSZnGeX0OVBOLO4vKH75y21Lqa/jeNO4/gUCjChH4Q=;
        b=bzqj/zmro6KSzN/FKPRGcrYmux0kKw/EGhOZppjp2Y6VwZ5ommHrRea2z3BT9XCHqz
         3iTh68tLLOxQNAVdLKYGYJRoDcoiXDM9eNr3TP4Fs3Mq8wOaoa6AoF69iA/xNjBMqVA0
         VI8j7v0OxYm7RAvdK1VkaUlEfofiFNx8ScljhkN9NYnYoA7WBcg7RQmSrUg8b0nPnBQX
         ttgMMEN2j6wieR3K97U8zWe2QcosMmgHrN2Pwn7nej9lmv+rng7alECEvBtrLri8/dv5
         NjxguJcdunGH5qmh0pMAHI/rFGrMpbfPNJWMzDsxM36FLutWZmh9KH0kzdGymujp5oZV
         5+0g==
X-Forwarded-Encrypted: i=1; AJvYcCUldqogNW2cvXrRWrKK2R/aPNCqrPbxbXNrWUVB9ANmiXb9vsLRiXmHC3Cc808E7uLN5tT54lON6nosNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwucT2AyZBc6CpU14ddl/ob69cKJExkedvSMkaIlbrrV7wkGKE7
	QF/09XspiGgK9YZdMX4mjb5K/x7dGnsgX0BdCrROClWFuBfDSXaBQfbmBZh9/lFRC9B+bRidyZ7
	FROr1zK1f2MqWwrreQ11XYvQL5F3Xr14=
X-Gm-Gg: ATEYQzyMSNYDyzqM0LOQovzRBAyq6m2pV1PowEQJuVwXHoMAZtZwJ8hT1UdutovqfzH
	qlBomMziGL37kP+8zC0+Vewm5CdhzDtjJ9cFeJMD/ccTwcZAERe9tTzx11k4K/MwQ0f3MeLRM7p
	ksjJeMkIeHFkB9l8bGXVb2LIb1Jo18rnTW2qc9RXM7WPUkzyzeDfmfsOkXe9wzqKY090M2LdRA0
	1zOovPTed3m4zOWnFlcqdZOC28c41nhFzfiV8yFy1Dk5x4rqZbAc+a+GYzqBEAeYNsazmLpr+K2
	LguvHKMV
X-Received: by 2002:a05:6102:3710:b0:604:ef07:592e with SMTP id
 ada2fe7eead31-604f937cf3amr4213553137.33.1774833590624; Sun, 29 Mar 2026
 18:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327031106.10386-1-anushkabadhe@gmail.com> <acZRRXXBoflHV0rt@ashevche-desk.local>
In-Reply-To: <acZRRXXBoflHV0rt@ashevche-desk.local>
From: Anushka B <anushkabadhe@gmail.com>
Date: Mon, 30 Mar 2026 06:49:14 +0530
X-Gm-Features: AQROBzAAdb38zg5lmYqVTahVQZy-GMtMSrPhG4kiXXVpQLbKYO85ytCYQioWvbE
Message-ID: <CAAfE=nMVP9zJKPendwusvVwjesVgKOTaSBHd0S219X-RNTMDzg@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>, 
	Dhruva gole <goledhruva@gmail.com>, Simona Toaca <simona.toaca@nxp.com>, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57528-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,linux.intel.com,nxp.com,gmail.com,ti.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A0A403548F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 3:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:
> > GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
> > globally visible.
> >
> > Move its declaration from system_local.c to gp_timer.c and make it file
> > local by marking it static. Remove external declaration from system_loc=
al.h
> > and its usage in gp_timer.h
> >
> > This fixes a sparse warning about global visibility and cleans up
> > unnecessary global exposure.
>
> ...
>
> > ---
> > Changes in v6:
> > - Mark scope of GP_TIMER_BASE static
>
> Good catch, but read my comment against v5. And slow down with new versio=
ns,
> no new version within 24h, please!
>
> --
> With Best Regards,
> Andy Shevchenko
>

Hi Andy,
I saw your comment on v5 regarding the GP TIMER comment style, thank
you for the example.
I also received feedback from Sakari on this file:
> Please don't move the defition here. There's a reason for keeping it in t=
he
> same location with the rest of the offsets.
Would it be acceptable to go back to the simpler in-place merge in
system_local.c, joining the split
declaration of GP_TIMER_BASE? I can follow up with the comment
formatting as a separate patch.

I'll make sure to discuss changes before sending new revisions going forwar=
d.

Thank you,
Anushka

