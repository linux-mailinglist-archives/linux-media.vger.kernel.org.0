Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A792BB805
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 22:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730491AbgKTU7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 15:59:01 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45330 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgKTU7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 15:59:01 -0500
Received: by mail-ot1-f65.google.com with SMTP id k3so10000940otp.12;
        Fri, 20 Nov 2020 12:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E+eTvV1tGOwtq1rQTgD6byJC2hOWBwFyaoUcLOPG4kI=;
        b=kGa9Lcb5LUPaFwD6edUYAV5Rzgpj9szH1HD814ginxEyoLGW+MAqu4wsQKsiQu6MZ4
         NYgNk8LS1fVEoMcbwgS6oXPLKlVCNeUSPqKrTiX1szIzsik3C1EliPB5qyraRFpHa5Xn
         G3m0U5A1avVV9YiUown2pSgG6iFjDiWta/HVm9hvFp3/q6KmpSxr8RYjEUGdVEYz62I/
         SDbLHu7/l4QSiV1CAw2q2JuNd/rSc8YQydAIk6RSWauhqqkbPBvmEPttlT9JMEa3Il/F
         dPWSarzhlY34HJd9ML2LgjL5iRNVLtiKz8wJgoBfJco2/hsZMXkeIHqVyq7zKlJNBKnE
         JOOQ==
X-Gm-Message-State: AOAM531qu7NHIyXbCCJoyhuiV28Ue+9F4hF30mcATvt6RIaVrwfjNelm
        /CZBErm9KGcN2UPAv8USPntJLFRftw==
X-Google-Smtp-Source: ABdhPJy0vQQNAnVcAar+wRVkpy8jiPnlJ69OtFNb8/H5LuYPjmE2JBgCx0QWLHdF8aK8a18ZO2eEUw==
X-Received: by 2002:a9d:27e8:: with SMTP id c95mr15233201otb.262.1605905940016;
        Fri, 20 Nov 2020 12:59:00 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c6sm2225855oif.48.2020.11.20.12.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 12:58:59 -0800 (PST)
Received: (nullmailer pid 1729167 invoked by uid 1000);
        Fri, 20 Nov 2020 20:58:58 -0000
Date:   Fri, 20 Nov 2020 14:58:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, robh+dt@kernel.org,
        mchehab@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH 1/2] dt-bindings: media: Add bindings for imx334
Message-ID: <20201120205858.GA1722419@robh.at.kernel.org>
References: <20201120142803.308-1-martinax.krasteva@linux.intel.com>
 <20201120142803.308-2-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120142803.308-2-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 20 Nov 2020 14:28:02 +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx334 sensor driver.
> - Add MAINTAINERS entry for Sony imx334 binding documentation.
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 59 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml:34:15: [warning] wrong indentation: expected 12 but found 14 (indentation)
./Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml:36:15: [warning] wrong indentation: expected 12 but found 14 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml


See https://patchwork.ozlabs.org/patch/1403740

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

