Return-Path: <linux-media+bounces-43667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7225BBB4870
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 18:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D95867B68D0
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 16:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1815D258ED9;
	Thu,  2 Oct 2025 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrtQrtZo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AD72580F2
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759422317; cv=none; b=IWfKom5uPANtvzc+oCi0xO/Zy//ETM2315WgR3TZKycnpDgjGmMbEkPbkL7bs4PyxUV3nkwR1JGbT0uuqcuUUT8bJJQ0jJVTBiCWo7m7L2oqzM9I1wPv78amYyiCAYCtHK2QZacC6LOW8q0/YHCpEpqNRQUNwbIvs2yiTv1YN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759422317; c=relaxed/simple;
	bh=Dye5xG6ZBlkFS8UnTaxhmHjl4qw3h7OPv8XQMDNn3/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abEjTLOwBLMCUy3WaIPGIUOYjj9sBVgrLOCsVyiENGfF1ZlDPKrDMF6+J+S9A6a+MLjcdwPAfR9rAbhHX6DE3LBQcw395l2JdtAh3SxCppxnaIj1amdMQTzA9gnSNbwvJyqPgkWsQJvml17oGfhEq35xuOWXxCqUbQRy80Q1igg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrtQrtZo; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3304a57d842so1183014a91.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422315; x=1760027115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b4jK+m/8RWobuO0NphPEVc1dDtXHYNNnhWnKlc2Ffk=;
        b=KrtQrtZopp5TgSs97FnKYffUrlLK6trfIlDj0zUSiMIJPEZsCWGvMQ8OW+DrWurZvs
         tZi+BNnHABWOH6hDccKKsu12U2aOGhLKfb3Dbnmu0X1A5TNxUvbLBpVisK6XyQHra5ol
         uQq55jk3YMhADvoQBmj6FfYyHWGfkXyisOgwn+1NVw1PCQ7y2X7QMHJ8mB3CcQSd8Gc6
         6SZ/B+JIcoWemc/N31qDc43UR7Vz9gDOkzCSBkwww0vTyG3D/1IyF/URvKplNMUOBVVm
         LDoH0BkfomkaxSf2CGti5uE6/Kvof4diFiDPz2F8arWZNqXjUp00sEW0fWPQpbPDJJfR
         8Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422315; x=1760027115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b4jK+m/8RWobuO0NphPEVc1dDtXHYNNnhWnKlc2Ffk=;
        b=gzHKsrmlhS7nfLhqe3TMaGlG0crC99LGUeiWf229Ih/VIxQwkuh9QDKCITG0x42pcm
         3kExXKtfxymYpPxXM8e0YwEbStkH3Eci/+g9s8fzI79/8ggpWFePKRbRpCDETsY0OTQP
         8vcaC2Zg0iXQidIzrY9sVhreJeTxTGeC12gA9ndfJRzto4+CiOeLDmwk0cFxNA1WmYIN
         XyFEibXEQZPafbmXlFkf3lesgF+KRx+lbIFGgiuTgaZe579aHr/keVuM6BncMVv+9xRq
         pxHFXWi1X7un1WjPAJMmUxqnF0KamWKTq0l3vRM0UxaaMS0CF9rrXSkyRDj7rhWmHG4d
         V5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCU5tDr7FnPc1V/ULGOYRi+8Zk4Yiq8mxCkHmvPpeFMNvRBof1xNvEdNpRKhWPwoeDyoDkfZMBykAZIrvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0uhzuYxO7yxo9oWYFpM2k42dGLsSQsjLRtpNNtsViB/K8uYZI
	2qzXu4bL2qPO2nQQvKvSIKGFyyGdAixkDxFPY0mtjPYG4E755oKLM8T0zgVxvj/DV1cSdwAFGh+
	Dx5K1AleFwU/hLedNiNzkL7FCazjepJo=
