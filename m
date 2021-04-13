Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A8235E400
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 18:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345507AbhDMQcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 12:32:23 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46796 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243383AbhDMQcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 12:32:23 -0400
Received: by mail-ot1-f47.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso14731947otb.13;
        Tue, 13 Apr 2021 09:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FgJVcO2dd+RkqjT//6s4N7I0j+1YI7pMWiSGmJZmAyg=;
        b=ijh2vTNZjc1Yo2uRmTetNKSQ2UA5vHkGTge1NnGJ0hAAt8TAkqk/iWCVCNV6HQVFbw
         xihsloltV7B7VsQhIR5KGq0F8lcTRjfi08+Xt+MB8ifdbAPpxxJNsqFTgfmZuyKk4Vqe
         YzUdJ1Usl8MiNpK91kMwfizJtDKNP3ZHac6wOqqLFTSGTaXmVkOyRSSNnXdNPKleHLEC
         Vsw919KUQIceeCUX3Ftb/CSe2Ot2RtRhC+i6o+AQ204amE6UpJzIx9yyVpO0riuIHy/M
         BCkb/bYZfakw+84Ghs3+DTROIRBuBTmPeqVeGMYjB7fHV+1lFkCzotjWVxUplIqJ3Fu/
         0JrA==
X-Gm-Message-State: AOAM530QfcP4r4Rb5mtxXFp2PbaQ1iliyLg0G83JZEXoTvkWZvgXUOpt
        PebbzSH+MG6HCfaYkK5pIg==
X-Google-Smtp-Source: ABdhPJyjGSEis2urWuEv96+x6uW3CqIzXP3QCiIPa8ysupm7o+ieoxENCqL5Ewotnm0/D/se+hcB1w==
X-Received: by 2002:a9d:68c1:: with SMTP id i1mr29115384oto.169.1618331522917;
        Tue, 13 Apr 2021 09:32:02 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e2sm725311otk.70.2021.04.13.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:32:01 -0700 (PDT)
Received: (nullmailer pid 1791125 invoked by uid 1000);
        Tue, 13 Apr 2021 16:32:00 -0000
Date:   Tue, 13 Apr 2021 11:32:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     jacopo@jmondi.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 29/33] dt-bindings: media: atmel-isc: convert to yaml
Message-ID: <20210413163200.GA1791073@robh.at.kernel.org>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
 <20210413105731.610028-30-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413105731.610028-30-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 13 Apr 2021 13:57:27 +0300, Eugen Hristev wrote:
> Convert the Atmel ISC to yaml binding format.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  .../devicetree/bindings/media/atmel,isc.yaml  | 115 ++++++++++++++++++
>  .../devicetree/bindings/media/atmel-isc.txt   |  65 ----------
>  2 files changed, 115 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/atmel,isc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
