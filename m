Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D98A28DD19
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 11:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbgJNJTk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 05:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729386AbgJNJTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 05:19:39 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CBFC0613B0;
        Tue, 13 Oct 2020 14:51:17 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id x20so905648ybs.8;
        Tue, 13 Oct 2020 14:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bDJBmimFNcOmrJNpw4Oo6sx1hDGNtJ/+J7J3Qbb7Q5U=;
        b=YH2hkUqX2f8W5yQYRQMPpKC9XI12UPzVpfiS+7ZBXDRAasSrD8haZ1SNvnWNkpl18k
         2If8oVXPZBj8gMa5G3maonPOS8P15Tn5sp6vuKqe1UjfjCaWUKv7i8HviHeTviLdszH+
         G59RHti+FnraYoBWxm1nqK8H9WuS3kJjnoDLLAqQXnwz3dr+Zrk8u/USvWX5HWBFVskM
         912EWpVLKSiamruMNvg4KQAF9CxzldcGQ8vLKrKR9t8I7AlL5xk/GItjVCliAuOeCQaP
         7WEi8+GiWrgQ6ugG2vTjAj57WFFOQN4eFr/o/BqjG0oINMLB+2gmsaAvUfHNj3f5eEn0
         hSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bDJBmimFNcOmrJNpw4Oo6sx1hDGNtJ/+J7J3Qbb7Q5U=;
        b=eKesgDMgnj5vlXLSJaMqoQW09Wn0lXNWXttyCi7x2Ctm9IjrkdMvydet9lnAawT25S
         famgS+cBklaKQYy7mw3l6IKQsWZ8zV6auZUYUJim1PtNnC0Mzgl4V6BObspdr+imv6on
         hm/mbXjiR5DiAr7RpDW95ngJEGu5Y8paXOi+d9iTHyKDFPcM10fVcZjMNruYGttnB75E
         QmTX+V6KtJleMe7LpMNm7PLdQ+eifwLVtlFsgb6hJhNixg5lW6CDNFkj8EL9YFBrJwvI
         EroPdD7t+Izs++Y4OqSEUTZ5Ph3c4wN09mL2SBGCAapTwmF4M3T9v+Fyi2ubyU7ccC4T
         fZng==
X-Gm-Message-State: AOAM531HFSaH2Tkh8CpOExKBcipFpt1SmkW8ohpWXfVWIgExqXGSAWge
        qqrgKxNb8LZjBHY6+q6KSdTpgqePxn/jH//4e+o=
X-Google-Smtp-Source: ABdhPJxGCPKnVEzsu1M02mAZXJtBJDfgufwzl58JQIGZ2xKBkBSpNl6Dgkx6DS7D2cXXW9xRJBq/4P8awdlhDzQpkCo=
X-Received: by 2002:a25:5507:: with SMTP id j7mr2926439ybb.214.1602625877227;
 Tue, 13 Oct 2020 14:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com> <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 13 Oct 2020 22:50:50 +0100
Message-ID: <CA+V-a8tJgp1VDt9rQeRzwWcPybwU+ehyHNHaAeYJVwECPMNgFA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: dt-bindings: media: renesas,drif: Add
 r8a77965 support
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Oct 13, 2020 at 6:25 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The r8a77965 (a.k.a. R-Car M3-N) device tree schema is
> compatible with the already documented R-Car Gen3 devices.
>
> Document r8a77965 support within renesas,drif.yaml.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v2->v3:
> * New patch
>
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> index ae50b1448320..89445ddd598e 100644
> --- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -53,6 +53,7 @@ properties:
>        - enum:
>          - renesas,r8a7795-drif        # R-Car H3
>          - renesas,r8a7796-drif        # R-Car M3-W
> +        - renesas,r8a77965-drif       # R-Car M3-N
>          - renesas,r8a77990-drif       # R-Car E3
>        - const: renesas,rcar-gen3-drif # Generic R-Car Gen3 compatible device
>
> --
> 2.25.1
>
