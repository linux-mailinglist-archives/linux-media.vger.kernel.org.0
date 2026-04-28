Return-Path: <linux-media+bounces-59855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMhLHva88Gk9YAEAu9opvQ
	(envelope-from <linux-media+bounces-59855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:58:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E839848667D
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ECDB320D713
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB22A43C046;
	Tue, 28 Apr 2026 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hhw4JSj9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C4142DFEC
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382290; cv=none; b=O6X3CrbgbYzCPdb69UwNit22Jp9GGB+gZhtBDBhrQ60+U1WOaXxTPy9OHMm0ynEYVG2tFd9m4x8Y6gkFdAlxjk98TyIMzf6TlNDU9qt1fqR9Gf7zyYCBjSGlHPvlEHXU7hUFom6LxaESrNlyHJq2/51IGlkCLK1GdHctgN9cRZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382290; c=relaxed/simple;
	bh=GoFtavOANxd5Dpn+DgtwGPY+eFF0TLHfLd0V79Lgprc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqlSgz08IwjjRlKtsX9YQfEQdr9zbGd1LHyNpGZm8N8ojNL5+enpN3w2fDRg9yS+N3uHDFs7S4aDAB6M3dibzFYhbljwq9LmGmQBT0VpUyuKTI6o3cfApetxjcZYPeN83CLHsN/5ppVIJV249jtp2CsmLDRamyGoUf5bBSKImr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hhw4JSj9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so15971169a12.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777382286; x=1777987086; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4nL+mhiBMlL1ot0sxxOKhc8UmtxQn3hHA96Y9Zj2WY=;
        b=hhw4JSj9PpX0H5L2JL+h7m11filPb/eFZ0xdID+SbrqupZGv5I0PWpD7eoFEhgrbIN
         ItDsJZ77HaP0xE1hyRDi9HkBxvTUY+7oz6JLzhPz3CmA9TLFiCFv+wKe/KelqvuzCX63
         2odk2jjDvcozLoklHMRbjHFhnJPjqMrRzlMTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382286; x=1777987086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4nL+mhiBMlL1ot0sxxOKhc8UmtxQn3hHA96Y9Zj2WY=;
        b=S8L5FKTDSxVVrGw+g+YCtyObvZ2JTNapPIIAUNStDiMfxCC+ySTF3jmFc53gTpvtLO
         4BT9nGjUU9DBmsmeef60V3dYrJYIvkA+9hfwTCqIhK/kzRWX7v6DNTkPm5px4OoQ9MA9
         27sKZVVKv1qO45x/jQrsV2yu4skMq3Rrmkw/L9avBygGQOaSp1oEVxhiIfPPkqjXgKJJ
         kSp3RkE1eW04ZI6mYjLctXEgIdBc1sth2dt0uGUotRKBb4JlU7uOcEYpuYE9+aka1meS
         4KzS8DijExbBHqjR/iQ3b6KWmcbQuQC1fK1KpfBcI5Wsit1dlxxv/fV49ag7Wn0+i8Ck
         cqSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fyQNzLuVFqVnSIpWBLTJMK4F81wuf1mNVKDAJgHyfAMpFQX+F56BrFkayrmlCLEqa/eYaL2GtzMtywQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhbEahw+pEm68BZvHvDyEEWZ1AQs3WDTrFbkpnVO5U3ygKoFOZ
	eFKn9/OrhmTZeR5AdBwPZ6bQoGKWVrUxN9BrmaQ+2tzntNXSE+kbmUHOBwsejLhJYtIUJZ/rKeT
	n9WMXMimt
X-Gm-Gg: AeBDieuA2nivZ9p2AN0V/puKxyw954KvZ8ngBDO5aMTtlLGkdjf9ZMBsN22ulDQRlRK
	QRTB8i0yFMdXWpfZoHAnVm+5FhLbxNe4U3b1UUJM0GQUyO64rW8Gl5pRXPaQ8q9dKet+IeHPNPO
	SjlEfgQxWZR/rphUJ/EWzL90OyQpCiw2fbKN7xPrrvWONeZdvA/LhpODqhod4lvVpw/JE96IgAb
	dfFbXx0AkzAWVa5pNmCABwj9XIsZ6Ggqyt8uMZ3uLsp/Pea9dwdsUjQNq4KfUbxUq0r7Q5eyzW4
	NIdP0z1S8CeBwRipgN8z8M8vWwtAQcch2nzzfLU1a9X8K9xNnhgYi7wp9yfK5DbxIjXVBKeO5ly
	lSgzjTVBZ01MZiKOU3aM8kwVGwVftol54Ts0SoLWUx7VkM9VWk0MawT7FMvrqieh2QR6QBsih6S
	Gpn28uj9Y9C4W83hGYIBQu4bw0beTGXHbN4X9fVUbYxWJ0s0qgLqXQN7nxlzqdiGDbwLyySXA=
X-Received: by 2002:a05:6402:5216:b0:673:b696:8900 with SMTP id 4fb4d7f45d1cf-679bb08b5b6mr1518100a12.18.1777382286447;
        Tue, 28 Apr 2026 06:18:06 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67e0566sm765760a12.13.2026.04.28.06.18.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:18:05 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba51e69988aso1550995666b.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:18:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PQfgPuXqdXsVn49F1DJ5p6PfEEMcYJWa7qgQnr+OWx9vHI+m0M5Ks0UIaoKsYSIXHdO8RdWPM637Wfg==@vger.kernel.org
X-Received: by 2002:a17:906:6a1e:b0:ba6:5855:1cc0 with SMTP id
 a640c23a62f3a-bb801dd37a4mr198922366b.2.1777382283839; Tue, 28 Apr 2026
 06:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-5-46890dffb611@chromium.org> <20260428131347.GB120836@killaraus.ideasonboard.com>
In-Reply-To: <20260428131347.GB120836@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:17:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsEF9Q0RiPgqLEhJPK1JFQfxu7WrUCQ--7aFs6eyhT7=w@mail.gmail.com>
X-Gm-Features: AVHnY4IGFuF0TEsmvQhosYg2GkeMR-wYMqcIqC6FiaaAaRTptZOaCUuyEseN7nc
Message-ID: <CANiDSCsEF9Q0RiPgqLEhJPK1JFQfxu7WrUCQ--7aFs6eyhT7=w@mail.gmail.com>
Subject: Re: [PATCH 5/6] media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E839848667D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59855-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid,chromium.org:dkim,chromium.org:email]

