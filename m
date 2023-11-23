Return-Path: <linux-media+bounces-890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9E7F5EE2
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED391B2143F
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 12:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A03249F2;
	Thu, 23 Nov 2023 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D672B2;
	Thu, 23 Nov 2023 04:16:43 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3575287211bso2403695ab.1;
        Thu, 23 Nov 2023 04:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700741803; x=1701346603;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ABYdNkFKBFRNWab8mxw4kb18qdWZBOQPLFeqpwcNJk=;
        b=POWIAbzIAeLx8T5+kLL2H6/RkvbwYEjVSEetNwvHrp259XMoW1Ms54JSeztbUbwLKD
         gOwz9QX+/1G0dGo1FjGpnFjlRHhsKBo28Q/x+f/jhHuQivJ46vKhW2RBVjsYCHZUae8K
         yjqiH/gfAp9dVDNdmx2Uve8o6ot8sPWyNEtj6lHPoPtt4m83TXvNcLUwCWjIxRMPM6eo
         M6AG7d/SmncGpEb2UoKtzJ02H/cId6YUH/unmvegJhYvT1RknuYZAw3LXdOy37sZ0oYS
         Ttc9KASINgvPjtDu34XaaZ6BYxtj3QsHi6dPsvtvK/vmb6dNbUXHJWrclzq0C9y5hHdz
         cvCw==
X-Gm-Message-State: AOJu0YyWacxysI2P+IlkvhRA9D4FqSz3zF5VWgL/w89mZ3OmfssV5XDd
	TaQ8XrzFIRVXbpSwTH9LGIWXXMjntQ==
X-Google-Smtp-Source: AGHT+IGnJ5zLxO0Amw6q36pyoOYqwFkUrfD9vSmlUmkYLqpXg8cbkLjhN79VbrEGip0Himn8/AUBxQ==
X-Received: by 2002:a05:6e02:1145:b0:35b:41e:6357 with SMTP id o5-20020a056e02114500b0035b041e6357mr5236207ill.14.1700741802689;
        Thu, 23 Nov 2023 04:16:42 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a17-20020a92ce51000000b003576e122389sm321280ilr.24.2023.11.23.04.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:16:41 -0800 (PST)
Received: (nullmailer pid 826780 invoked by uid 1000);
	Thu, 23 Nov 2023 12:16:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: sakari.ailus@linux.intel.com, 10572168@qq.com, linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, macromorgan@hotmail.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, bingbu.cao@intel.com, jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, hdegoede@redhat.com, heiko@sntech.de, hverkuil-cisco@xs4all.nl, yaya.chang@mediatek.com, tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net, jacopo.mondi@ideasonboard.com, andy.shevchenko@gmail.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, yunkec@chromium.org, shengnan.wang@mediatek.com, dan.scally@ideasonboard.com, linux-media@vger.kernel.org, conor+dt@kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20231123115104.32094-2-zhi.mao@mediatek.com>
References: <20231123115104.32094-1-zhi.mao@mediatek.com>
 <20231123115104.32094-2-zhi.mao@mediatek.com>
Message-Id: <170074179924.826739.5309761699074670232.robh@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Document GC08A3
 bindings
Date: Thu, 23 Nov 2023 05:16:39 -0700


On Thu, 23 Nov 2023 19:51:03 +0800, Zhi Mao wrote:
> Add YAML device tree binding for GC08A3 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>  .../bindings/media/i2c/galaxycore,gc08a3.yaml | 128 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.example.dts:29.37-38 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231123115104.32094-2-zhi.mao@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


