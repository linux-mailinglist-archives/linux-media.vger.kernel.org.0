Return-Path: <linux-media+bounces-67405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y5nNCoeQU2qubwMAu9opvQ
	(envelope-from <linux-media+bounces-67405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 15:03:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E1744BFE
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 15:03:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d8tDBNZr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67405-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67405-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29E08302002B
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA82C3AB5AC;
	Sun, 12 Jul 2026 13:02:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013DC22ACFA
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 13:02:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783861372; cv=pass; b=lLj/1y/p6iL+uYipDnUdvXQ6TRqgXCveV+EwUgFxZ92uF36WB7XgLqjkWcOTcn7UHvXJ8JMEsLk7kle1QPHgaH7+Kdhz23G/h1JPcfInmgeMwG1/d2j/8Uad9V4LZffZF1Yhve+q1g/97F//PjgyXlgr7nO6OGxomp/n33sJy/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783861372; c=relaxed/simple;
	bh=RIETHLhgsZT0jX2Ysl4AQJ8F9h/rIUYo/5BKhnHY8rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFintStlR8HTrxP86U6DbsfgENbKQ6KqtMvaLcHZqXu7mRNdWF4l2avHMBIx+IAtq+r8/I6NZD+4kv8hB03WNi4QIdOOHEeCetZCvSCf65lD+KECXXF13mYdZXNMGHGvC1na5HOtepbHf3LEa7uF3IOgI9VpIDQwlkGy2YInl40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8tDBNZr; arc=pass smtp.client-ip=209.85.167.196
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-497d3e4460aso3936417b6e.1
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 06:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783861370; cv=none;
        d=google.com; s=arc-20260327;
        b=cECdpgP7u2H0g+eaRKpoyfheSM9K8bwCG7lQTg4KGiq+adSRAGlknh8qamiW6EtVn2
         wJ71MCqORffI2rSoxZIAmjledAT06fqobbVOOicunxVctqrkiE1ZbnVfBVTHo9zPlmZe
         h6dcn7cL2bvZNwLd2trczpwTlhV4fVnzc0Yd4lToDjTjisDQZYBWaRK3e32zZxi9kEUM
         PY7CWZbvPl5UGKS9MQxjpyJTVA6DsynAkQEjaopmfgFhDb/wHslILMS9zlHgqq0DISx9
         aLh0UOEOf73YG5fR1slgJwwgFVcwUeFgo82jBHf86qAM9YbtizXMT3dv0A3RSWvoe/h3
         cAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S1Jg47z4tfHD+RAveI+44bO0OibOmFtqXsNRjIKnF2c=;
        fh=6JsOWENbe0WhBzRusNn/rhKPJ1mNgKaU01T3onWo1mA=;
        b=TdpTi09+Mu8/lxSmTkH2t87bhBKdAfN11qkFU85UahN+sC6wIRcWWMiaBHvm5XWxua
         x9pBAinqZp0MkDQuC+P8usLwSM+bxYIZPEqGWjdGRlDb2bsxs4wPS9yeESO4HVH1xdLh
         R9Bcap9gw8LJxdbIzxlXLWSlJF4I7jYErO4ZXOhxMUnOMByDZeKVvQs6eI05aHsqQeQN
         HtCNVmP5Oc0zhydxMW+ThKGiwF46UzixmCMhaOOW3u3KYGHzCD2K66eNsOLq+ULABL/l
         4AHDHtd8faVYgDK3EuO1HZk0AbYyBFLVgTAeJrqmu+RU+ZvvphRFetXl75VxJrQZ1bIl
         kqRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783861370; x=1784466170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1Jg47z4tfHD+RAveI+44bO0OibOmFtqXsNRjIKnF2c=;
        b=d8tDBNZrRGQSIQtmGLf7Jls+80nD2vXVGl3WRDmq6V+TGkO3xHK6USwz5v6OB4GFs3
         4X3aN+sJgDVwr51dJ1zELzvRuKZlo3+9+BtMDk8v/eH6qN0ANR5kWgn0pOHVGOmVhNCP
         xGUshQwSO7PX/F3n3kDD9LWVRKGN00lUnbfR0RjdBNDDHMBfsK8t4FP6S8kLcRxdz5JO
         l+ehp3FG7olv6M9SJ4j+RnjQDOQhjCNki1C7pav9U+mCYas/fj0xZe30YyBGPC4ug1ML
         5eHC/KAJv+7Gt/S6Ju/hvNEc0U8eBtO4CaKO7EnYH+r3l56YfENsTsI034qjpfyfK6Nt
         tkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783861370; x=1784466170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1Jg47z4tfHD+RAveI+44bO0OibOmFtqXsNRjIKnF2c=;
        b=bwdg41MNbigaZrLqdbhXfp083yswykVCwrH/ZzAeVQ+qaS2FEIc/GENYZgRnVX8FXf
         ZLUwzgl/vhGXEQww/NuDg1W+VXdcAjJs02hXs309tIyJkAjKmTZrAjh5zBBSemATXbka
         tJdl9EdAThhap7wildvE7YhGJ2UHMU4GvedwhzmBnnaaXAnblCSbS7cmIZmduHAcwQN2
         LQffMec+ESTeUvBA5RBifBz4XBufVGKoN4okj1QjUVnYqTWoNEUma9j6zC9H0XBcVvk5
         QFwXWi+rb+D4buF+ARAl4rfD1ESnuvM60xXsTune1frNKMsoSxUpzGDOmUOPYrhPM2jN
         jE4A==
X-Forwarded-Encrypted: i=1; AFNElJ+b23MiMe5ENy7Bt2+HvwUV994+85YnrZkgJabYBgO8JberO+DQKN2+53Tv+PCQsnNgtE8gqg+UqbuxnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDci+7ChXoj2ejVccFM4xjWpgyabDIHphcWeqAzrq937yrk4rm
	mGMD5bXGwDJxuRXICxsQEsVPUgsHtI82UzOC8/3k94nzW2I4WAwBwx0PF3kEVlEnjo4U2xbpr2h
	Rz1NwhF8Z4R+om9tGfwjdqVCe0f1yAA8=
X-Gm-Gg: AfdE7cnFS+WOq3Vruc95a1LDkFRBmntC1LdjWLlCtMQpjHWk3llJT3wEhToQBT3HX6W
	gyBmcI6vEL4dFJFOfKNamB7G9EMhxyzcBF6St6QdaDh1+5H3ra9QScMhiGDJEKmD8D9tqa5rHR/
	V0OFqlYTjIdKdtisZwo7CP4z8wbIE/B3CshsI7SCb/8x+Vz9vhxkT4rCxT/zrFQR4m+7jvcTnDW
	EmSsdvZFU3KYDUE9bmO0PfThdcO6VLGxZJSQGs/dClfb9bCVCkCqP5OhesLGoAfSQD7vsMlHg==
X-Received: by 2002:a05:6808:1445:b0:4a4:933:dc11 with SMTP id
 5614622812f47-4a40ef5dacfmr5727923b6e.20.1783861369779; Sun, 12 Jul 2026
 06:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710120254.23565-1-bohdandmarcus@gmail.com>
 <20260710120254.23565-2-bohdandmarcus@gmail.com> <alNtmD6nYCZoOCaA@ashevche-desk.local>
In-Reply-To: <alNtmD6nYCZoOCaA@ashevche-desk.local>
From: Bohdan Derkach <bohdandmarcus@gmail.com>
Date: Sun, 12 Jul 2026 16:02:38 +0300
X-Gm-Features: AUfX_my3wMh1ssMv_iO3fmYjgh_VjopZ9iwndnjQtO2Fo87rmn-Ef_MvhF5HvYM
Message-ID: <CANqab01RQxqSHBjgRR1QBgxusmVv3yASQ9kahgiKPHWcxYKX+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] staging: media: atomisp: clean up block comment
 formatting in headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67405-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 696E1744BFE

Hi Andy,

Thank you for the review and for catching the style issue with the leading =
/*.

I just checked Ricardo's recent series ("media: atomisp: Remove
doxygen comments") and see that it touches ia_css_timer.h, which
overlaps with my Patch 1.

I will wait for Ricardo's series to be merged into the tree first.
Once it lands, I will rebase my work, fix the /* block comment style,
and send a v3 for any remaining grammar or formatting issues in these
files.

Best regards,
Bohdan Derkach

On Sun, Jul 12, 2026 at 1:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 10, 2026 at 03:02:53PM +0300, Bohdan D. Marcus wrote:
> > Fix block comment formatting issues in several header files to comply
> > with the Linux kernel coding style. Specifically:
> > - Move trailing '*/' to a separate line.
> > - Align '*' on subsequent lines of block comments.
> > - Reformat excessively long lines and remove Doxygen-style tags.
>
> ...
>
> >       /* Purpose of mutex is to protect and serialize use of isp data
> > -      * structures and css API calls. */
> > +      * structures and css API calls.
> > +      */
>
> This still has a problem with the style.
>
> ...
>
> Have you checked patches by Ricardo Ribalda?
>
> ...
>
> Sakari, may you apply Ricardo's first two patches at least, please?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

