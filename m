Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7252D4B32
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 21:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388076AbgLIUEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 15:04:30 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42728 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729464AbgLIUEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 15:04:22 -0500
Received: by mail-ot1-f67.google.com with SMTP id 11so2616082oty.9;
        Wed, 09 Dec 2020 12:04:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pGZf8utChZGzJPgGUPTvp5A60qT4929+e4HekogsM8Q=;
        b=WYgNN1ugPZq70aCd8yqW91Yqn/70v5oep0O4uL/8LHILxJ0ZQIZRGuiZaG6hBJ9urd
         NNsQrQ4YzOt4FCsFRqcsk6yB9GkySQm7dRDFKCEJITg6zSY7Lh/sKslXCBt+1P1TQIcx
         1FN/lqDQg42GJRSMc78DjL3RMfD2CiqrxurAQRfMoaZOfwuqVLzhPfJlzILh2H3TOEmM
         fflIZRNQEUY1sdTUUMT5K+ydwG4Osw0SfpfbCizBd2ibc0hqdjJx1l8osWDoYbg4EhH1
         I6YT8zfxehruqeE3oK4fLS3G8gdugbEi+AmotnVE6eCtU+l6IRcM5BQdhHzRxGhwLSJD
         87lw==
X-Gm-Message-State: AOAM530rjQ3VSNjS9qv09tAa1Bohas+qGlh9zsUbWKDoHDfgpdFTlPiq
        /B4RO8XgiGruuOX9tx0HyQ==
X-Google-Smtp-Source: ABdhPJzYlKf5HW3tAsFXWFDfiozSaE7UFEvX1IVKBBTSwSss6doCjwA0UhCyRL4bCEt19VFgBQPtrw==
X-Received: by 2002:a9d:7851:: with SMTP id c17mr3298723otm.255.1607544220686;
        Wed, 09 Dec 2020 12:03:40 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a4sm533322oot.6.2020.12.09.12.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 12:03:39 -0800 (PST)
Received: (nullmailer pid 851088 invoked by uid 1000);
        Wed, 09 Dec 2020 20:03:37 -0000
Date:   Wed, 9 Dec 2020 14:03:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 2/4] dt-bindings: media: allegro,al5e: Convert to YAML
Message-ID: <20201209200337.GA851040@robh.at.kernel.org>
References: <20201202133040.1954837-1-m.tretter@pengutronix.de>
 <20201202133040.1954837-3-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202133040.1954837-3-m.tretter@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 02 Dec 2020 14:30:38 +0100, Michael Tretter wrote:
> Convert the Allegro DVT video IP codec text binding to Yaml.
> 
> Add the converted binding to the MAINTAINERS file.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> - Fix make dt_binding_check warnings
> ---
>  .../bindings/media/allegro,al5e.yaml          | 105 ++++++++++++++++++
>  .../devicetree/bindings/media/allegro.txt     |  43 -------
>  MAINTAINERS                                   |   1 +
>  3 files changed, 106 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allegro,al5e.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/allegro.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
