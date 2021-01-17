Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D876A2F93B3
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 16:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbhAQPrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 10:47:31 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:38541 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729575AbhAQPqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 10:46:45 -0500
Received: by mail-oi1-f173.google.com with SMTP id n186so7267140oia.5;
        Sun, 17 Jan 2021 07:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=I1Sz4N565yWH+PJttmsloVPTQfYVGUwG8D9yP5RwqV8=;
        b=tdCeqr9Gx1G22rfkzyji6Oh2jbt5kGU6H0ogE0HG3zv0aR9TFY2HTDZj0wRbdUe3Tm
         QxDehc9A4YKyB8XhMclYmcWWE8ocf4lZnjCS82P395SiN0QcIBUp7/Ew6GwNgmDeFtKy
         ygnUlbJCeMpISlwXJqcW7RBNaU0fgNccwQUoH16tBotbZ0wFgxzp1DFrasG5yoDty82W
         XHeBDjPCD6E7vUH7TC4zj4PVz/pVZGXqrzkf0u1bGBCNSh//o0YNVMP4KliF3JZ3ZC1T
         gIrSv1u/pzKSZOeoAPSp5OkptMiZNjbcr22C334osdp5brFo16YImh9tk9lsxHIOIFYM
         NfmQ==
X-Gm-Message-State: AOAM531cZH/IMcCHFynlO0jkZD5UPsIq0uHy91NjHCM9YZTvShcW49Wj
        ihXC6jf/+AgVgLWK0RzecQ==
X-Google-Smtp-Source: ABdhPJwB5IHi5WAy4MN+6LkSr4Wu6LcuJ+JQX9mUhlwgbSS6N3D28MKX+KVXxVsjvM1PvxFAYQYcLA==
X-Received: by 2002:a54:4005:: with SMTP id x5mr11079579oie.74.1610898364038;
        Sun, 17 Jan 2021 07:46:04 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f201sm2808933oig.21.2021.01.17.07.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 07:46:03 -0800 (PST)
Received: (nullmailer pid 1730314 invoked by uid 1000);
        Sun, 17 Jan 2021 15:45:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     mchehab@kernel.org, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org, konrad.dybcio@somainline.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org> <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 2/2] media: dt-bindings: media: venus: Add sdm660 DT schema
Date:   Sun, 17 Jan 2021 09:45:57 -0600
Message-Id: <1610898357.209470.1730313.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 15 Jan 2021 19:52:52 +0100, AngeloGioacchino Del Regno wrote:
> Add new qcom,sdm660-venus DT binding schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/media/qcom,sdm660-venus.yaml     | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
> 
> base-commit: 012bd807cf654b992cdc4db7eab85c1e95f9d571
> prerequisite-patch-id: 734bdefdb043a8f91a48916246cc9a36fb5966e5
> prerequisite-patch-id: 999517c02973237996492a41ed5bfc2990083932
> prerequisite-patch-id: a48910425fac61948a7a26bec4d40d63e3368569
> prerequisite-patch-id: b1a1a4216eed0d04dd16e6e8e1053dee185d06d8
> prerequisite-patch-id: dff12be2631cc21ef1c3c930fba49d979f5055fe
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,sdm660-venus.example.dts:20:18: fatal error: dt-bindings/clock/qcom,mmcc-sdm660.h: No such file or directory
   20 |         #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/media/qcom,sdm660-venus.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1427279

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

