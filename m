Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33BB419981C
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 16:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgCaOGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 10:06:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37159 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730442AbgCaOGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 10:06:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id j19so2825425wmi.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2020 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z3XexJv6oSGOBsuJdYGw0E9ezFWfwIVY6vR9BpSIAKs=;
        b=bH2m3npkP38cXjAjbJ39QJWCZcMDmpREl1nbqVRN4bp18ggblzW+6cqN9ymPzcN0Tr
         w+uChqD7APbXpu/EnYuspjNk7doTbcKa4Qoac4jJjaw9/EJuVNVu9wk0BINc16LoJ6zR
         eWQ7xo+zfaJv6jlh/dwkVPDU3F/95qnL2u6rm4xT2eYXNDWyycKEO+KB2jxTyaeMLq9k
         KeTgm8h+u0xEGfSf/GlB9BQGpHEYqceVEbm0LTwgwBGoIeTmzixwwGOtchjcIrqCWNgh
         9r2ylYQbU95MiHbI3PJieM3hOMuG/5lvQy/jSLV3IlZKD7uW/peokaOQAwENq13azaiM
         D6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z3XexJv6oSGOBsuJdYGw0E9ezFWfwIVY6vR9BpSIAKs=;
        b=L3LENr23LvJGV8baA9MwcYwkm0rc3V4bb8PA9Odhc5gpAJsiKtE61WnavF6JOPVTT6
         1sBEOn1rCzUJfyyr3AQ1foEO0mEyDo6VxxGaJkWpgQH7Qvq0fwFIrj0Jcc6prpejBxyb
         IlPBPI8i7EvDlsxAWAg1SpXHtZncL7B8hVxtaTZpY5vAbHnS4Tj0ZvT3M7xStFbkg8RQ
         paJsA7YQLVA4FedXzw/qODGWR1k2+Akx5Q/mQ3Xn5SOpKo0URQOpGfEfWPN1xwupLcbf
         IucOk1iejJnrrmPHKRvSZcZZ9WAVPt9kBh/wackU/zqvqHLP/h4b2gWVHWNW2+V1eQgE
         3PrQ==
X-Gm-Message-State: ANhLgQ0aZrlcqdEFElmmcGF/Phz4dW0PdXhlwDz5s9LCgpEMM6xgde40
        klQ5y89Z0jCPvLQTUBIuoMSTLO1eX99KeZg7H+WkUA==
X-Google-Smtp-Source: ADFU+vsckxJPWgtqo6cMLlt9ekzuTf/KDmsXOFGh6LSmkq/Fj017nPMi6FCTOVECu9MCDvqHfQWTruomqSjqVAud20s=
X-Received: by 2002:a1c:f213:: with SMTP id s19mr3628190wmc.116.1585663576893;
 Tue, 31 Mar 2020 07:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
 <20190916115207.GO843@valkosipuli.retiisi.org.uk> <2c0da850-7073-0fc6-7246-9e530a54cf26@xs4all.nl>
 <CAPY8ntCOAeq1OLS4dn846ubujnbUxSwMu-Tfb9fcNgaDcn3_JQ@mail.gmail.com>
 <CAPY8ntCL+j=hia=WHJnpcGosD7hTxR2-aJWYrY+E3qpT-+g=0Q@mail.gmail.com> <20200331102742.GH2394@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200331102742.GH2394@valkosipuli.retiisi.org.uk>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 31 Mar 2020 15:05:59 +0100
Message-ID: <CAPY8ntAfgZQpjVpV4G13sBiGPX1eQ9pMZ7=6vvq32SMkTXOYDA@mail.gmail.com>
Subject: Re: [PATCHv2 0/2] Add helper functions to print a fourcc
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, 31 Mar 2020 at 11:28, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Dave,
>
> On Wed, Mar 25, 2020 at 01:50:44PM +0000, Dave Stevenson wrote:
> > On Wed, 29 Jan 2020 at 11:52, Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Hans.
> > >
> > > On Mon, 16 Sep 2019 at 13:00, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > > >
> > > > On 9/16/19 1:52 PM, Sakari Ailus wrote:
> > > > > On Mon, Sep 16, 2019 at 12:04:31PM +0200, Hans Verkuil wrote:
> > > > >> It turns out that Sakari posted a newer patch in 2018. I used that
> > > > >> for this v2: https://patchwork.linuxtv.org/patch/48372/
> > > > >>
> > > > >> Mauro commented on that original patch that there was no need to
> > > > >> have this available for userspace.
> > > > >>
> > > > >> I disagree: why wouldn't userspace want to report pixelformats?
> > > > >>
> > > > >> It happens in several places in v4l-utils, and there the pixelformats are
> > > > >> printed in different ways as well. Providing a standard way of reporting
> > > > >> a V4L2 fourcc is very useful.
> > > > >
> > > > > Thanks, Hans!
> > > > >
> > > > > Can you take these to your tree (perhaps pending some sort of agreement
> > > > > with Mauro)?
> > > > >
> > > >
> > > > Certainly.
> > > >
> > > >         Hans
> > >
> > > What happened to these? Patchwork is flagging them as rejected[1], but
> > > there's only been positive responses to them on the mailing list.
> >
> > Ping. Why were these patches rejected?
>
> This was discussed on media-maint channel. The log is here:
>
> <URL:https://linuxtv.org/irc/irclogger_log/media-maint?date=2020-02-06,Thu&raw=on>

Thanks, it's useful to know what's going on. The patchwork information
was pretty opaque.

The log includes
[12:41] <sailus> If you insist, I can write a patch, and put your
Suggested-by: tag there. :^)
[12:41] <mchehab> yeah, please do so
[12:42] <mchehab> the best is to also c/c drm ML
Has that happened and I've missed it, or is it still on the pending queue?

  Dave
