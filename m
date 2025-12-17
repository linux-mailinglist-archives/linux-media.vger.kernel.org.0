Return-Path: <linux-media+bounces-48997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 23192CC896B
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 16:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6249930111A3
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 15:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6EB338901;
	Wed, 17 Dec 2025 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pHjK2g5s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955625CC63
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765985997; cv=none; b=SMkm98hyvpoQuWWdlRQxoVzQZKUZ7gMJmiHHOoiWwLbtPJf0yWM84lkkvOTFyPBHLZdypzl1zg+ZwgNLE1WdtfUl8X6kNmFVCHFpf99iqWrcOr/qTybzR/VE98HpPVZB1QNFqpKnPvF1/+oK2d4SYw0aL57udVl15RvAItO7t2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765985997; c=relaxed/simple;
	bh=mrBMimjI11dHuvFPqISVTtDUYuPSNskoP5d1dCV17G4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyrfJPv4GrMMBLDCeqgu4OW72Zu2/mdkSsC2QQQuo0LDg9iW9LYete72R3X2Q+rbeuo37ESiucPHd6Mk4vbFfKY11usI5SHwBrSBdaKUhe6Rodkpo4Ed2rBl4qCX4aHd7yUUUxNkmvfgAKRCOIzocvuHO/2zojsUeFL2ghF+U0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pHjK2g5s; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6420c0cf4abso6141565d50.1
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 07:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1765985994; x=1766590794; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EiVzwWdacxkhneKAdGEpfk/mCKguMvjfcTbK+oCX6IY=;
        b=pHjK2g5ssTz3Oif7TMd5XShST2xR8vpXPydsKF8+YdtZirmsdRIVRkfYTo441xkPf8
         F2ofq2/UU1+JoiEOY84so83CL3k6Kk92iM9IwQbfMjGk1gh17wt2M7IxtqEqGvSpWk3/
         3SgsXnOahLyKpLUN6L0wQcabnG5MGxZ/YIE4p7a8med+8o2ZaJwyfZnDouKqoisRU2td
         xqEjlcjQF7UhkoNVDSAwFCQeb9eKGoXXu9vgNTe+e10tlxuZbN8oPB2re2GN+yQH8WqX
         aZZtC4Qxk7yEIlqtJ6ncf4BmseP0jpv08zOWUdTSPzZf7ClqMCzo3nLlOaRyEVC4tq+S
         NRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765985994; x=1766590794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiVzwWdacxkhneKAdGEpfk/mCKguMvjfcTbK+oCX6IY=;
        b=WQZqOxR1noLVGxdCEV6KyZq9aDZ7yDFIjNWCKZgxx4suolLmsj0wNeFeAJkqJwGDr/
         Bz7/Nw+xYoegSZ1hRmSGZTZlm0GdamM1WSAjXTmze3UEZR1FJO1Z95bHwZAIW3LCArIr
         HBxEnM5uMSw6abAgtemgmxZ7FIj8NGhHPeCof62YeccXssfh68QQZxMij23SUdFvg1rs
         ot7XSgUV1+z4Ssa/MB9VsdiVoH1dhvR7igLqCPJnyecVwyM8h6hah838VYDrJY3bHhQr
         noOeHRvnVVTNbyAp9XdW9GqbosJvYCbKOlK+UM2YoXpJlFYf7CbWX6/IIaCLXn2zQ/zJ
         MU8g==
X-Forwarded-Encrypted: i=1; AJvYcCWeDIUU7LHKKKaI85x+V80nLyGB990h+Gj5nqzw5s6Edr+f6SVJ0w+mH+YMMG8RPAOx6AMqkLv5g1fLkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1uec9X/o77Rh00L8P7Io3FAcjdVIBJJuKqPaPqsZN0WVFghO
	Y4K2I+4vVYqF9i/eiULkNAnuCMXdhx+P7lSt1JT27ZHhPqs0aczae6KgpHGUJlARQ8E69E5p2Tx
	mRaHZ3zD/h4skCLDxjzkf1Mo0emWCExURBxEdn6acMQ==
