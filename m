Return-Path: <linux-media+bounces-62224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKFpIolxDWpJxgUAu9opvQ
	(envelope-from <linux-media+bounces-62224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:32:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59D589D1C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6E530C9558
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7D33AE6F5;
	Wed, 20 May 2026 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sc2iZRXU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C452A3ACF10
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265214; cv=pass; b=PetODH39Z2kONilgWcANBOqQjB3crrCvSthdBR9BPzTAjt6ShLfswK29sYbUNbYEPM+TRjkb/q6ol8mmGMmrIOiBCbx8ChKwrmfuXultKi6b1GYMTcr7EGBvCbBGEIMWV0Q/X8csyRkWVsbFCORB6UUXx7utlPrqDGI7xpwLuBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265214; c=relaxed/simple;
	bh=OU37kWHpKnGebk33oJbZblP3VQCf6KgSSBs2dqQgkHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eohL32NTGHlrHlrufllSFlLDoCxlzgXUd8pirmcB2tgjhkAOK6qRZQw3SBWXfUkHmRJe6K7J0IKy2efgVj+77Ae1skt2aS/IHoZZ2VrovYc3UlyUHtx/QrBAE/OZ+wXyDCZ0b+1kaT6wpcJ/o3uAlWRkGoYEYzmaDlq5Q/Vjdlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sc2iZRXU; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65c305f381eso4766695d50.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 01:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779265212; cv=none;
        d=google.com; s=arc-20240605;
        b=ExabzVv1hZhOFniqy8cckZftxlJRYdjGJBZuBHjc+0uK93smAitMmC8XVSXXduM2gi
         nGQatkuVTSyUpaFy9owp/997YLrs5RzkkBqXKyW+bPlRght1luHKrdbngR977H5UTOYi
         MO9daMwtUyk6ZPqKeZ9EhxK0z70j964vfYFNGFyvimSqXUII9hYI31aTSXKLpcMcOOb5
         Kr9WV22KWnHY3rszo8CDstsxqv7DyPpbXdrkSrAOX0zuKJJ0CROi0/EkYjiUmELuV8gI
         qWgeOsNDtmUfwzT5prNMH2LbDoIOw/FMTPbVbCfTIEPHGIesy3IFGnYDgRFCzDgDrJl0
         P5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OU37kWHpKnGebk33oJbZblP3VQCf6KgSSBs2dqQgkHI=;
        fh=tfHQjlZFlbASyszKqQHur9dq9mCK6cHT3RxBwBozxB0=;
        b=BwCqwS/Cg7u/NQIEFDkbXLnVHmbI04Ykd7SffovzLG4sRnM817zcQ3ElsPKnDzD+Kb
         7Y1fwroLeZUpCfWeI1yrQrWn1XotV0B6Zb5lRyhmmp0tCDtXTzmwqIrgI5GQuhwyrvwp
         O+ZhAkO8AKoHqPovbWd+qgyK5x/gv5DEuROOi/FFuHb7G4my9l99gSaROfnn/Beven/5
         yDbxZecp6cGyRS1TXTogjteOr5K0lCOgWsJ5cOiJMm+c0ckcx2tFZuwpt4hfvfur8SE4
         enlBLQNWa+slLkFiWdahzNS1eGLTnP95BdQxgrxvBuMfUhyF6/f1kF943vPWKG5QY8v6
         YXGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779265212; x=1779870012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OU37kWHpKnGebk33oJbZblP3VQCf6KgSSBs2dqQgkHI=;
        b=sc2iZRXUGF0QEh1Sbs2tp3AkCuds54mVp1EKF/lp9Cx86SpUoOV2CXO/r2h7pMYMM2
         VOLEJZINFzL6fSXqe41bdTUii6IEuu4li2WtCaQGASM8UuJryqRtBrirad73wJrmXVyO
         QtW0pXSQliWAeKOGGr1MDZNoqxPaNGecPZygGIIBkSyGQw8RDvrEXMY20hobmPsi2qY/
         0bvAbeXiI8Wbado3kzv31+jCJCnMg/E/Lx/lsa0FYLv0HHqu5VL5fsknqLHTUbok+9xn
         iTeTQMv/l+SNOPFiuEcPKobdh86kn9m9iI/INzUQxE6eBovCK5qqayfIJTt0sWks3TpX
         TBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265212; x=1779870012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU37kWHpKnGebk33oJbZblP3VQCf6KgSSBs2dqQgkHI=;
        b=mWnLHgd8ZXCogDTLMM5G1NCVVyZNVVXiOBcOjO+SUn59bumhe/l8wOyvA3AiApCW1R
         /4bd5d7fuNYxSqEW6avnBWYueAggzukEXvV32Nl4mCZBYtK3TD/QIhBbyNhAH7Rhjylv
         JE8yMJ3yBKEFGC9EEL7WEt1IML+3nSM28NYyiP7WWQ3+XTNXUeuMz3n8N53aNQnFmXYW
         3wcIpNKx5DdZwWFqD7GP2eaKsJ06H5ijZEE0tGxc+XoU75oUE7cKnchS1xcgVjnaHpBt
         /kTohlYCdhhc0ik16cehtc8RsU1VGD2mrRgyKujMyFbCIzv7XrkVnaex8Ayn4XdI8COB
         GB/g==
X-Forwarded-Encrypted: i=1; AFNElJ8h+3N8f45t5pB9buPV/iyKSzSaBhtY2N6KCkVKyBl2A1YHES8Ollu9loycBV7fWpSkft6MQZ1w55nJOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOvnM4zJXsGex3Vnqy4yPNuTwmBCY1uvVaPsfJvzZcec850Oj
	Supc4xo8g1y0jGl1nnN9M6f8Sp5eRZzY+MCNJtX/F0FQ+AYMtdqBMTNrQzGviL3gXp4CLYyqTn4
	KMkH3H1sD8QlYJME6A9Wt+CroNzPBXdI=
X-Gm-Gg: Acq92OG0A/5ZbKvaC/zap7bYvztv+n1HYybjLT7pa7d1QY7j6x5yzPfglWpYIknmX4u
	OFeCQ/P2EL7ivbgG8jVlcEFvlRLy/LygWv8D3Ya86Yi1scruKCgRZXDnFfaGc3cRHnAXrslzRkh
	PO4EoJbu2vGA32c+3AY9Mokd3vKemFMetSAAolyUbWXGaLv4BB9/7tBG9jDm5o7RuouPIYTAWBF
	rH58Qy91yeRszRcLwUTJVoCTx4sJPsPLwnufNrTO5JGY5nRTciMzeK5JORENs7ysnkehAE64r2M
	WEszES/9
X-Received: by 2002:a05:690e:151b:b0:652:53cc:dfb3 with SMTP id
 956f58d0204a3-65e228513e5mr20681922d50.52.1779265211742; Wed, 20 May 2026
 01:20:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com> <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
 <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org> <ZdheLnLujnIRGAGLFiz1lwSwxaUCArec6sbk_VkixDGjsuPYnMT4_YCSMTbwBWI5-b62G90Qia9lQ90pyFvjBA==@protonmail.internalid>
 <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com>
 <cfb76181-4d59-43b3-a45b-a344a71fdfbf@kernel.org> <CANUHTR9OX4KC6djn=wdkwAhiB0zqFEHFu3jtJ-+LdixgbB-OUw@mail.gmail.com>
 <28fac01c-2b52-47a7-9fb2-3b0f27d7e855@kernel.org>
In-Reply-To: <28fac01c-2b52-47a7-9fb2-3b0f27d7e855@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 20 May 2026 16:19:57 +0800
X-Gm-Features: AVHnY4JFYhDcboZ-txiN2rLdRZAg_DabCsavN5a2uQWoMBdLRxWXAdOi4lGbTvY
Message-ID: <CANUHTR-Ct2+3Q6DMVaOMn7bLYhEDUaF8s0Q_MHuQk5TnhXsZcQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register failure
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62224-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 1C59D589D1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,


On Wed, 20 May 2026 at 14:10, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
>
> In patchwork I'm rejecting all your patches that change drivers to 'fix' this.
>
Thanks for the clarification, and thanks for rejecting those driver-specific
patches in patchwork.

> I'm looking forward to a patch fixing it properly in v4l2-dev.c.
>
> It's a real issue, but this shouldn't be done in drivers.
>

I agree that this should be fixed properly in v4l2-dev.c instead. I will
look into the __video_register_device() error path and try to prepare a
proper core fix.

Thanks,
Guangshuo

