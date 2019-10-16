Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC8CD892E
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 09:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729887AbfJPHPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 03:15:04 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33440 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfJPHPD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 03:15:03 -0400
Received: by mail-oi1-f195.google.com with SMTP id a15so19168482oic.0;
        Wed, 16 Oct 2019 00:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HRYpCLt3Zu2Jol0KfAG/CiW7D1ttFW6PzRiG7cHGNLA=;
        b=pCS3MwHv81JoEA1XuCi65BNRNeQme2w9veQoLyqfFlmrLYkgV3p8E6G8/iNAr8z9M8
         HUr8XnR81jBn+MTMOivJ0CGh/5zWOLsHdY1Z0T+qwtd0PQM5kaYw0uXqqLi3qEFUxf7V
         IcP/eZut7RHEiPcmfaVFrohu41K/epOrXOH9QWoQQ17AA1gvx6P5w1YD9CN1kN2NNHcK
         aj1fVVUK85q5PaMSsroPAu20VZic9ilKxzaE6cMPWQ2xY1BvpF/nsRvFFSI6fi2Qt6KF
         Dt3QwA+JWqbPHeBzhvNvioKi24/LmYq4K22c5BJvP468THNa78A592C46S+MWM6IREs5
         JMNw==
X-Gm-Message-State: APjAAAW117TlC4q4/tFlww3LBSslreW3xUsZYV3aluqUUdzPOMsOPsT+
        HG6mAjDJgrHLFOvyRda0BtG7gxBdUx4r+iA+Tw4=
X-Google-Smtp-Source: APXvYqwEnucWD/2pkPt36+F5Q4ljE9C+21OYu/+zrGayOTIy2kHFtKteeshcN4BPrwKB8ccFmzqRkd4auXw0EBBcubo=
X-Received: by 2002:a05:6808:3b4:: with SMTP id n20mr2089571oie.131.1571210102814;
 Wed, 16 Oct 2019 00:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com> <1571137078-28922-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1571137078-28922-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 09:14:51 +0200
Message-ID: <CAMuHMdVGrT4fsB=x=FzMoJhBtQ_r6SuYF-wZ9BJMfkxP=HXNNg@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: rcar-csi2: Enable support for R8A774B1
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
> Add the MIPI CSI-2 driver support for RZ/G2N(R8A774B1) SoC.
> The CSI-2 module of RZ/G2N is similar to R-Car M3-N.
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
