Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE46F574AC3
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 12:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236782AbiGNKgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 06:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237435AbiGNKf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 06:35:58 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2F54BD28
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 03:35:55 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u15so1634638lji.10
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BD7nSSbbN4JrqBe48lQv5sDcBZs47GT4oGSy48/h7os=;
        b=qx9RxSWmA6eSXCYtSuhQ4YuXGC+/VP9uZ02ss2tCqqH0st1fbPVLdGuKQ6nF7eiulE
         hf+nUUIDzEUx4ucNTXcuyPwKO9QPEmi1JQHGw/AD3mh/wepPeSyVejyiVRL39kBoObFP
         VhoXL0LlGs+RBRfNoqHgIDREBUOpeNBIGlL9ZlQG8uq1cfAfNFKNcQMBvPPcWS1K1E8Q
         4JbWKykWZL6IN+s34mtC8Mf3bfe8xmxZvbuB4gJ1859zV7JYyhNTBTEt4HPkmKMQEeeF
         gWLkBOo4FdFZQ71STdaxbzbIw43czVXFiuVI3arUAWpFgFodC6sLelaj2DhAPBCfsqZJ
         3qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BD7nSSbbN4JrqBe48lQv5sDcBZs47GT4oGSy48/h7os=;
        b=bRuYeCaCDKN/EtoShOotDMhe4s6uke+fbg3sjRnKljS2a8k7em+tzPhIRs/jNt/18J
         rY/lwHEaFboq04b3iR7X4T3U27+gXprGeNUjrHvP0A16iOPccx5YL2WfBtk6NauMHKFn
         99m8MDPOTqT9AYTolCMZLOfRNn8w3BDBTrpDBhqKbD9SwrL0SQqQ4nGX/QJb3vPQRcqB
         p25yRaewiOqpZJzbtH/HIyOy++SuZ7y2ac9+6TbWE+hKyoMJmm8Ij9DLROqVzvRoLlOS
         FOplWMycBXdyRBoLRNCh4ByHY5lHOZt+LVHXow+zoJeNa98zO43GqbhYr5MjiBgDy9Q9
         9m8g==
X-Gm-Message-State: AJIora+b4rnrCLjU8faaeU6b1SJ2QEoS9cFuYrDyLdzQ64m/799fw1QV
        7i+PabSFbtihhma+GSnSF4kdog==
X-Google-Smtp-Source: AGRyM1vo9+Nd68Bjm9G1FA3g+UOgraqfJZjjhq+uvN+cB3tIkm4GcHiD6Ag6aZubvfIQN13/5zDUQA==
X-Received: by 2002:a2e:8889:0:b0:25d:53da:7963 with SMTP id k9-20020a2e8889000000b0025d53da7963mr4137477lji.335.1657794954365;
        Thu, 14 Jul 2022 03:35:54 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id g2-20020a056512118200b00489c719b809sm284946lfr.284.2022.07.14.03.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 03:35:53 -0700 (PDT)
Message-ID: <c87132c4-5801-2f1f-8ef9-3997474cf7a5@linaro.org>
Date:   Thu, 14 Jul 2022 12:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Volodymyr Kharuk <vkh@melexis.com>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
References: <cover.1657786765.git.vkh@melexis.com>
 <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
 <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2022 12:06, Laurent Pinchart wrote:
> Hi Volodymyr,
> 
> Thank you for the patch.
> 
> On Thu, Jul 14, 2022 at 11:34:47AM +0300, Volodymyr Kharuk wrote:
>> Add device tree binding of the mlx7502x and update MAINTAINERS
>>
>> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
>> ---
>>  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
>>  MAINTAINERS                                   |   1 +
>>  2 files changed, 147 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>> new file mode 100644
>> index 000000000000..4ac91f7a26b6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>> @@ -0,0 +1,146 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Melexis ToF 7502x MIPI CSI-2 Sensor
>> +
>> +maintainers:
>> +  - Volodymyr Kharuk <vkh@melexis.com>
>> +
>> +description: |-
>> +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
>> +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
>> +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
>> +  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
> 
> I'd move this last line as a description of the compatible property, but
> I'm also not sure this should be mentioned in the DT bindings, as it's a
> driver implementation detail. I'm actually not sure we should support it
> with three different compatible values as proposed, as without this
> documentation users will have a hard time figuring out what compatible
> value to pick.
> 
> One option would be to support the following three compatible values:
> 
> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
> 	compatible = "melexis,mlx7502x";
> 
> The last one only would trigger autodetection. I'm still not sure how to
> document that properly in bindings though.

I missed that part of binding.

Wildcards are not allowed in compatible, so mlx7502x has to go.

Anyway what does this autodetection mean?

Best regards,
Krzysztof
