Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7862B23AFC6
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 23:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgHCVra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 17:47:30 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:35507 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgHCVra (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 17:47:30 -0400
Received: by mail-il1-f194.google.com with SMTP id t18so32472535ilh.2;
        Mon, 03 Aug 2020 14:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NVd/IZHDd4CFaOIYi2ephk8MvBPJAENgkCfWbWcCwNY=;
        b=MwkoZSsbyoVjUbe4pebZfHzzyJTQK2vT0MFc00hP+jNDDk2IoJb01uvIJwjLefxSCs
         MDvJg3qUwRuRWI5hvqr91k8SYc2pzk4MZ5GzhE7wkBkINWx0Em7wbgswOa+VomhgDGwu
         M+lOIaVIKyMEBCo9V1vUqTw8ZYtlU5jrG6/0DRwrt3Dtw3dNo4QNHynKpZt19RIoPHM7
         6enrR6JoKz971rPCzMIaQsJIsRN4zIJTmDCzvN1/yhJqrG1pmjN9x+m77hRv7mnt78wR
         rX2vcpVla4W5mVQGyW+ZBRg8fH01MRadZbsNH67GZAzxozp5wJS61Q3AQUP43EKkb+sK
         LtbA==
X-Gm-Message-State: AOAM5311pimOBA9LtYE90kEMPvR0Cib74hDLA7tVNbJQxQsMCzRtab74
        vDgnZzbc1JLNn3agKh+Z0Q==
X-Google-Smtp-Source: ABdhPJxaf5xAcvcm8UQUsFNG1gCcnAGMc13tqQfHOjpjO6GwgSPQ62o9nJYnPv0wUgZQe3KRxYspeQ==
X-Received: by 2002:a92:1f95:: with SMTP id f21mr1529238ilf.287.1596491249271;
        Mon, 03 Aug 2020 14:47:29 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j81sm11127297iof.13.2020.08.03.14.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 14:47:28 -0700 (PDT)
Received: (nullmailer pid 3194184 invoked by uid 1000);
        Mon, 03 Aug 2020 21:47:28 -0000
Date:   Mon, 3 Aug 2020 15:47:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Santiago Hormazabal <santiagohssl@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 2/3] media: kt0913: device tree binding
Message-ID: <20200803214728.GA3193667@bogus>
References: <20200803020921.64151-1-santiagohssl@gmail.com>
 <20200803020921.64151-3-santiagohssl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803020921.64151-3-santiagohssl@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 02 Aug 2020 23:09:20 -0300, Santiago Hormazabal wrote:
> Document bindings for the kt0913 AM/FM radio tuner.
> 
> Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>
> ---
>  .../bindings/media/i2c/ktm,kt0913.yaml        | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml: $id: relative path/filename doesn't match actual path or filename
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


See https://patchwork.ozlabs.org/patch/1340067

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

