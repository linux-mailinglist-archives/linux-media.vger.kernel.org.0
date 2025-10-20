Return-Path: <linux-media+bounces-45071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B1BF3078
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5C7F4E6F21
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306AA2D3732;
	Mon, 20 Oct 2025 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Risz08Qm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4A27C178
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986321; cv=none; b=daU6VYZndl7795OL+vr90WtM+Dg5nyYmrDb5bB/cuZknnRDkFxZjo98ZRus9wxmwOtaK0and/7Aew8uilH5LNJIvyeAJL4TDylGcdWingOdOD4BxD3rrrbmQbi43oe+lPcHOW2+jeZWNzAkEcpyERu1wBkJygtqm7EePsiWyLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986321; c=relaxed/simple;
	bh=IqvCnelSxJkZ3FZoKv+UdqDDRNDrFbzl2IUoRPXpICo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJFMZA6+CKGjydvoC07kT/HIuMMs55kfowzRvM0/tTmFXBqaapud+Kbe38fNnOJfvy/huHIxwZLOZUDd9ud0tobK6acvfMVqUEpEopSBPC3fkHkYL9mz1fL0ipqBvu9G4o+cIm0QBQluQ2aKOc4i+S1VC52YgCQqIWX8VTJ8k1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Risz08Qm; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-373a1ab2081so50972521fa.3
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 11:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760986318; x=1761591118; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PUwxNAg14u0+d4M/vTfLxJmPb5hOiJO8HR++elBBlcA=;
        b=Risz08QmoC+2w9KzYnF49LZx1HVtfq6S1rKPLqxnXpPjB+ANfUxAEBP4rK8K2A3jGj
         uIpKrwaQ6PY4jVFx/eBofGMf6nR23ccNZUXDznwFZADMBzbhBOYi0c7B5TBr8gvCRQYt
         XhckuC7/wWDJy2Fuou/bFwSR14q1X2WJk8tA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760986318; x=1761591118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUwxNAg14u0+d4M/vTfLxJmPb5hOiJO8HR++elBBlcA=;
        b=eQw7V9QQzS7UQykdI/Y7mUVYBolVMUEml/I9d/uWjm9u/S15JlexBBtCS7TTUkVW22
         mxvQiEh+jBcvWyFP/jkSaeACCSZiEXiVMz8Q7ObQ0xl4/gvAq3MYYF7vuwQbmFBojtRw
         suu8YsrFyAKfPfn6J8DwlWVY37ldqh+i8qog7kYfaVgv/xVoJpug6FLq6a5g6luWRYVV
         XvcO6wLdFld8wVLcTOzaxEaNiWRxx4uuxJ02LDjqTTfDv9xkzk0v6nZywqoYFqB/DdzE
         KKXh+HJF3QzL3nbrDf8SjDmAvnUKTC2PTP1zqOuX0f61jJPk49pA2QcDebzY0rUGPGLz
         tI8A==
X-Forwarded-Encrypted: i=1; AJvYcCVizsYQONBbjG7l8emdFT+2BV/qJfp4jiekfIx3QXgggBjEy8j5HpUURfqN8McVD6jckTsNiLT0xPk35Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2YIYKw9rm8Vy8rPvFgp0ZCh0CklvjVZBMpkY5ff+XTNfrvNWo
	EceUyYZM0SYgOIZe9FCIF74tJNNDqXfXWMTnzJVLFiVbHHF/6fmO7TeAPx9nLpdSuKxi6O1LH8v
	AGao=
X-Gm-Gg: ASbGncu3wNkr3oR4EEHmz4mTNNyorDcInOBnt2+j2hoxNeY26SRuNC8qme2BNj9XsQ6
	ZldNHobBF6RQbN7tuS03ivQvxVX6X3vM52cylPwIuarMgPmGAB/UlVqJqO4edNHqfUUpHRWcqDR
	ahMMkVwuZjmV1XCiCYVAcLMWJaVIk1ugNHXIHLXw5sB0DFjVByemt1cF1V8n1DXDmarLXGLrLXl
	dGoc1zA89JRI1l1bNDceaypJiAorV5cgnsMTx0ptU3aa9ScKBF67QJIH+BL6WlJE0ykd4/BBKJy
	YFR9sKdvfSOQ1yUl4kBRPSRI+GmaTXhuEsLKRl+xzXcT7Mp9Wex6NDs/po2mhOpY0qKnpqJ9H4W
	TFysAB7axanzuPA+YYiFC/HTMVgaE7QC+bYbPvPNcNIac216NAAV9kRS2nUp6lNZdtnXJ/r/u84
	/h6X8jrcZJFTyFmNDtTLUaOPicKSrZyRMQpDIbQJcefmaQhIQA
