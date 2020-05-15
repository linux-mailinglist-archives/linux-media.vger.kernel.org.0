Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4F71D4764
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 09:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgEOHwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 03:52:12 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42378 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgEOHwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 03:52:12 -0400
Received: by mail-ot1-f65.google.com with SMTP id m18so1195745otq.9;
        Fri, 15 May 2020 00:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JaQlBb9oArYmKvmoqWVUkmZk8foj3iKrTJtHxEepwn0=;
        b=sVSG/mOrW565OBm5Ca8evNXGT0vGp/khuIDCJrS0xnMT7tuJOBSMjAEwHIyGUq+3bE
         bhXCJ0JBD5AedBf5M0rfvoEWcfelgOrsvRwLLbfyrrUO0cCBk9LyaP8d3GjGAcnIXJHd
         u/zAwnO9K4j/kKHfxY26kYM2coWwQCCFpNg7remY39XtBRbcAhYgjIbMOEISSWH385L4
         4MJSWQUWltl1082/B54UgXFu6Vn97RDfcsG57nb/3l7ch/hnQMWKHUtUwSTFxZViEejg
         YK2SAeFY10qFUCbwJl4r4Q7Y7VPUGtU0Ll9LA11ZqvCwDQuEf5+sYyap46yxF91Lu5mK
         o5GQ==
X-Gm-Message-State: AOAM530N5pwtwkBOhP+5EXjDbpWhUCjmRbRTLDsTSbUuiU/BaC7J8egN
        rkt8Zvjh4H6Z4JCqyxQd7Q/jXWK8QlEF4aIfw4AtgQ==
X-Google-Smtp-Source: ABdhPJy3iOyQMKi7AuotsPKCDsiz+XoWb2CdQ5Zc7J0FnbL0Xgdt8ZEQFtucaP2b8nKF8xcH85ULQUJvTIaHzoGFZng=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr1239507otl.107.1589529131311;
 Fri, 15 May 2020 00:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com> <20200515012432.31326-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 09:52:00 +0200
Message-ID: <CAMuHMdXR8eNqC6ieqJZaRevRjPj8kYspcixVezjAeuPWgnZB3A@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: media: renesas,fcp: Make power-domains mandatory
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

On Fri, May 15, 2020 at 3:42 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> All DT source files in the kernel tree specifyc the power-domains
> property. Make it mandatory.
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