X-Gm-Gg: ASbGnctDdqXszMh2YgTCUFM0v1g5d21e0ROr9a5VIQSmOOrbJ9w45P6cJ7zipB3zV3v
	kkUEBILqO4hYrGrOWAMInz/A2th+hxlrQYqOthDFed4UWlSzcKq8wcOcflsdIHeA8JO8Zkk7jYh
	h/XNHRc01uc/oC7WWGbup9ml8lDLiqWODZUfTgazkN/XUW3ZF4FcWE+el8V34PJBM6CBIA8fpiZ
	sjCy69D4JEI7kDM5ipzocboZjYAbIw=
X-Google-Smtp-Source: AGHT+IHE/zk/UTkg8cQuQgjzmknU1P4NQ77O2Frb3S1sd6aKc/XPDhOrrz+zfZ4f19CBYGkA2+apVfUO9bhD8Hpgsxo=
X-Received: by 2002:a17:90b:4d08:b0:335:2b86:f319 with SMTP id
 98e67ed59e1d1-339a6f76fdcmr9571286a91.35.1759422315195; Thu, 02 Oct 2025
 09:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
 <20250820140154.GB6190@pendragon.ideasonboard.com> <a9283349-c58d-47e6-ac33-77b5a6b893fe@gocontroll.com>
 <20250820141439.GA10547@pendragon.ideasonboard.com>
In-Reply-To: <20250820141439.GA10547@pendragon.ideasonboard.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:30:12 -0400
X-Gm-Features: AS18NWDGHOBDrSguIYms66P-zFEY8uoL7wGfB2jgVSBuHpouvKYa_JLzhedGeUA
Message-ID: <CALC8CXf2RTYz2YjbFHsbdjDSSAt3Jdv1NBbBQs4jRPmwkuUuXA@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL
 before access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maud Spierings <maudspierings@gocontroll.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Riedmueller <s.riedmueller@phytec.de>, 
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maud... Laurent
Yea you a Mad Lad.

On Wed, Aug 20, 2025 at 10:19=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Aug 20, 2025 at 04:07:55PM +0200, Maud Spierings wrote:
> > On 8/20/25 16:01, Laurent Pinchart wrote:
> > > On Mon, Aug 18, 2025 at 02:31:43PM +0200, Maud Spierings via B4 Relay=
 wrote:
> > >> From: Maud Spierings <maudspierings@gocontroll.com>
> > >>
> > >> media_pad_remote_pad_first() can return NULL if no valid link is fou=
nd.
> > >> Check for this possibility before dereferencing it in the next line.
> > >>
> > >> Reported/investigated in [1]:
> > >>
> > >> Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e4=
9e@gocontroll.com/ [1]
> > >> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > >> ---
> > >> I'm not sure if this should be a dev_dbg(), just following the patte=
rn
> > >> around it for now, also not sure if EPIPE is the correct error.
> > >
> > > I've submitted
> > > https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pin=
chart@ideasonboard.com,
> > > which should fix this issue in a more generic way.
> >
> > Saw it, but I think my patch technically is still correct as the
> > function documentation states it can potentially return NULL right? [1]
>
> The function documentation states
>
> "returns a pointer to the pad at the remote end of the first found
> enabled link, or NULL if no enabled link has been found."
>
> The MUST_CONNECT flag ensures that there is an enabled link, so the
> function can't return NULL.
>
> > Link:
> > https://www.kernel.org/doc/html/latest/driver-api/media/mc-core.html [1=
]
> >
> > I will test you patches tomorrow.
> >
> > >> ---
> > >>   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 ++++++=
+
> > >>   1 file changed, 7 insertions(+)
> > >>
> > >> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c=
 b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04=
a8752747f556bd1fc5a9 100644
> > >> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> @@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_c=
rossbar *xbar,
> > >>    }
> > >>
> > >>    pad =3D media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> > >> +
> > >> +  if (pad =3D=3D NULL) {
> > >> +          dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n"=
,
> > >> +                  sink_pad);
> > >> +          return ERR_PTR(-EPIPE);
> > >> +  }
> > >> +
> > >>    sd =3D media_entity_to_v4l2_subdev(pad->entity);
> > >>    if (!sd) {
> > >>            dev_dbg(xbar->isi->dev,
> > >>
> > >> ---
> > >> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> > >> change-id: 20250818-imx8_isi-954898628bb6
>
> --
> Regards,
>
> Laurent Pinchart
>

