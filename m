Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF5278769
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 10:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbfG2IcI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 29 Jul 2019 04:32:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35984 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfG2IcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 04:32:07 -0400
Received: by mail-wm1-f67.google.com with SMTP id g67so48511780wme.1;
        Mon, 29 Jul 2019 01:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0AEuwjUbA2WWjmfEUB61BWLIevtOs5YQ5R/vw1LG+ec=;
        b=Wxv0e4Ctj34QIiolH1MA5Aj8YtjacEMpUchd/8W/2BTLO8WRWGBo+w/Vx2UDifzE/Q
         V3BA0ndQkVSrkogq3irEtv8cHAaWi/xRdYrh/VjHrvBJXYoJu3a6m+hJkUxPGdgz1jD3
         c3S/Al0K4HVld1wISxMgD6MKLBTRa19nWS1gEx94sqAlJ2TqWUyTABPxvJANbSBsp2Jt
         UGNiWSuWU5z2Gl2+OiYogMGj4Ww8udYZLEFOUVpjQmYPPdxYTPee/29N/vWn0Jy91S/7
         WBMUNlGqGdkqGJf8HZ8vPvQHBqYDLJQl7eF8HncBfKKbnzGTf3FRHEfXGGEAEZiGCzui
         pHaQ==
X-Gm-Message-State: APjAAAU7QF7NySDbRSbczoyMaOIoYSFOA7q2cXCqLM/jcEiwRNs+I+pf
        vg/2aHM1g1o7Kc44csHEedv098BoS72MYjr172JJ0g==
X-Google-Smtp-Source: APXvYqyYSyPIpspu1jeNNlQcyFUH0rozyhJBU8SsP7iQuajgts+eEhWZ7kOGvJ8pFQoiBP2nLuZI5T3rOpvFKPh75v8=
X-Received: by 2002:a1c:1f4e:: with SMTP id f75mr95842692wmf.137.1564389124619;
 Mon, 29 Jul 2019 01:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190729074757.9581-1-horms+renesas@verge.net.au>
In-Reply-To: <20190729074757.9581-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 10:31:52 +0200
Message-ID: <CAMuHMdUkogXnd6_H_q=STyVS0zxpKYif_iJH0pw753onCeU3gw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rcar-imr: Rename bindings documentation file
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 29, 2019 at 9:48 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> Renesas media binding documentation files uses a naming schema of

use

> 'renesas,<module>.txt'. Rename IMR file to match this pattern.

the IMR file?

>
> Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
