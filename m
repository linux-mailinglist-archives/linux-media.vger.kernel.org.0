Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC85226AE80
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 22:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgIOULM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 16:11:12 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35560 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgIOUKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 16:10:55 -0400
Received: by mail-il1-f195.google.com with SMTP id y9so4276376ilq.2;
        Tue, 15 Sep 2020 13:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QfGUyVr47DdU3WW68ML9EJNbnTWnUYFNz75ldAiygcQ=;
        b=CwF7lRwGQA80sv+m8UV0ntXqWZSblNTjwwsMuX+UOSqFEHdsUqHe7la/GIXmpqvcY7
         D2STFNOMit1yhNcyvyA8AOHvnaH1ROY6X9uQ0YwUjwu63sx6cqkwCGGbfnE5ac3mBRv7
         4lyNuAYbkuyC5LayPuu3um8DE1jg/4/cNf/1Mk2Fw7BIbBMn+VkBk2J62lZSSGwHw8lQ
         pCUXMbWO79nXt3SHygzR7KB6pMC0IFyb60E5gUtRWAObr9WOqutwyagcmKinHhc9bHpT
         jzvWDtZ+hCR9p9bg8dFJ0Fm7EjY85Ef3bNrlVtL1yvEb+ZZORF2PJbTHnre6Sgqjw8nM
         318g==
X-Gm-Message-State: AOAM531WYYNHl+SMsARsgqyXNJ3sfbUmoIFqICCRvnl2EWMqaJwqY4VB
        1qW1u0AWeM6pdpd+5mUANA==
X-Google-Smtp-Source: ABdhPJxMAOEcMBt9IpYZADT0tZknHdXWM+U+dw2J8Xr50qsXbuWxNePDwPdtj1vUH4iTjNO7fsqbeA==
X-Received: by 2002:a92:3209:: with SMTP id z9mr18286625ile.260.1600200654092;
        Tue, 15 Sep 2020 13:10:54 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 9sm9060467ilj.83.2020.09.15.13.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 13:10:53 -0700 (PDT)
Received: (nullmailer pid 2426223 invoked by uid 1000);
        Tue, 15 Sep 2020 20:10:52 -0000
Date:   Tue, 15 Sep 2020 14:10:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 1/3] dt-bindings: media: ov772x: Convert to json-schema
Message-ID: <20200915201052.GA2426162@bogus>
References: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
 <20200910162055.614089-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910162055.614089-2-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 10 Sep 2020 18:20:53 +0200, Jacopo Mondi wrote:
> Convert the ov772x binding document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov772x.txt  | 40 ----------
>  .../bindings/media/i2c/ovti,ov772x.yaml       | 74 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 75 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
