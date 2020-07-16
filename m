Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C399B222639
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 16:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgGPOvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 10:51:32 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:47000 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbgGPOva (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 10:51:30 -0400
Received: by mail-io1-f65.google.com with SMTP id a12so6258616ion.13;
        Thu, 16 Jul 2020 07:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ngsKTcylKTGb0RZyxhVMT1Cu62qS8uD1lZ+51aCDu50=;
        b=mttiLx5LSyL5XeAB9tOfS0jXtAw4WdjsRO2bzaQelnL2RUuVAawyIBKYg7a2bWfZm8
         z4BmO9Yw8dm0OAwrjYb22+9kGzl/zdLzTRjM0A3egH5zZmavSPwR2Snb9Kjrho055Mrz
         AfXJogSJAy9cdEe3ycy/de05pzrn18guef41mXW00npUlLRSea1cSoNhgglEPK0O5ua4
         Eeh9QRQGCuYgAHaS9aoRQPm8khWpKVc4E7XyPSgm3PPnNG98YljaI0OE09KnKpMSLVjQ
         6mzNvZ0XCpel7xuk7IYb/HBFaCJsHUV7Rpf9PtBlwA23BkbVPB5v/8G0FGEx1KMEUUpz
         oJeQ==
X-Gm-Message-State: AOAM531+F8+PeByLERlK0tJaUVBVx8k8CFoDI5FttPY0uaf4pXEoQrXH
        hqhwunlRuWmheJVad0U1yA==
X-Google-Smtp-Source: ABdhPJzb+SG+uyotUL0djsFcO+e+8VskLOvVBatERU7NBC7dJOUzWcBes5gfkVXIU5JUFblimdb4cQ==
X-Received: by 2002:a02:9182:: with SMTP id p2mr5723913jag.69.1594911088742;
        Thu, 16 Jul 2020 07:51:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o67sm2728012ila.25.2020.07.16.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:51:28 -0700 (PDT)
Received: (nullmailer pid 2312016 invoked by uid 1000);
        Thu, 16 Jul 2020 14:51:25 -0000
Date:   Thu, 16 Jul 2020 08:51:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
        mchehab@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: media: ov5640: Convert to json-schema
Message-ID: <20200716145125.GA2311510@bogus>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
 <20200715140951.90753-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715140951.90753-2-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 15 Jul 2020 16:09:44 +0200, Jacopo Mondi wrote:
> Convert the ov5640 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Hi Steve,
>   I've added myself as maintainer in the bindings, with your ack
> I would be happy to add myself as maintainer or reviewer for this driver
> in MAINTAINERS, as I've recently been looking after this driver, mostly
> for the MIPI CSI-2 interface part.
> 
> Thanks
>   j
> 
> ---
>  .../devicetree/bindings/media/i2c/ov5640.txt  |  92 ---------
>  .../devicetree/bindings/media/i2c/ov5640.yaml | 181 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 182 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'DOVDD-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'AVDD-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/ti,cal.example.dt.yaml: camera-sensor@3c: 'DVDD-supply' is a required property


See https://patchwork.ozlabs.org/patch/1329566

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

