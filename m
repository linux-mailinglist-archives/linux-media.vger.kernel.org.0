Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA1C4235C6
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 04:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237159AbhJFCZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 22:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhJFCZm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 22:25:42 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1906C061749;
        Tue,  5 Oct 2021 19:23:50 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id g10so1297833vsb.8;
        Tue, 05 Oct 2021 19:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WwmHQgUBgnVFhJP2TLRGoapFl3aOWOVk6xMbmdmYBZg=;
        b=GOc7dwi8lOh1lC6U5VsgxVQcF6lKVrF5WsAzGmomX36eBy3tlkaRBdKq4x+l6MwlU5
         J1Uob5g3VFdq+6OCqToVaprDxqCdabVj6JsoLv6fLedkdI/Ep+lgNeJVNwKD/lMuiH9z
         rYSp688Q8QKNXJF1U0ab631Y7MXAqD8SkcIqseATHEIlQDuCWuIqvZcOBEKdC2MFivhd
         OW7CIJMrVB0EHQncn+ZiFtHtUntykBIYatjFwxudD6oJCjVcVMNRtcfCjT4zyoh62X9x
         If4NRyb9Kuf4nofVdpWr2wUWxyZ4HMevfHjPGE1+r3992VUSB4rRZfK2tzmTYHLwKnDb
         vazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WwmHQgUBgnVFhJP2TLRGoapFl3aOWOVk6xMbmdmYBZg=;
        b=TTb3Steq8Gaq5+GgwGOyOi1zPET+y2aX5CuXD3Xky/3r5pQdYGNA1mtGj5z9+YzZPP
         w1WNium5HUu+qYITCGO7DZ0PNPaaITZx1OAl06BEw6Kh9RwNnd4bPVB89lItQmBFxpVe
         UIacVG/TdILX3a1sUOhX7u7EzqbjFa4ipqHmabxFyUntUFifop7Rl2rjLm3eYchnACcf
         j6lua+dnyZqLhXyd/C6Q+P7LlBfiAKWZNbmj39qOT0p8rhztPo9ZWUZ5wuwe/R3KImnh
         E92oPBj9Nar/Ek5NDU8+pe1A66+O0Po8NZ0rpDuy7Ht2KYE1dxuKnzPVK2S9c5MZp3Yf
         FPNw==
X-Gm-Message-State: AOAM530yG3SgFGKUXyTaW5yD7GGfWHDWADUiFerL9/zt8fFSvtBaa0nC
        bvRSrcrCCQt0b7qHeufHFxVva1YHTQ8HIQ3qR6U=
X-Google-Smtp-Source: ABdhPJwcONDskG/EsRXuJWW7n2sfuq/f3H3TUfGpNb7vycf8BKF3z24Ow7AU8AqZm/bdzE/StOvMydXYy2kEZZFCVH8=
X-Received: by 2002:a67:e0de:: with SMTP id m30mr6440548vsl.51.1633487029583;
 Tue, 05 Oct 2021 19:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <m3lf39nfsq.fsf@t19.piap.pl> <CAGETcx_N7XYkzFPSuQdvWKk1o+Pzzg4HnzChE_4c_Bg_oOK3eA@mail.gmail.com>
In-Reply-To: <CAGETcx_N7XYkzFPSuQdvWKk1o+Pzzg4HnzChE_4c_Bg_oOK3eA@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Oct 2021 23:23:38 -0300
Message-ID: <CAOMZO5DwcXUe5j97n4Q_RF9WRo2DYoToe7FLNbpDJhn_BxuH0w@mail.gmail.com>
Subject: Re: v5.15-rcX regression: video devices on i.MX6 are not created
To:     Saravana Kannan <saravanak@google.com>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Tue, Oct 5, 2021 at 9:10 PM Saravana Kannan <saravanak@google.com> wrote=
:
>
> On Mon, Oct 4, 2021 at 5:19 AM Krzysztof Ha=C5=82asa <khalasa@piap.pl> wr=
ote:
> >
> > Hi Saravana et al.,
> >
> > FYI the patch: 6b2117ad65f1bca9ece6d4b1ee784b42701a2d86
> >
> > of: property: fw_devlink: Add support for "resets" and "pwms"
> >
> > Allows better tracking of dependencies between devices.
> >
> >  drivers/of/property.c | 4 ++++
> >
> > breaks v4l2 video devices on an i.MX6 CPU. The /dev/video* nodes are no=
t
> > created, and the drivers (async subdevicess) are "waiting":

Phillip has sent a fix for this issue:
http://lists.infradead.org/pipermail/linux-arm-kernel/2021-October/687868.h=
tml