HI Laurent

On Tue, 28 Apr 2026 at 15:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 28, 2026 at 12:41:11PM +0000, Ricardo Ribalda wrote:
> > If the driver's stripe information is invalid it can result in an integer
> > overflow. Add a range check with a WARN_ON to expose this kind of
> > error.
> >
> > This patch fixes the following smatch error:
> > drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> > index 2c48d57a3180..6ed23c7a0c3f 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> > @@ -1770,6 +1770,8 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
> >               acc->stripe.bds_out_stripes[0].width =
> >                       ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width, f);
> >       } else {
> > +             u32 offset;
> > +
> >               /* Image processing is divided into two stripes */
> >               acc->stripe.bds_out_stripes[0].width =
> >                       acc->stripe.bds_out_stripes[1].width =
> > @@ -1788,8 +1790,10 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
> >                       acc->stripe.bds_out_stripes[1].width += f;
> >               }
> >               /* Overlap between stripes is IPU3_UAPI_ISP_VEC_ELEMS * 4 */
> > -             acc->stripe.bds_out_stripes[1].offset =
> > -                     acc->stripe.bds_out_stripes[0].width - 2 * f;
> > +             offset = acc->stripe.bds_out_stripes[0].width - 2 * f;
> > +             if (WARN_ON(offset > 65535))
>
> If this can be triggered by userspace it shouldn't WARN_ON().

v2 will not have the WARN_ON.

Thanks!

>
> > +                     return -EINVAL;
> > +             acc->stripe.bds_out_stripes[1].offset = offset;
> >       }
> >
> >       acc->stripe.effective_stripes[0].height =
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

