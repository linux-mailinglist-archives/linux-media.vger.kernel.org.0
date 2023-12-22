Return-Path: <linux-media+bounces-2928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AE81D086
	for <lists+linux-media@lfdr.de>; Sat, 23 Dec 2023 00:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D06A1F232BA
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 23:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF9D34CF0;
	Fri, 22 Dec 2023 23:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20230601.gappssmtp.com header.i=@gateworks-com.20230601.gappssmtp.com header.b="Vf6sWTyv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ACD35EE3
	for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 23:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2340c803c6so274983766b.0
        for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 15:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20230601.gappssmtp.com; s=20230601; t=1703288463; x=1703893263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B62g0P/gGVFlQyJfS/rShpgBzqu7U3uldf1NH7n9bWU=;
        b=Vf6sWTyvyq32gsbvyrJyJklnoEx8x4Z6FIwM820mAnpfHdZ9anGR0CUNFuQlcuTCXM
         qTOkpbFMdBH8A3jLXtAmYbkEWeGLPlCTcp657XTPQzsD0c6r5MPrHItSr1nBpQHWETY0
         x/Y3/2sUQpHn8ahjA/t2DYoHm0Ymbk10C18WHnoKiZAjKuRqIIuPX04zKI+u0gZciqlG
         gCfWYjHusMH5PdfNShJ8O43ml7a/QHsyWk1H+It2D/qtOWAYQ3tTn+HKslqFxLVAYaH6
         FQvuKlGROSEx6BEIaRWcZEEvg29JJ2SO600a3ezacK7K9REb5sYyqsFLjxe2E5RIOLkL
         Z6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703288463; x=1703893263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B62g0P/gGVFlQyJfS/rShpgBzqu7U3uldf1NH7n9bWU=;
        b=t4BxMAt6qHeAd1VWXAfwtgDBU2IVCkaKzcUT66bc3Y80iWEctOV0v/6afmZNqOTjaN
         9M6Wp7rORu0ZUsBViX90yyLWyUA3rYhvXJ0XYxbH1p1UlucjdPF+d5641nRHiH8V68eb
         48Wf4DVS/pfY/N2XBsE4YifXTHiOwTIxGx9OyBZPj6nbKWz482Qxl8/2dXSNIOWj1Dl6
         wK6sugm/e/2xSJ7EY+lLW3hSlY04SESSl0BcYxys3pBSWUcM4e/EveIx+sl8TVBj9pFk
         rDCjKI9bCiA6qkVgefs8enyiyx+uwgmGm7c2S424PntmMeQc0JL7MImSAqGzxoehLNfA
         XgRA==
X-Gm-Message-State: AOJu0YzDcN+d6AS/Gz1kOApG1cijvQYUBBEwFLpH9yaIV7udiZMkt7RJ
	4O69b44h+IkbsAnhsvZVc0/1pxtI3FWFuUwTcnA28jLwznZakA==
X-Google-Smtp-Source: AGHT+IFrubDNi5H96GBtN8OB42zi2A+vijQRm2rzRTVSKQBIypSuBYcoi70xiCatUAAAEBvI9EzZoGpLCojYIE8T7FM=
X-Received: by 2002:a17:906:16cb:b0:a23:748e:f3e3 with SMTP id
 t11-20020a17090616cb00b00a23748ef3e3mr1041709ejd.61.1703288462948; Fri, 22
 Dec 2023 15:41:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ+vNU2Kj=a-_xDBsNO5zkyP_mgLsVtA2bXqkAkpmCQmVEA_=w@mail.gmail.com>
 <CAOMZO5CX4xuMvZDMVEND0vpMyuU7ozDm2pk+yVQZAKLenipY_g@mail.gmail.com>
 <CAJ+vNU3FUMBt7WyEJHJFkgjUViTUjS1EgeVt49CcdN7dgtaMfQ@mail.gmail.com> <CAOMZO5AGLAxeRfya2EJOMghqE5cvqZtqPAz05oMfFJT==F6PvQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AGLAxeRfya2EJOMghqE5cvqZtqPAz05oMfFJT==F6PvQ@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 22 Dec 2023 15:40:51 -0800
Message-ID: <CAJ+vNU2A38FpZEWapbXFGnHPyq9JUTBFD0CsKZy7L69Koc1pVw@mail.gmail.com>
Subject: Re: imx7_media_csi probe deferred
To: Fabio Estevam <festevam@gmail.com>, wahrenst@gmx.net
Cc: linux-media <linux-media@vger.kernel.org>, 
	Schrempf Frieder <frieder.schrempf@kontron.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 12:57=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> On Fri, Dec 22, 2023 at 5:51=E2=80=AFPM Tim Harvey <tharvey@gateworks.com=
> wrote:
>
> > Fabio,
> >
> > Thanks for testing. Is this with arch/arm64/defconfig?
>
> I modified arch/arm64/defconfig to only build for NXP i.MX.
>
> The resultant defconfig is this one:
> https://pastebin.com/raw/6dFx3tfp

