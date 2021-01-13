Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567842F4F0D
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 16:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbhAMPpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 10:45:47 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:38224 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAMPpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 10:45:47 -0500
Received: by mail-ot1-f41.google.com with SMTP id j20so2286237otq.5;
        Wed, 13 Jan 2021 07:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=/OZYDMQOUVtActRUrxqdkowy5AXag3L8nzdkAFPXlHg=;
        b=ahSWeiUTlZlM4gSc/S1CdvnUEJLPXUMrqdO81jnrpbhbJsq19nWlvxYIBLChzd/7yD
         wKvESMYk22lklCzHObnEvg/kQ0xHBTn0btjWcSVDGSZDL6TrlkLc2X1o0UApSt2rYW3s
         AezdbV43E8RllvYYbZ3c6mNhNWnlTST1vDHzCaNihVUfHmgImaQc+EpT8Fj6d4D4DhwH
         Fxkt6TgMYbMXf1NKa7KbNsZU2Kn+we9iUfz6HG99vGEA1gc2odzSRNewe+mjmXAFgATC
         X1jB51xmZwUksQNtCwaIuTp0kiUXQ64H0FmMRoMmlHbw63N+AVdg31xOpHaPlRWhCK9i
         nGAg==
X-Gm-Message-State: AOAM532MpXmB14i99U99E/NyW6HuWcPtLgCyHK/XWgzSmaHapPMc6REw
        5RtFHPwnWBRXvEGcgH8GJg==
X-Google-Smtp-Source: ABdhPJxhG9xx22koYrUiBE7xApayk8lzDcbuaua4K4mR7TmW9qeqOnJNnQjjpctbY/7o1KuqZJK3tQ==
X-Received: by 2002:a9d:b90:: with SMTP id 16mr1727890oth.9.1610552706627;
        Wed, 13 Jan 2021 07:45:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h7sm460329otq.21.2021.01.13.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 07:45:05 -0800 (PST)
Received: (nullmailer pid 2506181 invoked by uid 1000);
        Wed, 13 Jan 2021 15:45:04 -0000
From:   Rob Herring <robh@kernel.org>
To:     Minchan Kim <minchan@kernel.org>
Cc:     hyesoo.yu@samsung.com, hch@infradead.org, joaodias@google.com,
        hridya@google.com, pullip.cho@samsung.com,
        LKML <linux-kernel@vger.kernel.org>, mhocko@suse.com,
        robh+dt@kernel.org, linaro-mm-sig@lists.linaro.org,
        surenb@google.com, Andrew Morton <akpm@linux-foundation.org>,
        devicetree@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        linux-media@vger.kernel.org, david@redhat.com
In-Reply-To: <20210113012143.1201105-4-minchan@kernel.org>
References: <20210113012143.1201105-1-minchan@kernel.org> <20210113012143.1201105-4-minchan@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: reserved-memory: Make DMA-BUF CMA heap DT-configurable
Date:   Wed, 13 Jan 2021 09:45:04 -0600
Message-Id: <1610552704.254587.2506180.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 12 Jan 2021 17:21:42 -0800, Minchan Kim wrote:
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> Document devicetree binding for chunk cma heap on dma heap framework.
> 
> The DMA chunk heap supports the bulk allocation of higher order pages.
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Change-Id: I8fb231e5a8360e2d8f65947e155b12aa664dde01
> ---
>  .../reserved-memory/dma_heap_chunk.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml:58:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1425577

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

