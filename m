Return-Path: <linux-media+bounces-56108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EGRArqLuWmTJAIAu9opvQ
	(envelope-from <linux-media+bounces-56108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:13:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD57D2AF237
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C10830530D4
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82463F7E86;
	Tue, 17 Mar 2026 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzQ8Zyt8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB003F54DE
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767363; cv=pass; b=OwSWuye/8GOM2kR/1Sv6BJ4pQ7aD7lwrOYmgnHBvhr9DqkxvSfIhLNFIB2HX25rLwHUb4IdNaHso6XES2b6PEi6h/PC0DfB0c3qsZkFxSSUT1pRXPjIIx08UEb20x4vAZNRHm8bXc78lO+Yt+XuqWDmgEMdWfOiChkywXNxHIdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767363; c=relaxed/simple;
	bh=LWX8lvkUV9PBNvGCPfQH+mGtLQKsR1aBA/U9I+b0PXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fuq1PmGjOyThNKkM/pU4WRDfbfKhzhF/UTOHLm6BgYjOz0NkUhCmolhiaFZL7seZ+Mx+IVmrX8T3iQryjRJ+cFr3ZxbUpYBcf6PXJk5BnACaMoBRXyXzpDbcvpBV0L+9vfUSjmzPy6ZkMWFCH+s53USq8VZT20HjJoBWyVcMzA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzQ8Zyt8; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so2471836f8f.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773767360; cv=none;
        d=google.com; s=arc-20240605;
        b=O/zyYr8P/3oQFxz685FSTJHFYYSwm6lTHzL46oFNP2KjBfb7xo2uoq1MJk9xVsLY86
         KUyC/QZShcbZWKw4p1Cw1gi/df+hxjqms6I/9g7E3iu7Tepg5DzkA4ZOMwu0+mbQ64/y
         yrsv2Sfo3Vn1L1bemqaYSRPjaLomcsVzwWeXUOWCs9MHwQ37cWVX3/6EE5LnMmmDxD2/
         ELRdS/FQSEKO+YfKNdwm+F9UbEcgKILH/CmboWae9kjP3ErCspnFd6haiKfEH3ILo2+M
         5JXT8E0+W6jIzMsPf99iAi5yNAatJ1vhlhBE3UyXyapBva++ySnnmpqZpQRKpQLxe53U
         XpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LWX8lvkUV9PBNvGCPfQH+mGtLQKsR1aBA/U9I+b0PXg=;
        fh=CGWfw1JtF2b2qb5hhdYBgPRmYoe3OTPJoiq35rTkw4Q=;
        b=at9aAGJtMeXvsMjv735BUlHymklkuYOqdGDHMwAlXOJmLl1Fdm9lXC/sVLPsch2YWC
         srIzFoRKoGOvSPx/tDG7VHtSuQEP+JJ66aY+P7FkqE1REteF1T1woGH7LMCSRFZwnDAz
         eOCLlfT29noRNOeUiDoMdRzQltovuaV8Gqx2+RvxhpXhEjPtXCZlhnslQ2YR3hQLZtSQ
         H2Kzu9sFfAX4EcqWNtsp2DLNNidf5OWvNd8X0nP450iVd+QKG3ancTbT8Dfs0xzHu7Yv
         1LPXr7UROysiRmw9nvjA+WURIoyzr7KHKxnrlxurXKuDyWoe9BoTOXrXTVkum200HUao
         d2Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773767360; x=1774372160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWX8lvkUV9PBNvGCPfQH+mGtLQKsR1aBA/U9I+b0PXg=;
        b=LzQ8Zyt8h0ZCsRerInSA7lOS/fxSt5cMG1/0idqzDnyCWJNqPJ81ugFAl/qQIhKaaV
         /bhKUJs+6UObEwuH82mci/AWipf0hPvZgOw4kqgSuwWb+YCXcIYgtB6Fq3D+DCfqja9g
         lXQfMwGVY03M5Jji8VLUVurZxAkk2rBBMZK7NLeLLxGOxvni+CbbMZwRMFS1iRaj6HG1
         NoXbe757ZcI9BZCAiTyfTU72e3vp7CVdvfEIym7y+xJnSFVYUQjlpqproZWMqErdMMNj
         9bwMIjVYOklw+LRqn9FO+W+GGpsc0/muJBNjXNhP9bwb1hcvdubd4CBu1q7MptP9IAaQ
         7sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767360; x=1774372160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWX8lvkUV9PBNvGCPfQH+mGtLQKsR1aBA/U9I+b0PXg=;
        b=Ds5V6wmWLxxuiLIgC1YvMfV354mbtJI0KS+1myTjCpH55lKVns7dGtzMrxoQraFdGJ
         6WZ1tiiJAR+4+OwDYFKXBVI8CzO36gYvp7tMui0hjMQiVLLkpjXmvK0lQCuLQ4yKbjkD
         wpVTA5iZatc6akBdgUk8Xy7mkG54RD7qQWlqkGiB5YrTlZFMr7PC+rRSk+eiHTA81xon
         nK7MHqrWPZ8HWzPdROruxHByDoNU9FMKfw+ohlUn5Vw7AvZQeCgZSS8QQqVi9jqW5uCQ
         V6r7c9IS5IACIDcWp1tO4BNhGvRwGk7OjhBIhUC/UUo8qWzH05UvQmmDPbUcjjrRchtM
         wtdw==
X-Forwarded-Encrypted: i=1; AJvYcCX8m5utYrSzZp8TeB/nK8wAf+ayHOGCvYVkPOZbT+WA7Y4KLWxsBPC/8pphUOFJ5OSapIz/dwKhUcik4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FnckR5QyuMujnNivRDj+rj2yfP+uMWCQF6djlFsr/nfYTbIq
	rGRiCI9UGmZb+htLpnJBwK4Prp61+F/FBgZeXSgI95PaXO8iLvumn30bm3iv5Y/hSjKMihplKtx
	YOTXQzfWH8b8+XHB9tCaz5aVvCEQ9pbs=
X-Gm-Gg: ATEYQzyneU9AsXU/wS/tTtWJFOAdHrrv3EPfPuXs5G7WJj2NvAVZqJAEuGHaQe9a/fo
	phsYAzquydxs2BMGdWv2gu/nm+8R+PjTGo4GwGeRE7Yhf03mDLgYvy28bWLJKeJI9+nowMQwi3H
	pO16mXXrn2mw3UkiP+dn256K3FlLoj12so6+Ddv5s6V7JFL4+WIQWC71qwrFR7PvbmwPy6Zyjip
	dYgsnN729/aPMVrzmV/GdVxmAIGEGFsOm2wVd8Wrzb0sZk1GFob5+nYJZVTCGCLNA/7pKQ78mB8
	wlp8v6eBFqq+MeXx11lck1eTUKC2b29xiHChD9tWmw==
X-Received: by 2002:a05:6000:24c1:b0:439:b1c3:84c8 with SMTP id
 ffacd0b85a97d-43a04d8c957mr36170888f8f.21.1773767359996; Tue, 17 Mar 2026
 10:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
 <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com> <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
 <abkRdID5NGk2mkOF@kekkonen.localdomain> <CACjYBvir9vnXqH4HVXKqMs-pmqTWjs3wA92WH9_KUpwSr3KD8Q@mail.gmail.com>
 <abkf0KPSKnKZep5V@kekkonen.localdomain>
In-Reply-To: <abkf0KPSKnKZep5V@kekkonen.localdomain>
From: Kalyani patra <kalyanipatra2003@gmail.com>
Date: Tue, 17 Mar 2026 22:39:08 +0530
X-Gm-Features: AaiRm5338gRG7C14c73NXuA1yBJ1OtcVqLnDaipkFF0EhNbiUlUmgmJ-wtvEcfw
Message-ID: <CACjYBvjb05JsrV6g9CaJozApxA9FWcQ1UUZqzzTrsztS=+RBRw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56108-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kalyanipatra2003@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: DD57D2AF237
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 03:03:00PM +0530, Sakari Ailus wrote:
> I first applied the patch to a different branch and it seems the
> issue the patch addressed was already fixed by another patch in
> the atomisp branch.

Understood, thank you for checking.

--=20
Kalyani Patra

On Tue, Mar 17, 2026 at 3:03=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kalyani,
>
> On Tue, Mar 17, 2026 at 02:12:20PM +0530, Kalyani patra wrote:
> > Hi Sakari,
> > Noted. I=E2=80=99ll keep both of that in kind going forward.
> > Thanks!
>
> I first applied the patch to a different branch and it seems the issue th=
e
> patch addressed was already fixed by another patch in the atomisp branch.
>
> Thanks.
>
> --
> Kind regards,
>
> Sakari Ailus

