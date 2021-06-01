Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE92939770F
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 17:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234497AbhFAPsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 11:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234495AbhFAPsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 11:48:37 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9167EC061756
        for <linux-media@vger.kernel.org>; Tue,  1 Jun 2021 08:46:55 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c3so14837732wrp.8
        for <linux-media@vger.kernel.org>; Tue, 01 Jun 2021 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=exFIxZuOrD7Plr1Np3AS/tQawGwgEP79Gok5C1va520=;
        b=Sjx9YHyswPIyxritg2eQKQLwWxgZcxEjPBd1aoPRJx2iVjp8I4s7B2xEcC0qChfNs6
         8oXfF7L7nZ2PrCZTD2bsNk1ohhgRp5nEv/rIS6rN3kvm9S21t+YfU3gplobwvWxIpCrW
         kfH4ajPSDEkTfn2ozzy6+7muVP9uK0diLv4k7hYHKLfvJ41av+52MQ4P+J4PASOO7pJG
         h5BuNxJ9aoiljsBK7yFfV4KnnhHOvqHSHzs2+9wa9uv23ryXn24sO5zvwnCf0aT1Og0z
         ALzEwl+zrozYTSRE/AySTHxZ0oWTkA+TeMfMbxkMOyQHY4M7K+WGL4eQ6HCgRBaIysiA
         gSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=exFIxZuOrD7Plr1Np3AS/tQawGwgEP79Gok5C1va520=;
        b=IvRIpkX4AFdXNDyXXofRjCvFgweX28zJE4/lNn+QxncVsniaCh64kbuPAoPE/YrO0L
         9UYg4+73fuuitoJE9ZUG4nwwd7rZERbTkUizk8j8ltc2VUxj7xEUkal8MIoSWfQlSS1A
         Hm2bkZSCkQWHESpEwA5A3KK8RebNprecru82GduEJuQvUT9yo8wMLD23A7HPnlUL06KG
         rBO9h5ek48dWYNf5WmhBCsKD3J2bs0vPEs2EHk33x5RTPduuEE0s/tPAYSiME8SYuyqF
         A9IAJjBxZvVdXJ7xaFtsfvEWG5rQ/D2PLp/Xpq7WIkTk3IQwYNJpRezjTyh6+wh9pznL
         kSrw==
X-Gm-Message-State: AOAM530edxpc6jnDKYh+VipBVMrxOou6x9cwu1xiCoz4TIa5FfKzgTbm
        aNlqH7JQWYmYSsWXuSfZlKewVA==
X-Google-Smtp-Source: ABdhPJxF67vbMP6BSXVX7i7BEayuWA1qe+1M9Gi9KHneZ4+6CHVCj6+4FxBdy6cgFyCIxJV3874yLQ==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr14929357wrs.246.1622562414194;
        Tue, 01 Jun 2021 08:46:54 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id u8sm2738305wmq.29.2021.06.01.08.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:46:53 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:46:51 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Alex Bee <knaerzche@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: mfd: syscon: add Rockchip
 RK3036/RK3228 qos compatibles
Message-ID: <20210601154651.GE2159518@dell>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
 <20210527154455.358869-2-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210527154455.358869-2-knaerzche@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021, Alex Bee wrote:

> Document Rockchip RK3036/RK3228 qos compatibles
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
>  Changes in v2:
>  - collect Reviewed tag
> 
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
