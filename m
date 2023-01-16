Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7F266BD68
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 13:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjAPMAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 07:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbjAPL7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 06:59:53 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB3B1F90B
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 03:59:26 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id vw16so4394598ejc.12
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 03:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3TbZE6s5T+iMHYdoGXhzWjy9v7YEHa+ewLj/SKxwHQ4=;
        b=fSiDlrmb9wRKi8MDOOibxscvUq5gYtW+itGe6V6dT3adhzRz04tS0jMlBlOraE6dKo
         67c7Y8jbU+2UAbUkHtWNW7pMv1JM6vieXm6BAAQ17HykhbZnlYil2HzVXdl2q+VWPoNE
         juzSeHeFvm1D5UruUeY29UbmvYn3j5oJofSS9gwTGwjYbYBhzrEB4FJhuo5iSH/Sl6eI
         8JFXX0a9TNQgpSg6C1Df0keh0firzgN3FncFYivG3rdZHoEFuHf9GPsvF6ENk/R21I0P
         DThn0WQbAJVaJ9q8cL/FEHji4t67yncx5PJPs/hLEdliQ8bPbh9RXn018tXFA+ryFKnw
         D0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TbZE6s5T+iMHYdoGXhzWjy9v7YEHa+ewLj/SKxwHQ4=;
        b=gAL9O3hnWA9TiMrJIVleaESz42OgJXdudSyc3eZZpb05t6fBS9Aa6pvuhxm2Nw5mtl
         U7eKGRn5PF55o8fKZ1/rY1UQZOX++mRuCX7duLbAxMiwBXrDmg2fq1AUS5aQAsESVXhO
         COBo6eHWSIxE/Ff98jIhwJ1JDB+h08YYUIib0UvmL0YL9c0dAvmhANZwbtezC13xpzMR
         zgKnYIGld9boTFv1QnqACW3XDzbedjg//Q1se4ylyQlNoC/+hLOASygBgCOeMV9b6KXE
         DTec1Ih2WipQBec3DGS8Rtksy8l8LEbLIDviGXGrZpGZvnFEbTIm1zUGqYA7gotvsk2p
         OPTQ==
X-Gm-Message-State: AFqh2kpKGDq5DSu+Eb267z/4HQ1YlfcFI8e9UzIK34b98kGMFYTWEtpL
        JYfrEuRDwIGxIQzndM66YTOdpQ==
X-Google-Smtp-Source: AMrXdXtOGYZiC+nvulbQhp3KktJk4riiE9SfEAy5zB73TBUbhQkIvOcsunA0sCmf+GVZXqpAxzPICQ==
X-Received: by 2002:a17:907:8c0d:b0:7c1:d50:6dd3 with SMTP id ta13-20020a1709078c0d00b007c10d506dd3mr79542070ejc.36.1673870365378;
        Mon, 16 Jan 2023 03:59:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709060cca00b0082ddfb47d06sm11885662ejh.148.2023.01.16.03.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:59:25 -0800 (PST)
Message-ID: <76f3a771-2283-4e6e-d3b8-fdfcf1f4291f@linaro.org>
Date:   Mon, 16 Jan 2023 12:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2.1 02/17] dt-bindings: media: fsl-pxp: convert to yaml
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
References: <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
 <20230116113856.1445078-1-m.tretter@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116113856.1445078-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/01/2023 12:38, Michael Tretter wrote:
> Convert the bindings of the Freescale Pixel Pipeline to YAML.
> 
> The conversion drops the previously listed compatibles for several SoCs.
> It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> on the existing SoCs and would allow to reuse the already defined
> compatibles. The missing compatibles should be brought back when the
> support for the PXP on these SoCs is added.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> 
> - add fsl,imx6sll-pxp and fsl,imx6sx-pxp compatibles
> - restrict number of interrupts per variant
> - cleanup syntax
> 
> v2.1:
> 
> - use enum for compatibles
> - add power-domains property
> - fix syntax for specifying the required number of interrupts
> - fix number of interrupts for fsl,imx6ul-pxp

Attaching some half-baked patch to existing thread is not the way. It
might not be supported by workflows at all (b4, patchwork), it messes
with threads. Don't do it. Send a v3 of entire patchset once you collect
proper feedback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

