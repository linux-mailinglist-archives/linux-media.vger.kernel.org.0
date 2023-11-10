Return-Path: <linux-media+bounces-66-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2877E836E
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4572813C9
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 20:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F2C3B799;
	Fri, 10 Nov 2023 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711053B787;
	Fri, 10 Nov 2023 20:08:06 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59891C7;
	Fri, 10 Nov 2023 12:08:05 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b6ce6fac81so497751b6e.1;
        Fri, 10 Nov 2023 12:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699646884; x=1700251684;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GW2jL/fzj0LL7YoFWhP8+MqZ7XMQolZsctEoqTfbDmI=;
        b=Ck+UsGq+dgp4ObZB5YQm9waWeOrxmEL5FTKaCJQv363GgUbcJ1uIaU+NJUg0rqtLPg
         ggBLtldyvyZs8FvmCU2J63WKTouyzVK4JVy/ioAnvxTGKizfTdpOuHUP40FUNBWv4xFd
         FVZMYLXm4WxUolEjx+I/3wQRUEMHcdsrR8A9ZoEaqAwkaTAZwImIcZshkqPE/RZS7Eao
         vXtlbQ/Y1EgKpZy67TnaciJSBPbHbdWEWe3fq3wCx7gOzjBVkmLxsEx8BwqmjaDlx+KM
         aGaqRye/k7gLryBotDwCSY0S/45m2ZjH+5Zwkl09L63geXfWclYcEIeyp3w5pNwSMvuh
         3Z5g==
X-Gm-Message-State: AOJu0YyXSm5QxaxOxeuuCyo4jwVkLaFluz7ZiQxeEevrzEL6lmYXP+rY
	DOkO/wIzs/jTzkJxjF/hLQ==
X-Google-Smtp-Source: AGHT+IFwqlk2+M4bnkien5UnQLulkKj5XEKP+RLX/dyDNM3cKUCIQ/5VxQXXIhvcbR0RTHsIlypytA==
X-Received: by 2002:a05:6808:b0e:b0:3b2:e07e:5062 with SMTP id s14-20020a0568080b0e00b003b2e07e5062mr356191oij.52.1699646884606;
        Fri, 10 Nov 2023 12:08:04 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g34-20020a0568080de200b003b2df32d9a9sm34712oic.19.2023.11.10.12.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:08:03 -0800 (PST)
Received: (nullmailer pid 343102 invoked by uid 1000);
	Fri, 10 Nov 2023 20:08:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, matti.lehtimaki@gmail.com, Todor Tomov <todor.too@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>, hverkuil-cisco@xs4all.nl, Robert Foss <rfoss@kernel.org>, quic_grosikop@quicinc.com, linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, vincent.knecht@mailoo.org
In-Reply-To: <20231110-b4-camss-sc8280xp-v5-1-7f4947cc59c8@linaro.org>
References: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
 <20231110-b4-camss-sc8280xp-v5-1-7f4947cc59c8@linaro.org>
Message-Id: <169964683843.342153.8939955333662052078.robh@kernel.org>
Subject: Re: [PATCH v5 1/6] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Date: Fri, 10 Nov 2023 14:08:00 -0600


On Fri, 10 Nov 2023 01:04:46 +0000, Bryan O'Donoghue wrote:
> Add bindings for qcom,sc8280xp-camss in order to support the camera
> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++++
>  1 file changed, 512 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.example.dts:26:18: fatal error: dt-bindings/clock/qcom,sc8280xp-camcc.h: No such file or directory
   26 |         #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231110-b4-camss-sc8280xp-v5-1-7f4947cc59c8@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


