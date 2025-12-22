Return-Path: <linux-media+bounces-49355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB75CD6584
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 15:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F1EE303CF74
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E972EFD9B;
	Mon, 22 Dec 2025 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VzeRHv7J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23826B2AD
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766413024; cv=none; b=oWUxnFOnL8adMi1JH7t97C+QboHiihO1txHmQX/OTeuHVpsexUqIAHXVPEZcs1LXdKomgc1ePg90Ao7g/UzfZXQsQZ3c32SgszUFRZAzvyhdVBDy0PboWELemmwL6jZVQrII44t9y2ZMQ8EWMq+NS/M6AIa9R3HHCpanJK6mhtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766413024; c=relaxed/simple;
	bh=ADP0V/e0lB7hrxNre1IA6Ut/hQzma0pk/aLgLdl+oic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bU4tAi2eIi7ttkIOGE3Aq68TUx/ESZVPl2VrtY+H+LUCtS+PQPFc1IB/8DCqwVx8N3mSzDY4qMX6Gtm5GbvhyQ7cRAS2VyB4lmRF1MI5Qo9899ZG8S7Ti3lCdZQTIe2RFV8tgMFcQaG6Hh8A3r8szGB+HyXXy7sayFn12WaAWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VzeRHv7J; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78c66bdf675so32886787b3.2
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 06:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1766413020; x=1767017820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwY4dLSBmxV8Qa7Uu3Z1V/HTwaemSNvD3NMeFEXkxjs=;
        b=VzeRHv7Je8k3urI44zezOK9a8DWA05IvcUUa0VZPQdHWtffaFnPFwG164ICh6Xmu2m
         kVo5Y3XX2nPW/ZmXckspFtH2SFISJv9pEtxKd2zRvLz3S09PKeMvjjQT89cXy1KcrCmQ
         T2zUgGH+tn/LqUAB6PrnzdQG79J/vrdZVmqtdQ2xDIzKytpBXihumRxwKOJJoH8s6BIs
         icat5naepRDvwtE5LBt+zFtdD5NS6rDzacfBGSKf2krXi+yMltbG16nw4MyhzjWXg8/Q
         S0xiVYxnpT5j1ssBd/j5nFNAS+SBb1TYDphC2rkLjZtx1QmbPHXcmymVcHDNJJxpUr6A
         JLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766413020; x=1767017820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GwY4dLSBmxV8Qa7Uu3Z1V/HTwaemSNvD3NMeFEXkxjs=;
        b=ol+VvU0dlVpSzVO/9ud+d9Vxwg9niJOc/k9UgcZCoGiNdamFfaMhkCyl9Pb+bpxGjx
         z63B3jvIfJ4I+s1Xsprjo5keTDrJw6W6YNcUV2ZxGMlyuTdIurFHG/BOOn1IfTdn7XC6
         LKXVyG0Nho27T+PSll4Wgw0NA4gIrLKrzIK2oqGGVUKGGydSEoZfk6hi4BNcCh17zBAM
         LxEXXL2ukCsNwANpiqII/5Mz4DEivN9DZH30tGFeQEHzUg877WLq3VXMNXYNjYXgC08T
         awcUeg1XYvu9km2TH5WYRuCgoDPzqn8XxrCM3Jj1a4JjMEHHGoHykILJzSEM4elS7Z5+
         0/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVKqoZzQDkatLkfLR9eW5q/6iqrIkNsepbd+wG2SAeS4NyICfrYmJ1CTzsmsxl95TdEAEUtC8l+DQ0afA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rZARSVCno627xC+IVNdjYWm6YUP8d8rvoPuBOsiSDBIqvBj7
	Qiq10HExkxiAhggCA4kTty3mWSaoI97bMWc4oJL2uwp0RRIFxX5s34ESeaa024Zlq4ZkwmjDqOC
	Ouplhx36kX9KkiVChrBDeYsbkyPALlbVxz5f4e977KDiJQZI2BEwE9FU=
X-Gm-Gg: AY/fxX6Ja92G+OLdVD1UVNgWxSsYJ9/ZxiZE41x8fQbQQBHFmLqYkxjH4NlEJ7R+CJU
	ydAMLJtwqCIo20fMV1KHqBTPhmB5KLIwNuf2he5nrTOZZNf1kACKLAyyQm+dUK8uDauS6YvykYc
	9ZhoVdV7C0OVv1/SZKd8OsGhOs1fFb7WnY5hJJOdRxYHon96D53aZcHFoegXDyRmgZ093W/yE+z
	/Gj3zFy8pS9O3a5I5567bv2vo+UbnKF5KhEiS8U2kfKx/UdwTieRUsp78EED3PjR4ad8N5tIq8g
	CHjfsyWNTT66+XHiKtLha+vyn1w=
X-Google-Smtp-Source: AGHT+IGeqCH8UBjWK2+dcoFWbu8LXb1Bgoh6BlDOq/kTeTCnIbaq3/N8NTv8+w2ZbH7GaJV8NJMaU67sVs0Ndqncbu8=
X-Received: by 2002:a05:690c:f92:b0:786:45ce:9bd3 with SMTP id
 00721157ae682-78fb4146acbmr98350247b3.34.1766413020423; Mon, 22 Dec 2025
 06:17:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
 <aUkLKECix4vohyTB@kekkonen.localdomain> <bbf6dbc9-42b5-4dd6-9346-c8f38e460709@oss.qualcomm.com>
 <CAPY8ntD9GO_Y13K=Ko5kxz-o1edaocJP=Ns50rUheJP0iJ9fNg@mail.gmail.com> <ffa7b849-51da-42f7-be1d-c3c7e1903e6e@oss.qualcomm.com>
