Return-Path: <linux-media+bounces-1986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1510E80A76E
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4B9F1F2142A
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EA331A8B;
	Fri,  8 Dec 2023 15:30:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F66210F9;
	Fri,  8 Dec 2023 07:30:03 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-59093f6c94aso228813eaf.0;
        Fri, 08 Dec 2023 07:30:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049403; x=1702654203;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qWUtRlRgWAGpwyicQtlpc3A9ZxmD2xdBC2WwR+TAd8=;
        b=Aj2B6j41lKZpWppUOI+yVlscBGWmfKpizbwXg+N25s4AYOaYPQ8AasoK+HhgZMkcCe
         wMkjn5DnP5cbPNRf6TTNeL1PY993ae+u7GUY07td482ie7CXq8fVuBpePrzVtwnhbjrL
         XzwnI3x1pYnt5OlgN7NAOWz5XBlGxy+ojzTg0uuKaM2Bfd8AFZeoe2zeTaW1Hm18lTYt
         X5BKQha8PXtCCjxwEGAf6WtZgvrhTInRvJCpA2eVaA4XlBSM7dpLDx4YlrOROIpbPtQQ
         o2gHXSLUCqeLeBcl6fAajVyBmUXDH+y44B79nP9JzeabihDPH8LN3WNr9a89EvNZ9+kn
         CVLA==
X-Gm-Message-State: AOJu0Yz3+IFQFj7ghX+noaZNY6EUPRBQB7iosxpzmn7HV3qZLyGZ1PKS
	ndHden1UZXANFjag/Qf+XA==
X-Google-Smtp-Source: AGHT+IGcubsNbEux5qoTIjzJHasyn0SN0y3Zf1CAg/j2i3QWSYSA0ZXIOiE20uCOeizDRfsN8hbTww==
X-Received: by 2002:a4a:5143:0:b0:58d:8f17:6606 with SMTP id s64-20020a4a5143000000b0058d8f176606mr118049ooa.4.1702049402248;
        Fri, 08 Dec 2023 07:30:02 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x8-20020a4a6208000000b0057b6ac3922esm332866ooc.18.2023.12.08.07.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:30:00 -0800 (PST)
Received: (nullmailer pid 1382038 invoked by uid 1000);
	Fri, 08 Dec 2023 15:29:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20231208143359.469049-3-julien.massot@collabora.com>
References: <20231208143359.469049-1-julien.massot@collabora.com>
 <20231208143359.469049-3-julien.massot@collabora.com>
Message-Id: <170204939775.1382016.1723055237849206834.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: add Maxim MAX96717F GMSL2
 Serializer
Date: Fri, 08 Dec 2023 09:29:57 -0600


On Fri, 08 Dec 2023 15:33:57 +0100, Julien Massot wrote:
> Add DT bindings for Maxim MAX96717F GMSL2 Serializer.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/media/i2c/maxim,max96717f.yaml   | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717f.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717f.example.dtb: vd5661@10: port:endpoint:data-lanes:0: [1, 2] is too short
	from schema $id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231208143359.469049-3-julien.massot@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


