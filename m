Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4B4250EBB
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 04:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgHYCKb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 22:10:31 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46532 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgHYCK2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 22:10:28 -0400
Received: by mail-io1-f66.google.com with SMTP id d18so1577765iop.13;
        Mon, 24 Aug 2020 19:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0NCf2jzpvO50ZBYV+xUfgsYo+rTvPJ7p5RL+1hviLCg=;
        b=QNn0LfxekxzJct63wXMglbIuiyvab85s/3OMKG+Ssq+Y03tHQ1zPK8pW1QnQsPHyKi
         IjmR6+JaMMFgwm0ew+Lf5Hc6RXaOHewV1ia0wSIGsY0uO54dHZVVk131NP/WYTFU1Du6
         q4gpqBz5JzQHjdypDi7GlvnYIj9yTjrErWlbnCKEUmf2TFqD95YODyLQmnT9TzZZXtIZ
         RfjxVsOAfN0SzkEHb9qaBXD/U8RPw66jlmFiz7Ym7ngOD4azRkBM64LbB7pywastwgoG
         TWyfIPH65qtpchWqVrDhFQ2TZ1qqWuNqk21y3EDD3WSk2jpGvFPhwxYfo4piKJW+05k6
         jyqg==
X-Gm-Message-State: AOAM533HSv2J+hy9SfVq/kClJ7Sf6bOqA4dhoHVLdL7TQc04TtyilKWO
        uzQGNm2WGWmpyEtHwwaRoQ==
X-Google-Smtp-Source: ABdhPJzwoCXparZ+wj/JNF060uCIEoiWundaqqJqmPyBvhYxGjrIe4CRdUuRkjWfmB6Bed8d2zX+pQ==
X-Received: by 2002:a02:95ae:: with SMTP id b43mr8253473jai.19.1598321427874;
        Mon, 24 Aug 2020 19:10:27 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id e1sm8256532ilq.40.2020.08.24.19.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 19:10:27 -0700 (PDT)
Received: (nullmailer pid 3790321 invoked by uid 1000);
        Tue, 25 Aug 2020 02:10:24 -0000
Date:   Mon, 24 Aug 2020 20:10:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Xingyu Wu <wuxy@bitland.com.cn>
Cc:     mchehab@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
        darfur_liu@gcoreinc.com, linux-kernel@vger.kernel.org,
        dongchun.zhu@mediatek.com, linux-media@vger.kernel.org,
        hao.he@bitland.com.cn, bingbu.cao@intel.com, drinkcat@chromium.org,
        davem@davemloft.net, hao.he7@gmail.com,
        dave.stevenson@raspberrypi.com, sj.huang@mediatek.com,
        hverkuil-cisco@xs4all.nl, shawnx.tu@intel.com, tfiga@chromium.org,
        sakari.ailus@linux.intel.com, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH V3 1/3] dt-bindings: vendor-prefixes: Add GalaxyCore
Message-ID: <20200825021024.GA3790288@bogus>
References: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
 <1597380295-6297-3-git-send-email-wuxy@bitland.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597380295-6297-3-git-send-email-wuxy@bitland.com.cn>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 14 Aug 2020 12:44:53 +0800, Xingyu Wu wrote:
> From: Hao He <hao.he@bitland.com.cn>
> 
> Add vendor prefix for GalaxyCore, Inc.
> 
> Signed-off-by: Hao He <hao.he@bitland.com.cn>
> Signed-off-by: Xingyu Wu <wuxy@bitland.com.cn>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
