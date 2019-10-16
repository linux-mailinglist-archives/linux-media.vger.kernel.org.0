Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD883D892C
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 09:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfJPHOp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 03:14:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45015 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfJPHOp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 03:14:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id 21so19236388otj.11;
        Wed, 16 Oct 2019 00:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=akpwtfvOPNLnb/bmjf7V/JiMuHxkfhc6V5jlZ+jRi7I=;
        b=a6osx3kOH7rDZ65HpEC8ELVNRb0ye+kNcP5J7ixehFnuIj3lPVv7EL6DL8LZEbgCQH
         qerPxLZuwRDl3jlZ7APXpo+pnm9a9sGo/RpqutKGiumCie8fuEwARZXskzpAOa0LQT3k
         DGc2LK0gsUaOX9CZZFL0G9gpcABMknKLCmZkrAOODcAHhwIXOwg5wX9e/57t24x+S3V2
         JAt/6OxnvxoQdqu5e4BfcHl/zFFErD60Z5MjH/0s9Xn8rkJ0xyKYrnSvdiaOEDUQzqSc
         Ej2eUD5kMhvjd+g4jPfQLkfO2LvMgUpZo5jjHtdGtNrwsb8PDPojc+sD0xUsICjiwICo
         OChA==
X-Gm-Message-State: APjAAAVMwA9JHBnJsCKKijK8LxJ/HLI2usi1X6rsXLodXkqF9OTNLxJc
        mGcM5RXufaMbJuNciWyZMtATtAXDpcrm0WRx0qw=
X-Google-Smtp-Source: APXvYqym4okkqZ9r6Ym+n1BpCWzpFVrkteH3fCCNqcg+bQLrHCWevOxN0wMtWoeKECoPiNpcaf7LJK1x1A8e2jUKYUE=
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr32518106ote.145.1571210084426;
 Wed, 16 Oct 2019 00:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com> <1571137078-28922-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1571137078-28922-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 09:14:33 +0200
Message-ID: <CAMuHMdXK01svxF2tMeTu2bdcuA=rUhhvw46GnehkmPhZ3CZ=_A@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: rcar-vin: Enable support for R8A774B1
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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
> Add the SoC specific information for RZ/G2N(R8A774B1) SoC.
> The VIN module of RZ/G2N is similar to R-Car M3-N.
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
