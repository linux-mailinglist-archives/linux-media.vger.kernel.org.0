Return-Path: <linux-media+bounces-45080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034BBF34E2
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1407F18840F4
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 19:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8387133030A;
	Mon, 20 Oct 2025 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RsCpfzkU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4DA2627F9
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990344; cv=none; b=W0CKqvi07JPjUFs3G84sphRuvd34U5rpH6wJ6wyL4gu5DVUMpDr2x/KDKCSt26ZsC0yQCAxIrRFOsC8PocRZxtuA+EPm6BtVDkO2yDgymTvldFQJWuAtmFLny7i1tQcoGG3gPB+xGnKPHsoJR3fziiT6EhARVY1od+dz6vbFmK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990344; c=relaxed/simple;
	bh=wYdxk58ArImvpS6riD80SDAnDf3kWnvorDlWtwXdgus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PduFWA2qljrxkfygyg8vfCJYq1NoyyfdqyIwjpkyPrCffzq6v+B3BcHZMkTZQ+xGDVTegNU3+i+8HmJ7+b0CFErm8HW2lxQ3/DDt0cVp8U9eEXX3wG/WFk0FIsBoJR/g+HeqLlYW6+DMIlbyjLE8YAmJU4WLwYa0bHAv4R9no0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RsCpfzkU; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-375eff817a3so52848191fa.1
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 12:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760990341; x=1761595141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqJXKRaXTsONzkFldwqCiRpv/FJUXtPHGWU4YzhiyOY=;
        b=RsCpfzkUzSo2ddI/kem9eoB98RgKXgo1xlFuyTPJtUmxKvwotk59c1Fq2etNF8TJAX
         +98qcH8wGTSycfyaUaUmNCJuVdW8uQ0aJGSuBrXaZQtyB5eU4byNfRp0VRX4f3pB/C8O
         6StO5vM55CkeUp0KZXfiK8+z+8YGO5DoiSmQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990341; x=1761595141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqJXKRaXTsONzkFldwqCiRpv/FJUXtPHGWU4YzhiyOY=;
        b=Qb5RToRRc/Qqdeq7mgHz+Pa45CRMfCfRelu3vIm2gsrsPUOC9/IRxr6xK7YYDSr10N
         GbGPLbF2YObp4wwsz/76WcMBovKdoQLc127iEg0hhctDMa4j5RegU6zOVjY3qQQXfSWz
         4F7ex6GAWAjMYAKqIvyYVeOnCfU3LaedH+jCPk7DIVolYDaMdowks5ufAp5YahSmAxA+
         AZqs8aZQx4Q/P1aACf60uOfaQeGM3Q8BIAziugnE2wIu4pIfmjMvqpjocD7lDtRNxKBg
         6/Ebgokm4Ji/5VLZKLsvwFRCPUDUMOHTJd2IZs2XTTHN0p/4Ajo0a9hTEDO0fDmzDT+q
         biFg==
X-Forwarded-Encrypted: i=1; AJvYcCUO9tEg3Wrp2J9Gllt3360L72RRBqqmY/vScaiYPV8s22b/jfhpjCHTA0MaqV08c5mJefXnKPEND4GqiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1b4U3vA1V9jna9FjzD0W5kQfGG9c3wEY8f6pWuZtc7x5g0YEl
	n6Rxa1VEfIzlheoaiLQwmZyy39KlhwJHj99wG0tfSIx1CdNXcvjebs5X7jgB4AKw4JNvkot2zHH
	rPs0=
X-Gm-Gg: ASbGncsB08NrcBPyO9a3RNILBUSqVeyps7fqKWkDOTCQjkf1AOmHuOG8aa/hnnkJ5O5
	jKK1Q96++VseSNei7kwvNYsNeXoeFGKvc+vD9l1H6IJGXWIHPnrsmL9LnnJ2AVn1kfAfEs73uBc
	FdaDM0lX/J9aHXKLdi4TiHynVy1qcZo9tKe7b3ef8EFfpEnbK18nSat1Vvcms973hy9G8flERPw
	b/B+PtPnqPJDFlujKHT2GW0qU4vP8lITROqwY9gjBXvPv9yiSV3XXFSO58bwJQfhYZL2/0GYtxt
	T+g2Fjz/lxkY2tmhVe06dv0XlRiT4TfGjvI5AL0QxmEKZzO9B7iaHm7OiRnsSLERqWicoZ1+B5o
	qNbaDcJgebLxSgNLJXA9eEZoLfaq0GVp6DebFrTmYJolkRGiAILlFsSHgS1zGbVwSf8OTTIzKJQ
	oVRpNCJ2tmuQaItE7izorHioxvnq2RBAKQ8lFVBBNb5ZuBZ+Iv
