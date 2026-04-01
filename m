Return-Path: <linux-media+bounces-57889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDGzHhNCzWkkbAYAu9opvQ
	(envelope-from <linux-media+bounces-57889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 18:04:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705D37DA81
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 18:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1061230601B0
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 16:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A86545BD4E;
	Wed,  1 Apr 2026 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR1qRMeq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190244D68A
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059388; cv=pass; b=i9ewwfoqvN7ZCef/Nj+IhaTkvfdKqBJwbTmTqdPkmZYytpS3D0Yi6LV9St8kYVVv/ssSGQ0IfKedHhw+Hq7RvUo10DvpOPvuFWmdvNNFfYgyN5MLzj7s0Y62bSVCSARuaid8ObYRCqjSMGxvFWw1fitR1D4A5pG7GgV0i7M6gwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059388; c=relaxed/simple;
	bh=BlFbgD83On9yJwJTCrqpyDsa7llGSgZ8ZbMiF17c/SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knhugCXn5Bz/4iTZUWlsCebE3zGtOx9ThQZ84Tu3uzjcoALI8NV3SUIX46WuEnVSva4nCev7rN+igYKp3WSDD+h5V90zE4n5QCpWap88/rE4TC9Lax1Dk2F5G8rUP79TB7LYhl7toaiGo06Is3BW7Pbs4oDHnPh2eklCDJ+XgbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR1qRMeq; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6054ce34c0fso1003352137.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 09:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775059386; cv=none;
        d=google.com; s=arc-20240605;
        b=OFjEjnTBqfsdpVdmLypDwhD95NcmG2koOGSpVZtFNLHlj46r6bsSYvwK5JhLvdwFAa
         gff7J7AipKJ6BTXSw6hE5kiDZiDsjk7sVIImB/jWfH1fzXyqOUlBcg9b9QRpOVlID2tS
         n2rbncPOK8Vb7w+a/K9NxCuhtEw2lfBxvvFs6nFoDfbmL74hBkPKj0Lt6DHArIh5hgRf
         DQ7VYOZMh6DCArWNRRS1jS0o+sw7KOeCvIEy6vM/RfACJ6t7ab2HUIyxuJlIsyuv4jzQ
         WZ5he5vT4KokCtiU7rf/oUW+BBG8SvGdAMBiAWxqxtFNhFlNwhxib42kHzvWKgRk3SkM
         1ELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWBm097o/NmYsuE5hv1aBoOkjyXB23DVWkezN42y2/A=;
        fh=To2v3zdAR5Ul+4F86vFT8/3to4Zuv13OfD3g+szHlhQ=;
        b=bluW9jyL4AF/SnAFoPx2NOh3bstK93DTkRnBuV8qxWPOk3x6fxD+Uf27Sr+0uXrE8/
         MV+EjgycRx5u8YsqNG8tYN4MKwvDoGpKFQLeflgVWrV33P48a4y1QhKVd3sKLUvdGdHi
         8g2KynOnFL9cL1IkY2JAWAUaxoYAfppjmtF6T0tMwRlWheW6WFGNnX+s02w2otyKImK3
         QtRAN2JuxCkvIrma9wOsaNBMJqAyxxOuqb0vRcr9ZeKKQvquKsJPxfjvGotUTI3bOJaM
         CGpIIMAgKdAXgB/UZC6yWGp3JQiBt64yBK6VAzgV41NWSG8BGZi1ipIx5U9NWGp+CVFt
         vA3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775059386; x=1775664186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWBm097o/NmYsuE5hv1aBoOkjyXB23DVWkezN42y2/A=;
        b=cR1qRMeqYI/ur2SJMwuFYbAPYHZCyFYHSzBDmbAxYzH02zaSuJo8RmcpH8NxYSgyBf
         ygmXuAcJAOXMR6NqB6KfzYyC5gl3SaQm+m8o4gThmmI1Z8fp3he8ZixO+gcSOxrlowG3
         mBYDrsr1yUrkew2J7lKAyJFgoVfKRVCWYtPuH+X+fmBfJlyT6py77M6lXL9D3q9nVYWU
         ogr7iVOtl3U77Hr4jN3SsDO1y03LROT4Z5SCy/0wA/mUlgkbM6hM1M9gSEhhVMVdWcpT
         QBu1mSRPcDynLCjpFzndizBCyODJhifF0UBd13lTXwp4ThfkyYEvSnvo6O0u91WD42yc
         vblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775059386; x=1775664186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWBm097o/NmYsuE5hv1aBoOkjyXB23DVWkezN42y2/A=;
        b=d5R9dZN2vnuByeo9YmPjQ6/x316mQYKvHzQ8yRhRKWDsiB1yaxFlHVYyRDMrJLQ/xb
         aDHrO1ofG3jjM+LPJxj8EYsHnc7RRUuT8RyvlofCVLsvvEDFs6QM9Jq4CuQ1CTK7kJXh
         PChU/Iw4s9sMMnFkmpQjRLGlfmQkTgWz61/HqmlJzpXSENErKmziHIDHqKV2z3IBGFLn
         wFirwyfaQXKy2cd7gx49I830qkbzgKJaot2heps2oIPf0A4PXgmS7E5Pe8MmMoh3Hr2A
         ptyZZHTlUw/HQA0+kxCu/gqm/9JAERoujsO0zryNEutmQ5uwsy1g8jbnfEMr09wLKnLu
         +Ohw==
X-Forwarded-Encrypted: i=1; AJvYcCVzdXHrQxUn2BkPIjgAqQVPoioY1Sp+VyHJ5DgjxpVrT/ZS+tgW+4dXXqRUNdI9uNwAYd2ZkE66DtvKEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp59RFbWR82S3NzAtutbzJ9I+oCGuq3VZmXuEw8B/11/dfLqE9
	brTB/v23h+Mp/fWjb0MXrXq7CL8Gy2qKNEj+5yqC9myQqmHEtzfLNFzhnEzbrEEAw9Evod4jh/8
	7N7JxtHo3cBMa+4ubueCjuuUJxdlqODc=
X-Gm-Gg: ATEYQzzeoaE6mVOsNFanVxy+Elo4U629PAKAjTQ+zd6pEL7Ih7XeewZNkpPl+WWDrxW
	9DAJyvy+huB1PUFLmItEWP6jiaQ9iJbjUCvbLJ4dkfuKUet7rd/vWBCME4tFYZJkB2Gv/7No7rg
	3LSOdeZDFKcs4f55QiQITlGK1k76KHql9gLOIGWzlB9PNQ3g//PsAQYQ6IsEw1SulJ0HFz7m+nY
	Jx0T5sUE7tB5xbHkBz3rt0M52Tr/59kw/E2quP45TuvHISzGnxdSEGs2c+zqRkFRKidnCcHarJC
	XZMwP+qC
X-Received: by 2002:a05:6102:1612:b0:5f5:4055:4558 with SMTP id
 ada2fe7eead31-60567d381a0mr1586750137.2.1775059386272; Wed, 01 Apr 2026
 09:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
 <acZo5LUXH70-UKUi@kekkonen.localdomain> <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
 <aczBS_KJQa_j97RP@kekkonen.localdomain>
In-Reply-To: <aczBS_KJQa_j97RP@kekkonen.localdomain>
From: Anushka B <anushkabadhe@gmail.com>
Date: Wed, 1 Apr 2026 21:32:29 +0530
X-Gm-Features: AQROBzCynCEgVXuUpyeXfY2mLkrtfTBAwk9eRsCwaRHI32FliuaMQyv840YyuW8
Message-ID: <CAAfE=nOs9YfpnFGY+bPg1WPxuCHOzkR9oHD9DizNxxse25A0hw@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	hansg@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dhruva gole <goledhruva@gmail.com>, m-chawdhry@ti.com, 
	Simona Toaca <simona.toaca@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57889-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,nxp.com,gmail.com,ti.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2705D37DA81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On Wed, Apr 1, 2026 at 12:25=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Mon, Mar 30, 2026 at 07:02:21AM +0530, Anushka B wrote:
> > > There's a lot to cleanup here, but what should be done is roughly:
> > >
> > > - Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and m=
ove
> > >   them into a separate header (perhaps with register definitions?).
> > >
> > > - Remove my_env and make struct device (or maybe struct atomisp_devic=
e?) as
> > >   a parameter for register access functions.
> > >
> > > This may get a bit complicated due to the amount of cleanup needed so
> > > having the hardware for testing would be rather essential.
> > As a student, I don't currently have access to the hardware needed to
> > do the bigger refactor safely. However I'm happy to fix the comment
> > formatting and language.
> > In earlier versions, I had merged the split declaration of
> > GP_TIMER_BASE in place in system_local.c before later moving it to
> > gp_timer.c.
> > Link: https://lore.kernel.org/linux-media/20260325132434.55775-1-anushk=
abadhe@gmail.com/
> > Would it be okay to proceed with the simpler in-place fix for
> > GP_TIMER_BASE declaration instead?
>
> I'm fine with v4.

Should I send a v7 similar to v4, where I merged the split declaration
of GP_TIMER_BASE, and a separate patch for the comment fixes?

Thanks,
Anushka

