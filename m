Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC442FF05E
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 17:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387942AbhAUQcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 11:32:05 -0500
Received: from mail-oo1-f46.google.com ([209.85.161.46]:37607 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387562AbhAUQCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 11:02:52 -0500
Received: by mail-oo1-f46.google.com with SMTP id q3so616775oog.4;
        Thu, 21 Jan 2021 08:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=FnALTRCd0fwnwztvCJjXVzXjo3Irta1NYJ9hoSq0TN8=;
        b=R+0Bho0px2rLxuh2nES+pmBO9QNK0T4A8z14Qp5BI+BrX5c3a4W0EI/FLbh9p7fRBh
         X7jeeLREKNHzWJGc1GV35Lg9dZB/HPyz77TxOwahnB75LI3gLZO0OslLAXudvUE+m+j1
         wkYK/cm/U/O5wyTy8UDlXRHosXmSC5YOwvipV8uEO2UjUXfYcKu4dLf6Hk+ewuqkHWaI
         GN20CHbDDwtGyCKFdusjR7VAMEdnh82kYu1u+/s9OkeMbgC4rKbPdBeDlRj3nd9bYzj9
         KaCaxHNHbU/n6BuxnTPqadchPzsUHqLM7BnaKtuaRkmfib/KA5gy2gbqygR3g16OkXRO
         S+/A==
X-Gm-Message-State: AOAM531z/1E67OLya9SjYl5HU3xP7yDPKJtgDj1j8okYGNH8XSukkAt0
        KoEOv32iPc1vEVXM2eb4tA==
X-Google-Smtp-Source: ABdhPJzjtpIXCBtTM56647mSlkHwGTgHDoS2gqzx6op9R2ovySfWbvfap13yg10WcZgQjx7uvgXwUw==
X-Received: by 2002:a4a:e963:: with SMTP id i3mr185576ooe.37.1611244930133;
        Thu, 21 Jan 2021 08:02:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d10sm1029125ooh.32.2021.01.21.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 08:02:09 -0800 (PST)
Received: (nullmailer pid 2814846 invoked by uid 1000);
        Thu, 21 Jan 2021 16:01:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     shawnguo@kernel.org, mchehab@kernel.org,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        max.oss.09@gmail.com, geert+renesas@glider.be, agx@sigxcpu.org,
        bjorn.andersson@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        robh+dt@kernel.org, michael@walle.cc, agross@kernel.org,
        linux-media@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        leoyang.li@nxp.com, vkoul@kernel.org,
        Tomasz Figa <tfiga@chromium.org>, will@kernel.org,
        devicetree@vger.kernel.org,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        Anson.Huang@nxp.com, todor.too@gmail.com
In-Reply-To: <20210120134357.1522254-16-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org> <20210120134357.1522254-16-robert.foss@linaro.org>
Subject: Re: [PATCH v2 16/22] dt-bindings: media: camss: Add qcom, sdm845-camss binding
Date:   Thu, 21 Jan 2021 10:01:58 -0600
Message-Id: <1611244918.539264.2814845.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 20 Jan 2021 14:43:51 +0100, Robert Foss wrote:
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1:
>  - Laurent: Reworked driver to use dtschema
> 
>  .../bindings/media/qcom,sdm845-camss.yaml     | 394 ++++++++++++++++++
>  1 file changed, 394 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml:394:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1429446

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

