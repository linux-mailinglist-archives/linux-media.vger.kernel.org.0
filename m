Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5E518F0EC
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 09:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgCWIe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 04:34:57 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41115 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727534AbgCWIe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 04:34:57 -0400
Received: by mail-oi1-f196.google.com with SMTP id k9so1322911oia.8;
        Mon, 23 Mar 2020 01:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6PqEEQ80DvoEIUlujlGHoymIvmSuRLgWhhvk0/wVc9U=;
        b=aIkV352swb5lUdLfE4DlY/u1mEAhBepbtjttLqu8QPFL7v2x5km1LeF9bVBnvVLVS2
         gZatKMeYoaeK43Uj6UDRoprvdCUILtwSG8IALVeiY5NLArOn+pbq2Txu8IlQaLZAO2Rm
         FprPw7x0gGEk/5kS7PLLpx6p9e234cpMW5SIqdgwZMTXQZYyvzIjBp7ZY267NVi/gFen
         eKE1rU7wiSTHU9IJ2L/b3SSTytUQRssSKOc9nnNVZJyhr55omi7TQ5GDU6C10LyVmZUC
         ibV+IiKiHN0ZoySFmKCphMA4+Y/+OXag69uLGDH2g4TP6I6Z112t8GmOqv+1dKPfef2i
         NLOA==
X-Gm-Message-State: ANhLgQ2+ce5eXRiU4vU86tJSB++5MP4W5kV3IuvU2j9vgoXF6gWDQTS+
        vsXdXEA1mBH2L66wrb3JKbSiSaM6gBqso5Lp/p4=
X-Google-Smtp-Source: ADFU+vtY9GYxLCB1Ry2pKNcB44pAPmk/CCZTkuaKMIA2BZ5TH88WwWbUY1YsGf79Bx/MGoRkKWf+XqxnWo2dCQFID3U=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr15444401oig.153.1584952496397;
 Mon, 23 Mar 2020 01:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584720678.git.alexander.riesen@cetitec.com> <077a97942890b79fef2b271e889055fc07c74939.1584720678.git.alexander.riesen@cetitec.com>
In-Reply-To: <077a97942890b79fef2b271e889055fc07c74939.1584720678.git.alexander.riesen@cetitec.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Mar 2020 09:34:45 +0100
Message-ID: <CAMuHMdXiG1upHQrCcuZgNLFOEoeDVcb0zWxh1BZZST5TOURDBQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
> As all known variants of the Salvator board have the HDMI decoder
> chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> endpoint and the connection definitions are placed in the common board
> file.
> For the same reason, the CLK_C clock line and I2C configuration (similar
> to the ak4613, on the same interface) are added into the common file.
>
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Did I provide a Reviewed-by?

> The driver provides only MCLK clock, not the SCLK and LRCLK,
> which are part of the I2S protocol.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Perhaps you mixed it up with Laurent's?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
