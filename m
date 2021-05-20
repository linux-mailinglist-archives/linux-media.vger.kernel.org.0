Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC5838B7D4
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239929AbhETTuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:50:52 -0400
Received: from mail-oo1-f47.google.com ([209.85.161.47]:43005 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbhETTuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:50:51 -0400
Received: by mail-oo1-f47.google.com with SMTP id v13-20020a4ac00d0000b029020b43b918eeso4053142oop.9;
        Thu, 20 May 2021 12:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y7/r+lTzvcpyRcN9xZW/fO3+JmbWhZxxbfns43ZWFog=;
        b=fsNMKUnRGACuML6GInZi7HUxWSoxtS/Y/zdvRFMzGxyxDOaSBxW7kVnW3DCEaroM+u
         zxkrkm211V78ylnsfWBGO8JDXH5gp6oJp4JoMv5U3s050B0zPe1flOFiaSNE2C+u5x2l
         rHSHQAq9dO1NiJzoNJcZlB1YBc4Tb//kOsnyXM+s45O51/2fnvRnOQeBRBUfpluuGK9U
         LfZXEBdi9oxZxyhx5JplAkKhbAozPwVApmiRcFfY6LCdgLAoW62TCFkFFwopAf2Dx9QK
         wbM3bt5VOEKTKYZ6TMkt/aOOWFFzjCDmLUh/iWdlIz+Gtz+AO5czV/PEqp2+Dt0iAJxT
         EuDg==
X-Gm-Message-State: AOAM531JWTvg2p74FgC1+EGtoxhqugBgTrE94HrUxC9w1KbTGZt0bAyi
        eMA4aLw6qnf5IE3Vxj947+uGljCmGQ==
X-Google-Smtp-Source: ABdhPJxZDhHg2Fi3gVOKdznze2iYk/Alkj5D5w8hoFCPZhGUvHvVrP0Uud0Bu2ePkOtU9iRzT4+FOw==
X-Received: by 2002:a4a:ab04:: with SMTP id i4mr5029085oon.56.1621540168107;
        Thu, 20 May 2021 12:49:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f8sm696491oos.33.2021.05.20.12.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:49:27 -0700 (PDT)
Received: (nullmailer pid 1828469 invoked by uid 1000);
        Thu, 20 May 2021 19:49:26 -0000
Date:   Thu, 20 May 2021 14:49:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,jpu: Convert to json-schema
Message-ID: <20210520194926.GA1828412@robh.at.kernel.org>
References: <ded1a61cbaa39fa7a15efdaa2fdfa4fdb307b930.1621429165.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded1a61cbaa39fa7a15efdaa2fdfa4fdb307b930.1621429165.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 19 May 2021 15:00:56 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas JPEG Processing Unit Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I have listed Mikhail as the maintainer, as he wrote the original driver
> and bindings.  Mikhail: Please scream if this is inappropriate ;-)
> ---
>  .../devicetree/bindings/media/renesas,jpu.txt | 25 -------
>  .../bindings/media/renesas,jpu.yaml           | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,jpu.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,jpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
