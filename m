Return-Path: <linux-media+bounces-62139-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIsANOBeDGoVggUAu9opvQ
	(envelope-from <linux-media+bounces-62139-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:00:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42E57F32A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED56130D4FEE
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32C24C9576;
	Tue, 19 May 2026 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wl9AzlAa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB7D4A341E
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195140; cv=pass; b=GQBY9+k4c8I+ROpRADn/8vGuNFyU+RO/E6rwERxZKYEXpNlOr+TuQxQ2eH/8bJdwim3guVEZyt/jgqMx+0o0jsjELbgD2xbltEMmYbtxDs3ycYdHSXRaLC5cqn5J1+r8h0z0sdeCxxIECnoumqSboSXl6xgwmg6mIyF766EZv84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195140; c=relaxed/simple;
	bh=a4BQ8I08x1EPEigNRSyXm6VtrTFQK4h2Nn2Ek1yqIqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=too8lsBLUi42XONKyKSfGH6OfnWlX6piSX7FHWuud9Y7O96ln8OwwX6OQdwMCgcjsXeJKr69DaX7/ygdUOp+NSk63kWle0LDId5gw9wRYP5lv/Zc5UhwqFh/B7Hb1i8yz7YJrQVnKdaJAxjO6h2xDAqsSZK9/ne9xqq3B5Zh0k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wl9AzlAa; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so6952505a12.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 05:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779195137; cv=none;
        d=google.com; s=arc-20240605;
        b=CIY5RkeRFUXEDvLEzXlJHnBW9k2zFWpypBn2lhqU8s+jIQhv3Yh59QT2J2dgPBzxu3
         UWkCIegXIWyRMpahMERWiqQpr7C1Hr2Lq6T//qK7q18qgKzpkDR4dCPuk3VLN5ajTHE3
         VqciWEnX1jNKtaXAGPViviPKWjh+9mMQ8VVsDy5B82g6ZlAdnR7QzyNZB7zgfjPpJr4x
         svlgFPFWTHL+s6fN2u+qdlddosKQRKF0wAq4PUJfU2sAWgKvUhFGQ9pLd6xnSgO6hKhh
         bG1ZPOIOepfAx/qpkEagqaOb+NWZ5XSV29V+ZhTa/ZWF+9u+qbwW8kqC2Ahjabyh7ELh
         g5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        fh=Ru/ndq0rLjptLLXRHhwvaDFaD+njpDGD2UlPGCvmjH4=;
        b=ejeQMvGVGJHQag8MNppzQ6cDhobxwkYxKHCG1szh3GXZyl8V819vtEfzvrbhxDzAP9
         sOg5g1sdlAHNJLgIJ59F3tPaUedZDoTDsCkI3hz+OFLK0YuUclNP86ldJ0rT21zne4jb
         jiypJFpxEC1jS6daFRSYPocwp5tjq6lkW/KatJBKytDMb8bDa+xgTvH+/Rt8gQE8Z+RW
         CJRaOSDsBtZIsU/ZM/zTDtDsDC5eKNVSSl+pzG54tluQzS2oDQKsLobmqc4VuEAqlZou
         8sImU4B71FLp3yZx8gZ3nusjPq6N9OAxmKWC/XG8K/RSiKxp6lfPnL/KMQ1I5j0H5tNl
         0pgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195137; x=1779799937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        b=Wl9AzlAanF9P7nzvS6Lyn/tsImfHEeYIGJ3J82bwL8yhKsvOH+dE1EHgg1ocNiJ3XU
         mkAp2MHZVNo59ZStq+6NCGJkk7vjpo2j7d/hTSEVY4l2n4oLWGEEgNHXnuV/5JdGD0u1
         ghsebqJs3tnrKlVavKxr6FSe4UAVAPGXT4iBjxLa9biMh/KS2nKwNRlLtKJtMq/otiXE
         5umU+4XxWIFj0omMKfhoKAU3M/3QsQmO/gxhj249Lm+xnxQTbQ+yIS4Y1lkC1oYiuBD2
         b3K9lqgj6bkCss1ySF7WhIJ+asPTYoYl8ienPi+TQEzdYV51PW7/5o+eNKjAi2C/ay2n
         zv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195137; x=1779799937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        b=Fl7mNClTQxT0eG5SgMOHwSancggQ9Bcr7f9JCPahZekaomaA3HhnXrrBZyIQ7ugS8H
         MwueSTU5YIm7L6FP2a1tNaylN5tGamjYkHbTizHSZ29UtCsLZA2h1e10yahD5CH1vQPV
         QnvB2hQdkIFnIehqSDG+Icaz+dLOcF2tMOJfZQSRH82ZqMeDtOU3jR3SGcg+XUifp6lS
         GlFh333zNB1oVHHb31fxMwuJJPna24DYRc7HihBBu8h2BZVOTb1zNgXcVtTrLFJgR41R
         bf56DdVxRBWfROb98vezTbLC/nHMH5I0j0OeUCo8UYH7+ZPynkw2IMqZMk5iIw6OIRon
         A+Vg==
X-Forwarded-Encrypted: i=1; AFNElJ/6lNRZw+7u21Oe4p+U6991JYTlZamnB999mWyTD6TPntb6SQdo0KyGCnD8o5ssyF4b+mIv6oXJLDN01A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH51EXBBSeV0A0cr+PI+UTYvCxhtAxjMrbFXe9/v+BZ2OOSAUV
	xrybVdQiBendCRotpB06DLu0GB0+TSn68GFFLIRc3lEQgcY3XXJWXuqZf+i5/BgWWY+yBGw7L2z
	8IneWp9W+nOQ9CyS9XuGlOC5waxYK/Q8=
X-Gm-Gg: Acq92OHJKU/OEx2b5O34nxjKO8bM2dngRzurkOaxLXHdDzX0dxtCKJTFefqWPPsT2Af
	2qCq2YEBDXmmZ1f58Gb1fhF8So1mRvNvgxHvLeTAOfMizcpG2wq24/kkqLKfMEX11LJc5hxhkal
	wE/CG53TO9pZFxqKna6bV8/ygh3h+i2VdVF7heQof8Vyo8tEbuDhOq5Tez318l0vCSxg99mMhPR
	jJyWrGu1vm1Cl8S/pFwn40fiuLMxqjelChBoIZzeYliIfyhM3+MXzbedS0eQdd2+XWyDuc0TLxo
	XXOH3g==
X-Received: by 2002:a17:907:971b:b0:bd8:61ff:f916 with SMTP id
 a640c23a62f3a-bd86200058amr420267566b.44.1779195136644; Tue, 19 May 2026
 05:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321065408.209723-1-linux.amoon@gmail.com> <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
In-Reply-To: <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 19 May 2026 18:21:58 +0530
X-Gm-Features: AVHnY4JJCSZj_mhTfm6UH5xrsKXtX_jQr95CpJqy1MIGyRQBSz4PwDNhz0eVEgg
Message-ID: <CANAwSgRf-pPwsqfXTALrnYV2e7K9bkbOzNrrFjB5pA0QjT1hhg@mail.gmail.com>
Subject: Re: [PATCH v2] media: meson: vdec: Fix memory leak in error path of vdec_open
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan <mjourdan@baylibre.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62139-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,ndufresne.ca:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4E42E57F32A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas.

Thanks for your review comments
On Fri, 8 May 2026 at 23:28, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi,
>
> sorry I missed your patch, catching up now.
>
>
> Le samedi 21 mars 2026 =C3=A0 12:24 +0530, Anand Moon a =C3=A9crit :
> > The vdec_open and vdec_close functions in the Meson VDEC driver failed
> > to release several resources, leading to memory leaks and potential
> > use-after-free scenarios.
> >
> > This patch addresses:
> > - Missing v4l2_ctrl_handler_free() in both the close path and error
> >   exit of the open path, preventing control memory leaks.
> > - A leak of the M2M context if vdec_init_ctrls() failed.
> >
> > The error labels in vdec_open() have been reordered to ensure a proper
> > Last-In-First-Out (LIFO) teardown of all initialized resources.
> >
> > This was identified via kmemleak:
> > unreferenced object 0xffff0000205d6878 (size 8):
> >   comm "v4l_id", pid 5289, jiffies 4294938580
> >   hex dump (first 8 bytes):
> >     40 d2 49 18 00 00 ff ff                          @.I.....
> >   backtrace (crc d3204599):
> >     kmemleak_alloc+0xc8/0xf0
> >     __kvmalloc_node_noprof+0x60c/0x850
> >     v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> >     vdec_open+0x1f4/0x788 [meson_vdec]
> >     v4l2_open+0x144/0x460 [videodev]
> >     chrdev_open+0x1ac/0x500
> >     do_dentry_open+0x3f0/0xfe8
> >     vfs_open+0x68/0x320
> >     do_open+0x2d8/0x9a8
> >     path_openat+0x1d0/0x4f0
> >     do_filp_open+0x190/0x380
> >     do_sys_openat2+0xf8/0x1b0
> >     __arm64_sys_openat+0x13c/0x1e8
> >     invoke_syscall+0xdc/0x268
> >     el0_svc_common.constprop.0+0x178/0x258
> >     do_el0_svc+0x4c/0x70
> >
> > Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> > Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gma=
il.com/
> >    tried to address the issue reported by Nicolas
> >    improve the commit message.
> > ---
> >  drivers/staging/media/meson/vdec/vdec.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c
> > b/drivers/staging/media/meson/vdec/vdec.c
> > index 4b77ec1af5a76..3a5e4ebe0b34c 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -877,7 +877,7 @@ static int vdec_open(struct file *file)
> >       if (IS_ERR(sess->m2m_dev)) {
> >               dev_err(dev, "Fail to v4l2_m2m_init\n");
> >               ret =3D PTR_ERR(sess->m2m_dev);
> > -             goto err_free_sess;
> > +             goto err_m2m_release;
>
> If m2m_dev creation failed, why do you want to call v4l2_m2m_release() ?
>
I don=E2=80=99t recall the exact details, but the current handling appears =
incorrect.
I=E2=80=99ve prepared the following fix to resolve the issue, based on
sashiko=E2=80=99s suggestion.

[1] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gm=
ail.com

-----8<----------8<--------
$ git diff drivers/staging/media/meson/vdec/vdec.c
diff --git a/drivers/staging/media/meson/vdec/vdec.c
b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a039d925c0fe 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)

        ret =3D vdec_init_ctrls(sess);
        if (ret)
-               goto err_m2m_release;
+               goto err_m2m_ctx_release;

        sess->pixfmt_cap =3D formats[0].pixfmts_cap[0];
        sess->fmt_out =3D &formats[0];
@@ -913,6 +913,8 @@ static int vdec_open(struct file *file)

        return 0;

+err_m2m_ctx_release:
+       v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
        v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
-----8<----------8<--------

Thanks
-Anand

