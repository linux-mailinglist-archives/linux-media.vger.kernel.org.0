Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471E43930D4
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 16:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236591AbhE0OZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 10:25:37 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:37560 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236592AbhE0OZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 10:25:35 -0400
Received: by mail-oi1-f169.google.com with SMTP id h9so921848oih.4;
        Thu, 27 May 2021 07:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=FGNgKqA/bFMOA4n56SbxmlyDSXSPW9nmkVeniVpJZRM=;
        b=qmTpyx2MViR2cosdyWOu6ILUlhQOzMjOxoQ+45189gWmtzgQF7U2gIUB5jNIdALjgH
         YIolsOlgk40fRbPThf7pJJ9h3iCnEy+LCPJECMrxLXuZAOKntyErwTQdDv8REtG2DZJy
         d0PWSFmkOsca1eOBv4SjqkUKFQOFZ/t+zE38qCf9qZHGTGvq6VyxY6sZZe0/RMT3uzPL
         gxotlr+5m6pgbtB40J2ceT1MsNNVK1Sr7E/WHlBV7iem03P7O3xadIn3AJc4aDcsOEmK
         q6XqTL3adyQrArQF7qVDVR9o6rjsJ/ttLrV4AZ3vbqkfKrlG+86uxeaYJuMKB5TNaX4O
         40Cg==
X-Gm-Message-State: AOAM531Tbcm8zLzdgfoRsSd1rZiTZlfpycYkhwdaHm3Z6whbKRxrt35X
        aNtdZtGDtKxFeyuyszyp1Q==
X-Google-Smtp-Source: ABdhPJxrNNp/+YwpGLdjErXobTylRFGpfGSqVbHB8ISHnt1mlolCuyi8hMa9aIZZVQ54ZACTg5DlpQ==
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2431741oia.95.1622125441590;
        Thu, 27 May 2021 07:24:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s2sm507148otg.67.2021.05.27.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 07:23:57 -0700 (PDT)
Received: (nullmailer pid 731796 invoked by uid 1000);
        Thu, 27 May 2021 14:23:27 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul.kocialkowski@bootlin.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, mchehab@kernel.org,
        shawnx.tu@intel.com, kernel@puri.sm,
        laurent.pinchart@ideasonboard.com
In-Reply-To: <20210527091221.3335998-3-martin.kepplinger@puri.sm>
References: <20210527091221.3335998-1-martin.kepplinger@puri.sm> <20210527091221.3335998-3-martin.kepplinger@puri.sm>
Subject: Re: [PATCH v1 2/4] dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pixel sensor
Date:   Thu, 27 May 2021 09:23:27 -0500
Message-Id: <1622125407.811816.731795.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021 11:12:19 +0200, Martin Kepplinger wrote:
> Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/i2c/hynix,hi846.yaml       | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml:51:15: [warning] wrong indentation: expected 16 but found 14 (indentation)
./Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml:52:17: [warning] wrong indentation: expected 18 but found 16 (indentation)
./Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml:57:17: [warning] wrong indentation: expected 18 but found 16 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'oneOf': [{'items': [{'const': 1}, {'const': 2}, {'const': 3}, {'const': 4}]}, {'items': [{'const': 1}, {'const': 2}]}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml: ignoring, error in schema: properties: port: properties: endpoint: properties: data-lanes
warning: no schema found in file: ./Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
Documentation/devicetree/bindings/media/i2c/hynix,hi846.example.dt.yaml:0:0: /example-0/i2c/camera@20: failed to match any schema with compatible: ['hynix,hi846']

See https://patchwork.ozlabs.org/patch/1484524

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

