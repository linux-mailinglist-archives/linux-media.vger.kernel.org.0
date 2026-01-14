Return-Path: <linux-media+bounces-50715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E93D2094F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 18:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 749203005F36
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 17:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A023033F1;
	Wed, 14 Jan 2026 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhEEWBru"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F3E2F3621
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768412289; cv=none; b=bs0K1QWXojfofqqGyO6epfLzLtPK91NzVtSNYjmC2fvkt17fXG1k7oH9wNznGS13UP4aks3REZjblb5Cd+NO1FK5U3aeOhwPT2/H60fKzNm7AxUleRPLqgtTwLEZNYIeMn3MwvQoOZhkn6FRXK7zWYylvCsj7oxMz1txwhSJ2QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768412289; c=relaxed/simple;
	bh=4e8drGCbCMEGkeJqJL8hBuXVLiObLZ0AkwcUUafRzxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWUVKIvgCgejditB11CG8fH6RWgydMMoxzMOHziZUGo7iIQe3sLkfe7bVQCedgT0vg+HhhqfpWwZuC8jp0ux3wFPCnDchVOBKKm4yiZvpCu1P9BtFjnyEVjFjybrPyUnw5dyCm0dkx+Wnrf5HFbjMbHLWSAZ+TQuebR720Dq7OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhEEWBru; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64661975669so9638392d50.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768412287; x=1769017087; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GNKgmzXJzqRMXg2Qi6sVMUlgJyo3BFl1pk1B1U573A8=;
        b=HhEEWBruRRnKTulR6+XqwdWOzEQGdJrIgr1J2nDT8PL0fvHmTbtCbxeg8h0Hlv3NoG
         tIt/2eUPOLOqQRexF/53GBdmG2Bik0IFIMT5hBa5Tv3+OdBr8OpaLet/YhpC6lp2GJeZ
         /06PK3Q5XuW2+JmVXv0+7OwQt8umZyK9prmcOOmgk8iaMdlqq64aD7GknBXO/0RKc781
         /hRSlhLwAR5pYxLB99RuEJDu6dD1Kz8jtkobF/IEumrgZY6HkAQUShc7RF6v629F/w9D
         6GWgvbeeFCtSQ7kABbciFgMhzYyvjAnX8kiBnnGnhAJDrKoDHAO7b++NNldQCLTLc6uV
         aeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768412287; x=1769017087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNKgmzXJzqRMXg2Qi6sVMUlgJyo3BFl1pk1B1U573A8=;
        b=KtxfaWisRx32ytc8U2+H2gSF4C/++LfUIAn10Vvk9I2NavuLY4s42H4tkMn0XJLxQY
         aDQ3Lf/zTY5h1QK/7q2BI/DbiN1G+2/ZyyIy29YfdrTzf4g50H1zGpnGhz7Q0DfSsZx+
         CkhgLwSOWBkXTUSwFXYJ89R+5ZixT3HG6R0xL1XoeKfOGdYy5Rn9cKEsugBNwyW+of7z
         W/cmvijyl84JJ/HzSA1CAEVnkBvY78sIlqwF8cZxe6TsFYCtq14g9Vt1QJ0vzSTF2pQ5
         QxBkHxHCsz2o5Xji6sSapfF7tGKgzOHCPOcsqYA5p58Bcmql2hMMYLS0y8dJ6L0urlhi
         GIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwIPo9QTRrH+xqRPl6J2wSpaEFypLtNWj61I9H3yIojf1ENv6Nj2yiCS2VDp9k3vwlJuoK/pVtPcuB2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/pebwCIbu/kd9cbde06U/SUcLAzmffqFSNLL6ZZheNteb50Qn
	/yuFpEuzj4h9m+2e7KTAs5/KqqqZ2rLhy8F4+q5PHG5NnWiw230ZER1oCzGniGErivtuLViiXpZ
	LnMPbk3ZoG3PKQwk+0IukiIqSeBf3mwc=
X-Gm-Gg: AY/fxX4Yl1/JCugPhqKuDD76osJFXzvfZFUCVZ36/Bs4Tvpc9dSC/Bo1a7ZSsHQ0yfZ
	eT2KfdpJ4cYt3bWS4OMer4gLDfxxQQpBICQzlvG59sjOF54R4dVHmEMeb3jOgzJNn3gd9dwKRB2
	re3MJ1Xfwmh42Q3ExKe3oadRoFdWyhKXBTWAN0TnDrxa1hbh/LP2mmMwYatr4P/k/nFyN1EwH/l
	svB4ch5p8Gwil85Ag6WNJT1uUmcOaATiD4WfTVcquJHPLlsMvzv8MABlkUIraRcS87zmue5YA==
X-Received: by 2002:a05:690e:1907:b0:63f:b5d8:9db2 with SMTP id
 956f58d0204a3-64901aac89fmr3055887d50.14.1768412286780; Wed, 14 Jan 2026
 09:38:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231052427.58840-1-karthikey3608@gmail.com> <aWTUMPVMzxL7XuHt@kekkonen.localdomain>
In-Reply-To: <aWTUMPVMzxL7XuHt@kekkonen.localdomain>
From: Karthikey Kadati <karthikey3608@gmail.com>
Date: Wed, 14 Jan 2026 23:07:54 +0530
X-Gm-Features: AZwV_QjGYmzL6YR8wxZBwB1j333f3qswknmP_D3Evmi-bMG1uGseei4PKAWeyes
Message-ID: <CAPsOcun2Pkn5ojW_QgR3m2M4aZ2pu4bnebaNUE3hHej+b86m_A@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: remove private white balance IOCTLs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

