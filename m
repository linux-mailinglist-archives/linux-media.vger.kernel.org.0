Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4182A362845
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 21:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240882AbhDPTH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 15:07:29 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:40914 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240736AbhDPTH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 15:07:27 -0400
Received: by mail-oi1-f171.google.com with SMTP id u16so11567376oiu.7;
        Fri, 16 Apr 2021 12:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BBFkQ629h7xIRwlWLoPS+dy/4UkzfVezsxJAVFwUYdI=;
        b=VdjJjP5/tZFJKd+Z3zdbpwGfZ7Ls8CydcbLTMZ2QOU3x+dz1TMrfwuMEShuJWuwIhr
         v7uC+2hDZyLKSv5PFb1S3Cp72rRDk8b5wbQEBciUNKu/mIXMMKfKcv15gaaEeSgsrSK+
         aIvAd0pc4ZPyXuj5CJrEmISWG4pDD0+eqs9p5ycmilWshOL8IY5P/Py0249LeoXrpyTR
         6/ixJAhIicBspA/cXI/lJ1NoH9edZa7w+fhl1NaKVafmin7i8Tj3iuY9+bYuendrC9a8
         iuuUMUXtsOZu8xz0+XbMG9exl399SYwmpIdnML0MGkZCuV0GqbL66MUUGxMYXdSgfe76
         S2bA==
X-Gm-Message-State: AOAM531KRCH03hVgWdHABFOPI+j76mHSjgcNKIE2B/dN5nKapgyflAdx
        m7zTCb5wLvWK8e3ESwIDig==
X-Google-Smtp-Source: ABdhPJwcC+/tEYWEise6b91vXy+K0SIcPnT36dzY2+c3c3pAvO4kUmMPm51Fxo6xRWTja+VJ/8snnQ==
X-Received: by 2002:aca:4bd6:: with SMTP id y205mr7674118oia.77.1618600021043;
        Fri, 16 Apr 2021 12:07:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z30sm1532566ota.77.2021.04.16.12.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 12:06:59 -0700 (PDT)
Received: (nullmailer pid 3769906 invoked by uid 1000);
        Fri, 16 Apr 2021 19:06:58 -0000
Date:   Fri, 16 Apr 2021 14:06:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        jacopo@jmondi.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 30/33] dt-bindings: media: add microchip, xisc device
 bindings
Message-ID: <20210416190658.GA3769824@robh.at.kernel.org>
References: <20210415085846.824796-1-eugen.hristev@microchip.com>
 <20210415184500.868264-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415184500.868264-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 15 Apr 2021 21:45:00 +0300, Eugen Hristev wrote:
> Add bindings for the Microchip eXtended Image Sensor Controller.
> Based on the atmel,isc.yaml binding.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v5:
> - fixed license clause to add BSD-2
> Changes in v4:
> - added '|' at description to preserve line breaks
> 
>  .../bindings/media/microchip,xisc.yaml        | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,xisc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
