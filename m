Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758463B929F
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 16:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhGAOFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 10:05:20 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:34572 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbhGAOFU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 10:05:20 -0400
Received: by mail-io1-f46.google.com with SMTP id g22so7682686iom.1;
        Thu, 01 Jul 2021 07:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=THjpgrJovveE0NhsgOiUBUqHrg+mADZu3fJVwSRkCSc=;
        b=o2ZzcFV81zc+nuN757TT6OGC16F/NfaF5W5J7xjGhO6NSQ+bIzJUaK9jy6pLZUleLI
         BVnmhnqtUKMoZ3tpczrG+Pa8Fk8YpKYBT/zkRGNQ26vNAMtjlg3YPQA/tiiY5fQrmuHG
         XQ6WyjKWRtEWS42nnjIW655dPc5YS/z3yXMnoWsDb8Enj8Rpz+l81AdkRwJOJpNbzCxS
         Q/s0asRjks3YYqr6niLBoq/9DAyDXf9DChRQzWCEOLPeLh9Wmx4FEh0+T0KHh9oHR6Jj
         73sGLe+ND8EbZTaN7dvifPBbOOpiBquFooTLI8wckddqwaWzrKXdqMb8dnbXdoQXj7Im
         1SlQ==
X-Gm-Message-State: AOAM5334vcq6weUz6U9kvcury6/P10Dc+T2FdIrFPwE1LueNRUIokq8B
        iFWJqJgbIzphvl+RQG9IUQ==
X-Google-Smtp-Source: ABdhPJzJ7Low6+obMGZc22tdSQJCTAnBXTetdd/zkTKltPCjJi63xgkwIOo8xZkxCniERctV+IGf2w==
X-Received: by 2002:a6b:e911:: with SMTP id u17mr12551013iof.54.1625148169359;
        Thu, 01 Jul 2021 07:02:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h10sm29866ili.27.2021.07.01.07.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:02:48 -0700 (PDT)
Received: (nullmailer pid 2278689 invoked by uid 1000);
        Thu, 01 Jul 2021 14:02:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210624192200.22559-11-p.yadav@ti.com>
References: <20210624192200.22559-1-p.yadav@ti.com> <20210624192200.22559-11-p.yadav@ti.com>
Subject: Re: [PATCH v3 10/11] media: dt-bindings: Add DT bindings for TI J721E CSI2RX driver
Date:   Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.481805.2278688.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 25 Jun 2021 00:51:59 +0530, Pratyush Yadav wrote:
> TI's J721E uses the Cadence CSI2RX and DPHY peripherals to facilitate
> capture over a CSI-2 bus. The TI CSI2RX platform driver glues all the
> parts together.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Rename to ti,j721e-csi2rx.yaml
> - Add an entry in MAINTAINERS.
> - Add a description for the binding.
> - Change compatible to ti,j721e-csi2rx to make it SoC specific.
> - Remove description from dmas, reg, power-domains.
> - Remove a limit of 2 from #address-cells and #size-cells.
> - Fix add ^ to csi-bridge subnode regex.
> - Make ranges mandatory.
> - Add unit address in example.
> - Add a reference to cdns,csi2rx in csi-bridge subnode.
> - Expand the example to include the csi-bridge subnode as well.
> - Re-order subject prefixes.
> 
>  .../bindings/media/ti,j721e-csi2rx.yaml       | 101 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/media/cdns,csi2rx.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/ti,j721e-csi2rx.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/media/cdns,csi2rx.yaml'
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/ti,j721e-csi2rx.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1496774

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

