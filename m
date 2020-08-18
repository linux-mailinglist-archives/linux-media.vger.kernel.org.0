Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052DB248BF0
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 18:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgHRQsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 12:48:18 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45914 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgHRQsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 12:48:18 -0400
Received: by mail-io1-f68.google.com with SMTP id u126so21731003iod.12;
        Tue, 18 Aug 2020 09:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KImiBwzNWf5aXeRH8pMXlYk8GtbO84LBcSTU7lw7AYE=;
        b=SAhSVk1VXKUG67ocZr33Azt5t2OixT77uVKgZpLm/T0vBlvZjESsYK+u81h2W/eFSM
         u1gp424v8i2yabr58JbqxKSINDzc5RyzLojIfJN6I37DvLKY+keTxcECPiLtzYCU+Cr0
         liddYK0u+soyzyloHLWO/3EuLFPTdSsTmjYBAlhwGFpqoZNbr8hyY9u7pb4gttu6YsjG
         VWAnASQ34n2iXdpqjtPlRSLi5UsrGS2clOAKy8NouqeMwYtGBhCFGboehdS/xFZxTLth
         Sl7EU4NQiCMECl9LsHnvBAkx/WvvvkCtjFYUXCCn2XH1AvizopMN0quX1txxUGr64X9l
         M+iw==
X-Gm-Message-State: AOAM53122B0W6Rtbu8rXprp6m8Spki8b4WZn8vMTf0dCnqT8zvFxGWKD
        fXBlau4NZx94B4acRZwErQ==
X-Google-Smtp-Source: ABdhPJwJYfpD4QBhfIN9mFdiDnmYYj+3q6cflyF3DxQm7aifzQDaQgcPKMWkNslzO9FXrSXFaDSQlA==
X-Received: by 2002:a6b:e216:: with SMTP id z22mr15957990ioc.97.1597769296997;
        Tue, 18 Aug 2020 09:48:16 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id 82sm11101331ioc.34.2020.08.18.09.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:48:16 -0700 (PDT)
Received: (nullmailer pid 3602657 invoked by uid 1000);
        Tue, 18 Aug 2020 16:48:12 -0000
Date:   Tue, 18 Aug 2020 10:48:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hyesoo Yu <hyesoo.yu@samsung.com>
Cc:     pullip.cho@samsung.com, lmark@codeaurora.org,
        sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, labbott@redhat.com,
        linaro-mm-sig@lists.linaro.org, akpm@linux-foundation.org,
        minchan@kernel.org, dri-devel@lists.freedesktop.org,
        linux-mm@kvack.org, joaodias@google.com, robh+dt@kernel.org,
        Brian.Starkey@arm.com, afd@ti.com, iamjoonsoo.kim@lge.com,
        christian.koenig@amd.com, john.stultz@linaro.org, vbabka@suse.cz,
        devicetree@vger.kernel.org, surenb@google.com,
        benjamin.gaignard@linaro.org
Subject: Re: [PATCH 3/3] dma-heap: Devicetree binding for chunk heap
Message-ID: <20200818164812.GA3602349@bogus>
References: <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <CGME20200818074554epcas2p2702e648ba975ea6fbe33c84396b152a9@epcas2p2.samsung.com>
 <20200818080415.7531-4-hyesoo.yu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818080415.7531-4-hyesoo.yu@samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 18 Aug 2020 17:04:15 +0900, Hyesoo Yu wrote:
> Document devicetree binding for chunk heap on dma heap framework
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> ---
>  .../devicetree/bindings/dma-buf/chunk_heap.yaml    | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dma-buf/chunk_heap.example.dt.yaml: chunk_default_heap: 'alignment', 'memory-region' do not match any of the regexes: 'pinctrl-[0-9]+'


See https://patchwork.ozlabs.org/patch/1346687

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

