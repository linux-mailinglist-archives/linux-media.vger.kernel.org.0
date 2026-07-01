Return-Path: <linux-media+bounces-66224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0HwRO9sWRWoo6woAu9opvQ
	(envelope-from <linux-media+bounces-66224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:32:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B486EE241
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:32:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Yz5xnWC+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66224-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66224-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D308731B7CC6
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 13:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEF848B36A;
	Wed,  1 Jul 2026 12:59:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A903CF1FA
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:59:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910762; cv=pass; b=PREZg9bM++zOGBvzk1o0XPKFrKskRfjnIoBWKZSX6njSTLnG8GCtavjwSk3HtvfH7qnNV4D5yHZSLTHQeNwkv8bhXWbTtKQggih1N7EWrbv8bG/Yp0V9RaDOLaZpViJTHNO6EzRTg768BVCVDLVq9H2e31huDAcbapnDDSHgeXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910762; c=relaxed/simple;
	bh=w7T4l3H+ZghFEqzqhnUEQ7w1i+tAgsSes+v6k/i/RAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fuoid9OssPDvcJlOCMLxhBRqSyIZYYbeGVuiTElEfkHcNu6D/vNK6JzvVZsG7bDnmORXqkUX9JqzrGZZVQoRKR6cVrYob6f2CQqtlk59CFunYKxnUf0x0adYo+VyrOzBJ6mYSEvVH02rPDqY0nRa8aV6hEK8uUkcZeO5O3ObM7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yz5xnWC+; arc=pass smtp.client-ip=209.85.222.180
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-922ff615c14so52977985a.3
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 05:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782910760; cv=none;
        d=google.com; s=arc-20260327;
        b=O955swd5+oAzzAtAXVbuNhEvtKgQvQqdphIbbr5+bAmLnucq3QvfR7ygEzo1Yxq3qn
         dXQpPisdVQGHSN0bqH3QvdJy9Rnt+oreHXnSGNUHNYB+IcNlSgVlOz3bso8RK3Lj9Ouu
         RUpXUMPV1usxZJPwY9GTlYUyMSBO+f4kkdes023f5QjVE+v48VoD5eX6vlLpxngaKtol
         bpPSHyLRLPDwL3LNUd/JjfYJmhHImCIi5jC7lNVniYiiIZdx/+ovnUhymfL+EMWxz4rS
         gIaUHLmKLIPLD132TTB9U3FGcaJ408Cr6YP7A845l+VWjdOLHBle0ke+iYtnIR13Yh9e
         nc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I12u05M04GIJMyEzopRm5q+ddLjVLgxkEu9AiNHFTQ4=;
        fh=XssiLLdeD1yWZ227bsDoIvImuVXpdr3MYKwLVASPrns=;
        b=qL64IJKhW7wSvsfSOs8XxNrSXSW90TA581osb1zyVi7cCt64YW/Xwj3o4sFmjZxWF9
         +Pku4yi/7E0RbBgBhebaQPa9oyyDSgvrzh8tnCE4RI0X3Vg/Mxm2oUvR7iCPvmr4MBkB
         mRwvGsucj8rbKjkijknwiGJ6RLlBIAM8YpNSIwGAAgdGB8LDfGMocttPxz4Y55DuXBlV
         QX20sgzaEDtltjOvudyWNpoLWnnedG5agqoC0AemVdFTeq699tnsZcfw9AUt3nWGZDYN
         BBRBADzo/Hu2Wz1simsM6+O6jFgtzGhRzkwW1qonEL89QqvLKQUQJVot7I7eu6dl4k17
         CatA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910760; x=1783515560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I12u05M04GIJMyEzopRm5q+ddLjVLgxkEu9AiNHFTQ4=;
        b=Yz5xnWC+gmrtrHxAjfJk+6Hl9SSLW6BAzxn87+tPH63tNyPKO9neePaAXutSPluUC8
         J2fGqM+W4W1vy/ZuGpZCAszW8U/MArlaXbDEpEHfkNq8PxogBU0Te7bZUyL4ifP19yLL
         /xjI4cukkCzr87afEue0oEQMf86MRrCUlgRlKKG47cwf+4EbjcDIXgNaNdfcIp4JYW4g
         ap7wcB0gHMNAa4kTN/r/eaye7tBKqvMVW8OLcrTeoB2QEDO0Ed9Re4LUGmyaBMaqv7zp
         UNHPBSq1yA8qGmTwZy9yuTEECPijqbnkIKlfph4NFSGCl2E634UEbXfdNZf/5F7LItqm
         2exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910760; x=1783515560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I12u05M04GIJMyEzopRm5q+ddLjVLgxkEu9AiNHFTQ4=;
        b=tWXW42bbROnz/17Yu+GmSx6YGZlFYZuxgNxTGzWeglJHf86jn0JxyjAJqkcfhytlkL
         FKW7BP5AVzUG+R87/RxcIvpunG3wpPFbeNY51iWDLbGHQSxRc5DLFusElk8iCSokKXVh
         dm1G5VzckASI50oAgbTNVFFGa78Xo6jjMQl0zNX/UVHr++xhCZCoWfFhnaJeha6Q1+Hs
         LqwBIYQF+4n14LmzvXQKyeT5F9c0W01v7zKVVdAYp0kgQHvrTmyh0pxnf//vVzLuxCqI
         GgJXBtftx+gVn6taDSdg04oL59OOuHV0LAPZfam+3uERLSdwqjzP8tc8L7X/u0642OaG
         dbLA==
X-Forwarded-Encrypted: i=1; AFNElJ9+ntNr9Il1pyAHTcJ84OcbKBRkMmOUZVGmhPk0O7/t/z2nZsflqCvG0+Id42+G4TuXNjQyjZeTOVgpCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUy0fe1mnUcETo2M22DKBOt8IoPUlC+dT5HAJyMKmOm7jCGOiA
	GdRskMXezLpPnnxBSK4tvsky5iZhZpmJnXJLlLoAKDrDlAsmcmLZjB7OufYn6XJgDXnUPoJr702
	F8g8o3fgDaittuvgZgVtA4tJw/FgK63E=
X-Gm-Gg: AfdE7ck79FomWtTuukaQYOft0V2tSB6NB0T/0wIGq0NcijxIMKjF9dZ6dtfGs9VZ5rm
	ZIBRZx91D0AUIQuv1cROsV6QsyeMSlaGJAbfARiS/XiuYn9EbqFNH45vXsXqaan5Ju+lhQRRRv7
	7/hEubVvvX3YnP3IDn68TVGwNrgAd7QXiQqzN7kmv/qgE9RiZjp5g+l6tM1Md/GbL1irBIj4oG/
	JS6hlGVl+E1WmVOHKHhBuMHM/hyBGqqER4O/RuoCakhmginxotlloeavPqPhDapA7zRPIm+62rN
	yLeEwP/rf4DmX0oxwgn72aWZeEaOLLIqh6yAvVd26Og0NFDezJR6ajwIhFsgGk0=
X-Received: by 2002:a05:620a:d89:b0:92b:6805:91b4 with SMTP id
 af79cd13be357-92e78502506mr218279285a.60.1782910760182; Wed, 01 Jul 2026
 05:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625160228.59672-1-tharitt97@gmail.com> <178246824177.1799417.1678746966574660598@freya>
 <CACak8wPuBaGCBbBrpoPQ5ftQRtqwijvN_VJoRGs7FzYBGck-iA@mail.gmail.com> <178288879026.1799417.14880182647984884282@freya>
In-Reply-To: <178288879026.1799417.14880182647984884282@freya>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 1 Jul 2026 19:59:08 +0700
X-Gm-Features: AVVi8CefPUI_1MZTpUYM1EfQ4-7Zg3GwL1pgE8KRzv8SKnVNIdtoEvFAF9edydc
Message-ID: <CACak8wPrxewpdvcqX2eCPPAaA_WaTfqtGshrZ7qTDcqpbdmX=g@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: fix test pattern ordering and add patterns
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-66224-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6B486EE241

>Yes please do so.

Thank you. I have sent the v3.

Best,
Tharit


On Wed, Jul 1, 2026 at 1:53=E2=80=AFPM Jai Luthra <jai.luthra@ideasonboard.=
com> wrote:
>
> Hi Tharit,
>
> Quoting Tharit Tangkijwanichakul (2026-06-26 18:08:20)
> > Hi Jai,
> >
> > Thanks for the review
> >
> > > Do you have a strong reason to switch this to the datasheet values?
> >
> > I must say there is no strong reason. I'm totally new here and come fro=
m
> > the perspective of someone studying how to write a camera sensor driver=
.
> > The datasheet says that writing 0x1 to reg 0x0601 will set the mode to =
solid
> > color test pattern. So it is "natural" to expect that I should set
> > test_pattern=3D1 to do so via v4l2-ctl.
> >
> > > I ask because this might break what userspace applications expect
> > > (libcamera) and also automated capture tests (that compare md5sums of=
 the
> > > test pattern) in vendor board-farms.
> >
> > This was totally oblivious to me when I made the change.
> > I agree with you on this point. Breaking userspace does not sound like
> > a good idea.
> >
> > I'm open to making a v3 patch and only introduce new test patterns to
> > the driver.
> >
>
> Yes please do so.
>
> Thanks,
>     Jai
>
> > Best,
> > Tharit

