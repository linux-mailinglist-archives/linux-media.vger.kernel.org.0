Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15AB9638D61
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbiKYPTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiKYPTU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:19:20 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0016205C6
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:19:19 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id q7so5509992ljp.9
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycHWgZSr32i91azQqyxUznDoRODxzhi2IJ/I8pPfmy8=;
        b=OKhk4rKG+3lAVJ+5lYht1pDJstcCAVIftdQG4+KREUpvP6HwK2Vh0tFuZh5+seLE2A
         Bc3ws6ioxUAhnlK2J1wevymAHzZRyredfNs2T2/apP5OjylwdP+Uc9Lwc88tIn/XZ6So
         j9/gom8iBRsEPPuL9qAFbV9kKrM+tKidZZSseQZlncAa9T8tPSy0h1JCRDSyU5MQ5BFg
         FaDSbLgw3AydVcJjItJ46fvPBzQpCSwdIxJMnjk3QsY7GKg5ZcKLhbNnALaiuX8I9cFG
         YDi08YYZ5oWpKQ+U71vanD7AzILV4ee1Zb/e3kIJh95qspc+qJ0UGWa857QMvrv+Dn/v
         fO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycHWgZSr32i91azQqyxUznDoRODxzhi2IJ/I8pPfmy8=;
        b=ltP6XT1WQyM+IdGeIR68HZjrBWPkm+Hht9fy2oDwf+t8ebtU3rlPxK2NmxWhGe/AKc
         jOLpiUH90uh64VMHWVprSkS1J0hWj3SmRKz6/fawZ2QJQSM4nbeDWVEJz+w8WeY7plN4
         bhMcseBeEqV3dZ5jksO4/3eA0Y9kZ/rTWE/CP6+pE50SFbBa+cs2z/cQJ3GNWoHc8bp0
         1K4vkj2aYKByFr9FG+DV3kHo+3+YxDJdQo/PCHJlHjZb8XMLA0HG//zelxVger8FQesj
         0F/IMjitsTSG5Cc5A+bmZ9V1Vm7AVsq6CMVjFlq9dPydcC0T8DcSek9XWm6sGPk3j1MX
         Umhg==
X-Gm-Message-State: ANoB5pk/X4kz1YygbZJuymis22IDVqLuCYEw49cs9E1al6f++8PbdSvx
        3Dl4AGOND/zbvuSbz9fOJhV2zA==
X-Google-Smtp-Source: AA0mqf7Vx+8hYCcCVDabkesMX6kF1I3Y1VIz85S3nb7w0p0wzBOoolOxon9NHcNnyRD3/2JxU1GEpQ==
X-Received: by 2002:a05:651c:1603:b0:26d:d603:8df2 with SMTP id f3-20020a05651c160300b0026dd6038df2mr11516146ljq.189.1669389557979;
        Fri, 25 Nov 2022 07:19:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n25-20020a05651203f900b0049f54c5f2a4sm555475lfq.229.2022.11.25.07.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 07:19:17 -0800 (PST)
Message-ID: <756daf8d-9d4e-12f7-4d3a-e9da8480ed6a@linaro.org>
Date:   Fri, 25 Nov 2022 16:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 7/8] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor
Content-Language: en-US
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <343c0ab708ab35ec101bcefbe2fda5c15d5e6bfd.1669381013.git.vkh@melexis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <343c0ab708ab35ec101bcefbe2fda5c15d5e6bfd.1669381013.git.vkh@melexis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> Add device tree binding of the mlx7502x and update MAINTAINERS
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> ---
>  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 126 ++++++++++++++++++

I mentioned you have wrong subject prefix. Only one "media" in the
subject prefix is needed, so:
"media: dt-bindings: Add melexis,mlx7502x camera sensor"

>  MAINTAINERS                                   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

