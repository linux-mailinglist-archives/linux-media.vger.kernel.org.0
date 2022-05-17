Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA2552A385
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 15:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347906AbiEQNfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 09:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347925AbiEQNfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:35:39 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DE14CD65
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:35:31 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id q130so21807980ljb.5
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gLHS/b9qQdVVuN1R0+pvG/oH+ldjA527p+Isz/IUtsc=;
        b=r0L6AMtlOLjXttwltWd+JbJzYHNgR+IDkHHHPjxUdZQzj0grfqgUPyBz5kKri1XMK5
         pEJixh88Gs+7Opa0zseBHRqDrb2js/6iH1GZOFnpRJ1crVAKh4emSJje7kqbePk4rcOp
         Ghmk2pwH5Z/SrgaUcWWyfmijBnf2QmRNq/ErW2I0CpOLCR7PlIQHd/Ud+Ua66KKkODb0
         1ukwRvOIIhCeyElAYXdTyYi/OXYZoZiUf59QyvbLvQkRFDhV3BRD2hbTOYa2JDczixrR
         LQjCkQRW6wEFy73Tn7eosqge128eICghzWcpWgAzPLMAuvwgnWoxpyIIdrx7YsMaIoUS
         aSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gLHS/b9qQdVVuN1R0+pvG/oH+ldjA527p+Isz/IUtsc=;
        b=L8Y66lqT8v9PSgwa5i5YUv6QLnzkNDMeKuseTvola6BfluGUspz6dB0U/1GqCq2yq5
         VferorK2ef1MpU63MOdxIaThTb8M1lVC+tKPfWH7yGwpzOWAuu+OfXpfvXL+ScV+XRab
         OYR9+2tqTVgfzgU37mo1O5A0WKHDGQm6NNR+TqvAJUHh86tJcRSHkOFhCyxdBbSnPRTf
         IT/7WE0G+PgEGE0qAIDqu5VHO90CrAAHvR+em9M5DtjHcNj0V77QSYenNMmKMAdUAhwM
         itiymJr4HtvkkVqfcGoaqePsMfHih6Nq8Vfo9NHZ1U0lOWh5dA3sEieSgc/SSUzgqsqY
         Y6Ew==
X-Gm-Message-State: AOAM530VAtw570sAxJKd8Qdr16UaZKj8Z4CbRlIBV1BCA/oIaA6KVRxP
        hbpJPeMEWU0IT/aMjUr+NuySGg==
X-Google-Smtp-Source: ABdhPJwqY+kntOQKl2ieBGyE6CPyoGfX0pDII8HGb/ETfWZEhzvSJGq9Jm4m6B3zEith92RNYqw8gA==
X-Received: by 2002:a05:651c:1198:b0:253:c443:cdcb with SMTP id w24-20020a05651c119800b00253c443cdcbmr386635ljo.22.1652794530237;
        Tue, 17 May 2022 06:35:30 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 10-20020ac2568a000000b0047255d211c9sm1591084lfr.248.2022.05.17.06.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 06:35:29 -0700 (PDT)
Message-ID: <f5633395-0ff8-2de2-a7e5-b99891ede33e@linaro.org>
Date:   Tue, 17 May 2022 15:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 01/20] MAINTAINERS: Add git repo path for MFC
Content-Language: en-US
To:     Smitha T Murthy <smitha.t@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, stanimir.varbanov@linaro.org,
        dillon.minfei@gmail.com, david.plowman@raspberrypi.com,
        mark.rutland@arm.com, robh+dt@kernel.org, krzk+dt@kernel.org,
        andi@etezian.org, alim.akhtar@samsung.com,
        aswani.reddy@samsung.com, pankaj.dubey@samsung.com
References: <20220517125548.14746-1-smitha.t@samsung.com>
 <CGME20220517125551epcas5p42cca7f0a2db6dc1d16d0e27265c43f56@epcas5p4.samsung.com>
 <20220517125548.14746-2-smitha.t@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517125548.14746-2-smitha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/05/2022 14:55, Smitha T Murthy wrote:
> Add git repo path for MFC.
> 
> Signed-off-by: Smitha T Murthy <smitha.t@samsung.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..e53c7333562b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2703,6 +2703,7 @@ M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git

This is not a MFC repo, but a repo of media drivers. There is no need to
add to every driver repo of the subsystem. It should be in subsystem
instead.


Best regards,
Krzysztof
