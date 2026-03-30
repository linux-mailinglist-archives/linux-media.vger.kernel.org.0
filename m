Return-Path: <linux-media+bounces-57529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAZkDebSyWlj2wUAu9opvQ
	(envelope-from <linux-media+bounces-57529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 03:33:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87975354982
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 03:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 262F8301724F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 01:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B3B25DB0D;
	Mon, 30 Mar 2026 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayONojUb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3AF212B0A
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774834380; cv=pass; b=HRP7uparSUMP9JwqbufNcd2WcD72N0wAT4QTcYXAtsNsNN3H7H9bIeqkn7kULm2POLlFK/TbLpCrpwry35ximgOfWLwF+777j/qqS7UWMroUZItLgXg08Y7GeUhEGw0yXRkwQD/yVKQzI7+AvdoqnSJt/xwspmtwRou1KHzAc5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774834380; c=relaxed/simple;
	bh=+Q1YyVNJu0ZiaK+qjFsoCmBsOlxRu1PCmfsnheR2rfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONTnm1zTXgLnXJOY21grdgvIaCXhA/+c0ZuWaxgofEaTbgHMPi8i1SCmj+iC+WGcg/u69YtlQtAsbsdV2FZT0JKbJeqqbj3J/EfqHxkVkevrkr8UDxzP89K7X3SNKdaoxbwVWvV/IHJlUM83rPpMy2r3ZzbrsP0MLL99CS3Q0pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayONojUb; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-604de452750so2290062137.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774834378; cv=none;
        d=google.com; s=arc-20240605;
        b=KisfrE9TeCpDR3Plaa8Nzjrthu7JtQWyfl1fe97unxrPud+T0Xv2g51hDwPlaDoPIJ
         xNoKSuK/iNMLte/Onz5fNhgFoXtoZp4GqSTE2zZbXJsu8iOBnAO6/O9lxcHabZi9GsbB
         20eGC1z3jim8fKT8+/fcrk3FwA+GazgmiEsjXZTmwBrbkVxD5zxziOrdMWtRfJmbTONy
         Lxpp0UH4TP+98cTZoHYsBmzTtzuUWDRTJBkwTvOLrwaovf6mHhw5IEIR3aX9YKhUe5Y9
         Gu7vVQQjAReRHvH/nc+tisSg9fIiLXxLM9kne5CZYMGk+nnneAbYpwBLt9H0rIH4p+/+
         igGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i3YnJTDVMbGBpA8luj4wZy2j0gbaE3JlsAMh7Iwdxws=;
        fh=0CPadCZQBqukoP/QPCMrMphk/g6owYU8v7KuIkomPJs=;
        b=PZ/IaOKP057hjj6NLP+fwE07BKjpGRUsT1jgj2OBeeyhhZQIznXlwktqc6uWQ/mYq+
         LdDAmgH2sS+/xyhakbsCpnymcEk9tXLDU0BtWQ14HDNvsuxdP8VeO9wFrC+70gKcNXgv
         +Cz3noS5ricCVD1umbYSIcUlEUsEXWX9hd/1OuaNPRub/e5VJNPhorIzQnB0S+7apl8C
         B25z3HNKdoZMk3Y7sOLVQu4BTnICD3ZO5jMF7QOPrPRHpZYeBgMNIXh/XG0VT8q/gr30
         hru/JssygHvjZTvSgxwkKeCZcavf+fM3HF5b8dHiPtRMHCQfxLBNPd4MhwMr/gA+EysD
         V11A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774834378; x=1775439178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3YnJTDVMbGBpA8luj4wZy2j0gbaE3JlsAMh7Iwdxws=;
        b=ayONojUb23MYIn6LPm6cqVWCUU8e9ESF79jOcrEX9PZA0YmjGaECTHYKGouTuwX/Si
         aEHYUpXC0VkvgnbpGn6FiyBAHjltcz/Tgc3wA60R57jYexrBoiPiNaiu3PkRdtTSDUkI
         pUi+10+b2QzNIuIPh5I2HMTcNf2LWuzmErEGCuupqbqMYEpwna1uog+f6VmkQEmA50Tr
         etTOUPvY5NMSw3ejIyNRV0mfe+B8MwspBgW+cHqsJWyg23scylSw1R3GrKJan5lNmf9Q
         9Q07sbwYt7bTULQ6Th8aDnFGSHjpHIIz7rwmm7TU97f+OBE9tSdUwn98ML5l/mlHBQ9K
         m8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774834378; x=1775439178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3YnJTDVMbGBpA8luj4wZy2j0gbaE3JlsAMh7Iwdxws=;
        b=WECWlCGibMbf9ECsELhHTynn7xvZosCj8Kg/EtUTOV3MDDDHriYk3gy7MErUdypjtw
         IXnRzyiv8pJbZ7+wImxO4jlgakl2u11kq0ps9fDJmddmBUGhpfKi6GJRi72Atz2UmK0V
         oxrwwSJROXnToesxRc5tHbfa+v+cc5suLxGvB2XN+H2veYt/OvtVZJsM0nXPOd5oXd+I
         wd8J9ZIovV+uAuWpC02gK9DnF31zxheAZ7V5s4HpZG+6fRMlJrRAihrLiz2tA4TtaRcu
         vNy0V1wjS/Roqr592E5u3tndUQ6LVRfjZPs8SSgLuQiKpq7KoLuss89W7Pc3WvcUzwKJ
         vNwA==
X-Forwarded-Encrypted: i=1; AJvYcCXTPEIN9dnzdEaeZNpixxrzv2PwaXzeG8BqsfG+H2M7G7srVFKged4u/I2J6D48YcLqKHIDImk7QUvmUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkFLH6pIlOvHLyJG7To31fwqr+jfdAxD8fe8P2dGbTYvDVKw/M
	LasNA/EAn+gsphHlvkUsbNnYARBFU3On0/Zxu/mBtz9175goJb8/+hKiGjLUmPDWW7xBI8BXgH5
	mlgqYSaUTb2HhzH2IghP3mVgd/fQ51IQ=
X-Gm-Gg: ATEYQzzWGel09Jq6n6gs8n11j5CXFr6FraAnfzVeamnWdTtSQnPBc62OAgB9b6+ULXh
	dFCmtVHVHBOR7Gw1ZJXqIfWRB9QtRA9npTUWd4qk3mJ69PIhnpbzJwqy8KqwCwRerQMOdISp6QC
	/7tboHvCzSD5NhHi9aFbaQpRSlDaeE4lLfNFjfq7UH6bZuIpzoN4ABx8t0vPAK7cSdyWSK+LdPX
	xnGjn/ANeryhxgE+hTg4LHxN0Nu9p970nvrd6EMdqInOsdujkUCrxtxJPAMSYByYoLG0hLqnTZN
	rFa2G6GD
X-Received: by 2002:a05:6102:4487:b0:5ff:d434:b507 with SMTP id
 ada2fe7eead31-604f9207795mr4316477137.17.1774834378255; Sun, 29 Mar 2026
 18:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327031106.10386-1-anushkabadhe@gmail.com> <acZo5LUXH70-UKUi@kekkonen.localdomain>
In-Reply-To: <acZo5LUXH70-UKUi@kekkonen.localdomain>
From: Anushka B <anushkabadhe@gmail.com>
Date: Mon, 30 Mar 2026 07:02:21 +0530
X-Gm-Features: AQROBzDweibRFky0Zl_dhjis5V0cWFM51ww1g3cxadOAkOjsn4Z5X4Ceh9EJJ4M
Message-ID: <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57529-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87975354982
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 4:54=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Anushka,
>
> Thanks for the update.
>
> On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:
> > GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
> > globally visible.
> >
> > Move its declaration from system_local.c to gp_timer.c and make it file
> > local by marking it static. Remove external declaration from system_loc=
al.h
> > and its usage in gp_timer.h
> >
> > This fixes a sparse warning about global visibility and cleans up
> > unnecessary global exposure.
> >
> > Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> > ---
> > Changes in v6:
> > - Mark scope of GP_TIMER_BASE static
> >
> >  Changes in v5:
> > - Move GP_TIMER_BASE definition to gp_timer.c
> > - Remove extern from system_local.h
> > - Remove include of system_local.h from gp_timer.h
> >
> > Changes in v4:
> > - Remove unrelated block comment style fixes
> >
> > Changes in v3:
> > - Add commit description
> > - Fix subject prefix to staging: media: atomisp:
> >
> > Changes in v2:
> > - Fix block comment style (move closing */ to its own line)
> > - Merge split GP_TIMER_BASE declaration onto a single line
> >
> > Note:
> > * This patch is part of the GSoC2026 application process for device tre=
e
> > binding
> > s conversions
> > * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-De=
vice-Tree-Bindings
> >
> >  .../media/atomisp/pci/hive_isp_css_common/host/gp_timer.c  | 7 ++++++-
> >  .../media/atomisp/pci/hive_isp_css_include/gp_timer.h      | 1 -
> >  drivers/staging/media/atomisp/pci/system_local.c           | 6 ------
> >  drivers/staging/media/atomisp/pci/system_local.h           | 5 -----
> >  4 files changed, 6 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host=
/gp_timer.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp=
_timer.c
> > index d04c179a5ecd..0c1b67988dd9 100644
> > --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_tim=
er.c
> > +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_tim=
er.c
> > @@ -11,7 +11,12 @@
> >  #ifndef __INLINE_GP_TIMER__
> >  #include "gp_timer_private.h"  /*device_access.h*/
> >  #endif /* __INLINE_GP_TIMER__ */
> > -#include "system_local.h"
> > +
> > +/*GP TIMER , all timer registers are inter-twined,
> > + * so, having multiple base addresses for
> > + * different timers does not help
> > + */
> > +static const hrt_address GP_TIMER_BASE =3D (hrt_address)0x000000000000=
0600ULL;
>
> Please don't move the defition here. There's a reason for keeping it in t=
he
> same location with the rest of the offsets. There's a lot to cleanup here
> but what should be done is roughly:
>
> - Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and move
>   them into a separate header (perhaps with register definitions?).
>
> - Remove my_env and make struct device (or maybe struct atomisp_device?) =
as
>   a parameter for register access functions.
>
> This may get a bit complicated due to the amount of cleanup needed so
> having the hardware for testing would be rather essential.
>
> >
> >  /* FIXME: not sure if reg_load(), reg_store() should be API.
> >   */
> > diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_=
timer.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> > index 94f81af70007..e651d9ef1114 100644
> > --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> > +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> > @@ -21,7 +21,6 @@
> >   *   - local:   system and cell specific constants and identifiers
> >   */
> >
> > -#include "system_local.h"    /*GP_TIMER_BASE address */
> >  #include "gp_timer_local.h"  /*GP_TIMER register offsets */
> >
> >  #ifndef __INLINE_GP_TIMER__
> > diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers=
/staging/media/atomisp/pci/system_local.c
> > index a8a93760d5b1..8d4fd80f8984 100644
> > --- a/drivers/staging/media/atomisp/pci/system_local.c
> > +++ b/drivers/staging/media/atomisp/pci/system_local.c
> > @@ -83,12 +83,6 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] =3D=
 {
> >       0x0000000000000000ULL
> >  };
> >
> > -/*GP TIMER , all timer registers are inter-twined,
> > - * so, having multiple base addresses for
> > - * different timers does not help*/
>
> This comment could benefit from fixing, regarding both formatting and
> language.
>
> > -const hrt_address GP_TIMER_BASE =3D
> > -    (hrt_address)0x0000000000000600ULL;
> > -
> >  /* GPIO */
> >  const hrt_address GPIO_BASE[N_GPIO_ID] =3D {
> >       0x0000000000000400ULL
> > diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers=
/staging/media/atomisp/pci/system_local.h
> > index 970f4ef990ec..2bd46f5123fb 100644
> > --- a/drivers/staging/media/atomisp/pci/system_local.h
> > +++ b/drivers/staging/media/atomisp/pci/system_local.h
> > @@ -53,11 +53,6 @@ extern const hrt_address FIFO_MONITOR_BASE[N_FIFO_MO=
NITOR_ID];
> >  /* GP_DEVICE (single base for all separate GP_REG instances) */
> >  extern const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID];
> >
> > -/*GP TIMER , all timer registers are inter-twined,
> > - * so, having multiple base addresses for
> > - * different timers does not help*/
> > -extern const hrt_address GP_TIMER_BASE;
> > -
> >  /* GPIO */
> >  extern const hrt_address GPIO_BASE[N_GPIO_ID];
> >
>
> --
> Kind regards,
>
> Sakari Ailus

Hi Sakari,
Thank you for your reply.
> There's a lot to cleanup here, but what should be done is roughly:
>
> - Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and move
>   them into a separate header (perhaps with register definitions?).
>
> - Remove my_env and make struct device (or maybe struct atomisp_device?) =
as
>   a parameter for register access functions.
>
> This may get a bit complicated due to the amount of cleanup needed so
> having the hardware for testing would be rather essential.
As a student, I don't currently have access to the hardware needed to
do the bigger refactor safely. However I'm happy to fix the comment
formatting and language.
In earlier versions, I had merged the split declaration of
GP_TIMER_BASE in place in system_local.c before later moving it to
gp_timer.c.
Link: https://lore.kernel.org/linux-media/20260325132434.55775-1-anushkabad=
he@gmail.com/
Would it be okay to proceed with the simpler in-place fix for
GP_TIMER_BASE declaration instead?

Thank you,
Anushka

