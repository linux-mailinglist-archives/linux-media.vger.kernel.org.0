Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510ED351C73
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235119AbhDASRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238172AbhDASFi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:05:38 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA67FC031141;
        Thu,  1 Apr 2021 09:37:19 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id d12so2337991oiw.12;
        Thu, 01 Apr 2021 09:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T8TyP6fnptQ5NPPSSPpoq4eYNx3rID2GofN8NZEH+iE=;
        b=M5hD6+uBgFXoRDkrkBq4L14rC1J/nk2Tt5cMDVFqtrZyT4yguIjhaAHuqBCOXaj5ly
         1jddJ9JJ6+4J92y1UuoZ8gqO2leVR7toh9U2fFkF3LCs3S8bhoXcvujpCqCN3oNTJb8u
         qZ+Z2HQbtP8X8JVCaBD2DSDT5bbkwTFFzQR8xz88ZcU+50M9gUFBQ+DFyJXbw8VugsFa
         ArR5U50jwp5u0GxvmR/zyczX+5xNUT8gNpS4A2naw/7bil/tmmq86/anpw5ImtS/Wa/m
         5tuWtHhcjzh6b/53+phJUTVwqJ4OuzADgE9kVrqScEfMBDcKxNxr20bgSrLnMhzdkxyh
         f3pw==
X-Gm-Message-State: AOAM531iVGVAN1DZNAP/h/pCBNBkYS2srKJpYazQoN9mle3b8z5ePjOi
        /YW84dcNKHdNCqtBLmIe6Q==
X-Google-Smtp-Source: ABdhPJyLDIYuMi1kL6k7xg4+7X6DQ1uU2plGM17PRCKQY4jybcZOB62fYliZOaoQyiL94fa2MJmwVQ==
X-Received: by 2002:aca:5d43:: with SMTP id r64mr6563182oib.19.1617295039095;
        Thu, 01 Apr 2021 09:37:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c26sm1279050otm.51.2021.04.01.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:37:18 -0700 (PDT)
Received: (nullmailer pid 571558 invoked by uid 1000);
        Thu, 01 Apr 2021 16:37:17 -0000
Date:   Thu, 1 Apr 2021 11:37:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 2/3] media: dt-bindings: media: i2c: Add bindings for
 TW9900
Message-ID: <20210401163717.GA571503@robh.at.kernel.org>
References: <20210401070802.1685823-1-maxime.chevallier@bootlin.com>
 <20210401070802.1685823-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401070802.1685823-3-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 01 Apr 2021 09:08:01 +0200, Maxime Chevallier wrote:
> The Techwell TW9900 is a video decoder supporting multiple input
> standards, such as PAL, NTSC and SECAM, and outputs a BT.656 video
> signal.
> 
> It's designed to be low-power, posesses some features such as a
> programmable comb-filter, and automatic input standard detection.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V2->V3 : Fix the example not compiling due to a typo in the reset-gpios
> node.
> 
> V3->V4 : Add the missing reset-gpios node to the binding
> 
> V4->V5 : Renamed the file to match the compatible string, and referenced
> the graph.yaml schema
> 
>  .../bindings/media/i2c/techwell,tw9900.yaml   | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