In-Reply-To: <ffa7b849-51da-42f7-be1d-c3c7e1903e6e@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 22 Dec 2025 14:16:44 +0000
X-Gm-Features: AQt7F2rp1lTwfmWwe9R0yd38-_1IhZQnrUP41X1Kntj2OmhXo4g2Ddu5R-r6JE8
Message-ID: <CAPY8ntDAiJcJiixo2mTqcb898UC3AR-+NVPFPS6EtrGoEWKewg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx412: Extend the power-on waiting time
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wenmeng Liu <quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wenmeng

On Mon, 22 Dec 2025 at 12:20, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wr=
ote:
>
>
>
> On 12/22/2025 8:11 PM, Dave Stevenson wrote:
> > Hi Wenmeng & Sakari
> >
> > On Mon, 22 Dec 2025 at 09:35, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com=
> wrote:
> >>
> >>
> >>
> >>
> >>>>
> >>>> The Arducam IMX577 module requires a longer reset time than the 1000=
=C2=B5s
> >>>> configured in the current driver. Increase the wait time after power=
-on
> >>>> to ensure proper initialization.
> >>>
> >>> Is this somehow specific to the Arducam module? If so, what's there i=
n the
> >>> module that requires this?
> >>>
> >>
> >>
> >> Yes, This issue occurred on the Arducam 22-pin IMX577 module.
> >> I have tried changing the sequence of regulator, reset, and clock, and
> >> found that this module must wait a sufficient amount of time after res=
et
> >> before registers can be written (10 ms is a safe duration). This issue
> >> did not occur when using other IMX577 modules.
> >
> > Is it the probe that fails, or starting streaming?
> >
> > Google has found me a datasheet for IMX577 at [1]. I'm hoping you have
> > an official datasheet, so do correct the following if that has any
> > updates.
> > Section 7-2-2 on page 30 for the startup sequence.
> >
> > The sequence is meant to be regulators, INCK, and then XCLR. The
> > driver does XCLR before clock, so that would appear to be wrong.
> >
> > It also states that T6 as the time from XCLR to being able to read the
> > version register is min 0.6ms, but T7 as the time before you can send
> > "Streaming Commmand" is min 8ms "To complete reading all parameters
> > from NVM".
> > That would be a difference between probe and start_streaming, although
> > admittedly sending the mode and control setup I2C commands will take
> > up some of that time.
> >
> > Plausibly the other set of modules don't have the NVM programmed and
> > hence they are ready sooner. Either way I'd say that does mean the
> > driver currently isn't following the defined power up sequence, and
> > the patch looks reasonable for IMX577.
> > However as this is a shared driver does IMX412 have this restriction
> > too? I can't find a datasheet for that one to check. For the sake of
> > ~9ms it's not going to make a huge difference though.
> >
> >    Dave
> >
> > [1] https://en.sunnywale.com/uploadfile/2021/1222/IMX577-AACK-C(Awin).p=
df
> >
>
> Hi Dave,
>
> this issue appears in the write register when streamon
> imx412_write_regs.  poweron->streamon.
>
> static int imx412_start_streaming(struct imx412 *imx412)
> {
>          const struct imx412_reg_list *reg_list;
>          int ret;
>
>          /* Write sensor mode registers */
>          reg_list =3D &imx412->cur_mode->reg_list;
>          ret =3D imx412_write_regs(imx412, reg_list->regs,
>                                  reg_list->num_of_regs);
>          if (ret) {
>                  dev_err(imx412->dev, "fail to write initial registers\n"=
);
>                  return ret;
>          }
>
>          /* Setup handler will write actual exposure and gain */
>          ret =3D  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
>          if (ret) {
>                  dev_err(imx412->dev, "fail to setup handler\n");
>                  return ret;
>          }
>
>          /* Delay is required before streaming*/
>          usleep_range(7400, 8000);
>
>          /* Start streaming */
>          ret =3D imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
>                                 1, IMX412_MODE_STREAMING);
>          if (ret) {
>                  dev_err(imx412->dev, "fail to start streaming\n");
>                  return ret;
>          }
>
>          return 0;
> }
>  > but T7 as the time before you can send "Streaming Commmand" is min 8ms=
 "
> I think the usleep_range(7400, 8000) represents the 8ms duration
> required by T7.

I'd missed that one.
If you've delayed for 10-12ms between coming out of reset and sending
the first command, then does the Arducam module still require another
8ms here, or can that be removed as you've already complied with T7?

Have you asked Arducam as to why their module takes longer? I can't
find an IMX577 module listed on their product pages so presumably it's
discontinued. There are a few links for a Luxonis Oak DepthAI board
[1] which is made by Arducam and is using IMX577, so is it that one?
Generally I've not encountered an issue with Arducam adding any weird
delay circuits on their sensor boards.

  Dave

[1] https://shop.luxonis.com/products/oak-ffc-imx577-m12

> Thanks,
> Wenmeng
>
>

