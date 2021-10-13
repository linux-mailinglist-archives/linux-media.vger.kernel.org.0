Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C196A42C8E0
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236782AbhJMSl6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 14:41:58 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:42942 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237102AbhJMSl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 14:41:58 -0400
Received: by mail-oi1-f172.google.com with SMTP id g125so5052461oif.9;
        Wed, 13 Oct 2021 11:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=0bcanfGxoLogq0JhLYOPhHE781Jyc21NU5mcCAQNrlU=;
        b=7EALcIvlECP4yjaIXaXRPCBP6jfyZBJZU2S/aa0gpGTztvu6wH9NypLOdSSrZQvoHG
         dvlc3i+SY3ParV7gm4G//UK+3OkCMei1r6I4yaKqoiuH/Yn3pXKqDtARVBCIgH/SDswW
         /pmvSlsU3XEqO9RzwwDX4kSbLjHcqWWmZj9C8gzd81pMdFyeXh65+j7+RXtxqne2nr2I
         2klAj2PI1ael3vmHBs7XEES3NitjNyS+E4MZcLxlYOT5th2XCb8z/+pioiZNx1cInvFg
         1EhuYrs87DFM6+PA006aqXuEi2HKJ4mb65DO7EGlW2DqkyNaEkYA9XYyAV2j81ZVYzFs
         AUlA==
X-Gm-Message-State: AOAM532UVbnhru0pDoOrbBA0WH/IsPAwBTDR2B1JMwG1usjxRtYllcIR
        0ivczPsE1d3Cm4thF00Pjw==
X-Google-Smtp-Source: ABdhPJzXKH9fOExS/HMCZV50q+nGNRZVhRaYlp4QaaPs/+PXAtOBFOUld5GEMJawQuVpLtS0648dtA==
X-Received: by 2002:aca:4b84:: with SMTP id y126mr9438026oia.127.1634150394216;
        Wed, 13 Oct 2021 11:39:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 64sm71217otc.18.2021.10.13.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:39:53 -0700 (PDT)
Received: (nullmailer pid 1324763 invoked by uid 1000);
        Wed, 13 Oct 2021 18:39:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     shawnguo@kernel.org, aisheng.dong@nxp.com, s.hauer@pengutronix.de,
        robh+dt@kernel.org, festevam@gmail.com, hverkuil-cisco@xs4all.nl,
        linux-imx@nxp.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <4d5e00bda369a823c55ffcc10863f29179426557.1634095309.git.ming.qian@nxp.com>
References: <cover.1634095309.git.ming.qian@nxp.com> <4d5e00bda369a823c55ffcc10863f29179426557.1634095309.git.ming.qian@nxp.com>
Subject: Re: [PATCH v10 01/13] dt-bindings: media: amphion: add amphion video codec bindings
Date:   Wed, 13 Oct 2021 13:39:52 -0500
Message-Id: <1634150392.524588.1324762.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 Oct 2021 16:27:17 +0800, Ming Qian wrote:
> Add devicetree binding documentation for amphion
> Video Processing Unit IP presents on NXP i.MX8Q
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/amphion,vpu.yaml           | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amphion,vpu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amphion,vpu.yaml: patternProperties:^vpu_core@[0-9a-f]+$:properties:compatible:oneOf: [{'const': 'nxp,imx8q-vpu-decoder'}, {'const': 'nxp,imx8q-vpu-encoder'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amphion,vpu.yaml: properties:compatible:oneOf: [{'const': 'nxp,imx8qm-vpu'}, {'const': 'nxp,imx8qxp-vpu'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amphion,vpu.yaml: ignoring, error in schema: patternProperties: ^vpu_core@[0-9a-f]+$: properties: compatible: oneOf
warning: no schema found in file: ./Documentation/devicetree/bindings/media/amphion,vpu.yaml
Documentation/devicetree/bindings/media/amphion,vpu.example.dt.yaml:0:0: /example-0/vpu@2c000000: failed to match any schema with compatible: ['nxp,imx8qm-vpu']
Documentation/devicetree/bindings/media/amphion,vpu.example.dt.yaml:0:0: /example-0/vpu@2c000000/vpu_core@2d080000: failed to match any schema with compatible: ['nxp,imx8q-vpu-decoder']
Documentation/devicetree/bindings/media/amphion,vpu.example.dt.yaml:0:0: /example-0/vpu@2c000000/vpu_core@2d090000: failed to match any schema with compatible: ['nxp,imx8q-vpu-encoder']
Documentation/devicetree/bindings/media/amphion,vpu.example.dt.yaml:0:0: /example-0/vpu@2c000000/vpu_core@2d0a0000: failed to match any schema with compatible: ['nxp,imx8q-vpu-encoder']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1540273

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

