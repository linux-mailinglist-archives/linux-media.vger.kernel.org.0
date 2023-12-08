Return-Path: <linux-media+bounces-1985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 734BE80A76C
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E9141F2139A
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAFF31583;
	Fri,  8 Dec 2023 15:30:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2904010EB;
	Fri,  8 Dec 2023 07:30:00 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6d9e0f0cba9so958093a34.1;
        Fri, 08 Dec 2023 07:30:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049399; x=1702654199;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OogF34khlLnZV8L6Y2PLhfIGtr27dXzcAj4zxw0jNhs=;
        b=voSFnySl8NRDaAmVPK25KHXxPJCHxtmTAwWzdQY1VeHCHJ4J0IqtZ+LGzMo16N3YBC
         eyJHpEhzeUhgnWHMc9jjkdk7OUAAfk2ENJP2+Jp/s2p3zVi3B6l39QY7X9TdugyPAtb7
         +CbYitHj5z9UiKbR5CR7qu6roElD/AAe2hbUCXhXFULIMF0Hs4IxWREFqV3QQfiPerPz
         PiNWDJkok/t0chXq0kmaexMlgBNGoh4YpYBloE/a3Y6fzZi4pgUjWi9tf+bf3DwSuNqd
         7/QOoCDBKKxiPmtuMADEQsxHw3FgeT+M8oxSahxbNq0ZYCbSbxUHLLgnMe+GrCxGjjxA
         BQuQ==
X-Gm-Message-State: AOJu0Yzl1ixjdpGz7e7mZ4MrPa+lKbHno0MIvL/Mo/+Eg9RPMxOOjSfi
	kkAMmEnhesZnsVspmJbK80xqIYJJCQ==
X-Google-Smtp-Source: AGHT+IHlU+zhymvBCO7GYBa4opGg5l2gkBYu9nFQXgSbEwJrxGRifoqiHIMty7njHi2XOSBmfTVfEg==
X-Received: by 2002:a9d:7359:0:b0:6d9:f27c:f540 with SMTP id l25-20020a9d7359000000b006d9f27cf540mr195407otk.63.1702049399339;
        Fri, 08 Dec 2023 07:29:59 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o8-20020a9d6d08000000b006d8017dcda9sm325779otp.75.2023.12.08.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:29:58 -0800 (PST)
Received: (nullmailer pid 1382035 invoked by uid 1000);
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
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20231208143359.469049-2-julien.massot@collabora.com>
References: <20231208143359.469049-1-julien.massot@collabora.com>
 <20231208143359.469049-2-julien.massot@collabora.com>
Message-Id: <170204939708.1381969.6269812995556290381.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: add Maxim MAX96714F GMSL2
 Deserializer
Date: Fri, 08 Dec 2023 09:29:57 -0600


On Fri, 08 Dec 2023 15:33:56 +0100, Julien Massot wrote:
> Add DT bindings for Maxim MAX96714F GMSL2 Deserializer.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/media/i2c/maxim,max96714f.yaml   | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/i2c/maxim,max96714f.example.dtb: /example-0/main_i2c2/gmsl-deserializer@28/i2c-gate/gmsl-serializer@40: failed to match any schema with compatible: ['maxim,max96717f']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231208143359.469049-2-julien.massot@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


