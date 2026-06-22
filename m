Return-Path: <linux-media+bounces-65365-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i4HlJggkOWqLnQcAu9opvQ
	(envelope-from <linux-media+bounces-65365-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:01:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 312F96AF42B
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:01:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HP4KpAFv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65365-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65365-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84C7F300F5D2
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B15B2E0413;
	Mon, 22 Jun 2026 12:01:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471A1371D15
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 12:01:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129667; cv=pass; b=UhNk7cx9utbv3Xx2oa1pok8KD7KGGgO7nDzusNCP+PTgUELGNLTBa2jlJ9bSyDt+qfIVMWq7edWcniJAHX5cLjs+a8lhX49/0Z1BCBi5n8/K4P7ppvjIZr3HHSO3/5sbtfHiOvnQM1xU80LjNz/fKAtYnmdfMsnPgSHuAL4V/XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129667; c=relaxed/simple;
	bh=ZD9tGJJOmrxjp+XXPfu98euctPfzwVJyhsLLMYaGrfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbIbV1pQbXO4gR4o7aFe+LNhghGvD6d20gArA5gzJe5AIZAQVCkC933L9frtwmb3WODs9GeJ+iADpfYennTqckn/PbJlTIUWk04q9wMLDzdK8Qi5JHW9U0bnTkJoznqlceWsUMMDWYxynOvElURY7IhNpO3UuTK1RBV545PfDco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HP4KpAFv; arc=pass smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c0e12cb1d90so122769066b.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 05:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782129665; cv=none;
        d=google.com; s=arc-20240605;
        b=KqbEPWwEUtBgOtOWFoWyvGbuCUpP/RUUZfJbdhKkAJ1wzg1/NvQd0UgtL+90PB0Rgt
         T6oj2G9JEjBlo71Y3Ck4Ua1066dtGcUfito4bWhhZzNHR1JxNSiUVOsADNbK0UxxI3bA
         b8Ps90xgaca0Crgfj8ttkKERsbIHQhKNKkHQuohzh9/fueIHUcP7Qr9g399wtQUJNAUa
         OAz1DC6wMvloz+qLThskXE5c06rYHRMofQ8svn3RxkCM0mwR43d8xkSXCCZqZYJg76DC
         o2rwbsjATfzG8eSLlfex+zKpdhsQifk0uuiBd304WuAtPxrZ+Fx3t62/xJfYjEMrQ50x
         XbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z/UQd6gAiCKpdO/qT7NweWYk9EmiL69nd3YrHKH5p+g=;
        fh=IodCECdzduqA62happ6Oyrp9NTVqad6eWR3ztdpn/SU=;
        b=ZCia257B3OwhxBOVJXfiPlYx0Piv4Gp9SprB5Dg8D4rhsOU9X+hiZybzrf/xXc/DLl
         9zsUpjxLkZgpBpY19Y0rzzb896gPTzO72KVz66Yg/0ntjmVQi7DGjheSDYrpOTEaW3cC
         6lAOJ2Lq7vfo3+cG7gg9SQYmdoPPjKvTRfbS/Ao9d7AWQBxeEfAWwXNQroSEEqclyN+y
         sbltm9qJLeeCLZ3k5MPL6L6XNsXpB7YC1ZWSoCkXUfl0r/1vq6o9flZFGoII0QBg9n98
         gMW7ybpKjRzQxn3Ii/gXGZd0iaUck6Q20TBZ0U5xrv//Rd2sK05/x4jDxup75jrqcQVM
         lPBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782129665; x=1782734465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/UQd6gAiCKpdO/qT7NweWYk9EmiL69nd3YrHKH5p+g=;
        b=HP4KpAFvarJ30i0m1IA4XhHGf1JN2cGmHG5/RhBR3LagblBMwkjj+tr6lakX2UZHZK
         4RbofxocXuRFYKOl69z7vnjO+wL6xjYeXctfiPTy7WcFgss35WTLCRFC2jkgByjK20Z9
         pXOpd+nYX8928hmJIyTgjFX2B2elcCzL5xtojmV99Iql3d20pOsfrkAm3TYupJASixdX
         wLOhBgs1sBEQe7he9eKquT04Q62aUMmWCtC85QBDIWzgV4CJh1hZJQdEShQY73fX1DoA
         iK+74c21kqX2OlRSKN6kw4iqtRTfuJYcXeP/9vam8dGf2OCioWSqtb2AFHBxqeCh0iEJ
         dAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782129665; x=1782734465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/UQd6gAiCKpdO/qT7NweWYk9EmiL69nd3YrHKH5p+g=;
        b=PuwSqYsBwH0d2HQyIbZ0ovcjpgLbfv0AvOk0uwEUzsfJLwjK+JrO1y1/tdRRTX7QSs
         cLiBgtsTNU5PKHSbv+96NgI6MQ/ZDcIHLK4eIXX5DdpONH/+Wfhma3Ci+pnYm06dKlOY
         R98zQT6dNbIYiXBkWbZEF84a4YCjVs0ZKCYKo2xoEfF3JYIRBVbOXpKEdpV4Ifjjhx0d
         BiNJODLlaJBp5XLy8ykxfD+GdpvpMjTNgtY6Hc5cURiP5VVrhlP6ggSP4gjOSQsBDgqM
         UUgqkoJVgwdxpgmNP49iH3/UevXZqNU6EvtT+BXh9Hy6XKFR0JNgpqMl50w+arznUs3L
         WB7A==
X-Forwarded-Encrypted: i=1; AFNElJ+hAY3qS8gi6ojPTjP5LZxEwAJPd9esUqMAInfkkVQs1dHpWl4p93lzdOn3IETxpVAAbAmgYsYFpSiF7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUZFD+1gj9Ph7GppoCvUazTrttaf3yfPO3wkFqMaVHkw0SziPo
	P/ekSx9D7aGHbl9gsHIrPwUUaKRZZSlWYQ/U+0ouQAiXRxYOFS7wPNhOcm1lBkwZksVBK9my1uF
	1+JqSc1aiBtAyf+jfRG2w4URtkWenQw==
X-Gm-Gg: AfdE7cnaAP5YsJ3gKCBRTgKwo8wbZAz3nYo5azfdP9PVikNgz+KUHbgf7KyOPFB4ruZ
	mDmbNEW+twbfRnXqehVV2tRtWdugwm1TdxUS+wESMIYYIQUOroWHFZKxKEV0OV15fVGOKAlhcsr
	q3hGLm+3cHH8PxZX5RK+Phi+/QkLAXmZRQIylTXKmdLzad8ZQiI7mlJ8Nm3P/x2Qr0R63Tuz9L9
	BeLUe3lUAYXCVwQnAEEqQ0tG0IpfA81O/+iuc5QFM3jYQkqzpvkhrrS6AKKs0TgpaSvs/BwYs1u
	8QfU+HXLMz3abPeaKku9zl1Q
X-Received: by 2002:a17:907:3e8a:b0:bec:5264:e52d with SMTP id
 a640c23a62f3a-c097ae2dba6mr734296866b.11.1782129664281; Mon, 22 Jun 2026
 05:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424165238.31333-1-mhun512@gmail.com> <c9c20bce-a1bb-4932-bfa0-c87f7156ff82@foss.st.com>
 <ajPcKcJfbIdPKI8-@kekkonen.localdomain> <02b07f43-3c90-4e89-8747-7fd424d87dd1@foss.st.com>
In-Reply-To: <02b07f43-3c90-4e89-8747-7fd424d87dd1@foss.st.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 22 Jun 2026 21:00:51 +0900
X-Gm-Features: AVVi8Cca7UOWphF8HJsSk1WcZ5pnlyOtgCIPMzJHRCDI7-laXJTy-z3xZ9jXfvM
Message-ID: <CAGEsz8F3P8NpOPr_7wCcr+KOLHjYOXu9=5k3-EaiAvb3Eirvrw@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: vd56g3: clean up subdev state on probe failure
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-65365-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:benjamin.mugnier@foss.st.com,m:sakari.ailus@linux.intel.com,m:sylvain.petinot@foss.st.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,st.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 312F96AF42B

Hi Benjamin, Sakari,

Thank you for the clarification.

I agree. The missing cleanup is on the vd56g3_update_controls() failure
path after v4l2_subdev_init_finalize() has succeeded.

I'll send a v3 that keeps v4l2_subdev_cleanup() in
vd56g3_subdev_cleanup(), and routes this failure through the probe-side
err_subdev path instead of adding another v4l2_subdev_cleanup() call in
vd56g3_subdev_init().

I'll also add the appropriate Assisted-by tag.

Regards,
Myeonghun

2026=EB=85=84 6=EC=9B=94 19=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 5:59, B=
enjamin Mugnier <benjamin.mugnier@foss.st.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> Hi Sakari,
>
> Le 18/06/2026 =C3=A0 13:53, Sakari Ailus a =C3=A9crit :
> > Hi Benjamin,
> >
> > On Tue, Jun 16, 2026 at 02:49:54PM +0200, Benjamin Mugnier wrote:
> >> Hi,
> >>
> >> Thank you for your patch, and apologies for the delay.
> >>
> >> Le 24/04/2026 =C3=A0 18:52, Myeonghun Pak a =C3=A9crit :
> >>> vd56g3_subdev_init() calls v4l2_subdev_init_finalize(), which allocat=
es
> >>> the subdev active state and requires v4l2_subdev_cleanup() to release=
 it.
> >>>
> >>> If vd56g3_update_controls() fails after finalize succeeds, the probe =
error
> >>> path currently skips v4l2_subdev_cleanup() and returns an error. The =
driver
> >>> .remove() callback is not called after a failed probe, so the active =
state
> >>> is leaked.
> >>>
> >>> Route this error through a subdev cleanup label before freeing the co=
ntrol
> >>> handler and media entity.
> >>>
> >>> Fixes: 87aa97fc3157 ("media: i2c: Add driver for ST VD56G3 camera sen=
sor")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >>> ---
> >>> Changes in v2:
> >>> - Use a lowercase subject summary.
> >>
> >> Please keep the first character uppercase, just like other commits on
> >> this module.
> >>
> >>>
> >>>  drivers/media/i2c/vd56g3.c | 5 ++++-
> >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
> >>> index 157acea9e2..43f792288a 100644
> >>> --- a/drivers/media/i2c/vd56g3.c
> >>> +++ b/drivers/media/i2c/vd56g3.c
> >>> @@ -1427,11 +1427,14 @@ static int vd56g3_subdev_init(struct vd56g3 *=
sensor)
> >>>     v4l2_subdev_unlock_state(state);
> >>>     if (ret) {
> >>>             dev_err(sensor->dev, "Controls update failed: %d\n", ret)=
;
> >>> -           goto err_ctrls;
> >>> +           goto err_subdev;
> >>>     }
> >>>
> >>>     return 0;
> >>>
> >>> +err_subdev:
> >>> +   v4l2_subdev_cleanup(&sensor->sd);
> >>
> >> v4l2_subdev_cleanup() is already performed in the caller (i.e.
> >> vd56g3_probe()), but as you noticed it is not called from this path. I=
'd
> >> rather have the return value route correctly through
> >> v4l2_subdev_cleanup() in  vd56g3_probe(), allowing to keep a unique ca=
ll
> >> to v4l2_subdev_cleanup() instead.
> >
> > Is it?
> >
> > If vd56g3_update_controls() in vd56g3_subdev_init() fails, it'll jump t=
o
> > err_power_off in vd56g3_probe() which does PM related cleanup only.
> >
>
> Exactly, I realize my sentence was poorly written, but if I understand
> correctly we're on the same page. The problem being
> v4l2_subdev_cleanup() not being called in any path if
> vd56g3_update_controls() fails.
>
> Now if vd56g3_update_controls() fails, instead of performing
> v4l2_subdev_cleanup() in vd56g3_subdev_init() as this patch does, I'd
> rather have it done in vd56g3_probe()'s jump back so we can keep it all
> at the same place, instead of having 2 v4l2_subdev_cleanup() in 2
> different places.
>
> Tell me if this is still unclear.
>
> >>
> >> This patch looks like is LLM generated and sparks my curiosity. If so
> >> you must disclaim it using an Assisted-by tag [1]. Sorry if I=E2=80=99=
m mistaken.
> >>
> >> [1] https://docs.kernel.org/process/coding-assistants.html
> >>
> >>> +
> >>>  err_ctrls:
> >>>     v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> >>>
> >>
> >> --
> >> Regards,
> >> Benjamin
> >>
> >
>
> --
> Regards,
> Benjamin
>

