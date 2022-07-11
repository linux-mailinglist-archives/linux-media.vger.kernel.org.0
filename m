Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC0A570101
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 13:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbiGKLp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 07:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiGKLph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 07:45:37 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1011B2F64F
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 04:42:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id bx13so5866122ljb.1
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bT/kQh5OZwPab+LDCsh8EffgjHCEbWLkfBamX8wH3KY=;
        b=mrUGb7bMSieOI48DaAC7n7KB/fwPX7kyWyJMF3yZLHnLzN5DDxypHHt3Ghe/k8WnK5
         9dMa1qKpzydZq3ZxE6eDReEjYa2C929w1XXqxzDKlyWOYNisWgNSiCIeHmPsMBr722NI
         ryDNxtf+9p5BwUiT9tWHY10+91jtBR19tnwl+PSp20arfn8KhRdKB/yIbKBsP085q1u/
         j07TVQhqM4yqSq6v78n8C51j6v/5sB3pWSSREpdsJkKuoCq4v/SFk6+yB2dH8wvluS59
         xF6f6Q/pxBBMVT6AjkMFBR6egcFQD6OEUlTR2FtP02IiEHN384gus0Wi8yoKGSpcHOyi
         s2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bT/kQh5OZwPab+LDCsh8EffgjHCEbWLkfBamX8wH3KY=;
        b=6Ou4ZS5eMaAsZbdVarKhV65mIMWdHNYrLkUCZUa07E0U4m+8U5C6rW45ivDXWu2ji2
         dgCCR2R4cEXmOa+hNVEiir9GUvbtH6AH5Ud2AUX3ifJ2L0iQKhLYM1N4rjJHx0R1YZK6
         XkIhRyiLHV2Ko1Zf8dDZL5IweOYSFv6C+uPLzq3k+SgXZ4ivVKdVNC26yBEGlSJ0CpIX
         B0I9d0zZieXlLl5i12NX5ZC3xNJHD8+DWsK2xrZuYKdQOzvHhkeba99rcgbdOFXwCZ4c
         s7sSjccdIcDkixbxsGAmNSH01Q4XVn4S831GWG65tPW4xR7pNCn6enk4w06eGTm3K2in
         PIgg==
X-Gm-Message-State: AJIora9aoGAWbOhj4ftTKR1cJLBByv6VbEynz1vOo0Y4A0K0dPrhJOoo
        H7OZFbfUeqGSS6b4wfAsvhjS0Q==
X-Google-Smtp-Source: AGRyM1vlSktTc4AO9YZ2PbK39qQQy7LCijYTfUU0w/g5VyciyqlnnHBrl2DVQAvf/xAf66ffLueilA==
X-Received: by 2002:a2e:be8a:0:b0:25d:5eb3:e80c with SMTP id a10-20020a2ebe8a000000b0025d5eb3e80cmr7111902ljr.73.1657539741422;
        Mon, 11 Jul 2022 04:42:21 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id h10-20020a056512220a00b0047fb3ea0659sm1483420lfu.292.2022.07.11.04.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:42:20 -0700 (PDT)
Message-ID: <fd8af260-bbf9-d643-8767-0616c95cbd48@linaro.org>
Date:   Mon, 11 Jul 2022 13:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] media: dt-bindings: ak7375: Convert to DT schema
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220711042838.213351-1-y.oudjana@protonmail.com>
 <20220711042838.213351-2-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711042838.213351-2-y.oudjana@protonmail.com>
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

On 11/07/2022 06:28, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert DT bindings document for AKM AK7375 VCM to DT schema
> format and add an example.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../devicetree/bindings/media/i2c/ak7375.txt  |  8 ----
>  .../devicetree/bindings/media/i2c/ak7375.yaml | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 42 insertions(+), 9 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ak7375.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ak7375.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ak7375.txt b/Documentation/devicetree/bindings/media/i2c/ak7375.txt
> deleted file mode 100644
> index aa3e24b41241..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ak7375.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -Asahi Kasei Microdevices AK7375 voice coil lens driver
> -
> -AK7375 is a camera voice coil lens.
> -
> -Mandatory properties:
> -
> -- compatible: "asahi-kasei,ak7375"
> -- reg: I2C slave address
> diff --git a/Documentation/devicetree/bindings/media/i2c/ak7375.yaml b/Documentation/devicetree/bindings/media/i2c/ak7375.yaml
> new file mode 100644
> index 000000000000..4fc216846ae7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ak7375.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ak7375.yaml#

Include vendor prefix in the file name, so:
asahi-kasei,ak7375.yaml


Best regards,
Krzysztof
