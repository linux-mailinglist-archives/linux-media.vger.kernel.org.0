Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52AD81D47A2
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 10:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgEOIDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 04:03:21 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38781 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgEOIDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 04:03:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id w22so1240714otp.5;
        Fri, 15 May 2020 01:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S6RqWFqDLnyhbogEEorXs2l4C9SQA7u1WfGxQI0hFs0=;
        b=k+dWELhzok4nfrHidJ//ljEfRiECz3jhe+Fyy/rKOJ3JOa+4TPWJ4QWybYRSNa7R1T
         QYW6hGtSupQAmQAEVLfvmaTySrgObvFgYCRIBpqbjaGMdxHfAq4YE7OZIZj8C/vB72Bv
         e/uk1WPPOKWf0SH9E41iPCJsZiDpexG3hO8DmvtgDz0CukoCP5Gas8Kuo3A1jahYjvZi
         Hm1OlEj9Vge+LrBbv7nLsvbuPprQ1QymdrmWImAMxNzhSzEFDl4xDVT8xW7GNNbOeESY
         2jl53HBxXFaTi5s6Ma5MyiRRRIi3ddd9krGGT7du7baRM2b2fv58x6c9vjTOsyaeGySg
         D4PA==
X-Gm-Message-State: AOAM5305rB1e7ZLTyTEA8YOrlmAh4J5slbjgXRu8jmBzo0ydTFdu2MbE
        bHQ5aluGVsWb/WHue4128A2BbSXz4l7W+9Kd+5c=
X-Google-Smtp-Source: ABdhPJwqzxHWxFv6Mp1ECz3hTRpgWrZ2yzfCv2QUL/NdCvBf1nUgrqWXh9K7DZI4g+rUbxIxZPqwL20omKYmPmjS+Jw=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr1263475otl.107.1589529799904;
 Fri, 15 May 2020 01:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com> <20200515012432.31326-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-9-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 10:03:08 +0200
Message-ID: <CAMuHMdWU3y56HCJ8wFgjD2AXTdDcZjUxiLdrS-rqKjuTMvY6gw@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: media: renesas,vsp1: Add power-domains
 and resets
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 15, 2020 at 3:43 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The power-domains and resets properties are used in all DT sources in
> the kernel but are absent from the bindings. Document them and make them
> mandatory.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
