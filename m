Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CFE3008CA
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 17:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728644AbhAVQit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 11:38:49 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:46492 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729679AbhAVQh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 11:37:57 -0500
Received: by mail-ot1-f52.google.com with SMTP id d1so5594733otl.13;
        Fri, 22 Jan 2021 08:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a2adNAFxR2bwlxbv3py+ib9z/ZsROiuHOAq4vq5ZVTA=;
        b=fD2OoLR2uexkPf0BBnoiisAc47dz0rxX5//h9pr3LPpigrWan+XHq+2QFkrqq1+C+e
         s0BBmqiPlXbARH2TmIr7jdvmhup2d9t/0omNNQGAfJfE+XLmgBkx2zm3OzUmec4QxiJP
         rRc8T85NNzkZ6SgbTsh5HWlGf8rWt69LdilRy1HdlUmAjKbYFTFghZntAxupA44vQlxg
         L0ygy50TNmdZJAelSsPgeGBxol+nTHIcv8X3kfltujEVHlupnUbu/YIUNWanMdNc7ZzG
         5/jRPvqleMmCGYcxm8mS4I9TG7r793l4P6QuPXikqWlsPWchp8VuUHUJZBnqgj2v2wez
         DkEA==
X-Gm-Message-State: AOAM530cFT86e9sgKMk33SQ4yWsczlckvsuF6lqeKpFB6DC5o7IhYB/v
        7AoZ/hujxpGmHW6RFuFVNQ==
X-Google-Smtp-Source: ABdhPJze57ZaIohHGof8/J4nHvBtQ7bOJG1czDyatikrtCx0g2O5DT4/yID47+4TC0xfMa/vOBY7cQ==
X-Received: by 2002:a05:6830:572:: with SMTP id f18mr3976815otc.109.1611333270614;
        Fri, 22 Jan 2021 08:34:30 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q127sm1816594oia.18.2021.01.22.08.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 08:34:29 -0800 (PST)
Received: (nullmailer pid 924016 invoked by uid 1000);
        Fri, 22 Jan 2021 16:34:27 -0000
Date:   Fri, 22 Jan 2021 10:34:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 15/22] dt-bindings: media: camss: Add
 qcom,sdm660-camss binding
Message-ID: <20210122163427.GA922435@robh.at.kernel.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
 <20210120134357.1522254-15-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120134357.1522254-15-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 02:43:50PM +0100, Robert Foss wrote:
> Add bindings for qcom,sdm660-camss in order to support the camera
> subsystem on SDM630/660 and SDA variants.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1:
>  - Laurent: Reworked driver to use dtschema

Same comments on this one.
