Return-Path: <linux-media+bounces-57485-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HikL4GWyGm3ngUAu9opvQ
	(envelope-from <linux-media+bounces-57485-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 05:03:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B715350863
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 05:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C32953029E7C
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 02:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550F22248B3;
	Sun, 29 Mar 2026 02:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOmBNb2m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE31DDC3F
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 02:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774753185; cv=pass; b=ro2ng/QTEOUlOroM1bk+mtxvj4fOeZu47AlaVRXp7UYHqjg7QPv/Hch1pW9yLoRDTK0RSrosUAd3e/ee91BxMGYrchWEVS1QilTWKPpOdXsOi8ueTk58goKkExaI3U48ya76Pzd/3etB3ZTw8KWd+tnlLmHvBOMLyOb8PoGO7Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774753185; c=relaxed/simple;
	bh=oeNehwa1EeZJyigbXHU4X4E2N3zajGz8/K1EHAM/4vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dri5Tw1CdhtBVWICdobN1jZQcqzV0mmDV0hA8WiMyPmCgkiNcVImyK6LI2YftYnicsvya+tY4bQLWGNzT0M5NXDoG/Y6TWBSRY7gXRRFORVY2Ot0MAF52C1oQjDy7lWgQb9ToljDC5GNZ3FmtAIQHcj0U3zB29fzHYfrVhZr19g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOmBNb2m; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439d8df7620so2368624f8f.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 19:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774753182; cv=none;
        d=google.com; s=arc-20240605;
        b=CBay+cDQu5alqSwvNetMx1FDOMwzObFGDpLSYffZbDx6R7UiRiiRjiWyBaIzO9NGs1
         dhJOl1TmbP4xlPZOXMfH5XGvHdIRw+djxMiSTTuloCLYrJxMRzT0DrcXFECU+vnwJSm3
         vc4O7C9U3GwJ2fIgciIX3QtKs5kvjscoYS+so19Yw+hpSpk6gzOwm65NfTq7d+uvknsr
         VSYHJmicZvac9TWU9LI+pZVwxhDjEHL5kUp25LgqWdd62232gUTvWlCQaActuLVHJfRB
         BpMDRoUrf1NmDTcbjtT1Q+DOU+SiIdL9BbavndNIX2QIPjx2nICFxKJV8xG5hQPy8Rp3
         lkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oxd9DxtljOO+GpoWdMwRVjRD9w3+k7pr8qjVOaGmgQs=;
        fh=oNIGcdpRIFL4NylcutrnRJODe7F7Nyyhm4Pg6IJFrYc=;
        b=I/IvKPdM6OCRI+n4vqyFkPLv4RQmms/vvuO33O7Fb46mUyb+tS4co9sBSzlcdYbkby
         nM6IPYV9/Qnw6mphELYBxFm76f6jDwbqUsdcEVMkwfe1KZ7qMsRfgv50hFwxvOIeg0FY
         iy7WvXPPKiXggF2AvEy+0b4W2W12bRgqdevAtFJQlkZyyPYZxh9L0ywNllTl76UerW+u
         Qsf6lPWTwEOa0w4j2k0sWpKFJbEBuMrMmqdrHfCq09nWJ841T8aShgkAhpnmYQk/TEP7
         bkmY1hOp6TxrgYuzv9UIG7YmJKmO80ekknFZXskFfTB3bVUbDoO27YpEIiOCgJTAR3ZB
         t8bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774753182; x=1775357982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oxd9DxtljOO+GpoWdMwRVjRD9w3+k7pr8qjVOaGmgQs=;
        b=TOmBNb2mbS+sDIkGhl6xsFHDjSi5CLuvhmQjeiz2nu0WwVM4/p8S9zTnaUcko9lFyW
         6gqXUfWVHuW2JbGv2lX6y/jXjSust+m24CaV1okB7x3zrN7XYg/5h7yw9eZWcX09mPcD
         yNg7Z3F1XLSvZPHdF05P7B3bUKT7f1cahyWV9mHbs+YAaSM2z9EW3vtmcYjKj84NEIBH
         vrK5Teq/bhmhht4Z6GiQfC2akeH6TeDhhV4AbovoP9wUWg+zBuRXzZ7qJf0+q6aYTpNF
         FtPZ41je5ktGPzcJX4nho44NM10g+QTkai8t1pentd4Jwymd5MOGnxVyT7huoPAzNs6o
         S0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774753182; x=1775357982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oxd9DxtljOO+GpoWdMwRVjRD9w3+k7pr8qjVOaGmgQs=;
        b=pRObck0E+6yGqXGPArS6DpkqElu0T+44ov3yEyaYyy8yXANcwIHcuQPJGP7O+8e2lE
         OZuFeSPSs2522kAqzJouwdlKWO/1hUM46oeyxqRax9eIzavljdY/5UtOb4U4yMFyHXaQ
         ol6ev9vRr0dd8JYZoO6rrORHTTYuyUFdtdeF0JngVfr9dp/D2BkmpEA1hY6fEn8CK6/9
         eT8A5bEXf+GCH60zjzn4Nx1hWQ4zmUYTpt/qsEzN50usjrNI9wAWoTfbkcg9SiHM0A6Z
         hzuS32fF3NnOZUpdm7mhV6tL07JAhKIXoxJ6Wo8Uy1rpBGKhLZhTtwMQi8lp9ZRJyhuK
         8oKw==
X-Forwarded-Encrypted: i=1; AJvYcCWy9SUm9CYc5sbCd2ybQOJu/pJCEVmzCjkYBtkK/OjHzc8oUvOKuS6MLH/qhs8fk+/7QVI4XFc+HZmgaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztxE31bfJ8QQvzDukKc6QmPyVVlbSvjSG1cQANNXoZcZZshoQz
	HekGkbu6fbkHsd5fG63C+S5mUaOF/gJyXWIIypKq0qhBQeRlo/Iv5jUky4F/IyeE6ZbpNxBbDnX
	mIMbqxfm0ox70jqRhUvzdMa/q99H6Jhs=
X-Gm-Gg: ATEYQzyMOOSCeum8KgrdIQgH4eeJUmYMpeBwkCy7XVpGt+lkJWjt4Li247QMDYCgcDK
	8UYOV0byrgJLa3qiIqd2qQwBYmX84IiSNNwbyjdkbPUoSWYV4NkL1NNWr2fTrJY6DQmrI2u2x2l
	IK/val3YVHi4SNGKK0uHcGHLHqN5h/GqwmpXTtbRFNPpvYuWEbw7n+H/wSYIaHfEkIiWMnssDDN
	mTil9SR5ATwDISwbUo5DOzvgkNHuMr+JYnh3lBEN9gJCktL9yWLjwrYDQcv2SLAoL8C5U8aLi7J
	7/bAjelTMZKJs323p3FK0Ep6psXKzMkZ/eHpAM0iS4h4PlJHgpQ+34BNyBCwY+SWn4QNgA==
X-Received: by 2002:a5d:588f:0:b0:439:c299:4d8f with SMTP id
 ffacd0b85a97d-43b9e9e8e37mr13378617f8f.17.1774753181546; Sat, 28 Mar 2026
 19:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260328132902.776757-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <f8369ece-ff7e-438d-84b5-0e924597246d@windriver.com>
In-Reply-To: <f8369ece-ff7e-438d-84b5-0e924597246d@windriver.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 29 Mar 2026 03:59:14 +0100
X-Gm-Features: AQROBzBQCBDvKqbYB7uBkl8X4GJECz9QPVb6ro2KqB5gY6h5wABEHX4uLTzZcNQ
Message-ID: <CA+V-a8v2v02Ka3GsE0psSkhT7KUMRf-ot5103B2ZQkcpSKWbEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: ov5645: Convert to CCI register access helpers
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57485-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3B715350863
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xiaolei,

Thank you for the review.

On Sat, Mar 28, 2026 at 3:41=E2=80=AFPM xiaolei wang <xiaolei.wang@windrive=
r.com> wrote:
>
> Hi Prabhakar,
>
> Thanks for the update.
>
> On 3/28/26 21:29, Prabhakar wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Convert the ov5645 driver to use the V4L2 CCI register access helpers
> > and regmap infrastructure instead of the custom I2C register access
> > implementation.
> >
> > Keep ov5645_set_register_array() as ov5645_global_init_setting requires
> > a delay between specific register writes, which cannot be expressed
> > through the generic CCI multi-write helper.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Fixed selecting V4L2_CCI_I2C config option for the OV5645 driver.
> > - Fixed checkpatch warnings limiting to 80 characters per line.
> > ---
> >   drivers/media/i2c/Kconfig  |   1 +
> >   drivers/media/i2c/ov5645.c | 907 ++++++++++++++++++------------------=
-
> >   2 files changed, 435 insertions(+), 473 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 20482be35f26..8d7dafba85ca 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -533,6 +533,7 @@ config VIDEO_OV5640
> >   config VIDEO_OV5645
> >          tristate "OmniVision OV5645 sensor support"
> >          depends on OF
> > +       select V4L2_CCI_I2C
> >          help
> >            This is a Video4Linux2 sensor driver for the OmniVision
> >            OV5645 camera.
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index df9001fce44d..1cfccbdf1406 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -25,40 +25,42 @@
> >   #include <linux/of.h>
> >   #include <linux/of_graph.h>
> >   #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/slab.h>
> >   #include <linux/types.h>
> >   #include <media/mipi-csi2.h>
> > +#include <media/v4l2-cci.h>
> >   #include <media/v4l2-ctrls.h>
> >   #include <media/v4l2-fwnode.h>
> >   #include <media/v4l2-subdev.h>
> >
> > -#define OV5645_SYSTEM_CTRL0            0x3008
> > +#define OV5645_SYSTEM_CTRL0            CCI_REG8(0x3008)
> >   #define                OV5645_SYSTEM_CTRL0_START       0x02
> >   #define                OV5645_SYSTEM_CTRL0_STOP        0x42
> > -#define OV5645_CHIP_ID_HIGH            0x300a
> > +#define OV5645_CHIP_ID_HIGH            CCI_REG8(0x300a)
> >   #define                OV5645_CHIP_ID_HIGH_BYTE        0x56
> > -#define OV5645_CHIP_ID_LOW             0x300b
> > +#define OV5645_CHIP_ID_LOW             CCI_REG8(0x300b)
> Since 0x300a and 0x300b are contiguous, you could simplify this to a
> single CCI_REG16 read:
>
>      #define OV5645_CHIP_ID        CCI_REG16(0x300a)
>
>      #define OV5645_CHIP_ID_VALUE    0x5645
>
Agreed, I will update it as described above and post a new version.

Cheers,
Prabhakar

