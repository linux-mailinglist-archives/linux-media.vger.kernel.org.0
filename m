Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3777E410008
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 21:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344883AbhIQTvs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 15:51:48 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:37433 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241886AbhIQTuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 15:50:25 -0400
Received: by mail-oi1-f178.google.com with SMTP id w206so3843406oiw.4;
        Fri, 17 Sep 2021 12:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=pE+4bnzWEy5M45GFHsCRmVHyw6zJKyXPFQ+Hy8/7q2k=;
        b=HnzsyYoxMNpa7A4m94LMoDIoTEZosSZei7GzcphUyFgmkEu2BZrjO9rDTALeKyJbFh
         yr9+nvc41qh/xQvtk2Ac9Ib9hmnb0sruypwdpd1IGS5NHvN0CbkvBl6esodlkuXk0Q8N
         e7yOCuf4cMpd6EMhFfjkoVdKMYIscy1nmREpnCGepL2JHLMamljGB67l1MeQEnAxMs4N
         /3WJ9J7PtFpqshuIYmLicqZt5YIV6tPD096rYScVhwF/QNJ8eu7ZopCtkmSBG0gdaQVi
         EyNIMZR2QnIjTb+ZlMJhMdygk3/CV1/aUJ2xZdbkztnL/pvqR5qCNb7jbi41RC13d0NG
         gsdA==
X-Gm-Message-State: AOAM531Uf/qmP0fdWB/28k2TLwzAvct9/ojVDZ13XzUgIljuz2g+DJxG
        QyVjO91ONWOrffThyUwxDA==
X-Google-Smtp-Source: ABdhPJw33RfJFXipWnsomu5OMJbVFalUdObkurEitpoBWQS/R7QjuAoRiC8fBREZ7YS1JypZmiMHIw==
X-Received: by 2002:a05:6808:bc2:: with SMTP id o2mr5488000oik.73.1631908142931;
        Fri, 17 Sep 2021 12:49:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v11sm1805276oto.22.2021.09.17.12.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 12:49:01 -0700 (PDT)
Received: (nullmailer pid 2025335 invoked by uid 1000);
        Fri, 17 Sep 2021 19:48:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Bailon <abailon@baylibre.com>
Cc:     bjorn.andersson@linaro.org, daniel@ffwll.ch, ohad@wizery.com,
        linux-kernel@vger.kernel.org, tzimmermann@suse.de,
        robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, airlied@linux.ie,
        gpain@baylibre.com, mathieu.poirier@linaro.org,
        christian.koenig@amd.com, devicetree@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, khilman@baylibre.com,
        linux-media@vger.kernel.org, mripard@kernel.org,
        matthias.bgg@gmail.com, linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, sumit.semwal@linaro.org,
        linux-remoteproc@vger.kernel.org
In-Reply-To: <20210917125945.620097-2-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com> <20210917125945.620097-2-abailon@baylibre.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: Add bidings for mtk,apu-drm
Date:   Fri, 17 Sep 2021 14:48:54 -0500
Message-Id: <1631908134.342766.2025334.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 17 Sep 2021 14:59:42 +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
./Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/mtk,apu-drm.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dts:19.15-23.11: Warning (unit_address_vs_reg): /example-0/apu@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dt.yaml:0:0: /example-0/apu@0: failed to match any schema with compatible: ['mediatek,apu-drm']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1529388

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

