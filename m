Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917FE30F722
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 17:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237655AbhBDQCl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 11:02:41 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:44490 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237251AbhBDQCZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 11:02:25 -0500
Received: by mail-oi1-f181.google.com with SMTP id n7so4156190oic.11;
        Thu, 04 Feb 2021 08:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HBzB2+p5zWjHmvj7ekhmzwfOynmfckNEtlNTNcH45aw=;
        b=QgAfR+Iok8IJTRDLLx8QFKcet8Qe8zXRS/CRoB6QwVYbK5nvTvcUfSAd+dlrw+rL1h
         uYeu3kbYEJQBu1Kd4j4kRtKdlhUm1I27rzWOrHKMOD2ZXE5LgY+xdwLNH1JWhcOcw6Ta
         JGTRMwFolE/sdDxCNERlAGnX1zZv4q0kfKE7wE6/baLdQNY086czfkISRr1J5aC8sPRS
         VDzSQhn91XAxTY77sME31wEkY7E5RyPf1jJd02joLK+O2zIeOiQuq/TuMAETfPbD1uEW
         1lod6TzPgqMbU2fzqLDzFUBpeMuT5EqtuEHCxsIqEZbPFoghPfpp2P7WDbNGrJavWDWE
         MnWw==
X-Gm-Message-State: AOAM531RBBAMHJNBGS0K3A3xn7Hin58oKnRLvb7DDWQLaAdp77t5dSOM
        IOU9Q2fJDGnC34aj0tVDUg==
X-Google-Smtp-Source: ABdhPJxtZs1lDij1d7zp9iGhQBo6zbhq+gzgyH4zv0P3VEO0mxAE6MLhmR3g1wgARiDq9FQX9AHBbw==
X-Received: by 2002:aca:f1d4:: with SMTP id p203mr82339oih.46.1612454504141;
        Thu, 04 Feb 2021 08:01:44 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v17sm1185508ott.7.2021.02.04.08.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 08:01:43 -0800 (PST)
Received: (nullmailer pid 526068 invoked by uid 1000);
        Thu, 04 Feb 2021 16:01:41 -0000
Date:   Thu, 4 Feb 2021 10:01:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, todor.too@gmail.com,
        agx@sigxcpu.org, will@kernel.org, mchehab@kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, max.oss.09@gmail.com,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        agross@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        angelogioacchino.delregno@somainline.org,
        bjorn.andersson@linaro.org, leoyang.li@nxp.com, robh+dt@kernel.org,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        catalin.marinas@arm.com, geert+renesas@glider.be,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: Re: [PATCH v3 15/22] dt-bindings: media: camss: Add qcom,
 sdm660-camss binding
Message-ID: <20210204160141.GA525997@robh.at.kernel.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
 <20210127144930.2158242-16-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127144930.2158242-16-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 27 Jan 2021 15:49:23 +0100, Robert Foss wrote:
> Add bindings for qcom,sdm660-camss in order to support the camera
> subsystem on SDM630/660 and SDA variants.
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
>  - Added Angelo as binding maintainer
>  - Removed Todor as binding maintainer
> 
> 
>  .../bindings/media/qcom,sdm660-camss.yaml     | 398 ++++++++++++++++++
>  1 file changed, 398 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
