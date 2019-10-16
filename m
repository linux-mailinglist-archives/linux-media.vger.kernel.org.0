Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 023B5D892A
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 09:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732759AbfJPHOW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 03:14:22 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45861 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfJPHOW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 03:14:22 -0400
Received: by mail-ot1-f65.google.com with SMTP id 41so19249524oti.12;
        Wed, 16 Oct 2019 00:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vIKiONtOMHgZxBroewGRdwKyRbXQJxipA7XxtP3+SBY=;
        b=tt0VQj4COv4Du7M2U2UKy2szRxPgUPdXfwjgW9OFnIxuyZy57AtcB2YDspMDQenooF
         07TTv9Az4GpqxEXpRcKgrNOAquwUfVji8MIFaJV+mNhj8Z/dwNOxs8ufZNxZOdbfVc0F
         IVYqhSyXpPK97wOhijao9rw74qoVZEOl7M5h580yZjuSnDYzRrOUW7FmF1Yk0m7Hewny
         MoGYOJ1KsuaJOG8PGQhHCf4Pb1rB92JEUzK/es/E8CJTZx1lY9bdaSqdJzYEo6OHOei0
         AfrrK3oy+F1h31Qo1UIUBEmlQsQrFK0lXA21zaJVgmr09J3tFRcKAS2ExjsfFrsE8nTE
         DAfA==
X-Gm-Message-State: APjAAAUrheYZ59K2DepxzjjnO0jEciFXYt3/QhNa7ovfvLsFkOYZ1t0X
        CU7mkFdR/ILAcBJGMABAdaNV+5+j2YRlrtJmlKQ=
X-Google-Smtp-Source: APXvYqy+EvLh/UUjrxE0WhTPjT1cwgx6aGcS1mTA0Bu9TLwuYsGSEKpV0h1abY5g5OY8zXeNPO+QBKLGGZOstVGI6M0=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr15610812otj.107.1571210061551;
 Wed, 16 Oct 2019 00:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com> <1571137078-28922-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1571137078-28922-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 09:14:10 +0200
Message-ID: <CAMuHMdVuD+DJFuWCt0dwanzQX=ATQMYv-Cdjg_oME5M85VPeBg@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: dt-bindings: rcar-csi2: Add R8A774B1 support
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
> Add the compatible string for RZ/G2N (R8A774B1) to the list of supported
> SoCs.
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
