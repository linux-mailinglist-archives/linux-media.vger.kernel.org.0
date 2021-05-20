Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D2C38B7DC
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237910AbhETTwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:52:36 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:40956 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbhETTwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:52:35 -0400
Received: by mail-ot1-f54.google.com with SMTP id 80-20020a9d08560000b0290333e9d2b247so5384388oty.7;
        Thu, 20 May 2021 12:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z+yhOjbsBoUsoRAX3pVk+Y6W6RVZumyS5Slc0RGFsiU=;
        b=byrBixqK8R7bAqV+WUbZtXgF9vIQ1ADnnOvQkdPV5ovPki+mBa8/639M33H8IHZ+Pf
         gg7z8L5m727WPP7G8z7alr4od/1f3LJT8rjQY/1L9mddAjtBn57/USQd/wGb/xoudPOh
         iquIllTAER1EU4hvDyCK1mbOVofjcjYUTsbBGHQp8o4P3YD7uUi/X7z5GQ8UNBfzdp56
         VyU6hcJGKTU6YmERJZjcpu/6CThiLcvxukapD9Iwd9C0tqaI3xJ4u/1fUfpY9PXsBZhN
         ydm05X7lMmW0poO86bnDdOADzmgMudDB3/SzIeisylHUTwDUxsf/UwU00cokGeOwEswQ
         OnAQ==
X-Gm-Message-State: AOAM533ZmLfoqWhByZunKEjcyimtERFxvISG1xsosZz9QMlaxR4taE2R
        GSQg2gaW1fTlUSs4D2Mm0Q==
X-Google-Smtp-Source: ABdhPJxbU20XZZGrNt1CE9lnxSYsaA5mNvyGkTA2Z65qjPwIaUY8ZXXRxGIxl5HMZIsPRC4EsX8XqQ==
X-Received: by 2002:a05:6830:1591:: with SMTP id i17mr5194508otr.181.1621540273628;
        Thu, 20 May 2021 12:51:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b81sm741597oia.19.2021.05.20.12.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:51:13 -0700 (PDT)
Received: (nullmailer pid 1831763 invoked by uid 1000);
        Thu, 20 May 2021 19:51:12 -0000
Date:   Thu, 20 May 2021 14:51:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,imr: Convert to json-schema
Message-ID: <20210520195112.GA1831696@robh.at.kernel.org>
References: <353c2d181ceb6a5dfc553f88a201c6b18ee6914d.1621429265.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <353c2d181ceb6a5dfc553f88a201c6b18ee6914d.1621429265.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 19 May 2021 15:01:43 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Image Renderer Tree binding documentation to
> json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I have listed Sergei as the maintainer, as he wrote the original
> bindings.  Sergei: Please scream if this is inappropriate ;-)
> ---
>  .../devicetree/bindings/media/renesas,imr.txt | 31 ---------
>  .../bindings/media/renesas,imr.yaml           | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,imr.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,imr.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
