Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E845317019
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbhBJT1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:27:03 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:36491 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhBJT1B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:27:01 -0500
Received: by mail-oi1-f177.google.com with SMTP id k204so3335624oih.3;
        Wed, 10 Feb 2021 11:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B1UlUKrPrML1HcDLpILcXpqkErXOEOx9C8amdr9vTe4=;
        b=pkuDMIsI2wTYHE6z+UpuVnGUb3LLm+pFwu1+E4m3Qb0C6PJBIAvE5M5rp8Y92POWFi
         cqnD9UKLCEfPOmX3sFE9nf931QmNqQxORBV5lDDgy3Dcn16f7khDM9HFYYnlDSDuG/nj
         HcsbXhfCVNHpp+GID8yqKNyOW52n8FuSslDzIYXXL/+LRDrABcsSx2mvJjjyg5oLJLLw
         C5r57x1aRWa0nX5eERNWh4VxmYsP3Z8XvnSKNsmi/9SzApYyn62k4dpDfh7SK9tyUZoB
         VGxl6hIci9KbW0zpkLHFpZtzncp5mrlhU9h1B7Td+qNhVwi1EwOJHWnk6B4sWkfrBNqc
         7E0Q==
X-Gm-Message-State: AOAM530tOpYcLWf3wf3ZMSnhMTpBq5kXy3LVoKElzEy5fb/ZIlsytrkU
        RsybOxDgOh+SLG8ZqNgAKQ==
X-Google-Smtp-Source: ABdhPJyzmrvjvaF2sIsbmiWL3gRcXhfrPJAXZJ8N0nyawqAgkoNJnnj6755JImVfhbQ8YrXNafi9Sg==
X-Received: by 2002:aca:4ccb:: with SMTP id z194mr366940oia.1.1612985181107;
        Wed, 10 Feb 2021 11:26:21 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e30sm536139ooh.32.2021.02.10.11.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 11:26:20 -0800 (PST)
Received: (nullmailer pid 2595956 invoked by uid 1000);
        Wed, 10 Feb 2021 19:26:19 -0000
Date:   Wed, 10 Feb 2021 13:26:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v4 14/22] dt-bindings: media: camss: Add
 qcom,msm8916-camss binding
Message-ID: <20210210192619.GA2594540@robh.at.kernel.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-15-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210205104414.299732-15-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 05, 2021 at 11:44:06AM +0100, Robert Foss wrote:
> Add bindings for qcom,msm8916-camss in order to support the camera
> subsystem on MSM8916.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v2:
>  - Remove redundant descriptions
>  - Add power domain description
>  - Make clock-lanes a constant
>  - Add max & minItems to data-lanes
>  - Remove ports requirement - endpoint & reg
>  - Rework to conform to new port schema
> 
> 
>  .../bindings/media/qcom,msm8916-camss.yaml    | 256 ++++++++++++++++++
>  1 file changed, 256 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
