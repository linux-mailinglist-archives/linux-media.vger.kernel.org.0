Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02AEE175457
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 08:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgCBHTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 02:19:06 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42265 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgCBHTG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 02:19:06 -0500
Received: by mail-oi1-f195.google.com with SMTP id l12so9313472oil.9;
        Sun, 01 Mar 2020 23:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pCiMbDoks/6zcnPq60yjRnfndV8SA+UORO6ejiuKYFI=;
        b=VaRCakMktqQndfftu+QA+aIpP/MvxHJ6G2GE8VvnTKUPLc65ynuUU8nWteTQ+5/s42
         1C5ttGFj3/ss/c7V71bjRIjCXkn8ipP9IN1CnjsoqqWGVwBn9m3/Nk2klbMkLIyaXYGK
         EHWDcr752bxjinWLky93t4VamSEuhQ9XgZrLtWcxq4MHzCfNpCoCoM0P9XBaPd9cVmoW
         Qi0uwSYrf9SqL3oKvVNoVewmKNnqMSw8Dd4riPfQifi9HRc1yRvaxheEkPmGeXtez/q0
         sax9BArSKYz+V72D5Wiq4r7f49nrplpCqWXp+NMnevvAXbKGbISc8BEP1xF0mdt4nwr0
         FPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pCiMbDoks/6zcnPq60yjRnfndV8SA+UORO6ejiuKYFI=;
        b=lLeOIwAG/xMhS5EWVgzCfTB/11L2USTcj3lFccYNFymRGuwNRd3722A+QeLzJbD5zS
         frmd4u8B6yXYwkqrrNfMyWqL6jnGFF7Z1rdK33SWQehf8drIJVocxVfTpBeMtznMqYVE
         La53hiZbttC8DxoViRSkiePH1gXOZiKpWv0ebgYjbVg9ZjMj5t4IveUqY3f1vyvukGJr
         +oCN4sQM7nsOr7s4UEHI6IfBBAvptw2yvv8hZTE3SdZE3JRv0BOcxFxL5O8B4mr2T9Ig
         XY/JsI3wR3i/ZYzOeqatsx7ZFODxT9HfHpFAZljxEPdSgWBzY2uLllA8rzJFrPJExm8P
         u+zw==
X-Gm-Message-State: ANhLgQ32L0PMGNvUfoLbtzSHkmxoMalSR+XEpLDcX4oYboZbzesoXWw+
        FB3Pu6IWB1deQUd15K0Vw2/PiXz6Dy60+bfqchE=
X-Google-Smtp-Source: ADFU+vuZhLGAOSIskS5UQ891cH1JVpFKxVkNbjzn8QCXQg0pyhZs0OILiw9px+nc7e25l94DOkVkyLsatuAx6Y13TFI=
X-Received: by 2002:aca:524a:: with SMTP id g71mr2564396oib.7.1583133544993;
 Sun, 01 Mar 2020 23:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20200228164126.17517-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAOMZO5AP65Upj8v=KaPLzS10DNdwrz20gJGbwbcJfCDqZBx71Q@mail.gmail.com>
In-Reply-To: <CAOMZO5AP65Upj8v=KaPLzS10DNdwrz20gJGbwbcJfCDqZBx71Q@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 2 Mar 2020 07:18:38 +0000
Message-ID: <CA+V-a8s_d3Atp9J5KM=x4z2z_iAY8+9vcSHFUTyQ3XZ9HCCS3g@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5645: Add virtual_channel module parameter
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

Thank you for the review.

On Fri, Feb 28, 2020 at 5:31 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Lad,
>
> On Fri, Feb 28, 2020 at 1:41 PM Lad Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > OV5645 can operate in virtual channel 0-3 in CSI2 interfaces, this patch
> > adds support for module parameter virtual_channel to select the required
> > channel. By default OV5645 operates in virtual channel 0.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index a6c17d15d754..0a0671164623 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -54,6 +54,7 @@
> >  #define OV5645_TIMING_TC_REG21         0x3821
> >  #define                OV5645_SENSOR_MIRROR            BIT(1)
> >  #define OV5645_MIPI_CTRL00             0x4800
> > +#define OV5645_REG_DEBUG_MODE          0x4814
> >  #define OV5645_PRE_ISP_TEST_SETTING_1  0x503d
> >  #define                OV5645_TEST_PATTERN_MASK        0x3
> >  #define                OV5645_SET_TEST_PATTERN(x)      ((x) & OV5645_TEST_PATTERN_MASK)
> > @@ -61,6 +62,11 @@
> >  #define OV5645_SDE_SAT_U               0x5583
> >  #define OV5645_SDE_SAT_V               0x5584
> >
> > +static u8 virtual_channel;
> > +module_param(virtual_channel, byte, 0644);
> > +MODULE_PARM_DESC(virtual_channel,
> > +                "MIPI CSI-2 virtual channel (0..3), default 0");
>
> Should this be a device tree property instead?
I did give a thought about it, but making this as DT property would
make it more stiff.

Cheers,
--Prabhakar