X-Gm-Gg: AY/fxX7HzOPJeJ1GU6Ow0nnysXxvkIp2n6BSOqLbqGVs5Sy9Us3i8vdICYqDDPeGHGl
	bjTkTjBwBlUJqQsSouiZGvjjzalE7OTukbYd+AUrnWcYU2uAotWVbbRjqnx5hiA0SkXwZdTqTxW
	uLO+Lk6kIOAXUszHl5nPNw7N8C57ozu5HSgVYP7RhJKG/zTfPW7Uj45KQT7CuH6Kk4G93ADlj+f
	JNQ1yL377Ex5x/VXRD30Q2Rd8nclcjzUwxmEPuNQPLlFT/huZZGqPVQhCyUqMPwDjBgtLxzTfAt
	xltaJxMoH2S/JmoLXZFV/DgGbmbZAIbEL1fa7Q==
X-Google-Smtp-Source: AGHT+IF0UWIEvDligc6GLPT2EP8UI6dynKE2F9VgBLponH5sNOvuFwkLlrOJIPG/JiWBmPq7sLVXfM7WH1TtidkQa5w=
X-Received: by 2002:a05:690e:1484:b0:63f:9f72:4936 with SMTP id
 956f58d0204a3-64555661eaemr12424883d50.67.1765985993823; Wed, 17 Dec 2025
 07:39:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
 <20251217-imx283-ext-v1-3-906a762f592d@emfend.at> <CAPY8ntCiOJb9iyFDYS_wxhteoHL7vMFpEF8gVwrf2qeFd-Fssw@mail.gmail.com>
 <2f93eda4-483e-4fa2-a765-73e8df4eeaea@emfend.at> <176597534567.3937789.3409848773538845012@ping.linuxembedded.co.uk>
 <4cea157c-5371-4c9c-b554-a53aaa786b6f@emfend.at>
In-Reply-To: <4cea157c-5371-4c9c-b554-a53aaa786b6f@emfend.at>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 17 Dec 2025 15:39:38 +0000
X-Gm-Features: AQt7F2qOacOKJuQdekxGuv8SbTowmpYHRDvStJt71VhbH8vGRkCXAQ0O96bDou8
Message-ID: <CAPY8ntBSHMgw1DRyLJ7acDO0_VRaJywSurC_VyMHh_OU0sjv_A@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx283: implement {g,s}_register
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Umang Jain <uajain@igalia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Matthias

On Wed, 17 Dec 2025 at 14:02, Matthias Fend <matthias.fend@emfend.at> wrote:
>
> * Spam *
> Hi Kieran,
>
> thanks for your reply.
>
> Am 17.12.2025 um 13:42 schrieb Kieran Bingham:
> > Quoting Matthias Fend (2025-12-17 12:21:28)
> >> Hi Dave,
> >>
> >> thanks for your comment.
> >>
> >> Am 17.12.2025 um 12:54 schrieb Dave Stevenson:
> >>> Hi Matthias
> >>>
> >>> On Wed, 17 Dec 2025 at 07:41, Matthias Fend <matthias.fend@emfend.at> wrote:
> >>>>
> >>>> Implement {g,s}_register to support advanced V4L2 debug functionality.
> >>>
> >>> Is there any real benefit to providing access via {g,s}_register
> >>> rather than using i2ctransfer -f ? The I2C framework ensures that each
> >>> transfer is atomic as long as it is formed into one transaction
> >>> request.
> >>
> >> This allows, for example, the registers to be changed when the image
> >> sensor is actually used in streaming mode.
> >>
> >> IMHO, this cannot be covered by i2ctransfer, as the device is used
> >> exclusively by the driver.
> >
> > I frequently modify registers while the device is streaming to debug and
> > investigate.
> >
> > I use my colleague Tomi's rwmem tool though:
> >
> >   - https://github.com/tomba/rwmem
> >
> > But I don't think it does anything specifically special - it's still an
> > underlying i2c-transfer operation through /dev/i2c-x ?
>
> Thanks for the hint - I didn't know that tool yet.
>
> With the '-f' option, it's actually possible to use i2ctransfer as well.

That's why I said using i2ctransfer -f :-) The force option is "sudo"
when it comes to I2C commands.