X-Google-Smtp-Source: AGHT+IHEKh1Amln+JeKgUcliRfnKi810cAFbcpG9pqlUkyp7sM3PwH/JH8UTkj9watZPJiFwOaHG2w==
X-Received: by 2002:a2e:bc08:0:b0:375:f4f9:374 with SMTP id 38308e7fff4ca-3779793eae2mr38124071fa.20.1760986317156;
        Mon, 20 Oct 2025 11:51:57 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b7086sm23933251fa.12.2025.10.20.11.51.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:51:56 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57dfd0b6cd7so5249475e87.0
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 11:51:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsrS+nVoHU6LOwRQU/XkJbposzH88qvjlIXL3tdCViQOVTF0oSDlgskujfACsYAyiCGbdZhlzkGvpb5g==@vger.kernel.org
X-Received: by 2002:a05:6512:220d:b0:580:e43b:a3b9 with SMTP id
 2adb3069b0e04-591d84ef312mr4174471e87.18.1760986316207; Mon, 20 Oct 2025
 11:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org> <aPZ_YRwpDNPFjePX@valkosipuli.retiisi.eu>
In-Reply-To: <aPZ_YRwpDNPFjePX@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Oct 2025 20:51:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCt+E+Ogr9+Y4_4KA_vBOYyTNZgwZVBD2wLMJirQE+PS3Q@mail.gmail.com>
X-Gm-Features: AS18NWDzuooWZHwBfH9iSr_NmZr-D0n7LnAdP7iuY3iImxgNDipq145jR_7N1GU
Message-ID: <CANiDSCt+E+Ogr9+Y4_4KA_vBOYyTNZgwZVBD2wLMJirQE+PS3Q@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: imx214: Exit early on control init errors
To: Sakari Ailus <sakari.ailus@iki.fi>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Mon, 20 Oct 2025 at 20:28, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Tue, Oct 14, 2025 at 11:00:17AM +0000, Ricardo Ribalda wrote:
> > Now we try to initialize all the controls and at the very end check
> > ctrl_hdlr->error to check if one of them has failed.
> >
> > This confuses smatch, who do not know how to track the state of
> > imx214->link_freq.
> >
> > drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> >
> > Fix this by exiting early on control initialization errors.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Right now we are handling this with a quirk in media-ci, if Dan cannot
> > fix smatch in a kernel cycle we should merge this patch.
> > ---
> > Changes in v2:
> > - Fix typo in commit message commit
> > - Move error tag where it belongs (Thanks Hans!)
> > - Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org
> > ---
> >  drivers/media/i2c/imx214.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..c66f0e18726c3fc15df91c37888a797bcea82134 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *imx214)
> >                                                  V4L2_CID_LINK_FREQ,
> >                                                  imx214->bus_cfg.nr_of_link_frequencies - 1,
> >                                                  0, imx214->bus_cfg.link_frequencies);
> > -     if (imx214->link_freq)
> > -             imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +     if (!imx214->link_freq)
> > +             goto err_init_ctrl;
> > +
> > +     imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> You could do this cleaner by simply moving the assignment after the handler
> error check. Some drivers do that already.
>
> I wonder why this seems to be a problem for smatch in the imx214 driver as
> the pattern is widely used across the sensor drivers.

Smatch thinks that there could be case where

imx->link_freq = NULL, and imx214_pll_update returns 0.

That is not solved by moving the assignment `imx214->link_freq->flags
|=` after if (ret)

I believe Dan is already flagged about this, but I do not think that
it will be super simple to fix in his code.

If smatch can handle this case before rc5 I will delete this patch.

Regards!


>
> >
> >       /*
> >        * WARNING!
> > @@ -1099,6 +1101,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
> >
> >       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
> >
> > +err_init_ctrl:
> >       ret = ctrl_hdlr->error;
> >       if (ret) {
> >               v4l2_ctrl_handler_free(ctrl_hdlr);
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

