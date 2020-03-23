Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1CD918F12A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 09:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCWIsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 04:48:14 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34059 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWIsO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 04:48:14 -0400
Received: by mail-oi1-f195.google.com with SMTP id e9so5600466oii.1;
        Mon, 23 Mar 2020 01:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=RJbFP927PDfm1sY4PttJqfX0fNR527qKJB6QODPMhuM=;
        b=N0k/RR4b4hy+0BP8D/6cuXG4Y22AYMW1oQ7BtRVQ1IbGOSlsFlIg9YLV/EflUtuxbS
         Itzfi5oXLbZPb7V0i6am/4b3YZWxhyr91BX5cIncRrfMACiS0RkrjPDkH9rty037VOMS
         cvb/d3O2ApaOihA3csmCZdId4Q7A0ULI3q8CEdjXHIJemVixlUxiVv6Mk62IRCzv+lYM
         sZUJeDW//gGddfT5h3cEAirfk6RdPU+csrfb0u+4ZrgrEr6UALYj4K093CLZvRycXt5J
         W4XXG2FtmRcMQ0wNDDSKV4bvHJz22T1BZ4oDfih9SErjq5lJ47l8/197+cGo2TTTqL0R
         27DA==
X-Gm-Message-State: ANhLgQ1Gs2v0FvM8Hb0YOMbtF0p4DpAiXZUHiQRSnOtpA7lWbtupsDbQ
        uk27PyKdzPcl+SSgGD5/Adm+0TgO2anHEQXDm7I=
X-Google-Smtp-Source: ADFU+vtdVJgAXItyc43TbkLIUv4kwGAbgyIVQTZ8qz9en/UVDvhJtk0N+HUqX3ZKzF07nssZX6w6OMO51CAgLN5tYYU=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr15467580oig.153.1584953291595;
 Mon, 23 Mar 2020 01:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
 <077a97942890b79fef2b271e889055fc07c74939.1584720678.git.alexander.riesen@cetitec.com>
 <CAMuHMdXiG1upHQrCcuZgNLFOEoeDVcb0zWxh1BZZST5TOURDBQ@mail.gmail.com> <20200323084011.GC4298@pflmari>
In-Reply-To: <20200323084011.GC4298@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Mar 2020 09:48:00 +0100
Message-ID: <CAMuHMdXa96P+boX9HgGMBKEXLKK91t3Jgu-Sy8mP5A5--EeP=A@mail.gmail.com>
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

On Mon, Mar 23, 2020 at 9:41 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
> Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> > On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > As all known variants of the Salvator board have the HDMI decoder
> > > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > > endpoint and the connection definitions are placed in the common board
> > > file.
> > > For the same reason, the CLK_C clock line and I2C configuration (similar
> > > to the ak4613, on the same interface) are added into the common file.
> > >
> > > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Did I provide a Reviewed-by?
> >
> > > The driver provides only MCLK clock, not the SCLK and LRCLK,
> > > which are part of the I2S protocol.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Perhaps you mixed it up with Laurent's?
>
> Sorry. I actually did: he did provded Reviewed-by in his email, and you
> did not. I was ... a little overwhelmed.
>
> But you really did provide a lot of very useful information and it did help
> to improve the code. Shall I remove the tag still?

Please do so.

While I can point out issues in audio patches, my audio-foo is not strong
enough to provide an R-B, and I'll rely on the R-bs provided by others.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
