Return-Path: <linux-media+bounces-301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B826F7EA4F8
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24E0FB20A16
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F7E23748;
	Mon, 13 Nov 2023 20:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466E1944F;
	Mon, 13 Nov 2023 20:40:46 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06247D55;
	Mon, 13 Nov 2023 12:40:45 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b2e330033fso3029323b6e.3;
        Mon, 13 Nov 2023 12:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699908044; x=1700512844;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIUOg6xcD1mveQt4yAqYkPtye9ZANiCj61RnWxJZ9RE=;
        b=byQYMxZqX+yQBx3WeqfcOXC0oZkxWBYMh5bD9FfKs0ZmeFnR6ZkaVkZptqBqMr0iGE
         nJ7KthN+FOqEJVojOsV7QWFMfxRzLQG7SCQNuIw78JrcHqgQ+ZdePdmYy0tyzqiWHVZx
         5xINieVmROQ0tmZOHzisSOdBjalpVOVCtDywTpN6nJn5WBmBaorCPv37T2LzjieMDrfv
         LWRqwb/fbdfgiBhrIhF2IYinFF0lnioC+yCzask4ExR8wYY5qQ3BJ6DDCZz608vSd5hh
         ncC6N8a8ZRgW5jsbIcIhvjDtEDyet7aWXtjZ9jv96cnAXBgQ8mDejTzGdfQuk1x/ddPQ
         jzZw==
X-Gm-Message-State: AOJu0Yzj7In24cjuFxAkE/SNdlhXQV7ubVnlwtzUOLklyV05WIAJMaFb
	5yFnSgOiDqc9rG0D/t7Dpg==
X-Google-Smtp-Source: AGHT+IE+M7ODqvletmAN6kZJ6EBjwVhQYADFHXDZ0Hl1ZJYebTPk7Dxy4FLEWYDWixjDGGboIOMmUw==
X-Received: by 2002:a54:4586:0:b0:3ab:8431:8037 with SMTP id z6-20020a544586000000b003ab84318037mr9564352oib.32.1699908044232;
        Mon, 13 Nov 2023 12:40:44 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b7-20020aca1b07000000b003af732a2054sm902879oib.57.2023.11.13.12.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:40:43 -0800 (PST)
Received: (nullmailer pid 38662 invoked by uid 1000);
	Mon, 13 Nov 2023 20:40:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kuohong.wang@mediatek.com, Nicolas Dufresne <nicolas@ndufresne.ca>, Jeffrey Kardatzke <jkardatzke@google.com>, christian.koenig@amd.com, Brian Starkey <Brian.Starkey@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, ckoenig.leichtzumerken@gmail.com, linux-media@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, dri-devel@lists.freedesktop.org, tjmercier@google.com, linaro-mm-sig@lists.linaro.org, Joakim Bech <joakim.bech@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Vijayanand Jitta <quic_vjitta@quicinc.com>, jianjiao.zeng@mediatek.com, linux-mediatek@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>, devicetree@vger.kernel.org
In-Reply-To: <20231111111559.8218-7-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-7-yong.wu@mediatek.com>
Message-Id: <169990800956.37900.2282148242749436119.robh@kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
Date: Mon, 13 Nov 2023 14:40:42 -0600


On Sat, 11 Nov 2023 19:15:57 +0800, Yong Wu wrote:
> Add a binding for describing the secure CMA reserved memory range. The
> memory range also will be defined in the TEE firmware. It means the TEE
> will be configured with the same address/size that is being set in this
> DT node.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../reserved-memory/secure_cma_region.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/reserved-memory/secure_cma_region.example.dts'
Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/reserved-memory/secure_cma_region.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: could not find expected ':'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231111111559.8218-7-yong.wu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


