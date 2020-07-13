Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C118921DAF2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 17:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730263AbgGMP6R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 11:58:17 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40788 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGMP6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 11:58:16 -0400
Received: by mail-io1-f66.google.com with SMTP id l17so2497460iok.7;
        Mon, 13 Jul 2020 08:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fy0QyknEQIFDih/wXqka2gt2ibIDjdhI1UxiYacbQUo=;
        b=t2+6/vkBD9ylOLfHd3E8RT34rzymon2+/A73msAHYwsBfleeo2ElBP4SWHZ7oQ9C2c
         6lRevdeOrugbjnILY4ngZRHhcADe6igxMJ6ZP7wCjnKAObChFDwnkKfDtjrc39N/I9+w
         IlInpQbe35WuqwxYBHkWpCHqePiJO7AAwE7PqmsKdeZ7iYxl8VCRR10GvsWtg+j3Si7N
         hFeUV0mL3IV7OJIx03eGvT9lMm1S5WL1x6o9FgMvROeL3i8inVpfRg9+SU9tuXQzYmzm
         RIZDbNX8P2tNoVRlg5ndHDR+hq1jn15Xa+kZPUfTV1pqSgfQ4T3NdnmQbsLTLDOAe6WF
         VNFg==
X-Gm-Message-State: AOAM533oNq/V6uOI5S8YV4r4ilP8HLDSgyQmVXvId4fASsDnTHhBOkDZ
        vihNDlwG3+fYDCAve+50j3FxIu4X7Q==
X-Google-Smtp-Source: ABdhPJxPue7aaZXd+HwUAIdtuoA4XS1gpiRIWhi/rVmK8wNvO6OGXfiIvga/INnnNbr20nzGEyhgTw==
X-Received: by 2002:a05:6638:519:: with SMTP id i25mr715965jar.99.1594655895435;
        Mon, 13 Jul 2020 08:58:15 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n1sm8525392ilo.68.2020.07.13.08.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:58:14 -0700 (PDT)
Received: (nullmailer pid 291615 invoked by uid 1000);
        Mon, 13 Jul 2020 15:58:13 -0000
Date:   Mon, 13 Jul 2020 09:58:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     roman.kovalivskyi@globallogic.com, robh+dt@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        devicetree@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com
Subject: Re: [PATCH 1/2] dt-bindings: media: ov5647: Convert to json-schema
Message-ID: <20200713155813.GA291484@bogus>
References: <20200618134045.151532-1-jacopo@jmondi.org>
 <20200618134045.151532-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618134045.151532-2-jacopo@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 18 Jun 2020 15:40:44 +0200, Jacopo Mondi wrote:
> Convert the ov5647 image sensor bindings to DT schema.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
>  .../devicetree/bindings/media/i2c/ov5647.yaml | 82 +++++++++++++++++++
>  2 files changed, 82 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
