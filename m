Return-Path: <linux-media+bounces-63581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9XTgKtgPIGo1vQAAu9opvQ
	(envelope-from <linux-media+bounces-63581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:28:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A76370B3
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:28:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Iumb1zB0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63581-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63581-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD8A630C7627
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 11:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAB444A718;
	Wed,  3 Jun 2026 11:25:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF51637418F
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 11:25:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485908; cv=none; b=tBS3pZ0rDVcCRxwu1jDJsLLobAo+NStbZb6GBbChducaXyWOS5I5GudlhcqjVJ9kOaao50L3ImHu8TgXR5B1EHRs92pwfD2z8RuGp39Sj/6T6vifmLXnaTlHZu67ZQdznyyRxZGr2QV0bZTGhMQ/V4EWf69c+zljjj7GSLIdjtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485908; c=relaxed/simple;
	bh=Qt1z8DWdfxc0Fqk7WcK4T9qBiKtmLR8z4f+GsVxp0Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOJrB0UZvmKHghS7dzhKbRPUKFcWt7jLFlicHTYqHa0NgTZyDUMw0Q0o8h+l99WSXoIZCM9Cipw9c4FQLkZ+heQexwXxzqQJCsV7lk2wI2yzVF4XS55Y9oInQwCkGi6GIeBd3RPKiWeyXvPjMh9r4v+mjoDRT2xF/a4Ai/JP4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iumb1zB0; arc=none smtp.client-ip=209.85.128.194
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-7dc73a56b5aso47907427b3.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780485906; x=1781090706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9LboitBmJDeKZ4FzvkUznHW0mYwQyqZQKW0C0dXa98=;
        b=Iumb1zB0mzV9z7odVRooCxKU54d9cpZ9+nObzbHmNlNJ3Laf7i1stUC8wJWupI/RY8
         ICXJhMWH9RjsfFjMGTLdLxeekAiK+MS3OOersqx5Zpjphw1bL97Wp+TEkmZMDvlb/hdQ
         9w61LgpX1D8WE3oSOcv/wn4xNlOau5mTk7GnTyF++tPe7F0+HXuFnRt5I9RcDLiCXMqv
         a2g87wAKhSLaCegS6GVp1wkiGcOUdq3aCivZ8PaJlV1wdC8Ghqcl1umBsAtVK89XuncD
         vi4QOsPLSFw2xYMQodvXeVVLYNIa4CQmcGOxpljXet9i+VFa35LTMf2CrfLtfP11aqNu
         7n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485906; x=1781090706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9LboitBmJDeKZ4FzvkUznHW0mYwQyqZQKW0C0dXa98=;
        b=RLAjVfINRopArgJCcqCEBkWHo1kyMPzjZi3N9XxdNl7k71WZZCmoIixM+7DKw173eL
         mfQiz12NC66f8ZVjqDKc8W6TlVfmnKkzNLXc/r6j2DrP/09Vlve5PUjcZrLyVKsc1aXc
         wiWWXN0pZXHLcF3R42Llw12If9krl6DsHpYDLbKcgT2azURV7j5f8aTuQ+hWlmG/I1FI
         d7OuY02yzozNz+BssE1X1nr0F+1zIVen73alfMPI7MmC9FnhJlIvYeT3YP2hqrxV7QIf
         xoH7fE/R22Rn4MCx7cODm86yIbNbBTAkuTPOKsLYVxn8wwMKaHCQXlBabTaIjuHmxAXD
         qtaw==
X-Forwarded-Encrypted: i=1; AFNElJ+plLg5EXwP3yJwI336vOPHdJnV3f7jKprfpplPimBLcMRBDnXhsA3/SlVEWHeCBCT/Lf+MkzbqNkXylw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRdnc5Ufjgl4D/zKY0aUbEdTRuc8B2C5+CeUP+ObR0V36oCDxW
	Bo/c/58yjVxZQuaHR/KYxqALNUG0+5Uk0mtbWAt65Ts/8DV/gJkXYdjb
X-Gm-Gg: Acq92OEt6HN4JbBtNrORjpd4odQXJFG2lZF5E4AJuZS7MM8h7nOyhJUveyqPT9rqCgf
	+0Lke/hTKbFKcGSdrGCH5CD7DQu1pHURUuAz13OqMjoChr6IGSuhB64gm4hehbZSWXx2e1AwA3U
	qtPtj7iuZOwa8Od8Wn/63Miq4pwXuK6WBdBRbVGy9ibMpReCW+NM5qzk9kH2K0IZLFlx+VvlohP
	/qAESMxPRmXuTc8jXZh2lGUfzIXYLZ/W97vgRDJ8xJWx1WaJLLZSCHk1fD7fzFhs+Aq+h6DYeRe
	qcUKGEbRKlA8yQuOpHzPnMp165ORgTxxQJhPKrQmfP3CfycsYy5c7kN9cuJlnRvMvKF/n1juSLO
	74i8f8pJw2zPnmGMjs8UtEvoKXjnlKe82veUVc9f7bd+Tr9gNOUc5W52woFVlwqy+vixTBiLCvL
	4jCL1WYrVLvSGDBp3sv9Gx3DscqmA=
X-Received: by 2002:a05:690c:660a:b0:7dc:c934:dbc0 with SMTP id 00721157ae682-7ea486cfb5emr27939267b3.20.1780485905964;
        Wed, 03 Jun 2026 04:25:05 -0700 (PDT)
Received: from hp ([2600:6c64:553f:f68a:e071:3df5:f6ba:868d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea23a97729sm14199877b3.36.2026.06.03.04.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:25:05 -0700 (PDT)
Date: Wed, 3 Jun 2026 07:25:03 -0400
From: Marlon Trujillo <marl0rd1080@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix typo in rx.c
Message-ID: <aiAPD4BakIF9ctYF@hp>
References: <20260523111511.865-1-marl0rd1080@gmail.com>
 <CAHp75Vc913Dgo_fzqBGZBaPB03De7V41dwd4uLpw9gvUe-+JDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc913Dgo_fzqBGZBaPB03De7V41dwd4uLpw9gvUe-+JDQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63581-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[marl0rd1080@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marl0rd1080@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 203A76370B3

On Wed, May 27, 2026 at 07:32:30AM +0200, Andy Shevchenko wrote:
> Is this the only one single typo in the whole driver?

No, I took a closer look and found multiple similar typos across
the driver.

> 
> But before doing that, invest your time into reading linux-media@

Thanks, that was helpful. I checked the linux-media archives and
noticed others have already been sending similar typo and comment
style fixes as well.

Given that, I can scan for additional typos and fix them together
with their surrounding comment blocks.

Would you prefer a v2 of this patch, or a separate cleanup patch
(or small series) covering these fixes?

Thanks,
Marlon

