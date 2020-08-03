Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F66B23A460
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 14:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgHCM00 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 3 Aug 2020 08:26:26 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38701 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgHCM0Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 08:26:24 -0400
Received: by mail-ot1-f67.google.com with SMTP id q9so12076736oth.5;
        Mon, 03 Aug 2020 05:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3dohou5RSw8QoQG6bAPJAcX/Qp198r37ym/TNY4Yqz4=;
        b=FE2btXu3ZkdNaPOSKwQoTknevvVnZ+h2eTLZaBwhH09wuADhKyf8gpdsLWMYDW8vmO
         xDD0bXz0yk1QZ5YlHg89wC6Fab2c8UdtzBUU612Oi7Du3QQ7qyokffmSrIldvR1kZqdp
         VJN8gYYhR96gmOFKIUczM9T5EJgN8pdprGeVHmGKRWUu/muOAfuluvk1RCjqzWqaXuey
         e1bfi6/Ue8cgGj1mAVEu7RhAjetvPUaW7n2iFkIHZyDhFJ63X3Xml4cXpJnNoSaLAhzK
         JgY9Qzav0x/InW1qx/vZb6Zr6gC4HoNKLHAT3pimGit+WHNkQVNIMH/9KGQAQxhqS33s
         5jPg==
X-Gm-Message-State: AOAM530DLSeZhI0giAL5bxedpPBAjzfqHo3JtnUPXB/YfQoRnoed1bo2
        59psVG+Xy1Cg7sU5AOCEQG72zKnMIdaFQqLWamJT0vAD
X-Google-Smtp-Source: ABdhPJzKQzVSBq1MRtlA56QD10eECEH20woK/Y5hY2exzJK2bn0gx9Yb/l3Q6If2znAS+f6eplUpkupVZciaC7VEgzw=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr13030193otl.145.1596457584051;
 Mon, 03 Aug 2020 05:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200802173059.122595-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20200802173059.122595-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Aug 2020 14:26:13 +0200
Message-ID: <CAMuHMdUrN0YBugFvuCLeNw1obdjCY+aZa7vDQEAUqCZUyjQTyg@mail.gmail.com>
Subject: Re: [PATCH] rcar-vin: Remove redundant compatible values
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sun, Aug 2, 2020 at 8:05 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The compatible value 'renesas,rcar-gen2-vin' have always been mandatory
> for all Gen2 platforms. Remove device redundant values.

That's not true: the DTS files for R-Car H2, M2-W, and E2 lacked the
family-specific compatible values during the first few years of their
existence.  However, given we dropped support for the old CPG and MSTP
DT bindings, it's reasonable to assume all working systems have them.

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

With a slight update of the description:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
