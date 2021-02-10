Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1D9317033
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhBJTdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:33:36 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:45907 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbhBJTd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:33:26 -0500
Received: by mail-ot1-f45.google.com with SMTP id o12so2881429ote.12;
        Wed, 10 Feb 2021 11:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VgsnLe1juvQgwnwrJJU7i5lNrQnyzFCKhEMdXLNiBvk=;
        b=TbAB77IY9mBrcqp9CLT9CwJo2v1RdfNOmvE04ozmH69bbwAx6GaFOqcQIZmxYbtm5p
         /Qmp+F3mNsJPl+d+6ceMBOjSb1DJhP03IViDAgdXZZqkOT5q3sl2jU0wbxysN1xWGVts
         K1P7DrQKq2s5FAm5W1cq2Wa3/Qu9mqi1HembnupJhQTYrVEhxvPPpoFpVAYex+uSQ0if
         Gi2ZFCq5iuMDU0lazTtlNTDznTp2XmLIqhyKsMv1vlJOcY6lVn7EpJ8RRudsACNGqr/A
         D22n1NUAzQWnuvCxxRExvNotwvXwgzyH8XMDODu53k0uQlENg4UmnHQ1FAWjc+K30UFb
         l9wg==
X-Gm-Message-State: AOAM531rqvCzNrXavc/eQYUuUZPqiStFTm7f8P7OY83E8XXWrg8oJ+qF
        9zJv+ZWINKkvol2ssra9yQ==
X-Google-Smtp-Source: ABdhPJwNUsP9YVVOlaoly04SRPD0NnAk5GFOZtXmFtmmH/j/uFpkEhNuFj0o581GDpq0nElJ8bkdqQ==
X-Received: by 2002:a9d:71c1:: with SMTP id z1mr3342932otj.334.1612985565293;
        Wed, 10 Feb 2021 11:32:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e30sm539947ooh.32.2021.02.10.11.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 11:32:44 -0800 (PST)
Received: (nullmailer pid 2607357 invoked by uid 1000);
        Wed, 10 Feb 2021 19:32:42 -0000
Date:   Wed, 10 Feb 2021 13:32:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        agross@kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jonathan Marek <jonathan@marek.ca>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        robh+dt@kernel.org, Tomasz Figa <tfiga@chromium.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        angelogioacchino.delregno@somainline.org, mchehab@kernel.org
Subject: Re: [PATCH v4 15/22] dt-bindings: media: camss: Add
 qcom,msm8996-camss binding
Message-ID: <20210210193242.GA2607301@robh.at.kernel.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-16-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210205104414.299732-16-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 05 Feb 2021 11:44:07 +0100, Robert Foss wrote:
> Add bindings for qcom,msm8996-camss in order to support the camera
> subsystem on MSM8996.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v2
>  - Rob: Add new line at end of file
>  - Rob: Remove redundant descriptions
>  - Rob: Add power domain description
>  - Rob: Make clock-lanes a constant
>  - Rob: Rework to conform to new port schema
>  - Add max & minItems to data-lanes
>  - Remove ports requirement - endpoint & reg
> 
> 
>  .../bindings/media/qcom,msm8996-camss.yaml    | 387 ++++++++++++++++++
>  1 file changed, 387 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
