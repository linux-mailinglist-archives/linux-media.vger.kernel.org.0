Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B9F619774
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 14:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiKDNSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 09:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbiKDNSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 09:18:22 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135122E9E6
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 06:18:20 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id z30so2966487qkz.13
        for <linux-media@vger.kernel.org>; Fri, 04 Nov 2022 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRLkfQ2MxLnbf7WM/2N90TQ9NfDEs+W7cmheEt5MNrw=;
        b=qo7RpKfmbgd1u62U/zra/GTdG2I4kOCddDi3FstDBow28oS1Prv8mOgjdsdHn6ZFsn
         JCh3qJPpJmbDSbUzmdIZncpHwhZX9Q+PeVpZEwr4i7CMHt9lbUe7gy0E+qPP8uX+a0uL
         NC99zA62O0VUq6Aex6ngtuFCQWGiFKVnnxXUxP19r8stYI2Eghm1vDWrF54ZhkOHZtKi
         tE+dAJBDyUHlay3ckuAAyVG+WLtFt+61gHhZiQvFJ+yaTvZRx2JZwIvSWVI7WbSY6RLP
         X5yNT65tZgplyCoSm+zMmTQDySmhHbi5wMB8uB/zakjVTK0xu5t7tjF026gZqgaKL74K
         0EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRLkfQ2MxLnbf7WM/2N90TQ9NfDEs+W7cmheEt5MNrw=;
        b=Rw3M3IiBfDPU8+TAZDv7UMBABSnNdIzdhFSVJpkPFmydUuw5u8gEkN4EOORh+vKE40
         lh7Y+349PWrINmmqg58fx+dvdY7A8yy2D2Or4WT6RisIfXCQFeHfxbwaPgATr2p1hfa2
         ICmEJnczZWPFLw71JvGqNVQdK5V6YZvZjDVbcP0yMzY/jd71UyYT5TmgtRPi6A6UKHgw
         cAC7sDL/Qk4IPwBVWZR+ZuLayS1YWvsgdhAameTmEsTB+NXj2JJ8UU68TngmgaySCIWY
         FDqg3rby3zB52KWrMlJyD9VbRZLGEltxoQ6QNxOxQwwU1Kvc5uaZEBPoez0WhUDghyNJ
         HUmg==
X-Gm-Message-State: ACrzQf1OBnHbAMoBIgGjhVERbjz4qsHGzHLa0p0Og4Ks2GxJGS6lKcMF
        kOsmDk6vPIGv7N7717i+FVA+TQ==
X-Google-Smtp-Source: AMsMyM6lWtjrIsqIcsAH2leUdFQMFYsX/SaFM7Ayv67KiHQfkH6AXEz0D1HVeFHya7u9q9Fy8EqZyA==
X-Received: by 2002:a37:42d2:0:b0:6ef:241:f7ad with SMTP id p201-20020a3742d2000000b006ef0241f7admr25344650qka.38.1667567899239;
        Fri, 04 Nov 2022 06:18:19 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id y18-20020a05620a25d200b006fa32a26433sm2995614qko.38.2022.11.04.06.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:18:18 -0700 (PDT)
Message-ID: <7f1ef70c-fc5b-f771-1c3a-0dcbdc12b49d@linaro.org>
Date:   Fri, 4 Nov 2022 09:18:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Content-Language: en-US
To:     lee <lee@arducam.com>, linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org
References: <20221104152601.000035fd@arducam.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104152601.000035fd@arducam.com>
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

On 04/11/2022 03:26, lee wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Lee Jackson <lee@arducam.com>
> ---

For the record - seems none of the comments were applied (not just one
or two), so you just ignored all of them.

Best regards,
Krzysztof

