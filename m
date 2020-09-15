Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF85626B684
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgIPAGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 20:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbgIOO2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 10:28:42 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2439C06174A;
        Tue, 15 Sep 2020 07:14:12 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id h20so2743707ybj.8;
        Tue, 15 Sep 2020 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yFEswjPEkU42WKhQk4a5lgZHSsu2C+ZFtLptD4MF2bQ=;
        b=lZ6hi3H/Ni/Rj2qNSQSbJUp1gwv0oUrg8wH/4QfzoVGTjQRN1cgLUGpHpfRrRjqL9d
         8+/BbZZ0cQg66eCcvKa3AEZ5gNMcmPYu4PSIJumVyzJAd1wNQbIZksQqur54Hah6Q179
         UJd93wJSoIx7jGhcnAnCunfcTcvDTyn27ppCy7EV71Dt25opvC/zdqqrRKZIT6KvDv6B
         V8eZxkCs92fpCtt47zfe15Y90OLjGOn1A7yMkkc6Xo37fkOA4a1sqzTargzXQEmpn4C2
         CfGM00NAbquvHs7retxPQaFlwaaCoLRr8sJfar2QjAMXBnV+NjlOV++8Lyp7WO50wEIf
         mY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yFEswjPEkU42WKhQk4a5lgZHSsu2C+ZFtLptD4MF2bQ=;
        b=lzmN8AZvKvAC/58t694GiB5wjbG0vRdbtEAeE3xUUhi549c1qNA0W6GYsEgTI6Vrhr
         5cmaopyl6xRHH8U3v+QoGHLQYxZcCUe/T4hySnvExAeOiVQ6hckrT3Gw6IVrLEPgLWsR
         uRCX4D3PLYT+oTLAHGiFJDPhR1yDFn30NQPVMFIECp9DmNZfEZ284gaFCaW/4OGIrRj9
         ARovRtgUDJTGK4dsXNpcqMEDdJdMKMr3UFCYOLn2+yM684eXXT+PN8GZy4RmbV3AbGU3
         yXuYYItUvtPgAjyY4sW3BuBNd7nRmB5zgVvdUSk8sb+UDll0vR/PyFc9dSzUbxWLDAGN
         3PTg==
X-Gm-Message-State: AOAM530IDvV4tEacVlPo6hIG7UT7TLnJK8YNARMPneJmuJCkNtjUq3Wi
        xxtHT0z3mKoLpPX+ZKfBOGbBuyvBFTBbnx5KNgQ=
X-Google-Smtp-Source: ABdhPJxcaOWZcfw234jowg3P/dhI9NAewu6ytUIkBJ/r5/zNIRqqESPPYfmmdQPZhTf2Bf33axoPb0dCxznPJoefwPc=
X-Received: by 2002:a25:344c:: with SMTP id b73mr26337425yba.127.1600179252155;
 Tue, 15 Sep 2020 07:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200915131216.21137-1-fabrizio.castro.jz@renesas.com> <20200915131216.21137-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20200915131216.21137-4-fabrizio.castro.jz@renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 15 Sep 2020 15:13:46 +0100
Message-ID: <CA+V-a8u3q=KeNtSZXtwcGEv3Am9m2bSZbcjOxP8ub2SohMeQMA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: dt-bindings: media: renesas,drif: Add r8a77990 support
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Sep 15, 2020 at 2:19 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The r8a77990 (a.k.a. R-Car E3) device tree schema is
> compatible with R-Car H3 and M3-W schema.
>
> Document r8a77990 support within renesas,drif.yaml.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> index f57fccc159d6..051d515be38d 100644
> --- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -53,6 +53,7 @@ properties:
>        - enum:
>          - renesas,r8a7795-drif        # R-Car H3
>          - renesas,r8a7796-drif        # R-Car M3-W
> +        - renesas,r8a77990-drif       # R-Car E3
>        - const: renesas,rcar-gen3-drif # Generic R-Car Gen3 compatible device
>
>    reg:
> --
> 2.25.1
>
