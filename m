Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6CB50E8BA
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 20:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244634AbiDYSxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 14:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244468AbiDYSxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 14:53:37 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0A490CD3
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 11:50:33 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id l18so4785122ejc.7
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I8OGAy692x2HlX0zDRT2WU4OQLJqBZjTeofFJMqhneQ=;
        b=yJtZUQbKaP4+1vaymO4wTdai+PwZjfZGL0Qv/GR27elZWHbpeL6kCjftSG2f0FChs/
         PL5SN243GPEnWSJ3LQTJXQZ146BTqccn2NGQL2nVfINMe4oWwerIYVRjDL6Qg1bnsdFs
         V15im6vwngYNzIohkZBUJ7Cd1jhBPdxlX4MGD+5qqiDnAutR2PAfLdSFIIFBzzT+PE3D
         Nip0LKHDnt2jITH47p6IeSNy7hXKUSimfnbs/tOfVlSqHn6ehA1AOaDUvcVX3eXNOxlj
         w/sYwfMmoWjBqtijJlFIEx2Fa0CnQOMzea986Z/A0BczlPCVCzTWkaO7nTUFLKJIP6NG
         Oijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I8OGAy692x2HlX0zDRT2WU4OQLJqBZjTeofFJMqhneQ=;
        b=IRDZDjNRJRrjiNvvrNwriEHVhK46tsbV7vxhZazEIhapA1crsDvhL8HhlsUyzdvudV
         RC+S55+upm6QcEhpcpLubyykOlJDkU+LMWr7QY65OoPTgM6pwB8ypbmifYk/e9sAUkCB
         j9qMGS0WqM8zSR2y/0D+0sPmorxxyEhwj2UxEvDst34Doa4XxC7V2ihVdODeK+T7JT3l
         jXSpcmQNPUxbU/Xnrbledra1jtTW1XRQTi73kZySbDF916BEARA5ZuJ7fXtrfBWfXW3+
         MshN60sNI99E2c0n9741Q5CQMCSmbsikTSMnYKtr7En6duInrg/8a6A3Mub0RIshbftl
         rtoQ==
X-Gm-Message-State: AOAM530XVL7bThCoAatcT1M+HyIa/rslPA5fmnjagfqYJVMq9WlwNppS
        IeZemFUV9j4vvrgss6BFK/hPfg==
X-Google-Smtp-Source: ABdhPJwRiWolCCzfTOXvZ/aMVmJ7USEy6FBXDNaZxg/9Y1L8Bsf/Q7l9Ym1+l8z14ohrkIth/+dThQ==
X-Received: by 2002:a17:907:72d5:b0:6ef:a49f:133a with SMTP id du21-20020a17090772d500b006efa49f133amr17969076ejc.420.1650912631700;
        Mon, 25 Apr 2022 11:50:31 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p24-20020a056402045800b0041614c8f79asm4937824edw.88.2022.04.25.11.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 11:50:31 -0700 (PDT)
Message-ID: <4ab44d3b-8a10-e24d-7c60-f0073e6e89f5@linaro.org>
Date:   Mon, 25 Apr 2022 20:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/3] media: dt-bindings: media: rockchip-vdec: Add
 RK3328 compatible
Content-Language: en-US
To:     Christopher Obbard <chris.obbard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220425184510.1138446-1-chris.obbard@collabora.com>
 <20220425184510.1138446-2-chris.obbard@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425184510.1138446-2-chris.obbard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/04/2022 20:45, Christopher Obbard wrote:
> Document the RK3328 compatible for rockchip-vdec. The driver shares
> the same base functionality as the RK3399 hardware so make sure that
> the RK3399 compatible is also included in the device tree.
> 
> Signed-off-by: Christopher Obbard <chris.obbard@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
