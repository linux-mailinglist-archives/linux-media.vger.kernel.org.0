Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0AE21E437
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 02:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgGNACO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 20:02:14 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45935 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNACN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 20:02:13 -0400
Received: by mail-il1-f194.google.com with SMTP id o3so12753261ilo.12;
        Mon, 13 Jul 2020 17:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CM3/1+/CCodDq+1tX+3x8EScRX+Tc9vLMTGUeIZrkys=;
        b=je03lwL+0Ct+P3XwJeaf/ipp64pUgjKnsr4CJ6ifUYWeJBRbw1aLbriUtzNpeuO4l5
         +KJq7vSh8+Dvig6R9tbfa1PhMLrEukugD1g0KLSkui1pS8z/oSIc25yUmnvUclNH3J15
         UnGZ1jsQyaqDF5DYBTa4MJMzVtAqS5pHbNOo5P47zS7sXM3daJOHrb4gZXIPjEzKTq2n
         rOeP0TpaP0bVKtnE+WWmhZrrCbcbbde/x533m6mh13X+7aZvjRFdsqf+Ommmys7HzT8a
         DZ3BXDTconCtRIGEe925tlXWBzcC7VCvcLERqLuXezg+ueHN1LoEFVe/uqj3hHAascdm
         8zCA==
X-Gm-Message-State: AOAM532CpGPu8ZK4kQvF7hbWj+Fwh6JOs60Ys8ovLB0sis8uDSMmTs1/
        6bSHNaVzqRjVgPJRBEyN4w==
X-Google-Smtp-Source: ABdhPJx7VwEcRKUFqmIipqOIJPBzGL+8GOgvRO8yzAQgo/fzqmEGvzVaBzIQRa8Oym9l1fkhbdErIw==
X-Received: by 2002:a92:794f:: with SMTP id u76mr2098129ilc.215.1594684932797;
        Mon, 13 Jul 2020 17:02:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k3sm8963111ils.8.2020.07.13.17.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 17:02:12 -0700 (PDT)
Received: (nullmailer pid 965853 invoked by uid 1000);
        Tue, 14 Jul 2020 00:02:11 -0000
Date:   Mon, 13 Jul 2020 18:02:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: media: renesas, vsp1: Convert
 binding to YAML
Message-ID: <20200714000211.GA965823@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-8-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 21 Jun 2020 03:47:33 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car VSP1 text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Simplify comments on compatible strings
> - Update MAINTAINERS
> ---
>  .../bindings/media/renesas,vsp1.txt           | 30 -------
>  .../bindings/media/renesas,vsp1.yaml          | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 84 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
