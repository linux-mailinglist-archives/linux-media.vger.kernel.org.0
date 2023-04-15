Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19D476E2FD4
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 10:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjDOI4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 04:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjDOI4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 04:56:54 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0054C469C
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 01:56:51 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id si1so21341542ejb.10
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681549010; x=1684141010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXiigblBzd+BU70FqSJL39EK8P2S//kVQiPcDPt1kOM=;
        b=qUyroR2Rx6ySD4cu7xBoTwFmQ0VWRO91hHf2j72MweTnAhTQWNNHY7afg351BhTdhI
         z8rmf2SR7zUyNGnOsI6rFaawC9DSUQnDl+973/VMxqh87Ie+vhiCDsg+d8Oqt8RMFBjo
         tVM5BO0km1K98WvnDm9Tghc/wPfyegNDlYMP4cXPARTllXvFwqukkwG1spAxdpN5OGpp
         PBLIFOqUiEzxu56ticch0MiNxb8CQRM10iZkVm4Y68pmzabbviUrzQwYLd4TAzJtlrlZ
         xkUdlwAjXVYqWNaUcm1rmw8zHo+HyTQ57T9clKA2MMOPFP6YZ8jyH/VkfN3Y7DYc5+Qi
         8Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681549010; x=1684141010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXiigblBzd+BU70FqSJL39EK8P2S//kVQiPcDPt1kOM=;
        b=YibGcBb+XaSklkd4nrLfCNGTmxFkVl0B5xC7hjeMpWFMwEx28cGMIFGea7eyPAQii6
         Tx7FE2kK9OgkeXCO1NQHF9va+iocqsS6sKVjZnUPha0ySvc3ArzQMYI7vpX4IgyWBzjv
         ZIVG1XdK9iJHLFxOTDnarKdGPW7zzG+BBskLuCJoSUZfds8x6wiu+0tPN0NxnX28joYS
         yUFZA8aUupmuYSY8UrVC0BNOguvrSLwjJMI8kspol57BEtu5OgbDqCz1NqihhrMVJq1C
         Fi1yekhKnLoVl6yNgXh33lfCm6t4C1AhwZto1y5oXsX6RVtQjdU85AMazJYzdpTDpcT/
         CDBQ==
X-Gm-Message-State: AAQBX9dgDHI9L4C96rTVwNCan4W8bMRrctQ2ObyeA2zaTvVfOrsFOb/j
        h8b96rd6RyZfnpvhrrVINjxWng==
X-Google-Smtp-Source: AKy350aXdBFMDe3uSpxc+jG1qjnrrpj7m+IRvlYTua3HuZ18VVDteVNpOizL7XlRnP++hK0nXFzJmQ==
X-Received: by 2002:a17:906:755:b0:94f:2eb1:ffd2 with SMTP id z21-20020a170906075500b0094f2eb1ffd2mr257610ejb.40.1681549010444;
        Sat, 15 Apr 2023 01:56:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a3bf:4ed:6c53:2a36? ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id sg44-20020a170907a42c00b0094c784f64fbsm3507553ejc.66.2023.04.15.01.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 01:56:49 -0700 (PDT)
Message-ID: <d08d052e-6be6-92fa-a326-5227aba1c344@linaro.org>
Date:   Sat, 15 Apr 2023 10:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/8] media: dt-bindings: cadence-csi2rx: Convert to DT
 schema
Content-Language: en-US
To:     Jack Zhu <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230413035541.62129-1-jack.zhu@starfivetech.com>
 <20230413035541.62129-2-jack.zhu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413035541.62129-2-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/04/2023 05:55, Jack Zhu wrote:
> Convert DT bindings document for Cadence MIPI-CSI2 RX controller to
> DT schema format.
> 
> For compatible, new compatibles should not be messed with conversion,
> but the original binding did not specify any SoC-specific compatible
> string, so add the StarFive compatible string.
> 
> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
> ---
>  .../devicetree/bindings/media/cdns,csi2rx.txt | 100 ----------
>  .../bindings/media/cdns,csi2rx.yaml           | 177 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

