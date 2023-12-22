Return-Path: <linux-media+bounces-2926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5381CF5F
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 21:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FD451F22857
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 20:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77E71E526;
	Fri, 22 Dec 2023 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20230601.gappssmtp.com header.i=@gateworks-com.20230601.gappssmtp.com header.b="iV7CUWKd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074AF1E519
	for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 20:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a268836254aso264785766b.1
        for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 12:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20230601.gappssmtp.com; s=20230601; t=1703278311; x=1703883111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv2aSBY8a6b7XHaPbPahN2UnL0d02Pcl+tCsp7KsPdM=;
        b=iV7CUWKdS0ujIsTCEhssxfum1+F2wtfMLk1KiSiIcAv0SOm0axL1FvGppanaBd2Wi/
         E4p/EQ1tYjAXU4yZAqL9R9EEEE/y0G6gpdTR2rZV1nnpC8e2ZtC/Vb1NsQn563lGJWCG
         hhHU3NSrlgN8IVIkboiopB1nLQoNGJRE2CK6HweaKugQDNI4sbROr9u8VSARqkjF5q2b
         dLIIIKGicIeio6GHHm/DizyUfy6WxisTPf/HCZzekdqF/0ziJa1WVrS8ftbD/VjqZLyk
         Rjlhn1dBorKyXI8C7TzgF52EluILxb7o8Y+ffsMGifMdrFUC7IkCEH35vz5QWCcy06Fe
         O8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703278311; x=1703883111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cv2aSBY8a6b7XHaPbPahN2UnL0d02Pcl+tCsp7KsPdM=;
        b=NYq088AmESJ0diHV3rkAQHPiBXe0EQsTomPBZx+PzEUj01LCgOvaSKj+AqUDiuiGh1
         7Nnd7MRkyVta0I8C24nqhBNprL8pZgk2KiqSz1pVNU1h6EWKMZoxf3shF95+7o4GSsUM
         uWadOoRdPRKIexEGcuXOfgWwkNPIF6+gODHhDgS0j7WK18pN949ysLyiklQJO5FStNoV
         PLv4LQwdWSumQSPBylvH4YyLLQMKX2XY+47BffFNKEYYptjkXMZ9kp2NpoahrYS3UGCe
         CR9/RPjbPFTbQf3dCdfj+VkVyj3J9zt2Tg4JgkCsNogh7vd63R3SGbDLmvQC+TPtwG8B
         b/qQ==
X-Gm-Message-State: AOJu0YwS0HpMFxd5qGVKCsl6b8oLjcR+VEV6PKCXvhwcjicK0xyBKMM/
	6qAoGqoIRQEyzcQ3VLHtYgxp3AxL/Y2D1TO5geoelmClRlA4Xw==
X-Google-Smtp-Source: AGHT+IEJgXYAg1JDeMSLR4vrT8bJOOoBDZqADTvaaWcZEBmtUVMXJioVyLN9yKAIufTBDl7URYygoLT5Qxm4ysfTRaI=
X-Received: by 2002:a17:906:fd46:b0:a26:d2ce:93ef with SMTP id
 wi6-20020a170906fd4600b00a26d2ce93efmr13768ejb.70.1703278310713; Fri, 22 Dec
 2023 12:51:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ+vNU2Kj=a-_xDBsNO5zkyP_mgLsVtA2bXqkAkpmCQmVEA_=w@mail.gmail.com>
 <CAOMZO5CX4xuMvZDMVEND0vpMyuU7ozDm2pk+yVQZAKLenipY_g@mail.gmail.com>
In-Reply-To: <CAOMZO5CX4xuMvZDMVEND0vpMyuU7ozDm2pk+yVQZAKLenipY_g@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 22 Dec 2023 12:51:38 -0800
Message-ID: <CAJ+vNU3FUMBt7WyEJHJFkgjUViTUjS1EgeVt49CcdN7dgtaMfQ@mail.gmail.com>
Subject: Re: imx7_media_csi probe deferred
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-media <linux-media@vger.kernel.org>, 
	Schrempf Frieder <frieder.schrempf@kontron.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 12:26=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Hi Tim,
>
> On Thu, Dec 21, 2023 at 10:12=E2=80=AFPM Tim Harvey <tharvey@gateworks.co=
m> wrote:
> >
> > Greetings,
> >
> > I'm running into an issue with Linux 6.6 (6.6.8) when compiling with
> > modules where the imx7_media_csi driver probe is deferred and I'm not
> > clear how to troubleshoot the cause.
> >
> > The board is imx8mm-venice-gw73xx-0x [1] with
> > imx8mm-venice-gw73xx-0x-imx219.dtso [2] and I'm using
> > arch/arm64/configs/defconfig.
> >
> > The kernel reports the following:
> > # dmesg | egrep csi\|mipi\|imx219
> > [    1.293264] i2c 2-0010: Fixed dependency cycle(s) with
> > /soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
> > [   12.001419] imx219 2-0010: supply VANA not found, using dummy regula=
tor
> > [   12.044885] imx219 2-0010: supply VDDL not found, using dummy regula=
tor
> > [   12.164308] imx7-csi 32e20000.csi: Registered csi capture as /dev/vi=
deo0
> > [   12.178460] imx7-csi 32e20000.csi: error -ENOTCONN: Failed to get
> > remote endpoint
> > [   12.200047] imx7-csi: probe of 32e20000.csi failed with error -107
> > # cat /sys/kernel/debug/devices_deferred
> > cpufreq-dt
> > 32e30000.mipi-csi       platform: wait for supplier
>
> I am not able to reproduce this problem.
>
> I have just booted 6.6.8 on an imx8mm-evk and the camera is working well:
>
> root@imx8mmevk:~# dmesg | egrep csi\|mipi\|ov56
> [    0.042431] platform 32e30000.mipi-csi: Fixed dependency cycle(s)
> with /soc@0/bus@32c00000/csi@32e20000/port/endpoint
> [    1.575489] i2c 2-003c: Fixed dependency cycle(s) with
> /soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
> [    5.514082] ov5640 2-003c: supply DOVDD not found, using dummy regulat=
or
> [    5.522453] ov5640 2-003c: supply AVDD not found, using dummy regulato=
r
> [    5.538136] ov5640 2-003c: supply DVDD not found, using dummy regulato=
r
> [    5.552376] imx-mipi-csis 32e30000.mipi-csi: lanes: 2, freq: 333000000
> [    5.583661] imx7-csi 32e20000.csi: Registered csi capture as /dev/vide=
o0
>
> root@imx8mmevk:~# cat /sys/kernel/debug/devices_deferred
> root@imx8mmevk:~# zcat /proc/config.gz | egrep
> VIDEO_OV5640\|VIDEO_IMX_MIPI\|VIDEO_IMX7
> CONFIG_VIDEO_IMX7_CSI=3Dm
> CONFIG_VIDEO_IMX_MIPI_CSIS=3Dm
> CONFIG_VIDEO_OV5640=3Dm

Fabio,

Thanks for testing. Is this with arch/arm64/defconfig?

Best Regards,

Tim

