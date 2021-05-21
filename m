Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E6938BC38
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 04:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238194AbhEUCEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 22:04:53 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:46987 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235427AbhEUCEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 22:04:51 -0400
Received: by mail-oi1-f171.google.com with SMTP id x15so18247033oic.13;
        Thu, 20 May 2021 19:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WhAeh+dZi9+3yK3kntKir0Vq+lwI30Bn7MsSEyHVbZU=;
        b=eSL3Dq5saR/VLfdjH7XP2GkiOAGWKElrYSpIdojm2lTA6j2oRAt9dNq91sx+wdZ2K0
         eowuNWqcMVfdSI0+P+UwCNuRwLTNnIoAFN0I1g1kW7//Z41e7L8Y1PxlgKrN/z9Rki80
         LXabCue4B8GwLzlSqs37VOJr3y5YmM90ADB87nxYmeNCsKCQHh51Jmduobzjx7GyWvef
         KGsml7WhJXNN4Z+SGeE6RKzu9Xz4aTMes/+ZgW+/75Ngi7j8LVj+rCKAF3FIUn6TnWhF
         PKd7jPKh+0ytLok3KlE8k+MdXsiD15XeeL+w4zBrBzdKC01AMBCH0ygtNeeNgmvz0MOK
         WYpw==
X-Gm-Message-State: AOAM530jycmH+LmEf7aNfR/5/8jVpEc+ZYW2L8832BvmaS/peQcWTh9p
        x9w+mGrvF0JD4NgkVYf11g==
X-Google-Smtp-Source: ABdhPJyQqDX59bgvgmDRWgwVJcOyJeV8oVHeEjcOjQRXCo0m49J2PqCCHAFfmM3cT0row6pVQGk9MA==
X-Received: by 2002:a05:6808:f90:: with SMTP id o16mr315450oiw.163.1621562607986;
        Thu, 20 May 2021 19:03:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm919703oie.32.2021.05.20.19.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 19:03:27 -0700 (PDT)
Received: (nullmailer pid 2505823 invoked by uid 1000);
        Fri, 21 May 2021 02:03:26 -0000
Date:   Thu, 20 May 2021 21:03:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     dillon.minfei@gmail.com
Cc:     linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        alexandre.torgue@foss.st.com, patrice.chotard@foss.st.com,
        mchehab+huawei@kernel.org, pihsun@chromium.org, gnurou@gmail.com,
        mturquette@baylibre.com, robh+dt@kernel.org,
        mcoquelin.stm32@gmail.com, linux-clk@vger.kernel.org,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        devicetree@vger.kernel.org, hugues.fruchet@foss.st.com
Subject: Re: [PATCH 2/7] media: dt-bindings: media: add document for STM32
 DMA2D bindings
Message-ID: <20210521020326.GA2505733@robh.at.kernel.org>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-3-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621508727-24486-3-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 20 May 2021 19:05:22 +0800, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> This adds documentation of device tree bindings for the STM32 DMA2D
> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dma2d.yaml  | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
