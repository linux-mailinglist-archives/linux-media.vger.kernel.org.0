Return-Path: <linux-media+bounces-54662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EE4EyOnqWlSBwEAu9opvQ
	(envelope-from <linux-media+bounces-54662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 16:54:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7550214E98
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 16:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F09A2300A3A4
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 15:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F2D3CA49A;
	Thu,  5 Mar 2026 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CbnWNzDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82737A48B
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725410; cv=pass; b=CCC4SPHkqtSepqMPXf/YyEhRezvgkslJnj8YAc2T7MVPRg6pFKXGBIeInbJGIM/Y7EKNLQyhFk3ISUjzeDwC8nPRGhBnyHJXjqeBX/CRVBMY2S7fPekidyXaPFcDi4SFRXs1GfRUJ4nbR2YTb21lOEUUqi0ApkNM1CmwUWf3XhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725410; c=relaxed/simple;
	bh=sdsDUz1SoQHTlsNdR/G98EXd2TtkUdvX/7KPwEefY5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKyCrEcu3AhrYlMXfWdTfT8VPcegp/iXEOtGsMtAlcgcVtbUtbdhL6x9gXqio1ZEJYF1eixP38QJ/o4JW0gL54Q+Va3or5egITjeSNQhca56bcq+wu5h7FB4BN0MSxXSlHXL1cjP0mqvp4e7uIfrnkPwpCwWNWxw/NiCjeyFcf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CbnWNzDx; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-389ff6e5885so71023931fa.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 07:43:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772725407; cv=none;
        d=google.com; s=arc-20240605;
        b=IlO0y+yCcVaVRBfeS8DOUmI/Oo1aUmRDyZ48q0c4h3jzmJutKevL2pLrDSTxd7aVP6
         6LlKLtrMdbmk7Rn2wPnnlMws+qTbCUMBQcMNGGFNqR1Lum+aA6evMT9NMEtE9BHtHARM
         6AL8JYiHcCzwtkUv19gpuJkmqe2QVJGCWsDKP3nZHe0k0VfaLHYn2mKyrKq/2uOP/Wod
         VTxGXWHyxZYaUGELjXn9eCqkYZ3NDTq7Q1TjMgOrnBf43YjyFwFS+6T0RNgz8DYkugiW
         KyLtu52HSxDYGt32r6wnBSx6foNIxojKLGMadX0C4Q2DCmkIg7Z3QZ2nUdjMkBEKY43/
         rAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BdGkKw30XxPO22+IgNIsmMexoG/zaClNpqqy0Nj2f2o=;
        fh=ODiClN+dEKiBWYArFPt8WcaLdKWQV0PuzWvsAg3ErS4=;
        b=A2O3rhvDosWJVGY0i0Akn3PRIGp18EGvq3RBLYyMvVWkBlb5EQJ+3zaxGCCeiESyKm
         h+XpJ8VynoYmxJtr4BRrXN1pLA3lBGPyUvXg00Buk/Gi9deTmqJ5dn4LG8qtCll3QG7A
         HudNB/HD7Dh6nPkPQ2ZPfnDy2US3mLYe381WodewcLJZRRlppyjRcfSoUsSi48V06ZVV
         C/bS9ZsK9o2s1nGpU8lRwdRNKdu6606wE6NF2X0IxV7ZogWJQGrMPsFv4yjLHYT4ScTx
         ytDzMJen9Uvpe+XV84hqgcpoVRKqhIxkrDxoLHMZKzq7byEd2JCmBqoSy2qDwQZ2ae55
         MxHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772725407; x=1773330207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdGkKw30XxPO22+IgNIsmMexoG/zaClNpqqy0Nj2f2o=;
        b=CbnWNzDx7gxnSktrL35QSkqvsjWmMxS09VuyGt6p3KCzaRSglWb+2qfoGMZ4ydwWmY
         0aOMOem2UVaNnGIqBzNYJ521Dgu8clZ3lbrt0MZ0ldQQRLyKFEWgk2G8JryTEQJcTFFk
         4TJxZxYgOLPIwRQk5IKKzlFzPfCeCrHyT2NjAftPbcbvpo3B1NsRjodlqapE5oOU4/OJ
         zPkrRpR9vm65LK5BwU/9Ln360D8v+30ncl1f39xvrLO7Q/ZMtdAe9PtNctJ3XzZUSqBV
         RiNzPmWFF738ucSFifdAYpxbgtYbtoly/wzffGxv0wyBiREU2MtTe3HwVB3neXsenzV9
         WrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772725407; x=1773330207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdGkKw30XxPO22+IgNIsmMexoG/zaClNpqqy0Nj2f2o=;
        b=WfZxMxgCJqZ34hjQ1ZYQH7jnEWyV33F1gzqSyhF2i3HNhovusXrwBp1V8ex1D0+tUG
         v8jUKDdoND9tTo8yqdrQyLf09Rfvhbw2fxgL3EYLm2Qo4D5j6rtUBmGTlix0AI+04bJo
         NyWZs80hgqqI3+80MWhvPp/1GEWIjl8CbYKdlW9LDctO7Kfrdml4GYY4DDw73QOEJrhz
         Eouo8+3p81riMmKlnfi8/mtg+5qoWB/3cfLX4i2NpWQGIjdzhRCaLItDh6++QKy00lhT
         RsHjj26k0PsxjhsM1uAGI8Cttk7920EiXSUxXDgtqXMz4dSP2hd3KpsSmt0z5aMrRvn5
         UsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe3wu6XXmFF8XQT7n1Oiq3IwrZiTn/bIJRuliammq2Dg3xOg7QVgJN6boh95y9vEnGZsf8YgoiYoz1UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd5PXvcL+x+B6fhf/pgydOEumFLUVn8ycx6ux6wmOxi5i9RY2Z
	4Z744v2wu6d7fPur3s2B4k1iBxCvXZTeVGSpWcGvoZWVHB0WbIceo4vzTPmxNgQkHaJ6Bv5tlEo
	4i7lrqjNpKYZuV8fZsPAZcjVjMCuqzR0+Ia4sv1wrmA==
X-Gm-Gg: ATEYQzyBJgdSOHJN8L9Mz7PtMGFULyz4PdCbDy3Sr4eDSeu/dCr2SAhBNA5p8MAyZk8
	Oql3eq2CP9WVAHT2pOzs+wYwRI2j5uF8jjYw/YOivurmkB8cqVo0Q7znR9j4zrDjtvFUPzmHhnc
	HlO1U9bWQMSfRxlT1lQ0LMuqC+xJ+gRf1CcsSzFYegcPzBWcEPoEP+8tuLfVkp2xfTJiCXpCDFQ
	lVmOplnGaGUpJj7OcgFFcS5HXfGqdLC9clkF6YALxgabzqB1wrgRqq3dzyo1W5YIw1PVZ4nijvO
	L1Hu6S6jaqCBTpQnf/MZ4sq8u1cIdID3gz4kYGvw
X-Received: by 2002:a05:6512:2241:b0:5a1:2c19:4e83 with SMTP id
 2adb3069b0e04-5a131f27b2fmr1131240e87.20.1772725406166; Thu, 05 Mar 2026
 07:43:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141052.221108-1-marco.crivellari@suse.com>
In-Reply-To: <20251107141052.221108-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 5 Mar 2026 16:43:13 +0100
X-Gm-Features: AaiRm534pyzBj9WT9NcLnS-SIttTRI2w9qDBPgKH8W-_MQlIN2PSwDQAOhY5nQ0
Message-ID: <CAAofZF5XEtfTR82tLWrt3faaSU5aoZNpc3GPe0nuXkpChXAzxQ@mail.gmail.com>
Subject: Re: [PATCH] media: ddbridge: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C7550214E98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com];
	TAGGED_FROM(0.00)[bounces-54662-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:dkim,suse.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi,

On Fri, Nov 7, 2025 at 3:11=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>  drivers/media/pci/ddbridge/ddbridge-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

