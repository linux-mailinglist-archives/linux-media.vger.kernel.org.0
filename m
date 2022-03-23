Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884FE4E54A5
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 15:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244920AbiCWO50 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 10:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244928AbiCWO50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 10:57:26 -0400
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C226282D20;
        Wed, 23 Mar 2022 07:55:53 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a8so3349175ejc.8;
        Wed, 23 Mar 2022 07:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=9KEoIDue1njQzY62BKl/eKb122UZCCjqg5iynEtCY4w=;
        b=qCZgeyG7+QytG08GhMY7lwh6qiOGw9OTuXaQctYWOaEFJsKHnqacnEihvZNcHfg5A3
         Yk1z7FLOog4aOPmkaHP3KXQ6vSAwscdhSTJx1/MDsCkjY3rBP+GG7AKwUp1g/CJGXHyW
         jXO/68bn46k8pHAhHqFm0KYtsGSDQwyi5ZwxP1EFZ9JXNGdoXWsfNNi82DEWkCqTPLKp
         19LdEzmQkScgPNuKE93zwfV2Z+Axtn1mU5A/N+Vafgju0Pm2Lx1fj4HfkXIpjJDUvndO
         uh1b6c6klXEwGIZ/loGYZsr2di2XEEMcJkyT+7hzcihbPCW+rgrRg7RP0BEdJztdHVsG
         gy+g==
X-Gm-Message-State: AOAM531z3cb1VwXXVmTz7hBkAQLOI59nwFwQ/o8VaT5qe6/QoSpt0+eq
        LbTcT4m7WvfrCRIOQ3bM8pXekqPCho5FHQ==
X-Google-Smtp-Source: ABdhPJwcVguFXIbV7r7tqr0tblXy85d4l7Z0QZrYyFqAUyoV8ideLEzDsHznej9+ab87NXWqhYNS2g==
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id gt42-20020a1709072daa00b006da924e0955mr362738ejc.1.1648047352221;
        Wed, 23 Mar 2022 07:55:52 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id b19-20020aa7dc13000000b00418eef0a019sm73463edu.34.2022.03.23.07.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 07:55:51 -0700 (PDT)
Message-ID: <eac26181-3e59-f915-e310-4b1679b416cd@kernel.org>
Date:   Wed, 23 Mar 2022 15:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings to
 json-schema
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
 <20220318165119.12191-2-sakari.ailus@linux.intel.com>
 <035a1501-4a40-2f1a-2220-1a35a4419876@kernel.org>
 <Yjs0jjNMeqVl2HPj@paasikivi.fi.intel.com>
In-Reply-To: <Yjs0jjNMeqVl2HPj@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2022 15:54, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> On Sun, Mar 20, 2022 at 12:56:48PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2022 17:51, Sakari Ailus wrote:
>>> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9807-vcm.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Dongwoon Anatech DW9807 voice coil lens driver
>>> +
>>> +maintainers:
>>> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
>>> +
>>> +description: |
>>> +  DW9807 is a 10-bit DAC with current sink capability. It is intended for
>>> +  controlling voice coil lenses.
>>> +
>>> +properties:
>>> +
>>
>> No blank line.
>>
>>> +  compatible:
>>> +    const: "dongwoon,dw9807-vcm"
>>
>> No quotes.
> 
> Hmm. Strings generally need to be quoted, including the compatible
> strings.

No, not in dtschema. Almost none of strings are ever quoted. If you need
reference - you example-schema.yaml.


Best regards,
Krzysztof
