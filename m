Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17EE11A0809
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 09:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgDGHOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 03:14:51 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39564 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgDGHOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 03:14:51 -0400
Received: by mail-ot1-f67.google.com with SMTP id x11so2066369otp.6;
        Tue, 07 Apr 2020 00:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=typsr3wEdNlbUeLKEggpVDc0YOFAtc47SBh8Ew95xi4=;
        b=Q5lHcS29o4e9LERfijlPzz7+7O9Za8CfvWgVmCZtSCcX64Ckc2RHjMvSeGG6ZTX5Np
         Ecg4C/Ea/kOYoBVeO5Ltj0m7qyIe8CKFE4o+EtisAcu4zpHTyCvPRG0e9BxSfIo+L/dD
         RRT4zxwMXLWCty6Ix3ec6y+0PEdmpK16gjhgwVJPqwn6fHFkGscosq4AoOZsJYxddrNT
         vBfvB+t8o4HJNjO32wRDqYn3dFqJj1jSttGNstb+Yk8wMz8ATYdN0ZhfBb04QZbG4O6p
         LTcB/cDgEPMvcr7K1OFX5+FiUkDfyZwzxk6hm2AsTPVjvWdpCoyovWMW9GIsaLZ+JSbS
         16Iw==
X-Gm-Message-State: AGi0PuYiPZWRHJfk98e1qxks/ZQwzK1YbD+QquyLBy+UgwtCLUYtW0Ur
        +TMVrmwTiFiqIIdYYwqN1rl4MEhC8nlelrCvv2E=
X-Google-Smtp-Source: APiQypLNpFiVt+EkSl4PFABBXpJ6C7L4TK5flYMX14YDwG9munavkG7n485hXL7JxNWZE579I3mjDh3bmWPFBIxKs8Y=
X-Received: by 2002:a4a:e495:: with SMTP id s21mr758568oov.79.1586243690327;
 Tue, 07 Apr 2020 00:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1586191361-16598-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Apr 2020 09:14:39 +0200
Message-ID: <CAMuHMdVGKnPfVAHiqJiK=YxuT5VnyvHdf6Zm8C=X-vh=Mzo-+g@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] media: dt-bindings: media: i2c: Deprecate usage of
 the clock-frequency property
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 6, 2020 at 6:43 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> OV5645 sensor supports input clock frequency ranging from 6MHz to 27MHz
> but the driver strictly expects this to be 24MHz (with tolerance of 1%)
> with this restrictions let the driver enforce the clock frequency
> internally to 24MHz rather then being passed as dt-property.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
