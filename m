Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB62290A89
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 19:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391017AbgJPRVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 13:21:40 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44560 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390433AbgJPRVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 13:21:39 -0400
Received: by mail-ot1-f65.google.com with SMTP id e20so3051266otj.11;
        Fri, 16 Oct 2020 10:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e8GjHty+1aRxkxB6OTZCp5dmlkx4GtpYh5aZO6NQU3g=;
        b=pH+HJOsAYdPOKcSBydKsPptq+gJvRZKITwdknAsw08Gp0eCkHmerLs4ge4qu05rSS+
         LYex0wOtGAPm6mlyClNK/bfIhUyQ2TCpyJtGuWouKm42iHDf+ZIo8ujlC6HF7J1YxRiV
         q8JV+hZvd3D4xjBw9fvw5apgbtErYySEQUYMuJ4J85iA8Awgh+ZC8xzXHvlkPXMByCz2
         fGdUd50EhpSde2fDN+knrrYytpxpo64GMAvNFYR/37Yb9oVr8mor6qewNsrRN5xBxKU7
         oYgqgODP2zDOy2UVe2FAScCE7OfITX6CtnU/oA4BZHOTsH09h0XTwKqTiZ4w8/cQuroP
         1mVg==
X-Gm-Message-State: AOAM530G9XWnbL4H3RjywRGeqlsWOJgFntbl4geGUvxMXEgpp4k8P7gQ
        exBCSL/qil2zzgZczK5PwA==
X-Google-Smtp-Source: ABdhPJyBmicHhExMd8UfAARs4x+dcf3v+rjvJYssd7gWuTefGO3fN6HrCSikm0AYBv0Il8i8PqXLMQ==
X-Received: by 2002:a9d:6e07:: with SMTP id e7mr3181610otr.365.1602868897389;
        Fri, 16 Oct 2020 10:21:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d11sm1131458otf.44.2020.10.16.10.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 10:21:36 -0700 (PDT)
Received: (nullmailer pid 1602840 invoked by uid 1000);
        Fri, 16 Oct 2020 17:21:35 -0000
Date:   Fri, 16 Oct 2020 12:21:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     robh+dt@kernel.org, drinkcat@chromium.org,
        shengnan.wang@mediatek.com, mchehab@kernel.org,
        bingbu.cao@intel.com, linux-arm-kernel@lists.infradead.org,
        andriy.shevchenko@linux.intel.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tfiga@chromium.org,
        sj.huang@mediatek.com, matthias.bgg@gmail.com,
        sakari.ailus@linux.intel.com, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, mark.rutland@arm.com,
        louis.kuo@mediatek.com
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201016172135.GA1602808@bogus>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013130503.2412-2-dongchun.zhu@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 13 Oct 2020 21:05:02 +0800, Dongchun Zhu wrote:
> Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> relevant MAINTAINERS entries.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
