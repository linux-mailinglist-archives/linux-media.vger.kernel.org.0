Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC20B28FEDA
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 09:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394505AbgJPHGe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 16 Oct 2020 03:06:34 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39643 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394380AbgJPHGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 03:06:32 -0400
Received: by mail-oi1-f195.google.com with SMTP id c13so1343340oiy.6;
        Fri, 16 Oct 2020 00:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AN0mWnNE2D8BVilL5I+TRQ6mKE0ut/S1MGJ9A2gt2pc=;
        b=CJ2dv/FXuPqUwKgoMihdYWjJwwSDBAx+CBhPOfP8j+xbt2eaKweByHPCG89UkMH6tR
         6OIHs4u/2f8ROGp+sjDflCzX86vOvmLjIEfC+3Yq16FmZ2oDI3gbEy3P/pWEd/0ue9LX
         8ShblGI6ozpKqZhWJjzDbN55Fn8mCQe+tabJk21hl61WaofhwQCS/gpBrbkYTZQzvAst
         nwyu/spyHrRZTGAi7frnntp3r6u0lC/J4O4dGChwyQ5HZw2yxfRTkIS3v1uTO+XmPmxQ
         I4B91VmNGCzuNykuacV7JVgH+VZLCfmX46mpFQYsv2t6pRlUJLFp28o3RhpynnTtd2lv
         LCkQ==
X-Gm-Message-State: AOAM532M4DDUzNN8rc2g64nbyV4DwDq+tGoGUnCWvThcEoA4k5uXzlr8
        5eKJUpTVewff7uT11ljGv8xg1g21nF1MGMULevY=
X-Google-Smtp-Source: ABdhPJzTq8kn7N/vZMyKuvArLr2/u6p4ooTtDjVnkwFZKo1GRekAiZW8zGwBa6HXfmnMQ4LU5utfZFWZmQfy14w3g64=
X-Received: by 2002:aca:c490:: with SMTP id u138mr1541676oif.54.1602831991837;
 Fri, 16 Oct 2020 00:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 09:06:20 +0200
Message-ID: <CAMuHMdWnchxP=s84SArS9XWg+uZESVXbkfOXWrpbpwUqNRk91g@mail.gmail.com>
Subject: Re: [PATCH 0/5] rcar-vin: Support suspend and resume
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Oct 16, 2020 at 4:01 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This series add suspend and resume support directly to R-Car VIN and
> indirectly to R-Car CSI-2 and other subdevices in the VIN capture
> pipeline. The capture pipeline is stopped when suspending and started
> when resuming, all while retaining the buffers provided from user-space.
> This makes the start and stop of the pipeline transparent from an
> application point of view.
>
> As the pipeline is switched off subdevices that poweroff themself when
> not in use (such as R-Car CSI-2) are also switched off and are
> indirectly serviced by the suspend support in VIN.

Thanks for your series!

> This work is based on-top of the media-tree and is tested on both R-Car
> Gen2 and Gen3 without any regressions.

FTR: did you test on Gen3 with both s2idle and s2ram, the latter powering
off the SoC?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