I'm in the same boat as Kieran in fairly frequently modifying
registers whilst streaming, and then frequently getting annoyed when
the driver puts the value back again!

> >
> >
> >
> >>
> >>>
> >>> IMHO The only place these are really needed is with devices such as
> >>> the adv7180 family which have a bank and page addressing scheme, and
> >>> the driver is caching the last accessed bank.
> >>>
> >>>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> >>>> ---
> >>>>    drivers/media/i2c/imx283.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >>>>    1 file changed, 44 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> >>>> index 7a6ab2941ea985401b21d60163b58e980cf31ddc..d8ccde0a1587259f39a10984c517cc57d323b6bc 100644
> >>>> --- a/drivers/media/i2c/imx283.c
> >>>> +++ b/drivers/media/i2c/imx283.c
> >>>> @@ -1295,7 +1295,51 @@ static const struct v4l2_subdev_internal_ops imx283_internal_ops = {
> >>>>           .init_state = imx283_init_state,
> >>>>    };
> >>>>
> >>>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> >>>> +static int imx283_g_register(struct v4l2_subdev *sd,
> >>>> +                            struct v4l2_dbg_register *reg)
> >>>> +{
> >>>> +       struct imx283 *imx283 = to_imx283(sd);
> >>>> +       u64 val;
> >>>> +       int ret;
> >>>> +
> >>>> +       if (!pm_runtime_get_if_active(imx283->dev))
> >>>> +               return 0;
> >>>
> >>> Returning no error if the device is powered down feels wrong. How is
> >>> the caller meant to differentiate between powered down and the
> >>> register actually containing 0?
> >>
> >> The only other I2C drivers that use pm* in {g,s}_register seem to be
> >> imx283 and tc358746. Since both return 0 when the device is inactive, I
> >
> > Did you mean something other than imx283 here ?
>
> True, the IMX283 is obviously not a good reference in this respect :)
>
> However, if there's agreement that implementing {g,s}_register for this
> driver isn't sensible, I'll just drop this commit.

Dropping it would get my vote.
The functionality is duplicated by "i2ctransfer -f ..." or rwmem, and
then you've got one fewer abstraction. If the sensor is powered down
when you try accessing it, then you'll get the i2c error code back.

Thanks
  Dave

> Thanks
>   ~Matthias
>
> >
> > --
> > Kieran
> >
> >> figured there must be a reason for this and implemented it that way as well.
> >>
> >> Thanks
> >>    ~Matthias
> >>
> >>>
> >>>> +
> >>>> +       ret = cci_read(imx283->cci, CCI_REG8(reg->reg), &val, NULL);
> >>>> +       reg->val = val;
> >>>> +
> >>>> +       pm_runtime_put(imx283->dev);
> >>>> +
> >>>> +       return ret;
> >>>> +}
> >>>> +
> >>>> +static int imx283_s_register(struct v4l2_subdev *sd,
> >>>> +                            const struct v4l2_dbg_register *reg)
> >>>> +{
> >>>> +       struct imx283 *imx283 = to_imx283(sd);
> >>>> +       int ret;
> >>>> +
> >>>> +       if (!pm_runtime_get_if_active(imx283->dev))
> >>>> +               return 0;
> >>>
> >>> Ditto here. The caller is told the value was written, but it wasn't.
> >>>
> >>> Thanks.
> >>>     Dave
> >>>
> >>>> +
> >>>> +       ret = cci_write(imx283->cci, CCI_REG8(reg->reg), reg->val, NULL);
> >>>> +
> >>>> +       pm_runtime_put(imx283->dev);
> >>>> +
> >>>> +       return ret;
> >>>> +}
> >>>> +#endif
> >>>> +
> >>>> +static const struct v4l2_subdev_core_ops imx283_core_ops = {
> >>>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> >>>> +       .g_register = imx283_g_register,
> >>>> +       .s_register = imx283_s_register,
> >>>> +#endif
> >>>> +};
> >>>> +
> >>>>    static const struct v4l2_subdev_ops imx283_subdev_ops = {
> >>>> +       .core = &imx283_core_ops,
> >>>>           .video = &imx283_video_ops,
> >>>>           .pad = &imx283_pad_ops,
> >>>>    };
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>>
> >>
>
>

