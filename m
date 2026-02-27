Return-Path: <linux-media+bounces-53669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGZ7DQxYoWldsQQAu9opvQ
	(envelope-from <linux-media+bounces-53669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:38:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2F1B49F0
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D72B3052AD6
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22E638BF78;
	Fri, 27 Feb 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRWuw9/T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3768728150F
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772181507; cv=none; b=n6Ws5CHI7hexakfqRBIwmo9rRPr2bXNcBy7mvEvgk735N91VTkhUefESFbF26MIAZKbryFBrGoW8WPXKa92XSzGnag7fFY2sHkW2zHvExbcb8C3XNehMq6qdYOCHdzgxjSPit2RVvMLASSLziwORvt71RqUXITNiQIUzeATKd0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772181507; c=relaxed/simple;
	bh=B8/5bI+d66y81V2rFiaH4FWnj6qjMkY7SACemFjjFkQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6VY5N6FjfUT0JXoz74CF3ULjwHQ7q78cDcNF4f/FYROPKNpnPLO2jKkVDhRlQ67FFR/5ZVItNg/ID7nlKWk44D/E/xUuvtocqMfAssfrt9v0/nUXwu2dpPOqxtHj9zuaYe1k2SRh55XRLj3LGUqUWlEeEQYaxeDiMrqi0YFo78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRWuw9/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EA6C2BCB3
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772181507;
	bh=B8/5bI+d66y81V2rFiaH4FWnj6qjMkY7SACemFjjFkQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=rRWuw9/TnLwpOnG2Dpa/ftMLizMNL6RcO4Fp7w9HPl1gDrgoIXsuZRVJ6muNILsPc
	 WTjb91b2F65aXORG6g28JbNgIdZUHVWHJCAYlCQB8eDyHhU2yeJG1YJp69uC4e/CwC
	 C0WF8d5iqzKBJGc7+Qab+/E74MhB/O1WKKr6mEg7uf7NIV1JZyKDDlJ2rrXEWD+ary
	 1INp5PzUpApixPN78wGg9+v+Eh6SP0OMrTYQVbJy9DjJjxQvsYdEOZ+O/rczHUzo63
	 cXpJVCvz6/uOeaet8B4gG0IwxYWqKZC01R4d9xkn15DBakmkYwAbstEp170PWksfep
	 hGiLJ/2BmEn+g==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3870902760cso18848541fa.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 00:38:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVgvfNOzdp0HfJfXFjejae4Xxs1XoQ6gQVjM0E0a0rRdjVLWcKSY4CBIPa87bNaJXSbmipyQrBIVcKGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywOIIpitpxYctZjk5Tko324sFwpYx31fF1ukort+eRSeG1BPtd
	zwLT8cqkIMfgs20YI4X8ZM/5qNuYmfONTXGE6wwmjGIo0+/rCuaB17KwMPu8qrFqP/DsuM4efDA
	iLZR6nAwV5Oa46yRnWqSYE4WqWAmvEbVLwS032JgHEA==
X-Received: by 2002:a2e:a10b:0:b0:389:ef35:fb9e with SMTP id
 38308e7fff4ca-389ff15f2f5mr11325631fa.24.1772181505403; Fri, 27 Feb 2026
 00:38:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Feb 2026 00:38:23 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Feb 2026 00:38:23 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aaCrT1SvMCIKQDmc@ninjato>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com> <aaCrT1SvMCIKQDmc@ninjato>
Date: Fri, 27 Feb 2026 00:38:23 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
X-Gm-Features: AaiRm52Yb9kd_att7B9hKBtSpFgOcTtzo7FDwU7A01PqlXP6UIrlHqDUHcGb-x8
Message-ID: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-media@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53669-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0F2F1B49F0
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 21:21:35 +0100, Wolfram Sang
<wsa+renesas@sang-engineering.com> said:
> On Mon, Feb 23, 2026 at 09:59:29AM +0100, Bartosz Golaszewski wrote:
>> It's been another year of discussing the object life-time problems at
>> conferences. I2C is one of the offenders and its problems are more
>> complex than those of some other subsystems. It seems the revocable[1]
>> API may make its way into the kernel this year but even with it in
>> place, I2C won't be able to use it as there's currently nothing to
>> *revoke*. The struct device is embedded within the i2c_adapter struct
>> whose lifetime is tied to the provider device being bound to its driver.
>>
>> Fixing this won't be fast and easy but nothing's going to happen if we
>> don't start chipping away at it. The ultimate goal in order to be able
>> to use an SRCU-based solution (revocable or otherwise) is to convert the
>> embedded struct device in struct i2c_adapter into an __rcu pointer that
>> can be *revoked*. To that end we need to hide all dereferences of
>> adap->dev in drivers.
>>
>> This series addresses the usage of adap->dev in device printk() helpers
>> (dev_err() et al). It introduces a set of i2c-specific helpers and
>> starts using them across bus drivers. For now just 12 patches but I'll
>> keep on doing it if these get accepted. Once these get upstream for
>> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
>> drivers/i2c/.
>
> I applied the series to for-current but squashed the user conversions
> into patch 1. Changes are trivial enough and I don't want the pull
> request to look excessive, so it can go in smoothly. Hope you are fine
> with it.
>

Sure, do you still want me to send these changes in separate patches for
review?

Bart