X-Google-Smtp-Source: AGHT+IFH1oiUeIH432FsYNBQpF/GT1nopsTc2S9C6LWCnYD4LaLoLc/JF07gYRMJRD24Ia17wlr2oQ==
X-Received: by 2002:a05:651c:501:b0:337:e5fc:d2d with SMTP id 38308e7fff4ca-37797a0fb97mr46777821fa.24.1760990340843;
        Mon, 20 Oct 2025 12:59:00 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b70cbsm22753891fa.11.2025.10.20.12.59.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:59:00 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57b35e176dbso5916440e87.1
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 12:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWENKqXHEIu3OliGgTlcmKGvgRdWATmQYWYNRMuq9HU7RisxwspdW96zHuU5Dge5XDo2QvvHSLZP9smDA==@vger.kernel.org
X-Received: by 2002:a05:6512:1309:b0:57e:54ab:56a9 with SMTP id
 2adb3069b0e04-591d84ef681mr4340152e87.20.1760990339501; Mon, 20 Oct 2025
 12:58:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>
 <aPZ_YRwpDNPFjePX@valkosipuli.retiisi.eu> <CANiDSCt+E+Ogr9+Y4_4KA_vBOYyTNZgwZVBD2wLMJirQE+PS3Q@mail.gmail.com>
 <aPaOxb9DyQfnU7_Q@valkosipuli.retiisi.eu>
In-Reply-To: <aPaOxb9DyQfnU7_Q@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Oct 2025 21:58:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCvS3gnrQ0sPrdhiQxY47rHHrvVMq_wDDBYa_L=Y-VZwAg@mail.gmail.com>
X-Gm-Features: AS18NWC84SZZl_qh5nIXYoQU5trCa2_3LnB2YMD5cBGR5J9qgedZa51in2-p0vs
Message-ID: <CANiDSCvS3gnrQ0sPrdhiQxY47rHHrvVMq_wDDBYa_L=Y-VZwAg@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: imx214: Exit early on control init errors
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Ricardo Ribalda <ribalda@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakai

On Mon, 20 Oct 2025 at 21:34, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Mon, Oct 20, 2025 at 08:51:44PM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Mon, 20 Oct 2025 at 20:28, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Tue, Oct 14, 2025 at 11:00:17AM +0000, Ricardo Ribalda wrote:
> > > > Now we try to initialize all the controls and at the very end check
> > > > ctrl_hdlr->error to check if one of them has failed.
> > > >
> > > > This confuses smatch, who do not know how to track the state of
> > > > imx214->link_freq.
> > > >
> > > > drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previ=
ously assumed 'imx214->link_freq' could be null (see line 1017)
> > > >
> > > > Fix this by exiting early on control initialization errors.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > Right now we are handling this with a quirk in media-ci, if Dan can=
not
> > > > fix smatch in a kernel cycle we should merge this patch.
> > > > ---
> > > > Changes in v2:
> > > > - Fix typo in commit message commit
> > > > - Move error tag where it belongs (Thanks Hans!)
> > > > - Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1=
-f3d1653b48e4@chromium.org
> > > > ---
> > > >  drivers/media/i2c/imx214.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.=
c
> > > > index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..c66f0e18726c3fc15df=
91c37888a797bcea82134 100644
> > > > --- a/drivers/media/i2c/imx214.c
> > > > +++ b/drivers/media/i2c/imx214.c
> > > > @@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *=
imx214)
> > > >                                                  V4L2_CID_LINK_FREQ=
,
> > > >                                                  imx214->bus_cfg.nr=
_of_link_frequencies - 1,
> > > >                                                  0, imx214->bus_cfg=
.link_frequencies);
> > > > -     if (imx214->link_freq)
> > > > -             imx214->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONL=
Y;
> > > > +     if (!imx214->link_freq)
> > > > +             goto err_init_ctrl;
> > > > +
> > > > +     imx214->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > >
> > > You could do this cleaner by simply moving the assignment after the h=
andler
> > > error check. Some drivers do that already.
> > >
> > > I wonder why this seems to be a problem for smatch in the imx214 driv=
er as
> > > the pattern is widely used across the sensor drivers.
> >
> > Smatch thinks that there could be case where
> >
> > imx->link_freq =3D NULL, and imx214_pll_update returns 0.
> >
> > That is not solved by moving the assignment `imx214->link_freq->flags
> > |=3D` after if (ret)
>
> Did you test this? The smatch message suggests otherwise (but of course
> this could just turn into a different smatch error).

