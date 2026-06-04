Return-Path: <linux-media+bounces-63785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vuGxK9VrIWrHGAEAu9opvQ
	(envelope-from <linux-media+bounces-63785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 14:13:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6B63FC11
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 14:13:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Pu2HwOE9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63785-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63785-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 033DD306B512
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 12:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADD142DFE8;
	Thu,  4 Jun 2026 12:06:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662840802B
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 12:06:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574792; cv=pass; b=Mc9hSDC+YpBupswJpBWrDhqSmA4SRR08zIDeZCNBW7viuSlM25AwOElWFzpfpV9uvjlpRVCXZD+DJ2oRPy1pUG86RT8C9wfos3XE5CcS6iRWlktbt+4tuJPvXPWA74GE0oH2QQt3PBUwnDklsnrbUfp2ecsA90IgTqgolfw/ZPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574792; c=relaxed/simple;
	bh=psiNZeRpdW/gorqeI/gic7CNMwrLW9ZL/7lIFL+qkZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gge81KXE3woTmq2dDOPrSmJu1pH2x8qekN2wvIIkr5Lcndm9dYPToOS74npBDeJnXrbhIEMgxZX4yJbtGS+GkoWH3neKzBrcoNVMJSrffvH1rvcbXmbr5zmmjolf9Hn03vk62AKBuFAVdogNrkzdIANU4p4nju3Vc+BnO9l5RQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pu2HwOE9; arc=pass smtp.client-ip=209.85.210.67
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7e6b5c374e5so664848a34.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 05:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780574790; cv=none;
        d=google.com; s=arc-20240605;
        b=Pm3xcmqli1NYpPSrE89md7oRmoVkRTqwVd3EsCrKpBzgZrmT8taYpU+rNjAY+nBbDv
         wG/a1XzqUlduvehAQ8RMewApyVvQyz6ym5stZEAVcCJQmnjb8WN5j6wvOxjYlyzzuIuA
         9QaIxD5qfzCIIyszhAK5KNHgDd5uBCC3bMaV+x7qF2bq/geOOZ9v2cz37SKqJP7ERA2D
         sUCfYkLT+1QYL+BXSgCq1h2PzNH5zorJsugvGJB/hglBHfcgGAX+FslcPHLoLFW6dc0L
         1S1YxJiFIvvAWWyb9NTWu5nX+OZAQaCGAUWi/dNpme0Y9J2XPNkLtDG72RfdYXbqGWGC
         +prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psiNZeRpdW/gorqeI/gic7CNMwrLW9ZL/7lIFL+qkZ4=;
        fh=suRTnhPdKlgugas3rA8TTv3vIH4GPChQMk+C5iwc2Dg=;
        b=Jb/a1MAP8bqmUVBb82hAkXFCBB+mxQCTQqZ2dC+lPUNpY4oZZrxerxwIISgj92fX5a
         yWUqhULAkqrOvF2xazCr+qzW6pxFtCMr+oFmmJ2SNUKbr0g7WNPNmeBqBNaHuZHoBSBV
         fMbzXwOdU6gJ1KL1AdkFd33y3FNj1OqfKsD+5qZSNykyFeFG4PknNdXXwncQY67y64Gb
         yBlZuQTUiOGMQ1P7+w//3mlwsM5y97+RzYwD7n0/U/wWj8ZvyU5cRA8xR5REagj8bRZC
         mHlHI/DrG5SomwO3KxWadWYcM8ToI/Hplix7ZmTgGRPtypuStdJO80Kpeo0Di0+28NbI
         72vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780574790; x=1781179590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psiNZeRpdW/gorqeI/gic7CNMwrLW9ZL/7lIFL+qkZ4=;
        b=Pu2HwOE96F4WdollMIJZkpVXesWUbstwgRladxo4aeOomSIT73SvYT7C39KimD8hYJ
         pw2RLr3cWhJY1tBnAKk3/F5YLEkXGHvHlPw79S0OY/9sR1HkBhnXw8+g6YYLu0FJY9Xc
         A95ty7sRS+HHSa9rzfQF94mQHzECqBqZAOMXVkzB4SbjT9E6FM5q3MljS3fKUPyE1P3y
         0tDCmfd8GXcrEDn68sVnYp1CCXe4LQ0IU/4Q2f2unMZKswTtNXXLiVTwm9dj4DlkgBcW
         RyE+b/wclf9f2p56TJidMuXq+WVOWCm/eixGftD8aT4bMwi1/pxJGqMTwBL7Z5zjytWt
         mzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574790; x=1781179590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=psiNZeRpdW/gorqeI/gic7CNMwrLW9ZL/7lIFL+qkZ4=;
        b=iV8aZnPgpqdy+JVZz7u/iJ/uM6cEQz/MhhOBu1U9WgMTL/Eus/LAa8hYHItcveBcRk
         21hwrliBL21XHM+dev0x58lEpYZ/ZNXqsf8yZqgTSMV7pOlwarJlKhot1aoJwyL1D6yA
         nmLyqYn8WeSwicMBpMiNhwumfmI8M1LJvoM2zltnIDlY4BV2Ywnvab2G9+eM6w+uzLdx
         oTGwEebOeDvqXYAf88hmtDNNtrq5NFRZrwOvqICP5rDALo6Wgkuxuv0EtS61XTKfMPDU
         2MaVbDDVeItXWB3LT8teXDVoLr17FphvfWAZjERevOJj1GoR6hKaDgM1bF5Wo6cHyPnT
         b7Pw==
X-Forwarded-Encrypted: i=1; AFNElJ9t8jAiYr6fztr1EpK+WNLh3Rq29B/S2AqEGayPoARR3/kqL1FdbiIZNGqKO9Ozd5w+cx2J3n/iwJnAXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznJM7+0MhyogJtJDHLbNBsRWAJE0wio3b0VBiLbYU+foWdtN0p
	++JPn3YLskjQCGwiBE+jEiJFKR2WCdJIM069+aPCDskXKT3IKBvcYUqREOKCXKBtl87X3ph3cTO
	3sDXXj4mBwf7tkAX1ObfgIZM0YIGPd6N51/FQAqM=
X-Gm-Gg: Acq92OHwYCl/h1tPB9NgGL+su+5oKqepb043BJ4zMNiyNT5f/m8QUg0pwRM6WvTYvu7
	aZLb/mVExe+93ngApKyetbKEWI+TzhgiXiA7PLx6YzA2PV4xJEqk6K/2eGRwXunWrytGaXeu8D5
	/Io0xRfeqVM5vaVmzytj3gKPqz0pGPHfb0GlR0+7aXrSocgAZEAhme0I6JXvdqiY+RVjQjUSfXG
	2bzaNOTearTMjdNfHPn5wNzsvidpGya2IlHXHpRjdqevYO/mVx0NGF1v5ZyePeKkPEskIJDwL19
	rgqAU7V0CzvsgOM1buO+s/9RuOyDCneEBNQb6Gy4XUMg1Yd80XU=
X-Received: by 2002:a05:6830:84c6:b0:7e6:cbd2:fb49 with SMTP id
 46e09a7af769-7e6f9528140mr982383a34.18.1780574789873; Thu, 04 Jun 2026
 05:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <oB5ie3iMXIF3Y880tV7tN8clu84kWmIaS84q29ShnUs0QVv21y1IOyXqc55FGzHfG9JIDlcIrhQh30TaZpC3vw==@protonmail.internalid>
 <20260604082510.45733-1-dennylin0707@gmail.com> <76b46788-0cf1-469b-93be-b7788be2bd71@kernel.org>
 <4htHiZldk82hJK1J9t6Pkm9ZuRUEHNsAt4V_ohuABF9uzAngCz0jLFLh6VknH3O5bX00hDZjIPKNUybrZ8M0AA==@protonmail.internalid>
 <CAGEkeHeFJC_eMZnDbbjXZs+Gy424YdCNH-HswPgE3zyYrEnoDA@mail.gmail.com> <acdd8e10-ed52-4dcc-9c1c-3665f7193a20@kernel.org>
In-Reply-To: <acdd8e10-ed52-4dcc-9c1c-3665f7193a20@kernel.org>
From: Denny Lin <dennylin0707@gmail.com>
Date: Thu, 4 Jun 2026 05:06:18 -0700
X-Gm-Features: AVHnY4JrEQQPVEvOWWG7pcd5K1oWkvVn6E_4zxTifecobh8MFIFfUaT-felo_q8
Message-ID: <CAGEkeHfSgk+EQRHdko7bOwv8rSm8qQPo=osTFvjuHusU5wYa2g@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM check
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63785-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FA6B63FC11

Thanks, I'll slow down the pace a bit and make future submissions
easier to follow.

Thanks,
Hungyu

On Thu, Jun 4, 2026 at 4:12=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> wr=
ote:
>
> On 04/06/2026 10:07, Denny Lin wrote:
> >> Could you please put your series of individual patches but group them
> >> into a consistent list - so that I/we don't have to figure our how to
> >> apply them and in which order.
> > Sure. If patches are related or have an intended application order,
> > I'll group them into a patch series in future submissions to make that
> > clearer.
> >
> > Thanks,
> > Hungyu
>
> Its just a bit confusing what you are doing here v1, v2, v3 in quick
> succession over a few topics in the same driver.
>
> This feels like an aggregate fixes series. If the patches are
> individually applicable - great that's exactly what we want but,
> separating a series of fixes into individual bits and sending them out
> in quick succession is a bit of a mess in patchwork.
>
> So could you _please_ just aggregate your fixes into a series so that
> the ordering is implicit - if ordering matters and the history of the
> reworking is contained in the series overview.
>
> ty
>
> ---
> bod

