Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B24F43406C
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 23:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhJSVXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 17:23:53 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:42551 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhJSVXx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 17:23:53 -0400
Received: by mail-oo1-f54.google.com with SMTP id a17-20020a4a6851000000b002b59bfbf669so1176529oof.9;
        Tue, 19 Oct 2021 14:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2UUC/3x7ofeAneQJCy/LNm1w85QsLZXDRkpQ+xWwBmU=;
        b=IjmW0cb1qc53Men9AXB+e1X0/njoUqr5FuRCOXxJllad5BdKxFX/nn3pq0cQ5aCksv
         K5mQdzt5PpK4WzgWopZAuUuoGuM/UpiCbS9N1Chj+L9VvsLtwkoMWyHo8/hDqgnn+bsg
         zokiY2UByTRviN5hrgr0NalgHdUJqPdO9CR+wFUSbGwATL9+oTOnz4gxdsSEAbReYluQ
         1TXup0QDRIIKIn+CAMq53WBLqBhaP4QlPKZsU+V6NYRSV7/WanJ1P3QQzsRh/vYvmx9n
         KM/u2mLji2sKAuXMe6SkN2iu23BcS5seHDwWdRWML4tjz+lBDwtsTAfyMRGGeTVuVDeo
         2Ugg==
X-Gm-Message-State: AOAM530cwkS68qLrVusb0Ttg+hfDzlEGK8C1JiksZr7N7ZcIO3CyIpsU
        s1Pzohko2Nh/k3gibzXpSQ==
X-Google-Smtp-Source: ABdhPJwNrg/XuTyux0NXtK5tyTRR3bwuEqv0kh/QBZ8M5QK6Ecru3wRZ84BT6IFRxkHlUE3sAMbgiQ==
X-Received: by 2002:a4a:430c:: with SMTP id k12mr6628026ooj.43.1634678499397;
        Tue, 19 Oct 2021 14:21:39 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-67-78-118-34.sw.biz.rr.com. [67.78.118.34])
        by smtp.gmail.com with ESMTPSA id c17sm65695ots.35.2021.10.19.14.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:21:38 -0700 (PDT)
Received: (nullmailer pid 862188 invoked by uid 1000);
        Tue, 19 Oct 2021 21:21:36 -0000
Date:   Tue, 19 Oct 2021 16:21:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mchehab@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, martin.botka@somainline.org,
        robh+dt@kernel.org, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, agross@kernel.org,
        stanimir.varbanov@linaro.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH 1/3] dt-bindings: media: venus: Add sdm660 dt schema
Message-ID: <YW824G+mII83pjU5@robh.at.kernel.org>
References: <20211008102119.268869-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008102119.268869-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 08 Oct 2021 12:21:17 +0200, AngeloGioacchino Del Regno wrote:
> Add a schema description for the Venus video decoder/encoder IP
> in SDM660.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/qcom,sdm660-venus.yaml     | 186 ++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
