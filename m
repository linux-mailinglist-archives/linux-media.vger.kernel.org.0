Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C981D8923
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 09:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732742AbfJPHOF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 03:14:05 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38790 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729950AbfJPHOF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 03:14:05 -0400
Received: by mail-oi1-f195.google.com with SMTP id m16so19150709oic.5;
        Wed, 16 Oct 2019 00:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vR/DF8NnvLBtYj6d1UO5P3iWy/f9WW2aETA6hKwnMMo=;
        b=ThgQp+Z4XerevnK0O/jN79bR+WlRv4cEE3Nsk4XWaHr/K6BCysZD9wDokWNwU0rZ4n
         +MphsvM5/rrIDHn13xraBKSJhia8jyox0hNnFxRULO6Ymb6ZwakRlL+rGbJYSZmIonN3
         uSba/OlnqxnOytUuoReDdlWHYq8ucaBjonzTo+0ygjAsP/pIgLcf+NRuYlWST10GUokS
         ceGO667ftpdEuESZn+AWNJnlm+shJi0Rnk3+feqqaWVd1ryaT6TUITBhP346SfKbASHm
         hy40JwKOMhx/HjjJ7QnqYbEJljhVps7WWgQTBKtJP1RUDFtwpAkgX3w2iFhLBDgaAdW6
         48nA==
X-Gm-Message-State: APjAAAXANXDd5AKep6sz1G4gKjep17DbRX5sdiBnPiEM0h0vcmoio6oX
        GCg4dqdOcrPs/HJaBN0tmUp/Nata4SyYQZhqN7E=
X-Google-Smtp-Source: APXvYqyjDpHvY1ThHWWkEsvyNPlWeYinMvSL6meDup1e1RV6xs2lrp17E4jKYV29/ShYZ1JeLrehviKQ4PYjU+MvzL0=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr2086782oiy.148.1571210044353;
 Wed, 16 Oct 2019 00:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com> <1571137078-28922-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1571137078-28922-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 09:13:53 +0200
Message-ID: <CAMuHMdXfOoS8rdkjyuWirYmPnBUYbB_WJQ03hX7vWHwLDbHg2g@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: rcar-vin: Add R8A774B1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 15, 2019 at 12:58 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Document support for the VIN module in the Renesas RZ/G2N (R8A774B1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
