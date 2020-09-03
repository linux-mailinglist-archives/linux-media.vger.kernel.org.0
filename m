Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 281B325C63F
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgICQLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:11:44 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46571 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgICQLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:11:43 -0400
Received: by mail-io1-f67.google.com with SMTP id d18so3377383iop.13;
        Thu, 03 Sep 2020 09:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wwAtmIYCfsZjVLCvwVC7Xhzy6s7aZOlVxL6QB4+Yi5k=;
        b=A4cCWTkQz29jfeIUM3QwyLwNxs/9kF/mvIDqGXCOoYiuSZaheUjBUyX9nHnWQOGQZl
         9xBKo5dEyEaD6jPVB0TJUaIKXD+0Yy8wuiBjWrSjbsZf9bLMXDd8SH1y3bXvquKdWUm/
         2XDYh44vgU+8XHJf6fCD8DhjCToSXuAPOFUled8lUqhdwypqAAzCOUvH9tQvIJUz9s36
         LKVP+hjBe3kp/NmHVBux9K0KfG/DdCJ/OwFuXIvLwEbv5vxvHM1x6dEVuj07dk9mal/F
         Vv+OTY512jFA7wk8irQ8aJPxTOJjbXRrtU+aCDEw+4Sv4Abp7WsmjLjAN6eCd7DUHvMI
         1H0g==
X-Gm-Message-State: AOAM530ykPWHOAyYmbc0CNxA74vXn6uWtKIoeplYTjArfLqiqzpEBZFe
        p3aGP5iXARs57iGna3dTOBDM+Ux3rk/M
X-Google-Smtp-Source: ABdhPJxo78SA6s4hFSulbD3Fny4h3rqT8K/4W54tvoBiKb+b3JUFnnnse9llubLg6JPmUFSofngNVw==
X-Received: by 2002:a6b:590c:: with SMTP id n12mr3762308iob.25.1599149502036;
        Thu, 03 Sep 2020 09:11:42 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id s16sm1515486iow.47.2020.09.03.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:11:41 -0700 (PDT)
Received: (nullmailer pid 2872583 invoked by uid 1000);
        Thu, 03 Sep 2020 16:11:40 -0000
Date:   Thu, 3 Sep 2020 10:11:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Santiago Hormazabal <santiagohssl@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: kt0913: device tree binding
Message-ID: <20200903161140.GA2872222@bogus>
References: <20200831220601.20794-1-santiagohssl@gmail.com>
 <20200831220601.20794-4-santiagohssl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831220601.20794-4-santiagohssl@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 31 Aug 2020 19:06:01 -0300, Santiago Hormazabal wrote:
> Document bindings for the kt0913 AM/FM radio tuner.
> 
> Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>
> ---
>  .../bindings/media/i2c/ktm,kt0913.yaml        | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

./Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/i2c/ktm,kt0913.yaml#
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dts:22.17-30: Warning (reg_format): /example-0/i2c/fm-am-tuner@35:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dts:19.13-26.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dts:19.13-26.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dts:20.36-25.15: Warning (avoid_default_addr_size): /example-0/i2c/fm-am-tuner@35: Relying on default #address-cells value
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dts:20.36-25.15: Warning (avoid_default_addr_size): /example-0/i2c/fm-am-tuner@35: Relying on default #size-cells value
Documentation/devicetree/bindings/media/i2c/ktm,kt0913.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'


See https://patchwork.ozlabs.org/patch/1354644

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

