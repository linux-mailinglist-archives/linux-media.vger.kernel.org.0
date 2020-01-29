Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC84814C9ED
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 12:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgA2Lw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 06:52:59 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38252 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgA2Lw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 06:52:59 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so19839327wrh.5
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2020 03:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6KzueQP2DpIWEZuPuIZtE6qNFOkAKNKomjBXz6Gbm0=;
        b=KUJEKJYr/mlfHwu1zk74/GheDNIHUkgqRdFl3BgygZmUEqTc/P106C4DDlj6zoozC+
         aAvvJrma5YGvyPHdF23eWr+8h7i78nA1DI+WZbYQCYkdt/QBz4JiJICvUmtti5c36MT4
         IUj8Mlp7pCrHmRE0JCxI/BHOYUROb8NxjWPwHgn6HyHX9AAc7k4GSRJ5pr+TRHAOHFcV
         ue0cIDfy2i/3VkzpPeh8Fq7+NPX4fY/LafredCNL5G1uInwHbj/cB+cDtcMHU7NYQrSr
         mSaQZKguWkEhC4cQdFKYrAHZfZEwItaKk0gqaVtx4hg5uNKXIA2XrAuI7J+2lvdKjDtK
         QaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6KzueQP2DpIWEZuPuIZtE6qNFOkAKNKomjBXz6Gbm0=;
        b=eigSkWXgbw8MsKMEvxfoMEtD/OveyiDW5YENdaDgjEnzmi2fhSOkRBaEsKgPgE3Tgf
         11nwkNjk4ByyB4hgBJOl7ONLELDHFTzlbme19Udi7lPXQLCInkI584Tfw95ureFMPkaV
         4KJAg24zFM7jKP57zoiRG9NhZBm9w/Uhc9OPUYZ2BPSp3IlAMY8Vnj8UXHDZSRazY1jq
         RbuXaJdKPJKImi9TNCatxOvbJdC59VWytt97lAeb3BHsRxCay710QYOlEGAT9GLk0RNf
         iZUqW0zFCIKVHccsCAViwbWTupm7zRo6ShGsKwaBfn/8nLTqyut0LM+CbSTvqLbhb+yR
         nRnw==
X-Gm-Message-State: APjAAAVJQGiPsAsdQgJzl2RDzr3grRcoJkAVZ51JfF9HmOUI20vknfnX
        F7PMJLPwbd/NkY/wXUKgIZb8oaaPBCGovuVGilO9Yg==
X-Google-Smtp-Source: APXvYqx6UiIOjlxSpmopeSYdNAlmnfrmbzyydEGq6Jz+dJxxqfaPyDq12Sy2ZBeqhehjqKmQoeUUKuuUYMp79O6/wjw=
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr36709308wru.150.1580298777649;
 Wed, 29 Jan 2020 03:52:57 -0800 (PST)
MIME-Version: 1.0
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
 <20190916115207.GO843@valkosipuli.retiisi.org.uk> <2c0da850-7073-0fc6-7246-9e530a54cf26@xs4all.nl>
In-Reply-To: <2c0da850-7073-0fc6-7246-9e530a54cf26@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 29 Jan 2020 11:52:40 +0000
Message-ID: <CAPY8ntCOAeq1OLS4dn846ubujnbUxSwMu-Tfb9fcNgaDcn3_JQ@mail.gmail.com>
Subject: Re: [PATCHv2 0/2] Add helper functions to print a fourcc
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans.

On Mon, 16 Sep 2019 at 13:00, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 9/16/19 1:52 PM, Sakari Ailus wrote:
> > On Mon, Sep 16, 2019 at 12:04:31PM +0200, Hans Verkuil wrote:
> >> It turns out that Sakari posted a newer patch in 2018. I used that
> >> for this v2: https://patchwork.linuxtv.org/patch/48372/
> >>
> >> Mauro commented on that original patch that there was no need to
> >> have this available for userspace.
> >>
> >> I disagree: why wouldn't userspace want to report pixelformats?
> >>
> >> It happens in several places in v4l-utils, and there the pixelformats are
> >> printed in different ways as well. Providing a standard way of reporting
> >> a V4L2 fourcc is very useful.
> >
> > Thanks, Hans!
> >
> > Can you take these to your tree (perhaps pending some sort of agreement
> > with Mauro)?
> >
>
> Certainly.
>
>         Hans

What happened to these? Patchwork is flagging them as rejected[1], but
there's only been positive responses to them on the mailing list.

Thanks.
  Dave

[1] https://patchwork.linuxtv.org/patch/58781/ and
https://patchwork.linuxtv.org/patch/58780/