Fabio,

Interesting... when I avoid using the dt overlay it works fine. There
is something wrong with my overlay - the phandle from the sensor@10
node was missing.

When comparing the output of 'dtc -I fs -O dts
/sys/firmware/devicetree/base' between booting with my overlay vs
booting with the contents of the overlay merged into the base file I
the following diffs:
$ diff /tmp/good.dts /tmp/bad.dts
266a267,269
> <stdout>: Warning (graph_endpoint): /soc@0/bus@32c00000/csi@32e20000/port=
/endpoint:remote-endpoint: graph phandle is not valid
> <stdout>: Warning (graph_endpoint): /soc@0/bus@32c00000/mipi-csi@32e30000=
/ports/port@1/endpoint: graph connection to node '/soc@0/bus@32c00000/csi@3=
2e20000/port/endpoint' is not bidirectional
> <stdout>: Warning (graph_endpoint): /soc@0/bus@32c00000/csi@32e20000/port=
/endpoint:remote-endpoint: graph phandle is not valid
941a945
> phandle =3D <0xaa>;
1711c1715
< phandle =3D <0x45>;
---
> phandle =3D <0xab>;
2461a2466
> imx219 =3D "/soc@0/bus@30800000/i2c@30a40000/sensor@10";
2524a2530
> imx8mm_mipi_csi_in =3D "/soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@=
0/endpoint";
2543a2550
> cam24m =3D "/cam24m";
2560a2568
> imx219_to_mipi_csi2 =3D "/soc@0/bus@30800000/i2c@30a40000/sensor@10/port/=
endpoint";
2569a2578
> reg_cam =3D "/regulator-cam";
2572a2582
> pinctrl_reg_cam =3D "/soc@0/bus@30000000/pinctrl@30330000/regcamgrp";

Not very fun trying to debug this. I'm not sure where exactly a
warning could go that would help show the problem.

With initcall_debug added and manually probing the drivers to help
isolate the messages:
# modprobe imx219
[ 1163.785027] calling  v4l2_async_init+0x0/0x1000 [v4l2_async] @ 627
[ 1163.791401] initcall v4l2_async_init+0x0/0x1000 [v4l2_async]
returned 0 after 44 usecs
[ 1163.808005] calling  imx219_i2c_driver_init+0x0/0x1000 [imx219] @ 627
[ 1163.814693] imx219 2-0010: supply VANA not found, using dummy regulator
[ 1163.821625] imx219 2-0010: supply VDDL not found, using dummy regulator
[ 1163.837185] probe of 2-0010 returned 0 after 22594 usecs
[ 1163.842614] initcall imx219_i2c_driver_init+0x0/0x1000 [imx219]
returned 0 after 28094 usecs
^^ no problems here with the imx219 camera sensor

# modprobe imx_mipi_csis
[ 1207.488915] calling  mipi_csis_driver_init+0x0/0x1000 [imx_mipi_csis] @ =
633
[ 1207.496401] probe of 32e30000.mipi-csi returned -517 after 24 usecs
[ 1207.502884] initcall mipi_csis_driver_init+0x0/0x1000
[imx_mipi_csis] returned 0 after 6866 usecs
^^^ the -517 (EPROBE_DEFER) here shows a problem but its not clear why it d=
efers

# modprobe imx7_media_csi
[ 1214.345573] calling  imx7_csi_driver_init+0x0/0x1000 [imx7_media_csi] @ =
636
[ 1214.353170] imx-pgc imx-pgc-domain.10: imx_pgc_power_up dispmix
[ 1214.359185] imx-pgc imx-pgc-domain.10: imx_pgc_power_up dispmix ok
[ 1214.365424] imx7_csi_probe
[ 1214.368532] imx7-csi 32e20000.csi: Registered csi capture as /dev/video2
[ 1214.375688] imx7-csi 32e20000.csi: error -ENOTCONN: Failed to get
remote endpoint
[ 1214.383250] imx7_csi_probe async_register failed -107
[ 1214.388643] imx7-csi: probe of 32e20000.csi failed with error -107
[ 1214.394913] imx-pgc imx-pgc-domain.10: imx_pgc_power_down dispmix
[ 1214.396068] probe of 32e20000.csi returned 107 after 42995 usecs
[ 1214.401065] imx-pgc imx-pgc-domain.10: imx_pgc_power_down dispmix ok
[ 1214.414034] initcall imx7_csi_driver_init+0x0/0x1000
[imx7_media_csi] returned 0 after 61350 usecs
^^^ the ENOTCONN here is due to imx_mipi_csis being deferred

The whole problem appears to be because I was using 'make
DTC_FLAGS=3D"-@" dtbs' in my build script because my previous kernel
version required the DTC_FLAG for overlays and now apparently not only
is it no longer required it causes an issue.

Thanks for the testing, and thanks Stefan for the suggestion of adding
initcall_debug - they both helped me down the right path to
understanding this issue.

Best Regards,

Tim

