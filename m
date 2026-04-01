Return-Path: <linux-media+bounces-57869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHUrN64EzWnhZQYAu9opvQ
	(envelope-from <linux-media+bounces-57869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:42:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB89379A62
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B435B3019829
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B543F8DEE;
	Wed,  1 Apr 2026 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BR2R1v0e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF840390211
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043725; cv=pass; b=s3AHquiPUq7qoA2+8kEnBGaRrhtkkZ7f43gfmGk9MNfSXky9cZ/iA6c6e3HhKvaaWblLYLOqJ+/LG3Q/gXfSPGBuvQhS+/zVBfIh1vwfNKielohYxXCdlN7OgpEu4pZ8BKv2ehpyb9+8sm+echRFjtYNbYdKngTzaYiY26VQazw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043725; c=relaxed/simple;
	bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOrP7B8218w1aMIyRKowcV3Iic3Q0sOD1jR+bHiyUDIL+z3LD4oY3gSem+PhQOknM0WWG/JiA8z/DPyWAA9xduUokCkNkvNh4inUBuN2xz9nMvs9cFAojh+878B38h+wflwv8LYbQS4IDMCpQ0oNhyFwGrjDkJLBP7+6qJvi9Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BR2R1v0e; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1443780c4so891636e87.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 04:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775043721; cv=none;
        d=google.com; s=arc-20240605;
        b=VEOTjqn/Yab1p8HzM1va//5NFEEO1+ujPiuKh7gN7pDivifZv5tAEjAzaa64xW77cN
         nKL327/Z8jY6jMVUgKTbJvfB9R9P8BM2BTpntGuZiMnLKLKy16XQDi/bztN0dbWCUobh
         m3efeSEI5fLM+HeRob3iZ3xEYFdQm6J0hQMe9blQxKkFni2nlKIsTbtq9kzS9zbeDTPR
         o93+to1kpaEtLIDscN6oQRlvvO30guzTDSVE3zBKAZCjCkWrwXFgMuzvfB9NwR6Nq0PK
         zg7bMza11vURXzmWoFykgLNObN5ZXOTOQoywFwCdWNdSqO6+4NMqO+QzhpuWpWELWygg
         QjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        fh=HmKuuRRhUR6dTDej3GX0B2GaVg6nYlMnF6GZloiIG7k=;
        b=AQ7cirdWAl5J/MimFcIDElduEam1LczuNpOXE3aUoYIPPOqeckx35szexNAZSx8OCe
         ynnRU9gAbDzODfHlnJmJcK5DXpRa7iiretJYbCLrpgUkdS5w6DPXrykkzv2se2lx5LyV
         jhi7QeN6z/0WYarpLkKdGSbrBRBmi1MgRdFnAXo2XEeTP8rzFzVvZoiiOA3zsIZIoS+i
         XWfTuC9Rt86bb2xYS1avZ+/sgZqXqm7z13CofEz7NFjCFLXkfCAiUX5YfGWlLgnqMqmG
         q4IwBzYlmEaMsxSImYCLRM6ikumP8Jd7RYExZpDF+Om/djyxtLvZcE+55ijsjqyLHSE+
         qjWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775043721; x=1775648521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        b=BR2R1v0e0PaGNJeS1VJkA2AzBVblBa7e+P4LYXlp/xUbfOh4B4zcznrJuYV6FlyDGM
         +DoPIdY25DO9uBhPM0tCiaxh4WS3ohjSsBt1i3/0yeIpcOHMXBPNG6qWNLriK7fOUS/w
         U+YFVGRqPoDicGKLXANVVHkrxU85qIZxxJapMlU0Ezlc5lI6UKzkiREo4r+PXTHdy9im
         WwWI5rYjnVTb6YOmGEVGu5l4slMQAgAne8qAk1p4BXhanDYgzp4xBH8XArkzR3UGs8Hu
         YwJoDivTehJGoyn/pPPF6BeObx8Bau9C6fbVhMWWIsvSlZcW2VUWtRX2RzEWGPUU/lpl
         mPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043721; x=1775648521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        b=Uzpkci24hcBbzSZE6YSlHHV27lACHqQfWLolY1OhK3QQiQK8qyG1jI0PgVa5NuevKM
         Ra3Ieae1ilAEiO+IAqIHGcwTDVHV7rVE1cz2luXW2xdm9BJBMe35dbuINckaC5jZSdcE
         yXr3RJ8C9aX+KWj0447dlMPllyh9wTklNFUEtyEPV0dCmedhNBN7iVBM9ii3jA+Mt6Ys
         fJeA71YDdZbtF540gbMMpBm15tXhNcYZZbCADDDXGHPklN8bgQufHkEuWeIf8KgYtct1
         2d4GAXNbsDMvfGL/hR9fIAXqSUiqickk7glvA5eOzIuyMfuOWdp8cJ0fTV9wEaD9MgB7
         O8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrLGxLEjGxnSOOrJ31JzhMfnLSeOwNkEf8l/RVbNqtgRHPuIgzmYZ+h+vpfDDd03z+dd6tW7ZrWYiZkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVKgvkFO/Tof+n/VGv7H3/v6IuyEq6c+rjTF/KLzlyrm8aWFu
	Gdtnyylsr3gcRhHiYalhUd39k7mSwf+3DYQVJpNtAlQ1A0tbi543D82g+75M3vZ9WXj2s3J/WxC
	B9jsndzIvUpb+3WiEl2mNA57WP+LmgG+JymyndeGvWQ==
X-Gm-Gg: ATEYQzyvUUJqbPeAfwSPLTuM+Df2Y3ZCHbDwvOcubPTRLKNAOZeVGsmnHVuEIKVlSKS
	rhsUYD7SK8tyd+EgRMdUYtZBwkS0Y8KCZR3fX9GmQJSkgF+s7aNNk1Ml9SNPF5tPaHEjM68y9nt
	l3uiay6mfJnpWdfxiMyFBFEOQJXRic3I5hYOJ/NetEnFwFfsningI/ik9jIB2Xb/N5tHmJe70RB
	/VyXw8YzuKv9/cvmFgaO3ZSu2qREZ393c+0KDaVagzDW4J0iFTMXT/HeaGVVNG4Xt0JAF1N9ekv
	HAQltSfCrwrP8ovUoqk=
X-Received: by 2002:a05:6512:1048:b0:5a1:1de6:bc66 with SMTP id
 2adb3069b0e04-5a2c2204c2bmr963346e87.18.1775043719389; Wed, 01 Apr 2026
 04:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com> <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <gX7v5Lyaw6K_7HLFrWAPRIukMU5BJ9bGDg4RNePhYxZ4A9KcMe1HWULG-XqG1czNCzN3e2BMPQV85a2184NwPQ==@protonmail.internalid>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com> <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
In-Reply-To: <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2026 13:41:23 +0200
X-Gm-Features: AQROBzC6yQBtymEM8RF6AwP2-8_VypiX8OajhW6JswzQtD6SYu97waxO7DoNljg
Message-ID: <CAPDyKFrkVbvZcnbhxbLqFySn4V+USCKAjooT3yXN56jq+D9XGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57869-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8EB89379A62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026 at 12:58, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 01/04/2026 11:46, Ulf Hansson wrote:
> >>> The intent was for this patch to be part of v7.0-rc1, but I failed
> >>> with my pull-request to Linus.
> >>>
> >>> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
> >>>
> >>> Is it possible to drop/defer these changes until v7.2?
> >> It would be very sad.
> > Right.
> >
> > Since it's my mistake, let me reconsider. If I rebase my branch and
> > share the necessary commit through an immutable branch that you can
> > pull in. Would that work for you?
> >
> > Kind regards
> > Uffe
>
> Yes. Please go ahead.

The patch is available for you to pull from the immutable branch:

git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git pmdomain

Kind regards
Uffe

