Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B492B8684
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 22:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgKRVVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 16:21:38 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33540 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgKRVVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 16:21:36 -0500
Received: by mail-oi1-f195.google.com with SMTP id k26so3890670oiw.0;
        Wed, 18 Nov 2020 13:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ss0uXL2h5hvFP3EZBj3yPcEtBcUi82HRGtXChv/G4cE=;
        b=GMpiwoz0gTCNaDPtti8VWtUNbB/SuhXQG1lRJaBg+5h8RouMndVovtods0LCxXC+7S
         fyD2u8RajNfgsQCEODApoNPkNAQmbnwDUnGjGrNxFJ6hqSincONUPvQY4+qBPRzQMOZg
         AGINSeZs+RDfAOmjV9zIaGY8rKrpG//AJXwpYTV0ZVfv02Bjv8QRKaK9VPYaSfNU3kdm
         dcIoyvo4ogFDkqRJM/m08eNzsHT/TVd6PQo5f8lZ1Xekd1MuMIsKzgf0tI/H3UvdnETe
         XqRV3u4cvIiwymT7ZwYiCiSDxRb/5mUNuhp4Ps/zRgEJfKYhrcsqdAGezLs8hjY/9hCI
         Lrew==
X-Gm-Message-State: AOAM533FE+FmuWE5idmnYyd2FJIpPlsbe3Ai/12QiBXirpPOKvj+7gtv
        mxmygAwGVOeF4jaBoD8hiQ==
X-Google-Smtp-Source: ABdhPJxxTBYvftWskecODoDjJ4ukv9OAObOfUYCvBisilnIt0kN6iy3jVW5cH+JoiiwCQRORHbp4sg==
X-Received: by 2002:aca:ba42:: with SMTP id k63mr706654oif.111.1605734495634;
        Wed, 18 Nov 2020 13:21:35 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y18sm6915392ooj.20.2020.11.18.13.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:21:34 -0800 (PST)
Received: (nullmailer pid 1836565 invoked by uid 1000);
        Wed, 18 Nov 2020 21:21:33 -0000
Date:   Wed, 18 Nov 2020 15:21:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wendy Liang <wendy.liang@xilinx.com>
Cc:     gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, tejas.patel@xilinx.com,
        dragan.cvetic@xilinx.com, arnd@arndb.de, derek.kiernan@xilinx.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, manish.narani@xilinx.com,
        michal.simek@xilinx.com, linux-media@vger.kernel.org,
        rajan.vaja@xilinx.com, robh+dt@kernel.org, ravi.patel@xilinx.com
Subject: Re: [PATCH 1/9] dt-binding: soc: xilinx: ai-engine: Add AI engine
 binding
Message-ID: <20201118212133.GA1836326@bogus>
References: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
 <1605686780-17886-2-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605686780-17886-2-git-send-email-wendy.liang@xilinx.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 18 Nov 2020 00:06:12 -0800, Wendy Liang wrote:
> Xilinx AI engine array can be partitioned statically for different
> applications. In the device tree, there will be device node for the AI
> engine device, and device nodes for the statically configured AI engine
> partitions. Each of the statically configured partition has a partition
> ID in the system.
> 
> Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> ---
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml


See https://patchwork.ozlabs.org/patch/1402008

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