Actually smatch do not hate it :)

ribalda@ribalda:~/work/linux$ make -i W=3D1 C=3D1
CHECK=3D"../media-ci/third_party/smatch/smatch -p=3Dkernel"
KCFLAGS=3D"-Wmaybe-uninitialized" drivers/media/i2c/imx214.o
  CC      kernel/sched/rq-offsets.s
In file included from kernel/sched/rq-offsets.c:5:
kernel/sched/sched.h: In function =E2=80=98mm_cid_get=E2=80=99:
kernel/sched/sched.h:3743:25: error: variable =E2=80=98cpumask=E2=80=99 set=
 but not
used [-Werror=3Dunused-but-set-variable]
 3743 |         struct cpumask *cpumask;
      |                         ^~~~~~~
cc1: all warnings being treated as errors
make[2]: [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error
1 (ignored)
/bin/sh: line 1: kernel/sched/rq-offsets.s: No such file or directory
make[2]: [Kbuild:46: include/generated/rq-offsets.h] Error 1 (ignored)
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/media/i2c/imx214.o
  CHECK   drivers/media/i2c/imx214.c


ribalda@ribalda:~/work/linux$ git diff
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 94ebe625c9e6..a21461b55923 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1014,8 +1014,6 @@ static int imx214_ctrls_init(struct imx214 *imx214)
                                                   V4L2_CID_LINK_FREQ,

imx214->bus_cfg.nr_of_link_frequencies - 1,
                                                   0,
imx214->bus_cfg.link_frequencies);
-       if (imx214->link_freq)
-               imx214->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;

        /*
         * WARNING!
@@ -1038,9 +1036,6 @@ static int imx214_ctrls_init(struct imx214 *imx214)
        imx214->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
                                           V4L2_CID_HBLANK, hblank, hblank,
                                           1, hblank);
-       if (imx214->hblank)
-               imx214->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
-
        exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET;
        exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFAULT);
        imx214->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
@@ -1060,13 +1055,9 @@ static int imx214_ctrls_init(struct imx214 *imx214)

        imx214->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
                                          V4L2_CID_HFLIP, 0, 1, 1, 0);
-       if (imx214->hflip)
-               imx214->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;

        imx214->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
                                          V4L2_CID_VFLIP, 0, 1, 1, 0);
-       if (imx214->vflip)
-               imx214->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;

        v4l2_ctrl_cluster(2, &imx214->hflip);

@@ -1106,6 +1097,11 @@ static int imx214_ctrls_init(struct imx214 *imx214)
                return ret;
        }

+       imx214->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
+       imx214->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
+       imx214->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+       imx214->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
        ret =3D imx214_pll_update(imx214);
        if (ret < 0) {
                v4l2_ctrl_handler_free(ctrl_hdlr);


>
> >
> > I believe Dan is already flagged about this, but I do not think that
> > it will be super simple to fix in his code.
> >
> > If smatch can handle this case before rc5 I will delete this patch.
>
> There are other options, too, such as storing the link frequency index (t=
he
> driver won't even support setting it) or the frequency itself.

There are plenty of options :) But I am still failing to see what is
wrong with this patch.

We exit early when there is an error instead of continuing doing work
that will be useless.

If you really prefer your way I can send a v3... but we have probably
more fun work to do :P

Regards!

>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

