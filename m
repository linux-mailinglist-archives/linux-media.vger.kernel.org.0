Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194F055DE9E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236501AbiF0NsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 09:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236413AbiF0Nrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 09:47:33 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C7B614C
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 06:47:31 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o16so13175239wra.4
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=thKvXG+JY3HbxZ4gHoPQEiQ+g4hVQKN6LBHIr47r/6k=;
        b=jHNN/E/FNcXapK91iIDirAbb8f+wGuCbENy43xqwJNYCKodSw6sMQw5o3qBrwoBv5/
         EBbdUO7C5KuSgFCPffAH0hqEQALbGoEhGlayBiez57/4mxZptaX6hEocri8MCD8m966N
         OME3Wcv0nSd6XZR/+W7O/B5zMbnkZvTMlu8LM5E9rwowE0h+aIvHeu4JnabkLnMtWNe4
         G8RV8szA1uuKsx5r46GEGat4w4/vEQAUFzl6zHJ1KxDpQl+86EpH8s4wTvkG459LGk/9
         tViG69hLpnyGmp44Y+BX5CWXoQwZF+1pPjCcH6OMt93d4h4vxXiWINOb52yB3mtjKJ5I
         y5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=thKvXG+JY3HbxZ4gHoPQEiQ+g4hVQKN6LBHIr47r/6k=;
        b=FC3lw8vYWNm1hPsp2cKqapLebR9EtUER5JA6Gu5nzrO692JSyIOKlinF2o0ZXkQ6WK
         VXFHv1yYPvu7tcxCjM6LgW/0kBqeuOiQOZyQU9+YdNU5rsLD2YRUOLfzhjTNLEV4og/M
         pNZsfRuN9K6wmyFqryYw/uQe2zIG/Pi5sRE372+J/fh3dXR8sRI19GxR23J8OjBfI1tZ
         0ygaLSoEbEtjpApO6ZO4FO3J0cgpvSyUflq41S+/cvRw4481OQvjnj0JLXveG5MKvWlA
         du9ImD+wgWlWf8bLFcHdm1knRIlWJ+IL7RHREKJUV/LQn6MNXqiRFAZaQQ8ux5E+KFbf
         96Xw==
X-Gm-Message-State: AJIora8eyOl0oX3RpcapSdLpdU56tiNRDVEFJhqZ/rLMjQKG07D4B1e3
        FyiRl67BkIkiMOrzpZ4n1eJTzg==
X-Google-Smtp-Source: AGRyM1u6bcKos2Ai+xOrhZQz5EBIS0SCQvcwH2heAPU9X0Nf/agWvME05l1J5jMwiTo3Zm2Bvu++Zg==
X-Received: by 2002:a05:6000:15c1:b0:21b:ad5e:2798 with SMTP id y1-20020a05600015c100b0021bad5e2798mr12340957wry.237.1656337649964;
        Mon, 27 Jun 2022 06:47:29 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b003942a244f47sm18847964wmq.32.2022.06.27.06.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:47:29 -0700 (PDT)
Date:   Mon, 27 Jun 2022 14:47:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, andrzej.hajda@intel.com,
        narmstrong@baylibre.com, robert.foss@linaro.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mchehab@kernel.org,
        marcel.ziswiler@toradex.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 13/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
Message-ID: <Yrm07wceI4DfGVNG@google.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
 <20220611141421.718743-14-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220611141421.718743-14-victor.liu@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 11 Jun 2022, Liu Ying wrote:

> This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8->v9:
> * No change.
> 
> v7->v8:
> * No change.
> 
> v6->v7:
> * Add Rob's R-b tag.
> 
> v5->v6:
> * Drop 'select' schema. (Rob)
> 
> v4->v5:
> * Newly introduced in v5. (Rob)
> 
>  .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
