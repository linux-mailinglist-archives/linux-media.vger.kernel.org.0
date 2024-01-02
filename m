Return-Path: <linux-media+bounces-3140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7268215FE
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E4D128195C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A858F363;
	Tue,  2 Jan 2024 00:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpkR3lUh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B187FC
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-680b1335af6so7318086d6.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154660; x=1704759460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xaDsIrkEP2tnJSzBiagDqi/djXd3aELdCHJtedZTxY=;
        b=lpkR3lUhK4kpf6IjFo+zDlzNUnzu4U+5Qeqnn5ouIL6Rx99bZVrs2l2c8LCnd6vo3d
         wSB25rsojKunc72pLB8+8Z+RydF2upcLWYXMZOvL/HDVme5OgT5m/Jp0KF8f31qp6OLX
         CbVYNLXJpYD+FMeoUTxRAEZBSZhlsnmBYGz/RofgrxudGVHpcf2tiP29djaqDIiihwfp
         IaW8U0/NSQLWglzocfVkZWnfqvmVEYMGZt9vblBz1QgJoV1fiQMH5ipqiZecg/jZgz9p
         glkBuwM/Da3kJJ5kex9gmJyCswoYw4t51bidU/4l6+Q2/WczJLlnAvVlxY0MVp8O6QJH
         +UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154660; x=1704759460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xaDsIrkEP2tnJSzBiagDqi/djXd3aELdCHJtedZTxY=;
        b=VhlY+y9XwCwUmOWYTQOE4wFL9rshCKNMZ6mOWgH5kVDIPGpl+JAL3SpsrUQMrqSnFN
         q7Aw8Zw2Of1purJk9GRMn20PK0a59PQZ88VxKlwn0tu8Qnsoz8c7TelZM4PPVmqN8JAe
         yWli1qwLf6xrnUVG9kqagO58pxBOftbEZ4yXBT8LmYhp1oivddHGxMjf7tCRy7CSBk9E
         jRm2hALB6SCpAb6GIKbePCHy96bGPFN3t1fw0gXnYsLRHffnYc/cJulBvG5TlLhT8k2F
         6Wf00uR6CMqVGy5TG+aZphnZkp2hpAKGj782/7o4uX7E4WRkg2qYzxd6bd5gHDCKvCK6
         FOeg==
X-Gm-Message-State: AOJu0Yw6Wx4skSu73dsx97Mqmx70uP6uG38wP+Uu+XdNvINjLVEv9plU
	i3yOK/FUilfRkbQ9XsehENVyyToXGNjJrBDxVUE=
X-Google-Smtp-Source: AGHT+IGlhkbzz8kWNvfcZQnQydV3t2TPUuaDz4suxxU7eMpX/QA1x1vmQR9wULszH465HHibTHnArQcJ7blS3bh7E0U=
X-Received: by 2002:a05:6214:1745:b0:680:b174:7db8 with SMTP id
 dc5-20020a056214174500b00680b1747db8mr2662277qvb.23.1704154659803; Mon, 01
 Jan 2024 16:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-3-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:17:03 +0200
Message-ID: <CAHp75VfTzUx6V=sxxCYt+=CEzUgn-TfVvfRLkjcPeuPoMgq3DQ@mail.gmail.com>
Subject: Re: [PATCH 02/15] media: atomisp: Refactor sensor crop + fmt setting
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> There are 3 code-paths all of 3 which need to do:
>
> 1. Get try or active state
> 2. lock state
> 3. Call atomisp_set_crop()
> 4. Call v4l2_subdev_call(input->camera, pad, set_fmt, state, fmt)
> 5. unlock state
>
> Change atomisp_set_crop into atomisp_set_crop_and_fmt() which does all of
> this and change the 3 code-paths which need this to use the new
> atomisp_set_crop_and_fmt() function.

...

> +       if (sd_state)
> +               v4l2_subdev_lock_state(sd_state);


> +       if (sd_state)
> +               v4l2_subdev_unlock_state(sd_state);

If there is any reason why we need to have no conditional in the
callee, I would prefer to see a helper with a conditional and/or using
specific macro from cleanup.h, so you won't need to repeat all this
every time.

--=20
With Best Regards,
Andy Shevchenko

