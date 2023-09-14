Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C4C7A01E6
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 12:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjINKqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 06:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjINKqw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 06:46:52 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640A71BF0
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 03:46:47 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99bcf2de59cso112411366b.0
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694688406; x=1695293206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvowP+I3fsJjkmKB5A3zdLbBXz8ryFqxa5zwwZzCRR0=;
        b=FnQGN9AiYlQyd21DpRMPbMontzGN7LLJMUQfBSwvUxhDzLtRsCMLeJAkxLtJuDA3CN
         madhbfYH0Dg1CuMOHa4Rr3N5ZjDzy52SVWDwwSE+iL2zEDS5D9pBgvY4vxKTQLLPR4+2
         zQLyYmfZUA9zmedsFO1ATwiFOiXj7xNUImnYNq6oVY5Ex6vMmGucjl2Y0TTcqaZbMvoW
         JJHzGmka/TWDvSLC9Kn5ZODJQf8MS2IUG8TX6w/mFIWBDw+AYmoCifbBf01mEIQrAetP
         JW1k5Hs6kRl1lzdFo1DsztJEA9s3CtYwYyMw2Sj7HNohXyNYHJIyxYQNST3RdpfhrJ7F
         u1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694688406; x=1695293206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvowP+I3fsJjkmKB5A3zdLbBXz8ryFqxa5zwwZzCRR0=;
        b=RjPpjBIQ8d0+ZBm+ESjGbiblck4dN4UsGOM8ErT8mbNHbMiR2JrL7rgjXOozpm4gyl
         kPeHIv4iKkjer1oNRiwVJ58Rpvduyab0fpilalpCt8UbjoZzUZjcsGU6uqwkUSWuqt+l
         Eb6xO3VqorRCzl9cTpRkbb7FbpdOXfvc38uR7qNSBKEVz1G5kRZSWq/kgdpsQxCsEuih
         6UY1gIcdvZATT6xqCvnZ5RlF2Vq4GaSwTCkdsfDnyUZSarenJPyKyks6GY1aWgM32W8K
         kbksvlaxTyQ1zTdHem5HaUrqGqkNG3wQo3iuaoOno59L6jKS3Ykuy12Ed3PQQVm2mLPe
         12CA==
X-Gm-Message-State: AOJu0YwIfk0jyxRwDvoLCujbckHbl8cI1GDaOuoI7XJLR0v9GBf+IuJw
        V+b7FtjYPTbJ4PzvyeH/sfuqSg==
X-Google-Smtp-Source: AGHT+IGWgeeN7qjJiNCc/upsnH6oSrviQHkNk88lo2j2IQJbaXYm7ocmjPDKDm/hoWfwU6FWoycQzA==
X-Received: by 2002:a17:906:2099:b0:9a5:7f99:be54 with SMTP id 25-20020a170906209900b009a57f99be54mr4033740ejq.67.1694688405819;
        Thu, 14 Sep 2023 03:46:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id z8-20020a1709060ac800b009ad875d12d7sm808091ejf.210.2023.09.14.03.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 03:46:45 -0700 (PDT)
Message-ID: <8fd64e36-4007-c962-5106-f8b692ce7e20@linaro.org>
Date:   Thu, 14 Sep 2023 12:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] media: dt-bindings: ovti,ov772x: Make powerdown-gpios
 active-high
Content-Language: en-US
To:     Fabio Estevam <festevam@gmail.com>, sakari.ailus@iki.fi
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
References: <20230913193932.1947918-1-festevam@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913193932.1947918-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/09/2023 21:39, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The powerdown-gpios description mentions:
> 
> "Reference to the GPIO connected to the PWDN pin which is active high."

The binding description or device datasheet? If the first, what
guarantees you have that person writing binding understood the
difference between signal level and OS abstraction logical high/low?


>              port {

Best regards,
Krzysztof

