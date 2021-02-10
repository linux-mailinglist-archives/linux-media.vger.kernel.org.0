Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6104D317038
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbhBJTen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:34:43 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:40097 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbhBJTeF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:34:05 -0500
Received: by mail-ot1-f50.google.com with SMTP id i20so2919640otl.7;
        Wed, 10 Feb 2021 11:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cx65ijP/ZWVoq6IQ8HIC4wgPRh/4LEoU2ekJPh4u4yQ=;
        b=qdRAUPlxsKQ7Lc8QrH7pCMabcnXo/iVkCL8XBRdmUGuvtnu2eIobGylYRT3g/JYmBE
         aRDzlfQoTrk1T5Dwmmei5N771W7sPVJHafNKE+aEK4Vs+nGAn4LakrIu9dGI75h/h+rf
         uQp9bI2yw1FCAYDkrXi4WbwooubEOebnNe+eOX08CZwjZQozVcuhsVef3kZ99sCBFX6D
         I4NuU7WxQrkvTyFaLBJNhA+m67TZZZ+x7H13QXqLS3Ca13VNlKcgRHmq1i0LzNNi+D/m
         WJ1EG84eeE0cSL6m5hdHg2NXalGF3y+Re3lpvV0gcHDPXdAoU9pir04Kh/IhxO+jGWkP
         f4+g==
X-Gm-Message-State: AOAM533owB12IvsvZCfCnsDaAyrQJStg+ANI0sfIWb8p+4UD/bqQgbnS
        +V9kbeFpwXPHt57YkzmA0Q==
X-Google-Smtp-Source: ABdhPJwnygcoQjwGNrr520cOIDboDEY1QbNLTNj9sqYbqjvvZLelFIlgY38We4vj+HQHRwDg/A/LDw==
X-Received: by 2002:a9d:70d3:: with SMTP id w19mr3437479otj.177.1612985603330;
        Wed, 10 Feb 2021 11:33:23 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d1sm556877otc.57.2021.02.10.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 11:33:22 -0800 (PST)
Received: (nullmailer pid 2608595 invoked by uid 1000);
        Wed, 10 Feb 2021 19:33:20 -0000
Date:   Wed, 10 Feb 2021 13:33:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        todor.too@gmail.com, Jonathan Marek <jonathan@marek.ca>,
        angelogioacchino.delregno@somainline.org, agross@kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        bjorn.andersson@linaro.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 17/22] dt-bindings: media: camss: Add
 qcom,sdm845-camss binding
Message-ID: <20210210193320.GA2608534@robh.at.kernel.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-18-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210205104414.299732-18-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 05 Feb 2021 11:44:09 +0100, Robert Foss wrote:
> Add bindings for qcom,sdm845-camss in order to support the camera
> subsystem for SDM845.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v2
>  - Rob: Removed extra empty lines at end of file
>  - Rob: Add new line at end of file
>  - Rob: Remove redundant descriptions
>  - Rob: Add power domain description
>  - Rob: Make clock-lanes a constant
>  - Rob: Rework to conform to new port schema
>  - Add max & minItems to data-lanes
>  - Remove ports requirement - endpoint & reg
>  - Add proper commit message
>  - Remove Todor as binding maintainer
> 
> Changes since v3
>  - Fixed ordering of IRQs
> 
> 
>  .../bindings/media/qcom,sdm845-camss.yaml     | 370 ++++++++++++++++++
>  1 file changed, 370 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
