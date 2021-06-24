Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129533B38A7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 23:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhFXV1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 17:27:54 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:38871 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbhFXV1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 17:27:54 -0400
Received: by mail-io1-f52.google.com with SMTP id k11so10082094ioa.5;
        Thu, 24 Jun 2021 14:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h3KGBVg9Bjr/Ehocz0Vx1twbJ/DnigCgiO0gIuVggrE=;
        b=CXJWt0WLHydK+I6K6oQYY4aSeGa1QHQq/gH7WzpSq5oompfMYr/X2Q2QsKYurQoF/T
         sbyChUev5nrwWDm2OCfzCOud1i7Sl63oQoKYQP5lyMb4wygteTNMeiCL4p1HWK4RkcNa
         qczuEKc41Q3Q99Cw93htNB8u/IBq2lKkwDoQW6BkRwAEKrE2Ig/i96kQyj5vNuZZUzIu
         RTY+qQq5qC/XizVfKddd3rUTL/I/6WxTo6ylc1BTx3Cg+LQRfOmip8PeiWT9k5qYphpI
         JnTt4vjVt63NsGZNd5zh/vzZ1wIey1Yr27lLi8ViQkYpGDTugLb0Kx/26VpD1vxj5S7I
         ZpJA==
X-Gm-Message-State: AOAM531k7rgW1h7Mt64OSZfQgVUrzjCzBjEYZ0DKSI0VrlRVAxmy0tan
        XbDI0zFg1Es71xX///A6Eg==
X-Google-Smtp-Source: ABdhPJyOtcBoaQqqxCuELdqmYjHLybe1mnMDiYdew1Dp3ar7mihdMSnJ+PwQNcngFwMiIdUNIO1kAw==
X-Received: by 2002:a02:a710:: with SMTP id k16mr6501888jam.46.1624569934724;
        Thu, 24 Jun 2021 14:25:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n17sm2519580ilt.16.2021.06.24.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:25:34 -0700 (PDT)
Received: (nullmailer pid 2012979 invoked by uid 1000);
        Thu, 24 Jun 2021 21:25:32 -0000
Date:   Thu, 24 Jun 2021 15:25:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 1/2] media: dt-bindings: Add Intersil ISL79987 DT
 bindings
Message-ID: <20210624212532.GA2012946@robh.at.kernel.org>
References: <20210617092538.1109021-1-m.tretter@pengutronix.de>
 <20210617092538.1109021-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617092538.1109021-2-m.tretter@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Jun 2021 11:25:37 +0200, Michael Tretter wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add bindings for the Intersil ISL79987 analog to MIPI CSI-2 decoder.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-media@vger.kernel.org
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v3:
> 
> - rename pd-gpios property to powerdown-gpios
> - reference graph.yaml for ports/port properties
> - remove reference to video-interfaces.txt
> - remove unnecessary description of ports property
> 
> v2:
> 
> - convert binding to yaml
> - change description to match only isl79987
> - replace num-inputs property with multiple ports
> - add reset gpio
> ---
>  .../bindings/media/i2c/isil,isl79987.yaml     | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
