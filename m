Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1E235A64C
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 20:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbhDISyh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 14:54:37 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:40826 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234375AbhDISyf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 14:54:35 -0400
Received: by mail-oi1-f170.google.com with SMTP id i3so6772244oik.7;
        Fri, 09 Apr 2021 11:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GY2ZIMSCa1542Fs+HNLef7VCC347ObH1e8pWTctJXMQ=;
        b=Qq66H+jLXKfIJOJu6W2mkoWTR7C1vGZipTRxUEnqqc8Zgg2SfmfmitdHDlF37zySnc
         nVRlzrleGHNgBh9G1bSbmTdcy6+omLFSF9BSZKtfHUMt69sSsa1LQMwCIEeSvvoicWgx
         tg8VMOGqtYEjEJ6TJVAntCYw8Yb7jiG8nxPoF6ij31KyPo/jfMzGbFptZ8TtS4Fb7UQ7
         B7cQBtlpaPfQUp/61MiDgeosKlaNWaTc58eeYczbfq+S5hPBFKFyF+ZGBwEzGUAusJnE
         Ozkqdx/w1NVYLoDadUoj4HzT1iKTjFJ4VC8olnVj/F92d/yulmzC99lp9ydsWCegOLHP
         5GOg==
X-Gm-Message-State: AOAM530xMa0kQvqdFBiXIvD7bROONLZxiZrKFH37zl32wV9rAM4ID66C
        /5bZbXqUoYnnxFyN+w4f6Q==
X-Google-Smtp-Source: ABdhPJwapWPb6jZVTQC3id73t1pC8EJSkrYVUO4SqQYnuT/h/9sS/sbetzD9aOayty17IT7Mum3skw==
X-Received: by 2002:aca:ed04:: with SMTP id l4mr10753460oih.27.1617994461922;
        Fri, 09 Apr 2021 11:54:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v65sm680011oib.42.2021.04.09.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:54:21 -0700 (PDT)
Received: (nullmailer pid 3955465 invoked by uid 1000);
        Fri, 09 Apr 2021 18:54:20 -0000
Date:   Fri, 9 Apr 2021 13:54:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,drif: Fix fck
 definition
Message-ID: <20210409185420.GA3955417@robh.at.kernel.org>
References: <20210408202436.3706-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408202436.3706-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 08 Apr 2021 21:24:36 +0100, Fabrizio Castro wrote:
> dt_binding_check reports the below error with the latest schema:
> 
> Documentation/devicetree/bindings/media/renesas,drif.yaml:
>   properties:clock-names:maxItems: False schema does not allow 1
> Documentation/devicetree/bindings/media/renesas,drif.yaml:
>   ignoring, error in schema: properties: clock-names: maxItems
> 
> This patch fixes the problem.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
