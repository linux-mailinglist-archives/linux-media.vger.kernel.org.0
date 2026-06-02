Return-Path: <linux-media+bounces-63406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dqdIJkL5HmrhbAAAu9opvQ
	(envelope-from <linux-media+bounces-63406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 17:39:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 339D862FDF5
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 17:39:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=nTWtNnAk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63406-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63406-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EC69303126B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 15:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195E53ED5CC;
	Tue,  2 Jun 2026 15:35:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2403EDAD8
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 15:35:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414546; cv=pass; b=tSsvocE7IKG1jRIiimzcviXmTAs6ToPRz+WQddZAMjJp+odXKgLPfG7C4jgu3LaxcYoqn/GoY/DjQ8r4iLnsUv2IQUYTbUNVPItFG7XJc4oYdE2/unEFtdRrR5Z7T2No9824Ox3Kc4al/6XEjBY/xqJ9zeZvYSz/W0rJd6fMzf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414546; c=relaxed/simple;
	bh=oKhZRKSNDQsRxVT0JGr6nA+dxNnWA37kOR8/qGg6Q1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTuRZ5kCyuWo0Fml8hq4wNVmj54ot3Lj4qlnwdNidc6tUVpuWguqHCBdbK3IioXB4izf+Y56HXMpglSkGX2lCePK08u5UzfX8p3H8dFe9srGh2l2CxhdONJzzZoie+8wOgXBwweNNOiTGQKVdaMmGIg6yBbsx1n78GF36DZN72E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=nTWtNnAk; arc=pass smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84232e83ca9so1238454b3a.2
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 08:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780414545; cv=none;
        d=google.com; s=arc-20240605;
        b=ZUiwQbADEpCM8cbvW7DuJAHwel90EiPaxo87geLWlXn0O8WafUjYbe0SZ+J2ZNEusc
         7tEIhW6QpqBcYtRmerKq3xGg6McH/S8uAKIoOEQjgyGAXUWibSZYJH6NeYB6E/Kt38V3
         RcIP7P+QVENcc1vbgQ9NKgOk/dLfd1xGOATZeCqxiXrtfEZFc9NWehT9aaCD5pfj4DPY
         f2naiBUarSGRzw8nHSafyo1kNd//3/pbu7b0vg8zhNoae0d8GucXx2CpuP5jaumjpzB2
         0tPK7h6Wawx9zTx5G1z22TPK+RgAOqN1+GsTvhAMGjUM3JQHzHpird7/DdcHLSRRxgWV
         Jx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        fh=r5tqsLJzR+GwvwqqfZgowjJbi8GEX7+mjijK7tR1TRk=;
        b=JAFdsniJs3jNGBRX5iQP8ZMVMR2LUY7k/QbsI6j0EAPH7j+YPRObPj+PBe+HrSkeuG
         5tmw/95yscDJVlOhteAldZVJYoWtkRKFfzsdw/8GKxCOeaQ+owM3qSsA3hrHPyHVF5NI
         9KquhcvQj48u6KVV+UxmeuYi5noKq4XkxrkAXz/c9eM3jl9LR1t5nEeu7LIUVns0Dtaj
         BcGpQZXzM8NkqDmb5kqjma9rgNsI14gge3gb7UNZ3mDxsrWqsg/TL1SFLQYSp4keiKJK
         fYTjfztI1R7X2cXozAxCG53wLsZGsowxztlMRdaOS/YffadvhvTyRc8DI46mm1lGaf8u
         k/AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780414545; x=1781019345; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        b=nTWtNnAkx2IZWX2abNaxi39nj78ERcYHOQaia/o9AT0DuOcSJkDKIYJ4VnHqmaFVu3
         LfRcqexPGednanrxMWijK6dQdeuj7Pi5A3nx9YKv/CQclRE//vE6DIKj6d62tR4D0wuw
         zpFx2j9j+Re94WhP7QfWxYNIH03BJfbG/Q24E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780414545; x=1781019345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        b=TvjBj36aHUqsLkcV0hXycn3fEbR6H3wG0xnky5xRwcyDLIVBoai39COty/ROONvV/T
         hrs6qKoY2wgwIqhZy+ZRUxq1iBrET0+dkY9lgdSrAmxYbPQbrwHN+xCacxEwk2UCDAjd
         DWsMCBEcLOxu4cphLjdv+x4OXVr1p/5r4VLw9l9h1LT52eiE8PUgLJelFxckdtcJVK5i
         CKDBkeEkgxf5tmSWZwNPF+jtHEfh/KuUMJqcK4KkD+asAvkXg9E7fF0VBrUeHAdafMnC
         aVy2hv70bBknsw/wjJfDCBh8olGhI+sNx/mrrzuGdL13JS3Bz43DzlFpPM7Btd0pLvJc
         HnWA==
X-Forwarded-Encrypted: i=1; AFNElJ8Qv44ws8uLhvpTYUdSfysxDO0xaVGGaph77FBy4O0UatcQBF5O9FdVT1SayEtXG8XfIyZxhdkdqfDFLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ5bpC/IGp0zuO1r7QO3dA/SCPosu1t29+pNnsHCT7JjOIV7eh
	L25qT++qG/4qL73Xgh9sn7bcLle3DR9g83DdFvVgR8lrN4IDfGJiauUzCHDWNVgwHCw0IYRco4h
	eKUXOJz8DDcAyV6s8+Vsof0soIB5H5Au7s9S7BlMr/w==
X-Gm-Gg: Acq92OECKfFGDreUing8hIQxexHh52O0XHDvpuGb6L3srlAExUIR803LCBgeRxdeelf
	3iGMtA6jKrH71d9bY/Aj6boUCgiHntX04miN/jrDk0VG+J1T2lWP/qEKGed25ZXrA4020h4QB7X
	20qu40gkhOUpNIU/We9ro6yusd62nuIA2INRGJ2QgeO+UNilxpaQIocdeghQj65dA2r8cj4CQGf
	KxB6lPY5dTY8syL0SxyWRl91ZrhOQ57WgeXvkO/Cx8pQIBhZe6OVsd5SKO3rWIdR345z1Vg2scN
	VzFOT1vJwS/sONEx9NuGqPwm1Ts3PyWwqe29VGfXM+VwihK23nlfe2j+aaCU5f5/WCUOseRxQ3D
	fkneKLGFAgGhpDvzrzVPqqcgKcLSLj6scwXBj7r4hzVmD6YQr6jPXq6F6jn/byb2OljU3wZMoPE
	FM5E6U3VmYJA+kMztLKMNEwIG/PIKdTE9wqbt0pqigEEtZY0zqig75O+SI67o=
X-Received: by 2002:a05:6a00:1bc5:b0:82f:9985:d4a1 with SMTP id
 d2e1a72fcca58-84282f4be9emr114808b3a.24.1780414544733; Tue, 02 Jun 2026
 08:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601041336.9497-1-daniel@quora.org> <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org> <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
In-Reply-To: <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Tue, 2 Jun 2026 23:35:32 +0800
X-Gm-Features: AVHnY4Jsj6RGlQW4Ea0C-JB6jRZRFbYG2MvxlnfYpmwEKpWeXFNaNH003Nh9F4U
Message-ID: <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	"Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[quora.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63406-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quora.org:from_mime,quora.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 339D862FDF5

On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 01/06/2026 05:13, Daniel J Blueman wrote:
> > On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
> > triggers unhandled SMMU page faults
>
> How do we know that is a correct address - does it come from qcom
> documentation or trial and error ?

@Vikash, beyond your comment I linked in the patch [1] kindly cite a
source for the different stream-ID <600MB behaviour, and share
specifics, eg if silicon, firmware, or driver and constraint, defect
or otherwise, so I can include a definitive description.

Also good to know if my workaround is good for long-term, or on the
other hand handling streams <600MB is important/useful.

Thanks,
  Dan

[1] https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574

--
Daniel J Blueman

