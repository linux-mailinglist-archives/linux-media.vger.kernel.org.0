Return-Path: <linux-media+bounces-57959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF6/CxZqzmmpngYAu9opvQ
	(envelope-from <linux-media+bounces-57959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:07:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F12738968F
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86192312BCFE
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 13:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A7037C0F9;
	Thu,  2 Apr 2026 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbT8+qAM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7953E8660
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134805; cv=pass; b=JLjs0UAWam+sOz8pt6Qn6rU6jDC7JtK83ap9VukPZlrEYrbLAb44llXASxkNtPgM0Xiax4sOwYQyeoRIJW7Pk2UKW/sFrJ+kX1+lMvvvphHrEP/oN2Y5qz+q9HtryGn0TWgV7X55sEVYIuEeyapVYONk37yVHz0M7mvlGIBvq6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134805; c=relaxed/simple;
	bh=6cYYKddOqyHRRi76/Oigx/tdNslYFqcTlLUf2yHBzo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/mf2a9BNOH8t9519hZyK34Nzg+wLE2lvRvaCFyfSXjhII7GKozU2p4fth0vfNWI+k1KXCNSkL1cwim19izzyjrAf4IyWMT8v4Rnz2NRB5SGCjTzeZpDCNT8WCr9UNladtPe/zASJZKAzr3opT1AYiMfUE2AJwW4OLC9K1kg7/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbT8+qAM; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso525498f8f.3
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775134793; cv=none;
        d=google.com; s=arc-20240605;
        b=FoAoqaRNy9mc2Zf6JcjHxcbEfmv5gZlvZKHaGZtiAEK+TyEPh+oa7Mz+noWPTL1NDm
         oJtmdryqyaBAsDZKfHkPCwRwsvBEReCWdiuT4noUkxAxqqP+Zp9HOPFdwjvQKVNSL98A
         XIt9qhzY+zfWBliz7tdAQPFe2/xTRqP18TWUVlUbb6gB7EL2I706cf1tIgns0dwHpzZC
         M2pBFyNEs8dyIxBUA78tLfDw0O4Px9RmW5QtER6ZPOZ3XDM89lT0ekFDTMxAgB/JOpzv
         SWcO30584ZkvtMovSjasOegyGqGJnZqXBSDLVl8peW5gUlxw0p8YZODgkFBEeNoFz8qK
         ypEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6cYYKddOqyHRRi76/Oigx/tdNslYFqcTlLUf2yHBzo8=;
        fh=SH4V2Lmzf0eOPVygfn11HwtAbGIPL+a5hbifxL4vq0Q=;
        b=h5toXeEaeVo2VT8pdR/osRMAAZS/0q0FdCc3YblsunMhH9d1UoS84BfyS2abofWSsH
         OOaa9Gtj3a6Fjr+yJcNPMmNEnuM3nEJHLEXTPiNd6rWSHJWDIGEYrNIiwuHN1xn+EQXi
         O3awVZu0ZBx1arYB81zGAO3/EBasdmyVjAQT9+HRnMZh/lwmJbzQ3NAstZNXZ4u6Xnz7
         2y9UvBSl8uR6D8rAZLcieFO54NYk3U0582j0BD+3cKmVKhhLTMdPYrpoQ2UTeFgpvuQf
         YS3E3SYK4EwzKNPiCnVZKr4xVDSysxza3+QT0y6RwgqMVuFBQWZmSYFaGBCEhwNbegYw
         +sSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134793; x=1775739593; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6cYYKddOqyHRRi76/Oigx/tdNslYFqcTlLUf2yHBzo8=;
        b=fbT8+qAMnibG07h4wwlYE+CvFIRnVj6LvEV2yoVVMEMcn6nb+wOy/DSFWuQaqMv1ng
         f6F6FrRsLzmaQ/+baaPXE8e4RvwLcp7ipFbaPewKVeEgKPvRQyxzn/Y6cHO7O3K0qfCi
         D3zrYEGf/+GKPB8Vlh/Vb71d6Em/xrHTRMjAWiNT+VB1gV/OZOIYDw8d/KYUgwfSzMgi
         QRKohC8II/dLknCz7Qq9XKOy3Z4u3aSx1Hvn7lej3nfgV4/+nV6TpbzYQ1PVlwlp+6gG
         sn3J1Dpq3DXNOxyCB7OVPsr/khB5vGQ809VbDo3S/9QQKVi3JtMMhSBalPzKiDFyZaFI
         d73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134793; x=1775739593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cYYKddOqyHRRi76/Oigx/tdNslYFqcTlLUf2yHBzo8=;
        b=ixLIwDi7N8OSN65apYkSysRO/ee+C1UPd5lJSBbQV+bbovh4Q7dAuQoZ7ORmzW2oPr
         caVueV6jGx9Qi+FOrzweREvZvUinq6CCqUsBKbnxwryraXtq3Cww1/F9PlcuIfjijZEK
         vcwK+AF3woO+mPnDZFlnahBVLGDWocprxTamRLT7pcdfscCS/ZqbZEPnUG48NYPRjtqZ
         r+ub27KoHF3rfYB8Z8n5YIaN01r3Ai/DUyIiSh2C+uBOpmrvk3KTs29rXs4L9P6MGVDS
         5QUIV9NFRW9Sgiu+2Runv5kyoLaepYbXUY6Ds2OkqGMkaMkaGIGH8O7h8LUkY8wOiH8t
         WQww==
X-Forwarded-Encrypted: i=1; AJvYcCX+AjvaaNJ69vBgQFkEPNqYyXxk4P8gPldOf9XsozqUojVhSzry7+KH1CH6mUUiBoQPJ6fSjrfUmRgZ+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Jjq1f4VCLW4iiOmbl6Mh00g3EK7/rwUbf8c7KqQfCvsQxa7M
	HEXAcfavUEx/zjVdJ/KWXaoZbcFbgxoBHzl8yTK1FJ9nhGEHF3nVZ62j2yuDXS/sAIb47Z2zany
	yQ/iktmbrEBuVR5aFAYomQydfqVVQCZI=
X-Gm-Gg: AeBDieupNeJRnyLmch1VeCrp4KzXdk+p+DLcvsvU90Z4qAhIu0ul0s44fS1JHI0g3sN
	bcme4UeJWAYGt48GWXLLRjj4mKo+SlGzo/SDVBPbjCZOlPNG03TWDZOGmHB3X/aK95kWoWJ2NaH
	Cx8n82lQ6iTiBPgbqvMFtknxr5XkYX3S5GSeP1Emha84vKqusse7sF7p5PZqQ8g8ndxgYWyDkp6
	Gn4TXrKFQlO2ui2fbBx1paBg2YVU69wFDIWwh911mNZZYozxA2aKFi0jrwMChOa33Flv8WrbMqU
	WTbAyQtLVqKy0PuP2gBGY6XUaHd/wOfo3C3iTm1xNPOVATBu4M+z3d6dGzdkAdQR8oBRsdgqd2F
	zt2pcJTuZNL9PAN2mclK/2LWIPQ==
X-Received: by 2002:a5d:5d12:0:b0:43c:ea2d:9c7a with SMTP id
 ffacd0b85a97d-43d150f777fmr14504179f8f.49.1775134793245; Thu, 02 Apr 2026
 05:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402122333.1336-1-joshua.crofts1@gmail.com> <ac5nBB8unILvfl4P@ashevche-desk.local>
In-Reply-To: <ac5nBB8unILvfl4P@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 2 Apr 2026 14:59:46 +0200
X-Gm-Features: AQROBzA3ysDGT_xhMFVUY5er_hxxQEpxHjpKOT6n7xdK8NhG49DayS3xfaZzghQ
Message-ID: <CALoEA-wS3zmoP_Cqo4N3R7_+vjXs04YMvfhEqzyfo0UAdZfPyA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: atomisp: fix alignment in function signature
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, grondon@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57959-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email,linuxtv.org:url]
X-Rspamd-Queue-Id: 9F12738968F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 at 14:54, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> Wrong branch for this driver, you need to use one from git.linuxtv.org.
> Also the comments I gave against v1 are still valid.

I've replied to your comments on the v1 thread.

> Plus now the request you to read Submitting Patches and other process
> documentation, so you will know that it is required at least 24h between
> versions of the patch to give a chance others to review.

Apologies, please drop this patch, still learning the process. Thank you for
your time.

Kind regards

CJD

