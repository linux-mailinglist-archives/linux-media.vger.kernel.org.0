Return-Path: <linux-media+bounces-64541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NawtBDNfKmpKoQMAu9opvQ
	(envelope-from <linux-media+bounces-64541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:09:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34966F41A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:09:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WaJHqDT+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64541-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64541-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DAFB7300A4B0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B313732FA14;
	Thu, 11 Jun 2026 07:09:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB504341068
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 07:09:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161776; cv=pass; b=O0umqgxOAkGWGqbIVz2h0xPu6vXZ9d1uY5x26d/B8f6Zzg6771IgTGAqV1NmGrcCjaaKo2/qn9CvJ6DFau8aHfqLMTrL3mFNgVhtDPMt85b6EIlpTsyuDmgYL0Yj07PeQZo3fvhvHcahA0aHVEnQdFnKlzLwnKCCH3Kg+BZTGOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161776; c=relaxed/simple;
	bh=dGvGqRoFKYFzpdxnbNfrKTylPVm0ZUcjOIeie+TXgWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlPdHirFjAqtr11IgLNvAUTFRusVlewQjcrSVadRt0EClu5jId0aXDZ3VGAcpr/1STwZXM6FuDxaMK/6yvEnHgx9omDiSk5DRtpPM5Q+J2ciqkOyPgK25hSSlKDTaDcJzk21AWOjXJcZslZSC+lDC7PwUaXCHsEE9HEw90KkPLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaJHqDT+; arc=pass smtp.client-ip=74.125.224.41
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-660e9ea26b9so8136680d50.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 00:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781161774; cv=none;
        d=google.com; s=arc-20240605;
        b=R5u/tVz7vjBwzLX1zswx0T359ajVd+oZXkrHTEibGizNuHNCSx6lmaRTPexMTEhDcv
         xzQhNrdm/WBbaewMph1Ke4p/h8hp0eGAw7BfBJdyXAAfrn4gAiCX7DRj52gp5FMP2qn6
         5ANZAQwEdHTMmK5eewtmWXjQB0JexfQ9XjV1XZRlwodMZdgexdG8im+390nIdrIxqXpD
         RQS3jkMjXBBRUQfIRZm+OYT7otH9OQgkaYxqNwtHLPow7FW4XLzi9UbQZp4i6dxObPii
         dmDSYsUNGTel3dJqSDMiBcWeQLuA5Y3bw21zT3wkb4uPEKZlUdHMzv51GpjnNXfxAbNF
         yPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dGvGqRoFKYFzpdxnbNfrKTylPVm0ZUcjOIeie+TXgWo=;
        fh=Gke6Q58fS8AIqvp2lZwwturtUnt2JVUP85hw/uRt5SY=;
        b=Zw85N7gJ60aXZs6qY06SfTlJto3NKJUi7M/fXTTmrDMgPOkLkc4XmOhzsGrPvRNQLp
         34lmoNYTimoDlV0chTEDvyhTAqCdEQ6bRaxNHgmpZOCab1PHv24KArow0D52bErmK9Lu
         QQIw7HmKljwWpUtLE2Sk9Mb7EeLMRwUA1wh3NXLxivhMtafwpAFW8EHBDG0nQ3+YTDFb
         +cMkF30AD2i4xsaUxcYrXEc2ASXOpYupNaAoJiy7/a8vGIw2cFSgp58IPJ4rjHIzmuzC
         gVEGji2T2R76DI1sJcqcTTListznxaO45Eaq4tm8HlScsdShdVaGs8r/Gn+QnV3/6iTd
         Pq7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781161774; x=1781766574; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dGvGqRoFKYFzpdxnbNfrKTylPVm0ZUcjOIeie+TXgWo=;
        b=WaJHqDT+x0ABJBZmAnOkafH0u7fUeEXkjvJZ6032jkhlNPEe8aVBXo2yA/7D8UvLyt
         GcY0WN52bobTnUry4+dApF2H8G5k6GnPc7qRBaanaC0d7bi0NbUDqewOmrqquiorvGd8
         Q78NXzvARmrjA057fCwYkjnO3wmUy1GeMvBz1U9jASAhE2DKOB3V6LddqzixJ9WOLL1y
         UEIW8qOsan6mULzvBxCcb09WDgW6ZlWpDCdYgcI8Kqx253lDdRA0huGhE5hrjmeKV3DH
         GvOqWX+kriRRrhlTA2YyRIa77Qv6vhy/hI2RJiF1PfRP7cArOe+HotIKa1CFE6tnuO87
         hMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161774; x=1781766574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGvGqRoFKYFzpdxnbNfrKTylPVm0ZUcjOIeie+TXgWo=;
        b=bnzkZBp9GjemGiqvMFk//Gv5ssu+d56KHIuS96itPZzcuoPa2GMvwI+1yd+9jz6tnQ
         Cn1kCpElleIrhc1/cpeQka+S5P1h6ghNWwlH7vvDdZZYtyDCqIcJr9C+ql7esyV6zgSb
         BNm2yEf5YEzZGx0zr5lcV67IpVdTFiU8BsjUxzghBTNlQn58ngB4Hrr7Yc22L/5C9XV2
         BtPAhREkP2vxf7k8YfR9+gA2zKbYUVa17NKugmAyjmfVwq47Z0FCTN4I0olsWzagnHT2
         mWuT4K71Nrlagc31+lsMkBPqOAoaB4e0wR30zXjJk6MmIO21ntYRttYR4N5J/Tn4ut9q
         W7lg==
X-Forwarded-Encrypted: i=1; AFNElJ9Y1vbCspOcbn/QwUMrc/HzTvoRGIGxSoe21nxJRg2uQol4H+bAYdslmIKC9MY3JoyTLcZCVh0DjeMCog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQfnihrvs6ry7oa+QSCke5bdwRx1LZjLPKAn3sBRKnHiMR+ItN
	h15Jtor4nR6mok8HXs0aY9cAgqKvBoUPCexQBDi6FqmlBLMZbJJmRz0XRPFqPTV5G4tUfWzBZcm
	2ShgfhimMHacXHqnh9Y8GtYFcJrw/ypaMXOW9
X-Gm-Gg: Acq92OF93yXb5sRTJ6beZJhOe9mzu8sd9tFaJEozwvRg1xLF5Y/7w3e11xff/L0ysTw
	zJYMNJuawuidnbs67e/bzVIA/4A2JdGOS2ftqpHH4e9GiOsE0Am3rcaHWWKeGZaweEde+mfaNwi
	kfc9Lb9bEXNUAd38/IsOMWzB7sJAtZX/YuFP1OMrPrLEj50YfGuv94u42BFFBsw8oOKYJpwf9Zk
	H28gTKGaKUupDRYkm//jv3OUHN2JpULUYpKReVct3wkRd0f5sibUWpyMYuZpU7k+2bSKk+gjOCe
	0dI0F4lWffs+8NQ5/n3tFv8eZrUyjEK9X53mRaI3fXY5JXT8
X-Received: by 2002:a05:690e:400f:b0:660:36a3:b23 with SMTP id
 956f58d0204a3-6626962c607mr1099282d50.21.1781161773901; Thu, 11 Jun 2026
 00:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aipI6J4kDWESZgtA@ashevche-desk.local> <20260611061417.11747-1-mertsftl@gmail.com>
 <aipbDeEFbXam1WPN@ashevche-desk.local>
In-Reply-To: <aipbDeEFbXam1WPN@ashevche-desk.local>
From: Mert S <mertsftl@gmail.com>
Date: Thu, 11 Jun 2026 09:09:23 +0200
X-Gm-Features: AVVi8CekkDXvmdITSkrgkym8rEoKFhKBwnxQTnQ1G2rMX7_W6GBsc6kV4hMcjVc
Message-ID: <CAA3Noor=rsoCR9NoWy9KEZSrK66p0WN1i4C0aDwn8AzuN3p0hw@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: gmin: Use str_on_off() helper
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64541-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E34966F41A

Andy Shevchenko wrote:
> First of all, do not chain a new version to the email thread with the
> old one.

Sorry about that. I'm pretty new to all this and still finding my way
around the process, so I appreciate you pointing it out. I'll send the
next revision as its own separate thread.

> Second, you forgot tag from Kees. Why did you not take it?

That ones just my mistake, I overlooked Kees' tag when I put v2
together. I'll make sure to take it in v3.

Thanks for your patience with me, and for the review.

Mert Seftali

