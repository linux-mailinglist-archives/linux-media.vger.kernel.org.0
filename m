Return-Path: <linux-media+bounces-51130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDk0EPEacGkEVwAAu9opvQ
	(envelope-from <linux-media+bounces-51130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 01:16:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A91154E696
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 01:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8175090B9B0
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 13:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828CF43C04A;
	Tue, 20 Jan 2026 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dTMKrOdA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C863410D0A
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916833; cv=none; b=r69bqpAZw7QAZ3zUm+iDV0gE9+uGFHRyZghLRsnKKSfsKyB81Q2Ye4ZfstUGKrEyM0nEXWJkWF164UsjMRRv9zQf4dnd3k5GB+ew72moby1xeKgDzyr78udTF+TG8ZwA/lp4WCddryb7gLMkR5PazVv31sI29IfqSpVXUddhQZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916833; c=relaxed/simple;
	bh=WPYbjVjLawIbah5O6LiY/VJ2RpFkbC5QbU6UUNHbYIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moHUY7mehnoHXFmxqw/rRBoBwexsEfpGaxDnwyl+MbsECQOBS9YX9sLanp4ouPAC1nCLLNVog2CUM7/C6HbmJy5sihtXdVcA9lLh523+0hq6dCQnewV6Qsma9mTngfbJsgbT+yGMJGztsToxyZVU3xDU9UYhX10Mnw7MdrueqT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dTMKrOdA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b7073f61dso6617662e87.2
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 05:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768916830; x=1769521630; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WPYbjVjLawIbah5O6LiY/VJ2RpFkbC5QbU6UUNHbYIE=;
        b=dTMKrOdAcPM3Kqk5IA1IlIv9xE+OLtU+YrH5p3xe/4fjxLVo199NqJhn3SGI9jaPui
         Jvojtd3YPdu2qjB87hk9Bdva3sBBau0VNjQyb4y223k7ImZ2RA4fJcimqPgxAZG+0hWE
         UNMe1VJxEIyF3quHOcmxeFIdMwxG1i9PC9P/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916830; x=1769521630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPYbjVjLawIbah5O6LiY/VJ2RpFkbC5QbU6UUNHbYIE=;
        b=FhHvj7gKzq2YRMG9tszI4+jsDAlVhaW4kY7zCoj3tyRffi9QS4S+7JkBgseK0qOjHE
         CCkb4mkp1NjCsDWIOUJ7m1bCtIZXCk+OAlFwfzS9imOCeZ7kk/aohCLPViEvg6YyQAii
         MR+MftWwKu0IXEXeS2VWlEGry5ijGdEQQgDSsijREw8vrmY84oxoxz2uMmPuEonJPvyB
         cMyCIiBzH7ZUn5MOsMAqa8mU+kfp4/odBXA486c1MuBMXLpNEF1ohcCwgX6OdEnUe6B9
         FcfdW/ZpAEv3Hk352IbMkHZyqw5R0FJDRuRJatp+8Of4xvkkotbHpmUFou+c+r9Y3a04
         LVyg==
X-Forwarded-Encrypted: i=1; AJvYcCWedDboXO3pl3qDBRVm7SJqBLGo9SVER9+ZKAW4eXGZc0R7hDLzh0rUwoxWqqtvL9/w37t2/J2vZt9sEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK2ocDnS6+PJvWbYIBlfc9MYSuxVhNJ5EnWpQoMBMJ43HqpxMS
	65bJXbTSoa/YDIE2BjT2Ia2IhWL8DHJ+vtL8jN8HRLTEVtuQOyBpggepcw6XIfH9yA0xfKA6rvo
	Gnas=
X-Gm-Gg: AZuq6aLos6vs5DnPTllxm8PKfZXUWL7O6vYrS/Imfzzv8B85+gbt0vBPKUZBMGcKSHr
	Y/4ZjNDN4LqGpgAM8ppYtaWBu0Bnt0/7q208qcFioH1a8XNim7nPhlvpYWdgwZEcYpQRaDhsgtH
	V8BIAIzc+meI9QSlt3RTzn329IdcTkadWyPUu1OcuaRuxFcAH+jNtCbTR3pqZW5LZW5QeYDW9Es
	Rvx21GPpZQV3m5QqhKoO02d9MRF0nIqziIcQ/38rl/iAiRIQpJLon3KQRVV8d6YHusnNhC00i2M
	dCfjtKFG5VFnbHVOri7NB1yZ0YAjQokArs1oQxtUum1QGx6LoulMRrsabHJAEBmTk7xBVQ0hFqK
	G3ZC94JHl6GhN0CME+QZB0WlnyXsr1ZrcqV7pgp7tNz/2hkCiIWBn2+A9MFG7TTPJPBrfTTQIcc
	olsdJ3ErQalUeYte5xbdKHYuvbPUt8nwj7JbmxVRHiDiMMpUTb
X-Received: by 2002:ac2:568d:0:b0:59d:cd7a:b6eb with SMTP id 2adb3069b0e04-59dcd7ac053mr168518e87.5.1768916829932;
        Tue, 20 Jan 2026 05:47:09 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb94f6sm42366461fa.49.2026.01.20.05.47.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 05:47:08 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b7073f61dso6617592e87.2
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 05:47:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIxrJ56iIkcR4/aHZ0syPaPNnRWvS4xZA2alXsFPFRWQInWZzTRO8MaIe8RnYkCNp/3KmkR62ttzjN3A==@vger.kernel.org
X-Received: by 2002:ac2:5b5a:0:b0:59b:b039:963 with SMTP id
 2adb3069b0e04-59bb03909bcmr3524309e87.0.1768916827368; Tue, 20 Jan 2026
 05:47:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aS8YBLEPwF0-NtJO@eldamar.lan> <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de> <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de> <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de> <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de> <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
In-Reply-To: <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 20 Jan 2026 14:46:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
X-Gm-Features: AZwV_QhcJhsYEtASQyqTvxfiHpPRR1t_hSZ4owuCB13wEH8SWQ5tKj9_SmrJt0I
Message-ID: <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Ralf Jung <post@ralfj.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[chromium.org,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51130-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A91154E696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Another update

Zoom has notified that they plan to land this even earlier. In 6.7.5

Ralf, if you could confirm that it works/doesn't when zoom is released
I will be very grateful.

Thanks :)

