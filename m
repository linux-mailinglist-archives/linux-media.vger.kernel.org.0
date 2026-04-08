Return-Path: <linux-media+bounces-58240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK8HAvZp1mnIEwgAu9opvQ
	(envelope-from <linux-media+bounces-58240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:45:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8F3BDD2E
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 095273010DA5
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F0F3D3D06;
	Wed,  8 Apr 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X53+jW4f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9353AE185
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659441; cv=pass; b=DnQe7/Jc8sfx4fFSX0VEW9RAfs0bYHr7NxHfqd7tYokG1aA2ILJ8Ag+g447GgjGuARlcA4GLsMh2lPcFWArqQYXiw6u2RucRtE1racxFdW18nA/BD0DqQcdnzTyKvOCJDdDRurFRhw0ro2WsZE7WIs2lbpRAkcux0LGuYqSsHxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659441; c=relaxed/simple;
	bh=OOswY/Ipkijjre+mn0uarCeO5cEqMPLTrmpqvF3+54c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGiaxcRsDbDos9YLVbokR0G1jpOz11V5rHgiSGI7sT7RKFmoVgj7GIgBjpDt7s0VM3bKrYYvZszkFW/iKzC5kj5FbuiYuY/ZGIHqnAc+JIpBcfIYpKD3u6uo8Y8/rLBOWt6W0hK6d6e51EfX1/J058HmeGE+tWL8NEpTLePMaZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X53+jW4f; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so21267355e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 07:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775659438; cv=none;
        d=google.com; s=arc-20240605;
        b=Fntluk9PO0TVKAlnHlswYNWoMUwj9Sbk8Im/Q07GrSKRj/8fQjhoeOwAoFuWEVv058
         W6jU+hWB7sc3bRAivEnQvFglyiukcPi9SLSOlTGo1vgSq4AimrCUAGkq7cnRJfkTqAye
         FU7bcfOhrLOgUQ5skdKMNlrBQkcUFqiUsNrvqgiQL88SQUIeDfG34fXRhsW2RS746aM2
         sNrSBtMKCpgOxbYOCW0gaZBkUWtadf40r2ehz0wTKK3QMPtgGgMpRIyBxVAHcGRUdZIZ
         3Op8k1s7I0uuXP7qbu2QEDUyoKHFFT257IOgQ7s5SxzATbeKhJ7Yvf8Ttp1GrPktVZl4
         ig7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0czAAXyphBQaflwQueiStfy5GAXWQrSV//xTTHBsKyY=;
        fh=IPy9cGRx0HOsAyXxsbplGjKlSkBbBYphqGkzYU8RAKY=;
        b=epVZ862wPyqGePwFKalhRPFFEN7b5CYnzGJvJx83sA/+L/+oDLa8L6Si0nan7rR44s
         ruSbp93M9wWU270Khb3ChMhm3KUOHhcupqqZpJe3UnEWH2qFIkCTrI/TwCJuTePQMfqL
         OF92ARGa9ia6sr6bfnJ7sggYIgo2z/fcv2lgXrudTmyPuaYWyuwru47+IRAQvHeQphQv
         XJd+unfFew1NXVfb6NaF/mBsLJNfa7naDCnDRGVA/yTigz+HSx+i6KAlIedp6wbRSkJW
         dk2fwH1USXYzR/MCrhhgQNNgyKvjk/rY4UsEfOsJwgmyryNLxO+r+9LpgfA/pja0bzfx
         Lmdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775659438; x=1776264238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0czAAXyphBQaflwQueiStfy5GAXWQrSV//xTTHBsKyY=;
        b=X53+jW4frHx8COiox+H4ymyUV7HHB/H143D/e0DUXPyFOOyQeoH4Sjtoq/tQ5EfgFP
         DSj8/T/EYHLSbpD0cH+u2YPzAKAXhL253pZeSc2BlpDEGlFgI+VqCqxpkx7kMunAFezY
         P6vz1pvaROhRvDVnryhjbiSYcbtsVhocOCXgW5hdKXlm3Ic3Nw7zXwakq7iInW6uO0nJ
         xNQXkXJF6MJHaDgjsOJ10ATidpOFMLjrLYeEvQ2Tq5xJh+Z4atsWoRXIHrwmAcUfCY2m
         HK1PToUF/LTFXUcBiWs+sUSg0l5r3PweWr8pHp3Gf/Q6lMxo8w4ryjOb/o+uXGnzIQV3
         esIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775659438; x=1776264238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0czAAXyphBQaflwQueiStfy5GAXWQrSV//xTTHBsKyY=;
        b=jtcYUh9THMzz93e2xh56LKV9a6bd7o0Uiv/E+Flc2hWVWlBUkfz+O/vTtDTG/100+Y
         SYRqzkNWVyALGtxteWENtzpjZejc8tT+gDxf/sZmqy23W92ypZM3xUMizQ1/bppjFsrr
         iPMfdEoANKdBzX4lluSGjsewf6nJq/3V5GZPVbwL3SYjssCK9lTg55HRlC214cX6DD5N
         ppliuLrhQmQGuf3iJAU6ur1zWli9jc/Wss3h3s/zzhWUZWMUB5uFGnv4iIwJV/fZJJXo
         ms3ueFBktS3ETjs57uo3CVcd2xf6LgXAgs2jgwUelTipKO18kBdBntu8qEwIn8xeVy9c
         Utyg==
X-Forwarded-Encrypted: i=1; AJvYcCV4VRVUvskaT0fGMEhgNX72rBKoGif9E+8At2OZGz87zDIhCZnCbWcmbBZE9vgSowK/WxgTuGTfTW88GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjtdE+mIHI0jt2S8yE0640RT4NH+swIONBBMLEemJO65nabTA3
	0WVwyszmDmqTp453OK2z/6R8rRgrT/dTvLe2jIYohrz9QUh+d69TJEOe+OZ+kH+bbQUkVmxd0xC
	JboX6XCvf2dehbQvrqpzj8QnPwgJ2Vdg=
X-Gm-Gg: AeBDiesLHrzvUIq3dsQnEGVHzpkcRoVzUPGEcDrILJDYmbsJ0oBTkx/TEeq4HOaIF9U
	HNQsvTHA5tIfhHcTMns6BzPYDUWpUUUAW1Wum0TKIyRWNMgnQtWdwViQcV6xOsMUgeNGQwTZZeg
	CMrPbkEExCBIi93Nf3x1koU/YO3vK3mPt8aW7e8G4n72nURJqU3AKkvHf6jbMi085emXVTraAR4
	iEQHYZL61+gw8K1+oighyNAT6I4Zg2cLRf2W+zLq58Oijx3bXeRUyk+xyAR5e3KRdcUc4/+ppF/
	QbD6JAkRPWLGt5v2MhUMM269NhM4RDsnD2sgSqzRwBLvOV6y9dGVaEYf1wEEaP7d48IOlH8Z3Wx
	ZSgHpSbPNAkMDXUcvIrcA/F9uYA==
X-Received: by 2002:a05:600c:638e:b0:483:6d4a:7e6d with SMTP id
 5b1f17b1804b1-488997d4dbdmr298973535e9.30.1775659437790; Wed, 08 Apr 2026
 07:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adUeywfiQzZ5JgEd@ashevche-desk.local> <20260408134612.1380-1-joshua.crofts1@gmail.com>
 <adZlX-5rx0jtIMpD@ashevche-desk.local> <adZmWZ0SXRhHPyQ9@ashevche-desk.local>
In-Reply-To: <adZmWZ0SXRhHPyQ9@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 8 Apr 2026 16:43:53 +0200
X-Gm-Features: AQROBzA2gsi2sxeg_LLS0hIjZh4oCbfwJKIM_K4Q2Fbup6b8Hi9JApfFBX639V8
Message-ID: <CALoEA-yJTdX8rBp9EJQ63cqBPziVO7X+RtQ1RacdupW-qy18NQ@mail.gmail.com>
Subject: Re: [RFC] media: atomisp: change copy_from_compatible to iov_iter
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58240-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,checkpatch.pl:url]
X-Rspamd-Queue-Id: 80A8F3BDD2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 at 16:29, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> > It doesn't change any architectural decision here. Basically you need to have
> > s3a_output_bytes to be already iov_iter at this point. So, import_ubuf() has to
> > happen somewhere else.

Yes, I know it's not an architectural change, more of a temporary
band-aid for better pointer
management, but fair, pointless for now.

> which suggests that iov_iter should be somewhere here, in the struct
> atomisp_subdev_params. But you need to read much more code and get familiar
> with this. I wouldn't expect any meaningful change by a few days, maybe by
> a few weeks as this driver is quite complicated.

I agree, the codebase is complicated, I definitely won't send any
changes at the moment
(unless they would be checkpatch.pl changes, which are low priority
ofc). However, the
iov_iter problem is intriguing and I'll surely spend some time working on it.

> In any case, thanks into trying with this, will be very appreciated
> when the task is logically finished.

Not promising anything. Thanks for your response!

-- 
Kind regards

CJD