You are absolutely right.

I investigated the code and confirmed that `integer_bits` in
`atomisp_wb_config` is essential for the hardware's gain calculation
(shift logic) and varies by configuration. Mapping this to standard
V4L2 controls (like `V4L2_CID_RED_BALANCE`) would mask this parameter,
making the interface unusable or forcing incorrect assumptions.

I also see that `ATOMISP_IOC_S_PARAMETERS` already exists and accepts
`struct atomisp_parameters`, which includes `atomisp_wb_config`. This
appears to be the "parameter buffer" mechanism you referred to, which
correctly handles the full configuration context.

Attempting to convert these specific private IOCTLs to standard
controls was the wrong approach, as they seem to be redundant legacy
interfaces better served by the existing parameter buffer.

I will drop this patch from the series.

Thanks,
Karthikey


On Mon, 12 Jan 2026 at 16:30, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Karthikey,
>
> On Wed, Dec 31, 2025 at 10:54:27AM +0530, Karthikey D Kadati wrote:
> > This patch resolves a MUST-FIX graduation blocker identified in the
> > atomisp TODO by removing the private ATOMISP_IOC_G_ISP_WHITE_BALANCE
> > and ATOMISP_IOC_S_ISP_WHITE_BALANCE and replacing them with standard
> > V4L2 control handling.
> >
> > The private IOCTLs were used to set white balance parameters. This
> > functionality is now mapped to the standard V4L2 controls
> > V4L2_CID_RED_BALANCE and V4L2_CID_BLUE_BALANCE.
> >
> > A helper function `atomisp_v4l2_set_wb` is introduced to translate the
> > V4L2 control values to the driver's internal configuration format.
> >
> > Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
> > ---
> >  .../media/atomisp/include/linux/atomisp.h     |  5 +-
> >  .../staging/media/atomisp/pci/atomisp_ioctl.c | 49 ++++++++++++++++---
> >  2 files changed, 44 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
> > index 3c8fa3f58..fcf116cc4 100644
> > --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> > +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> > @@ -741,10 +741,7 @@ enum atomisp_burst_capture_options {
> >       _IOW('v', BASE_VIDIOC_PRIVATE + 15, struct atomisp_ctc_table)
> >
> >  /* white balance Correction */
> > -#define ATOMISP_IOC_G_ISP_WHITE_BALANCE \
> > -     _IOR('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
> > -#define ATOMISP_IOC_S_ISP_WHITE_BALANCE \
> > -     _IOW('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
> > +
> >
> >  /* fpn table loading */
> >  #define ATOMISP_IOC_S_ISP_FPN_TABLE \
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > index bb8b2f221..5c0a1d92b 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > @@ -1083,6 +1083,38 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
> >   * applications initialize the id and value fields of a struct v4l2_control
> >   * and call this ioctl.
> >   */
> > +static int atomisp_v4l2_set_wb(struct atomisp_sub_device *asd, int id,
> > +                            int value)
> > +{
> > +     struct atomisp_device *isp = asd->isp;
> > +     struct atomisp_wb_config config;
> > +     int ret;
> > +
> > +     if (atomisp_css_get_wb_config(asd, &config)) {
>
> I'm not sure this makes sense. How will the caller know the value of
> integer_bits?
>
> I'd think the IOCTL interface of this driver should probably be largely
> removed, to be replaced by the parameter buffer.
>
> > +             dev_err(isp->dev, "%s: can't get wb config\n", __func__);
> > +             return -EINVAL;
> > +     }
> > +
> > +     switch (id) {
> > +     case V4L2_CID_BLUE_BALANCE:
> > +             config.b = value << (16 - 8 - config.integer_bits + 1);
> > +             break;
> > +     case V4L2_CID_RED_BALANCE:
> > +             config.r = value << (16 - 8 - config.integer_bits + 1);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret = atomisp_white_balance_param(asd, 1, &config);
> > +     if (ret) {
> > +             dev_err(isp->dev, "%s: set wb config failed\n", __func__);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int atomisp_s_ctrl(struct file *file, void *fh,
> >                         struct v4l2_control *control)
> >  {
> > @@ -1122,6 +1154,17 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
> >       case V4L2_CID_ATOMISP_LOW_LIGHT:
> >               ret = atomisp_low_light(asd, 1, &control->value);
> >               break;
> > +     case V4L2_CID_AUTO_WHITE_BALANCE:
> > +             /*
> > +              * TODO: Auto White Balance is not supported yet.
> > +              * It is currently handled by the ISP.
> > +              */
> > +             ret = 0;
> > +             break;
> > +     case V4L2_CID_RED_BALANCE:
> > +     case V4L2_CID_BLUE_BALANCE:
> > +             ret = atomisp_v4l2_set_wb(asd, control->id, control->value);
> > +             break;
> >       default:
> >               ret = -EINVAL;
> >               break;
> > @@ -1484,13 +1527,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
> >               err = atomisp_ctc(asd, 1, arg);
> >               break;
> >
> > -     case ATOMISP_IOC_G_ISP_WHITE_BALANCE:
> > -             err = atomisp_white_balance_param(asd, 0, arg);
> > -             break;
> >
> > -     case ATOMISP_IOC_S_ISP_WHITE_BALANCE:
> > -             err = atomisp_white_balance_param(asd, 1, arg);
> > -             break;
> >
> >       case ATOMISP_IOC_G_3A_CONFIG:
> >               err = atomisp_3a_config_param(asd, 0, arg);
>
> --
> Regards,
>
> Sakari Ailus

