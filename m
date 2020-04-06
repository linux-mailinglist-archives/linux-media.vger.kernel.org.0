Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7025719FB15
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 19:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbgDFRMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 13:12:15 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38991 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgDFRMP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 13:12:15 -0400
Received: by mail-oi1-f194.google.com with SMTP id d63so13741086oig.6;
        Mon, 06 Apr 2020 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zPvT9nYNJKIlI18d6CVFeb9HSS66c5aP1HzV/cwJ2iA=;
        b=YFFDLodFgLBNXipDdFrKkNe5KdfTMuCuUWZy9SOzDynX4/zoxOV+WL+e0NBF5wHS7m
         K2xlX4c+mLFB9R0QcvfqTnPOmVGKFzWOkG0iWwmF5LCzw0E9UWVqly7Dk1SprNmYgm+h
         JHYWexqjTq7egHo0iQyTN6kM6LF95CTs376RuckrF25VCJ2Z1rqm1kddE2D/SyXjf2bG
         DokPYV1pM8Hf5N2wOszDExe9/Qod7xhRTogKLDusnPpPe3+MMRPS2qVMiHqhYwcbAfjI
         kK+ER38azeo+YgVLCUzXCojrerc6K8VZ5veCSkvCLyJ+ADzkhjmedRaVE1hz86ekYpsN
         PL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zPvT9nYNJKIlI18d6CVFeb9HSS66c5aP1HzV/cwJ2iA=;
        b=XHD/EQtuB6l1mpYAoLchMhtGrfN9jIs3gafm9TLjdWPF6cCTMSQmG+z46LF0gtmOhW
         RfghgGXw7WCS//wWwOUqNXIc+6HBmyPJztXItLjDn8d9CvbU9/p81rIc0pnw682D7RiP
         7yQeNU6A8lDFxZoCiekRLbPdcHJuAEzuNBKV7bJJEzXR4+thE5JlkmyFNj7VfFj34lTx
         OYCrrMO14xpW7Cw4PTlBJrSvqOwOhxjgfZ0FU0KOPUeSlSvB1lIFeJSW+OWd9s+ksie5
         tSReErlLEAKy7yTK0Vh3Tvxd21rQKS8T7Y16uMljJXlsh+cgjqp2Mg4/jQPGvgm/iHmY
         3LmQ==
X-Gm-Message-State: AGi0PubxSB14wqRKoZ2JMmy0VBcWcLByswcubi3jZL/bMdBQ405bsYj1
        iqcTX+8SjRfrOYtZADp962x1nQC4Pz84bU5YM8c=
X-Google-Smtp-Source: APiQypKEN2WUc7C67Si85BMK8Rs/ssPmf30vW/UZKNuRyXpHzIcqTCLUJHaY3Of9rWarp68OvvmFfK4r3rsGvhQ8uHk=
X-Received: by 2002:aca:5d83:: with SMTP id r125mr304838oib.8.1586193134784;
 Mon, 06 Apr 2020 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200406165108.GA7646@kekkonen.localdomain>
In-Reply-To: <20200406165108.GA7646@kekkonen.localdomain>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 6 Apr 2020 18:11:48 +0100
Message-ID: <CA+V-a8vxjJ4Fr2CAtRAnZCgmvoR+3m26DdAKPMOkSMYELDgZ0A@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: i2c: ov5645: Drop reading clock-frequency dt-property
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,


On Mon, Apr 6, 2020 at 5:51 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> On Mon, Apr 06, 2020 at 05:42:38PM +0100, Lad Prabhakar wrote:
> > Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> > as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> > 24MHz. So instead making clock-frequency as dt-property just let the
> > driver enforce the required clock frequency.
>
> Even if some current systems where the driver is used are using 24 MHz
> clock, that doesn't mean there wouldn't be systems using another frequency
> that the driver does not support right now.
>
> The driver really should not set the frequency unless it gets it from DT,
> but I think the preferred means is to use assigned-clock-rates instead, and
> not to involve the driver with setting the frequency.
>
> Otherwise we'll make it impossible to support other frequencies, at least
> without more or less random defaults.
>
Ouch! my previous version of patches switched the driver for using
assigned-clock-rates but I was asked to
not do so [1].

[1] https://patchwork.linuxtv.org/patch/62185/

Cheers,
--Prabhakar

> --
> Kind regards,
>
> Sakari Ailus
