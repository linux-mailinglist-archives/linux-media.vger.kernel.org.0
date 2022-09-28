Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8C45ED720
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 10:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbiI1IIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 04:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbiI1IIk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 04:08:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD7910AB07
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 01:08:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u18so19172888lfo.8
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 01:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jckZECscLpS6KEdTuCnwOnRgnuHZDo7qs0ONTOdf7rU=;
        b=hhF2HF9Kgt4gVSgC4aJztwevRwYIPchFvK7KtB3+6P/BAmrncbafjcdoxchBra5/Hd
         Wv/Xs3/XQCKze6aBmBFeU3QpQlSJqVsPJBJxxDCa4KGkdm1oEqxnhioP8UvNl8VGYZjv
         MkeIJLE85piFAOC7b3OYb6DZNPsQZV9XX2AzHZVUBFOKDKrNf493WtyjXBi/2NtqBxYP
         gix+Sm3O6uZvLa1uPprR5by0QPSui13G0Cwv3yIm/ZCM4+KbjjYYBFMmuZ2qHhQWu97h
         W38KP/ANrFTpCXkMQVarKufsUPTZHAeeY/U1QGBGhsEkJ/CNHxWgSxJBx+G7kAY7ayep
         abKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jckZECscLpS6KEdTuCnwOnRgnuHZDo7qs0ONTOdf7rU=;
        b=SP6fe7e8Ya/kyWBo54WiijCw13rYcxjAipWnNxmk4mRXYj4WUIK6b3pfkfxUIgOBka
         v66B9J5A6dzRtvBviQdesWNxLswzi58kKp6JHK68jCyq5dt4jix8diwloHyTYapiN1lr
         gGAw6Ubfr0dchNFsnXpG24yVlQya2+aRu+bGD/GoUQd2TufS+RBUO8Inrtk/YMIwqmQN
         qlk4iN3JGdWi6zBM3mgXYUCqLTvObfSxSetVpjzX58EAxCkq4+Wtuf06PqiDzT+AMsYL
         agZor3qAMXxr5TCaPL71stsmmh9ofOrUHWJkuf2K6BLRCQrMjxGdjA863YP/QMWLhO1I
         dOuw==
X-Gm-Message-State: ACrzQf2YBP+hLNfYpn0TCbfXSJ9exhkZsH7TMAgeGiBmv6jPNeTaCZ0N
        HgnlX7iBxGz4HWEL+ntq/tpWPA==
X-Google-Smtp-Source: AMsMyM45tkR+27HIpqozeJUs8AOHuGxvnHbYzocIaeyrKOMjRE/fZiutv/uKJ7GLcrEDUJ+eUX4NPg==
X-Received: by 2002:ac2:4e66:0:b0:48c:e34c:69b4 with SMTP id y6-20020ac24e66000000b0048ce34c69b4mr12549156lfs.85.1664352517374;
        Wed, 28 Sep 2022 01:08:37 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a7-20020a056512200700b00492dc29be7bsm402103lfb.227.2022.09.28.01.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:08:36 -0700 (PDT)
Message-ID: <c28ab64a-c7f2-2bb5-29c0-494a1a5594dc@linaro.org>
Date:   Wed, 28 Sep 2022 10:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 1/2] media: dt-bindings: i2c: document OV4689
Content-Language: en-US
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927222152.132951-1-mike.rudenko@gmail.com>
 <20220927222152.132951-2-mike.rudenko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927222152.132951-2-mike.rudenko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/09/2022 00:21, Mikhail Rudenko wrote:
> Add device-tree binding documentation for OV4689 image sensor driver,
> and the relevant MAINTAINERS entries.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

