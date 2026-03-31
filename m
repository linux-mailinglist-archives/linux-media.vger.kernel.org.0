Return-Path: <linux-media+bounces-57761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAlKM6uey2loJgYAu9opvQ
	(envelope-from <linux-media+bounces-57761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:15:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC81367B7B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FE3231741DA
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5AF3A75BD;
	Tue, 31 Mar 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g0r2aLbm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075623876B3
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951728; cv=pass; b=lhXPT2Ctv56BGdRRQe4A4p4o/pHfOaiow02zjce0AIDsTjgZypaoumjMl0cqeBV20QBO9KGLvUeJncpOrN/g25FxQB6ix6FzWaAw2bf/XRXDQTdSM9hOTap4fY3vSlXJ7JM8SuDzvzmJM02pcucfWDM/XDU+F7N91/2lpFXmun8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951728; c=relaxed/simple;
	bh=f/WLCNdrI2aO0bJOoxKfEVxwtpZr3j/y1PW6518vMmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWA/kVT4v18bAQ3iSEO5TfkUn5vVEtksZchdnN8ExnKwIUis9uq5BO3NNgulM7DnNW4t05JJ+o486LdydhbTnXp0N3m77TMijDUfyCux6hXsASJvsUmKL83dTE2tgTSgV4KofXQbwC2r3SOPBsHgpiyMONyg0rUTwByh6pS27b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g0r2aLbm; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso5156976e87.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 03:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774951725; cv=none;
        d=google.com; s=arc-20240605;
        b=bo92A3oUbnf1jSu2SW0VUU593Iyu/ZsKo1QahRSTgw/onPHN5mCPeHPJB8z2c0Z4G5
         /sxmRl+5FMsCYx5RhNUeGCGmeRlLCclQfH/izQllsAIzhdUnTrxabqjTAgujTTiHB2R1
         cLgOsUm654pHxNGRpsHex2i9ZIY1mMKaK73K2MSGRNgR6aG4hGtL4opXyFknOXKj2wKA
         JB808mQKqNANppzTssTXPujyyQgzw2p3LHHwxt+7zCfAnbKCr0Cf4hj1HVhDW87rIkFT
         4rHZPh2kGxxZ2oLfJzoFdpoGVzfx7S7RaF6xrGvlffPmhqgySDyg9gOWDl6POBqUiw9c
         Jz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E5/VUShby+mhCUNgIKoCyeU6/dFsjbg6pF0Qw7m2974=;
        fh=HOBf3PviL26RD6YY337dDnNc6x1UktqPkLXa+DcTKbs=;
        b=N7JzQ5MpzVlhljOa31FKV4PeA6JyQFk4U85EJh/IoGxKRh6g6ZHe/Gi1tYnQe/QHaE
         bxJfFY6brPUiJOuQ5N8AbToxOkVpAFH/UpFvzS6TzGxhnZ9LxMTHR3VoO8JKeRi2guRg
         5EhezGzXLBBBC0T0vmu2FBNkNBZPNSBUOhN2IcXqsSolAuAJVRhxeQ74ZR3c5NJs2CIR
         kKzcxz5v/L2IKNG+/z1XGYZCwQu7HtZIdP8N9Arog9ihzcD1Kw3ALO65+cx2uhIj1PLY
         qbQzz0DLXHaHbEwcg5xvdpcTEYnyXSdpxdWIe21q7GNQWtf5oI8RULcCwWQRQs6BwmDG
         hjLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774951725; x=1775556525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5/VUShby+mhCUNgIKoCyeU6/dFsjbg6pF0Qw7m2974=;
        b=g0r2aLbmMKvTX0c5RPgKYWUsn3n/itSC3F2LlnT7Yzke0riwiSWJrsK+7XtgobR3A8
         WyKA00F57kN+oT3nnL4lEUrn1jVzGwtHzsMauZExAooZCEOe+I8RTwnlsMsdQEgWaKl+
         n7KyfUOwXowV5JCnUKm/fjSh47pGthpNTo6hablcqECjVoxuupm5qCgp9I2hYWFrkadg
         96hgquZ9bGbClt+wGm1tuw8srWLxsiBI2sZ+vexvhzJjSPD+mWM0I1JYBHDJAO4AxnfI
         8B2ZYxNoDp9Ixc3vtouaVQJqyvs9VKGMriw9pXSHJEAnsFerZ2zc86vxJmzWvtdB7bfm
         sG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951725; x=1775556525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E5/VUShby+mhCUNgIKoCyeU6/dFsjbg6pF0Qw7m2974=;
        b=OyYJewqmc5KABUi8xZb/LaTawijzQvolepaTWMW2Tlcug2rGiIFHhvxMRA1Rd1+IGu
         W1bJsz88IB01pEQ+M2ZETDiRdbtBCUE90m+/Lai8bLOmX/BGQcKZAHdsDUJJ8nJqZvzQ
         2pzPR1dFbpx751y5Mwh8Fux55WRqu76OtQWxdDm7DdT2ZEEsYSCLTI4upSlb7CRpuKGe
         VEf7tGXVVB/VnyAwy92DJiALLuqBCni6nxHp1Z/K5LfB6CD9xT+LCYkkR/7/ZqaCPvX8
         FSFJCkgNEsJfnb3zsBmS6Du4JaP0+ujwVx3bWxNWD9zAmwUZ9hFDMi9hatqfwB+9Zcif
         U4dg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ82B5OGjJbB20yZOqXioU3x90CQee3Gk2AJcBng5+n92wNHMPj6uS1K/YhzCPhq5b7izUHkPdiDQ/6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4afHionrvI/AhhKMpUDuVTohNwE0aGugGO7vglF1aY2PLk4i
	FW2Mo4WSIgB6x4Z/fb2qMyg/CfboYDWTsYYVvUkcrAxaK746CqwOyN81LhRNSAISHajPybg8c5g
	XT0+XZX5/jBIIYO2Mmi2LEduWUWScTN+PbTf7nD44gQ==
X-Gm-Gg: ATEYQzxUid7Bhm/0BJpUiz0/CqNEFI6mDDnBbU4LgPkYmOxUDW5iQnqZesvJnXkqYqv
	phmfhRGfesJCoCQRK+JY3rL7HR3hHcZJcUDl18BHB3QAkeyrRiL7vuSyCCfindTE4XPfOX/b7Gb
	zljhuV7iH4kKLOQq4ItTM3px+LEQ6YGo+g5c8tgIvWUps8gNlchHIVFOZN9k7V/hnru4rhUtJ3D
	eU5mkdliYXewzx72ZtoeviKN+jtm4SVLdmBA0wuDhW8/K1jUJGgx973yLQJw5EdIJxcAUykLhAg
	49tjf95+5VkuHcU5Gp/AecAf4NVlXKE+/AfkcSRb
X-Received: by 2002:a05:6512:3b28:b0:5a1:3b7f:450e with SMTP id
 2adb3069b0e04-5a2ab93e89bmr5308331e87.42.1774951725167; Tue, 31 Mar 2026
 03:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113140446.196930-1-marco.crivellari@suse.com>
In-Reply-To: <20260113140446.196930-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 31 Mar 2026 12:08:34 +0200
X-Gm-Features: AQROBzCjOmusGhi8mOFkzWopuZY3oKoMkyxjwh0Ph8WMOZzlEADoG949x0POAAQ
Message-ID: <CAAofZF50LAD32LWUBjg3YL11+U5UcQyudOZwT8m6rqhjL7aaxA@mail.gmail.com>
Subject: Re: [PATCH] media: platform: Add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-57761-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: 5FC81367B7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Jan 13, 2026 at 3:04=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

