Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3301D2908D7
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 17:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408731AbgJPPuJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 11:50:09 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37459 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406693AbgJPPuJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 11:50:09 -0400
Received: by mail-oi1-f196.google.com with SMTP id t77so2934197oie.4;
        Fri, 16 Oct 2020 08:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OutJAEBktoisySZZcByItl3Q7TUScJ10GyZHZCfE+J8=;
        b=WBHnu0sdCeXQExMxfrAoTMM4WheW06fz5d47dHxqW0hgWRtXy5ItaJt5IJKlquY9hK
         AMBfTkH5uw4V5JhDGYh5HIc6CgnDWApBtvUyDxP7jENDp7wATKZnFLQ7rSKunvnCipBD
         HlGvg4ZIO2rEVV1UVlycIPki5+3Z1yH93qkGOwAs6Rk1LYSd/WQARR4l1FtQ3zSfKo2O
         ms6x98YHiGn/aD36ziHH13PKobfB+OnoxwX/dV50cmTHRvgyNaFL4P+FA3Ppxq50Xvge
         bniqCRtmkjup5AiLUxl0ShQZuqRNvq6hGO4zm2TpLGAQ+kPn2JXZCw0En49wg6G8MWiR
         XG7A==
X-Gm-Message-State: AOAM533aylxuP0ld8RduMhoRL+4mpqaeGiL6cB8oRKxdZaWOQYxDg7RQ
        A2j1XFnQB+wvEJKM5cmO6A==
X-Google-Smtp-Source: ABdhPJwLBfdFmgtP6mYMrzKLPn0KqWGaktsmZbu5Mz+71BRtAeCHaNgIuZl/yqNpm/RQeW/wtTsCIQ==
X-Received: by 2002:aca:b642:: with SMTP id g63mr2743291oif.165.1602863408002;
        Fri, 16 Oct 2020 08:50:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v22sm1164318oia.7.2020.10.16.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 08:50:07 -0700 (PDT)
Received: (nullmailer pid 1475301 invoked by uid 1000);
        Fri, 16 Oct 2020 15:50:06 -0000
Date:   Fri, 16 Oct 2020 10:50:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>
Subject: Re: [PATCH v4 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Message-ID: <20201016155006.GA1474949@bogus>
References: <20201014155719.15120-1-fabrizio.castro.jz@renesas.com>
 <20201014155719.15120-3-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014155719.15120-3-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 14 Oct 2020 16:57:16 +0100, Fabrizio Castro wrote:
> Convert the Renesas DRIF bindings to DT schema and update
> MAINTAINERS accordingly.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> * Replace "if" statement with "else" statement for the branch
>   rejecting pinctrl-0 and pinctrl-names properties, as suggested
>   by Geert
> v2->v3:
> * Removed the definition of pinctrl-0 and pinctrl-names, as
>   suggested by Geert
> * Added "power-domains" to the list of required properties,
>   as suggested by Geert
> v1->v2:
> * s/controller/Controller/ in the title of renesas,drif.yaml
>   as suggested by Laurent.
> 
>  .../bindings/media/renesas,drif.txt           | 177 -----------
>  .../bindings/media/renesas,drif.yaml          | 277 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 278 insertions(+), 178 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

./Documentation/devicetree/bindings/media/renesas,drif.yaml:54:9: [warning] wrong indentation: expected 10 but found 8 (indentation)


See https://patchwork.ozlabs.org/patch/1382223

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

