Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F47C669211
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbjAMJAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240573AbjAMI7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 03:59:44 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573C371FD3
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 00:59:36 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qk9so50772579ejc.3
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 00:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YM8Shx2IZukw9YcFp8FhnA2qd5i13IeliX120PH17I=;
        b=UswNafJ8Hcq8szwzEdclRDjcNXXT+kfG7zB9GvtX0hGjvzrZfoStfz9NgA0jc+sJR3
         Rixfzk4u9VFwLwgURno/IXUlVFigpNu39LT9NDc5Xw8YuyEjr0CWwYATZyCodqdH1c81
         LpzCJ5kKDL0FzvtYfXLmrJuwXjxK5Tz2XZbNW9Lrn/B/jTpyk8/A4/avobX/texpV4H0
         unOstmnettk1gSMvYCtzZWZiRcF5otG5OlQau/8UI/hZ82dJiVTh9sTwE37KjRaysgSw
         uquU+BTFsZXsw+9vVCkEjnOKOrgswmnORNmMR+V1qEAi7/K3ojaXMj/PYkoitAjerQsE
         B4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YM8Shx2IZukw9YcFp8FhnA2qd5i13IeliX120PH17I=;
        b=2rqyu/lyUI+vKriJQfCItH5DqMdNdbeVb8OO0gyXSiJunk3nmyu4XjsKchXEJ8OjAp
         //4xImqaDS2N4ErL1hUAehdKpD6R7nV1jejl0gLInVNqtIaSpX6cDGPr3MVge7JBWN35
         SgiQQSSRBicScJBvUDpELAm+JSbXa0dFIIlbNFvzOa1hh1DFswMxIQiRUkfPhMBnN6FT
         xo2c9iKydJk3mtdx2s3EcHiGf+a1PdvfL+vJaZYjqKNNYY295ycAB1ZrfiQ8fFTzTaso
         or1NhuJDzMOvu7wXik1Q1YveWZGWpHmMKuiP7WWh8XeKD0FlXHFliZ092M/dbob3rUSL
         563w==
X-Gm-Message-State: AFqh2kp/nJois5WxYCoYBkUeBGTbtWfG/BsIJjS1wLNA0gV28xa4Mzs0
        Qe0uuAIcEcfnsIlenxw3OOtXzA==
X-Google-Smtp-Source: AMrXdXsPxc2oqEqJfGabmBqgzaWDsQkxV3GmdjQPkiDF+d6dv+FHlRbTN+U0t+9cYBoJoZb4U0H6gg==
X-Received: by 2002:a17:906:1e8a:b0:864:223:40b with SMTP id e10-20020a1709061e8a00b008640223040bmr6721662ejj.33.1673600374808;
        Fri, 13 Jan 2023 00:59:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id en6-20020a056402528600b00499b3d09bd2sm5792349edb.91.2023.01.13.00.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:59:33 -0800 (PST)
Message-ID: <cd803c70-faf0-963e-fca3-0edd13fa8a29@linaro.org>
Date:   Fri, 13 Jan 2023 09:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/9] media: dt-bindings: common CEC properties
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        devicetree@vger.kernel.org, Joe Tessler <jrt@google.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, Jeff Chase <jnchase@google.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-kernel@vger.kernel.org
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/12/2022 11:31, Krzysztof Kozlowski wrote:
> Hi,
>
> Changes since v3
> ================
> 1. cec-gpio: Add missing SPDX.
> 2. nvidia,tegra114-cec: Correct path in maintainers.
>


Mauro (and maybe Hans?), any comments here. Can you apply the patchset?

Best regards,
Krzysztof
