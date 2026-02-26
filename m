Return-Path: <linux-media+bounces-53434-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +II9JDXyn2kyfAQAu9opvQ
	(envelope-from <linux-media+bounces-53434-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:11:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8DA1A1ADE
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EC3B30A3077
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 07:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605CE38E5D7;
	Thu, 26 Feb 2026 07:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tlB3OMhL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14A38E113
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089817; cv=none; b=Q5B1FhmX4vktfGo3ncxfxZPa+MsLUOZ1fbZ1DVIInrBD71LczigezSTsbd2r6iqoNqAXCMAyXpfSBX7Id+6eVN2kgggvLEvoauNJ+cZEyetXCGaj1ocN3VelsfL37xKV333Zrp4dkxP5yScbmGbngIUJETBK4VLvkYT//e/ElE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089817; c=relaxed/simple;
	bh=wsqbhwDhZpEMvoda23woLLoHV6EEItTGqnq17uBuaxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSpWb2nv7CSZ5DSfmHFIOSVQZtrdMuG8VRRZI/EANC59VTtAsch8iJyfGq4gTHEyKNwlelpSbkI843pUupA+zwMUpH3Bt+uw0VjYN/XNMna3VR+MKK9qOHNmHpT+mLpMHbVx31cF7YyZrRFuCdXxhpO/XmtlgK0vayeOG5+MpNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tlB3OMhL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483a233819aso5275485e9.3
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 23:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772089814; x=1772694614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQCU464whOVs3Bp2v9fOpjBAOwoVO8nIkf2alxRfU50=;
        b=tlB3OMhLjKorvRAyjuPD0RiiAidj+4M2ADgF5rtnwrOpzJIgGJoAUdMYPV+1FIQlKh
         HEBlu83Sz9xESHnITI1vvOU/MD8NfppZiqTOI7HQU2kzm3kbRxKbGNB0Z6PIgo9e4+I+
         tVPuvIvU3MlStIAyy7hhp1jX+5YIAHnBhQIugJmInNZN0xCCSGrV2PHXN7yHPD8j0Q39
         qSLhYYNgKthhKyOEfm7ZqCnDpEwiyIk7Mgh5WAR9FrlGnVRTOIr6wR2UmsoCiFsI8vaO
         0vmSMavV/18U0TEx1Fa0DMGD9MfsWrTTYdeBkBgEZJ9Ncy/gv993BJM+S4ckwK2SoWjS
         npSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089814; x=1772694614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQCU464whOVs3Bp2v9fOpjBAOwoVO8nIkf2alxRfU50=;
        b=k+RlZTXtXxSpDJTrZzDk/CtNiC6xIN4hrWBi69U3j5lsWCmalZgFDnth5nJVQe17gZ
         A/qGBcmrcRJ8eUEHe7g3xAHAKcR+QjSkm92RdBGcA4g46n5n4Keslf3xo1QHNW/ZbRT/
         b0DdAxwoTi+rZABIZn092E5K69I/heGZdVvq6OppHz8HuqTXB7/KRDlVFLMskuv0WnXG
         Uddd8DYWBOHfVpcPWYBYcCGobKhsVkM5DBnAn+tkF26EKp7ZwOIU2EHE5q6EzMByKXSt
         wUidMqapHdWTv7eGUQp/x8RlD1/rq4hQV0A2wgNpGfZQEbxAgYRSEGfiXki6Z2BTyqrs
         mEyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+V7Bos93iC+ha8OMvDOKq8khC7XjMIjwAgDIVjErTpP9kQy5aNiPYvUikP65kPQvYqdpN805pS8WBHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBAejQYoP0Q8QWMEb1THNEBd0qpTPCqJ9byYRKkzMgwrg8W30n
	lq8mekFfYwPJBptY8ssZRpeN8bKng1i3gbxiopj9QZ6Ve2BXxgrE1BpV/QzNOziq5fQ=
X-Gm-Gg: ATEYQzwt7ffu3mgRBDJOnFAAI9qnNwvj2X3QbGuU8thRdvgmsOF7spI4FnIUJ3Rgs1b
	qHozXxKSY5Mps/0nucbNtjQekv2vGl9w16ZHKUZHZY/JpiIHQQ92tySxoLR4RLZe9y3lHcoWaUS
	XgzgYFyk3ugyrakRSnvRQqF4XCFMa113TOMytSCnG7P9AoOcO0fFIFZCuFCAhp2iqxE3cG8qWwv
	soMXYR0PurKmSXnR8ubiTGlLq9STglavyfhzudujPnovnkcdK0RfeYGILE63ICXVvxx9GDCltlA
	vLjmdH1f4TspNGCUxlX3Qa5JQOv5stO2r0ZTWzs6wZxJm8SV+SzjY1kxYgP4LML+m7gfDtCgGYt
	F9HOVIE89cdFIMGBm7WF+G2MJYXA3JCVZhGVAtVZqndZa+TfyKzaCnsWrWlC6lVrzrdzBdY+lTG
	njDJls1NlZIHOM5Ngnqig21XkzBgAo
X-Received: by 2002:a05:600c:528b:b0:483:afbb:a064 with SMTP id 5b1f17b1804b1-483c3da0545mr19284865e9.1.1772089813433;
        Wed, 25 Feb 2026 23:10:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b841absm26509595e9.13.2026.02.25.23.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:10:12 -0800 (PST)
Date: Thu, 26 Feb 2026 10:10:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tomasz.unger@yahoo.pl
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: replace sprintf with strscpy
Message-ID: <aZ_x0QmR66q8R4MZ@stanley.mountain>
References: <20260225204548.168092-1-tomasz.unger.ref@yahoo.pl>
 <20260225204548.168092-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225204548.168092-1-tomasz.unger@yahoo.pl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-53434-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,yahoo.pl:email]
X-Rspamd-Queue-Id: 0C8DA1A1ADE
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 09:45:48PM +0100, tomasz.unger@yahoo.pl wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
> 
> Replace deprecated sprintf() with strscpy() which is the preferred
> kernel API for string copying. strscpy() is safer as it guarantees
> null-termination and prevents potential buffer overflows.
> 

Technically sprintf() also guarantees NUL termination.  :P

When you're writing a commit like this I want the first or second
sentence to say "This patch does not affect run-time because sd->name
is a 52 character buffer."  I would prefer to avoid any talk about
"potential buffer overflows."  It's the same as me claiming that I am
potentially an NBA star.  Something like this:

    I am doing an audit of calls to sprintf().  This code is fine
    because we are copying 9 characters into a 52 character buffer.
    But it would be cleaner to use strscpy() instead.

> Since sd->name is a fixed-size array, the destination buffer size
> is deduced automatically by the kernel-defined strscpy() macro,
> so no explicit size parameter is needed.
> 
> Compiled and tested by loading atomisp.ko module successfully.

This information should go under the --- cut off line.

> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
  ^^^
Here.

regards,
dan carpenter


