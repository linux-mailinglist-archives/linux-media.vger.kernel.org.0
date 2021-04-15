Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EF3360FF4
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbhDOQRX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:17:23 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:45005 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhDOQRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:17:23 -0400
Received: by mail-oi1-f176.google.com with SMTP id e66so9518499oif.11;
        Thu, 15 Apr 2021 09:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g9UUN7RgYxjHjT9JtXqaWGYYxyRhaw5q4SuyKDfZ6ek=;
        b=XZfWMa7bAT3JFrU92rnxTsK2c3eQKZVd4yPDt7tF2lFp+3r4m6tBV+XttE06W3IHXO
         AoWFZuldOGAgNhuQapn/fcmrrmthIbsgneoYA1P5GX/GyhOtmt6ZwelzaPKJqNpxOlDx
         m5/UMR0mLzhYPFEqwLH0t1Z7heiS71MFzFDWzFYkT91MIOaUpMBojxwXH32hlfIYW47/
         6mmD4KpUbpPZRB/h3nliFFULrmJGfvazyDmryiSrmdufN6tGCEDOisZmKfHLTKtb/+kZ
         +vZ+i/25zEm7deEi8WwytIY/dezGSyk6F2QbHmhnzZP2OWN9c8a3FH6gcshF8SypUe61
         74yA==
X-Gm-Message-State: AOAM531rEup42QRSr45iR8m/qGGNWxBFbXYUPhbMIyvqHLSWV/dV0Tsh
        aWGmCosJaP+14tGPR1QSoQ==
X-Google-Smtp-Source: ABdhPJzNJxWVs55Q1wP3ChKCv6l4X9x3mXUuNvql+J6KLClI+cT0xQKtpjOG0h1NiIJYB6zqUHKp8A==
X-Received: by 2002:aca:c74a:: with SMTP id x71mr3063497oif.22.1618503418210;
        Thu, 15 Apr 2021 09:16:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 3sm726662otw.58.2021.04.15.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 09:16:57 -0700 (PDT)
Received: (nullmailer pid 1501918 invoked by uid 1000);
        Thu, 15 Apr 2021 16:16:56 -0000
Date:   Thu, 15 Apr 2021 11:16:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jacopo@jmondi.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 29/33] dt-bindings: media: atmel-isc: convert to yaml
Message-ID: <20210415161656.GA1501812@robh.at.kernel.org>
References: <20210413105731.610028-30-eugen.hristev@microchip.com>
 <20210415085530.824638-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415085530.824638-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 15 Apr 2021 11:55:30 +0300, Eugen Hristev wrote:
> Convert the Atmel ISC to yaml binding format.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v4:
> - added '|' at description to maintain line breaks
> 
>  .../devicetree/bindings/media/atmel,isc.yaml  | 115 ++++++++++++++++++
>  .../devicetree/bindings/media/atmel-isc.txt   |  65 ----------
>  2 files changed, 115 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/atmel,isc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
