Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27CA663B9E
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 09:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjAJIrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 03:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238141AbjAJIqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 03:46:50 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A9163FE
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 00:46:47 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f34so17218463lfv.10
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 00:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUDkYxi1fggGdsMG+jDlE0Ge41cOAtCQLfwLiKQ6wVk=;
        b=oomPvqP3L6DJfcG+kV8Fx2iNGXlQ7BiEIQf2PCWIX8J1qR7MURAXsQMdupqyejhJkx
         j5KM5LBUhFijIVb5YsWT5zlYzg1cnrwtJ1u9eJCXQ+oBqrMEfC1O+y7vQDHt3/6IWKwt
         AvZZj1WZe57JI7I3bqKRVV0gIFwy5ee1z6uab0s6P7foBNUg6vGZs9JY0ZLkChvkVnvu
         CUtetujYnhxgiehhnA6Nzsly7R9eRvHM+mE3bXKKUfQM57hZSin6VfRWxV1aDGt0EPPr
         gspaUBzM2CujCzCiUwaVSSF+eFHMNpR6/y5eGwlK03dSelm6XXf4aXU8tAT26g6JfICM
         9cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUDkYxi1fggGdsMG+jDlE0Ge41cOAtCQLfwLiKQ6wVk=;
        b=WjjcY6N70X3XN4SkZQpMSyl0F/c3L4H6N52d9ajCgAKR9yBbS5KNMn9e4bOpBDeqwX
         Zxzwy428QZrKmkQxj4Y3jIvazUabyV9gK/KNbTnL2YgAsTyJuLni0fPQMVXZpVAEmUbN
         iFVV3PHIrPR2OdgpPATOZUslPcSjqSlWbT31joS1gNker8VVEJAE+m69nMFRsoIJhU1B
         aErE8kMXGsbmnhQyYY/LM5/piivDlPt2QPdiw8tC/diaGeBH0pCYM8hOLFPEheXUpt/4
         l3qm5OW3tlq7nut0iJEyfKlU3ZuUJ92qdEZfgq0vd7F5RAzooV0hEXdKNNCjlIXmk1l0
         ByCg==
X-Gm-Message-State: AFqh2kqPTIDpkmd9AeNGPopfS/ni9CZR8M6Lwwh2bGJ7HZ8Dhyi9CPXT
        zZpQwCoId/y3VLuuRV2Ua84=
X-Google-Smtp-Source: AMrXdXvm4wnkiZt6SZ6C+AVnA7JbY9zppeguzUdfKg7PGx5HIit80AFpFT1noaeU5zdzth/3Ti7FEA==
X-Received: by 2002:a05:6512:2805:b0:4b7:1cc:ed56 with SMTP id cf5-20020a056512280500b004b701cced56mr1085150lfb.35.1673340404733;
        Tue, 10 Jan 2023 00:46:44 -0800 (PST)
Received: from ferris.localdomain (85-156-247-210.elisa-laajakaista.fi. [85.156.247.210])
        by smtp.gmail.com with ESMTPSA id q22-20020a056512211600b0049462af8614sm2081722lfr.145.2023.01.10.00.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 00:46:44 -0800 (PST)
Date:   Tue, 10 Jan 2023 10:46:26 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Sophie Friedrich <lkml@flowerpot.me>
Cc:     linux-media@vger.kernel.org
Subject: Re: Potential integration of thermal cameras into v4l
Message-ID: <20230110104626.23f476df@ferris.localdomain>
In-Reply-To: <e9da9461-240e-f5b4-089e-378b85734632@flowerpot.me>
References: <e9da9461-240e-f5b4-089e-378b85734632@flowerpot.me>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YOPhUdUvfBi4PbZERWWzE/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/YOPhUdUvfBi4PbZERWWzE/8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, 7 Jan 2023 22:58:41 +0100
Sophie Friedrich <lkml@flowerpot.me> wrote:

> Hello people,
>=20
> over the past months I've written a driver for the Guide MobIR Air=B9
> USB-C thermal camera. The driver uses v4l2loopback and runs in user
> space with python.=B2 The driver manages camera state, calibration and
> conversion of the raw microbolometer to temperature values.
>=20
> In my research I couldn't find any mentions of a thermal camera support
> in the Linux kernel nor the media subsystem, so I assume I'm the first
> to ask here and we would presumably need lay out some ground work.
>=20
> The current camera driver outputs the temperature in the Y16 format as
> Kelvin * 100 (i.e. 28056 (raw) -> 280.56K -> 7.41=B0C). This allows for
> further processing down the line with i.e. OpenCV, but has its=20
> limitations. Especially as temps of only up to 382.2=B0C can be displayed
> currently.
>=20
> Does it seem feasible to integrate support for thermal cameras in the
> Linux kernel and more specifically in the v4l2 subsystem?

Hi,

since no-one else replied to you yet, I thought to mention my 2c
(I don't really do camera stuff myself so far):

Perhaps the best place is to reach out to the libcamera community:
https://libcamera.org/

It sounds to me like you want to do some hardware-specific
processing in userspace, and it might not be great to try to come
up with a generic thermal camera API at the kernel UAPI level.
That's where libcamera fits in.

As for the pixel type, maybe use a floating-point type to avoid
range/precision problems? E.g. DRM_FORMAT_R32F for application
facing API. That format does not seem to exist yet, but it's
trivial to add into kernel's drm_fourcc.h and should be well
accepted IMO.


Thanks,
pq

>=20
> [1]:=20
> https://www.guideir.com/products/mobileaccessories/mobirair/data_300.html
> [2]: https://github.com/tyalie/pyMobirAir-v4l2/

--Sig_/YOPhUdUvfBi4PbZERWWzE/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmO9JeIACgkQI1/ltBGq
qqfUTRAAgmKVmeOhAE1zMdN2susPhARgc/RDL/9rTtUvEuemmdbxOk+u4jlzc3KI
FbZvaUC9QEpLNRrVxyVSwaMRZAW2xOO/ak8lJu9oatS4ZYgCCD4GPuWoMYKMY6XL
FjHBY+b59G5iJFWG2mqiWrqjPf6KUUNDUsuxLD4mx7MSkQLXKLZ2+XeT+vuzLjMr
dtYy09hpE5mDpuAQZXG+gTAlkuIFks0YVt0lFiNEupfQo0oT0TAd7YpAIGg1D7Ru
/9NUSHFXQfvAxZXj/nzrj8F3d/cX4J/damEBtknRDH+MlmWCL6QAMPdJ09bta0KG
HuN9I+QyW5FA0MgPNgo4I9pXVnTDHqdBn7TaX66/SsXH9POJJ4wm+MeOoJIu7On5
qkSDcMh5/ZLuva+wDnqurfkTbFaBpKAqvgcJd44sah3KQBvH9P+P9tO5Ddx+r/Z+
PFpwQ22DG5uLg9r0tHhP4WyIspja8TKZmS86GcKTqmmVJQN3c8bQPXtblagxGlaB
y19e07ainK1Hay3Z8HEcw8kYvn8bBcB989c3IWDET/ll8vZX4ow8EfRp9HTWCuwB
6oPjM6wHPOVuNe6S6Y/uzbLGiKeng+AEddutNWpWSWBPmMq17FFpSyH6WggdsKmy
yV7i6w3A8jYFI3jwqdgYwETNhO9rpEW8tmxk9BIyLomJT7Px+2E=
=HxLc
-----END PGP SIGNATURE-----

--Sig_/YOPhUdUvfBi4PbZERWWzE/8--
