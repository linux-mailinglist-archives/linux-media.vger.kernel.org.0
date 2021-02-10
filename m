Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04231317040
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbhBJTfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:35:02 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:33758 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbhBJTe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:34:26 -0500
Received: by mail-ot1-f52.google.com with SMTP id c16so2947607otp.0;
        Wed, 10 Feb 2021 11:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WJP0klzEwgDZ/2iWW0PFvy76OgVpkGGEA11Lmo6SvQs=;
        b=dyb6ocQgoFV+I4KrNOoZw+Rn7SuImn8Ldkv/cRvylcrSvam/nEJxf7T+0Zqp+huN9A
         vHorvU8L5z6CbDNyBAvUScf9ZV61v+OdofmLnk1YokT59rogeq+QiQDPmlaZN+/8Fk1w
         25BljqMCRz60kY6XzAEQcosHjypUVIG01hPxQcuF0uvlTSQvHUQwx4/IccD/F1ZBVUcF
         fHuuQdvNenb9AmiOfvAjojbws+Y2S8Nw54WX6ctXUk49AH0Tnl6BVksZGYYCrsvS3muq
         mnztfkOdKWGfMTmJu21U/isnrmJXYGPByXDxrvjVqHT2VqJf5tEwJPadMvU+lqj25hnj
         RZng==
X-Gm-Message-State: AOAM530pnKZP21dbzmjPB0Zl43RnUQDOsAm93TePb6fb5gULjRNSjRLw
        svafxlYM/9SDScZwogN2DQ==
X-Google-Smtp-Source: ABdhPJyi5+padksHgBI9S7lV1Nqq9A/4KHpFpydckNAVQU2HDvSbq94O8o32Nk7ZrLscKRUg+3fnFw==
X-Received: by 2002:a05:6830:110a:: with SMTP id w10mr3238829otq.11.1612985623337;
        Wed, 10 Feb 2021 11:33:43 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p20sm533507oos.46.2021.02.10.11.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 11:33:42 -0800 (PST)
Received: (nullmailer pid 2609314 invoked by uid 1000);
        Wed, 10 Feb 2021 19:33:41 -0000
Date:   Wed, 10 Feb 2021 13:33:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     mchehab@kernel.org, Tomasz Figa <tfiga@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        todor.too@gmail.com, Jonathan Marek <jonathan@marek.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-media@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        bjorn.andersson@linaro.org, agross@kernel.org,
        angelogioacchino.delregno@somainline.org, robh+dt@kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 19/22] media: dt-bindings: media: Remove qcom,camss
 documentation
Message-ID: <20210210193341.GA2609254@robh.at.kernel.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-20-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210205104414.299732-20-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 05 Feb 2021 11:44:11 +0100, Robert Foss wrote:
> This documentation has been incorporated in dtschema dt-bindings
> for the devices supported by CAMSS and is no longer helpful.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,camss.txt  | 236 ------------------
>  1 file changed, 236 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
