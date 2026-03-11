Return-Path: <linux-media+bounces-55288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJjHJ9fcsGn7nwIAu9opvQ
	(envelope-from <linux-media+bounces-55288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 04:09:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B825B4A3
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 04:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A7B4302C513
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 03:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0359F3542F3;
	Wed, 11 Mar 2026 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0E+zW02"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE082620E5
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198544; cv=none; b=NYXJdI49KpGGKdLA9CYpVByGos0XvnHQMgqytLBRegeKISIOgevTAbCMx5u9wZg5X2OCyAb6M+ebtp56Hxq+uK9WvEh11dcFs5XIc4gmXFZwW0NixyXJJYNibIWM5Lj/WIz8c3q6Vi/5STB7Yk01eOwf/u+S2wwq58MteoMHFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198544; c=relaxed/simple;
	bh=u/jNIUZhr41eDTrNMLH71SkHE+qL5MzQDQyDV9jlEA8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cjTCueumnc4UomgXz6e6GihX7434pzi/CAczVK7LWmI5iGuVrfg/4AScsL2y/YnkLNduHjbBgSM9Xrv3PpTZA4xiLRyLCGcI+uWTQw97ZN+ao5lSDOG81+bTSC2DWExvE9aJVZ/1ybqKKtvwWDpyxgPojvhddp9zQi+bgx2i5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0E+zW02; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64c97997b0fso9672842d50.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773198542; x=1773803342; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/jNIUZhr41eDTrNMLH71SkHE+qL5MzQDQyDV9jlEA8=;
        b=J0E+zW02TuQz4pXopRRi5AIjjBrEZGkgekpLJduLuuzFi6IC3e4269sk+l4H1KHkU8
         fB/sH66Jhp2HAuOdfOOxjE3QZVOglQEOBzDvgi0MewzQ45/w2eYJkO/h10+wNuFoLHXG
         BmHIq0FKTqRGLmZZiy+Leg7JY9Zfb4ko/lorFuiXOzl3hWKq4eexaApGf++5nbQ4haaK
         sTtjj3lNsS7rtKcTlkhx/ZmwATrzlcnveltqhL5ZjSy4eQ7NRVUd9gYw/17Nt8Na6Nmg
         8yQg4xQc8+ZaeHzcQFq/8Iyt/Vb+8eCCT9MWmGYWeZvaGXKqm1ENaAbLvsSKgv+1n7GW
         hqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198542; x=1773803342;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/jNIUZhr41eDTrNMLH71SkHE+qL5MzQDQyDV9jlEA8=;
        b=qZUSTdEjQaIj2ZwSOFIpuXzIOhrk/C5evwsSLU7lW8Q+BVoKyDHCetR9+PvL1ErbBA
         5EY1uOcvk+uEQ/cTbfVIkXn5TU8vFtY1FmKArWw7eDYHuIZ1VxlxHG6MgAVf4bXn8eFQ
         WiLFwIpwQNpBRpmn5WkVe60Vkndkm84ty2REkfs+A8YhtBNUHB17YgZtdpA5V3bM1OUv
         kYVJXymiaDr6xl6s/fnww0ZPE1WJ0nteSdADn4Ft25YZ0nn1P5nhhLKm13uMOniT/Rro
         mEY9v+hUmfNiWVoZMP6ADj2nlY54u8/s0fti5Kpy0sizbYQ35a4gdQ3RifzJQUeT2BDY
         wVJg==
X-Forwarded-Encrypted: i=1; AJvYcCUstcgN4IbVotnNV6rslSz4B2f45mdUxcJj2ctRWkNaMpp3vH+NbbCiwHBFQYhaEpSdJpVOyP9dTAztQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYfZk7jcpBgg+xFUalqDV/JGhX35uASvWL1yoBdDhdeoKFj47
	rhFpTzJsii/sLGJLWcrKi7QTrjLHHddMqIMhLDVpzTNCwn1uLNXCe6xr
X-Gm-Gg: ATEYQzxhT4NoFWg4KbWKghOQPai54ABAUITrG9FDu8pFkviK9Nlk18GNX2ErdaOS2qe
	BELF6XgC76NHOeDKCjb6BhA/FAVrGyfXX86zMniI9pB46EcmKRIn+Htg5Nu8LxwJaDkARiDMG3r
	aTqhHLLk3aOtl+xQtxxcD8mGknpBb/+cicpoJhiUV4wxlWjEZXr8TtpBBtUuk5Ufa8J2h+o9ph4
	jNSO8pgJtBKGXj4R0Mqayl3QNGPV3BDJJWRb1DElJA3LD+SVRv72Zh+4G3htwygefPK4gwx80LH
	wkp1Rile4J1+iiKHFRD/duRodnd86JRDTB8dkWx74JG24nUAlAhYFq7GD8NKqDmHb3FvAg5/YVG
	6UiQBIkV3wPTvfo44B9kE10OOudfK33jwT5krqlySsZsZhwfyakD8DNcMpnLLc+jd48kHl4+gyS
	wU76ZF22OO10J6Y6mgUmoEcVVRAZLKU77eKwrMR+0Otk+6TCjWhKr1907ZsnOuIs70+rzsQwjBu
	7/+yHk3h5p3llNHHSoYjcsVKsI0bObZH59u/Rsn2ha/9oS5QSXrLnxxOvIjpoP1zxcNUw==
X-Received: by 2002:a05:690e:2558:b0:648:f57b:d07c with SMTP id 956f58d0204a3-64d657cb7b3mr609053d50.50.1773198542334;
        Tue, 10 Mar 2026 20:09:02 -0700 (PDT)
Received: from localhost ([2600:1005:b11d:678c:cdec:c045:5f40:fbfa])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d6515a2b4sm630188d50.22.2026.03.10.20.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 20:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 22:08:59 -0500
Message-Id: <DGZMF7K42X4O.109GY06JLBRFW@gmail.com>
Cc: <sakari.ailus@linux.intel.com>, <andy@kernel.org>,
 <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: media: atomisp: remove unnecessary braces in
 single statement blocks
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, <hansg@kernel.org>,
 <mchehab@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310203646.8869-1-rayfraytech@gmail.com>
In-Reply-To: <20260310203646.8869-1-rayfraytech@gmail.com>
X-Rspamd-Queue-Id: 974B825B4A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55288-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue Mar 10, 2026 at 3:36 PM CDT, Oskar Ray-Frayssinet wrote:
> Remove unnecessary braces around single statement blocks throughout
> the atomisp driver to comply with kernel coding style.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

$ ./scripts/checkpatch.pl --strict -g HEAD
ERROR: trailing whitespace
#201: FILE: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.=
c:326:
+^Iif (idx =3D=3D IRQ_N_CHANNEL[IRQ0_ID]) $

Alway use "./scripts/checkpatch.pl --strict" before sending a patch off
to catch things like this.

Thanks,

ET

